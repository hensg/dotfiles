return {
  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",           -- Debugger UI
      "mfussenegger/nvim-dap-python",   -- Python-specific DAP
      "theHamsta/nvim-dap-virtual-text" -- Inline variable display
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Configure DAP UI
      dapui.setup()

      -- Automatically open/close the debugger UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Enable inline virtual text for variables
      require("nvim-dap-virtual-text").setup()

      -- Set up Python debugging
      require("dap-python").setup("/run/current-system/sw/bin/python") -- Path to system Python


      dap.adapters.python = {
        type = "executable",
        command = "/run/current-system/sw/bin/python", -- System Python
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",                         -- Launch the current file
          pythonPath = function()
            return "/run/current-system/sw/bin/python" -- Path to system Python
          end,
        },
        {
          type = "python",
          request = "attach",
          name = "Attach to process",
          connect = {
            host = "127.0.0.1",
            port = 5678, -- Port debugpy is listening on
          },
        },
      }

      dap.adapters.lldb = {
        type = "executable",
        command = "/run/current-system/sw/bin/rust-lldb", -- CodeLLDB adapter
        name = "lldb"
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        },
      }
    end,
  }
}
