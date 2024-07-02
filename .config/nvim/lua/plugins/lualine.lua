return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()

      -- local function filepath()
      --   return vim.fn.expand('%:p')
      -- end

      -- local function filepath()
      --   local file_path = vim.fn.expand('%:p')
      --   local project_root = vim.fn.getcwd()
      --   return file_path:sub(#project_root + 2)
      -- end
      --
      --
      -- -- # TODO: Currently not working to only use file name for java projects
      -- local current_buffer = vim.api.nvim_get_current_buf()
      -- -- local file_name = vim.api.nvim_buf_get_name(0)
      --
      -- local filename = vim.api.nvim_buf_get_name(current_buffer)
      -- -- local file_extension = file_name:match("^.+(%..+)$")
      --
      --
      -- local buff;
      --
      -- if string.sub(filename, -4) == ".java" then
      --   -- print("The current file is a Java file.")
      --   buff = {
      --     sections =  { lualine_c = { "filetype"}}
      --   }
      -- else
      --   -- print("The current file is not a Java file.")
      --   buff = { sections = { lualine_c = { filepath }}}
      -- end
      --
      -- require('lualine').setup(buff)
      require('lualine').setup()
    end,
}
