-- Instalacion automática de vimplug
vim.cmd([[
let data_dir= has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]])

require('plugconf.plugins')
require('general')


-- MAPEOS GENERALES
local mappings = require 'mappings'
mappings.general_mappings()
-- nnoremap <Space> <nop>
-- let mapleader = " "

-- CONFIGURACION DE TREESITTER
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },

}
-- CONFIGURACION DE TELESCOPE
mappings.telescope_mappings()

-- CONFIGURACION DE LSP

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}               -- Obliga al usuario a seleccionar una de las opciones
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  mappings.common_lsp_mappings(bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
end

-- CONFIGURACION DE AUTOCOMPLETADO (CMP)
local cmp = require 'cmp'

cmp.setup({
    snippet = {
    expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
    end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp' },
          { name = 'ultisnips' }, -- For ultisnips users.
        }, {
        { name = 'buffer' },
    }),
    experimental = {
      ghost_text = true
    }
})


-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pylsp', 'rust_analyzer', 'eslint', 'sumneko_lua', 'texlab' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- CONFIGURACION DE ZK-NVIM
require("zk").setup({
    picker = "telescope",
    lsp = {
      config = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    },
  });
