fly = {
	sx = 0,
	sy = 0,
	x = 50,
	y = 50,
	sprite = love.graphics.newImage("data/fly.png"),
	af = love.graphics.newQuad(0, 0, 512, 512, 1024, 512),
	bf = love.graphics.newQuad(513, 0, 512, 512, 1024, 512),
	rot = 0,
	scl = 9,
	anf = 0,
	anc = false,
	ans = 10,
	alive = true,
	ttl = 4,
	tl = 0,
	timer = false
}

swat = {
	score = 0,
	diff = 1,
	frames = 0,
	width = 1,
	height = 1,
	bgCol = {
		r = 255,
		g = 255,
		b = 255
	}
}

function swat:load()
	love.graphics.setScreen("bottom")
	swat.width = love.graphics.getWidth()
	swat.height = love.graphics.getHeight()
	swat.score = 0
	swat.frames = 0
	fly:newFly()
end


function swat:update( dt)
	if swat.frames == swat.diff then

		swat.frames = 0
	end
	swat.frames = swat.frames+dt
	fly.anf = fly.anf +dt
	if fly.timer then
		fly.tl = fly.tl + dt
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
		fly:newFly()
	end
end

function fly:draw()
	love.graphics.setScreen("bottom")
	love.graphics.setColor(swat.bgCol.r, swat.bgCol.g, swat.bgCol.b)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	if fly.anf > fly.ans then
		fly.anf = 0
		if fly.anc then
			fly.anc = false
		else
			fly.anc = true
		end
	end
	if fly.anc then
		love.graphics.draw(fly.sprite, fly.af, fly.sx, fly.sy, fly.rot, fly.scl, fly.scl)
	else
		love.graphics.draw(fly.sprite, fly.bf, fly.sx, fly.sy, fly.rot, fly.scl, fly.scl)

	end
	
end

function fly:newFly()
	fly.x = math.floor(math.random() * swat.width)
	fly.y = math.floor(math.random() * swat.height)
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