---@mod plant.config

---@class Config
---@field create function Create buffer by key
local M = {}

---Default config
---Overriten by the config provided in setup()
---@type Config
M.default_config = {
    create = function(key)
        vim.cmd(":terminal")
        return vim.api.nvim_get_current_buf()
    end
}

---User provided config
---Set by override_config()
---@type Config
M.config = {}

---Overrides default config with the user provided one
---@param cfg Config
M.override_config = function(cfg)
    M.config = vim.tbl_deep_extend("force", M.default_config, cfg or {})
end

return M
