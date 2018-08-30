fly = {
	sx = 0, --startx or current x
	sy = 0, --starty or current y
	x = 50, --destination x
	y = 50, --destination -y
	sprite = love.graphics.newImage("data/fly.png"), --image
	af = love.graphics.newQuad(0, 0, 512, 512, 1024, 512), --a frame
	bf = love.graphics.newQuad(512, 0, 512, 512, 1024, 512), --b frame
	rot = 0, --rotation
	scl = 20, --scale
	anf = 0, --animation frames
	anc = false, --animation counter (false is af true is bf or some shit)
	ans = 1, --animation speed (if animation frames is equal to this the anim changes)
	alive = true, --is the fly alive
	ttl = 4, --time to live before the fly dies
	tl = 0, --time lived
	timer = false --flies only start living when they stop moving, this is to keep tracking that
}

swat = {
	screen = "bottom",
	score = 0,
	diff = 1, --difficulty
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
	if swat.frames == swat.diff then

		swat.frames = 0
	end
	swat.frames = swat.frames+dt
	fly.anf = fly.anf +dt
	if fly.timer then
		fly.tl = fly.tl + dt
	end
	if fly.tl >= fly.ttl then
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
		fly:newFly()
	end
end

function fly:draw()
	love.graphics.setScreen(swat.screen)
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
		love.graphics.draw(fly.sprite, fly.af, 1, 1, 0, 0, 0,0,0)
	else
		love.graphics.draw(fly.sprite, fly.bf, 1, 1, 0, 0, 0,0,0)
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