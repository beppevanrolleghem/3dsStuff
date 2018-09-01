--[[require "snake"
require "swat"



function love.load()

end



function love.update(dt)
	snakeplayer:update(dt)
	swat:update(dt)
end



function love.draw()
	snakeplayer:draw()
	fly:draw()
end




function love.keypressed(key)
	if (key == "start") then
		love.event.quit()
	end
	if (key == "up") then
		snakeplayer:move(0, -1)
	end
	if (key == "down") then
		snakeplayer:move(0, 1)

	end
	if (key == "left") then
		snakeplayer:move(-1, 0)

	end
	if (key == "right") then
		snakeplayer:move(1, 0)

	end
	if (key == "cstickup") then
		snakeplayer:move(0, -1)
	end
	if (key == "cstickdown") then
		snakeplayer:move(0, 1)

	end
	if (key == "cstickleft") then
		snakeplayer:move(-1, 0)

	end
	if (key == "cstickright") then
		snakeplayer:move(1, 0)

	end
	if (key == "cpadup") then
		snakeplayer:move(0, -1)
	end
	if (key == "cpaddown") then
		snakeplayer:move(0, 1)

	end
	if (key == "cpadleft") then
		snakeplayer:move(-1, 0)

	end
	if (key == "cpadright") then
		snakeplayer:move(1, 0)

	end
	if (key == "x") then
		snakeplayer:move(0, -1)
	end
	if (key == "b") then
		snakeplayer:move(0, 1)

	end
	if (key == "y") then
		snakeplayer:move(-1, 0)

	end
	if (key == "a") then
		snakeplayer:move(1, 0)
	end
	if (key == "select") then
		snakeplayer:hardreset()
		fly:newFly()
	end
	if (key == "lbutton") then
		diff = diff - 10
		if diff < 9 then
			diff = 10
		end
	end
	if (key == "rbutton") then
		diff = diff + 10
	end
	if (key == "l") then
		diff = diff - 10
		if diff < 9 then
			diff = 10
		end
	end
	if (key == "r") then
		diff = diff + 10
	end
	if (key == "lzbutton") then
		diff = diff - 10
		if diff < 9 then
			diff = 10
		end
	end
	if (key == "rzbutton") then
		diff = diff + 10
	end
end

function love.keyreleased(key)

end

function love.mousepressed(a, b)
	local x, y = love.mouse.getPosition()
	fly:kill(x, y)
end
]]



require "gamemanager"


function love.load()
	man:load()
end

function love.update(dt)
	man:update(dt)
end

function love.draw()
	man:draw()
end

function love.keypressed(key)
	man:keypressed(key)
end

function love.keyreleased(key)
	man:keyreleased(key)
end

function love.mousepressed(x, y)
	man:mousepressed(x, y)
end

--this is for debugging on pc
require("potion-compat")