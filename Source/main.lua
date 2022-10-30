import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx = playdate.graphics
gfx.setColor(gfx.kColorBlack)

local snd = playdate.sound
local synth = snd.synth.new(snd.kWaveSawtooth)
synth:setADSR(0,0.5,0,0)

notes = {"C4", "E4", "G4", "C5"}
current = 1
notesLen = #(notes)

print("notesLen: ", notesLen)

local font = gfx.font.new("Roobert-24-Medium")
gfx.setFont(font)

local drawText = playdate.graphics.drawText
--playdate.graphics.setImageDrawMode("NXOR")

function playdate.cranked(change, acceleratedChange)
    --print("cranked", change, acceleratedChange)
    local note = notes[current]

    if note == nil then
        if change > 0 then
            current = 1
        end

        if change < 0 then
            current = notesLen
        end
    end

    if change > 25 then
        if note ~= nil then
            print("note: ", note)
            gfx.clear(gfx.kColorWhite)
            drawText(note, 50, 50)
            synth:playNote(note)
            current = current + 1
        end
    end

    if change < -25 then
        if note ~= nil then
            print("note: ", note)
            gfx.clear(gfx.kColorWhite)
            drawText(note, 50, 50)
            synth:playNote(note)
            current = current - 1
        end
    end
end

-- main game loop
function playdate.update()
    --gfx.fillRect(0, 0, 400, 240)
    --playdate.drawFPS(0,0)

    -- up button
    if playdate.buttonIsPressed( playdate.kButtonUp ) then
        print("up") 
        gfx.clear(gfx.kColorWhite)
        drawText("C4", 50, 50)
        synth:playNote("C4")
    end

    -- right button
    if playdate.buttonIsPressed( playdate.kButtonRight ) then
        print("right")
        gfx.clear(gfx.kColorWhite)
        drawText("E4", 50, 50)
        synth:playNote("E4")
    end

    -- down button
    if playdate.buttonIsPressed( playdate.kButtonDown ) then
        print("down")
        gfx.clear(gfx.kColorWhite)
        drawText("G4", 50, 50)
        synth:playNote("G4")
    end

    -- left button
    if playdate.buttonIsPressed( playdate.kButtonLeft ) then
        print("left")
        gfx.clear(gfx.kColorWhite)
        drawText("C5", 50, 50)
        synth:playNote("C5")
    end

    -- gfx.sprite.update()
    -- playdate.timer.updateTimers()
end
