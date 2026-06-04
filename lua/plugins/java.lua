return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.jdtls = opts.jdtls or {}
      opts.jdtls.handlers = vim.tbl_extend("force", opts.jdtls.handlers or {}, {
        ["$/progress"] = function() end,
      })
      -- prevent .settings, .project, etc files from being generated in the project folder
      table.insert(opts.cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")
      table.insert(opts.cmd, "-Xmx8G")

      opts.settings = {
        java = {
          format = {
            enabled = true,
            comments = { enabled = false },
            tabSize = 2,
          },
        },
      }
    end,
  },
}
