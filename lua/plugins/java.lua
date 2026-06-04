return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.jdtls = opts.jdtls or {}
      opts.jdtls.handlers = vim.tbl_extend("force", opts.jdtls.handlers or {}, {
        ["$/progress"] = function() end,
      })
    end,
  },
}
