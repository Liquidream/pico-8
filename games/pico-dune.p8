pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- pico-dune
-- by paul nicholas
-- (with support from my patrons)

-- global flags
debug_mode=true
debug_collision=false

-- fields
camx,camy=0,0
cursx,cursy=0,0
selected_obj=nil
credits="002335"

path  = "init"
goal  = {x=14, y=2}

--cor=nil
count=0
units={}
object_tiles={}
buildings={}


--p8 functions
--------------------------------

function _init()
 -- enable mouse
 poke(0x5f2d, 1)

 cartdata("pn_picodune") 

 -- starting mode 
 -- (1=normal, 2=build menu, 3=???)
 curr_mode = 1

 -- init the game/title
 --level_init()
 ticks=0

 -- create cursor ui "object" (for collisions)
 cursor = m_obj(0,0,0)
 cursor.get_hitbox=function(self)
   return {
    x=self.x+camx+2,
    y=self.y+camy+1,
    w=0,
    h=0
   }
  end
cursor.draw=function(self)   
  spr((selected_obj and (selected_obj.type==1)) and 146 or self.spr, 
   self.x, self.y, self.w/8, self.h/8)
 end

 -- add test buldings
 local windfarm=m_obj(12*8,2*8, 2, 66, 2,2)
 windfarm.spr_icon=138
 add(buildings,windfarm)
 --
 local refinary=m_obj(9*8,5*8, 2, 68, 3,2)
 refinary.spr_icon=140
 add(buildings,refinary)
 --
 local constyard=m_obj(10*8,7*8, 2, 64, 2,2)
 constyard.spr_icon=142
 constyard.health=50
 add(buildings,constyard)

 -- add test units
 local unit = m_obj(7*8, 5*8, 1, 130)
 unit.r=0
 add(units,unit)
 --
 local unit = m_obj(7*8, 3*8, 1, 129)
 unit.r=0.25
 add(units,unit)
 --
 unit = m_obj(9*8, 3*8, 1, 131)
 unit.r=0.5
 add(units,unit)
 
 
end



function _update60()  --game_update

 update_level()
 
 -- update positions of pathfinding "blocker" objects
 if (t()%1==0) update_obj_tiles()
end

 --
 -- game over mode
 --
 -- if curr_mode==gameover_mode then
 --  -- wait for player to skip stats
 --  if btnp"5" 
 --   and screen_cooldown <=0 then

 --   sfx(-1,2) -- stop sfx
 --   curr_mode=game_mode
 --   level_init()
 --  end
 -- 

function _draw()
 -- draw the map, objects - everything except ui
 draw_level()
 -- draw score, mouse, etc.
 draw_ui()
  
  --printh("cpu: "..flr(stat(1)*100).."% mem: "..(flr(stat(0)/2048*100)).."% fps: "..stat(7))--,2,109,8,0)
  if (debug_mode) printo("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)

end


-- init related
--------------------------------
function level_init()
 -- todo: parse map data into objects
end


-- update related
--------------------------------

function update_obj_tiles()
 printh("update_obj_tiles()...")
 object_tiles={}
 -- clear the tiles
 -- (The pico-8 map is a 128x32 (or 128x64 using shared space))
 -- for x=0,127 do
 --  object_tiles[x]={}
 --  for y=0,127 do
 --   object_tiles[x][y]=0
 --  end
 -- end
 for _,unit in pairs(units) do  
  object_tiles[flr(unit.x/8)..","..flr(unit.y/8)]=1
 end
end

function update_level()
 
 -- player input
 
 -- mouse control
 mouse_x = stat(32)
 mouse_y = stat(33)
 mouse_btn = stat(34)
 mouse_clicked = (mouse_btn>0 and last_mouse_btn != mouse_btn)
 if (mouse_x != last_mouse_x) cursx = mid(0,mouse_x,127) -- mouse xpos
 if (mouse_y != last_mouse_y) cursy = mid(0,mouse_y,127) -- mouse ypos

 -- update cursor pos
 cursor.x = cursx
 cursor.y = cursy

 --
 -- game mode
 --

 -- auto-scroll (pan) map
 if (cursx<8) camx-=2
 if (cursx>119) camx+=2
 if (cursy<8) camy-=2
 if (cursy>119) camy+=2

 -- lock cam to map
 camx=mid(camx,896)
 camy=mid(camy,128)

 --printh("cam="..camx..","..camy)


 update_coroutines()
 --update_pathfinding()

 -- p1:update()
 -- sound_monitor:update()
 collisions()
 -- curr_level:update()
 -- update_snow()
 -- cam:update()

  ticks+=1
  last_mouse_btn = mouse_btn
  last_selected_obj = selected_obj
end

function move_unit_pos(unit,x,y)
  unit.path="init"
  -- mouse  
    
  -- check target valid
  if fget(mget(x,y), 0) 
   or object_tiles[x..","..y] then
   -- abort as target invalid
   printh("aborting pathfinding - invalid target")
   return
  end


  --printh("goal="..goal.x..","..goal.y)

  -- create co-routine to find path (over number of cycles)  
  unit.tx = x
  unit.ty = y
  -- 0=idle, 1=pathfinding, 2=moving, 3=attacking, 4=guarding?
  unit.prev_state = unit.state
  unit.state = 1
  unit.cor = cocreate(findpath_cor)
end

function update_coroutines()
 -- update all unit coroutines (pathfinding, moving, attacking, etc.)
 for _,unit in pairs(units) do 
  if unit.cor and costatus(unit.cor) != 'dead' then
   assert(coresume(unit.cor, unit))
  else
    unit.cor = nil
  end
 end
end

-- function update_pathfinding()
--  if cor and costatus(cor) != 'dead' then
--    coresume(cor)
--  else
--    cor = nil
--  end
-- end

-- draw related
--------------------------------
function draw_level()
 -- draw the map, objects - everything except ui
	cls"15"
 --draw_sand?()
 
 camera(camx,camy)
 
 palt()
 --p1:draw()
 pal()

 -- temp fudge
 palt(0,false) 
 palt(11,true)
 
 map(0,0)

 -- debug pathfinding
 --if (debug_mode) draw_pathfinding()

 if path != nil and path != "init" then
  spr(144, path[1].x*8, path[1].y*8)
 end

 -- buildings
 for _,building in pairs(buildings) do 
  building:draw()  
  --if (debug_mode) draw_hitbox(unit)
  -- draw selected reticule
  if (building == selected_obj) then 
   rect(selected_obj.x, selected_obj.y, 
        selected_obj.x+selected_obj.w, selected_obj.y+selected_obj.h, 
        7)
  end
 end
 -- draw units
 palt(11,true)
 for _,unit in pairs(units) do 
  unit:draw()  
  --if (debug_mode) draw_hitbox(unit)
  -- draw selected reticule
  if (unit == selected_obj) then   
   spr(145, selected_obj.x, selected_obj.y)
  end
 end

end



function draw_ui()
 -- ui (score, mouse, etc.)
 camera(0,0)
 pal()
 -- selected objects?
 palt(0,false)
 if selected_obj and selected_obj.type==2 then
  selected_obj:draw(110,20,true)  
 end
 
 -- score
 printo(credits, 103,2, 7)
 
 palt(11,true)
 cursor:draw()
 --spr(0,cursx,cursy)
end

-- function draw_pathfinding()
--  -- debug pathfinding 
--  if path != nil and path != "init" then
--   draw_path(path, 1, 1)
--   draw_path(path, 0, 12)
--  end
-- end

-- function draw_path(path, dy, clr)
--  local p = path[1]
--  for i = 2, #path do
--   local n = path[i]
--    line(p.x * 8 + 4 + dy - camx, p.y * 8 + 4 + dy - camy, n.x * 8 + 4 + dy - camx, n.y * 8 + 4 + dy - camy, clr)
--   p = n
--  end
-- end


-- game flow / collisions
--------------------------------



-- check all collisions
function collisions()
 
 local clickedsomething=false
 -- check cursor/ui collisions
 
 -- unit collisions
 for _,unit in pairs(units) do 
  -- hover
  unit.hover = collide(cursor, unit)
  if mouse_btn==1 and unit.hover then
   selected_obj = unit
   if (mouse_clicked) clickedsomething=true
  end
 end

 -- building collisions 
 for _,building in pairs(buildings) do 
  -- hover
  building.hover = collide(cursor, building)
  if mouse_btn==1 and building.hover then
   selected_obj = building
   if (mouse_clicked) clickedsomething=true
  end
 end

 -- deselect?
 if (mouse_clicked) 
 and not clickedsomething 
  then
   -- do we have a unit selected?
   if selected_obj then
    move_unit_pos(selected_obj, flr((camx+cursx)/8), flr((camy+cursy)/8))
   end
  selected_obj=nil
 end 

 -- (objects)
 -- for k,obj in pairs(curr_level.objects) do
 --  --for obj in all(curr_level.objects) do
 --   -- all objects
 --   collide(p1,obj)
 
 --   -- (camera cones)
 --   if obj.type==type_camera then
 --    obj:check_cone()
 --   end
 -- end
 
 -- -- check ball > dog/wall collisions
 -- --for k,ball in pairs(curr_level.balls) do
 --  for k,ball in pairs(curr_level.balls) do
 --   --for ball in all(curr_level.balls) do
 --    for k,obj in pairs(curr_level.objects) do
 --    --for obj in all(curr_level.objects) do
 --     if obj.type==type_dog then
 --      collide(ball,obj)
 --     end
 --    end
 --   end
  
 --   -- check item_obj collisions
 --   if p1.item_obj then
 --    for k,obj in pairs(curr_level.objects) do
 --    --for obj in all(curr_level.objects) do
 --     -- all objects
 --     collide(p1.item_obj,obj)
 --    end
 --   end
end



function collide_event(o1, o2)
 
 -- player collisions
 -- if o1.type==type_player then
  
 --  -- player touching laser?
 --  if (o2.type==type_laser 
 --   or (o2.type==type_pressure_pad and p1.grounded))
 --   and not o2.triggered 
 --   and not o2.done then
 --   -- trigger alarm
 --   sfx(63,2) --alarm
 --   o2.triggered=true
 --   o2.alarm_cooldown=100
 --   -- noise
 --   sound_monitor:add_noise(40)

 --  -- player on stairs?
 --  elseif o2.type==type_stairs then
 --   o1.close_object=o2
  
 --  -- player in front of present drop?
 --  elseif o2.type==type_present_drop 
 --   and not o2.done then
 --   o1.close_object=o2

 --  end

 -- -- ball collisions
 -- elseif o1.type==type_ball then
 --  if o2.type==type_dog then
 --   --ball collided with dog
 --   o2.done=true
 --   o2.state=4
 --   -- kill ball
 --   del(curr_level.objects,o1)
 --   del(curr_level.balls,o1)
 --  end
 
 -- --snow spray collisions
 -- elseif o1.type==type_snowspray then
 --  if o2.type==type_camera
 --   and p1.flipx==(o2.spr==49) then
 --   o2.done=true
 --  end

 -- --snow globe collisions
 -- elseif o1.type==type_snowglobe then
 --  if o2.type==type_laser 
 --   and (o2.spr==23 or o2.spr==26)
 --   and not o2.done then
 --   o2:deactivate()
 --   sfx(55,3)
 --  end

 -- end

end



-- object shared methods
--------------------------------
function _set_anim(self,anim)
 if(anim==self.curanim)return--early out.
 local a=self.anims[anim]
 self.animtick=a.ticks--ticks count down.
 self.curanim=anim
 self.curframe=1
end

function _update_anim(self)
--anim tick
 self.animtick-=1
 if self.animtick<=0 then
  self.curframe+=1
  local a=self.anims[self.curanim]
  self.animtick=a.ticks--reset timer
  if self.curframe>#a.frames then
   self.curframe=1--loop
  end
  -- store the spr frame
  self.spr=a.frames[self.curframe]
  
 end
end

--other helper functions
--------------------------------

--print string with outline.
function printo(str,startx,
 starty,col,
 col_bg)
 for xx = -1, 1 do
 for yy = -1, 1 do
 print(str, startx+xx, starty+yy, col_bg)
 end
 end
 print(str,startx,starty,col)
end

function m_obj(x,y,type,sprnum,w,h)
 return {
  x=x,
  y=y,
  z=1, -- defaults
  w=(w or 1)*8, -- pixel dimensions
  h=(h or 1)*8, --
  type=type, -- 1=unit, 2=building, 3=worm
  spr=sprnum,  
  ai=false,
  spr_w=w or 1, -- defaults
  spr_h=h or 1, --
  health=100,

  get_hitbox=function(self)
   return {
    x=self.x,
    y=self.y,
    w=self.w-1,
    h=self.h-1
   }
  end,
  draw=function(self, x,y, icon_mode)    
    -- icon mode?
    if icon_mode then
     rectfill(x-1,y-1,x+16,y+18,0)
     spr(self.spr_icon, x, y, 2, 2)  
     -- draw health
     rectfill(x,y+16,x+(15*self.health/100),y+17,11)

    -- rotating obj?
    elseif self.r then
     rspr(self.spr%16*8,flr(self.spr/16)*8, self.x, self.y, .25-self.r, 1, 11)      
    -- norm sprite
    else
     spr(self.spr, self.x, self.y, self.w/8, self.h/8)
    end
  end
 }
end

function collide(o1, o2)
 local hb1=o1:get_hitbox()
 local hb2=o2:get_hitbox()
 
 if hb1.x < hb2.x + hb2.w and
  hb1.x + hb1.w > hb2.x and
  hb1.y < hb2.y + hb2.h and
  hb1.y + hb1.h >hb2.y 
 then
  return true
  --collide_event(o1, o2)
 else
  return false
 end
end

function draw_hitbox(obj)
 --reset_draw_pal()
 local hb=obj:get_hitbox()
 rect(hb.x,hb.y,hb.x+hb.w,hb.y+hb.h,obj.hover and 11 or 8)
 --rect(hb.x,hb.y,hb.x+hb.w,hb.y+hb.h,selected_obj==obj and 7 or obj.hover and 11 or 8)
 --set_goggle_pal()
end

function alternate()
 return flr(t())%2==0
end


-- rotate sprite
-- by freds72
-- https://www.lexaloffle.com/bbs/?pid=52525#p52541
local rspr_clear_col=0

function rspr(sx,sy,x,y,a,w,trans)
	local ca,sa=cos(a),sin(a)
	local srcx,srcy,addr,pixel_pair
	local ddx0,ddy0=ca,sa
	local mask=shl(0xfff8,(w-1))
	w*=4
	ca*=w-0.5
	sa*=w-0.5
	local dx0,dy0=sa-ca+w,-ca-sa+w
	w=2*w-1
	for ix=0,w do
		srcx,srcy=dx0,dy0
		for iy=0,w do
			if band(bor(srcx,srcy),mask)==0 then
				local c=sget(sx+srcx,sy+srcy)
				if (c!=trans) pset(x+ix,y+iy,c)
			--else
				--pset(x+ix,y+iy,rspr_clear_col)
			end
			srcx-=ddy0
			srcy+=ddx0
		end
		dx0+=ddx0
		dy0+=ddy0
	end
end


--
-- pathfinding-related
--

-- func for co-routine call
function findpath_cor(unit)
 -- start = {
 --  x = unit.x/8, 
 --  y = unit.y/8
 -- }
 unit.path = find_path(
                   { x = flr(unit.x/8), y = flr(unit.y/8) },
                   { x = unit.tx, y = unit.ty},
                   manhattan_distance,
                   flag_cost,
                   map_neighbors,
                   function (node) return shl(node.y, 8) + node.x end,
                   nil)  
 
 -- todo: check path valid???

 -- now auto-move to path 
 -- 0=idle, 1=pathfinding, 2=moving, 3=attacking, 4=guarding?
 unit.prev_state = unit.state
 unit.state = 2
 unit.cor = cocreate(movepath_cor)
end
 
function movepath_cor(unit)
 printh("-------------")
 -- loop all path nodes...
 for i=#unit.path-1,1,-1 do
  local node=unit.path[i]
  -- rotate to angle   
  local dx=unit.x-(node.x*8)
  local dy=unit.y-(node.y*8)
  local a=atan2(dx,dy)
  printh("  >> target angle="..a)
  while (unit.r != a) do
   turntowardtarget(unit, a)
  end
  
  -- move to new position
  local scaled_speed = 1
  local distance = sqrt((node.x*8 - unit.x) ^ 2 + (node.y*8 - unit.y) ^ 2)
  local step_x = scaled_speed * (node.x*8 - unit.x) / distance
  local step_y = scaled_speed * (node.y*8 - unit.y) / distance 
  for i = 0, distance/scaled_speed-1 do
   unit.x+=step_x
   unit.y+=step_y
   yield()
  end
  unit.x,unit.y = node.x*8, node.y*8
 end

 -- arrived?

 -- todo: set map/path data that tile is now occupied
end


-- rotate to next path node
-- function rotatetoangle_cor()
--  -- get next node pos
--  local node=path[i]
--  turntowardtarget(unit, targetangle)
--  --cor = cocreate(movepath_cor)
-- end

pi = 3.14159
turnspeed = .5 * (pi/180)


function turntowardtarget(unit, targetangle)
   diff = targetangle-unit.r
   printh("unit.r="..unit.r)
   printh("targetangle="..targetangle)
   printh("diff="..diff)
   printh("turnspeed="..turnspeed)
   printh("-")
   
   -- never turn more than 180
   if diff > 0.5 then
    printh("big angle 1")
    diff -= 1
   elseif diff < -0.5 then
    printh("big angle 2")
    diff += 1
   end

   -- fake delay
   -- for sleep=1,20 do
   --  yield()
   -- end

   if diff > turnspeed then
    unit.r += turnspeed
   elseif diff < -turnspeed then
    unit.r -= turnspeed
   else
    -- we're already very close
    unit.r = targetangle
   end

   -- make sure that our rotation value always stays within a "one-cycle" range
   if (unit.r > pi) unit.r-=2*pi
   if (unit.r < -pi) unit.r+=2*pi
   
   -- fake delay
   --for sleep=1,20 do
    yield()
   --end
end





-- makes the cost of entering a
-- node 4 if flag 1 is set on
-- that map square and zero
-- otherwise
-- unless the new node is a 
-- diagonal, in which case
-- make it cost a bit more
function flag_cost(from, node, graph)
 -- get the standard cost of the tile (grass vs. mud/water)
 local base_cost = fget(mget(node.x, node.y), 1) and 4 or 1
 -- make diagonals cost a little more than normal tiles
 -- (this helps negate "wiggling" in close quarters)
 if (from.x != node.x and from.y != node.y) return base_cost+1
 return base_cost
end


-- returns any neighbor map
-- position at which flag zero
-- is unset
function map_neighbors(node, graph)
 local neighbors = {}
 for xx = -1, 1 do
  for yy = -1, 1 do
   if (xx!=0 or yy!=0) maybe_add(node.x+xx, node.y+yy, neighbors)
  end
 end return neighbors
end

-- maybe adds the node to neighbors table
-- (if flag zero is unset at this position)
function maybe_add(nx, ny, ntable)
 printh("testing:"..nx..","..ny)
 if (
  not fget(mget(nx,ny), 0) 
  and object_tiles[nx..","..ny]==nil
 )

  -- todo:: parse entire map into chunks of higher-level connected regions
  --        - each chunk represents 16x16 tiles
  --        - just need to check that there is a connection
  --        - then use a* on the higher level to traverse longer than 1-screen
  --        - use normal/detailed a* when traversing within each chunk 
  --          (series of paths, joining a complete journey)

  -- (tried capping max path, still uses a lot of cpu)
  -- and nx>start.x-8 and nx<start.x+8
  -- and ny>start.y-8 and ny<start.y+8

  then 
   add(ntable, {x=nx, y=ny}) 
 end
 printh("test passed.")
end

-- estimates the cost from a to
-- b by assuming that the graph
-- is a regular grid and all
-- steps cost 1.
function manhattan_distance(a, b)
 return abs(a.x - b.x) + abs(a.y - b.y)
end


-- pathfinder
-- by @casualeffects

-- i minimized the number of
-- tokens as far as possible
-- without hurting readability
-- or performance. you can save
-- another four tokens and a
-- lot of characters by
-- minifying if you don't care
-- about reading the code.

-- returns the shortest path, in
-- reverse order, or nil if the
-- goal is unreachable.
--
-- from the graphics codex
-- http://graphicscodex.com
function find_path
 (start,
  goal,
  estimate,
  edge_cost,
  neighbors, 
  node_to_id, 
  graph)
  
  -- the final step in the
  -- current shortest path
  local shortest, 
  -- maps each node to the step
  -- on the best known path to
  -- that node
  best_table = {
   last = start,
   cost_from_start = 0,
   cost_to_goal = estimate(start, goal, graph)
  }, {}
 
  best_table[node_to_id(start, graph)] = shortest
 
  -- array of frontier paths each
  -- represented by their last
  -- step, used as a priority
  -- queue. elements past
  -- frontier_len are ignored
  local frontier, frontier_len, goal_id, max_number = {shortest}, 1, node_to_id(goal, graph), 32767.99
 
  -- while there are frontier paths
  while frontier_len > 0 do
 
   -- find and extract the shortest path
   local cost, index_of_min = max_number
   for i = 1, frontier_len do
    local temp = frontier[i].cost_from_start + frontier[i].cost_to_goal
    if (temp <= cost) index_of_min,cost = i,temp
   end
  
   -- efficiently remove the path 
   -- with min_index from the
   -- frontier path set
   shortest = frontier[index_of_min]
   frontier[index_of_min], shortest.dead = frontier[frontier_len], true
   frontier_len -= 1
 
   -- last node on the currently
   -- shortest path
   local p = shortest.last
   
   if node_to_id(p, graph) == goal_id then
    -- we're done.  generate the
    -- path to the goal by
    -- retracing steps. reuse
    -- 'p' as the path
    p = {goal}
 
    while shortest.prev do
     shortest = best_table[node_to_id(shortest.prev, graph)]
     add(p, shortest.last)
    end
 
    -- we've found the shortest path
    return p
   end -- if
 
   -- consider each neighbor n of
   -- p which is still in the
   -- frontier queue
   for n in all(neighbors(p, graph)) do
    -- find the current-best
    -- known way to n (or
    -- create it, if there isn't
    -- one)
    local id = node_to_id(n, graph)
    local old_best, new_cost_from_start =
     best_table[id],
     shortest.cost_from_start + edge_cost(p, n, graph)
    
    if not old_best then
     -- create an expensive
     -- dummy path step whose
     -- cost_from_start will
     -- immediately be
     -- overwritten
     old_best = {
      last = n,
      cost_from_start = max_number,
      cost_to_goal = estimate(n, goal, graph)
     }
 
     -- insert into queue
     frontier_len += 1
     frontier[frontier_len], best_table[id] = old_best, old_best
    end -- if old_best was nil
 
    -- have we discovered a new
    -- best way to n?
    if not old_best.dead and old_best.cost_from_start > new_cost_from_start then
     -- update the step at this
     -- node
     old_best.cost_from_start, old_best.prev = new_cost_from_start, p
    end -- if
   end -- for each neighbor
   
   count+=1
   if count>10 then
    count=1
    yield()
   end
   --count%=100
   --yield()

  end -- while frontier not empty
 
  -- unreachable, so implicitly
  -- return nil
 end
 








__gfx__
bbbbbbbbfffffffff5d555d555d555d55d555d5fffffffff1d515555ffffffff99f99999ffffffffffffffff9f99f9f9ff9f999955d555d555d555d555d555d5
bb11bbbbfff77fff1555515d15555155d51555515dfffd5f5155d55dffff9fff9f9999f9fff9fffffffffffff99f99f999f99899155551551555515515555155
bb171bbbff79ff7f5d55d5515d55d555155d55d5d5155551555d5155ffff999999ff99999999ffffffffffff9f99f99f9f9989f95d55d55555dddd555d55d555
bb1771bbf79f779f55515d5555515d5d55d51555155d55d5d5555d55fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899555155dddd4444ddddd15d5d
bb17771bfff799ffd55d5555d55555555555d55d55d5155555d155d5fffff9f9fff999999f9fffffff99f999f9ffff9f99998f99d555dd444444444444445555
bb177771ff799fff55d551d555d515555d155d555555d55d15555555ffff999999999f999999ffff999f99f9fffffffffff8999955d5d4444444444444444555
bb17711bff79ffff1555555515555515555555515d155d55f51ffd5ffff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99155d44444444444444444415
bbb11bbbf7fffffff55d5515555d55555155d55f55555551ffffffffffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9555d44444444444444444455
ddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055dd444444444444444444d5
d5555555d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444455
d5555555d5015515ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000005dd444444444444444444445
d5555555d5105555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d44444444444444444444d
d5555555d5555111ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000d5d444444444444444444445
d5555555d1555101ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d444444444444444444445
d5555555d5555111ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444415
d5555555d5515555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555d44444444444444444455
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055dd444444444444444444d5
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155044444444444444444055
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000005d5104444444444444444155
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555114444444444444440d5d
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000d55510044444444444401555
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d515100044444000015555
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155555151100000111155515
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555d555555111115555d5555
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
d66dddddddd6fffdddd776ddddddddddddddddddddd666dddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
76665555551ffff1d576dc65d5577655d5555555d5766665d5555555000000000000000000000000000000000000000000000000000000000000000000000000
76665805555f4441d76dccc5d576dc65d5556555d5766665d5888885000000000000000000000000000000000000000000000000000000000000000000000000
177d22055d5ffff1d66d11c5d76dccc5d5576655d5677725d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d1d55505555f1011d66d01c5d66d11c5d55d7d55d566dd25d5522255000000000000000000000000000000000000000000000000000000000000000000000000
6555550515df1001d66d0c55d66d01c5d55ddd55d566dd25d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d6d6d55555551005d56dd555d66d0c55d555d555d556dd55d5552555000000000000000000000000000000000000000000000000000000000000000000000000
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5522255000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd55d555d5ddddd776ddddddddddd666dddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
d555555515555155d55576dc65555555d5766665d5555555d5522255000000000000000000000000000000000000000000000000000000000000000000000000
d555555a5d55d555d5576dccc5558055d5766665d5556555d5552555000000000000000000000000000000000000000000000000000000000000000000000000
d5aaa99a55515d5dd5566d11c5522055d5677725d5576655d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d5aaa55ad5555555d5566d01c5555055d566dd25d55d7d55d5522255000000000000000000000000000000000000000000000000000000000000000000000000
d5a1199a55d51555d5566d0cd5555055d566dd25d55ddd55d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d544445a15555515d5556dd5d5555555d556dd55d555d555d5888885000000000000000000000000000000000000000000000000000000000000000000000000
d5151515555d5555d5555555d5555555d5555555d5555555d5555555000000000000000000000000000000000000000000000000000000000000000000000000
77777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbb22bbbbb8dd8bb62ddd26bb28882bb000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccc0cc
bb2882bbb8d66d8b6d666d6b2828282b000000000000000000000000000000000000000000000000ccccccccccccccccc71dcccc1c0c1cc7ccccccccccccc0cc
b522225bb8d66d8b6d666d6b2868682b000000000000000000000000000000000000000000000000ccccc677ddcccccc5666ccccc101c7d7cccccccccccccdcc
b028820bb8d66d8b68d6d86b2262622b000000000000000000000000000000000000000000000000cccc67111dcccccc11116666dc0157d7ccccccccccccccdc
bb2882bbb856658b6886886b2808082b000000000000000000000000000000000000000000000000ccc6660dd1dccccc6d1d1111666657579acc5a9cccccc55c
b522225bb886688b6226226b2888882b000000000000000000000000000000000000000000000000ccd6650001dccc7776d76d1c11111110575c599aa9cccccc
b002200bb220022b50b0b05b00bbb00b000000000000000000000000000000000000000000000000cdddd055d1dcc6666d1dd11cc56505555d759999999999cc
bbbbbbbbb00bb00bbbbbbbbbbbbbbbbb00000000000000000000000000000000000000000000000095ddd00001d9dddd6d1d6d1ccd7d0d6d9511aaaaaa999ccc
bbb8bbbbb7bbbb7bbbb1bbbbbb7bb7bbbbb7bbbb77711777000000000000000000000000000000001d5dd055501d5ddd6d1d6d1ddd7d0d7d90011aaaaaaa1515
bb828bbb77bbbb77bb171bbbb7bbbb7bbb767bbb7bbbbbb70000000000000000000000000000000001d55000001d55556d1d4d994994549950d01aa6aaaa1515
b8bbb8bbbbbbbbbbb1bbb1bb7b7bb7b7b7bbb7bb7bbbbbb70000000000000000000000000000000050155ddddddd66666d199999996666665010156666666444
82b8b28bbbbbbbbb17b1b71bbbbbbbbb76b7b67b1bbbbbb100000000000000000000000000000000666666666666666699999999667767674500555667444445
b8bbb8bbbbbbbbbbb1bbb1bbbbbbbbbbb7bbb7bb1bbbbbb100000000000000000000000000000000666666665555555549999967777777765444544444445444
bb828bbbbbbbbbbbbb171bbb7b7bb7b7bb767bbb7bbbbbb700000000000000000000000000000000555555559999f99999446776677676984554444544544454
bbb8bbbb77bbbb77bbb1bbbbb7bbbb7bbbb7bbbb7bbbbbb7000000000000000000000000000000009f9999f9999999f999777777776798875444554455454544
bbbbbbbbb7bbbb7bbbbbbbbbbb7bb7bbbbbbbbbb777117770000000000000000000000000000000099fffffff9f9999947777766779889774554545545555445
0000000077611677000000000000000000000000bb7bb7bb00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007bbbbbb7000000000000000000000000b7dbbd7b00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006bbbbbb60000000000000000000000007d7bb7d700000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001bbbbbb1000000000000000000000000dbdbbdbd00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001bbbbbb1000000000000000000000000bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006bbbbbb60000000000000000000000007b7bb7b700000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007bbbbbb7000000000000000000000000d7bbbb7d00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077611677000000000000000000000000bd7bb7db00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffffff77ffffff9fff999f9fff999fffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000fffffffffff79ff7ffff9999ffff9999ffffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffff79f779fff99f9f99f99f9f99ffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ffffffffffff799ffffff9f999fff9f999ffffff00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000fffffffffff799ffffff9999ff9f9999999ff99900000000000000000000000000000000
7fffffffddd776ddddd776ddffffffffddddddddddd666ddddddddddfff22ffffff79ffffff99f9f99f9999999999fff00000000000000000000000000000000
9fffffffd576dc65d576dc65ffffffffd5555555d5766665d5555555ff2882ffff7fffffffff99f99f9999999999f99f00000000000000000000000000000000
ffffffffd76dccc5d76dccc5ffffffffd5556555d5766665d5888885f522225fffffffffffff99ff99ff9999999f999f00000000000000000000000000000000
ffffffffd66d11c5d66d11c5ffffffffd5576655d5677725d5555555f028820fffff9fff999f9fff999799999999999900000000000000000000000000000000
ffffffffd66d01c5d66d01c5ffffffffd55d7d55d566dd25d5522255ff2882ffffff9999ffff9999fff799999999999900000000000000000000000000000000
ffffffffd66d0c55d66d0c55ffffffffd55ddd55d566dd25d5555555f522225ffff99f9f99f99f9f99799f999999999900000000000000000000000000000000
ffffffffd56dd555d56dd555ffffffffd555d555d556dd55d5552555f002200ffffff9f999fff9f999fff9f99999999900000000000000000000000000000000
ffffffffd5555555d5555555ffffffffd5555555d5555555d5522255ffffffffffff9999f79f9999ff9f99999999999900000000000000000000000000000000
f5dfffd5ddd776ddddddddddddddddddddd666dddddddddddddddddd5dfffd5ffff99f9799f99f9f99f9999999f9999900000000000000000000000000000000
1555515dd576dc65d5555555d5555555d5766665d5555555d5522255d5155551ffff99799f999999999999999999999900000000000000000000000000000000
5d55d551d76dccc5d5558055d5555555d5766665d5556555d5552555155d55d5ffff9979997f99f9999f9999999f999900000000000000000000000000000000
55515d55d66d11c5d5522055d5555555d5677725d5576655d555555555d51555fffff79f779f99ff99ff99999999999900000000000000000000000000000000
d55d5555d66d01c5d5555055d5555555d566dd25d55d7d55d55222555555d55dfffffff799ff9fff999999999999999f00000000000000000000000000000000
55d551d5d66d0c55d5555055d5555555d566dd25d55ddd55d55555555d155d55ffffff799fff9999ffff99999999999900000000000000000000000000000000
15555555d56dd555d5555555d5555555d556dd55d555d555d588888555555551ffffff79fff99f9f99f999999999999900000000000000000000000000000000
ff5dff15d5555555d5555555d5555555d5555555d5555555d555555551ffd5fffffff7fffffff9f999fff9f99999999900000000000000000000000000000000
fffffffffffffffffd5155551d5155551d5155551d51555515155551ffffffffffffffffffff9999ff9f99999999999900000000000000000000000000000000
fffffffffffffffff155d55d5155d55d5155d55d5155d55d555d55d5fffffffffffffffffff99f9f99f99f9f99f9999900000000000000000000000000000000
fffffffffffffffff55d5155555d5155555d5155555d515555d51555ffffffffffffffffffff99f99f9f99f99f99999900000000000000000000000000000000
fffffffffffffffff5555d55d5555d55d5555d55d5555d55d555d55dffffffffffffffffffff99ff99ff99ff99ff999900000000000000000000000000000000
9ffffffffffffffff5d155d555d155d555d155d555d155d55d155d55ffffffffffffffffffffffffffff9fff9999999900000000000000000000000000000000
fffffffffffffffff555555515555555155555551555555515555551ffffffffffffffffffffffffffff9999fff9f99f00000000000000000000000000000000
99fffffffffffffff51ffd5ff51ffd5f551fdd5ff51ffd5f51ffd5ffffffffffffffffffffffffffffffffffffff99f900000000000000000000000000000000
99fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff99f00000000000000000000000000000000
__label__
99f99999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
9f9999f9fff9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99ff99999999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f99f9f99fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fff999999f9fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f999999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99fff9f9f9f99fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ff9f99999f99ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99f9999999f99999fffffffff5d555d5ffffffffffffffffffffffff5d555d5fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
9f9999f99f9999f9fff9ffff1555515dffffffffffffffffffffffffd5155551ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99ff999999ff99999999ffff5d55d551ffffffffffffffffffffffff155d55d5ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f9999999f99f9f99fff55515d55ffffffffffffffffffffffff55d51555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fff99999fff999999f9fffffd55d5555ffffffffffffffffffffffff5555d55dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f9999999f999999ffff55d551d5ffffffffffffffffffffffff5d155d55ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99fff9f999fff9f9f9f99fff15555555ffffffffffffffffffffffff55555551f11fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ff9f9999ff9f99999f99fffff55d5515ffffffffffffffffffffffff5155d55ff171ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99f9999999f99999ff9f9999fffffffffffffffffffffffffffffffffffffffff1771fffffffffffffffffffffffffffddd776ddddddddddffffffffffffffff
9f9999f99f9999f999f99899fffffffffffffffffff9fffffffffffffffffffff17771ffffffffffffffffffffffffffd576dc65d5577655ffffffffffffffff
99ff999999ff99999f9989f9ffffffffffffffff9999fffffffffffffffffffff177771fffffffffffffffffffffffffd76dccc5d576dc65ffffffffffffffff
99999f9999999f9999f88899f9ffff9ff9ffff9ff9f99ffffffffffffffffffff17711ffffffffffffffffffffffffffd66d11c5d76dccc5ffffffffffffffff
fff99999fff9999999998f99ff99f999ff99f9999f9fffffffffffffffffffffff11ffffffffffffffffffffffffffffd66d01c5d66d11c5ffffffffffffffff
99999f9999999f99fff89999999f99f9999f99f99999ffffffffffffffffffffffffffffffffffffffffffffffffffffd66d0c55d66d01c5ffffffffffffffff
99fff9f999fff9f999999f999f99f99f9f99f99ff9f99fffffffffffffffffffffffffffffffffffffffffffffffffffd56dd555d66d0c55ffffffffffffffff
ff9f9999ff9f999999fff9f9f99f99f9f99f99f99f99ffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d56dd555ffffffffffffffff
99f9999999f9999999f9999999f999999f99f9f9ffffffffffffffffff8dd8fffffffffff28882ffffffffffffffffffddddd776ddddddddffffffffffffffff
9f9999f99f9999f99f9999f99f9999f9f99f99f9fffffffffffffffff8d66d8fffffffff2828282fffffffffffffffffd55576dc65555555ffffffffffffffff
99ff999999ff999999ff999999ff99999f99f99ffffffffffffffffff8d66d8fffffffff2868682fffffffffffffffffd5576dccc5558055ffffffffffffffff
99999f9999999f9999999f9999999f99999f9999fffffffffffffffff8d66d8fffffffff2262622fffffffffffffffffd5566d11c5522055ffffffffffffffff
fff99999fff99999fff99999fff99999f9ffff9ffffffffffffffffff856658fffffffff2808082fffffffffffffffffd5566d01c5555055ffffffffffffffff
99999f9999999f9999999f9999999f99fffffffffffffffffffffffff886688fffffffff2888882fffffffffffffffffd5566d0cd5555055ffffffffffffffff
99fff9f999fff9f999fff9f999fff9f9fffffffffffffffffffffffff220022fffffffff00fff00fffffffffffffffffd5556dd5d5555555ffffffffffffffff
ff9f9999ff9f9999ff9f9999ff9f9999fffffffffffffffffffffffff00ff00fffffffffffffffffffffffffffffffffd5555555d5555555ffffffffffffffff
99f999999f99f9f99f99f9f9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d5f5d555d5fffffffffffffffffffffffff
9f9999f9f99f99f9f99f99f9fffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffd5155551d5155551ffffffffffffffffffffffff
99ff99999f99f99f9f99f99fffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffff155d55d5155d55d5ffffffffffffffffffffffff
99999f99999f9999999f9999fffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffff55d5155555d51555ffffffffffffffffffffffff
fff99999f9ffff9ff9ffff9ffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffff5555d55d5555d55dffffffffffffffffffffffff
99999f99ffffffffffffffffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffff5d155d555d155d55ffffffffffffffffffffffff
99fff9f9ffffffffffffffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffff5555555155555551ffffffffffffffffffffffff
ff9f9999fffffffffffffffffffffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffff5155d55f5155d55fffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffff5666666ffffffffddddddddddd666ddddddddddffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff77ffffff77ffffffffffffffffffff0288dd2ffffffffd5555555d5766665d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ff7fff79ff7fffffffffffffffffff28d66dffffffffd5556555d5766665d5888885ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff79f779ff79f779ffffffffffffffffff066666dffffffffd5576655d5677725d5555555ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff799fffff799ffffffffffffffffffff28d66dffffffffd55d7d55d566dd25d5522255ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff799fffff799ffffffffffffffffffff0288dd2ffffffffd55ddd55d566dd25d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ffffff79fffffffffffffffffffff5666666ffffffffd555d555d556dd55d5552555ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff7fffffff7ffffffffffffffffffffffffffffffffffffffd5555555d5555555d5522255ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d5ddd666ddddddddddddddddddfffffffffff22fffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffff1555515dd5766665d5555555d5522255ffffffffff2882ffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffff5d55d551d5766665d5556555d5552555fffffffff522225fffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffff55515d55d5677725d5576655d5555555fffffffff028820fffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffd55d5555d566dd25d55d7d55d5522255ffffffffff2882ffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffff55d551d5d566dd25d55ddd55d5555555fffffffff522225fffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffff15555555d556dd55d555d555d5888885fffffffff002200fffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7fffffffffffffffffffffffffffffff55d5515d5555555d5555555d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddd66dddddddd6fffdffffffffffffffffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffffffffffffd555555576665555551ffff1ffffffffffffffffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffffffffffffd555555576665805555f4441ffffffffffffffffffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffffffffffffd5555555177d22055d5ffff1ffffffffffffffffffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffffffffffd5555555d1d55505555f1011ffffffffffffffffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffffffffffffd55555556555550515df1001ffffffffffffffffffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffffffffffffd5555555d6d6d55555551005ffffffffffffffffffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7ffffffffffffffffffffffffffffffffffffffd5555555d6d6d555d55d5555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffffffffffffffffffffd555555515555155ffffffffffffffffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffd555555a5d55d555ffffffffffffffffffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffffffffffffffffffffd5aaa99a55515d5dffffffffffffffffffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffffffffffffffffffd5aaa55ad5555555ffffffffffffffffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffffffffffffffffffffd5a1199a55d51555ffffffffffffffffffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffd544445a15555515ffffffffffffffffffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7ffffffffffffffffffffffffffffffffffffffffffffffd5151515555d5555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddddddffffffffffffffffffffffff
fffffffffff77ffffff77ffffffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555dfffd5f5dfffd5fffffffff
ffffffffff79ff7fff79ff7fffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffd5555555d5555555d5155551d5155551ffffffff
fffffffff79f779ff79f779ffffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffffd5555555d5555555155d55d5155d55d5ffffffff
fffffffffff799fffff799fffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d555555555d5155555d51555ffffffff
ffffffffff799fffff799fffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555555d55d5555d55dffffffff
ffffffffff79ffffff79ffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555d155d555d155d55ffffffff
fffffffff7fffffff7fffffffffffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555555555155555551ffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d51d515555ffffffff
fffffffffffffffffffffffffffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d5155d55dffffffff
ffffffffffffffffffffffffffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d551555d5155ffffffff
fffffffffffffffffffffffffffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55515d55d5555d55ffffffff
fffffffffffffffffffffffffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd55d555555d155d5ffffffff
ffffffffffffffffffffffffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d515555555ffffffff
ffffffffffffffffffffffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff15555555f51ffd5fffffffff
fffffffffffffffffffffffffffffffff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff77ffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff79f779ff79f779fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff799fffff799ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff799fffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff7fffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff77ffffff77ffffff77fff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7fff79ff7f
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79f779ff79f779ff79f779f
ff000000000000fffffff0000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799ff
f0088088808080000ffff0880088008080ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fff
f0800080808080080ffff0080008000080ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffffff79ffff
f080f088808080000fffff080f08000800fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7fffffff7fffffff7ffffff
f0800080008080080ffff0080008008000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
f0088080f00880000ff770888088808080f77ffffff77ffffffffffffffffffffffffffffffffffffffffffffff77ffffff77ffffff77ffffff77ffffff77fff
f0000000000000ffff79f000000000000079ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7fff79ff7fff79ff7fff79ff7f
f088808880888000079f70888080809ff79f779ff79f779ffffffffffffffffffffffffffffffffffffffffff79f779ff79f779ff79f779ff79f779ff79f779f
f0888080008880080ff79000800080fffff799fffff799fffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fffff799fffff799ff
f0808088008080000f799088800800ffff799fffff799fffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fffff799fffff799fff
f0808080008080080f79f080008000ffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffffff79ffffff79ffffff79ffff
f08080888080800007fff088808080fff7fffffff7fffffffffffffffffffffffffffffffffffffffffffffff7fffffff7fffffff7fffffff7fffffff7ffffff
f0000000000000fffffff000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
f0888088800880000ff77080f08880fffff77ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff77ffffff77fff
f0800080808000080f79f0800080807fff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7f
f088008880888000079f70888080809ff79f779ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79f779ff79f779f
f0800080000080080ff79080808080fffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799ff
f080f080f08800000f799088808880ffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fff
f000f000f0000fffff79f000000000ffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffff
fffffffff7fffffff7fffffff7fffffff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7fffffff7ffffff

__gff__
0002020202020400000000000001010100010000000000000000000000010101000000000000000000000000000101010000000000000000000000000000000001010101010102000000000000000000010101010101020000000000000000000100000000000000000000000000000000000000000000000000000000000000
0101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0809000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808090213141604000000000000000000000000000001010000000000000000000000000000000000010100000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000
08080c0a0a090000000000001111000000000101010101000000000000000000000000000000000000000101010101010000000000000000000003030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000
080808080b000000000000001111000001010101010100000000000000000000000000000000000000000000000001000000000000000000000303030303030300000000000000000000000000000000000000000000000003030303030303030303000000000001010101000000000000000000000001010000000000000000
080b0b180100000000000004040000000100000000000000000000000001000000000000000000000000000000000000000003030303030303030303030303030303030000000000000000010000000000000000000000030303030d0e0e03030303030300000000010000000000000000000000000000010101000000000000
00000001010000000004040400000000000000000000000000000101010000000000000000000000000000000000000003030303030000000003030303030303030303030000000000000001010101000000000000000003030d0e1e1e1e0f030303030300000000000000000000000000000000000000000001010100000000
00010101010000000204040400800000000205050000000000000100000000000000000000030303000000000000030303030300000000000000030303030303030300000000000000000000000001010000000000000003031d1e1e1e1e1e0e0e0e0e0303000000000000000000000303030303030303000000000100000000
0001010101000000001004040000000005030d0f05000000000101000000000000000000030d0f03000000030303030303000000000000000000030303030303030000000000000000000000000000010000000000000303031d1e2f03030303030303030303001e1e0000010100000000000000000000030303000000000000
00010101010000000000040400000000030d1e1f030000000001000000000000000000000d1e1f0303030303030303000000000000000000000000030303030300000000000d0f000000000000000100000000000000030303031e03030303030303030000000000000000000101000000000000000000000303030000000000
00010100010000000000001010050500032d2e2f030000000000000000000000000000001d1e1f0303030303030303000000000000000000000000000303030000000000001d1f000000000001010100000003000003030303032e2f030303000000000000000000000000000001000000000000000000000303030000000000
0000000001000000000000000002060006030303030000000000000000000001000000001d1e1f0303030303030300000000000000000003030303030303000000000000001d1f000000000101000000000003030003030303030303030303030000000000000000000000000000010000000000000000000303030000000000
0000000101000000000000000000000000060606060000000000000000000001000000001d1e1f0303030303030300000001010000000000030303030303030300000000001d1f000000000100000003000003030303030303030303030303030300000001000000000000000000010100000000000000000303030300000000
0000000000000000000000000000000000000000000000000000000000010101000000001d1e1f0303030303030300000000010100000000000000000003030303000000001d1f000000000000000003030303030303030303030303030303030303000001000000000000000000000101000101010000000303030300000000
0000000000000000000000000001010100000000000000000100000101010000000000001d1e1f0303030303030000000000000101000000000000000000030303000000001d1f000000000000000000030303030303000000000000000000030303000000010100000000000000000000010000000000000003030303000000
0000010101010000000000010101010101010000000000000101010100000000000000001d1e1f03030303030000000000000000010101010101000000000003060000000d1e1f000000000000000003030303030300000000000000000000000303030000000101010300000000000000000000000000000000030303000000
0001010101000000000000000000010101010101000000000000000000000000000000001d1e1f03030303030000000000000000000101010100000000000000060000001d1e2f000000000000000303030303030000000000000000000000000000030000000000000300000000000000000000000000000000000303030000
0000000000000000000000000000000000000000000000000000000000000000000000002d2e2f00000003030300000000000000000000000000000000000000060000001d1f00000000000000000303030303000000010101010101000000000000000000000000000300000000010101010000000000000000000303030300
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000303030000000000000000000000000000000000060000001d1f00000000000003030303000000000000000001010101010100000000000300000000030300000000000101010101010000000000000000030300
00000000000000000000000000020504000000000000000000000000000000000000000000000000000000000000000303000000000000000000000000000000000000001d1f00000000000003030300000000000000000000000101010100000000000303030303030000000000000000000101010100000000000000030300
00000000000000000002050505030304000000000000000000000000000000000000000000000000000000000000000000000006000006000000000000000606000000001d1f00000000000003030000000000000000000000000000000100000000000003030300000000000000000000000000010100000000000000030300
00000000000000000002030d0e0f0303030000000000000000000000000000000000000000000000000000000000000000000000000000000600000600060000000000001d1f00000000000003030000000000000000000000000000000000000000000000000303030300000000000000000000000000000000000000030300
00000000000000000503031d1e1e0e0e0f0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d1f00000000000303000000000000000000000000000000000000000000000003030000000300000000000000000000000000000000000000030303
00000000000000020303032d2e1e1e1e1f0304000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d1f00000000000300000000000000000000000000000000000000000000000003030303030000000000000000000000000000000000000000030303
000000000000000000060303031d1e1e2f0306060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d1f00000000000300000000000000000000000000000000000000000000000003060303060000000000000000000000000000000000000000030303
000000000000000000000002032d2e2f03060000000606000000000000000000000000000000000006060606060600000000000000000000000000000000000000000000001f00000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030300
0000000000000000000000060603030303000000000000060000000000000000000000000000000000000000000606000600060000060006060000000000000000000000002e00000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030300
0000000000000000000000000000000606000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030303
0000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003030300
0000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003030303030000
0000000000000000000000000000000000000000000000000006060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030303030303030303030303030300000000
