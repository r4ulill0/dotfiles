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
require('nvim-treesitter.install').compilers = {
    "gcc",
    '/usr/bin/clang++'
}
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

-- Activamos los mapeos especificos de LSP *unicamente* cuando el LSP se engancha a un bufer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    mappings.common_lsp_mappings(event.buf)
  end
})

-- CONFIGURACION DE AUTOCOMPLETADO (CMP)
local cmp = require 'cmp'
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
    expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
    end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

-- Mason (lsp, dap, linters and formatters)
require('mason').setup()
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason_lspconfig = require('mason-lspconfig')
local servers = {
	pylsp = {},
	rust_analyzer = {},
	clangd = {},
	eslint = {},
	texlab = {},
    jdtls = {},
    lua_ls = {
        Lua = {
            workspace = {checkThirdParty = false },
            telemetry = {enable=false},
        },
    },
}
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
}
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

-- No funcionan los debuggers, deshabilito para evitar errores molestos al editar archivos de texto plano
--require('debuggers').config_debugger()
--mappings.debug_mappings()

-- CONFIGURACION DE ZK-NVIM
require("zk").setup({
    picker = "telescope",
    lsp = {
      config = {
        capabilities = capabilities,
      },
    },
  });
