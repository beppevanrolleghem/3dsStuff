beep = love.audio.newSource("beep.wav", "static")
death = love.audio.newSource("death.wav", "static")
--dif determines fps, this can make the game faster and therefore harder
diff = 10
frames = 0
fps = 1/diff
hgrid = 20
vgrid = 14
bgCol = {
	r = 0,
	g = 0,
	b = 0
}

player = {
	x = 1,
	y = 1,
	w = love.graphics.getWidth()/hgrid,
	xvel = 0,
	yvel = 0,
	mode = "fill",
	col = {
		r = 1,
		g = 1,
		b = 1
	},
	blocks = {
		
	 },
	tar = {
		x = 8,
		y = 3,
	}
}


function player:reset()
	self.xvel = 0
	self.yvel = 0
end

function player:hardreset()
	self.xvel = 0
	self.yvel = 0
	self.x = 10
	self.y = 10
	self.blocks = {}
end

function player:move(xvel, yvel)
	if self.xvel == -xvel and self.yvel == -yvel then

	else
		self.xvel = xvel
		self.yvel = yvel
	end
end

function player:update()
	if self.x > hgrid +4 then
		self.x = 0
	end
	if self.x < 0 then
		self.x = hgrid+4
	end
	if self.y > vgrid then
		self.y = 0
	end
	if self.y < 0 then
		self.y = vgrid
	end
	if self.tar.x == self.x and self.tar.y == self.y then
		table.insert(self.blocks, {x = self.x, y = self.y})
		self.tar.x = math.floor(math.random() * (hgrid+4))
		self.tar.y = math.floor(math.random() * vgrid)
		beep:play()
	end
	for i = table.getn(self.blocks), 1, -1 do
		if i == 1 then
			self.blocks[i].x = self.x
			self.blocks[i].y = self.y
		else
			self.blocks[i].x = self.blocks[i-1].x
			self.blocks[i].y = self.blocks[i-1].y
		end
	end
	self.x = self.x+self.xvel
	self.y = self.y+self.yvel
	for i in ipairs(self.blocks) do
		if self.x == self.blocks[i].x and self.y == self.blocks[i].y then
			death:play()
			player:hardreset()
			return
			--love.event.quit()
		end
	end
end

function player:draw()
	love.graphics.setScreen('top')
	love.graphics.setColor(0,255,0)
	temp = 0
	for i in  ipairs(self.blocks) do
		temp = temp+1
		x = self.blocks[i].x
		y = self.blocks[i].y
		love.graphics.rectangle(self.mode, self.blocks[i].x*self.w, self.blocks[i].y*self.w, self.w, self.w)
	end
	love.graphics.setColor(self.col.r*255, 0, 0)
	love.graphics.rectangle(self.mode, self.tar.x * self.w, self.tar.y * self.w, self.w, self.w)
	love.graphics.setColor(self.col.r*255, self.col.g*255, self.col.b*255)
	love.graphics.rectangle(self.mode, self.x*self.w, self.y*self.w, self.w, self.w)
end


function love.load()
	--love.graphics.set3D(true)
	player:hardreset()
end

function love.update(dt)
	if frames >= fps then
		player:update()
		frames = 0
	end
	frames = frames+dt

end

function love.draw()
	love.graphics.setBackgroundColor(bgCol.r, bgCol.g, bgCol.b)
	--topscreen only works on 3ds, so look out
	--love.graphics.setScreen('top')
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
	if (key == "select") then
		player:hardreset()
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
