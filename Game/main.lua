
------------------------------------------------------------------------------
function love.load()
backround1 = love.graphics.newImage("screen1.png")
backround2 = love.graphics.newImage("screen2.png")
nuke = love.graphics.newImage("nuke.png")
sprite = love.graphics.newImage("sprite1.png")
x = 330
y = 200
t = -250
v = love.math.random(0, 700)
health = 100
font = love.graphics.newFont(20)
  love.graphics.setFont(font)
 time = love.timer.getTime()
end
------------------------------------------------------------------------------
function love.update()


--if love.keyboard.isDown('w') then
--  y = y - 25
--end
if love.keyboard.isDown('a') then
  x = x - 10
end
--if love.keyboard.isDown('s') then
  --y = y + 25
--end
if love.keyboard.isDown('d') then
  x = x + 10
end
t = t + 5


end
------------------------------------------------------------------------------
function love.draw()
  love.graphics.print(health,-1,20)
  love.graphics.print("Health:")

love.graphics.draw(sprite,x,y)
love.graphics.draw(nuke,v,t)
love.graphics.print(x, 0, 0)
if love.timer.getTime() - time < 30 then  --change time
   love.graphics.draw(backround1,0,0,0,1,.75)
 else
 if love.timer.getTime() - time < 100 then  --change time
  love.graphics.draw(backround2,0,0,0,1,.75)
end
end

end


------------------------------------------------------------------------------
function love.keyreleased(key)
   if key == "escape" then
      love.event.quit()
   end
   if key == 'space' then
     love.load()
   end
 end
------------------------------------------------------------------------------
