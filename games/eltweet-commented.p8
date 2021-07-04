pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- #tweettweetsky
-- paul nicholas

--
-- constants/variables
--
m=173       -- a large number that's...
            -- > bigger than screen dimensions so planet terrain chars scroll smooth in all dirs, and
            -- > a multiple such that the last planetos is drawn lt blue, so thruster can use same col

l=16        -- start with finer movement in space (i now realise this could've been 9, and saved a char!)
c=1         -- the clear color (start with dk blue, for space)
w=9^6       -- a large number (7153) for how large the galaxy/planet surface is for random placement of objs
a=w/2       -- player's x pos - start in middle of galaxy
            --  (note: used a instead of x to allow it to minify better, when joining next to other code)
y=a         -- player's y pos
z="\^w\^t"  -- p8scii char codes to double the size horizontally and vertically (used later with strings)
h=63        -- a const for half the height of the screen (used in several places)
t=3.2       -- the max velocity in space flight (used non-integer to keep thrust "flickering")
v=0         -- player's starting y velocity
u=t         -- player's starting x velocity (e.g. start flying right at full speed)

--
-- (function shorthands)
--
r=rnd

--
-- game loop
--
function _update60()
 
 b=btn()           -- capture the current button state
 i=(b\2%2-b%2)/l   -- use the button state to get horizontal movement, divided by a scale factor to slow as necc.
 j=(b\8%2-b\4%2)/l -- same for vertical

 u=mid(-t,u+i,t)   -- update velocity, but cap it to a max/min 
 v=mid(-t,v+j,t)   -- 

 a+=(l>1)and u or i/2 -- if flying, apply the current velocity - else apply button logic (half speed)
 y+=(l>1)and v or j/2 --
 cls(c)               -- clear screen the current col (dk blue in space, planet col when landed) 
 camera(a-h,y-h)      -- move camera to current player pos (with offset to center player)

 for i=1,m do         -- loop 173 times                      
  
  srand(i)            -- best seed found for galaxy layout, with interesting objects near start

  if l>1 then         -- if in "space flight" mode...

   j="◆"              -- use ◆ char for space stations
   s=""               -- don't apply draw scale for player's ship while in space
   q="."              -- use "." char to draw all the stars, while in space (same code used for terrain)
   d=r(9)             -- set random depth factor for star drawing (creates parallax starfield)

   e=a                -- set ship position to same as player's 
   f=y                --

   ?j,a-u,y-v         -- draw player's thruster, offset with opposite of current velocity
                      -- (yes, draws it 127 times/frame, but saves 3 chars & last one will be lt blue)
  
  else                -- else in "landed" mode...
  
   ?"웃",a,y,7        -- draw "walking" player at current pos
   d=1                -- set depth factor to 1 (e.g. no parallax)
   j="⌂"              -- use ⌂ char for houses 

  end

  ?q,a-(a/d+r(m))%m+h,y-(y/d+r(m))%m+h,6
                     -- draw either stars or terrain chars at random positions in relation to
                     -- player's current position, but make them wrap around the screen as the
                     -- player's position changes.

  ?z..j,r(w),r(w),5  -- draw either a space station or house, for this loop iteration

  circfill(r(w),r(w),r(h),l>1and i or 12)
                     -- draw either a colourful planet or a "lake", depending on current mode
 end

 ?s.."●",e,f,8       -- draw player's ship (when landed, will be prefixed with p8scii code for double-size) 
 p=pget(a-4,y)       -- get pixel color underneath player position 
 i=b&32>1            -- set to true if player is pressing [x] button

 if p==8 then        -- if player colliding/over something red...

  ?"❎",a,y+9        -- show [x] button ui prompt

  if(i)l=9c=1a+=h    -- if pressing [x], then switch to "space flight" mode 
                     -- (slower movement/acceleration, dk blue bg, move pos away from planet) 

                     -- else if "space flight" mode, and not over dk blue or grey (space/stars)...
 elseif l>1and p!=1and p!=6 then

  ?"❎",a,y+9        -- show [x] button ui prompt 
                      -- (annoyingly, I couldn't find a way to avoid code duplication)
  
  if(i)q="░"l=1c=p s=z  -- if pressing [x], then switch to "landed" mode 
                        -- (switch star char to ░ for terrain, move speed 1:1)
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
