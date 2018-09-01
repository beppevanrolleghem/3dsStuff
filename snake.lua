
--[[

	so 3ds uses 2 screens, what if i wanted to make this game cover 2 screens, or even what if i wanted to play 2 games on 2 screens
	actually loving that second idea. gonna try to make it



]]


snake = {
	beep = love.audio.newSource("data/beep.wav", "static"),
	death = love.audio.newSource("data/death.wav", "static"),
	fps = 10,
	frames = 0,
	hgrid = 20,
	vgrid = 11,
	screen = "top",
	score = 0,
	bgCol = {
		r = 0,
		g = 0,
		b = 0
	}
}


snakeplayer = {
	x = 1,
	y = 1,
	w = 1,
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

function snakeplayer:reset()
	self.xvel = 0
	self.yvel = 0
end

function snakeplayer:hardreset()
	self.xvel = 0
	self.yvel = 0
	self.x = 10
	self.y = 10
	self.blocks = {}
	love.graphics.setScreen(snake.screen)
	self.w = love.graphics.getWidth()/snake.hgrid
	snake.score = 0
end

function snakeplayer:keypressed(key)
	if (key == "start") then
		--gamemanager:quit()
		gamemanager:pause()
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
		--snakeplayer:hardreset()
	end
	if (key == "lbutton") then
		
	end
	if (key == "rbutton") then
		
	end
	if (key == "l") then
		
	end
	if (key == "r") then
		
	end
	if (key == "lzbutton") then
		
	end
	if (key == "rzbutton") then
		
	end
end

function snakeplayer:move(xvel, yvel)
	if self.xvel == -xvel and self.yvel == -yvel then

	else
		self.xvel = xvel
		self.yvel = yvel
	end
end

function snakeplayer:update(dt)
	if snake.frames >= 1/snake.fps then
		if self.x > snake.hgrid then
			self.x = 0
		end
		if self.x < 0 then
			self.x = snake.hgrid
		end
		if self.y > snake.vgrid then
			self.y = 0
		end
		if self.y < 0 then
			self.y = snake.vgrid
		end
		if self.tar.x == self.x and self.tar.y == self.y then
			table.insert(self.blocks, {x = self.x, y = self.y})
			self.tar.x = math.floor(math.random() * snake.hgrid)
			self.tar.y = math.floor(math.random() * snake.vgrid)
			snake.beep:play()
			snake.score= snake.score + 1
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
				snake.death:play()
				snakeplayer:hardreset()
				return
				--love.event.quit()
			end
		end
		snake.frames = 0
	end
	snake.frames = snake.frames+dt
end

function snakeplayer:draw()
	love.graphics.setScreen(snake.screen)
	love.graphics.setColor(snake.bgCol.r, snake.bgCol.g, snake.bgCol.b)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(0,255,0)
	for i in  ipairs(self.blocks) do
		love.graphics.rectangle(self.mode, self.blocks[i].x*self.w, self.blocks[i].y*self.w, self.w, self.w)
	end
	love.graphics.setColor(self.col.r*255, 0, 0)
	love.graphics.rectangle(self.mode, self.tar.x * self.w, self.tar.y * self.w, self.w, self.w)
	love.graphics.setColor(self.col.r*255, self.col.g*255, self.col.b*255)
	love.graphics.rectangle(self.mode, self.x*self.w, self.y*self.w, self.w, self.w)
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
