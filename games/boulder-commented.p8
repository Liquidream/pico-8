pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- boulder dash ttj
-- paul nicholas

--
-- (function shorthands)
--
s=mset
g=mget

--
-- constants/variables
--
x=2    -- player position
y=3    --
t=0    -- used for timing/frame count
z=0    -- collected diamond count (score)
k=0    -- game state (0=game, 1=dead, 2=win)

--
-- step 1: generate our sprites
-- 
cls()
?"웃◆●◆●\#5::",17,2
?"\#4░\vh░",8,2,0
?"🐱",17,0,5

-- (body of our player)
-- 웃◆●◆● -- normal icon/glyphs, drawn with default col (6 = light grey)
-- (block tile)
-- \#5::   -- change to solid bg col (5 = dark grey) and draw "::"
-- (dirt tile)
-- \#4░    -- change solid bg col (4 = brown)...
-- \vh░    -- decorate prev char at offset "h"...
-- ,8,2,0  -- and draw the ░ chars black (0)
-- (cat head for player body)
--?"🐱",17,0,5



memcpy(0,6^13,▤)   -- copy the whole screen memory to sprite mem
 -- 1st param is destination (0 = start of sprite memory)
 -- 2nd param is source, now...
 --     0x6000 = start screen memory
 --     0x6000 > decimal = 24576
 --       6^13 = 24576 (saves 1 char)
 -- 3rd param is length to copy.
 --     ▤ glyph in pico-8 has a constant value of 3855.5
 -- (Using ▤ here was excessive, but probably saved 2 or more chars)

--
-- step 2: game loop
-- 
::_::
cls()
s(x,y,0)       -- clear the map tile at player's current pos 
               -- (i now realise I could've ommitted the 3rd param + save 2 chars!)

a=x            -- used to store new player pos
b=y            --

p=btnp()       -- capture the current button state

a+=p\2%2-p%2   -- use the button state to get horizontal movement
b+=p\8%2-p\4%2 -- same for vertical (in 8x8 grid movement)

c=g(a,b)       -- get the sprite number for at the player's new map position

-- if new pos sprite/map tile is not "solid", then update final player pos
if(c<4)x,y=a,b 

-- if new pos sprite/map tile is a diamond, then increase score + play sfx
if(c==3)z+=1?"\aszx5e1"

-- if player score > 8 then open the "exit" (by clearing the map tile)
if(z>8)s(15,9)

s(x,y,2)       -- set map tile at current player pos to player sprite

for i=0,239 do -- start wrap-looping through the entire map
 
 v=16-i\16     -- calc the vertical map pos of current loop point
 h=i%16        -- calc same for horizontal
               -- (this all uses less chars than nested for..loops)
 
 -- if start of execution, then "init" game/map...
 if t<1 then 

  -- pick a random game map tile
  c=rnd{0,1,1,1,1,1,1,1,3,4}

  -- if at the edge of the screen, then force tile to be wall
  -- (i now know i could've save chars using: if(h % 15<1) )
  if(h<1or h>14or v<3or v>15)c=7
  
  s(h,v-1,c)   -- commit tile to map memory


 -- else periodically perform game/map "update"...
 elseif t%3==0 then 

  c=g(h,v)     -- get sprite number at current map pos
  d=g(h,v+1)   -- ...and get sprite no. "underneath" that

  -- if current sprite is in "idle" state
  --  and sprite tile below it is empty space
  -- then change sprite state to "falling" + move down 
  if(c>2and c<5and d<1)s(h,v+1,c+2)s(h,v)

  -- if current sprite is in "falling" state  
  if c>4and c<7 then
   --  ...and sprite tile below it is empty space
   if d<1 then
    -- then move it down
    -- (set sprite below it to same tile + clear current pos)
    s(h,v+1,c)
    s(h,v)

   -- ...and sprite tile below is player
   elseif d==2 then    
    run()      -- dead, restart game

   -- ...else sprite tile below "solid"
   else    
    s(h,v,c-2) -- change sprite state back to "idle" state
   end
  end
 end
end

map() -- draw map

?"\^w9◆"..z

flip() -- draw to screen

if(x>14)run() -- if player "escapes", then restart game

t+=1   -- used as game timer

goto _ -- end of game loop


__gfx__
00000000000000000500000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000004444444440555555500000000000000000000000000000000555555555000000000000000000000000000000000000000000000000000000000000000
00000004044404440505550500006000000666000000700000077700555555555000000000000000000000000000000000000000000000000000000000000000
00000004440444040505550500066600006660600007770000777070557555755000000000000000000000000000000000000000000000000000000000000000
00000004044404440055555000666660006666600077777000777770555555555000000000000000000000000000000000000000000000000000000000000000
00000004440444040006660000066600006666600007770000777770557555755000000000000000000000000000000000000000000000000000000000000000
00000004044404440006060000006000000666000000700000077700555555555000000000000000000000000000000000000000000000000000000000000000
00000004444444440000000000000000000000000000000000000000555555555000000000000000000000000000000000000000000000000000000000000000
__label__
55555500000000550000000055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55005500000055555500000055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555500005555555555000055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005500000055555500000055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005500000000550000000055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000444044404440444044404440000000004440444044404440444044404440444000000000000000004440444044404440000000004440444000000000
55555555404440444044404440444044000000004044404440444044404440444044404400000000000000004044404440444044000000004044404455555555
55555555444044444440444444404444000060004440444444404444444044444440444400066600000060004440444444404444000000004440444455555555
55655565444444444444444444444444000666004444444444444444444444444444444400666060000666004444444444444444000000004444444455655565
55555555044404440444044404440444006666600444044404440444044404440444044400666660006666600444044404440444000000000444044455555555
55655565440444044404440444044404000666004404440444044404440444044404440400666660000666004404440444044404000000004404440455655565
55555555044404440444044404440444000060000444044404440444044404440444044400066600000060000444044404440444000000000444044455555555
55555555444444444444444444444444000000004444444444444444444444444444444400000000000000004444444444444444000000004444444455555555
00000000444044400500000544404440444044404440444044404440444044404440444044404440444044400000000044404440444044404440444000000000
55555555404440440555555540444044404440444044404440444044404440444044404440444044404440440000000040444044404440444044404455555555
55555555444044440505550544404444444044444440444444404444444044444440444444404444444044440006660044404444444044444440444455555555
55655565444444440505550544444444444444444444444444444444444444444444444444444444444444440066606044444444444444444444444455655565
55555555044404440055555004440444044404440444044404440444044404440444044404440444044404440066666004440444044404440444044455555555
55655565440444040006660044044404440444044404440444044404440444044404440444044404440444040066666044044404440444044404440455655565
55555555044404440006060004440444044404440444044404440444044404440444044404440444044404440006660004440444044404440444044455555555
55555555444444440000000044444444444444444444444444444444444444444444444444444444444444440000000044444444444444444444444455555555
00000000000000000000000044404440444044404440444044404440000000000000000044404440444044400000000044404440000000004440444000000000
55555555000000000000000040444044404440444044404440444044000000000000000040444044404440440000000040444044000000004044404455555555
55555555000060000000000044404444444044444440444444404444000060000006660044404444444044440006660044404444000060004440444455555555
55655565000666000000000044444444444444444444444444444444000666000066606044444444444444440066606044444444000666004444444455655565
55555555006666600000000004440444044404440444044404440444006666600066666004440444044404440066666004440444006666600444044455555555
55655565000666000000000044044404440444044404440444044404000666000066666044044404440444040066666044044404000666004404440455655565
55555555000060000000000004440444044404440444044404440444000060000006660004440444044404440006660004440444000060000444044455555555
55555555000000000000000044444444444444444444444444444444000000000000000044444444444444440000000044444444000000004444444455555555
00000000444044404440444044404440444044400000000044404440444044404440444000000000444044400000000044404440444044404440444000000000
55555555404440444044404440444044404440440000000040444044404440444044404400000000404440440000000040444044404440444044404455555555
55555555444044444440444444404444444044440000000044404444444044444440444400006000444044440006660044404444444044444440444455555555
55655565444444444444444444444444444444440000000044444444444444444444444400066600444444440066606044444444444444444444444455655565
55555555044404440444044404440444044404440000000004440444044404440444044400666660044404440066666004440444044404440444044455555555
55655565440444044404440444044404440444040000000044044404440444044404440400066600440444040066666044044404440444044404440455655565
55555555044404440444044404440444044404440000000004440444044404440444044400006000044404440006660004440444044404440444044455555555
55555555444444444444444444444444444444440000000044444444444444444444444400000000444444440000000044444444444444444444444455555555
00000000444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444000000000
55555555404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404455555555
55555555444044444440444444404444444044444440444444404444444044444440444444404444444044444440444444404444444044444440444455555555
55655565444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444455655565
55555555044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044455555555
55655565440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440455655565
55555555044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044404440444044455555555
55555555444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444455555555
00000000444044404440444000000000000000000000000044404440444044404440444044404440000000004440444044404440000000000000000000000000
55555555404440444044404400000000000000000000000040444044404440444044404440444044000000004044404440444044000000000000000055555555
55555555444044444440444400066600000060000000000044404444444044444440444444404444000060004440444444404444000000000006660055555555
55655565444444444444444400666060000666000000000044444444444444444444444444444444000666004444444444444444000000000066606055655565
55555555044404440444044400666660006666600000000004440444044404440444044404440444006666600444044404440444000000000066666055555555
55655565440444044404440400666660000666000000000044044404440444044404440444044404000666004404440444044404000000000066666055655565
55555555044404440444044400066600000060000000000004440444044404440444044404440444000060000444044404440444000000000006660055555555
55555555444444444444444400000000000000000000000044444444444444444444444444444444000000004444444444444444000000000000000055555555
00000000000000000000000044404440444044404440444044404440444044400000000044404440444044404440444044404440444044404440444000000000
55555555000000000000000040444044404440444044404440444044404440440000000040444044404440444044404440444044404440444044404455555555
55555555000666000000600044404444444044444440444444404444444044440000000044404444444044444440444444404444444044444440444455555555
55655565006660600006660044444444444444444444444444444444444444440000000044444444444444444444444444444444444444444444444455655565
55555555006666600066666004440444044404440444044404440444044404440000000004440444044404440444044404440444044404440444044455555555
55655565006666600006660044044404440444044404440444044404440444040000000044044404440444044404440444044404440444044404440455655565
55555555000666000000600004440444044404440444044404440444044404440000000004440444044404440444044404440444044404440444044455555555
55555555000000000000000044444444444444444444444444444444444444440000000044444444444444444444444444444444444444444444444455555555
00000000444044404440444000000000000000004440444044404440444044404440444044404440000000000000000044404440444044404440444000000000
55555555404440444044404400000000000000004044404440444044404440444044404440444044000000000000000040444044404440444044404455555555
55555555444044444440444400000000000000004440444444404444444044444440444444404444000666000000600044404444444044444440444455555555
55655565444444444444444400000000000000004444444444444444444444444444444444444444006660600006660044444444444444444444444455655565
55555555044404440444044400000000000000000444044404440444044404440444044404440444006666600066666004440444044404440444044455555555
55655565440444044404440400000000000000004404440444044404440444044404440444044404006666600006660044044404440444044404440455655565
55555555044404440444044400000000000000000444044404440444044404440444044404440444000666000000600004440444044404440444044455555555
55555555444444444444444400000000000000004444444444444444444444444444444444444444000000000000000044444444444444444444444455555555
00000000000000004440444000000000444044404440444044404440444044404440444044404440444044404440444044404440444044400000000000000000
55555555000000004044404400000000404440444044404440444044404440444044404440444044404440444044404440444044404440440000000055555555
55555555000000004440444400066600444044444440444444404444444044444440444444404444444044444440444444404444444044440006660055555555
55655565000000004444444400666060444444444444444444444444444444444444444444444444444444444444444444444444444444440066606055655565
55555555000000000444044400666660044404440444044404440444044404440444044404440444044404440444044404440444044404440066666055555555
55655565000000004404440400666660440444044404440444044404440444044404440444044404440444044404440444044404440444040066666055655565
55555555000000000444044400066600044404440444044404440444044404440444044404440444044404440444044404440444044404440006660055555555
55555555000000004444444400000000444444444444444444444444444444444444444444444444444444444444444444444444444444440000000055555555
00000000000000004440444000000000444044400000000044404440000000000000000044404440444044404440444000000000444044404440444000000000
55555555000000004044404400000000404440440000000040444044000000000000000040444044404440444044404400000000404440444044404455555555
55555555000666004440444400006000444044440000000044404444000000000000600044404444444044444440444400000000444044444440444455555555
55655565006660604444444400066600444444440000000044444444000000000006660044444444444444444444444400000000444444444444444455655565
55555555006666600444044400666660044404440000000004440444000000000066666004440444044404440444044400000000044404440444044455555555
55655565006666604404440400066600440444040000000044044404000000000006660044044404440444044404440400000000440444044404440455655565
55555555000666000444044400006000044404440000000004440444000000000000600004440444044404440444044400000000044404440444044455555555
55555555000000004444444400000000444444440000000044444444000000000000000044444444444444444444444400000000444444444444444455555555
00000000444044400000000044404440444044400000000000000000444044404440444000000000000000004440444000000000000000004440444000000000
55555555404440440000000040444044404440440000000000000000404440444044404400000000000000004044404400000000000000004044404455555555
55555555444044440006660044404444444044440000000000000000444044444440444400066600000000004440444400000000000000004440444455555555
55655565444444440066606044444444444444440000000000000000444444444444444400666060000000004444444400000000000000004444444455655565
55555555044404440066666004440444044404440000000000000000044404440444044400666660000000000444044400000000000000000444044455555555
55655565440444040066666044044404440444040000000000000000440444044404440400666660000000004404440400000000000000004404440455655565
55555555044404440006660004440444044404440000000000000000044404440444044400066600000000000444044400000000000000000444044455555555
55555555444444440000000044444444444444440000000000000000444444444444444400000000000000004444444400000000000000004444444455555555
00000000000000000000000044404440000000004440444044404440444044400000000000000000444044400000000000000000444044404440444000000000
55555555000000000000000040444044000000004044404440444044404440440000000000000000404440440000000000000000404440444044404455555555
55555555000000000006660044404444000666004440444444404444444044440000000000006000444044440006660000006000444044444440444455555555
55655565000000000066606044444444006660604444444444444444444444440000000000066600444444440066606000066600444444444444444455655565
55555555000000000066666004440444006666600444044404440444044404440000000000666660044404440066666000666660044404440444044455555555
55655565000000000066666044044404006666604404440444044404440444040000000000066600440444040066666000066600440444044404440455655565
55555555000000000006660004440444000666000444044404440444044404440000000000006000044404440006660000006000044404440444044455555555
55555555000000000000000044444444000000004444444444444444444444440000000000000000444444440000000000000000444444444444444455555555
00000000000000000000000000000000444044400000000000000000444044400000000000000000444044404440444044404440444044404440444000000000
55555555000000000000000000000000404440440000000000000000404440440000000000000000404440444044404440444044404440444044404455555555
55555555000666000006660000066600444044440000000000006000444044440000000000066600444044444440444444404444444044444440444455555555
55655565006660600066606000666060444444440000000000066600444444440000000000666060444444444444444444444444444444444444444455655565
55555555006666600066666000666660044404440000000000666660044404440000000000666660044404440444044404440444044404440444044455555555
55655565006666600066666000666660440444040000000000066600440444040000000000666660440444044404440444044404440444044404440455655565
55555555000666000006660000066600044404440000000000006000044404440000000000066600044404440444044404440444044404440444044455555555
55555555000000000000000000000000444444440000000000000000444444440000000000000000444444444444444444444444444444444444444455555555
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565556555655565
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

__map__
0000000000000000000000000000000000000000000000000000000000000000040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505000205050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040205000505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040205000000050500050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040404040404050502050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505050505050502020505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505050505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505020505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505020505050505040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505050505020505050005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040502050505020505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040505050500020505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000