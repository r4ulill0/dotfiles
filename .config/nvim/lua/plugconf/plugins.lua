local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
--Los plugins van aqui
Plug 'sheerun/vim-polyglot'             --Pack de lenguajes
Plug 'folke/tokyonight.nvim'        --Colorines que funcionan bien con Polyglot
Plug 'nvim-lua/plenary.nvim'            --Dependencias de telescope y null-ls
Plug 'nvim-telescope/telescope.nvim'    --[[Fuzzy finder para abrir archivos
                                        -- comodamente
                                         Telescope tiene mas dependencias
                                         recomendadas pero solo he instalado las
                                         indispensables ]]
Plug 'mfussenegger/nvim-jdtls'          -- Language server para java

Plug 'neovim/nvim-lspconfig'            -- Configs for lsp

Plug 'hrsh7th/cmp-nvim-lsp'                --| Autocompletado
Plug 'hrsh7th/cmp-buffer'                  --|
Plug 'hrsh7th/cmp-path'                    --|
Plug 'hrsh7th/cmp-cmdline'                 --|
Plug 'hrsh7th/cmp-nvim-lsp-signature-help' --|
Plug 'hrsh7th/nvim-cmp'                    --|
Plug 'SirVer/ultisnips'                    -- Plugin de snipets super completo
Plug 'quangnguyen30192/cmp-nvim-ultisnips' -- Adaptador del plugin para nvim
Plug 'nvim-treesitter/nvim-treesitter'     -- Analizador sintáctico que pueden usar otros plugins
Plug 'mickael-menu/zk-nvim'                -- Plugin para manejar cómodamente un sistema zettelkasten
Plug 'mfussenegger/nvim-dap'               -- Debugger
                                           --|
Plug 'rcarriga/nvim-dap-ui'                --| Interfaz para el debugger
Plug 'theHamsta/nvim-dap-virtual-text'     --| Texto fantasma con los valores de las líneas mientras se está debuggeando
Plug 'nvim-telescope/telescope-dap.nvim'   --| Integración con telescope 
Plug 'mfussenegger/nvim-dap-python'        -- Debug adapter específico para python
Plug 'williamboman/mason.nvim'             --| Manager de lsp, debuggers, linters and formatters
Plug 'williamboman/mason-lspconfig.nvim'   --|
Plug 'jay-babu/mason-nvim-dap.nvim'        --|
Plug 'jay-babu/mason-null-ls.nvim'         --|
Plug 'jose-elias-alvarez/null-ls.nvim'     -- Formatters & Linters

vim.call('plug#end')

-- Configuraciones de los plugins

