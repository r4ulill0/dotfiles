local M = {}

function M.config_debugger()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()
    -- Apertura y cierre automático de dapui al iniciar debug
    dap.listeners.after.event_initialized['dapui_config']= function()
        dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config']= function()
        dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config']= function()
        dapui.close()
    end

    require('nvim-dap-virtual-text').setup()
    require('dap-python').setup('/home/raul/utils/.virtualenvs/debugpy/bin/python')
    require('dap-python').test_runner = 'pytest'
    local mason_dap = require('mason-nvim-dap')
    mason_dap.setup({
        automatic_setup=true,
        handlers={},
    })
    local null_ls = require('mason-null-ls')
    null_ls.setup({
        automatic_setup=true,
        handlers={},
    })
end

return M
