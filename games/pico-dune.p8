pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- pico-dune
-- by paul nicholas
-- (with support from my patrons)

-- global flags
debug_mode=true
debug_collision=false

-- modes
title_mode=1     -- title/start screen
instruct_mode=2  -- showing instructions
game_mode=3      -- actual game mode
success_mode=4   -- showing level complete
gameover_mode=5 -- showing game over screen

-- fields
camx,camy=0,0
cursx,cursy=0,0


--p8 functions
--------------------------------

function _init()
 -- enable mouse
 poke(0x5f2d, 1)

 mouse_x = stat(32)-1
 mouse_y = stat(33)-1
 last_mouse_x = mouse_x
 last_mouse_y = mouse_y
 
 -- custom menu
 -- menuitem(1, 'quit to title', function()
 --  reset_game_state()
 --  level_init()
 -- end)
 -- menuitem(2, 'restart level', function()
 --  level_init()
 -- end)

 cartdata("pn_picodune") 

 -- reset game + stats
 --reset_game_state()
 
 -- starting mode 
curr_mode = game_mode

 -- init the game/title
 --level_init()
 ticks=0

end



function _update60()  --game_update

 -- player input

 -- mouse control
 mouse_x = stat(32)-1
 mouse_y = stat(33)-1
 if (mouse_x != last_mouse_x) cursx = mouse_x -- mouse xpos
 if (mouse_y != last_mouse_y) cursy = mouse_y -- mouse ypos

 --
 -- in title/menu/instructions mode?
 --
 if curr_mode==title_mode 
 or curr_mode==instruct_mode then
  -- only update title-related stuff
  
 end

 --
 -- game mode
 --
 if curr_mode==game_mode then
  ticks+=1

  -- auto-scroll (pan) map
  if (cursx<8) camx-=2
  if (cursx>119) camx+=2
  if (cursy<8) camy-=2
  if (cursy>119) camy+=2

  -- lock cam to map
  camx=mid(camx,896)
  camy=mid(camy,128)

  printh("cam="..camx..","..camy)

  -- p1:update()
  -- sound_monitor:update()
  -- collisions()
  -- curr_level:update()
  -- update_snow()
  -- cam:update()
 end

 --
 -- game over mode
 --
 if curr_mode==gameover_mode then
  -- wait for player to skip stats
  if btnp"5" 
   and screen_cooldown <=0 then

   sfx(-1,2) -- stop sfx
   curr_mode=game_mode
   level_init()
  end
 end

end

path  = "init"
goal  = {x=14, y=2}

function _draw()
	cls"1"
 --draw_snow()

	camera(camx,camy)

 -- in title/menu mode?
 if curr_mode==title_mode then  
  --print_outline_scaled(title_text1,29,15,3,1,11,0)

  if (alternate()) printc("press ❎ to start",63,75,10,0,1)

 -- in title/menu mode?
 elseif curr_mode==instruct_mode then
  camera(0,0)
  printc("to deliver all of the presents",64,desc_y+14,desc_col1,desc_col2,0)
  printc("without making too much noise",64,desc_y+21,desc_col1,desc_col2,0)
  
  
 -- game mode
 else
  palt()
  --p1:draw()
  pal()

  -- temp fudge
  pal(11,15)
  
  map(0,0)
  
  --hud
  camera(0,0)
  -- ui
  pal()
  palt(11,true)
  spr(0,cursx,cursy)
  --draw_ui()

  -- debug pathfinding
  start = {x=1, y=5}
  -- mouse  
  goal.x, goal.y = flr(cursx / 8), flr(cursy / 8) 
  
  path = find_path(start, goal,
                   manhattan_distance,
                   flag_cost,
                   map_neighbors,
                   function (node) return shl(node.y, 8) + node.x end,
                   nil)  
  if path then
   draw_path(path, 1, 1)
   draw_path(path, 0, 12)
  end


  if (debug_mode) printo("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
 end

end

function draw_path(path, dy, clr)
 local p = path[1]
 for i = 2, #path do
  local n = path[i]
  line(p.x * 8 + 4 + dy, p.y * 8 + 4 + dy, n.x * 8 + 4 + dy, n.y * 8 + 4 + dy, clr)
  p = n
 end
end



-- game flow / collisions
--------------------------------



-- check all collisions
function collisions()
 -- check player collisions
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

function m_anim_obj(x,y,anims,curanim)
 return {
  x=x,
  y=y,
  z=1, -- defaults
  w=8, -- 
  h=8, --
  spr_w=1, -- defaults
  spr_h=1, --
  anims=anims, --animation definitions.
  curanim=curanim,--currently playing animation
		curframe=1,--curent frame of animation.
		animtick=0,--ticks until next frame should show.
  set_anim=_set_anim,
  update_anim=_update_anim,
  get_hitbox=function(self)
   return {
    x=self.x+2,
    y=self.y+2,
    w=self.w-5,
    h=self.h-5
   }
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
  collide_event(o1, o2)
 end
end

function alternate()
 return flr(t())%2==0
end


-- pathfinding-related


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
 if (not fget(mget(nx,ny), 0))

 TODO:: tried capping max path, still uses a lot of cpu
        check orig pathfinding code's performance

  and nx<8
  and ny<8 then 
   add(ntable, {x=nx, y=ny}) 
 end
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
   
  end -- while frontier not empty
 
  -- unreachable, so implicitly
  -- return nil
 end
 








__gfx__
11bbbbbbfffffffff5d555d555d555d55d555d5fffffffff1d515555ffffffff99f99999ffffffffffffffff9f99f9f9ff9f999955d555d555d555d555d555d5
171bbbbbfff77fff1555515d15555155d51555515dfffd5f5155d55dffff9fff9f9999f9fff9fffffffffffff99f99f999f99899155551551555515515555155
1771bbbbff79ff7f5d55d5515d55d555155d55d5d5155551555d5155ffff999999ff99999999ffffffffffff9f99f99f9f9989f95d55d55555dddd555d55d555
17771bbbf79f779f55515d5555515d5d55d51555155d55d5d5555d55fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899555155dddd4444ddddd15d5d
177771bbfff799ffd55d5555d55555555555d55d55d5155555d155d5fffff9f9fff999999f9fffffff99f999f9ffff9f99998f99d555dd444444444444445555
17711bbbff799fff55d551d555d515555d155d555555d55d15555555ffff999999999f999999ffff999f99f9fffffffffff8999955d5d4444444444444444555
b11bbbbbff79ffff1555555515555515555555515d155d55f51ffd5ffff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99155d44444444444444444415
bbbbbbbbf7fffffff55d5515555d55555155d55f55555551ffffffffffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9555d44444444444444444455
ddddddddffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055dd444444444444444444d5
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444455
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000005dd444444444444444444445
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d44444444444444444444d
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000d5d444444444444444444445
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d444444444444444444445
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444415
d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555d44444444444444444455
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
76668055555f4441d76dccc5d576dc65d5556555d5766665d5888885000000000000000000000000000000000000000000000000000000000000000000000000
177220555d5ffff1d66d11c5d76dccc5d5576655d5677725d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d1d55055555f1011d66d01c5d66d11c5d55d7d55d566dd25d5522255000000000000000000000000000000000000000000000000000000000000000000000000
6555505515df1001d66d0c55d66d01c5d55ddd55d566dd25d5555555000000000000000000000000000000000000000000000000000000000000000000000000
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
bbb22bbbbb8dd8bb62ddd26bb28882bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb2882bbb8d66d8b6d666d6b2828282b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b522225bb8d66d8b6d666d6b2868682b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b028820bb8d66d8b68d6d86b2262622b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb2882bbb856658b6886886b2808082b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b522225bb886688b6226226b2888882b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b002200bb220022b50b0b05b00bbb00b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbb00bb00bbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
__gff__
0002020202020400000000000001010100000000000000000000000000010101000000000000000000000000000101010000000000000000000000000000000001010101010102000000000000000000010101010101020000000000000000000100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
6060606060606060606060606060606060606060606060606060606060606060606060606060601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
6008090213141604181818181818181818181818181818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
60080c0a0a091818181818184243181818181818181818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
600808080b181881188218185253181818181818181818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
600b0b1801181811111818040418181818181818181818181818181818181818181818181818601818181818181818181818061806181806180618180618180618060618181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
6018180101181883124445461818181818181818181818181818181818181818181818181818601818181818181818180606181818181818181818181818181818181806181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
6001010101181818025455561880181818020505181818181818181818181818181818181818601818181818181818061818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818180606060606060606181818181818181818
6001010101181818181040411818181805030d0f051818181818181818181818181818181818601818181818181806181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818061818181818181818
60010101011818181818505118181818030d1e1f031818181818181818181818181818181818601818180618061818181818181818181818181818181818181818181818181818181818181818181818181818181818181806180606061818181818181818181818181818181818181818181818181818180618181818181818
60010118011818181818181010050518032d2e2f031818181818181818181818181818181818601818180618181818181818181818181818181818181818181818181818181818181818181818181818181818181818061818181818181806181818181818181818181818181818181818181818181818180618181818181818
6018181801181818181818181802061806030303031818181818181818181818181818181818606018061818181818181818181818181806061818061806181818181818181818181818181818181818181818061806181818181818181818061818181818181818181818181818181818181818181818181806181818181818
6018180101181818181818181818181818060606061818181818181818181818181818181818606018061818181818181818181818181818181818181818180618181818181818181818181818181818181806181818181818181818181818180618181818181818181818181818181818181818181818181818061818181818
6060181818181818181818181818181818181818181818181818181818181818181818181818606018181818181818181818181818181818181818181818181806181818181818181818181818181818180618181818181818181818181818180618181818181818181818181818181818181818181818181818180618181818
6018010101011818181818181818181818181818181818181818181818181818181818181818601818180618181818181818181818181818181818181818181806181818181818181818181818181818061818181818181818181818181818181818181818181818181818181818181818181818181818181818180618181818
6018010101011818181818181818181818181818181818181818181818181818181818181818606018181818181818181818181818181818181818181818181806181818181818181818181818181806181818181818181818181818181818181806181818181818180618181818181818181818181818181818181806181818
6001010101181818181818181818181818181818181818181818181818181818181818181818606018181806181818181818181818181818181818181818181806181818181818181818181818181818181818181818181818181818181818181818061818181818180618181818181818181818181818181818181806181818
6018181818181818181818181818181818181818181818181818181818181818181818181818601818181818061818181818181818181818181818181818181806181818181818181818181818180618181818181818181818181818181818181818181818181818180618181818181818181818181818181818181818061818
6018181818181818181818181818181818181818181818181818181818181818181818181818601818181818180618181818181818181818181818181818181806181818181818181818181818061818181818181818181818181818181818181818180618181818180618181818181818181818181818181818181818061818
6018181818181818181818181802050418181818181818181818181818181818181818181818601818181818181818180618181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818061818
6018181818181818180205050503030418181818181818181818181818181818181818181818601818181818181818181818180618180618181818181818060618181818181818181818181818061818181818181818181818181818181818181818181806181818181818181818181818181818181818181818181818180618
6018181818181818180203030303030303181818181818181818181818181818181818181818601818181818181818181818181818181818061818061806181818181818181818181818181818181818181818181818181818181818181818181818181818181818180618181818181818181818181818181818181818180618
6018181818181818050303030303030303041818181818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181806181818181818181818181818181818181818181818181818180618
6018181818181818030303181818181818180618181818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818180618181818181818181818181818181818181818181818181806061818061818181818181818181818181818181818181818180618
6018181818181818181818181818181818181818061818181818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818060606061818181818181818181818181818181818181818180618
6018181818181818181818181818181818181818180606181818181818181818181818181818601806060606060618181818181818181818181818181818181818181818181818181818180618181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818180618
6018181818181818181818181818181818181818181818061818181818181818181818181818601818181818180606180618061818061806061818181818181818181818181818181818180618181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818180618
6018181818181818181818181818181818181818181818061818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818060618
6018181818181818181818181818181818181818181818061818181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181806061818
6018181818181818181818181818181818181818181818180618181818181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181806060618181818
6018181818181818181818181818181818181818181818181806060618181818181818181818601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818060606060606061806060618181818181818
6060606060606060606060606060606060606060606060606060606060606060606060606060601818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
1818181818186018181818181818181818181818181818181860606018181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818
