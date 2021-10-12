require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg', '--hidden', '--glob=!.git', '--color=never', '--no-heading',
            '--with-filename', '--line-number', '--column', '--smart-case'
        }
    }
}
