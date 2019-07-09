pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- pico-dune
-- by paul nicholas
-- (with support from my patrons)

-- global flags
debug_mode=true
debug_collision=false

-- data flags (eventually pulled from cartdata)
p_faction=3 -- 0=None, 1=Atreides, 2=Ordos, 3=Harkonnen
p_col1=8
p_col2=2
ai_faction=1
ai_col1=12
ai_col2=1


-- constants
--### do this in main cart, pre-game!
--faction_cols={12,1,  11,3,  8,2}
--faction_cols[plr_faction*2], faction_cols[plr_faction*2-1]

-- fields
camx,camy=0,0
cursx,cursy=0,0
keyx,keyy=0,0
selected_obj=nil
credits=2335
_t=0
hq=false
last_hq=hq
has_radar=false
radar_frame=0
radar_data={}
music_state=0 -- 0=normal, 1=battle

--cor=nil
count=0
units={}
object_tiles={}
buildings={}
ui_controls={}

_g={}
_g.factory_click=function(self)
  menu_pos=1
  selected_subobj=self.parent.build_objs[1]
  -- create buttons
  m_button(6,89,"⬆️",function(self)   
   --sel_build_item_idx-=1
   sel_build_item_idx=mid(1,sel_build_item_idx-1,#selected_obj.build_objs)
   selected_subobj = selected_obj.build_objs[sel_build_item_idx]
   if (sel_build_item_idx<menu_pos) menu_pos-=1
   --menu_pos=max(menu_pos-1,1)
  end, 10)
  m_button(17,89,"⬇️",function(self)
   sel_build_item_idx=mid(1,sel_build_item_idx+1,#selected_obj.build_objs)
   selected_subobj = selected_obj.build_objs[sel_build_item_idx]
   if (sel_build_item_idx>menu_pos+2) menu_pos=min(menu_pos+1,#show_menu.parent.build_objs-2)
   --menu_pos=min(menu_pos+1,#show_menu.parent.build_objs-2)
  end, 10)
  m_button(32,88,"build",function(self)
   show_menu=nil
   selected_obj.build_obj=last_selected_subobj
   last_selected_subobj:func_onclick()
  end)
  m_button(96,88,"close",function(self)
   show_menu=nil
  end)
  -- show build menu
  show_menu=self
end
_g.init_windtrap=function(self)
  self.col_cycle = {
    {11,12},
    {11,12},
    {11,12},
    {11,12},
    {11,13},
    {11,1},
    {11,1},
    {11,1},
    {11,1},
    {11,13},
  }
  self.col_cycle_pos=1
end



-- object data
obj_data=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
-- buildings
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|nil||400||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|nil||50||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|100||200|||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30||450||||||tHE rEFINERY CONVERTS SPICE INTO CREDITS.||||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30||500||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5||150||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10||300||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10||400||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20||350||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20||200||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35||400||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20||200||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||2|1|1|nil|1|7|5||125|10||200||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||2|1|1|nil|1|7|6||250|20||200||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50||500||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40||400||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80||1000||||||tHIS IS YOUR pALACE.||||factory_click
]]..
-- units
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|AO|60||4|50|0.05|2|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|HO|100||8|110|0.1|3|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|150|0.6|3||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD||||1|1|1|11|11||3||200||10|130|0.5|3||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|200|0.25|4||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|300|0.2|5||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|100|0.3|9||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|150|0.3|nil||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|100|2|nil||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|AO|600||75|5|1.5|5||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4||900||0|150|0|nil||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|A|600||90|110|0.3|8||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|A|0||8|220|0.1|3||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|H|800||60|400|0.1|7||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|H|0||150|70|2.5|nil||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER||||1|1|1|11|11||2|O|150||8|80|0.75|3||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|O|750||0|120|0.3|7||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|O|0||150|40|0.4|2||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
-- other
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|110|0.1|1||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||1|1|1|11|nil|nil|3||0||300|1000|0.35|0||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||]]





--[[
  ## messages ##
There isn't enough open concrete to place this structure. You may proceed, but without enough concrete the building will need repairs.

You have successfully completed your mission.

]]

--p8 functions
--------------------------------

function _init()
 printh("-- init -------------") 
 -- enable mouse
 poke(0x5f2d, 1)

 cartdata("pn_picodune") 

 explode_data()

 -- starting mode 
 -- (1=normal, 2=build menu, 3=???)
 curr_mode = 1

 -- init the game/title
 level_init()
 ticks=0

 -- create cursor ui "object" (for collisions)
 cursor = {
  x=0,
  y=0,
  w=8,
  h=8,
  spr=0,
  get_hitbox=function(self)
   return {
    x=self.x+(not ui_collision_mode and camx or 0)+2,
    y=self.y+(not ui_collision_mode and camy or 0)+1,
    w=1,
    h=1
   }
  end,
  draw=function(self)   
   spr((selected_obj and (selected_obj.type==1)) and 1 or self.obj_spr, 
    self.x, self.y, self.w/8, self.h/8)
  end
 }

 discover_objs()

 camx=44
 camy=8

 music(9)
end

-- analyse current map & spawn objs  
function discover_objs()
  -- make 2 passes
  -- (first find the player start pos/const yard)
  -- (second finds everything else)
  for i=1,2 do
   for my=0,31 do
     for mx=0,127 do
       local objref=nil
       local spr_val=mget(mx,my)
       local flags=fget(spr_val)
       
       -- handle player start pos (const yard) as a special case
       if i==1 and spr_val==1 then
        -- found player start position
        pstartx=mx*8
        pstarty=my*8
        -- create player const yard
        objref=obj_data[1]

       elseif i==2
        and spr_val!=63 then --don't create "concrete" as objs
        -- find object for id
        for o in all(
         obj_data) do
         if (o.obj_spr!=nil and o.obj_spr==spr_val) objref=o break       
        end
       end
       
       if objref!=nil then
         m_map_obj_tree(objref, mx*8,my*8)
         if objref.type==1 then
           mset(mx,my,17)
         end
       end
     end
   end
 end
end

function m_map_obj_tree(objref, x,y)
  local newobj=m_obj_from_ref(objref, x,y, objref.type, nil, _g[objref.func_init], _g[objref.func_draw], _g[objref.func_update], nil)
  -- set type==3 (icon!)
  newobj.ico_obj=m_obj_from_ref(objref, 109,0, 3, newobj, nil, nil, _g[objref.func_onclick])
  newobj.life=placement_damage and objref.hitpoint/2 or objref.hitpoint -- unless built without concrete
  -- factory?
  newobj.build_objs={}
  -- go through all ref's and see if any valid for this building
  for o in all(obj_data) do
    --printh("o.parent="..(o.parent_id!=nil and o.parent_id or "nil"))
    if (o.parent_id!=nil and o.parent_id==newobj.id) then
    --printh("found child: "..o.name)
    -- set type==4 (build icon!)
    local build_obj = m_obj_from_ref(o, 109,0, 4, newobj, nil, nil, function(self)
      -- build icon clicked
      --printh("build item clicked...")
      --printh("name=.."..self.name)
      if show_menu then
        -- select building
        selected_obj=self
      else
        --auto build
        self.build_step=5/self.cost
        self.cor=cocreate(function(self)        
          -- build object
          self.buildstep=0
          self.spent=0
          while self.spent<self.cost do
            self.buildstep+=1
            if (self.buildstep>3)self.buildstep=0 credits-=1 sfx(63) self.spent+=1
            self.life=(self.spent/self.cost)*100
            yield()
          end
          -- const complete!
          sfx(56)
          -- auto-deploy units
          if self.ref.type==1 then
            -- find nearest point to factory
            local ux,uy=find_closest_free_tile((self.parent.x+8)/8, (self.parent.y+16)/8)  
            m_map_obj_tree(self.ref,ux*8,uy*8)
            -- reset build
            self.life=0
          end
        end)
      end
    end)

    add(newobj.build_objs,build_obj)
    newobj.build_obj=newobj.build_objs[1]
    end
  end

  -- player-controlled or ai?
  -- note: this whole thing may not be needed 
  -- as once we have plr start pos, that might be all we need
  newobj.owner = dist(x,y,pstartx,pstarty)<75 and 1 or 2

  -- 0=auto, 1=player, 2=computer/ai
  if newobj.owner==1 then
    newobj.faction=p_faction
    newobj.col1=p_col1
    newobj.col2=p_col2
  else
    newobj.faction=ai_faction
    newobj.col1=ai_col1
    newobj.col2=ai_col2
    --make ai icons un-clickable
    newobj.ico_obj.func_onclick=nil
  end

  -- building props?        
  if objref.type==2 then
    newobj.deathsfx=53
    -- prepare the map?
    local xpos=flr(x/8)
    local ypos=flr(y/8)
    local slabs=(objref.id==2 or objref.id==3)
    for xx=0,objref.w-1 do
      for yy=0,objref.h-1 do
        mset(xpos+xx, ypos+yy, slabs and 63 or 95)
      end
    end
    if (not slabs) add(buildings,newobj)
    -- other building stuff
    if(newobj.id==7 and newobj.owner==1)has_radar=true
  end
  -- unit props
  if objref.type==1 then
   newobj.deathsfx=54
    if (newobj.norotate!=1) newobj.r=flr(rnd(8))*.125
    -- combat stuff
    newobj.fire=function(self)
      printh("fire...")
      printh("life b4="..self.target.life)
      self.target.life-=self.arms
      printh("life after="..self.target.life)
      self.target.hit=1 --0=none, 1=bullet, 2=missile
      self.target.hitby=self
      sfx(self.arms<100 and 60 or 58)
    end    
    add(units,newobj)
    -- default to guard
    do_guard(newobj)
  end
  reveal_fow(newobj)
end

function m_obj_from_ref(ref_obj, x,y, in_type, parent, func_init, func_draw, func_onclick)
 local _w=(ref_obj.w or 1)*8 -- pixel dimensions
 local _h=(ref_obj.h or 1)*8 --
 local obj={
  ref=ref_obj,
  x=x,
  y=y,
  z=1, -- defaults
  type=in_type, -- 1=unit, 2=structure, 3=obj_status_icon, 4=build_icon, 9=worm
  parent=parent,
  func_onclick=func_onclick,
  w=_w,
  h=_h,
  orig_spr=ref_obj.obj_spr,
  spr_w=ref_obj.w or 1, -- defaults
  spr_h=ref_obj.h or 1, --
  life=0,
  frame=0,
  fire_cooldown=0,
  hit=0,
  get_hitbox=function(self)
    return {
     x=self.x,
     y=self.y,
     w=(self.type>2 and 16 or self.w)-1,
     h=(self.type>2 and 16 or self.h)-1
    }
   end,
   draw=func_draw or function(self)--, x,y) 
     pal()
     palt(0,false)
     if (self.trans_col) palt(self.trans_col,true)     
     -- faction?
     if (self.faction) pal(12,self.col1) pal(14,self.col2)
     -- colour anim?
     if self.col_cycle then
       pal(self.col_cycle[self.col_cycle_pos][1],
           self.col_cycle[self.col_cycle_pos][2])
     end
     -- rotating obj?
     if self.r then
      rspr(self.obj_spr%16*8,flr(self.obj_spr/16)*8, self.x, self.y+1, .25-self.r, 1, self.trans_col, 5)
      rspr(self.obj_spr%16*8,flr(self.obj_spr/16)*8, self.x, self.y, .25-self.r, 1, self.trans_col)      
     -- norm sprite
     else      
       -- icon mode?
       if self.type>2 then
         rectfill(self.x-1,self.y-1,self.x+16,self.y+19,0)
         -- draw health/progress
         local this=self.type==4 and self or self.parent
         local hp=this.ref.hitpoint
         local col = this.build_step and 12 or (this.life<hp*.33 and 8 or this.life<hp*.66 and 10 or 11)         
         local val = this.build_step and (15*this.life/100) or (15*this.life/hp)         
         if (this.life>0) rectfill(self.x,self.y+17,self.x+val,self.y+18,col)
       end
       -- non-rotational sprite
       if self.type>2 then 
        -- icon
        spr(self.ico_spr, self.x, self.y, 2, 2)
       else
        -- building
        spr(self.obj_spr, self.x, self.y, self.w/8, self.h/8)
       end
     end
     
     -- hit? temporary code!
     if self.hit>0 then
      printh("draw HIT!!!! - id="..self.ref.id)
      spr(19, self.x+rnd(self.w)-4, self.y+rnd(self.h)-4)      
      --self.hit=0
     end
     -- exploding?
     if self.state==5 then
      palt(11,true)
      spr(19, self.x+rnd(self.w)-4, self.y+rnd(self.h)-4)
     end     
 
     if (debug_collision) draw_hitbox(self)
   end,
   update=function(self)
     -- check for death
     if (self.life<=0 and self.death_time==nil) self.state=5 self.death_time=t()+1 sfx(self.deathsfx)
     if self.death_time and t()>self.death_time then
      if self.type==2 then
       -- building?
       for xx=0,self.ref.w-1 do
        for yy=0,self.ref.h-1 do
          mset(self.x/8+xx, self.y/8+yy, 14)
        end
       end
       del(buildings,self)
      else
       -- unit
       del(units,self)
      end      
      if(selected_obj==self)selected_obj=nil
     end

     -- animated colour cycle (if applicable)
     if self.framecount!=nil then
      self.frame+=1
      if (self.frame > self.framecount) then
       self.frame=0
       -- alternate moving frame?
       if self.altframe 
        and self.state==2 then
         self.obj_spr=self.orig_spr+(self.altframe-self.obj_spr)
       end
 
       if self.col_cycle then
         self.col_cycle_pos+=1
         if (self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
       end
      end
     end
   end,

   setpos=function(self,x,y)
    self.x=x
    self.y=y
   end
  }

 -- copy ref properties to object (where empty!)
 for k,v in pairs(ref_obj) do
  if obj[k]==nil and v!="" then
   obj[k] = v
  end
 end

 -- finally, init obj
 if (func_init) func_init(obj)

 return obj
end


function reveal_fow(object)
 -- only reveal if
 -- > player
 -- > firing ai
 if(object.owner!=1 and object.state!=4)return

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

 update_ai()  -- ai overall decision making (not individual units)
 
 -- update positions of pathfinding "blocker" objects
 if (t()%1==0) update_obj_tiles()
 if (t()%1.5==0) update_radar_data()
 _t+=1
end


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

     palt(11,true)

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


function update_radar_data() 
 printh("update radar!!")
 radar_data={}
 -- landscape/fow
 if hq then
   for i=0,124,4 do
     for l=0,124,4 do
     -- look at tile spr and if not fow, get col?
     local mx=i/2
     local my=l/2
     if(my>=32)mx+=64 my-=32
     local mspr=mget(mx,my)
     local sx=(mspr*8)%128
     --local sx=max((mspr*8)%128,1)  
     local sy=(mspr*8)/16
     local col=sget(sx+4,sy)
     radar_data[((i/2)/2)..((l/2)/2)] = col!=11 and col or 15
     --if(fow[i/2][l/2]==16) radar_data[((i/2)/2)..((l/2)/2)] = col!=11 and col or 15
     end
   end
 end
  
 -- -- structures
 -- for _,building in pairs(buildings) do 
 --   local posx=flr(building.x/8)
 --   local posy=flr(building.y/8)
 --   -- if our building, or ai not under fog of war
 --   if building.owner==1 or (hq and fow[posx][posy]==16) then
 --    radar_data[flr(building.x/2/8)..flr(building.y/2/8)] = building.col1
 --   end
 -- end
 -- -- units
 -- if hq then
 --   for _,unit in pairs(units) do
 --     local posx=flr(unit.x/8)
 --     local posy=flr(unit.y/8)
 --     -- if our unit, or ai not under fog of war
 --     if unit.owner==1 or fow[posx][posy]==16 then
 --      radar_data[flr(unit.x/2/8)..flr(unit.y/2/8)] = unit.col1
 --     end
 --   end
 -- end

end

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
  left_button_down = (mouse_btn>0) or btn(4)
  right_button_clicked = btnp(5)
  
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
 if not show_menu then 
  -- auto-scroll (pan) map
  if (cursx<4) camx-=2
  if (cursx>123) camx+=2
  if (cursy<4) camy-=2
  if (cursy>123) camy+=2

  -- lock cam to map
  camx=mid(camx,384)  --896
  camy=mid(camy,384)  --128
 end

 update_coroutines()

 collisions()

 ticks+=1
 last_mouse_btn = mouse_btn
 last_selected_obj = selected_obj
 last_selected_subobj = selected_subobj
end

function do_guard(unit) 
 printh("do_guard()!!")
 -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding
 unit.state = 0
 --unit.cor = nil -- todo: this!!
 unit.cor = cocreate(function(self)
  while true do  
   -- todo: be on look-out

   -- todo: check for attack
   --printh("do_guard() > check for hit, id="..self.ref.id)
   --if (self.ref.id==25 and self.owner==1) printh("HIT id("..self.ref.id.."="..tostr(self.hit))
   if self.hit>0 then 
    printh("do_guard() > HIT!!")    
    self.hit-=0.5
    --self.hit=0
    -- switch music?
    if (music_state!=1)music_state=1 music(0)
    -- can we retaliate?
    if (self.arms>0) do_attack(self, self.hitby)
   end
   yield()
  end
 end)
end

function do_attack(unit, target)
 printh("do_attack()...")
 -- 0=idle/guareding, 1=pathfinding, 2=moving, 3=attacking, 5=exploding
 unit.state = 3
 unit.target=target
 unit.cor = cocreate(function(self)
  while target.life>0 do
  self.hit-=0.5
    --self.hit=0
   -- todo:
   --  1) move to within firing range of target
   if dist(unit.x,unit.y,target.x,target.y) > unit.range*5 then
    -- move to within firing range of target
    move_unit_pos(unit,flr(target.x/8),flr(target.y/8),unit.range*5)
   end
   -- 2) turn to face target
   if not unit.norotate then
    local a=atan2(unit.x-target.x, unit.y-target.y)   
    while (unit.r != a) do
      turntowardtarget(unit, a)
      self.hit-=0.5
    --self.hit=0
    end
   end
   -- 3) commence firing
   unit.fire_cooldown-=1
   if (unit.fire_cooldown<=0) unit.fire(unit) unit.fire_cooldown=unit.arms*2
   
   yield()
  end -- 4) repeat 1-3 until target destroyed

  -- reset music back (will set again if more attackers)
  set_loop(5, false) 
  music_state=0

  -- reset to guard
  do_guard(self)
 end)

end

-- todo: this needs to work outwards, up to max dist!
function find_closest_free_tile(x,y,max_dist)  
  -- ...to the target pos
  for dist=1,max_dist or 64 do
    for xx=x-dist,x+dist do  -- todo: increment this out by one, on every unsuccessful pass
      for yy=y-dist,y+dist do
        if ((xx==x-dist or xx==x+dist or yy==y-dist or yy==y+dist) and (is_free_tile(xx,yy))) return xx,yy
      end
    end
  end
end

function is_free_tile(x,y)
 printh("is_free_tile("..x..","..y..")")
 return not fget(mget(x,y), 0) 
   and object_tiles[x..","..y]==nil
end

function move_unit_pos(unit,x,y,dist_to_keep)
 --printh("move_unit_pos("..x..","..y..","..(dist_to_keep or "nil")..")")
  unit.path="init"   
  -- check target valid
  if not is_free_tile(x,y) then
    -- target tile occupied
    -- move as close as possible
    x,y=find_closest_free_tile(x,y)
    -- for xx=x-1,x+1 do  -- todo: increment this out by one, on every unsuccessful pass
    --  for yy=y-1,y+1 do
    --   if (is_free_tile(xx,yy)) x=xx y=yy goto found_free_tile
    --  end
    -- end
    -- abort as target invalid
    --printh("aborting pathfinding - invalid target")
    
    --return    
  end
   --::found_free_tile::

  -- create co-routine to find path (over number of cycles)  
  unit.tx = x
  unit.ty = y
  -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding
  unit.prev_state = unit.state
  unit.state = 1
   
  -- findpath_cor --------------------------------------
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
  unit.prev_state = unit.state
  unit.state = 2

  -- movepath_cor ------------------------------------
  unit.state=2 --moving
  -- loop all path nodes...
  for i=#unit.path-1,1,-1 do
    local node=unit.path[i]

    if not unit.norotate then
      -- rotate to angle
      local dx=unit.x-(node.x*8)
      local dy=unit.y-(node.y*8)
      local a=atan2(dx,dy)
      --printh("  >> target angle="..a)
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
    reveal_fow(unit)

    -- are we close enough?
    local d=dist(unit.x,unit.y,unit.tx*8,unit.ty*8)
    printh("        dist = "..d)
    printh("dist_to_keep = "..tostr(dist_to_keep))
    if d <= (dist_to_keep or 0) then
      -- stop now
      printh("stop!!! close enough!")
      break
    end
  end

  -- arrived?
  unit.state=0 --idle

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

-- ai strategy code (attack, build, repair, etc.)
function update_ai()
  if (t()==1) then
    -- todo: find the first ai unit and attack player
    local unit=units[#units]
    local target=units[3]
    do_attack(unit, target)
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
   palt(11,true)
   spr(16, selected_obj.x, selected_obj.y)
  end
 end

 -- draw fog-of-war
 --draw_fow()
end



function draw_radar()
  local size=31
  local x,y=93,93
  rectfill(x-1,y-1,x+size+1,y+size+1,p_col2)
  
  -- has radar-outpost and enough power?
  if (has_radar) hq=true
  
  rectfill(x,y,x+size,y+size,0)

  -- anim?
  -- https://youtu.be/T337FK6L0h0?t=2891
  if hq!=last_hq then
    radar_frame=1
    radar_dir=1
    sfx(55)
  end  
  last_hq=hq

  if radar_frame>0 and radar_frame<60 then
    radar_frame+=radar_dir
    -- draw radar anim
    clip(
      max(x+(size/2)-radar_frame,x),
      max(y+(size/2)-(radar_frame>20 and radar_frame-20 or 0),y), --y+size/2,
      min(radar_frame*2,size),
      min((radar_frame>20 and radar_frame-20 or 1)*2,size))
    for i=1,300 do
      pset(x+rnd(size),y+rnd(size),5+rnd(3))
    end
    return
  end
   
  -- TODO draw radar data here!
  for xx=0,size do
   for yy=0,size do
    if (radar_data[xx..yy]) pset(x+xx,y+yy,radar_data[xx..yy])
   end
  end
  
  -- draw "view" bounds
  local cx=x+camx/16
  local cy=y+camy/16
  rect(cx,cy, cx+7,cy+7, 7)

end


function draw_ui()
 -- ui (score, mouse, etc.)
 camera(0,0)
 pal()
 -- selected objects?
 palt(0,false) 
 
 -- object menu icon/buttons?
 if selected_obj and selected_obj.ico_obj then
  selected_obj.ico_obj:setpos(109,20)
  selected_obj.ico_obj:draw()--109,20)  
  if selected_obj.build_obj and selected_obj.owner==1 then
    selected_obj.build_obj:setpos(109,44) 
    selected_obj.build_obj:draw()--109,44)  
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
  and selected_obj.build_obj.ref.type==2
  and selected_obj.build_obj.life>=100 then
  -- draw placement
  -- (todo: improve this code!)
  local mxpos=flr((cursor.x+camx)/8)
  local mypos=flr((cursor.y+camy)/8)
  local sxpos=mxpos*8-camx
  local sypos=mypos*8-camy

  -- check ok to place
  placement_pos_ok=false
  placement_inner_invalid=false
  placement_damage=false
  local w=selected_obj.build_obj.ref.w
  local h=selected_obj.build_obj.ref.h

  for xx=-1,w do
    for yy=-1,h do
     if xx==-1 or xx==w or yy==-1 or yy==h then     
      -- check edges
      if (mget(mxpos+xx, mypos+yy)>=63) placement_pos_ok=true
     else
      -- check inner
      local val=mget(mxpos+xx, mypos+yy)
      if (val>=2 and val<=7) placement_damage=true
      if (object_tiles[mxpos+xx..","..mypos+yy] or val==0 or (val>=8 and val<63) or val>63) placement_inner_invalid=true
     end
    end
  end
  if (placement_inner_invalid)placement_pos_ok=false

  fillp("0b1110110110110111.1")
  rectfill(sxpos, sypos,
           sxpos+selected_obj.build_obj.w, sypos+selected_obj.build_obj.h, placement_pos_ok and 11 or 8)
  fillp()
 end

 draw_radar()

 if show_menu then
  -- test
  draw_dialog(121,73,p_col2, p_col1)

  -- build menu?
  if selected_obj.build_objs then
    rectfill(6,30,27,97,0)
    for i=1,#selected_obj.build_objs do
     local curr_item=selected_obj.build_objs[i]
     if i>=menu_pos and i<=menu_pos+2 then
      curr_item:setpos(9,32+((i-menu_pos)*19))
      curr_item:draw()
     else
      -- hide!
      curr_item:setpos(-16,16)
     end
     -- draw selected reticule
     if (selected_subobj == curr_item) then 
      sel_build_item_idx=i
      rect(curr_item.x-2, curr_item.y-2, 
          curr_item.x+17, curr_item.y+17, 
          7)

      print(selected_subobj.name,30,31,7)
      print("cOST:"..selected_subobj.cost,85,38,9)
      yoff=0
      local desc_lines=create_text_lines(selected_subobj.description, 23)
      for l in all(desc_lines) do
       print(l,30,44+yoff,6)
       yoff+=6
      end

     end
    end
  end

  -- ui elements (buttons)?
  for _,controls in pairs(ui_controls) do 
    --controls:update()
    controls:draw()
  end
 end

 -- cursor
 palt(11,true)
 cursor:draw()
end

function draw_dialog(w,h,bgcol,bordercol)
 fillp(0xA5A5.8)
 rectfill(0,0,127,127,0)
 fillp()

 rectfill(64-w/2, 64-h/2, 64+w/2, 64+h/2, bgcol)
 rect(64-w/2+1, 64-h/2+1, 64+w/2-1, 64+h/2-1, bordercol) 
end

function m_button(x,y,text,func_onclick,_w)
local obj={
  x=x,
  y=y,
  w=_w or #text*4+2,
  h=8,
  text=text,
  get_hitbox=function(self)
    return {
     x=self.x,
     y=self.y,
     w=self.w,
     h=self.h
    }
   end,
  draw=function(self)
    if(#text>1)rectfill(self.x,self.y,self.x+self.w,self.y+self.h, 7)
    if(#text>1)rectfill(self.x+1,self.y+1,self.x+self.w-1,self.y+self.h-1, self.hover and 12 or 6)
    print(self.text,self.x+2,self.y+2,(#text>1) and 0 or (self.hover and 12 or 7))

    if (debug_collision) draw_hitbox(self)
  end,
  func_onclick = func_onclick
 }
 add(ui_controls,obj)
end

-- auto-break message into lines
function create_text_lines(msg, max_line_length) --, comma_is_newline)
	--  > ";" new line, shown immediately
	local lines={}
	local currline=""
	local curword=""
	local curchar=""
	
	local upt=function(max_length)
		if #curword + #currline > max_length then
			add(lines,currline)
			currline=""
		end
		currline=currline..curword
		curword=""
	end

	for i = 1, #msg do
		curchar=sub(msg,i,i)
		curword=curword..curchar
		
		if curchar == " "
		 or #curword > max_line_length-1 then
			upt(max_line_length)
		
		elseif #curword>max_line_length-1 then
			curword=curword.."-"
			upt(max_line_length)

		elseif curchar == ";" then 
			-- line break
			currline=currline..sub(curword,1,#curword-1)
			curword=""
			upt(0)
		end
	end

	upt(max_line_length)
	if currline!="" then
		add(lines,currline)
	end

	return lines
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
 if not show_menu then  
  -- unit collisions
  foreach(units, check_hover_select)
  -- building collisions 
  foreach(buildings, check_hover_select)
 end
 -- selected obj ui collision
 if selected_obj then
   ui_collision_mode=true
   if (selected_obj.ico_obj and not show_menu) check_hover_select(selected_obj.ico_obj)
   foreach(selected_obj.build_objs, check_hover_select)
   foreach(ui_controls, check_hover_select)
   --if (selected_obj.build_obj) check_hover_select(selected_obj.build_obj)
   ui_collision_mode=false
 end
  
    -- check for radar click
 if left_button_down
    and not show_menu 
    and cursx>93 and cursx<120
    and cursy>93 and cursy<120 then
      -- clicked radar
      camx=min((cursx-94)*16, 400)
      camy=min((cursy-94)*16, 400)

 -- clicked something?
 elseif left_button_clicked then
 
  if clickedsomething then
   --show_menu=nil
    -- object "button"?
    if (not show_menu and selected_obj.func_onclick and selected_obj.parent!=nil) selected_obj:func_onclick() selected_obj=last_selected_obj
    if (show_menu and selected_subobj.text and selected_subobj.func_onclick) selected_subobj:func_onclick() --selected_subobj=last_selected_subobj
  
    -- clicked own unit, first time?
    if (selected_obj.owner==1 and selected_obj.type==1 and selected_obj!=last_selected_obj) sfx(62)
    
    -- clicked enemy object, last clicked ours... attack?
    if (selected_obj.owner==2 and last_selected_obj and last_selected_obj.type==1 and last_selected_obj.owner==1) do_attack(last_selected_obj, selected_obj) selected_obj=nil

  -- deselect?
  else 
    -- do we have a unit selected?
    if selected_obj and selected_obj.type==1
    and selected_obj.owner==1 then

     selected_obj.cor = cocreate(function(unit)
       move_unit_pos(unit, flr((camx+cursx)/8), flr((camy+cursy)/8))
      end)

    end
    
    -- placement? (temp code!)
    if selected_obj 
     and selected_obj.build_obj 
     and selected_obj.build_obj.life>=100
     and placement_pos_ok then
      -- place object
      local xpos=flr((cursor.x+camx)/8)
      local ypos=flr((cursor.y+camy)/8)
      local objref = selected_obj.build_obj.ref
      m_map_obj_tree(objref,xpos*8,ypos*8)            
      -- reset build
      selected_obj.build_obj.life=0
      sfx(61)
    end

    if (not show_menu) selected_obj=nil
    --if (not show_menu and placement_pos_ok) selected_obj=nil
  end 
  
 end --if buttonclicked

end

function check_hover_select(obj)
  obj.hover = collide(cursor, obj)
  if left_button_clicked and obj.hover then
   if show_menu then
    selected_subobj = obj
   else
    -- is object hidden by fow?
    local xpos=flr((cursor.x+camx)/8)
    local ypos=flr((cursor.y+camy)/8)
    if (obj.type<=2 and fow[xpos][ypos]!=16) return
    selected_obj = obj
   end
   clickedsomething=true
  end
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
  self.obj_spr=a.frames[self.curframe]
  
 end
end

--other helper functions
--------------------------------

-- set/unset the loop flag
-- for specified pattern
function set_loop(pattern, enabled)
  local addr = 0x3100
  local channel = 1 -- 0..3 (+1 to get 2nd channel's byte)
	pattern*=4 -- find right byte (each pattern has 4 channels)
	local val=peek(addr + pattern + channel)
  if ((band(val, 128) > 0) != enabled) val=bxor(val,128)
  poke(addr+pattern+channel, val)  
end

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
 str_arrays=split(obj_data,"|","\n")
 new_data={}
 -- loop all objects
 for i=2,#str_arrays-1 do
  new_obj={}
  -- loop all properties
  for j=1,#str_arrays[i] do
   local val=str_arrays[i][j]
   -- convert all but the text columns to numbers
   if (j!=2 and j<23) val=tonum(val)
   new_obj[str_arrays[1][j]]=val
  end
  new_data[tonum(str_arrays[i][1])]=new_obj
 end
 -- replace with exploded data
 obj_data=new_data
--  -- test new structure!
--  printh("test 8:"..obj_data[2].name)
--  printh("test 98:"..obj_data[2].id)
--  printh("test 98b:"..obj_data[2].func_init)
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

function rspr(sx,sy,x,y,a,w,trans,single_col)
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
				if (c!=trans) pset(x+ix,y+iy, single_col or c)
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

-- fixed sqrt to avoid overflow
-- https://www.lexaloffle.com/bbs/?tid=29528
function dist(x1,y1,x2,y2)
 return abs(sqrt(((x1-x2)/1000)^2+((y1-y2)/1000)^2)*1000)
end


--
-- pathfinding-related
--

pi = 3.14159
turnspeed = .5 * (pi/180)

function turntowardtarget(unit, targetangle)
   diff = targetangle-unit.r   
   -- never turn more than 180
   if diff > 0.5 then
    --printh("big angle 1")
    diff -= 1
   elseif diff < -0.5 then
    --printh("big angle 2")
    diff += 1
   end
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

   yield()   
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
 if (
  not fget(mget(nx,ny), 0) 
  and object_tiles[nx..","..ny]==nil
 )
  then 
   add(ntable, {x=nx, y=ny}) 
 end
 --printh("test passed.")
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
bbbbbbbbbbb1bbbbf5d555d555d555d55d555d5fffffffff1d5155555d555d5fffffffff99f99999ffffffffffffffff9f99f9f9ff9f9999ddddddddffffffff
bb11bbbbbb171bbb1555515d15555155d51555515dfffd5f5155d55dd5155551ffff9fff9f9999f9fff9fffffffffffff99f99f999f99899d5555555ffffffff
bb171bbbb1bbb1bb5d55d5515d55d555155d55d5d5155551555d5155155d55d5ffff999999ff99999999ffffffffffff9f99f99f9f9989f9d5015515ffffffff
bb1771bb17b1b71b55515d5555515d5d55d51555155d55d5d5555d5555d51555fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899d5105555ffffffff
bb17771bb1bbb1bbd55d5555d55555555555d55d55d5155555d155d55555d55dfffff9f9fff999999f9fffffff99f999f9ffff9f99998f99d5555111ffffffff
bb177771bb171bbb55d551d555d515555d155d555555d55d155555555d155d55ffff999999999f999999ffff999f99f9fffffffffff89999d1555101ffffffff
bb17711bbbb1bbbb1555555515555515555555515d155d55f51ffd5f55555551fff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99d5555111ffffffff
bbb11bbbbbbbbbbbf55d5515555d55555155d55f55555551ffffffff5155d55fffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9d5515555ffffffff
b7bbbb7bffffffffffffffffbb88888bffffffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
77bbbb77fffffffffff77fffb8899998fffffffff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
bbbbbbbbffffffffff79ff7f8999a98bfffffffff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
bbbbbbbbfffffffff79f779f889aa988fffffffff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
bbbbbbbbfffffffffff799ffb89aa998fffffffff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
bbbbbbbbffffffffff799fff899aa98bfffffffff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
77bbbb77ffffffffff79ffff88999988fffffffff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffb88898bbffffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb6bbb6bbb6bbb6bbdddddddd
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb8bbb8bbb8bbb8bbd5555555
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbffffffffffffffffffffffffffffffffbbbddbbbb7b55b7bb2bbb2bbb2bbb2bbd5555555
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbffffffffffffffffffffffffffffffffbbd66dbbb651156bb0bbb0bb0b0b0b0bd5555555
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbffffffffffffffffffffffffffffffffbbd66dbbbdd66ddbbbb6bbbbbbb6bbbbd5555555
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbffffffffffffffffffffffffffffffffbbbddbbbb1b11b1bbbb8bbbbbbb8bbbbd5555555
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbbd5555555
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbd5555555
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddddd6666dddddddddddddddddddddddddddddddddddddddddd19999999999999977777777
76665555551ffff1d576db65d5577655d5555555d5766665d5555555d566777655555555d555555555555555d766777755555555d49495594999924976666665
76665c05555f4441d76dbbb5d576db65d5556555d5766665d5ccccc5d767666d65555555d554777777777455d7ddfff755555555d19425599922999976666665
177dee055d5ffff1d66d11b5d76dbbb5d5576655d5677725d5555555d767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f412141976666665
d1d55505555f1011d66d01b5d66d11b5d55d7d55d566dd25d55eee55d766ddd665555555d504777778617405d4447ff7265557f6d19565656599995976666665
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d676666625555555d544ff7ff6d1f445d4047777655777fdd49995555594495976666665
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d555e555d667ddd225666655d504777771177405d44444442657ffffd19495c05594495976666665
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d55eee55d66d11d2266c0765d544ff7fff7ff445d55544445557ff7fd4999ee05594495955555555
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd56d11d276ee06d6d504777777777405d76677775557ff7fd195594095999959dddddddd
d555555515555155d55576db65555555d5766665d5555555d55eee55d55d11d5767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779d5ddddd5
d555555a5d55d555d5576dbbb555c055d5766665d5556555d555e555d5555555766d0d66d542222222222245d7777f77655444449999529925777777d55ddd55
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555d555555567666662d52c02c020200225d4447ff7265c04c09429444444776666d555d555
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55eee55d5555555667dd722d5ee0ee022200225d404777765ee0ee09999242424766666d5551555
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d555555566d11d22d551011011111115d444444426550550944242424296666dd5511155
d544445a15555515d5556dd5d5555555d556dd55d555d555d5ccccc5d555555556d11d25d555011011111155d555444455550550944242424294ddd2d5111115
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d555555555d11d55d555511111111555d555222255555555d555555555594425d1111111
dddd666666ddddddddd777c666666dddddddddddddddddddddddd666666666660000000000000000000000000000000000000000000000000000000000000000
d566ddddd61111106667deeddddd657667555555d557755555555ddddd4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5dddd000066dd666dd7dd0dd6666dddddd56765d566969666655ddddd4ddd5d0000000000000000000000000000000000000000000000000000000000000000
d5dd0000001111dd6dd7660dd6dd611111ddddd5d5ddadadddd55ddd5ddd5ddd0000000000000000000000000000000000000000000000000000000000000000
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5dd0000000000000000000000000000000000000000000000000000000000000000
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd440000000000000000000000000000000000000000000000000000000000000000
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5ddd0000000000000000000000000000000000000000000000000000000000000000
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5d0000000000000000000000000000000000000000000000000000000000000000
d555f655551d6d106d777777711110455542542575777777766767667d4d5ddd0000000000000000000000000000000000000000000000000000000000000000
d5516615551d6d106d7011111ddd6445555555557d7c0777767767767d4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d755555550000000000000000000000000000000000000000000000000000000000000000
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd765555550000000000000000000000000000000000000000000000000000000000000000
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d6755550000000000000000000000000000000000000000000000000000000000000000
d555550f050aaa000001d1111111105555555555ddddddd07777777776d755550000000000000000000000000000000000000000000000000000000000000000
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd77755550000000000000000000000000000000000000000000000000000000000000000
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd55550000000000000000000000000000000000000000000000000000000000000000
ccccccccccccc0cccccccccccccccccccccccccccccccccc9ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc79999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
ccccccccccccccdccccc67111dcccccc11116666dc0157d799999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
9accc5acccccc55cccc6660dd1dccccc6d1d111166665757777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
575c544aaaccccccccd6650001dccc7776d76d1c1111111066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
5d75144444aaaccc9dddd055d1d996666d1dd11cc56505556666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
9511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6ddddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
9001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7ddddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
50d019999999151501755000001d55556d1d4d9949945499dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
501015aaaaaaa44450155ddddddd66996d19999999666666dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
4500545aa744444566666666666666669999999966776767dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
544454444444544466666666555555554999996777777776dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
4554444544544454555555559999f99999446776677676985555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
54445544554545449f9999f9999999f9997777777767988755555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
455454554555544599fffffff9f99999477777667798897755555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
ffffffffffffffffffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc60ccc06cccccccccccccccccccccccccccc
ffffffffffffffffffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999cccc77cccccc515cc8115cccccc8787ccccccccccccccccc
ffffffffffffffffffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cc77577cccc51cccc00015cccc755567cccccccccccccccc
ffffffffffffffffffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fcc5775d60051ccccc808d15006d85866cccccccccccccccc
ff77777777ffffffff77757777ffffffccc7776666766666c77d677cccc76777977ff55555555447ccc5566dd106ccccc000d601dd6555ddccc5f7cccccccccc
ff766666666fffffff766657666fffff7776666666766666c77d6c7cc66677777ff2211757575444ccc7666666666cccc8086666666858dd9cc65c6f6ccccccc
ff7666666666ffffff5555565555ffff6676666666766666c77d6c7cccc77766ff22115353535554ccc0000000000ccccccc00000000001149cffcf80ccccccc
f766666666666ffff777777577777fff6676666666766666c7d66c7ccc777655ff77555555555555ccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0f6cd0cccc
f7666666666666fff7666665766666ff6676666666766666c7c651cc777765007722115555555577ccdd66ddddddd5ccccc5ddddddd66ddc4443ff005c01cccc
f76666666666666ff76666665766666f6676666666766666fd87151fffffffff422215577755576fccddd66dd555d5ccccc5d555dd66dddc22450f605d0ffff9
f55555555555555ff55555555555555f6676666666766666f668777fffffffff4221557fff7776ff9ccdd665555555c999c555555566ddcc42444665501ff9ff
ffffffffffffffffffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd999dd6666666d5999995d6666666dd9944446f600244ff99
fffffffffffffffffffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d999dd6666666d5999995d6666666dd99244355f332494fff
fffffffffffffffffffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff6999dd6677766d5999995d6677766dd9924335203504449f9
fffffffffffffffffffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f99ddd66dd566d5999995d665dd66ddd9446f2446f09999ff
ffffffffffffffffffffffffffffffffffffffffffffffddfffffffff666d222999995554444444799dd666dd5666d59995d6665dd666dd9443324430044499f
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffc7cccccccccccccccccccccceeeeeeeeeeeeeeee
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff54ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660ccccc2888887660cccc4ff54cccccccccccccc7ffc455550ceeeeeeeeeeeeeeee
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cccc288888887ccccccc54cccccff5ccccccc44ffff4ccccceeeeeeeeeeeeeeee
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444ccccc5225222222287ccc45555cc4ffffcccc50005444544ccceeeeeeeeeeeeeeee
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cc55588888888855cc54fffffffffff5cc5000005ffff505ceeeeeeeeeeeeeeee
916666d001110009cccc00df00cccccc95060000000006599504000000000459950600000000065995040000000004599500000599940009eeeeeeeeeeeeeeee
f90500000444000999999900ff99999999555555555555999955555555555599995555555555559999555555555555999950005222225059eeeeeeeeeeeeeeee
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999feeeeeeeeeeeeeeee
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f999999eeeeeeeeeeeeeeee
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff9eeeeeeeeeeeeeeee
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999eeeeeeeeeeeeeeee
9fffff99999999ff9999999f99999ff999fffff9999f99999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99eeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeecccccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee6ccccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee76cccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee765cc77775cccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee7756777780777ccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee765d656520dd777c
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee775cdd5d1ccc775d
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeccc5ccc505ccd667
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeecc5ccccdcdccdddc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeec5ccccccccccc5cc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee99dd999999999599
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9455d44444444549
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9444444449999999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee999999999999f999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9999999999998999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9999999999999999
__label__
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
000000000000000000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000000000000000000000000000000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007770777077707770777077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707000700070007070000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007070707077700770077077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707070000070007000700
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000007770777077707770777077700
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
0000000000000000000100000000fffffffffffffffffffffffffffffffffffffffffffffffffff66ffffffffffffffffff00000000000000000000000000000
0000000000000000000ff000000ff6fffffff6fffffff6ffffffffffffffffffffffffffffffff2277fffffffffffffff1000000000000000000000000000000
000000000000000000f1f1f1f1ffffffff6fffffff6fffffff6ffffffffffffffffffffffffff220877fffffffffffff1f000000000000000000000000000000
000000000000000001ffff1f1ffffffffffffffffffffffffffffffffffffffffffffffffffff6886d76fffffffffffff1000000000000000000000000000000
00000000000000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff578d786ffffffffffff1f000000000000000000000000000000
0000000000000001f1fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffff57d8d5fffffffffffff1000000000000000000000000000000
00000000000000ff1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5685fffffffffffffff000000000000000000000000000000
0000000000001f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55fffffffffffffffff00000000000000000000000000000
000100000000fffffffffffffffffffffffffffffffff6fff6ffddddddddddddddddfffffffffffffffffffffffffffffff00000000000000000000000000000
000ff000000ff6fffffff6fffffff6fffffff6fffffff8fff8ffd766777755555555fffffffffffffffffffffffffffff1000000000000000000000000000000
00f1f1f1f1ffffffff6fffffff6fffffff6fffffff6ff2fff2ffd7ddfff755555555ffffffffffffffffffffffffffff1f000000000000000000000000000000
01ffff1f1fffffffffffffffffffffffffffffffffff0f0f0f0fd7777f7765555777fffffffffffffffffffffffffffff1000000000000000000000000000000
0f1ffffffffffffffffffffffffffffffffffffffffffff6ffffd4447ff7265557f6ffffffffffffffffffffffffffff1f000000000000000000000000000000
f1fffffffffffff6fffffff6fffffff6fffffff6fffffff8ffffd4047777655777fdfffffffffffffffffffffffffffff1000000000000000000000000000000
1ffffffffffffffffffffffffffffffffffffffffffffff2ffffd44444442657ffffffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffff0f0fffd55544445557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd76677775557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
7ffffffffffffffffffff6fffffff6fffffff6ffffffffffffffd7ddfff755577777fffffffffffffffffffffffffffff1000000000000000000000000000000
ff7fffffffffffffffffffffff6fffffff6fffffff6fffffffffd7777f7765544444ffffffffffffffffffffffffffff1f000000000000000000000000000000
779fffffffffffffffffffffffffffffffffffffffffffffffffd4447ff726580480fffffffffffffffffffffffffffff1000000000000000000000000000000
99ffffffffffffffffffffffffffffffffffffffffffffffffffd404777765220220ffffffffffffffffffffffffffff1f000000000000000000000000000000
9ffffffffffffffffffffff6fffffff6fffffff6ffffffffffffd444444426550550fffffffffffffffffffffffffffff1000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555444455550550ffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555222255555555fffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffd199999999999999ddd776ddddddddddffffffffffffffffffffffffffffffff0000000000000000000000001000
ffffffffffff0288220ff6ffffffffffffffd494955949999249d576d165d5577655ffffffffffffffffffffffffffff9ffff000000f90000009900000099000
ffffffffffff8d66d82fffffff6fffffffffd194255999229999d76d1115d576d165ffffffffffffffffffffffffffff9999f1f1f1ff91f1919991f191991900
ffffffffffffd7776660ffffffffffffffffd495f5f4f4121419d66d1115d76d1115fffffffffffffffffffffffffff99f9ff91f1f9f99191f9999191f999900
ffffffffffffd7776660ffffffffffffffffd195656565999959d66d0115d66d1115fffffffffffffffffffffffffffff9f9ff99f999fff99999fff99999f1f0
ffffffffffff8d66d825fff6ffffffffffffd499955555944959d66d0155d66d0115ffffffffffffffffffffffffffff9999999f99f999999f9999999f999919
ffffffffffff0288220fffffffffffffffffd194958055944959d56dd555d66d0155fffffffffffffffffffffffffff99f9f9f99f99f99fff9f999fff9f999f1
ffffffffffff5555555fffffffffffffffffd499922055944959d5555555d56dd555ffffffffffffffffffffffffffff99f9f99f99f9ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffffffffffd195594095999959ddddd776ddddddddffffffffffffffffffffffff99f9999999f99999ff9f999999f9999999f9
ffffffffffffffffffffffffffffffffffffd495594495977779d55576d165555555ffffffffffff9fffffffffff9f9999f99f9999f999f998999f9999f99f99
ffffffffffffffffffffffffffffffffffff9999529925777777d5576d1115558055ffffffffffff9999ffffffff99ff999999ff99999f9989f999ff999999ff
ffffffffffffffffffffffffffffffffffff9429444444776666d5566d1115522055fffffffffff99f9ff9ffff9f99999f9999999f9999f8889999999f999999
ffffffffffffffffffffffffffffffffffff9999242424766666d5566d0115555055fffffffffffff9f9ff99f999fff99999fff9999999998f99fff99999fff9
ffffffffffffffffffffffffffffffffffff944242424296666dd5566d01d5555055ffffffffffff9999999f99f999999f9999999f99fff8999999999f999999
ffffffffffffffffffffffffffffffffffff944242424294ddd2d5556dd5d5555555fffffffffff99f9f9f99f99f99fff9f999fff9f999999f9999fff9f999ff
ffffffffffffffffffffffffffffffffffffd555555555594425d5555555d5555555ffffffffffff99f9f99f99f9ff9f9999ff9f999999fff9f9ff9f9999ff9f
ffffffffffffffffffffffffffffddddddddddd666dddddddddd5d555d5fffffffffffffffffffffffff9f99f9f999f9999999f9999999f9999999f9999999f9
ffffffffffffffffffffffffffffd5555555d5766665d5555555d5155551fffffffffffffffffffffffff99f99f99f9999f99f9999f99f9999f99f9999f99f99
ffffffffffffffffffffffffffffd5556555d5766665d5888885155d55d5ffffffffffffffffffffffff9f99f99f99ff999999ff999999ff999999ff999999ff
ffffffffffffffffffffffffffffd5576655d5677725d555555555d51555ffffffffffffffffffffffff999f999999999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd55d7d55d566dd25d55222555555d55dfffffffffffffffffffffffff9ffff9ffff99999fff99999fff99999fff99999fff9
ffffffffffffffffffffffffffffd55ddd55d566dd25d55555555d155d55ffffffffffffffffffffffffffffffff99999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd555d555d556dd55d555255555555551ffffffffffffffffffffffffffffffff99fff9f999fff9f999fff9f999fff9f999ff
ffffffffffffffffffffffffffffd5555555d5555555d55222555155d55fffffffffffffffffffffffffffffffffff9f9999ff9f9999ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffddd666ddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddd66666666666ffff
fffff6ffffffffffffffffffffffd5766665d5555555d5522255fffffffff002200fffffffffffffffffffffffffffffffffd557755555555ddddd4dddddffff
ffffffffff6fffffffffffffffffd5766665d5556555d5552555ffffffff288882d2ffffffffffffffffffffffffffff6f0fd566969666655ddddd4ddd5dffff
ffffffffffffffffffffffffffffd5677725d5576655d5555555ffffffff28888828fffffffffffffffffffffffffff8805fd5ddadadddd55ddd5ddd5dddffff
ffffffffffffffffffffffffffffd566dd25d55d7d55d5522255ffffffff28888828fffffffffffffffffffffffff0d888ff7777a7a711555ddddd55d5ddffff
fffffff6ffffffffffffffffffffd566dd25d55ddd55d5555555ffffffff288882d2fffffffffffffffffffffffff22685ff7d9d9d971155544d5555dd44ffff
ffffffffffffffffffffffffffffd556dd55d555d555d5888885ffffffff50022005fffffffffffffffffffffffff5820fff7da76767115767dddd5d5dddffff
ffffffffffffffffffffffffffffd5555555d5555555d5555555fffffffff555555fffffffffffffffffffffffffff500fff75776d675576667d5ddddd5dffff
ffffffffffffffffffffffffffff1d515555d66dddddddd6fffdfffffffffffffffffffffffffffffffff5d555d5fff55fff75777777766767667d4d5dddffff
fffffffffffff6ffffffffffffff5155d55d76665555551ffff1ffffffffffffffffffffffffffffffff1555515d5dfffd5f7d780777767767767d4dddddffff
ffffffffffffffffff6fffffffff555d515576665805555f4441ffffffffffffffffffffffffffffffff5d55d551d51555517d220dddd666d66d75555555ffff
ffffffffffffffffffffffffffffd5555d55177d22055d5ffff1ffffffffffffffffffffffffffffffff55515d55155d55d57ddd0d777d66d6dd76555555ffff
ffffffffffffffffffffffffffff55d155d5d1d55505555f1011ffffffffffffffffffffffffffffffffd55d555555d51555777757707dddddd77d675555ffff
fffffffffffffff6ffffffffffff155555556555550515df1001ffffffffffffffffffffffffffffffff55d551d55555d55dddddddd07777777776d75555ffff
fffffffffffffffffffffffffffff51ffd5fd6d6d55555551005ffffffffffffffffffffffffffffffff155555555d155d55d111d1d5ddddddddd7775555ffff
ffffffffffffffffffffffffffffffffffffd6d6d555d55d5555fffffffffffffffffffffffffffffffff55d551555555551d5555555d1d1d1d1dddd5555ffff
ffffffffffffffffffffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffffffffffff55d555d555d555d555d555d555d555d555d555d555d5
fffff6fffffff0088800ffffffffffffffffd5555555155551555dfffd5fffffffffffffffffffffffff15555155155551551555515515555155155551551555
ffffffffff6ff2808082ffffffffffffffffd555555a5d55d555d5155551ffffffffffffffffffffffff5d55d5555d55d5555d55d555555555555555d5555d55
fffffffffffff2262622ffffffffffffffffd5aaa99a55515d5d155d55d5ffffffffffffffffffffffff55515d5d55515d5d555155555555555551555d5d5551
fffffffffffff2868682ffffffffffffffffd5aaa55ad555555555d51555ffffffffffffffffffffffffd5555555d5555555d55555555544444444455555d555
fffffff6fffff0828280ffffffffffffffffd5a1199a55d515555555d55dffffffffffffffffffffffff55d5155555d5155555d55544444444444444455555d5
fffffffffffff0888880ffffffffffffffffd544445a155555155d155d55ffffffffffffffffffffffff15555515155555151555544444444444444445151555
fffffffffffff5288825ffffffffffffffffd5151515555d555555555551ffffffffffffffffffffffff555d5555555d5555555524444444444444444455555d
ffffffffffffff55555fffffffffdddd666666ddddddddddddddddd7778666666dddddddddddffffffff1d51555555d555d555dd2444444444444444444455d5
fffff6fffffff6ffffffffffffffd566ddddd6111110d55555556667d22ddddd657667555555ffffffff5155d55d155551551550244444444444444444441551
ffffffffff6fffffff6fffffffffd5dddd000066dd66d55555556dd7dd0dd6666dddddd56765ffffffff555d51555d55d5555d51044444444444444444445515
ffffffffffffffffffffffffffffd5dd0000001111ddd55555556dd7660dd6dd611111ddddd5ffffffffd5555d5555515d5d5551124444444444444444445150
ffffffffffffffffffffffffffffd50000000066dd10d55555556dd11666666d705501111115ffffffff55d151d5d5515155d551110222414142444141444400
fffffff6fffffff6ffffffffffffd555555555111110d55555556d7661111117705055421425ffffffff15151515551515155515151000121210441414141400
ffffffffffffffffffffffffffffd551f6155566dd66d55555556d55d5dd6661100555425425fffffffff000000f100000051000000510000001400000044000
ffffffffffffffffffffffffffffd550f605551111ddd55555556ddd6ddd7111102555425425ffffffff00000000000000000000000000000000000000001000
ffffffffffffffffffffffffffffd555f655551d6d10ffffffff6d7777777111104555425425fffffff000000000000000000000000000000000000000000000
1ffffffffffff6ffffffffffffffd5516615551d6d10ffffffff6d7011111ddd644555555555fffff10000000000000000000000000000000000000000000000
f1ffffffffffffffff6fffffffffd5505505551d6d10ffffffff6770d1d11ddd705555555555ffff1f0000000000000000000000000000000000000000000000
0f1fffffffffffffffffffffffffd5555555551d6d10ffffffffddd0d1d11677705555555555fffff10000000000000000000000000000000000000000000000
01ffffffffffffffffffffffffffd55555555510d010ffffffffddd0d1dd111115dddddd5555ffff1f0000000000222222222222222222222222222222222200
00f1fffffffffff6ffffffffffffd555550f050aaa00ffffffff0001d1111111105555555555fffff10000000000200777777770000000000000000000000200
000fffffffffffffffffffffffffd55f0f5555555555ffffffff00111ddd111115dddddd5555ffffff0000000000200700080070000000000000000000000200
0001ffffffffffffffffffffffffd555555555555555ffffffff011111111111105555555555fffffff000000000200700880070000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d555d555d5fffffff000000000200708000070000000000000000000000200
000000ffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d15555155fffff10000000000200700800070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d5515d55d555ffff1f0000000000200708080070000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55515d5555515d5dfffff10000000000200700000070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffffd55d5555d5555555ffff1f0000000000200777777770000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d555d51555fffff10000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff1555555515555515ffffff0000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515555d5555fffffff000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffffffffffffffffffff1d5155555d555d5ffffff1f100000000200000000000000000000000000000000200
000000fffffffffffffff688886ff6fffffff6ffffffffffffffffffffff5155d55dd5155551fff1ff0000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8fffffff6fffffff6fffffffffffffffff555d5155155d55d5ff1f000000000000200000000000000000000000000000000200
000000f1fffffffffffff2888d8fffffffffffffffffffffffffffffffffd5555d5555d51555f1f0000000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8ffffffffffffffffffff1f1fffff1f1ff55d151d55551d15dff00000000000000200000000000000000000000000000000200
000000f1fffffffffffff688886ffff6fffffff6ffffff1f1f1fff1f1f1f151515155d151d151f00000000000000200000000000000000000000000000000200
0000001ffffffffffffff555555ffffffffffffffffff000000ff000000ff000000f50000001f000000000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffff000000000000000000000000000000001000000000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000fffffffffffffffffffffffffffffff6fff100000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000f1fffffffffffffffffffffffffffffffff100000000000000000000000000000000000000000000000000200000000000000000000000110000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000171000000200
000000f1fffffffffffffffffffffffffffffff6f100000000000000000000000000000000000000000000000000200000000000000000000000177100000200
0000001fffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000200000000000000000000000177710000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000177771000200
00001f1ffffffffffffffffffffffffffffffffff1f1000000000000000000000000000000000000000000000000200000000000000000000000177110000200
000000ff1ffffffffffffffffffffffffffffff1ff00000000000000000000000000000000000000000000000000200000000000000000000000011000000200
00000001f1ffffffffffffffffffffffffffff1f0000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000000f1ffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000001fffff1f1fffff1f1fffff1f1ffff000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000000f1ff1f1f1fff1f1f1fff1f1f1f1f000000000000000000000000000000000000000000000000000000222222222222222222222222222222222200
00000000000ff000000ff000000ff000000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000020202020202000000000000000000000200000000010101010101010101010101010000000000000101010000000001010101010100000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
0000000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300000000000008090a00000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d4b0000000000000000080909090a000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121212000016161600141400000000000809090909090a000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d004214000000080b09090909090c00000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000002040000080b09090d0909090c0000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000441414040000000c09090909090c000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016000014141400310000003665050500000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000601140000000002050303030000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001634000014140500000003031718190300000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016160060033f6205050006031d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030015151515151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000120000160006060002030300000217191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030015151515151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001212000000000000000049030000061d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000351616000006070000000206060000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000016000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000121212120000000000001212121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012121212000016000000000000121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
1515001515150000001600000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1515001515150000161600000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
0000000015151600160000000000000000000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000015150000000000000000000000000000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1515000015151515151500000000000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1515000015151515151500000000000000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000015150000000000000044050047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000015150035000205050503030400000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1515151500000000000217181819030303490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
151515153200310040031d1b1b1b181819040000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000151500020303031d1e1b1b1b1c036200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
160000001515000000060303031a1b1b1f030303050000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000360000004d031d1e1f03060700020605000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1616160000000000000000060665030303000000000006070000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010c0004246152461524615246250c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200020c4100c210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01030010184300c1700c1400c1150c3300c1700c1400c1150c3300c1700c1400c1150c3300c1700c1400c1150c1050c1050c1050c1050c1050c1050c1050c1050010500105001050010500105001050010500105
011000010015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01030018184300c1700c1400c1150c3200c1400c1300c1250c3100c1100c1100c115184300c1700c1400c1150c3300c1400c1300c1250c3100c1100c1100c1150010500105001050010500105001050010500105
010800103061530600306153c605306153c605306150c0003c6103c615306153c605306153c605306150c0003c6050c6003c6050c6003c6050c6000c6000c6000c6000c6000c6000c6003c6050c6003c6050c000
010800203c615306003c6053c6053c6153c6053c6150c0003c6153c6053c605306003c615306003c6053c6053c6150c6003c6150c6003c6150c6000c6000c6000c6000c6000c6000c6003c6150c6003c6150c000
011406073c5303c5213c5113c5113c5113c5103c51000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
0120000011b5011b5011b5011b4111b4011b4011b3111b3011b3011b2111b2011b2011b1111b1011b1011b1511b5011b5011b5011b4111b4011b4011b3111b3011b3011b2111b2011b2011b1111b1011b1011b15
012000000595005950059500594105940059400593105930059300592105920059200591105910059100591505950059500595005941059400594005931059300593005921059200592005911059100591005915
0120000011f3011f3011f2111f2011f1111f1011f1011f1013f3013f3013f2113f2013f1113f1013f1013f1014f3014f3014f2114f2014f1114f1014f1014f1013f3013f3013f2113f2013f1113f1013f1013f10
0120002018e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e2518e25
012000001d315243152931535315110052431529315353151d315243152731533315110052431527315333151d315243152c3153831511005243152c315383151d315243152b3153731511005243152b31537315
0120000014b5014b5014b5014b4114b4014b4014b3114b3014b3014b2114b2014b2014b1114b1014b1014b1514b5014b5014b5014b4114b4014b4014b3114b3014b3014b2114b2014b2014b1114b1014b1014b15
0120000020315273152c3153831514005273152c3153831520315273152a3153631514005273152a3153631520315273152f3153b31514005273152f3153b31520315273152e3153a31514005273152e3153a315
0120000014f3014f3014f2114f2014f1114f1014f1014f1016f3016f3016f2116f2016f1116f1016f1016f1017f3017f3017f2117f2017f1117f1017f1017f1016f3016f3016f2116f2016f1116f1016f1016f10
011000200c0430c04305155051550515511975051551197506155061550615511975031550315503155039750c0430c0430515505155051551810005155119750d1550d1550d155199750c1550c1550c15518100
011000001211112112121121211212112121121111112112121121211412115121141211511114121151211412115119751197511975119751193511975249001997519975199752490018975189751897518945
011000000655206552065520655206542065420654206542065320653206532065320652206522065220652206512065120651206512065120651206512065120651206512065150650206502065020650206502
0110000830d1530d1530d1530d1530d1030d1530d1530d1511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d0511d0518d05
011000001e4021e4020c4250c4250c4250c4250c425114050d4250d4250d425114050f4250f4250f425034051140511975114251142511425114251142511975124251242512425129750f4250f4250f4250f975
011000001e4021e4020c4250c4250c4250c4250c425114050d4250d4250d425114050f4250f4250f4250340511405119751142511425114251142511425119751442514425144251497513425134251342513975
0110000019b5019b4119b3119b2119b1019b1019b1019b1019b1019b1019b1019b1018b5018b1116b5016b1113b5013b5013b4113b4013b3113b3013b2113b2013b1013b1013b1013b1013b1013b1013b1013b10
0110000019f4019f3119f2119f1119f1119f1019f1019f1016f4016f2116f1116f1019f4019f2119f1119f101af401af211af111af111af111af101af101af1014f4014f2114f1114f1013f4013f2113f1113f10
011000002074220732207222071220712207122071220712207122071220712207121d7421d7321d7221d7121f7421f7321f7221f7121f7121f7121f7121f7121f7121f7121f7121f7121f7121f7121f7121f715
011000001100531d1530d1531d1530d1530d1530d1530d1530d10246051100518005110051800511005180051100531d1530d1531d1530d1530d1530d1530d1530d1024605110051800511005180051100518005
0110000011f4011f2111f1111f1012111121121211212112121121211211111121121211212114121151211412975119751297512975129750597505975181000d9750d9750d9750d9450c9750c9750c9750c945
011000001f7021f7021f7021f70506552065520655206552065420654206542065420653206532065320653206522065220652206522065120651206512065120651206512065120651206512065120651506502
0110000011f0011f0111f0118e0512121121221211112112121121211211111121121211212114121151211412915119141291512914129151800005955181000d9550d9550d955181000c9550c9550c95518000
011000001f7021f7021f7021f70506552065520655206552065420654206542065420653206532065320653206522065220652206522065120651206512065120651206512065120651206512065120651506502
011000200c0430c04308155081550815514975081551497509155091550915514975061550615506155069750c0430c04308155081550815514975081551b100101551015510155109750f1550f1550f1551b100
011000000c0430c04305155051550515511975051551197506155061550615511975031550315503155039750c0430c0430515505155051551810005155181000d1550d1550d155181000c1550c1550c15518100
0118002009a5009a5009a3009a3009c5009c5009c5009a5009a5009a3009a3009c5009c5009c5009c5009c5009c5009a5009a5009a3009a3009c5009c5009c5009c5009c5009c5009c5007a5007a5007a3007a30
0118000015b4015b1515b4015b1515b4015b151821615b4015b1515b4015b1515b4015b151821615b4015b102721615b4015b1515b4015b1515b4015b151821615b4015b1515b4015b1513b4013b1513b4013b15
011800203082531810308253181030825308103082031815308103182530810318253181030810318253181030810318253081031825308103182531810318103082531810308253181030825318203082031820
011800001c7041c7051170518700187041c705182161c7001870011705187001c700187001c216187001c7001b216187001b700187001c7001870021700182161c7041c705057050c70013210132101321213212
011800002db20155152db20155152db2015515182162db20155152db20155152db2015515182162db20155151b2162db20155152db20155152db2015515182162db2015515155142db202bb202bb122bb122bb15
0118000018a3018a3018a3018a3018c3018c301c72617a3017a3017a3017a3017c3017c301872617c3018c301c72618a3018a3018a3018a3018c3018c301c72717c3017c3018c3018c301aa301aa301aa301aa30
011800000cf500cf500cf500cf410cf310cf220cf120bf500bf500bf500bf410bf310bf210bf110bf110bf120bf1209f5009f5009f5009f4109f3109f2209f1205f5005f5005f5005f4105f3105f2105f1205f12
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400000647307b710a6730cb711093313631159331ab510145302b510565307b310b9330e6211092315b410044300b410064302b4106923096210b92310b210041300b110061300b110191304611069130bb11
01020000104230db53306532db532b953276532495323b53206531f4531c9531b6531895316b531564313b4312943104430f9430db330b63309b3308923066230492303b230162300b2300933002150094300615
00040000049132ff13069132cf13039132af23049230592327f230693326f330493325f430694325f430494328f430794329f430a94326f530595324f530795329f2321f432cf632ff7330610306103061030615
010400002b72418765187641876518764187551875418755187541874518744187451873418735187341872518724187251870418705187041870518704187051870418705187041870518704187051870418705
010800002e1402e1222e115181002e1402e1203314033120331103311233115181001810018100181001810000100001000010000100001000010000100001000010000100001000010000100001000010000100
010200002cd732cd732cd732cd732cd632cd632cd632cd632bd132bd532ad532ad1329d5329d4328d4327d4326d132594324d432293320d331e9031cd331a93319d0317d231592313d131191300d0300d0300d03
000200000fd130452011d33107301ad43157501fd531b76326d601d76332d70157732ed600b7632ad600975323d50057431cd400673316d200a72310d10027130ad15007030dd0009d0006d0003d0001d0001d00
0101000030e71189753fe000000000000000000d97118e75000000000000000000003097118e7500e0018e0116e0100e0113e0111e0100e010de010ce0100e0109e0107e0100e0105e0104e0100e0101e0100e01
0102000033b6131863006102f86316b61006101eb531c851006101885116b430061013b4311841006100d8410cb430061009b3307831006100582104b230061001b1100811006140061507b0007b0006b0105b01
010100003063030620306303c6203c6303c6100060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
0101000030f650000031f4531f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 21232262
01 20242223
00 20252223
00 20252223
00 20262223
02 21262223
00 21232263
00 21226263
00 08092262
01 0b090a08
00 0b0c0a08
00 0b0c0a08
00 0b0e0f0d
00 0b0e0f0d
00 13111210
00 13111210
00 13141210
00 13151210
00 19171816
00 131a1b10
00 131c1b10
00 130c0a10
00 130f0e1e
00 19171816
00 130c0a1f
00 19171816
02 0b090a08

