vim.g.mapleader = " "

local wk = require("which-key")
local tele = require("telescope.builtin")
local config_dir = "~/.config/nvim"
if vim.loop.os_uname().sysname == "Windows_NT" then
  config_dir = os.getenv("HOME") .. "\\AppData\\Local\\nvim"
end

wk.register({
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  f = {
    name = "Files",
    f = { tele.find_files, "Find File" },
    g = { tele.live_grep, "Grep" },
    s = { tele.grep_string, "Grep String under word" },
    r = { tele.oldfiles, "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" },
    o = { "<cmd>NvimTreeOpen "..config_dir.."<cr>", "Config folder" },
  },
  h = { "<cmd>nohlsearch<CR>", "No Highlight" },
  e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  d = {
    name = "Debug TODO",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  -- " Available Debug Adapters:
  -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
  -- " Adapter configuration and installation instructions:
  -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- " Debug Adapter protocol:
  -- "   https://microsoft.github.io/debug-adapter-protocol/
  -- " Debugging
  g = {
    name = "Git TODO",
    g = { "<cmd>TODO lua require '???.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { tele.git_status, "Open changed file" },
    b = { tele.git_branches, "Checkout branch" },
    c = { tele.git_commits, "Checkout commit" },
    C = {
      tele.git_bcommits,
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { tele.diagnostics, "Diagnostics" },
    f = { vim.lsp.buf.format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { tele.lsp_document_symbols, "Document Symbols" },
    S = {
      tele.lsp_dynamic_workspace_symbols,
      "Workspace Symbols",
    },
    e = { tele.quickfix, "Telescope Quickfix" },
  },
  s = {
    name = "Search",
    b = { tele.git_branches, "Checkout branch" },
    c = { tele.colorscheme, "Colorscheme" },
    f = { tele.find_files, "Find File" },
    h = { tele.help_tags, "Find Help" },
    H = { tele.highlights, "Find highlight groups" },
    M = { tele.man_pages, "Man Pages" },
    r = { tele.oldfiles, "Open Recent File" },
    R = { tele.registers, "Registers" },
    t = { tele.live_grep, "Text" },
    k = { tele.keymaps, "Keymaps" },
    C = { tele.commands, "Commands" },
    p = {
      function() tele.colorscheme({ enable_preview = true }) end,
      "Colorscheme with Preview",
    },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
}, { prefix = "<leader>" })
