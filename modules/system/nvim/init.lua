-- Map leader key (Must happen before plugins are loaded otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("autocommands")
require("lazytest")
