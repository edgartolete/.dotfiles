vim.keymap.set('n', '<esc><esc>',"<cmd>nohlsearch<CR>",{ noremap = true })
vim.keymap.set('n', '<C-k>', "<Up>", {noremap = true})

--HARPOON KEYMAPS
local harpoon = require("harpoon")
harpoon:setup() -- REQUIRED
local wk = require("which-key")
local bm = require('bookmarks') -- WARNING: Buggy on Debian 12 + Nvim 0.10.0 
local dap = require("dap")
local dapui = require("dapui")
wk.register({
  b = {
    name = "Bookmarks",
    b = { function () bm.bookmark_toggle() end, "Add Bookmark"},
    f = { "<cmd>Telescope bookmarks list<CR>", "Find Bookmarks"},
    l = { function () bm.bookmark_list() end, "Bookmarks List"},
    c = { function () bm.bookmark_clean() end, "Clear Buffer Bookmark"},
    C = { function () bm.bookmark_clear_all()  end, "Clear All Bookmark"},
  },
  t = {
    name = "Tree Views",
    e = {"<cmd>Neotree toggle<CR>", "Neotree (Explorer)"},
    s = { "<cmd>AerialToggle!<cr>", "Code Structure outline"},
    u = { "<cmd>lua require('undotree').toggle()<cr>", "Undo tree" },
  },
  d = {
    name = "DAP",
    b = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint"},
    c = { function() dapui.eval(nil, { enter = true }) end, "Dap UI eval"},
    q = { function() dap.continue() end, "Continue"},
  },
  f = {
    name = "Find using Telescope",
    f = {  "<cmd>Telescope find_files<CR>", "Find Files"},
    g = {  "<cmd>Telescope live_grep<CR>", "Find using grep"},
    j = {  "<cmd>Telescope jumplist<CR>", "Jumplist"},
    b = {  "<cmd>Telescope buffers<CR>", "Find from buffer"},
    o = {  "<cmd>Telescope oldfiles<CR>", "Find old files"},
    h = {  "<cmd>Telescope help_tags<CR>", "Help Tags"},
    d = {  "<cmd>Telescope lsp_definitions<CR>", "Find definitions"},
    r = {  "<cmd>Telescope lsp_references<CR>", "Find references"},
    i = {  "<cmd>Telescope lsp_implementations<CR>", "Find implementations"},
    c = { "<cmd>TodoTelescope<CR>", "Find Todo/Fix/Note/Warning/Hack/Perf Comments" },
    -- w = { "<cmd>TroubleToggle<CR>", "Show list of warnings."},
    -- e = { "<cmd>TroubleToggle quickfix<CR>", "Show list of errors."},
    e = { "<cmd>Trouble<CR>", "Show list of errors."},
    t = { "<cmd>Telescope diagnostics<CR>", "Show diagnostics"},
  },
  n = {
    name = "Nuxt",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Nuxt Definition"},
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Nuxt References"},
    k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Nuxt Definition"},
  },
  F = {
    name = "Format",
    p = { "<cmd>Prettier<CR>", "Format using Prettier"},
    c = { "<cmd>TSJToggle<cr>", "Toggle code block" },
    j = {"<cmd>TSJToggle<cr>", "Joining code block"},
    s = {"<cmd>TSJToggle<cr>", "Split code block"},
    t = {"<cmd>TailwindSort<cr>", "Sort tailwind classes"},
    f = {"<cmd>TailwindFoldToggle<cr>", "Fold tailwind classes"},
  },
  h = {
    name = "Harpoon (Jumplist)",
    h = { function() harpoon:list():add() end, "Add to Jumplist"},
    l = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "View list"},
    n = { function() harpoon:list():next() end, "Jump to next"},
    p = { function() harpoon:list():prev() end, "Jump to previous"},
  },
  a = {
    name = "Aerial (Code Structure)",
    n = { "<cmd>AerialNext<cr>", "Next"},
    p = { "<cmd>AerialPrev<cr>", "Previous"},
  },
  g = {
    name = "Git",
    l = { "<cmd>LazyGit<cr>", "Open LazyGit"},
    n = { "<cmd>Neogit<cr>", "Open Neogit"},
    f = { "<cmd>Git<cr>", "Open fugitive"},
    b = { function() require('gitsigns').blame_line{full=true} end, "Git blame"}
  },
  s = {
    name = "Search/Replace",
    s =  { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Search"},
    w =  { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search Word", mode = "n"},
    W =  { '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search Word", mode = "v"},
    f =  { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file"},
  },
  p = {
    name = "Peek",
    d = {"<cmd>Lspsaga peek_definition<CR>", "Peek Definition"},
    t = {"<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Definition"}
  },
  k = {
    name = "Kiwi (Note)",
    o = { '<cmd>lua require("kiwi").open_wiki_index()<CR>', "Open Wiki Index"},
    p = { '<cmd>lua require("kiwi").open_wiki_index("personal")<CR>', "Open Wiki Personal"},
    w = { '<cmd>lua require("kiwi").open_wiki_index("work")<CR>', "Open Wiki Work"},
    t = { '<cmd>lua require("kiwi").todo.toggle()<CR>', "Toggle Kiwi"},
  },
  S = { name = ""},
}, { prefix = "<leader>"})
