local discordRPC = require("discordRPC")
local appId = require("applicationId")

local button = {
    x = 220,
    y = 240,
    width = 200,
    height = 60,
    text = "Gurt!",
    hovered = false
}

local count = 0
local nextPresenceUpdate = 0

function love.load()

    discordRPC.initialize(appId, true)
    local now = os.time(os.date("*t"))
    presence = {
        state = "Gurting it Up!",
        details = "Gurts Collected: 0",
        largeImageKey = "large",
        largeImageText = "Gurt Clicker",
        smallImageKey = "small",
        smallImageText = "Click to Gurt!",
        startTimestamp = now,
        endTimestamp = now + 60
    }
end

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    button.hovered = mx > button.x and mx < button.x + button.width and
                     my > button.y and my < button.y + button.height
    if nextPresenceUpdate < love.timer.getTime() then
        presence.details = "Gurts Collected: " .. count
        discordRPC.updatePresence(presence)
        nextPresenceUpdate = love.timer.getTime() + 2.0
        print("Updated Discord Presence: " .. presence.details) -- Debugging output
    end
    discordRPC.runCallbacks()
end

function love.draw()
    if button.hovered then
        love.graphics.setColor(0.7, 0.9, 0.7) -- light green
    else
        love.graphics.setColor(0.5, 0.8, 0.5) -- normal green
    end

    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(button.text, button.x, button.y + 20, button.width, "center")

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.print("Gurts: " .. count, 270, 180)
end

function love.mousepressed(x, y, buttonType)
    if buttonType == 1 and button.hovered then
        count = count + 1
        clickSound = love.audio.newSource("sounds/click.ogg", "static")
        clickSound:play()
    end
    if count == 100 or count == 500 or count == 1000 then
        clickSound:stop()
        cheerSound =love.audio.newSource("sounds/cheer.ogg", "static")
        cheerSound:play()
    end
end



function love.quit()
    discordRPC.shutdown()
end