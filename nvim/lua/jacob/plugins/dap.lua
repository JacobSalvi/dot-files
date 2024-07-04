local setup, dapui = pcall(require, "dapui")

dapui.setup()

-- python setup
local dap = require("dap")
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
            source_filetype = 'python',
        },
    })
    else
        cb({
        type='executable',
        command= '/home/jacob/.virtualenvs/debugpy/bin/python',
        args = {'-m', 'debugpy.adapter'},
        options = {
            source_filetype = 'python'
        }
    })
    end
    
end

dap.configurations.python = {
    {
    type = 'python';
    request = 'launch';
    name = 'Launch file';

    program = '${file}';
    pythonPath = function()
    local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
        end
    end;
    }
}


dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/usr/bin/codelldb',
        args = {"--port", "${port}"}
    }
}


--dap.configurations.rust = {
--    {
--        name = "Rust debug",
--        type = "codelldb",
--        request = "launch",
--        program = function()
--            vim.fn.jobstart('cargo build')
--            return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/target/debug/', 'file')
--        end,
--        cwd = '${workspaceFolder}',
--        stopOnEntry = true,
--        showDisassembly = "never"
--    }
--}


local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"]=function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"]=function()
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set("n", "<leader>b", require 'dap'.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", require 'dap'.continue)
vim.keymap.set("n", "<leader>di", require 'dap'.step_into)
vim.keymap.set("n", "<leader>do", require 'dap'.step_out)

