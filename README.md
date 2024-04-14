# nvim-clean-paste

A Neovim plugin that provides a clean paste functionality by removing `\r` (carriage return) characters from yanked or clipboard text.

## Features

- Removes `\r` characters from yanked text within Neovim
- Supports cleaning text from the system clipboard (`*` or `+` registers)
- Provides a custom paste command and mapping for convenient usage

## Installation

### Using a Plugin Manager (Recommended)

Install via your favorite plugin manager. For example, using lazy.nvim:

```lua
{ 'minamorl/nvim-clean-paste' }
```

### Usage

The plugin provides a custom function `clean_paste()` that can be used to clean the text in the default register (`"`) or the system clipboard register (`*` or `+`).

For example, you can replace the default paste command with the custom paste command:

```lua
vim.api.nvim_set_keymap('n', 'p', ':lua require("nvim-clean-paste").custom_paste()<CR>', { noremap = true, silent = true })
```

### LICENSE
MIT
