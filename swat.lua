fly = {
	sx = 0, --startx or current x
	sy = 0, --starty or current y
	x = 50, --destination x
	y = 50, --destination -y
	width = 75,
	height = 66,
	sprite = love.graphics.newImage("data/fly.png"), --image
	quad = love.graphics.newQuad(87, 40, 75, 66, 368, 195), --162 106
	rot = 0, --rotation
	scl = 20, --scale
	alive = false, --is the fly alive
	ttl = 4, --time to live before the fly dies
	tl = 0, --time lived
	timer = false --flies only start living when they stop moving, this is to keep tracking that
}

swat = {
	beep = love.audio.newSource("data/beep.wav", "static"),
	death = love.audio.newSource("data/death.wav", "static"),
	screen = "bottom",
	score = 0,
	diff = .1, --difficulty
	frames = 0,
	width = 1,--set later width of screen
	height = 1,--set later height of screen
	bgCol = { --background colors of screen
		r = 255,
		g = 255,
		b = 255
	}
}

function swat:load()
	love.graphics.setScreen(swat.screen)
	swat.width = love.graphics.getWidth()
	swat.height = love.graphics.getHeight()
	swat.score = 0
	swat.frames = 0
	fly:newFly()
end


function swat:update( dt)
	if fly.timer then
		fly.tl = fly.tl + dt
	end
	if fly.tl >= (fly.ttl - (swat.score * swat.diff)) then
		swat.score = swat.score -1
		fly:newFly()
	end
	if fly.alive then
		--draw the existing fly if he's not on path, move him on his path.
		if fly.sx ~= fly.x or fly.sy ~= fly.y then
			if fly.sx < fly.x then
				fly.sx = fly.sx +1
			end
			if fly.sx > fly.x then
				fly.sx = fly.sx - 1
			end
			if fly.sy > fly.y then
				fly.sy = fly.sy -1
			end
			if fly.sy < fly.y then
				fly.sy = fly.sy +1
			end
		else
			--reached position, enable timer
			fly.timer = true

		end
	else 
		--make a new fly
		swat.beep:play()
		fly:newFly()
	end
end

function fly:draw()
	love.graphics.setScreen(swat.screen)
	love.graphics.setColor(swat.bgCol.r, swat.bgCol.g, swat.bgCol.b)
	--love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	if fly.alive then
		love.graphics.draw(fly.sprite, fly.quad, fly.sx, fly.sy, 0, 0, 0,0,0)
	end
	
	love.graphics.setColor(0,255,0)
	--love.graphics.print("score: ".. swat.score)
end

function fly:newFly()
	fly.x = math.floor(math.random() * swat.width - fly.width)
	fly.y = math.floor(math.random() * swat.height - fly.height)
	temp = math.floor(math.random() * 4) + 1
	if temp <= 1 then
		fly.sx = math.floor(math.random() * swat.width)
		fly.sy = 0
	elseif temp <= 2 then
		fly.sy = math.floor(math.random() * swat.height)
		fly.sx = 0
	elseif temp <= 3 then
		fly.sx = math.floor(math.random() * swat.width)
		fly.sy = swat.height
	else 
		fly.sy = math.floor(math.random() * swat.height)
		fly.sx = swat.width
	end
	fly.alive = true
	fly.ttl = 4
	fly.tl = 0
	fly.timer = false
	fly.anf = 0
end

--[[

fly = {
	sx = 0, --startx or current x
	sy = 0, --starty or current y
	x = 50, --destination x
	y = 50, --destination -y
	width = 75,
	height = 66,
	sprite = love.graphics.newImage("data/fly.png"), --image
	quad = love.graphics.newQuad(87, 40, 75, 66, 368, 195), --162 106
	rot = 0, --rotation
	scl = 20, --scale
	alive = true, --is the fly alive
	ttl = 4, --time to live before the fly dies
	tl = 0, --time lived
	timer = false --flies only start living when they stop moving, this is to keep tracking that
}


]]














function fly:kill(x, y)
	if x > fly.sx and x < fly.sx+fly.width and y > fly.sy and y < fly.sy+fly.height then

		fly:newFly()
		swat.score = swat.score+1
		return
	end
end