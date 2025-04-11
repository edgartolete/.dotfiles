return  {
  'nvim-telescope/telescope.nvim', --highly extendable fuzzy finder over lists.
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config  = function ()
    -- require("telescope").load_extension("flutter")
    require("telescope").setup({
      pickers = {
        -- find_files = { theme = "ivy" },
        -- oldfiles = { theme = "ivy" },
        -- buffers = { theme = "ivy" },
        live_grep = { theme = "ivy" },
      }
    })
  end,
  cmd = { 'Telescope', },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
    { '<leader>fj', '<cmd>Telescope jumplist<cr>', desc = 'Find Jumplist' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fo', "<cmd>Telescope oldfiles<CR>", "Find old files"},
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Marks' },
    { '<leader>fr', '<cmd>Telescope resume<cr>', desc = 'Resume' },
    { '<leader>fd', "<cmd>Telescope lsp_definitions<CR>", "Find definitions"},
    { '<leader>fr', "<cmd>Telescope lsp_references<CR>", "Find references"},
    { '<leader>fc', "<cmd>TodoTelescope<CR>", "Find Todo/Fix/Note/Warning/Hack/Perf Comments" },
    { '<leader>fe', "<cmd>Trouble<CR>", "Show list of errors."},
    { '<leader>ft',  "<cmd>Telescope diagnostics<CR>", "Show diagnostics"},
  }
}
