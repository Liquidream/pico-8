pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- #amongtweets
-- paul nicholas

--
-- constants/variables
--
z=126
h=63

--
-- (function shorthands)
--
b=btn

--
-- step 1: generate our sprites
-- 

?"\^c0\-j웃\f7\vv■\+9r\f5o❎&\-0\|luホp"

rect(6,13,19,18)

memcpy(0,6^13,▤)  -- copy the whole screen memory to sprite mem
-- 1st param is destination (0 = start of sprite memory)
-- 2nd param is source, now...
--     0x6000 = start screen memory
--     0x6000 > decimal = 24576 > shortened to 6^13
-- 3rd param is length to copy.
--     ▤ glyph in pico-8 has a costant value of 3855.5
-- (Using ▤ here was excessive, but saved on chars)


-- initialise player object table (x4)
g={}
-- note: iterating between 8-11 instead of 1-4 in order to use
--       player colour as the index, for simple "kill" logic
for i=8,11 do 
 g[i]={x=i*6,y=4}  -- space each player out along the same y-pos
end

--
-- step 2: game loop
-- 
::_::
cls()

for i=8,11 do
 -- calculate the top-left position for the current player's "view"
 -- (e.g. four view/boxes for each player, in each corner of the screen)
 n=(i*h)%z
 m=(i\2*h)%z 

 -- get the player object that is the current "view"
 c=g[i]
 
 -- orient the view to be central on the current player we are following
 camera(c.x-n-32,c.y-m-32)

 -- create a clipping region to restrict drawing to just the current viewport
 
 clip(n,m,61,61)

 -- draw level with fake depth effect
 -- (drawn twice, once in brown, then again with y-shifted down in grey)
 for t=4,5 do
  pal(5,t)
  sspr(0,9,h,h,-z,-h+t*5,z*8,z*8)
 end

 -- iterate through players in reverse order 
 -- so that the players 1&2 have more to actually "kill"
 -- (to account for limitation of only being able to check for 
 --  collision on players already drawn prior to current player)
 for a=3,0,-1 do
  p=g[a+8]  
  p.a=b(0,a) and -1 or (b(1,a) and 1 or 0)  -- move current player left/right
  p.b=b(2,a) and -1 or (b(3,a) and 1 or 0)  -- move current player up/down
  d=p.a

  c=pget(p.x+d,p.y+p.b)
  
  if (b(5,a) and c>7) g[c].d=1 cls(8)
  
  -- if player is not dead, then draw them
  -- the y-pos is given a "bobbing"-effect here, depending on the current position
  -- (it's not perfect, as breaks on some diagonals, but took less chars this way)
  if (not p.d) pal(6,a+8) pal(7,12,1) spr(0,p.x-4,p.y-((p.x+p.y)%6<3and 0or 1)-3,1,1,d>0)
  
  -- if player is not colliding with bounds (black colour)
  -- then allow movement
  if (c>4 and i==a+8) p.x+=d p.y+=p.b

 end
end
flip()                  -- draw to screen
goto _                  -- end of game loop




__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddd
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddd
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddd
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddd
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd
00000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddd66dddddddddddddd66dddddddddd
00000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddd66dddddddddddddd66dddddddddd
000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd6666
000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd6666
0000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd6666
0000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd6666
0000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
0000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd666666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd666666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666666666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666666666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd6666660000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dddddddddddddd66dddddddddddddd66dd6666000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000dddddddddddddd66dddddddddddddd66dd6666000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66dd6600000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66dd6600000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000006666dd666666dd666666dd666666dd66000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddddddddddd77dd77dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddd77dd77dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
dddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddd
dddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
0000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
0000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
0000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666600
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666666666666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666666666666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666600
666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666600
dddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dd666600dd
dddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dd666600dd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66dd6600dddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66dd6600dddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd660000dddddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd660000dddddd
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666600dd6666
66dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666600dd6666
006600dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666006600dddddddddd
006600dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666006600dddddddddd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666666666666666006600dd666666dd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd6666666666666666006600dd666666dd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666666006600dd666666dd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666666006600dd666666dd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666666006600dd666666dd
006600dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66666666006600dd666666dd
dd66dddddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dd66660066dd66dddddddddddd
dd66dddddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dddddddddddddd66dd66660066dd66dddddddddddd
dd88dd66668866666688666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66dd6666dd66dd66dd6666dd6666
dd88dd66668866666688666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66dd6666dd66dd66dd6666dd6666
dd888866668888666688886666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66000066dd66dd66dd6666dd6666
dd888866668888666688886666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd66000066dd66dd66dd6666dd6666
66888888668888886688888866dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd660000dd666666dd666666dd6666
66888888668888886688888866dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd666666dd660000dd666666dd666666dd6666
dd8888666688880000888800000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddd
dd8888666688880000888800000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddd
668866666688660000880000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd
668866666688660000880000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd
666666dd6666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd
666666dd6666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd666666dd666666dd666666dd
