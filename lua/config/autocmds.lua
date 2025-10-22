-- Setup Alacritty colorscheme from Neovim

local function set_alacritty_colorscheme(name)
  -- Setup Alacritty colorscheme from Neovim

  local function set_alacritty_colorscheme(name)
    -- The name of the Alacritty colorscheme placed in the theme directory
    -- MUST be the same as the name of the colorscheme in Neovim
    local config_dir = vim.fn.expand '$XDG_CONFIG_HOME/alacritty'
    local config = config_dir .. '/alacritty.toml'
    local source = config_dir .. '/themes/' .. name .. '.toml'
    local dest = config_dir .. '/colorscheme.toml'
    local cmd = 'ln -sf ' .. source .. ' ' .. dest .. ' && touch ' .. config

    vim.fn.jobstart(cmd, {
      on_exit = function(_, code, _)
        if code ~= 0 then
          vim.notify('Failed to set Alacritty color scheme', vim.log.levels.ERROR)
        end
      end,
    })
  end

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('config_alacritty_colorscheme', { clear = true }),
    callback = function(args)
      set_alacritty_colorscheme(args.match)
    end,
  }) -- The name of the Alacritty colorscheme placed in the theme directory
  -- MUST be the same as the name of the colorscheme in Neovim
  local config_dir = vim.fn.expand '$XDG_CONFIG_HOME/alacritty'
  local config = config_dir .. '/alacritty.toml'
  local source = config_dir .. '/themes/' .. name .. '.toml'
  local dest = config_dir .. '/colorscheme.toml'
  local cmd = 'ln -sf ' .. source .. ' ' .. dest .. ' && touch ' .. config

  vim.fn.jobstart(cmd, {
    on_exit = function(_, code, _)
      if code ~= 0 then
        vim.notify('Failed to set Alacritty color scheme', vim.log.levels.ERROR)
      end
    end,
  })
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('config_alacritty_colorscheme', { clear = true }),
  callback = function(args)
    set_alacritty_colorscheme(args.match)
  end,
})
