local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>ca", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end
  --{ silent = true, buffer = bufnr }
)


vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts) -- got to declaration
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
