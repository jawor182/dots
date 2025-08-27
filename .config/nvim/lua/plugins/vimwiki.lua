return {
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/dox/notes/",
                },
            }
            vim.g.vimwiki_global_ext = 1
            vim.g.vimwiki_automatic_nested_syntaxes = 1
        end,
    },

}
