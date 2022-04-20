local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
--Los plugins van aqui
Plug 'sheerun/vim-polyglot'             --Pack de lenguajes
Plug 'folke/tokyonight.nvim'        --Colorines que funcionan bien con Polyglot
Plug 'nvim-lua/plenary.nvim'            --Dependencias de telescope
Plug 'nvim-telescope/telescope.nvim'    --[[Fuzzy finder para abrir archivos
                                        -- comodamente
                                         Telescope tiene mas dependencias
                                         recomendadas pero solo he instalado las
                                         indispensables ]]
Plug 'mfussenegger/nvim-jdtls'          -- Language server para java

Plug 'neovim/nvim-lspconfig'            -- Configs for lsp

Plug 'hrsh7th/cmp-nvim-lsp'                -- Autocompletado
Plug 'hrsh7th/cmp-buffer'                  --|
Plug 'hrsh7th/cmp-path'                    --|
Plug 'hrsh7th/cmp-cmdline'                 --|
Plug 'hrsh7th/cmp-nvim-lsp-signature-help' --|
Plug 'hrsh7th/nvim-cmp'                    --|
Plug 'SirVer/ultisnips'                    -- Plugin de snipets super completo
Plug 'quangnguyen30192/cmp-nvim-ultisnips' -- Adaptador del plugin para nvim
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mickael-menu/zk-nvim'                -- Plugin para manejar cómodamente un sistema zettelkasten

vim.call('plug#end')

-- Configuraciones de los plugins

