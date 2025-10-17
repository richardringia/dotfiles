require("config.options")
require("core.lazy")
require("core.lsp")
require("config.keymaps")

vim.api.nvim_create_autocmd("FileChangedShell", {
  pattern = "*",
  command = "edit",
})

