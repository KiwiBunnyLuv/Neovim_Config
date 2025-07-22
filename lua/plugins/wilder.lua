return
{
  "gelguy/wilder.nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })

    wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_border_theme({
        highlights = {
          border = 'Normal', -- peut être ajusté
        },
        border = 'rounded',
        highlighter = wilder.basic_highlighter(),
      })
    ))
  end,
}

