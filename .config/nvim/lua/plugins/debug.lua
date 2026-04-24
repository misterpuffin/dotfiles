-- Python debugging with nvim-dap
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Lightweight debugger UI (replaces nvim-dap-ui)
      {
        "igorlfs/nvim-dap-view",
        version = "1.*",
        opts = {
          auto_toggle = true,
          winbar = {
            show = true,
            default_section = "scopes",
            show_keymap_hints = true,
            controls = { enabled = true },
          },
        },
      },
      -- Virtual text for the debugger
      "theHamsta/nvim-dap-virtual-text",
      -- Python specific adapter
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      -- Breakpoints
      { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Toggle [B]reakpoint" },
      { "<leader>bB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional [B]reakpoint" },
      { "<leader>bl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "[L]ogpoint" },
      { "<leader>bx", function() require("dap").clear_breakpoints() end, desc = "Clear all breakpoints" },

      -- Execution control
      { "<leader>bc", function() require("dap").continue() end, desc = "[C]ontinue" },
      { "<leader>bs", function() require("dap").step_over() end, desc = "[S]tep over" },
      { "<leader>bi", function() require("dap").step_into() end, desc = "Step [I]nto" },
      { "<leader>bo", function() require("dap").step_out() end, desc = "Step [O]ut" },
      { "<leader>br", function() require("dap").run_to_cursor() end, desc = "[R]un to cursor" },

      -- Session control
      { "<leader>bq", function() require("dap").terminate() end, desc = "[Q]uit/terminate" },
      { "<leader>bR", function() require("dap").restart() end, desc = "[R]estart" },

      -- UI (nvim-dap-view)
      { "<leader>bu", "<cmd>DapViewToggle<cr>", desc = "Toggle [U]I" },
      { "<leader>be", function() require("dap-view").add_expr() end, desc = "Add watch [E]xpression", mode = { "n", "v" } },

      -- REPL
      { "<leader>bt", function() require("dap").repl.toggle() end, desc = "[T]oggle REPL" },
    },
    config = function()
      local dap = require("dap")

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        virt_text_pos = "eol",
      })

      -- Setup Python adapter - use active venv if available, otherwise fallback
      local function get_python_path()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv then
          return venv .. "/bin/python"
        end
        return "python3"
      end
      require("dap-python").setup(get_python_path())

      -- Breakpoint signs
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

      -- Highlight groups for signs
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e5a214" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4d3d" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#5c6370" })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
