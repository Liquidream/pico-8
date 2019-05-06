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
keyx,keyy=0,0
selected_obj=nil
credits=2335


--cor=nil
count=0
units={}
object_tiles={}
buildings={}

_g={}
_g.draw_windtrap=function(self)
 printh("hello building!!!")
 printh("hello "..self.name)
end

-- building data
-- [ID|Name|obj_spr|ico_spr|type|w|h|trans_col|parent|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|description|update()|draw()]
obj_data=
-- buildings
[[1|cONSTRUCTION yARD|64|128|2|2|2|nil|nil|nil|1||100|nil||400|||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||
2|wINDTRAP|66|130|2|2|2|nil|1|1|1||300|100||200|||tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|draw_windtrap|update_bld
3|sMALL cONCRETE sLAB|||2|1|1|nil|1|1|1||5|nil||0|||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||
4|lARGE cONCRETE sLAB|||2|2|2|nil|1|1|4||20|nil||0|||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||
5|dEFENSIVE wALL|||2|1|1|nil|1|7|4||50|nil||50|||tHE wALL IS USED FOR PASSIVE DEFENSE.||
6|sPICE rEFINERY|68|132|2|3|2|nil|1|2|1||400|30||450|||tHE rEFINERY CONVERTS SPICE INTO CREDITS.||
7|rADAR oUTPOST|||2|2|2|nil|1|2|2||400|30||500|||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||
8|sPICE sTORAGE sILO|||2|2|2|nil|1|6|2||150|5||150|||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||
9|bARRACKS|||2|2|2|nil|1|7|2||300|10||300|||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||
10|wor tROOPER fACILITY|||2|2|2|nil|1|7|2||400|10||400|||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||
11|lIGHT vEHICLE fACTORY|||2|2|2|nil|1|6|2||400|20||350|||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||
12|hEAVY vEHICLE fACTORY|||2|3|2|nil|1|6|3||600|20||200|||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||
13|hI-tECH fACTORY|||2|3|2|nil|1|7+12|5||500|35||400|||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||
14|cANNON tURRET|||2|1|1|nil|1|7|5||125|10||200|||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||
15|rOCKET tURRET|||2|1|1|nil|1|7|6||250|20||200|||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||
16|rEPAIR fACILITY|||2|3|2|nil|1|7+12|5||700|20||200|||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||
17|sTARPORT|||2|3|3|nil|1|6|6||500|50||500|||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||
18|hOUSE OF ix|||2|2|2|nil|1|7+12|5||500|40||400|||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||
19|pALACE|||2|3|3|nil|1|17|8||999|80||1000|||tHIS IS YOUR pALACE.||]]..
-- units
[[20|lIGHT iNFANTRY (X3)|||1|1|1||9|9|2|AO|60||4|50|5|2|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||
21|hEAVY tROOPERS (X3)|||1|1|1||10|9|3|HO|100||8|110|10|3|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.||
22|tRIKE|||1|1|1||11+17||2||150||8|100|60|3|tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||
23|qUAD|||1|1|1||11+17||3||200||10|130|50|3|tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||
24|cOMBAT tANK|||1|1|1||12+17|7|4||300||38|200|25|4|tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||
25|sIEGE tANK|||1|1|1||12+17|7|6||600||45|300|20|5|tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||
26|rOCKET lAUNCHER|||1|1|1||12+17|7|5||450||112|100|30|9|tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||
27|hARVESTER|||1|1|1||12+17||2||300||0|150|30|nil|tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||
28|cARRYALL|||1|1|1||13|13|5||800||0|100|200|nil|tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||
29|oRNITHOPTER|||1|1|1||13+17|13|7|AO|600||75|5|150|5|tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||
30|mcv (mOBILE CONSTRUCTION VEHICLE)|||1|2|1||12+17|7|4||900||0|150|0|nil|tHE mcv SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||
31|sONIC tANK|||1|1|1||12|7|7|A|600||90|110|30|8|dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||
32|fREMEN (X3)|||1|1|1||19||8|A|0||8|220|10|3|tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||
33|dEVASTATOR|||1|1|1||12|13|8|H|800||60|400|10|7|tHE dEVESTATOR IS A hARKENNEN-DEVELOPED NUCKEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||
34|dEATH hAND|||1|1|1||19||8|H|0||150|70|250|nil|tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||
35|rAIDER|||1|1|1||11||2|O|150||8|80|75|3|tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||
36|dEVIATOR|||1|1|1||12|13|7|O|750||0|120|30|7|tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||
37|sABOTEUR|||1|1|1||19||8|O|0||150|40|40|2|tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||]]..
-- other
[[38|sARDAUKAR|||1|1|1||nil|nil|4||0||5|110|10|1|tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||
39|sANDWORM|||1|1|1||nil|nil|3||0||300|1000|35|0|tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||]]

--[[
  ## messages ##
There isn't enough open concrete to place this structure. You may proceed, but without enough concrete the building will need repairs.

You have successfully completed your mission.

]]

--p8 functions
--------------------------------

function _init()

explode_data()


 -- enable mouse
 poke(0x5f2d, 1)

 cartdata("pn_picodune") 

 -- starting mode 
 -- (1=normal, 2=build menu, 3=???)
 curr_mode = 1

 -- init the game/title
 level_init()
 ticks=0

 -- create cursor ui "object" (for collisions)
 cursor = m_obj(0,0,0)
 cursor.get_hitbox=function(self)
   return {
    x=self.x+(not ui_collision_mode and camx or 0)+2,
    y=self.y+(not ui_collision_mode and camy or 0)+1,
    w=1,
    h=1
   }
  end
cursor.draw=function(self)   
  spr((selected_obj and (selected_obj.type==1)) and 1 or self.spr, 
   self.x, self.y, self.w/8, self.h/8)
 end




 -- add test buldings
 local windfarm=m_obj(12*8,4*8, 2, 66, nil, 2,2)
 windfarm.life=50
 windfarm.ico_obj=m_obj(109,20,2, 130, nil, 2,2, windfarm, function(self)
    printh("todo: fix windfarm?...")
  end)
  windfarm.col_cycle = {
    {14,12},
    {14,12},
    {14,12},
    {14,12},
    {14,13},
    {14,1},
    {14,1},
    {14,1},
    {14,1},
    {14,13},
  }
  windfarm.framecount=10
 add(buildings,windfarm)
 -- reveal fog?
 reveal_fow(windfarm)
 --
 local refinary=m_obj(9*8,7*8, 2, 68, nil, 3,2)
 refinary.life=10
 refinary.ico_obj=m_obj(109,20,2, 132, nil, 2,2, refinary, function(self)
    printh("todo: fix refinary?...")
  end)
 add(buildings,refinary)
 reveal_fow(refinary)
 --
 local constyard=m_obj(10*8,9*8, 2, strArrays[1][3], nil, 2,2)
 constyard.life=75
 constyard.ico_obj=m_obj(109,20,2, 128, nil, 2,2, constyard, function(self)
    printh("todo: load construction yard menu...")
  end)
 constyard.build_obj=m_obj(109,44,2, 162, nil, 2,2, nil, function(self)
    printh("todo: build slab...")
    self.build_step=0.5
    self.cor=cocreate(function(self)
        -- build slab
        while self.life<100 do
          self.life+=self.build_step
          credits-=.1
         yield()
        end
      end)
  end)
 add(buildings,constyard)
 reveal_fow(constyard)

 -- add test units

 -- siege tank
 local unit = m_obj(5*8, 3*8, 1, 50, 11)
 unit.r=0
 unit.ico_obj=m_obj(109,20,2, 198, nil, 2,2, unit, nil)
 unit.life=100
 add(units,unit)
 reveal_fow(unit)
 
 -- combat tank
 unit = m_obj(7*8, 9*8, 1, 51, 11)
 unit.r=0.25
 unit.ico_obj=m_obj(109,20,2, 196, nil, 2,2, unit, nil)
 unit.life=100
 add(units,unit)
 -- test fog of war
 reveal_fow(unit)--.x,unit.y)
 
 -- harvester
 unit = m_obj(12*8, 8*8, 1, 49, 11)
 unit.ico_obj=m_obj(109,20,2, 192, nil, 2,2, unit, nil)
 unit.r=0.75
 unit.speed=.25
 unit.life=100
 add(units,unit)
 -- test fog of war
 reveal_fow(unit)

 -- infantry
 unit = m_obj(9*8, 3*8, 1, 62, 11)
 unit.ico_obj=m_obj(109,20,2, 194, nil, 2,2, unit, nil)
 unit.altframe=63
 unit.framecount=10
 unit.speed=.15
 unit.norotate=true
 unit.life=100
 add(units,unit)
 -- test fog of war
 reveal_fow(unit)


 camx=15
end

function reveal_fow(object)  
 local size = object.type==2 and 3 or 2
 -- clear group of tiles
 for xx=-size,size do
  for yy=-size,size do
    -- clear tile
    local posx=flr(object.x/8)+xx
    local posy=flr(object.y/8)+yy    
    fow[posx][posy]=16 
    test_tile(posx,posy)
    -- update neighborhood
    for dy=-1,1 do
        for dx=-1,1 do
          test_tile(posx+dx,posy+dy)
        end
    end
  end
 end
end


function _update60()  --game_update

 update_level()
 
 -- update positions of pathfinding "blocker" objects
 if (t()%1==0) update_obj_tiles()
end


function _draw()
 -- draw the map, objects - everything except ui
 draw_level()
 -- draw score, mouse, etc.
 draw_ui()
  
  --printh("cpu: "..flr(stat(1)*100).."% mem: "..(flr(stat(0)/2048*100)).."% fps: "..stat(7))--,2,109,8,0)
  if (debug_mode) printo("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)

 -- print(a[1][2],20,20,7)
end


-- init related
--------------------------------
function level_init()
 -- todo: parse map data into objects

 -- init fog of war?
 fow={}
 for i=-2,66 do
  fow[i]={}
  for l=-2,66 do
   fow[i][l]=0
  end
 end

end

-- fog of war
function draw_fow()
 local mapx=flr(camx/8)
 local mapy=flr(camy/8)
 for xx=mapx-1,mapx+16 do
  for yy=mapy-1,mapy+16 do
    if fow[xx][yy]!=0 and fow[xx][yy]!=16 then

    --spr(fow[xx][yy], xx*8, yy*8)
     spr(fow[xx][yy]+31,xx*8,yy*8)


    elseif fow[xx][yy]<16 then
     rectfill(xx*8, yy*8, xx*8+7, yy*8+7, 0)
    end
  end
 end
end



-- https://www.lexaloffle.com/bbs/?tid=30902
function test_tile(x,y) 
 
 -- bail (outside testtile bounds)
 if (x<0 or x>#fow or y<0 or y>#fow) return
	
  -- figure out bitmask
  local mask = 0

	if fow[x][y]!=0 then
  
    -- north has tile?
		if (fow[x][y-1]>0) mask+=1
	
    -- east has tile?
		if (fow[x-1][y]>0) mask+=2
	
    -- south has tile?
		if (fow[x+1][y]>0) mask+=4
	
    -- west has tile?
		if (fow[x][y+1]>0) mask+=8
		
    fow[x][y]=1 + mask
	end

end

-- update related
--------------------------------

function update_obj_tiles() 
 object_tiles={}
 -- (The pico-8 map is a 128x32 (or 128x64 using shared space))
 for _,unit in pairs(units) do  
  object_tiles[flr(unit.x/8)..","..flr(unit.y/8)]=1
 end
end

function update_level()
 
  
  -- mouse control
  mouse_x = stat(32)
  mouse_y = stat(33)
  mouse_btn = stat(34)
  left_button_clicked = (mouse_btn>0 and last_mouse_btn != mouse_btn) or btnp(4)
  
  --printh(tostr(left_button_clicked))

  -- keyboard input
  for k=0,1 do
   if(btn(k))keyx+=k*2-1
   if(btn(k+2))keyy+=k*2-1
  end

 -- update cursor pos
 cursx = mid(0,mouse_x+keyx,127) -- mouse xpos
 cursy = mid(0,mouse_y+keyy,127) -- mouse ypos
  
 cursor.x = cursx
 cursor.y = cursy

 --
 -- game mode
 --

 -- auto-scroll (pan) map
 if (cursx<4) camx-=2
 if (cursx>123) camx+=2
 if (cursy<4) camy-=2
 if (cursy>123) camy+=2

 -- lock cam to map
 camx=mid(camx,384)  --896
 camy=mid(camy,384)  --128

 --printh("cursor="..cursor.x..","..cursor.y)


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
 -- update all unit coroutines 
 -- (pathfinding, moving, attacking, etc.)
 for _,unit in pairs(units) do 
  update_cor(unit)
 end
 -- update all building coroutines
 -- (building, repairing, etc.)
 for _,building in pairs(buildings) do 
  update_cor(building)
  update_cor(building.build_obj)
 end
end

function update_cor(obj)
 if obj then
  if obj.cor and costatus(obj.cor) != 'dead' then
    assert(coresume(obj.cor, obj))
  else
    obj.cor = nil
  end
 end
end

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
 
 map(0,0, 0,0, 64,32)
 map(64,0, 0,256, 64,32)

 -- debug pathfinding
 --if (debug_mode) draw_pathfinding()

 if path != nil and path != "init" then
  spr(144, path[1].x*8, path[1].y*8)
 end

 -- buildings
 for _,building in pairs(buildings) do 
  building:update()
  building:draw()
  -- draw selected reticule
  if (building == selected_obj) then 
   rect(selected_obj.x, selected_obj.y, 
        selected_obj.x+selected_obj.w-1, selected_obj.y+selected_obj.h-1, 
        7)
  end
 end
 -- draw units
 palt(11,true)
 for _,unit in pairs(units) do
  unit:update()
  unit:draw()
  -- draw selected reticule
  if (unit == selected_obj) then   
   spr(16, selected_obj.x, selected_obj.y)
  end
 end

-- draw fog-of-war
draw_fow()
end



function draw_ui()
 -- ui (score, mouse, etc.)
 camera(0,0)
 pal()
 -- selected objects?
 palt(0,false) 
 -- object menu icon/buttons?
 if selected_obj and selected_obj.ico_obj then
  selected_obj.ico_obj:draw(109,20,true)  
  if selected_obj.build_obj then
    selected_obj.build_obj:draw(109,44,true)  
   end
 end
 
--  if selected_obj and selected_obj==2 then
--   selected_obj:draw(109,20,true)  
--  end
 
 -- radar 
--  rectfill(94, 94, 125, 125, 0)
--  rect(94, 94, 125, 125, 5)

 -- score
 printo("00"..flr(credits), 103,2, 7)
 
 -- placement?
 if selected_obj 
  and selected_obj.build_obj 
  and selected_obj.build_obj.life>=100 then
  -- draw placement!
  local xx=flr(cursor.x/8)*8-camx%8
  local yy=flr(cursor.y/8)*8-camy%8
  fillp("0b1110110110110111.1")
  rectfill(xx, yy,
           xx+selected_obj.build_obj.w, yy+selected_obj.build_obj.h, 11)
  fillp()
 end

 -- cursor
 palt(11,true)
 cursor:draw()
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
 
 clickedsomething=false

 -- check cursor/ui collisions
 
 -- unit collisions
 foreach(units, check_hover_select)
 -- building collisions 
 foreach(buildings, check_hover_select)

 -- selected obj ui collision
 if selected_obj then
  ui_collision_mode=true
  if (selected_obj.ico_obj) check_hover_select(selected_obj.ico_obj)
  if (selected_obj.build_obj) check_hover_select(selected_obj.build_obj)
  ui_collision_mode=false
 end

 -- clicked something?
 if left_button_clicked then
  if clickedsomething then
    -- button?
    if (selected_obj.func_onclick) selected_obj:func_onclick() selected_obj=last_selected_obj
  
  -- deselect?
  else 
    -- do we have a unit selected?
    if selected_obj and selected_obj.type==1 then
      move_unit_pos(selected_obj, flr((camx+cursx)/8), flr((camy+cursy)/8))
    end
    
    -- placement? (temp code!)
    if selected_obj 
     and selected_obj.build_obj 
     and selected_obj.build_obj.life>=100 then
      -- place object
      local xpos=flr((cursor.x+camx)/8)
      local ypos=flr((cursor.y+camy)/8)
      mset(xpos,ypos,19)
      mset(xpos+1,ypos,19)
      mset(xpos,ypos+1,19)
      mset(xpos+1,ypos+1,19)
      -- reset build
      selected_obj.build_obj.life=0

    end

    selected_obj=nil
  end 
 end

end

function check_hover_select(obj)
  obj.hover = collide(cursor, obj)
  if left_button_clicked and obj.hover then
   selected_obj = obj   
   clickedsomething=true
  end
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

function m_obj(x,y,type,sprnum,trans_col,w,h,parent,func_onclick)
 return {
  x=x,
  y=y,
  z=1, -- defaults
  type=type, -- 1=unit, 2=structure, 3=worm
  w=(w or 1)*8, -- pixel dimensions
  h=(h or 1)*8, --
  parent=parent,
  spr=sprnum,
  orig_spr=sprnum,
  trans_col=trans_col,
  func_onclick=func_onclick,
  ai=false,
  spr_w=w or 1, -- defaults
  spr_h=h or 1, --
  life=0,
  -- color cycling/anim
  frame=0,
  framecount=0,
  col_cycle_pos=1,
  -- (units: 1=idle/guarding, 2=moving, 3=attacking)
  state=1, 

  get_hitbox=function(self)
   return {
    x=self.x,
    y=self.y,
    w=self.w-1,
    h=self.h-1
   }
  end,
  draw=function(self, x,y, icon_mode) 
    pal()
    palt(0,false)
    if (self.trans_col) palt(self.trans_col,true)
    -- colour anim?
    if self.col_cycle then
      pal(self.col_cycle[self.col_cycle_pos][1],
          self.col_cycle[self.col_cycle_pos][2])
    end
    -- rotating obj?
    if self.r then
     rspr(self.spr%16*8,flr(self.spr/16)*8, self.x, self.y, .25-self.r, 1, 11)      
    -- norm sprite
    else      
      -- icon mode?
      if icon_mode then
        rectfill(x-1,y-1,x+16,y+19,0)
        -- draw health/progress
        local this=self.parent or self
        local col = this.build_step and 12 or (this.life<33 and 8 or this.life<66 and 10 or 11)
        if (this.life>0) rectfill(x,y+17,x+(15*this.life/100),y+18,col)
      end
      -- non-rotational sprite
      spr(self.spr, self.x or x, self.y or y, self.w/8, self.h/8)
    end

    if (debug_collision) draw_hitbox(self)
  end,
  update=function(self)
    -- default functionality?
    self.frame+=1
    if (self.frame > self.framecount) then
      self.frame=0
      -- alternate moving frame?
      if self.altframe 
       and self.state==2 then
        self.spr=self.orig_spr+(self.altframe-self.spr)
      end

      if self.col_cycle then
        self.col_cycle_pos+=1
        if (self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
      end
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


-- explode object data
function explode_data()
  strArrays=split(obj_data,"|","\n")

  printh("------------------")
  printh("test 1:"..#strArrays)

  printh("test 4:"..strArrays[1][1])
  printh("test 5:"..strArrays[2][1])
  printh("test 5.1:"..strArrays[2][11])

  --test 6
  --_g[a[2][11]]()

  --test 7
  new_obj={
    name="test obj",
    draw=_g[strArrays[2][20]]
  }
  new_obj:draw()
end


-- split string
-- https://www.lexaloffle.com/bbs/?tid=32520
 function split(str,d,dd)
 local a={}
 local c=0
 local s=''
 local tk=''
 
 if dd~=nil then str=split(str,dd) end
 while #str>0 do
  if type(str)=='table' then
   s=str[1]
   add(a,split(s,d))
   del(str,s)
  else
   s=sub(str,1,1)
   str=sub(str,2)
   if s==d then 
    add(a,tk)
    tk=''
   else
    tk=tk..s
   end
  end
 end
 add(a,tk)
 return a
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

 unit.state=2 --moving

 -- loop all path nodes...
 for i=#unit.path-1,1,-1 do
  local node=unit.path[i]

  if not unit.norotate then
    -- rotate to angle
    local dx=unit.x-(node.x*8)
    local dy=unit.y-(node.y*8)
    local a=atan2(dx,dy)
    printh("  >> target angle="..a)
    while (unit.r != a) do
      turntowardtarget(unit, a)
    end
  end
  
  -- move to new position
  local scaled_speed = unit.speed or .5
  local distance = sqrt((node.x*8 - unit.x) ^ 2 + (node.y*8 - unit.y) ^ 2)
  local step_x = scaled_speed * (node.x*8 - unit.x) / distance
  local step_y = scaled_speed * (node.y*8 - unit.y) / distance 
  for i = 0, distance/scaled_speed-1 do
   unit.x+=step_x
   unit.y+=step_y
   yield()
  end
  unit.x,unit.y = node.x*8, node.y*8

  -- reveal fog?
  reveal_fow(unit)-- .x,unit.y)
 end

 -- arrived?
 unit.state=1 --idle

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
bbbbbbbbbbb1bbbbf5d555d555d555d55d555d5fffffffff1d515555ffffffff99f99999ffffffffffffffff9f99f9f9ff9f9999ffffffffffffffffffffffff
bb11bbbbbb171bbb1555515d15555155d51555515dfffd5f5155d55dffff9fff9f9999f9fff9fffffffffffff99f99f999f99899ffffffffffffffffffffffff
bb171bbbb1bbb1bb5d55d5515d55d555155d55d5d5155551555d5155ffff999999ff99999999ffffffffffff9f99f99f9f9989f9ffffffffffffffffffffffff
bb1771bb17b1b71b55515d5555515d5d55d51555155d55d5d5555d55fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899ffffffffffffffffffffffff
bb17771bb1bbb1bbd55d5555d55555555555d55d55d5155555d155d5fffff9f9fff999999f9fffffff99f999f9ffff9f99998f99ffffffffffffffffffffffff
bb177771bb171bbb55d551d555d515555d155d555555d55d15555555ffff999999999f999999ffff999f99f9fffffffffff89999ffffffffffffffffffffffff
bb17711bbbb1bbbb1555555515555515555555515d155d55f51ffd5ffff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99ffffffffffffffffffffffff
bbb11bbbbbbbbbbbf55d5515555d55555155d55f55555551ffffffffffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9ffffffffffffffffffffffff
b7bbbb7bffffffffffffffffddddddddddddddddffffffffffffffff55d555d555d555d555d555d555dd444444444444444444d555dd444444444444444444d5
77bbbb77fffffffffff77fffd5555555d5555555f888888ff6ffffff155551551555515515555155155d44444444444444444455155044444444444444444055
bbbbbbbbffffffffff79ff7fd5555555d5015515f8a8888fffffff6f5d55d55555dddd555d55d5555dd4444444444444444444455d5104444444444444444155
bbbbbbbbfffffffff79f779fd5555555d5105555f888888fffffffff555155dddd4444ddddd15d5d55d44444444444444444444d555114444444444444440d5d
bbbbbbbbfffffffffff799ffd5555555d5555111f888888fffffffffd555dd444444444444445555d5d444444444444444444445d55510044444444444401555
bbbbbbbbffffffffff799fffd5555555d1555101f888888ffff6ffff55d5d444444444444444455555d44444444444444444444555d515100044444000015555
77bbbb77ffffffffff79ffffd5555555d5555111f888888fffffffff155d44444444444444444415155d44444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffd5555555d5515555ffffffffffffffff555d44444444444444444455555d44444444444444444455555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
00000000000000000000000010000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbb2222bbbb8dd8bb62ddd26bb28882bbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb6bbb6bbb6bbb6bb
ffffffffb088880bb8d66d8b6d666d6b2828282bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb8bbb8bbb8bbb8bb
ffffffffb088880bb8d66d8b6d666d6b2868682bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb2bbb2bbb2bbb2bb
ffffffffb288882bb8d66d8b68d6d86b2262622bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb0bbb0bb0b0b0b0b
ffffffffb288882bb856658b6886886b2808082bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb6bbbbbbb6bbbb
ffffffffb028820bb886688b6226226b2888882bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb8bbbbbbb8bbbb
ffffffffb0d22d0bb220022b50b0b05b00bbb00bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb2bbbbbbb2bbbb
ffffffffbb2882bbb00bb00bbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb0bbbbbb0b0bbb
d66dddddddd6fffdddd776ddddddddddddddddddddd666dddddddddd0000000000000000000000000000000000000000000000000000000100fff00010fff000
76665555551ffff1d576de65d5577655d5555555d5766665d55555550000000000000000000000000000000000000000000000000000000bb000000bb0000000
76665805555f4441d76deee5d576de65d5556555d5766665d5888885000000000000000000000000000000000000000000000000000000b1b1b1b1bb1b000000
177d22055d5ffff1d66d11e5d76deee5d5576655d5677725d5555555000000000000000000000000000000000000000000000000000001bbbb1b1bbbbb000000
d1d55505555f1011d66d01e5d66d11e5d55d7d55d566dd25d552225500000000000000000000000000000000000000000000000000000b1bbbbbbbbbb1b00000
6555550515df1001d66d0e55d66d01e5d55ddd55d566dd25d55555550000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbb1b0000
d6d6d55555551005d56dd555d66d0e55d555d555d556dd55d555255500000000000000000000000000000000000000000000000000bb1bbbbbbbbbbbbbb1bb00
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d55222550000000000000000000000000000000000000000000000001b1bbbbbbbbbbbbbbbbbb1b1
dddddddd55d555d5ddddd776ddddddddddd666dddddddddddddddddd0000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbb0
d555555515555155d55576de65555555d5766665d5555555d552225500000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbb100
d555555a5d55d555d5576deee5558055d5766665d5556555d5552555000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbb1b00
d5aaa99a55515d5dd5566d11e5522055d5677725d5576655d555555500000000000000000000000000000000000000000000000000b1bbbbbbbbbbbbbbbbb100
d5aaa55ad5555555d5566d01e5555055d566dd25d55d7d55d5522255000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbb1b00
d5a1199a55d51555d5566d0ed5555055d566dd25d55ddd55d555555500000000000000000000000000000000000000000000000000b1bbbbbbbbbbbbbbbbb100
d544445a15555515d5556dd5d5555555d556dd55d555d555d5888885000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbbbb00
d5151515555d5555d5555555d5555555d5555555d5555555d55555550000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbb0
ffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbbbbbbbb1b1
ffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000bb1bbbbbbbbbbbbbb1bb00
ffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbb1b0000
ffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000b1bbbbbbbbbb1b00000
ff77777777ffffffff77757777ffffff000000000000000000000000000000000000000000000000000000000000000000000000000001bbbbb1b1bbbb000000
ff766666666fffffff766657666fffff000000000000000000000000000000000000000000000000000000000000000000000000000000b1bb1b1b1b1b000000
ff7666666666ffffff5555565555ffff0000000000000000000000000000000000000000000000000000000000000000000000000000000bb000000bb0000000
f766666666666ffff777777577777fff000000000000000000000000000000000000000000000000000000000000000000000000000000010000000010000000
f7666666666666fff7666665766666ff000000000000000000000000bbb22bbbbb8dd8bb62ddd26bb28882bb0000000000000000000000000000000000000000
f76666666666666ff76666665766666f000000000000000000000000bb2882bbb8d66d8b6d666d6b2828282b0000000000000000000000000000000000000000
f55555555555555ff55555555555555f000000000000000000000000b522225bb8d66d8b6d666d6b2868682b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b028820bb8d66d8b68d6d86b2262622b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000bb2882bbb856658b6886886b2808082b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b522225bb886688b6226226b2888882b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b002200bb220022b50b0b05b00bbb00b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000bbbbbbbbb00bb00bbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
ccccccccccccc0cccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccdccccc67111dcccccc11116666dc0157d7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9accc5acccccc55cccc6660dd1dccccc6d1d111166665757eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
575c544aaaccccccccd6650001dccc7776d76d1c11111110eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
5d75144444aaaccc9dddd055d1d996666d1dd11cc5650555eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6deeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7deeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
50d019999999151501755000001d55556d1d4d9949945499eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
501015aaaaaaa44450155ddddddd66996d19999999666666eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
4500545aa744444566666666666666669999999966776767eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
544454444444544466666666555555554999996777777776eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
4554444544544454555555559999f9999944677667767698eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
54445544554545449f9999f9999999f99977777777679887eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
455454554555544599fffffff9f999994777776677988977eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff77777777ffffffff77757777ffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff766666666fffffff766657666fffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff7666666666ffffff5555565555ffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f766666666666ffff777777577777fffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f7666666666666fff7666665766666ffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f76666666666666ff76666665766666feeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f55555555555555ff55555555555555feeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444cccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
916666d001110009cccc00df00cccccc95060000000006599504000000000459ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
f90500000444000999999900ff99999999555555555555999955555555555599ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
999999999999999f44999df9dff9f999f99999999999999f9999999999999999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99fffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
99999999999999f999945559455599999ff9999999fff999999999999ff99999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
99999999ffff9999fff999999999999999999999999999ff999fff9999999f99ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9fffff99999999ff9999999f99999ff999fffff9999f99999f99999999999999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
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
0000020202020400000000000000000000000200010000010101010101010101010101010000000000000101010000000001010101000000000000000000000001010101010102000000000001010101010101010101020000000000010101010000000000000000000000000101010100000000000000010101010000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000151515
0000000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1212000000000000001616161600000000000000000007080900000000000000000000000000000000001212121212120000000000000000000003030300000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1212120000000016161616000000000000000000000708080809000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616000204000000000007080808080809000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121200000000160000000304000000000708080808080b00000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000002040000070a0a0c080808080b0000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000020304000000000b08080808080b000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016000003030400000000000205050000000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000614140000000005031719050000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001600000014140000000003171b1c030000000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016160002031313050500031d1b1f03000000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200001600060600000206000603030303000000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001212000000000000000000000000060606060000000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000001616000000000000000000000000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000016000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000121212120000000000001212121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012121212000016000000000000121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000002050400000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000205050503030400000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000217181819030303000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000005031d1b1b1b181819040000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000020303031d1b1b1b1b1c030400000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000060303031a1b1b1f030606060000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000002031d1b1f03060000000606000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000060603030303000000000000060000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000606000000000000060000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1500000000000000000000000000000000000000000000000006060600000000000000000000000000000000000000000000000000000000000000000000001500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1515150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
