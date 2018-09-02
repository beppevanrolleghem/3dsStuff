
ui = {
	twidth = 0,
	theight = 0,
	bwidth = 0,
	bheight = 0
}

menu = {
	main = {
		items = {
			"select games",
			"settings",
			"about",
			"exit"
		}
	},
	prop = {
		x = 100,
		x2 = 200,
		bars = 50,
		offset = 20,
		xoff = 5,
		cursel = 1,
		curitems = 0
	}
}

function ui:load()
	love.graphics.setScreen("top")
	ui.twidth = love.graphics.getWidth()
	ui.theight = love.graphics.getHeight()
	love.graphics.setScreen("bottom")
	ui.bwidth = love.graphics.getWidth()
	ui.bheight = love.graphics.getHeight()
end


function ui:draw()
	menu.prop.curitems = table.getn(menu.main.items)
	--sqr = 
	for i in ipairs(menu.main.items) do
		temp = ((ui.theight - menu.prop.bars)/(menu.prop.curitems)) * i
		--love.graphics.rectangle("fill", menu.prop.xoff, menu.prop.bars , ui.twidth, menu.prop.bars)
		local x, y = love.mouse.getPosition() 
		if i == menu.prop.cursel then
			love.graphics.setColor(255, 0, 0)
		end
		love.graphics.printf(menu.main.items[i], menu.prop.x, temp , menu.prop.x2, "center")
		love.graphics.setColor(255,255,255)
	end
end

function ui:update(dt)
	if menu.prop.cursel < 1 then
		menu.prop.cursel = menu.prop.curitems
	elseif menu.prop.cursel > menu.prop.curitems then
		menu.prop.cursel = 1
	end
end

function ui:keypressed(key)
	if key == "up" then
		menu.prop.cursel = menu.prop.cursel - 1
	end
	if key == "down" then
		menu.prop.cursel = menu.prop.cursel + 1

	end
	if key == "left" then

	end
	if key == "right" then

	end
	if key == "cpadup" then
		menu.prop.cursel = menu.prop.cursel - 1
	end
	if key == "cpaddown" then
		menu.prop.cursel = menu.prop.cursel + 1

	end
	if key == "cpadleft" then

	end
	if key == "cpadright" then

	end
end

function ui:keyreleased(key)

end

function ui:mousepressed(x, y)

end