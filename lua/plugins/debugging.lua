return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }

        dap.configurations.rust = {
            {
                 name = "Launch",
                 type = "codelldb",
                 request = "launch",
                 program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                 end,
                 cwd = "${workspaceFolder}",
                 stopOnEntry = false,
            },
        }

        dap.configurations.zig = {
            {
                 name = "Launch",
                 type = "codelldb",
                 request = "launch",
                 program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
                 end,
                 cwd = "${workspaceFolder}",
                 stopOnEntry = false,
            },
        }

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<F5>", dap.continue, {})
    end,
}
