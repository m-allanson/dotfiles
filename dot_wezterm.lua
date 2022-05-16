local wezterm = require 'wezterm';

return {
  font = wezterm.font("SFMono Nerd Font Mono"),
  color_scheme = "iceberg-dark",
  default_cwd = "Users/mike/d",

--[[

    https://wezfurlong.org/wezterm/config/keys.html?highlight=super#configuring-key-assignments
    on MacOS SUPER = the Command key

    Tab / Pane commands are slightly different than iTerm. Notably you can't use the same shortcut to close panes and then tabs.

    new tab = cmd + t
    close tab = cmd + w
    cycle tabs = ctrl + tab / ctrl + shift + tab
    select tab = cmd + num

    cycle panes = ctrl + shift + up / ctrl + shift + down
    split new pane horiz = ctrl + shift + d
    close pane = ctrl + shift + w
]]
  keys = {
    -- This will create a new split and run your default program inside it
    { key="d", mods="CTRL|SHIFT",
        action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key="w", mods="CTRL|SHIFT",
        action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "DownArrow", mods="CTRL|SHIFT",
        action=wezterm.action{ActivatePaneDirection="Next"}},
    { key = "UpArrow", mods="CTRL|SHIFT",
        action=wezterm.action{ActivatePaneDirection="Prev"}},

    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    { key="LeftArrow", mods="OPT", action={SendKey={key="b", mods="ALT"}}},
    { key="RightArrow", mods="OPT", action={SendKey={key="f", mods="ALT"}}},
  }
}