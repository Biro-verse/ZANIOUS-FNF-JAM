local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local GfX = 0
local GfY = 0

local BfOfs = 50
local GfOfs = 50
local DadOfs = 50

local curCameraState = nil
local cameraMoving = nil

local enableSystem = true

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--
part2 = false

function onUpdate()

if enableSystem == true then
    if mustHitSection == false then
            if gfSection == false or gfSection == nil then
                DadX = getMidpointX('dad') + 100 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
                    cameraMoving = true
                elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',DadX+(DadOfs/2),DadY)
                    cameraMoving = true
                elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
                    cameraMoving = true
                elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
                    cameraMoving = true
                else
                    if cameraMoving == true then
                        triggerEvent('Camera Follow Pos',DadX,DadY)
                        cameraMoving = false
                    end
                end
            else
                -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                GfX = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')
                GfY = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',GfX-ofs,GfOfs)
                    cameraMoving = true
                elseif getProperty('gf.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',GfX+ofs,GfOfs)
                    cameraMoving = true
                elseif getProperty('gf.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',GfX,GfY-GfOfs)
                    cameraMoving = true
                elseif getProperty('gf.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',GfX,GfY+GfOfs)
                    cameraMoving = true
                else
                    if cameraMoving == true then
                        triggerEvent('Camera Follow Pos',GfX,GfY)
                        cameraMoving = false
                    end
                end
            end
    else

            BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
            BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')

        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
        else
            if cameraMoving == true then
                triggerEvent('Camera Follow Pos',BfX,BfY)
                cameraMoving = false
            end
        end
    end
end
end