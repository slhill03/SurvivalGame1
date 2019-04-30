
------------------------------------------------------------------------------
function love.load()
backround1 = love.graphics.newImage("screen1.png")
backround2 = love.graphics.newImage("screen2resize.png")
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
 score = 0
end
------------------------------------------------------------------------------
function love.update()


if love.keyboard.isDown('right') then
  x = x + 10
end
if love.keyboard.isDown('a') then
  x = x - 10
end
if love.keyboard.isDown('left') then
  x = x - 10
end
if love.keyboard.isDown('d') then
  x = x + 10
end
t = t + 10

if health == 0
then love.event.quit()
end

if cc(x, y, 117, 288, v, t, 144, 189) then
  health = health - 1
end

if t > 600
then t = -250
v = love.math.random(0, 700)
 end

if x < -140
 then x = 830
 end

 if x > 830
  then x = -140
  end

if love.timer.getTime() - time > 1
then score = score + 1
end

end
------------------------------------------------------------------------------
function love.draw()
  love.graphics.print(health,-1,20)
  love.graphics.print("Health")
--love.graphics.draw(backround2,0,0,0,1,.75)
love.graphics.draw(sprite,x,y)
love.graphics.draw(nuke,v,t)
love.graphics.print(score, 730,25)
love.graphics.print("Score" ,740,2)
love.graphics.print(x, 200, 200)
--if love.timer.getTime() - time < 30 then  --change time
   --love.graphics.draw(backround1,0,0,0,1,.75)
 --else
 --if love.timer.getTime() - time < 100 then  --change time
  --love.graphics.draw(backround2,0,0,0,1,.75)
--end
--end


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

function cc(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
------------------------------------------------------------------------------
