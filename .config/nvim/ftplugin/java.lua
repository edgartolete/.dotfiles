local config = {
    cmd = { vim.fn.expand('/home/linuxbrew/.linuxbrew/bin/jdtls')}, -- # use this if you install it with homebrew
    -- cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls'}, -- # Use this if mason succeed to install
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
