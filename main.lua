beep = love.audio.newSource("beep.wav", "static")

bgCol = {
	r = 0,
	g = 0,
	b = 0
}

player = {
	x = 1,
	y = 1,
	w = 20,
	s = 20,
	xvel = 0,
	yvel = 0,
	mode = "fill",
	col = {
		r = 1,
		g = 1,
		b = 1
	},
	blocks = {}
}

--[[
	buttons for 3ds:
	a
	b
	x
	y
	up
	down
	left
	right
	cpadup
	cpaddown
	cpadleft
	cpadright
	cstickup
	cstickdown
	cstickleft
	cstickright
	lbutton
	rbutton
	lzbutton
	rzbutton
	start
	select


]]


function player:move(xvel, yvel)
	self.xvel = xvel
	self.yvel = yvel
end

function player:update()
	if self.x > love.graphics.getWidth() - self.w then
		self.x = 0
	end
	if self.x < 0 then
		self.x = love.graphics.getWidth()-self.w
	end
	if self.y > love.graphics.getHeight() - self.w then
		self.y = 0
	end

	if self.y < 0 then
		self.y = love.graphics.getHeight() - self.w
	end
	self.x = self.x+self.xvel*self.s
	self.y = self.y+self.yvel*self.s
end

function player:draw()
	love.graphics.rectangle(self.mode, self.x, self.y, self.w, self.w)
end


function love.load()
	--love.graphics.set3D(true)
end

function love.update(dt)
	player:update()


end

function love.draw()
	love.graphics.setBackgroundColor(bgCol.r, bgCol.g, bgCol.b)
	--topscreen only works on 3ds, so look out
	love.graphics.setScreen('top')
	--love.graphics.rectangle("fill", 1, 1, 30, 30)
	player:draw()
	--bottom screen
	--love.graphics.setScreen('bottom')
end

function love.keypressed(key)
	if (key == "start") then
		love.event.quit()
	end
	if (key == "up") then
		player:move(0, -1)
	end
	if (key == "down") then
		player:move(0, 1)

	end
	if (key == "left") then
		player:move(-1, 0)

	end
	if (key == "right") then
		player:move(1, 0)

	end
	if (key == "cstickup") then
		player:move(0, -1)
	end
	if (key == "cstickdown") then
		player:move(0, 1)

	end
	if (key == "cstickleft") then
		player:move(-1, 0)

	end
	if (key == "cstickright") then
		player:move(1, 0)

	end
	if (key == "cpadup") then
		player:move(0, -1)
	end
	if (key == "cpaddown") then
		player:move(0, 1)

	end
	if (key == "cpadleft") then
		player:move(-1, 0)

	end
	if (key == "cpadright") then
		player:move(1, 0)

	end
	if (key == "x") then
		player:move(0, -1)
	end
	if (key == "b") then
		player:move(0, 1)

	end
	if (key == "y") then
		player:move(-1, 0)

	end
	if (key == "a") then
		player:move(1, 0)

	end

end

function love.keyreleased(key)

end