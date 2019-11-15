--Made by Samuel Hill (@samuelshenk on Instagram)
state = 'start'

function love.load()
  if state == 'start' then
    startload()
  elseif state == 'game' then
    gameload()
  end
end


function love.update(dt)
  if state == 'start' then
    startupdate(dt)
  elseif state == 'game' then
    gameupdate(dt)
  end
end


function love.draw()
  if state == 'start' then
    startdraw()
  elseif state == 'game' then
    gamedraw()
  end
end



function startload()
  start = love.graphics.newImage("teststartscreen.PNG")
end
music = love.audio.newSource("starttheme.mp3", "stream")
music:setLooping(true)
music:play()


function startupdate(dt)

end


function startdraw()

  love.graphics.draw(start,0,0,0,1.4)
end












function gameload()
  obstacle = love.graphics.newImage("piranha.png")
  obstacle2 = love.graphics.newImage("Thwomp.png")
  obstacle3 = love.graphics.newImage("goomba.png")
  buff = love.graphics.newImage("oneup.png")
  sprite = love.graphics.newImage("Mario 8 bit.png")
  sprite2 = love.graphics.newImage("Luigi 8 bit.png")
  background = love.graphics.newImage("test.png")
  x = 330
  y = 400
  z = 0

  t = -250
  v = love.math.random(0, 700)

  s = -250
  a = love.math.random(0, 700)

  g = -250
  o = love.math.random(0, 700)

  h = -250
  e = love.math.random(0, 700)

  health = 100
  font = love.graphics.newFont(20)
  love.graphics.setFont(font)
  time = love.timer.getTime()
  score = 0
  music = love.audio.newSource("music.mp3", "stream")
  music:setLooping(true)
  music:play()
end

function gameupdate()

  if love.keyboard.isDown('right') then
    x = x + 14
  end
  if love.keyboard.isDown('a') then
    x = x - 14
  end
  if love.keyboard.isDown('left') then
    x = x - 14
  end
  if love.keyboard.isDown('d') then
    x = x + 14
  end

  t = t + 15
  s = s + 7
  g = g + 9
  h = h + 3

if health < 0
then love.event.quit()
end  --glitch repair
if score < 0
then love.event.quit()
end

if cc(x, y, 100, 123, v, t, 97, 100) then
  health = health - 1
end
--hitboxes
if cc(x, y, 100, 123, a, s, 104, 108) then
  health = health - 1
end

if cc(x, y, 100, 123, o, g, 64, 52) then
  health = health - 1
end

if cc(x, y, 100, 123, e, h, 64, 64) then
  if health < 100 then
    health = health + .5
    score = score - 5
    z = z + 1
  end

end


if t > 600
then t = -250
v = love.math.random(0, 700)
end
--redraws obstacles
if s > 600
then s = -250
a = love.math.random(0, 700)
end

if g > 600
then g = -250
o = love.math.random(0, 700)
end


if h > 600
then h = -250
e = love.math.random(0, 700)
end --buff


if x < - 140
then x = 830
end --wrap around

if x > 830
then x = -140
end --wrap around

if love.timer.getTime() - time > 1
then score = score + 1
end

if score == 10000
then love.graphics.print(e,500,500)
end


end

function gamedraw()
love.graphics.draw(background, 0, 0, 0, 1.35)
love.graphics.print(health, - 1, 20)
love.graphics.print("Health")
love.graphics.draw(sprite, x, y, 0, 1)
love.graphics.draw(buff, e, h, 0, .2)
love.graphics.draw(obstacle, v, t)
love.graphics.draw(obstacle2, a, s)
love.graphics.draw(obstacle3, o, g)
love.graphics.print(score, 730, 25)
love.graphics.print("Score", 740, 2)
-- love.graphics.print(x, 200, 200)
love.graphics.print("            Points Deducted", 250,1)
love.graphics.print(z,375,20)
-- love.graphics.rectangle('line', a, s, 104, 108)
-- love.graphics.rectangle('line', v, t, 97, 100)
-- love.graphics.rectangle('line', x, y, 100, 123)
-- love.graphics.rectangle('line', o, g, 64, 64)
-- love.graphics.rectangle('line', e, h, 64, 64)




end

function love.keyreleased(key)
if key == "escape" then
love.event.quit()
end
-- if key == "space" then
-- love.load()
-- end
if key == 'p'
then love.audio.pause()
end
if key == 'q'
then music:play();
end
if key == 's' then
  state = 'game'
  love.audio.stop()
  love.load()
end

end


function cc(x1, y1, w1, h1, x2, y2, w2, h2)
return x1 < x2 + w2 and
x2 < x1 + w1 and
y1 < y2 + h2 and
y2 < y1 + h1 --hitboxes
end
