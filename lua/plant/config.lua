---@mod plant.config

---@class Config

local M = {}

---Default config
---Overriten by the config provided in setup()
---@type Config
M.default_config = {
}

---User provided config
---Set by override_config()
---@type Config
M.config = {}

---Overrides default config with the user provided one
M.override_config = function(cfg)
    M.config = vim.tbl_deep_extend("force", M.default_config, cfg or {})
end

return M
