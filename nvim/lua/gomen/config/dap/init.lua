local dap, dapui, hydra, window = require "dap", require "dapui", require "hydra", require "nvim-window"

-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/gomen/config/dap/configs/*.lua", true)) do
  loadfile(ft_path)()
end

-- map <silent> <leader>w :lua require('nvim-window').pick()<CR>
-- { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
vim.keymap.set("n", "<leader>nv", "<cmd>lua require('nvim-window').pick()<CR>", { desc = "Pick window" })

-- Signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })

-- UI structure
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 50,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 10,
      position = "bottom",
    },
  },
}

-- Events Listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end

local hint = [[
 Nvim DAP
 _d_: Start/Continue  _j_: StepOver _k_: StepOut _l_: StepInto ^
 _bb_: Toogle Breakpoint  _bc_: Conditional Breakpoint ^
 _?_: log point ^
 _c_: Run To Cursor ^
 _h_: Show information of the variable under the cursor ^
 _x_: Stop Debbuging ^
 _r_: Run Last ^
 ^^                                                      _<Esc>_
]]

hydra {
  name = "dap",
  hint = hint,
  mode = "n",
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      border = "rounded",
      position = "bottom",
    },
  },
  body = "<leader>de",
  heads = {
    { "d",  dap.continue },
    { "bb", dap.toggle_breakpoint },
    { "l",  dap.step_into },
    { "j",  dap.step_over },
    { "k",  dap.step_out },
    { "h",  dapui.eval },
    { "c",  dap.run_to_cursor },
    { "r",  dap.run_last },
    {
      "bc",
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          dap.set_breakpoint(condition)
        end)
      end,
    },
    {
      "?",
      function()
        vim.ui.input({ prompt = "Log: " }, function(log)
          dap.set_breakpoint(nil, nil, log)
        end)
      end,
    },
    {
      "x",
      function()
        dap.terminate()
        dapui.close {}
        dap.clear_breakpoints()
      end,
    },

    { "<Esc>", nil, { exit = true } },
  },
}

window.setup({
  config = function()

  end
})
