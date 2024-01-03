---@mod plant Neovim plugin for quick buffer switching

local c = require("plant.config")
local u = require("plant.util")

local M = {}

local function set_last_buf()
    local curr = vim.api.nvim_get_current_buf()
    if not u.contains(M.state.map, curr) then
        M.state.last_buf = curr
        return true
    end
    return false
end

M.state = {
    last_buf = nil,
    map = {}
}

---Open buffer with specified key
---@param key any
M.open = function(key)
    if c.config.toggle and M.state.last_buf ~= nil and vim.api.nvim_get_current_buf() == M.state.map[key] then
        vim.api.nvim_set_current_buf(M.state.last_buf)
        M.state.last_buf = nil
        return
    end
    local existing = M.state.map[key]
    if existing == nil then
        set_last_buf()
        local buf_id = c.config.create(key)
        if buf_id ~= nil and vim.api.nvim_buf_is_loaded(buf_id) then
            M.state.map[key] = buf_id
        else
            vim.print("No default buffer for key `" .. key .. "`")
            return
        end
    else
        set_last_buf()
        vim.api.nvim_set_current_buf(existing)
    end
end

---Clear state
M.clear = function()
    M.state = {
        last_buf = nil,
        map = {}
    }
end

---Setup function
---@param cfg Config
M.setup = function(cfg)
    c.override_config(cfg or {})
end

return M
