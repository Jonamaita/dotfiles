return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  },
  config = function ()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
                == nil
    end

    local select_next = cmp.mapping(function(fallback)
        if cmp.visible() then
            if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
            else
                cmp.select_next_item()
            end
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' })

    local select_previous = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
          fallback()
        end
    end, { 'i', 's' })

    local accept_regardless = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.confirm({ select = true })
        else
            fallback()
        end
    end, { 'i', 's' })

    local accept_if_selected = cmp.mapping(function(fallback)
        if not cmp.get_selected_entry() then
            fallback()
        else
            cmp.confirm()
        end
    end, { 'i', 's' })

    cmp.setup({
        -- don't preselect anything for me
        preselect = cmp.PreselectMode.None,
        completeopt = 'menuone,noselect,noinsert',
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
    },
    mapping = {
        ['<Tab>'] = select_next,
        ['<S-Tab>'] = select_previous,

        -- ['<down>'] = select_next,
        -- ['<up>'] = select_previous,

        ['<C-y>'] = accept_regardless,
        ['<CR>'] = accept_if_selected,
        ["<C-e>"] = cmp.mapping.abort(),
    },
    sources = cmp.config.sources({
         { name = 'nvim_lsp' },
         { name = 'luasnip'},
         { name = 'path' },
          --{ name = 'buffer'},
    }),
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
        }),
      },
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
