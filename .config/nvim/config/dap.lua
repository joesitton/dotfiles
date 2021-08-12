require("dapui").setup({})

local dap_install = require("dap-install")

dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    verbosely_call_debuggers = false,
})

local dbg_list = require("dap-install.debuggers_list").debuggers

for debugger, _ in pairs(dbg_list) do
	dap_install.config(debugger, {})
end

vim.g.dap_virtual_text = true
