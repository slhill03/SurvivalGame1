
------------------------------------------------------------------------------
function love.load()
obstacle = love.graphics.newImage("piranha.png")
obstacle2 = love.graphics.newImage("Thwomp.png")
sprite = love.graphics.newImage("Mario 8 bit.png")
sprite2 = love.graphics.newImage("Luigi 8 bit.png")
x = 330
y = 400

t = -250
v = love.math.random(0, 700)

s = -250
a = love.math.random(0,700)

health = 100
font = love.graphics.newFont(20)
  love.graphics.setFont(font)
 time = love.timer.getTime()
 score = 0
 -- music = love.audio.newSource("", "stream")
 -- music:setLooping(true)
 --  music:play()
end
------------------------------------------------------------------------------
function love.update()

if love.keyboard.isDown('right') then
  x = x + 12
end
if love.keyboard.isDown('a') then
  x = x - 12
end
if love.keyboard.isDown('left') then
  x = x - 12
end
if love.keyboard.isDown('d') then
  x = x + 12
end

t = t + 10
s = s + 5

if health == 0
then love.event.quit()
end

if cc(x, y, 100, 123, v, t, 97, 100) then
  health = health - 1
end
--hitboxes
if cc(x,y, 100, 123, s, a, 104, 108) then
  health = health -1
end                            --fix

if t > 600
then t = -250
v = love.math.random(0, 700)
end
   --redraws obstacles
   if s > 600
   then s = -250
   a = love.math.random(0, 700)
   end

if x < -140
 then x = 830
 end                  --wrap around

 if x > 830
  then x = -140
  end                --wrap around

if love.timer.getTime() - time > 1
then score = score + 1
end



end
------------------------------------------------------------------------------
function love.draw()

love.graphics.print(health,-1,20)
love.graphics.print("Health")
love.graphics.draw(sprite,x,y,0,1)
love.graphics.draw(obstacle,v,t)
love.graphics.draw(obstacle2,a,s)
love.graphics.print(score, 730,25)
love.graphics.print("Score" ,740,2)
--love.graphics.print(x, 200, 200)
love.graphics.rectangle('line',a, s, 104, 108)
love.graphics.rectangle('line',v, t, 97, 100)
love.graphics.rectangle('line',x, y, 100, 123)


end
------------------------------------------------------------------------------
function love.keyreleased(key)
   if key == "escape" then
      love.event.quit()
   end
   if key == "space" then
    love.load()
   end
   if key == 'p'
 then love.audio.pause()
   end
   if key == 'q'
   then music:play();
   end

 end
------------------------------------------------------------------------------

function cc(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1     --hitboxes
end
------------------------------------------------------------------------------
