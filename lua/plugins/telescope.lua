require('telescope').setup {
    pickers = {
        find_files = {
            find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"},
            previewer = false
        }
    },
    defaults = {
        vimgrep_arguments = {
            'rg', '--hidden', '--glob=!.git', '--color=never', '--no-heading',
            '--with-filename', '--line-number', '--column', '--smart-case'
        }
    }
}
