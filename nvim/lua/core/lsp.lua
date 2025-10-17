vim.lsp.enable({
  "lua_ls",
  "biome",
})

-- Set up global LSP keymaps for quickfix and code actions
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Navigation
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- Code actions and quickfix
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format Code" })

  -- Diagnostic navigation and quickfix
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Quickfix List" })

  -- Quickfix actions
  vim.keymap.set("n", "<leader>qf", function()
    vim.diagnostic.setqflist({ open = true })
  end, { desc = "Open Quickfix" })

  vim.keymap.set("n", "<leader>cf", function()
    vim.diagnostic.setqflist({ open = false })
  end, { desc = "Close Quickfix" })
end

-- Set global on_attach for all LSP servers
vim.lsp.on_attach = on_attach

-- Configure LSP servers using configurations from lsp/ folder
vim.lsp.config.lua_ls = require("lsp.lua_ls")
vim.lsp.config.biome = require("lsp.biome")

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
