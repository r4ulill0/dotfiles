vim.opt.helplang="es,en"	--Cuando se abra la ayuda, primero intentar abrirla en castellano y luego en inglés
vim.opt.relativenumber=true 	--Activa los números que muestran la posicion relativa
vim.opt.number=true		--Pone el número de línea en la línea del cursor
vim.opt.hidden=true 		--Te permite dejar buffers en segundo plano con ediciones sin guardar
vim.opt.encoding='utf-8'
vim.opt.tabstop=4		--
vim.opt.softtabstop=4 	-- |-La tabulacion es 4 espacios (tanto automática como al apretar TAB)
vim.opt.shiftwidth=4	--
vim.opt.smartindent=true		--Auto indentado
vim.opt.expandtab=true		--Convierte las tabulaciones en espacios
vim.opt.exrc=true		--Coge la configuración local del directorio (init.vim) en vez de cualquier otra
vim.opt.hlsearch=false		--Desactiva el iluminado de búsqueda después de buscar (mientras escribes la búsqueda sí que funciona)
vim.opt.wrap=false		--Desactiva el truncado de línea cuando se supera el ancho de ventana
vim.opt.ignorecase=true		--¬
vim.opt.smartcase=true		--|- Hace búsquedas sensibles a mayúsculas solo si usas mayúsculas en la búsqueda
vim.opt.swapfile=false		--Desactiva los archivos de swap (son ultra molestos)
vim.opt.backup=false		--Desactiva los backups parcialmente (:help backup para más info)
vim.opt.scrolloff=8		--Empieza a hacer scroll X líneas antes de llegar a los límites de la ventana
vim.opt.signcolumn='yes'	--Añade una columna adicional para símbolos (las marcas de error del linter por ejemplo)
vim.opt.colorcolumn='80'	--Marca la columna 80. Útil para saber cuando estás identando mucho y toca refactor
vim.opt.updatetime=50	--Tiempo de refresco del archivo de backup en milisegundos
--vim.opt.shortmess='true'		--Esto deshabilita ciertos mensajes de error de principiante
vim.cmd([[syntax on]])

-- Instalacion automática de vimplug
vim.cmd([[
let data_dir= has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]])


local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
--Los plugins van aqui
Plug 'sheerun/vim-polyglot'             --Pack de lenguajes
Plug 'ghifarit53/tokyonight-vim'        --Colorines que funcionan bien con Polyglot
Plug 'nvim-lua/plenary.nvim'            --Dependencias de telescope
Plug 'nvim-telescope/telescope.nvim'    --[[Fuzzy finder para abrir archivos 
                                        -- comodamente
                                         Telescope tiene mas dependencias
                                         recomendadas pero solo he instalado las
                                         indispensables ]]
Plug 'mfussenegger/nvim-jdtls'          -- Language server para java

Plug 'neovim/nvim-lspconfig'            -- Configs for lsp

Plug 'hrsh7th/cmp-nvim-lsp'             -- Autocompletado
Plug 'hrsh7th/cmp-buffer'               --|
Plug 'hrsh7th/cmp-path'                 --|
Plug 'hrsh7th/cmp-cmdline'              --|
Plug 'hrsh7th/nvim-cmp'                 --|
Plug 'SirVer/ultisnips'                 -- Plugin de snipets super completo
Plug 'quangnguyen30192/cmp-nvim-ultisnips' -- Adaptador del plugin para nvim

vim.call('plug#end')

-- MAPEOS GENERALES
vim.api.nvim_set_keymap('n', '<Space>', '', {noremap = true})
vim.g.mapleader=" "
-- nnoremap <Space> <nop>
-- let mapleader = " "

-- CONFIGURACION DE TELESCOPE
-- Using Lua functions
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})

-- CONFIGURACION DE LSP

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}               -- Obliga al usuario a seleccionar una de las opciones

-- CONFIGURACION DE AUTOCOMPLETADO (CMP)
local cmp = require'cmp'

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
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
        }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
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
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['java'].setup {
capabilities = capabilities
}

-- CONFIGURACION DE COLORINES
vim.opt.termguicolors=true

vim.g.tokyonight_style = "night" -- available: night, storm
vim.g.tokyonight_enable_italic = "1"

colorscheme=tokyonight

vim.cmd([[
    highlight Normal ctermbg=NONE guibg=NONE            "--_ 
    highlight! EndOfBuffer ctermbg=NONE guibg=NONE      "--_|- Le quita el fondo para que salga el fondo del terminal
]])
vim.opt.guifont="tty-hack"
