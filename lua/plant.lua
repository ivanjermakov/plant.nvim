---@mod plant Neovim plugin for quick buffer switching 

local c = require("plant.config")

local M = {}

---Hide diagnostic summary
M.open = function(index)
    vim.print(index)
end

---Setup function
M.setup = function(cfg)
    c.override_config(cfg or {})
end

return M
