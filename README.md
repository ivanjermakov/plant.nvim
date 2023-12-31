# plant.nvim

Neovim plugin for quick buffer switching.

## Installation

```lua
-- Packer.nvim:
use "ivanjermakov/plant.nvim"

-- Lazy.nvim:
{
    "ivanjermakov/plant.nvim",
    config = function()
        require("plant").setup()
    end
}
```

## Configuration

```lua
require("plant").setup({
})
```

## Credits

* Inspired by [trld.nvim](https://github.com/Mofiqul/trld.nvim)
* Doc generator [lemmy-help](https://github.com/numToStr/lemmy-help)