function love.conf(t)
    t.identity = "Gurt Clicker"                    -- The name of the save directory (string)
    t.version = "11.5"                -- The LÖVE version this game was made for (string)
    t.console = false                   -- Attach a console (boolean, Windows only)
    t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

    t.window.title = "Gurt Clicker"         -- The window title (string)
    t.window.icon = "gurt.png"              -- Filepath to an image to use as the window's icon (string)
    t.window.width = 640                -- The window width (number)
    t.window.height = 480               -- The window height (number)

    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.video = true              -- Enable the video module (boolean)
    t.modules.window = true             -- Enable the window module (boolean)
end