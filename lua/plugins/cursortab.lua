return {
  "leonardcser/cursortab.nvim",
  enabled = false,
  build = "cd server && go build",
  config = function()
    require("cursortab").setup({
      provider = {
        type = "sweep",
        url = "http://localhost:7878",
        max_tokens = 768,
      }
    })
  end,
}
