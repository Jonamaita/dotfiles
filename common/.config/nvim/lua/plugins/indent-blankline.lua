return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local highlight = {
            "IndentBlanklineContextChar",
        }
        require("ibl").setup({
--          indent = { highlight = highlight},
            scope = {
                enabled = false,
            }
        })
    end
}

