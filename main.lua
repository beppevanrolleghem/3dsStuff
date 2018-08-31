require "snake"
require "swat"

function love.load()
	--love.graphics.set3D(true)
	snakeplayer:hardreset()
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



require("potion-compat")