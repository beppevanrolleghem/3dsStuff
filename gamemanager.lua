require "ui"



require "snake"
require "swat"


--[[
	this library is the library that is combining the minigames into one usable thing,
	it will also house the ui elements and general game management (duh).

]]


man = {
	paused = true,
	debug = true,
	tgame = "snake", --game thats happening on top screen
	bgame = "swat", --game thats happening on bottom screen
	lastkey = ""
}



function man:load()
	--love.graphics.set3D(true)
	if not man.debug then
		snakeplayer:hardreset()
		swat:load()
		ui:load()
	end
end

function man:update(dt)
	if not man.debug then
		if not man.paused then
			if man.tgame == "snake" then
				snakeplayer:update(dt)
			end
			if man.bgame == "swat" then
				swat:update(dt)
			end
		else
			ui:update(dt)
		end
	end
end

function man:draw()
	if not man.debug then
		if not man.paused then
			if man.tgame == "snake" then
				snakeplayer:draw()
			end
			if man.bgame == "swat" then
				fly:draw()
			end
		else
			ui:draw()
		end
	else
		love.graphics.print("the last button pressed was: "..man.lastkey)
	end
end

function man:keypressed(key)
	if not man.debug then 
		if key == "start" then
			man.paused = not man.paused
			return
		end
		if not man.paused then
			if man.tgame == "snake" then
				snakeplayer:keypressed(key)
			end
		else
			ui:keypressed(key)
		end
	else
		man.lastkey = key
	end
end

function man:keyreleased(key)
	if not man.debug then
		if not man.paused then

		else
			ui:keyreleased(key)
		end
	end
end

function man:mousepressed(sx, sy)
	local x, y = love.mouse.getPosition()
	if not man.debug then
		if not man.paused then
			if man.bgame == "swat" then
				swat:mousepressed(x, y)
			end
		else
			ui:mousepressed(x, y)
		end
	end
end

