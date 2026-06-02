local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    { "L3MON4D3/LuaSnip", submodules = false },
    {
        "folke/tokyonight.nvim"
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
    { -- TODO refactor this into a separate file. I couldn't figure this out tbh
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require('jaegyuDev.treesitter').config
    },
    --{
    --    "theprimeagen/harpoon"
    --},

    -- LSP
    {
        'neovim/nvim-lspconfig'
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    {
        "j-hui/fidget.nvim"
    },
}, {})
