return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require('bufferline').setup(
            {
                options = {
                    mode = 'tabs',
                    numbers = 'none',
                    always_show_bufferline = false,
                },
            }
        )
    end
}
