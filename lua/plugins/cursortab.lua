return {
  "leonardcser/cursortab.nvim",
  build = "cd server && go build",
  config = function()
    local uv = vim.loop
    local refcount_path = "/tmp/cursortab-llama.refcount"
    local pid_path = "/tmp/cursortab-llama.pid"
    local log_path = "/tmp/cursortab-llama.log"

    local function read_number(path)
      local file = io.open(path, "r")
      if not file then
        return 0
      end
      local value = tonumber(file:read("*a")) or 0
      file:close()
      return value
    end

    local function write_number(path, value)
      local file = io.open(path, "w")
      if not file then
        return
      end
      file:write(tostring(value))
      file:close()
    end

    local function read_pid(path)
      local file = io.open(path, "r")
      if not file then
        return nil
      end
      local value = tonumber(file:read("*a"))
      file:close()
      return value
    end

    local function pid_alive(pid)
      if not pid or pid <= 0 then
        return false
      end
      local ok, err = pcall(uv.kill, pid, 0)
      return ok and err == 0
    end

    local count = read_number(refcount_path)
    write_number(refcount_path, count + 1)

    local pid = read_pid(pid_path)
    if not pid_alive(pid) then
      os.remove(pid_path)
      local job_id = vim.fn.jobstart({
        "llama-server",
        "-hf",
        "sweepai/sweep-next-edit-1.5b",
        "--port",
        "7878",
        "--log-file",
        log_path,
      }, {
        detach = true,
      })
      if job_id > 0 then
        local job_pid = vim.fn.jobpid(job_id)
        if job_pid and job_pid > 0 then
          write_number(pid_path, job_pid)
        else
          vim.notify("cursortab: failed to read llama-server pid", vim.log.levels.WARN)
        end
      else
        vim.notify("cursortab: failed to start llama-server (jobstart error)", vim.log.levels.WARN)
      end
    end

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        local current = read_number(refcount_path)
        if current <= 1 then
          os.remove(refcount_path)
          local running_pid = read_pid(pid_path)
          if pid_alive(running_pid) then
            pcall(uv.kill, running_pid, "sigterm")
          end
          os.remove(pid_path)
        else
          write_number(refcount_path, current - 1)
        end
      end,
    })

    require("cursortab").setup({
      provider = {
        type = "sweep",
        url = "http://localhost:7878",
        model = "sweep-next-edit-1.5b",
        max_tokens = 1024,
      }
    })
  end,
}
