---@mod plant Neovim plugin for quick buffer switching

local c = require("plant.config")

local M = {}

M.state = {}

---Open buffer with specified key
---@param key any
M.open = function(key)
    local existing = M.state[key]
    if existing ~= nil then
        vim.api.nvim_set_current_buf(existing)
    else
        vim.print(c)
        local buf_id = c.config.create(key)
        if buf_id ~= nil and vim.api.nvim_buf_is_loaded(buf_id) then
            vim.api.nvim_set_current_buf(buf_id)
            M.state[key] = buf_id
        else
            vim.print("No default buffer for key `" .. key .. "`")
        end
    end
end

---Clear state
M.clear = function()
    M.state = {}
end

---Setup function
---@param cfg Config
M.setup = function(cfg)
    c.override_config(cfg or {})
end

return M
