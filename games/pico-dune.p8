pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- global flags
debug_mode=true
--debug_collision=false

-- data flags (eventually pulled from cartdata)
cartdata("pn_undune2") 

-- faction_cols = {
--  { 12, 1}, -- 1 = Atreides

--  { 11, 3}, -- 2 = Ordos
--  { 8,  2}, -- 3 = Harkonnen
--  { 14, 2}, -- 4 = Emperor?
-- }

p_level,p_faction,p_col1,p_col2=dget"0",dget"1",dget"2",dget"3"
ai_faction,ai_col1,ai_col2,ai_level=dget"20",dget"21",dget"22",dget"23" -- difficulty level (1=hardest?)

-- DEBUG
-- [player]
-- atreides
--p_level,p_faction,p_col1,p_col2=dget"0",1,12,1
-- ordos
--p_level,p_faction,p_col1,p_col2=dget"0",2,11,3
-- [ai]
-- harkonen
--ai_faction,ai_col1,ai_col2,ai_level=3,8,2,1 -- difficulty level (1=hardest?)


credits={
 shr(dget(6),16), -- player starting credits
 shr(500,16),     -- ai starting credits (always 500?)
 shr(dget(7),16), -- target credits
}


-- fields
_g,buildings,units,object_tiles,last_facts,radar_data,spice_tiles,particles={},{},{},{},{},{},{},{}
start_time,_t,build_dest,unit_dest,keyx,keyy,hq,radar_frame=t(),0,{0,0},{0,0},0,0,false,0
last_hq=hq
message,msgcount="",0

_g.factory_click=function(self)
  menu_pos,selected_subobj,ui_controls=1,self.parent.build_objs[1],{}
  -- create buttons
  m_button(6,84,"⬆️",function()
   sel_build_item_idx=mid(1,sel_build_item_idx-1,#selected_obj.valid_build_objs)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]
   if (sel_build_item_idx<menu_pos) menu_pos-=1
  end, 10)
  m_button(17,84,"⬇️",function()
   local len=#selected_obj.valid_build_objs
   sel_build_item_idx=mid(1,sel_build_item_idx+1,len)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]
   menu_pos=mid(menu_pos+1,len-2)
   if (sel_build_item_idx>menu_pos+2) menu_pos=min(menu_pos+1,len-2)
  end, 10)
  m_button(32,83,"build",function()
   show_menu, selected_obj.build_obj = nil, last_selected_subobj   
   last_selected_subobj:func_onclick()
  end)
  m_button(96,83,"close",function()
   show_menu=nil
  end)
  -- show build menu
  show_menu=self
end
_g.init_windtrap=function(self)
  self.col_cycle_src=11
  self.col_cycle = {12,12,12,12,13,1,1,1,1,13}
end
_g.init_refinery=function(self)
 self.col_cycle = {11,10,8}
end
_g.draw_refinery=function(self)
  pal()
  pal(11,self.col2)
  pal(10,self.col2)
  pal(8,self.col2)
  if self.incoming then
   pal(self.col_cycle[self.col_cycle_pos], self.col1)
  else
   pal(11,self.col1)
   self.col_cycle_pos=1
  end
  draw_obj(self)
end
_g.init_repairfact=function(self)
 self.col_cycle_src=8
 self.col_cycle={0}
end
draw_action=function(self) 
 palt(11,true)
 pal(7,8)
 if (self.id==80 and selected_obj.process==2 and not selected_obj.procpaused) pal(7,11)
 draw_obj(self)
 pal()
end
repair_click=function()
  process_click(last_selected_obj, 2)
end
launch_click=function()
 -- go into launch mode
 set_message"pick target"
 target_mode=true
end


function process_click(self, mode)
  -- toggle/switch mode (building/repairing) depending on state & click
  self.procstep,self.last_process=0,self.process  
  if (self.life>0 and self.last_process>0) self.procpaused=not self.procpaused
  self.process=mode
end


-- object data
obj_data=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1|nil|nil|||||nil|1|||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1|nil|1|||||1|4|||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160|2|1|1|1|nil|1|||||1|1|||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1|nil|1|||||7|4|||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1|nil|1|||||1|1|||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174|2|3|2|1|nil|1|||||1|1|||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1|nil|1|||||1|2|||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1|nil|1|||||6|2|||150|5|0|600|||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1|nil|1|||||7|2|||300|10|0|1200|||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1|nil|1|||||7|2|||400|10|0|1600|||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1|nil|1|||||6|2|||400|20|0|1400|||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1|nil|1|||||6|3|||600|20|0|800|||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1|nil|1|||||12|5|||500|35|0|1600|||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1|nil|1|||||12|5|||700|20|0|800||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||7|5|||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||7|6|||250|20|112|1200|0|9|2||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1|nil|1|||||6|6||1|500|50|0|2000|||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1|nil|1|||||12|5|||500|40|0|1600|||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1|nil|1|||||17|8||1|999|80|0|4000|||||||tHIS IS YOUR pALACE.||||
20|lIGHT iNFANTRY (X3)|55|236|1|1|1|1|11|9|||||9|2|-3||60||4|200|0.05|2|1|1|56|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|55|194|1|1|1|1|11|10|||||9|3|-1||100||8|440|0.1|3|1|1|56|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
22|fREMEN|55|236|1|1|1|1|11|||0|9|4||8|1||0||8|880|0.1|3|1|1|56|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
23|sABOTEUR|55|236|1|0.5|0.5|1|11|||0|1|0||8|2||0||150|160|0.4|0|1|1|56|10|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
24|sARDAUKAR|55|236|1|1|1|1|11|||0|14|2||4|||0||5|440|0.1|1|||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
25|tRIKE|54|204|1|1|1|1|11|11|17|||||2|||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
26|qUAD|48|206|1|1|1|1|11|11|17|||||3|||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
27|cOMBAT tANK|51|196|1|1|1|1|11|12|17||||7|4|||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
28|sIEGE tANK|50|198|1|1|1|1|11|12|17||||7|6|||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
29|rOCKET lAUNCHER|53|202|1|1|1|1|11|12|17||||7|5|||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
30|hARVESTER|49|192|1|1|1|1|11|12|17|||||2|||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
31|cARRYALL|73|238|1|1|1|8|11|13|||||13|5|||800||0|400|1|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|sONIC tANK|57|198|1|1|1|1|11|12|||||7|7|1||600||90|440|0.3|8|3||||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
35|dEVASTATOR|52|200|1|1|1|1|11|12|||||13|8|3||800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
36|dEATH hAND|72||1|1|1|8|11|||0|||13|8|3||0||150|280|0.5|0|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
37|rAIDER|54|204|1|1|1|1|11|11||||||2|2||150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
38|dEVIATOR|53|202|1|1|1|1|11|12|||||13|7|2||750||30|480|0.3|7|2||||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
39|sANDWORM|88||9|1|1|1|11|nil|||||nil|3|||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19||5|1|1|1|11|nil|||||nil||||||||||||||||draw_action||action_click
81|pICK TARGET|1||5|1|1|1|11|nil|||||nil||||||||||||||||draw_action||action_click]]





--[[
  ## messages ##
There isn't enough open concrete to place this structure. You may proceed, but without enough concrete the building will need repairs.

You have successfully completed your mission.

]]

-->8
--p8 functions
--------------------------------

function _init()
 -- enable mouse
 poke(0x5f2d, 1)

 menuitem(1,"exit to title",function()
  load("pico-dune-main")
 end)

 explode_data()

 -- init the game/title
 level_init()

 -- create cursor ui "object" (for collisions)
 cursor = {
  w=8,
  h=8,
  get_hitbox=function(self)
   return {
    x=self.x+(not ui_collision_mode and camx or 0)+2,
    y=self.y+(not ui_collision_mode and camy or 0)+1,
    w=1,
    h=1
   }
  end,
  draw=function(self)
   spr((selected_obj and (selected_obj.type==1 and selected_obj.owner==1) or target_mode) and 1 or 0, --self.obj_spr, 
    self.x, self.y, self.w/8, self.h/8)
  end
 }

 discover_objs()

 music"7"

 -- shake tells how much to
 -- shake the screen
 shake=0
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
       
       -- handle player start pos (const yard) as a special case
       if i==1 and spr_val==1 then
        -- found player start position
        pstartx,pstarty=mx*8,my*8        
        -- center camera
        camx,camy=pstartx-56,pstarty-56
        -- create player const yard
        objref=obj_data[1]

       elseif i==2
        and spr_val>=48 then --don't create "concrete" as objs
        
        -- find object for id
        for _,o in pairs(obj_data) do         
         if (o.obj_spr!=nil and o.obj_spr==spr_val) objref=o break       
        end
       end
       
       if objref!=nil then
         local ox,oy=mx,my
         if (ox>63) oy+=31 ox-=64
         m_map_obj_tree(objref, ox*8,oy*8)
         if (objref.type==1 and objref.speed>0) mset(mx,my,0)
       end
     end
   end
 end

 -- debug
 -- printh("buildings:")
 -- for i=1,#buildings do
 --  local b = buildings[i]
 --  printh(" "..i..") "..b.name.." (owner="..b.owner..")")
 -- end
 -- printh("units:")
 -- for i=1,#units do
 --  local u = units[i]
 --  printh(" "..i..") "..u.name.." (owner="..u.owner..")")
 -- end
end

function m_map_obj_tree(objref, x,y, owner, factory)
  --printh("name=.."..objref.name)
  local newobj=m_obj_from_ref(objref, x,y, objref.type, nil, _g[objref.func_init], _g[objref.func_draw], _g[objref.func_update], nil)
  -- set type==3 (icon!)
  
  newobj.ico_obj,newobj.life = m_obj_from_ref(objref, 109,0, 3, newobj, nil, nil, _g[objref.func_onclick]),placement_damage and objref.hitpoint/2 or objref.hitpoint -- unless built without concrete
  
  -- player-controlled or ai?
  -- note: this whole thing may not be needed 
  -- as once we have plr start pos, that might be all we need
  newobj.owner=newobj.owner or owner or (dist(x,y,pstartx,pstarty)<75 and 1 or 2)
  
  -- who created? (do avoid "guard" attacking units created by same faction)
  -- factory?
  newobj.created_by,newobj.build_objs = owner or newobj.owner, {}

  -- go through all ref's and see if any valid for this building
  for o in all(obj_data) do
    local req_fact=o.req_faction
    if (o.parent_id!=nil and (o.parent_id==newobj.id or o.parent2_id==newobj.id))
     and (req_fact==nil
      or (req_fact>0 and o.req_faction==p_faction)
      or (req_fact<0 and -p_faction!=req_fact))
    then
      add(newobj.build_objs,
        -- note: setting type==4 (build icon!)
        m_obj_from_ref(o, 109,0, 4, newobj, nil, nil, function(self)
          -- building icon clicked
          if show_menu then
            -- select building
            selected_obj=self
          else
            --auto build
            process_click(self, 1)
          end
        end)
      )      
      newobj.build_obj=newobj.build_objs[1]
    end
  end


  -- store the factory that made it (mostly for harvesters)
  --newobj.last_fact = last_fact

  -- 0=auto, 1=player, 2=computer/ai
  if newobj.owner==1 then
    newobj.faction,newobj.col1,newobj.col2 = p_faction,p_col1,p_col2
  else
    newobj.faction,newobj.col1,newobj.col2,newobj.ico_obj.func_onclick = ai_faction,ai_col1,ai_col2,nil --make ai icons un-clickable
    -- palace?
    if (newobj.id==19) ai_palace=newobj
  end

  -- override cols?
  if objref.col1 then
   newobj.col1,newobj.col2 = objref.col1,objref.col2
  end
  
  -- override owner? 
  -- (carryalls are automomous & don't reveal map, etc.)
  if (newobj.id==31) newobj.owner=0 --printh("cols="..newobj.col1)


  local xpos,ypos = flr(x/8),flr(y/8)
  
  -- building props?        
  if objref.type==2 then
    newobj.deathsfx,newobj.fire_cooldown = 53,0 -- palace weapon cooldown
    -- prepare the map?
    local slabs=(objref.id==2 or objref.id==3)    
    for xx=0,objref.w-1 do
      for yy=0,objref.h-1 do
       -- block map under building (diff tiles for player/ai-owned)
       wrap_mset(xpos+xx, ypos+yy, slabs and 16 or newobj.owner==1 and 149 or 27)
      end
    end
    if (not slabs) add(buildings,newobj)
    -- other building stuff
    -- refinery?
    if newobj.id==6 and newobj.parent==nil then
      last_facts[newobj.owner]=newobj
     -- auto create a harvester
     -- todo : have freighter deploy it
     local ux,uy=ping(newobj,(newobj.x+32)/8, (newobj.y+8)/8, is_free_tile)
     m_map_obj_tree(obj_data[30],ux*8,uy*8,nil,newobj)
    end
  end
  -- unit props
  if objref.type==1 then
   newobj.deathsfx=54
    if (newobj.norotate!=1) newobj.r=flr(rnd"8")*.125
    if newobj.arms>0 then
     -- combat stuff
     newobj.fire=function(self)
       -- now firing, fire bullet/missile
       self.state,self.bullet_x,self.bullet_y,self.bullet_tx,self.bullet_ty = 4,self.x+4,self.y+4,self.target.x+self.target.w/2,self.target.y+self.target.h/2
       -- normalize dx,dy
       local dx,dy = self.bullet_tx-self.bullet_x,self.bullet_ty-self.bullet_y
       local d=sqrt(dx * dx + dy * dy)
       self.bullet_dx,self.bullet_dy = (dx/d)*2,(dy/d)*2
       sfx(self.arms<100 and 60 or 58, 3)
       reveal_fow(self)
     end
     -- rocket/cannon turret?
     if (newobj.id==15 or newobj.id==16) wrap_mset(xpos, ypos, 149)
    else
     -- non-fighting units   
     -- harvesters (auto parent to last created refinary)
     if (newobj.id==30) newobj.capacity=0 newobj.last_fact=last_facts[newobj.owner]
    end
    add(units,newobj)
    -- default to guard
    do_guard(newobj)
  end
  reveal_fow(newobj)
  -- return final obj
  return newobj
end

function m_obj_from_ref(ref_obj, x,y, in_type, parent, func_init, func_draw, func_onclick)
 local obj={
  --hail=false,
  ref=ref_obj,
  id=ref_obj.id,
  hitpoint=ref_obj.hitpoint,
  x=x,
  y=y,
  z=ref_obj.z, -- defaults  
  type=in_type, -- 1=unit, 2=structure, 3=obj_status_icon, 4=build_icon, 5=small_icon, 9=worm
  parent=parent,
  func_onclick=func_onclick,
  w=(ref_obj.w or 1)*8, -- pixel dimensions 
  h=(ref_obj.h or 1)*8,
  orig_spr=ref_obj.obj_spr,
  spr_w=ref_obj.w, -- defaults
  spr_h=ref_obj.h, --
  life=0,
  frame=0,
  process=0,
  spent=0,
  fire_cooldown=0,
  hit=0,
  flash_count=1,
  col_cycle_pos=1,
  get_hitbox=function(self)
    return {
     x=self.x,
     y=self.y,
     w=(self.type>2 and self.type<5 and 16 or self.w)-1,
     h=(self.type>2 and self.type<5 and 16 or self.h)-1
    }
   end,
   draw=func_draw or function(self)
     -- abort if off-screen
     if self.type<=2
      and (self.x+self.w<camx
       or self.x>camx+127
       or self.y+self.h<camy
       or self.y>camy+127)
     then
      -- don't draw, as off-screen
      return
     end

     pal()
     palt(0,false)
     if (self.trans_col) palt(self.trans_col,true)     
     -- faction? (if not IX)
     if (self.faction and self.id!=18) pal(12,self.col1) pal(14,self.col2)
     -- colour anim?
     if self.col_cycle then
      pal(self.col_cycle_src, self.col_cycle[self.col_cycle_pos])
     end
     -- rotating obj?
     if self.r then
      if not self.death_time or self.death_time>.025  then
       if (self.speed>0) rspr(self.obj_spr%16*8,flr(self.obj_spr/16)*8, self.x, self.y, .25-self.r, 1, self.trans_col, 5)
       rspr(self.obj_spr%16*8,flr(self.obj_spr/16)*8, self.x, self.y-self.z, .25-self.r, 1, self.trans_col, flr(self.flash_count)%2==0 and 7 or nil)
      end
     -- norm sprite
     else      
       -- icon mode
       if self.type>2 and self.type<5 then        
         rectfill(self.x-1,self.y-1,self.x+16,self.y+19,0)
         -- draw health/progress
         local this=self.type==4 and self or self.parent
         local hp=this.hitpoint
         local col = self.process==1 and 12 or this.life<hp*.33 and 8 or this.life<hp*.66 and 10 or 11
         local val = self.process==1 and (15*(this.life/100)) or (15*(this.life/hp))
         if (this.life>0 and not show_menu) rectfill(self.x,self.y+17,self.x+val,self.y+18,col)
       end
       -- non-rotational sprite
       if self.type>2 then
        -- icon
        spr(self.ico_spr, self.x, self.y,
         self.type==5 and 1 or 2, 
         self.type==5 and 1 or 2)
       else
        -- building/non-rotational unit
        draw_obj(self)
       end
     end

     -- bullets/missiles
     if self.bullet_x then      
      if self.fire_type==1 then
       -- shell
       pset(self.bullet_x,self.bullet_y, rnd"2"<1 and 8 or 9)
      else
       -- missile/sonic wave
       local is_missile = self.fire_type==2
       add_particle(self.bullet_x, self.bullet_y, 0, 
        0, 0, 
        is_missile and .15 or 2,
        -.01, 
        is_missile and 20 or 2.5, 
        is_missile and {7, 7, 10, 9, 8, 2, 13, 6, 7} or {15}, 
        rnd"2"<1 and 0xa5a5.8 or 0)
      end
     end
     -- smoking?
     if (self.type<=2 and self.id>24 and self.life<self.hitpoint*.33 and rnd"10"<1) add_particle(self.x+3.5,self.y+3.5, 1, .1,-.02,.05, -.002, 80,{10,9,6,5}, rnd"2"<1 and 0xa5a5.8 or 0)
     -- reset hit flag
     self.hit=0
 
     --if (debug_collision) draw_hitbox(self)
     --pset(self.x,self.y,11)
   end,
   update=function(self)
     local life=self.life
     -- update targeting flash
     self.flash_count=max(self.flash_count-.4,1)
     -- check for attack
     if self.hit>0 then 
       -- reinstate loop
       set_loop(true) --5
       -- switch music (if passed the loop point)?    
       -- 0=normal, 1=battle, 2=leaving_battle
       if (music_state==0 or stat(24)>5) music_state=1 music"0"
       -- can we retaliate (unit/turret)?
       if (self.arms>0 and self.state==0) do_attack(self, self.hitby)

       -- lose soldiers - when tokens permit (takes ~20!)
       if (self.obj_spr==55 and life<100) self.spr_w=0.5 self.spr_h=0.5
     end
     -- check for death
     if (self.type<=2 and life<=0 and self.death_time==nil) self.state=5 self.cor=nil self.death_time=(self.type==2 and 1 or .5) sfx(self.deathsfx, 3) shake+=((self.type==2 or self.id==36) and 0.25 or 0)
     if self.death_time then
      self.death_time-=.025
      if self.death_time<=0 then
        if self.type==2 then         
         -- building?         
         for xx=0,self.spr_w-1 do
           for yy=0,self.spr_h-1 do
             wrap_mset(self.x/8+xx, self.y/8+yy, 15)
           end
         end
         del(buildings,self)
         build_dest[self.hitby.created_by]+=1
        else
         -- unit
         local gx,gy = self:get_tile_pos() --flr(self.x/8), flr(self.y/8)
         if (gy>31) gx+=64 gy-=32
         if (wrap_mget(gx,gy)<9) wrap_mset(gx,gy,20) --scortch sand
         if (self.speed==0) wrap_mset(gx,gy,15)
         del(units,self)         
         if (self.hitby) unit_dest[self.hitby.created_by]+=1
        end      
        if(selected_obj==self) selected_obj=nil
      else
        -- dying
        if (rnd(self.type==2 and 2 or 8)<1) make_explosion(self.x+rnd(self.w),self.y+rnd(self.h))
      end
     end

     -- animated frame + colour cycle (if applicable)
     if self.framecount!=nil then
      self.frame+=1
      if self.frame > self.framecount then
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

     -- update bullets/missiles
     if self.bullet_x then
      self.bullet_x+=self.bullet_dx
      self.bullet_y+=self.bullet_dy
      -- check for target
      if dist(
       self.bullet_x,self.bullet_y,
       self.bullet_tx,self.bullet_ty) < 2 
      then
       --explosion
       make_explosion(self.bullet_x, self.bullet_y, self.fire_type)
       -- did it hit (or did unit move)?
       local target=self.target
       if dist(
        self.bullet_x,self.bullet_y,
        target.x+target.w/2,
        target.y+target.h/2) < 4 
       then
        target.life-=self.arms
        --firetype: 0=none, 1=bullet, 2=missile, 3=sonic
        target.hit,target.hitby=self.fire_type,self

        -- deviator specific
        if self.id==38 and target.speed>0 then
         target.owner,target.faction,target.col1,target.col2 = self.owner,self.faction,self.col1,self.col2
         do_guard(self) -- stop attacking "converted" obj
        elseif target.old_faction then
         -- revert back to orig faction
         target.faction,target.col1,target.col2,target.old_faction = target.old_faction,target.old_col1,target.old_col2,nil
         do_guard(target)
        end

       end
       -- kill bullet/missile & do damage
       self.bullet_x=nil
      end
     end

     -- update build/repair process?
     if self.process>0 
      and not self.procpaused 
      and not self.done then

      if self.process==1 and self.spent>self.cost then
        -- const complete!
        self.done = true
        if (self.owner==1) sfx"56"
        -- auto-deploy units
        if self.ref.type==1
         and self.parent_id != 1 then
          -- find nearest point to factory
          local ux,uy=nearest_space_to_object(self, self.parent)
          m_map_obj_tree(self.ref,ux,uy,nil,self.parent)
          -- reset build
          reset_build(self)
        end
      elseif self.process==2 and life>self.hitpoint then
        -- repair complete
        self.process=0
        -- move unit to safe place?
        if self.type==1 and self.speed>0 then
         -- stop flashing while repairing
         _g.init_repairfact(self.last_fact)        
         -- go back to guard
         self.state=0        
         -- find nearest point to factory
         self.x,self.y=nearest_space_to_object(self, self.last_fact)
        end
      else
        -- continue...
        -- time to update credits?
        if self.procstep>(self.process==1 and 3 or 100) then
         -- build/repair (only if have money)
         -- note: only reset the procstep if have funds (no free build/upgrades!)
         if (transact(-1,self.process==1 and self.parent or self)) self.procstep=0 self.spent+=1
        else
         -- just continue
         self.procstep+=1
         self.life=(self.process==1 and (self.spent/self.cost)*100 or life+.5)
        end
      end
     end

     -- firing
     if self.fire_cooldown>0 then 
      self.fire_cooldown-=.1
     end
   end,

   set_pos=function(self,x,y)
    self.x,self.y=x,y
   end,
   get_tile_pos_index=function(self)
    local x,y = self:get_tile_pos()
    return x..","..y
    --return flr(self.x/8)..","..flr(self.y/8)
   end,
   get_tile_pos=function(self)
    return flr(self.x/8),flr(self.y/8)
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


function transact(diff, obj) 
 --printh("obj.owner = "..tostr(obj.owner))
 if (getscoretext(credits[obj.owner])+diff<0) return false
 credits[obj.owner]+=sgn(diff)*shr(abs(diff),16)
 if (obj.owner==1) sfx"63"
 return true
end

function make_explosion(x,y,size_type)
 add_particle(x, y, 2, 
         0,0,.1,0, size_type==1 and 5 or 30, {5,7,10,8,9,2}, rnd"2"<1 and 0xa5a5.8 or 0)
end

function reveal_fow(object)
 -- only reveal if
 -- > player
 -- > firing ai
 -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding
 if(object.owner!=1 and object.state!=4) return

 local size = object.type==2 and 3 or 2
 -- clear group of tiles
 for xx=-size,size do
  for yy=-size,size do
   -- clear tile
   local posx,posy = flr(object.x/8)+xx,flr(object.y/8)+yy
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

 --if (t()==0.4) extcmd "rec"

 update_level()
 
 if (not show_menu) update_ai()  -- ai overall decision making (not individual units)
 
 -- update positions of pathfinding "blocker" objects 
 if t()%1==0 then
  if t()%2==0 then
   update_obj_tiles()
  else 
   update_radar_data()
  end
 end
 _t+=1

end


function _draw()
 -- draw the map, objects - everything except ui
 draw_level()
 -- draw score, mouse, etc.
 draw_ui()
  
  --printh("cpu: "..flr(stat(1)*100).."% mem: "..(flr(stat(0)/2048*100)).."% fps: "..stat(7))--,2,109,8,0)
  --if (debug_mode) printo("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)

end

-->8
-- init related
--------------------------------
function level_init()
 -- init fog of war?
 fow={}
 for i=-2,66 do
  fow[i]={}
  for l=-2,66 do
   fow[i][l]=0
   --fow[i][l]=16 -- no fog
  end
 end
end

-- fog of war
function draw_fow()
 local mapx,mapy=flr(camx/8),flr(camy/8) 
 palt(0,false)
 palt(11,true)
 for xx=mapx-1,mapx+16 do
  for yy=mapy-1,mapy+16 do
    if fow[xx][yy]!=0 and fow[xx][yy]!=16 then
     --spr(fow[xx][yy]+31,xx*8,yy*8)
    elseif fow[xx][yy]<16 then
     --rectfill(xx*8, yy*8, xx*8+7, yy*8+7, 0)
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

-->8
-- update related
--------------------------------


function update_radar_data()
 radar_data={} 
 -- landscape/fow
 if hq then  
  for i=0,124,4 do
     for l=0,124,4 do
     -- look at tile spr and if not fow, get col?
     local mx,my = i/2,l/2
     if(my>=32)mx+=64 my-=32
     local mspr=mget(mx,my)
     local col=sget((mspr*8)%128+4, (mspr*8)/16)
     if(fow[i/2][l/2]==16) radar_data[(i/2/2)..","..(l/2/2)] = col!=11 and col or 15
     end
  end
 end
 -- -- structures
 -- reset vars for this pass
 power_bal,total_storage,has_radar,has_obj,building_count = 0,0,false,{},{0,0}

 for _,building in pairs(buildings) do  
   local posx,posy = building:get_tile_pos()--flr(building.x/8),flr(building.y/8)
   -- if our building, or ai not under fog of war
   if building.owner==1 or (hq and fow[posx][posy]==16) then
    radar_data[flr(building.x/2/8)..","..flr(building.y/2/8)] = building.col1
   end
   -- track power/radar
   if building.owner==1 then
    -- player owned
    has_obj[building.id]=building
    power_bal -= building.power
    if (building.id==7) has_radar=true
    if (sub(building.name,1,5)=="sPICE") total_storage+=1000
   end
   -- track counts
   building_count[building.owner]+=1
  end

  if hq then
   -- units
   for _,unit in pairs(units) do
    -- if our unit, or ai not under fog of war
    if unit.owner==1 or fow[flr(unit.x/8)][flr(unit.y/8)]==16 then
     has_obj[unit.id]=unit
     radar_data[flr(unit.x/2/8)..","..flr(unit.y/2/8)] = unit.col1
    end
   end

   -- sandworm
   if (worm_segs and fow[mid(0,flr(head_worm_x/8),31)][mid(0,flr(head_worm_y/8),31)]==16) radar_data[flr(head_worm_x/2/8)..","..flr(head_worm_y/2/8)] = 7
  end
 
  -- has radar-outpost and enough power (for HQ radar)?
  hq,music_state = (has_radar and power_bal>0),2  
  -- reset music back (will set again if more attackers)
  set_loop(false)  --5

 -- ----------------------
 -- check end states
 --
 -- player credits >= quota
 if (credits[3]>0 and credits[1]>credits[3]) endstate=1
 -- ai has no buildings
 if (building_count[2]==0 and p_level>1) endstate=2
 -- player has no buildings
 if (building_count[1]==0) endstate=3

 -- game over?
 if endstate then 
  dset(14, endstate)
  dset(13, t()-start_time)
  dset(10,strnum)
  dset(24,getscoretext(credits[2]))
  dset(11,unit_dest[1])
  dset(25,unit_dest[2])
  dset(12,build_dest[1])
  dset(26,build_dest[2])  
  rectfill(30,54,104,70,0)
  ?"mission "..(endstate<3 and "complete" or "failed"),36,60,p_col1
  flip()
  load("pico-dune-main")
 end
 
end


function update_obj_tiles()
 object_tiles={}
 -- (The pico-8 map is a 128x32 (or 128x64 using shared space))
 for k,unit in pairs(units) do  
  object_tiles[unit:get_tile_pos_index()]=k
 end
end


function update_level()
  -- mouse control
  mouse_x,mouse_y,mouse_btn=stat"32",stat"33",stat"34"
  left_button_clicked,left_button_down,right_button_clicked = (mouse_btn==1 and last_mouse_btn != mouse_btn) or btnp"4", (mouse_btn>0) or btn"4", (mouse_btn==2 and last_mouse_btn != mouse_btn) or btnp"5"
  
  -- keyboard input
  for k=0,1 do
   if (btn(k)) keyx+=k*2-1
   if (btn(k+2)) keyy+=k*2-1
   if (btnp(4,1)) stop("paused") --TODO:remove on release 
  end

 -- update cursor/mouse pos
 cursx,cursy = mid(0,mouse_x+keyx,127),mid(0,mouse_y+keyy,127)
 cursor.x,cursor.y = cursx,cursy

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
  camx,camy = mid(camx,384),mid(-8,camy,384)
   
  -- update all unit coroutines 
  -- (pathfinding, moving, attacking, etc.)
  for _,unit in pairs(units) do
    if unit then
      if unit.cor and costatus(unit.cor) != "dead" then
        assert(coresume(unit.cor, unit))
      else
        unit.cor = nil
      end

      -- check sandworm collision        
      if worm_segs -- worm present
       and fget(wrap_mget(unit:get_tile_pos()),2)  --unit on sand
       --and fget(wrap_mget(flr(unit.x/8),flr(unit.y/8)),2)  --unit on sand
       and dist(head_worm_x,head_worm_y,unit.x,unit.y) < 1
       and unit.z==1
       then
        del(units,unit)
        worm_frame=.01
      end
    end
  end
   
  --update_particles()
  for k,p in pairs(particles) do
    -- acceleration
   p.dy += p.ddy
   -- advance state
   p.x += p.dx
   p.y += p.dy
   p.r += p.dr
   p.life += 1
   -- check for dead
   if (p.life>=p.life_orig) del(particles,p)
  end
    
 end
 
 collisions()

 last_mouse_btn,last_selected_obj,last_selected_subobj = mouse_btn,selected_obj,selected_subobj  
end

function is_spice_tile(x,y)
  local val=wrap_mget(x,y)
  return val>=2 and val<=8
end

function do_guard(unit, start_state)
 -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding, 
 --(6=harvesting, 7=returning, 9=ready-to-unload/repair, 8=offloading/repairing)
 unit.state,unit.hail = start_state or 0, nil
 unit.cor = cocreate(function(self)
  while true do
   --printh("guarding-id="..self.id)
   -- be on look-out
   if rnd"500"<1 and self.arms>0 and self.state!=8 then 
    ping(self,flr(self.x/8),flr(self.y/8),is_danger_tile,self.range)
   end

   local last_fact = self.last_fact

   -- if a carryall only
   if self.id==31 then
     -- todo: #1 move to random place in map
     move_unit_pos(self, flr(rnd"26"), flr(rnd"26"))
     -- todo: #2 see if harvester awaiting pickup
     -- todo:  > move to harvester
     -- todo:  > pick-up harvester
     -- todo:  > move to harvester's last factory
     -- todo:  > drop-off harvester, then goto #1
     -- todo: #3 see if harvester finished unloading
     -- todo:  > move to harvester
     -- todo:  > pick-up harvester
     -- todo:  > move to harvester's last mining pos
     -- todo:  > drop-off harvester, then goto #1
     -- todo: #4 see if any unit is near-death
     -- todo:  > move to unit
     -- todo:  > pick-up unit
     -- todo:  > move to repair facility
     -- todo:  > drop-off unit, then goto #1     
   end

   -- if a harvester only
   if self.id==30 then   
    if self.state==0 or self.state==9 then
    --if self.state==0 or self.state==7 or self.state==9 then
     if self.capacity<=1500 
      and self.state!=7 and self.state!=9 then 
      local sx,sy
      local tx,ty=self:get_tile_pos() --flr(self.x/8),flr(self.y/8)
      if is_spice_tile(tx,ty) and not self.newspot then
        sx,sy=tx,ty
      else
        -- look for nearest spice
        ping(self,tx,ty,
          function(unit,x,y)
            if is_spice_tile(x,y) and rnd"10"<1 then
            --found spice
            sx,sy=x,y
            return true
            end
          end,
        10)
      end
      -- found spice?
      if sx and sy then
        move_unit_pos(unit,sx,sy)
        -- landed on spice tile?
        -- switch to harvesting        
        if (is_spice_tile(unit:get_tile_pos())) unit.state=6
      end

     end -- check factory busy

    -- are we full?
    elseif self.capacity >= 1500 
     and self.state!=7 then
      -- return to refinery when full      
      self.state,last_fact.incoming = 7,true
      move_unit_pos(self, (last_fact.x+16)/8, last_fact.y/8)
      self.state=9

     -- harvesting spice
    elseif self.state==6 then
     self.newspot=false
     -- spice clouds
     add_spice_cloud(unit.x, unit.y, unit.r+.75+rnd".2"-.1)

     -- update spice tile state
     local unit_pos = unit:get_tile_pos_index()
     --harvester should take about 110 secs to fill!
     spice_tiles[unit_pos],self.capacity = (spice_tiles[unit_pos] or 1000)-1, (self.capacity or 0)+.5
     -- done current spot?
     if spice_tiles[unit_pos] <= 0 then      
      -- (clear spice tile + depleat surrounding tiles)
      local xpos,ypos=self:get_tile_pos()--flr(self.x/8),flr(self.y/8)
      for yy=-1,1 do
       for xx=-1,1 do
        val=wrap_mget(xpos+xx,ypos+yy)        
        wrap_mset(xpos+xx,ypos+yy,
        (xx==0 and yy==0) and 0 or ((val>1 and val<8) and 8 or val)
       )
       end
      end
      -- go back to guard (look for more to harvest)
      self.state=0
     end
     -- move around the spice?
     if (self.capacity%300==0) self.newspot=true self.state=0

    end --if state==
   end  -- if harvester

   -- if any "repairable" unit
   if self.id>24 then
    -- is carrying spice & close to refinary
    -- or been sent to repair facility
    -- todo: if route possible, use carryall to move unit
    if self.state==9 then --dist(self.x,self.y,self.last_fact.x,self.last_fact.y)<22 then  
     
     -- check last factory is not destroyed or already busy
     if last_fact.life>0 and not last_fact.occupied then      
      -- center inside factory (refinery)
      -- todo: make sure can't overlap (block the tiles as well?)      
      last_fact.incoming,self.state,self.r,self.x,self.y = false,8,.25,last_fact.x+16,last_fact.y+4
      
      -- if selected, deselect
      if (selected_obj==self) selected_obj=nil
      
      -- is this a harvester?
      if self.capacity then 
       last_fact.occupied=true       
       -- unloading?
       while self.capacity>0 do
        self.capacity-=1        
        -- only make money if human player (and capacity!)
        if (flr(self.capacity)%4==0 and tonum(strnum)<total_storage) transact(2,self)
        yield()       
       end --while unloading
       -- go back to guard (search for spice) mode
       self.capacity,last_fact.occupied,self.state = 0,false,0
      else
       -- must be a repairable unit
       -- spark flash while repairing
       self.process,self.procstep,last_fact.col_cycle_src,last_fact.col_cycle = 2,0,8, {7,10,0,0,7,0,0}        
      end -- capacity check
     
     end -- if unloading/repairing

    end -- check factory busy
    
   end -- check repairable

   
   -- todo: if other unit type (carrier, worm, etc.)
   ::skip_end_guard::
   yield()
  
  end -- end while

 end) 
end

function nearest_space_to_object(obj, target)
 local ux,uy = ping(obj,(target.x+8)/8, (target.y+16)/8, is_free_tile)
 return ux*8, uy*8
end

function add_spice_cloud(x,y,r)
 -- spice clouds
 local cx,cy = sin(r)*5.5,-cos(r)*5.5
 if (rnd"5"<1) add_particle(x+cx+3.5,y+cy+3.5, rnd"2", .15,0,.1, -.01, 25,{2,4,9,15}, 0xa5a5.8)
end

function do_attack(unit, target)
 -- normal attack?
 if unit.id != 19 then
   -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 5=exploding
   unit.state,unit.target = 3,target
   unit.cor = cocreate(function(self)
    while target.life>0 do
     local targdist=dist(unit.x,unit.y,target.x,target.y)
     --  1) move to within firing range of target
     if targdist > unit.range*5
      and unit.speed>0 then
      -- move to within firing range of target
      move_unit_pos(unit,flr(target.x/8),flr(target.y/8),unit.range*5)

      -- saboteur or death hand?
      if unit.id==23 or unit.id==36 then
       unit.life=0
       -- death hand specific?
       --if unit.id==36 then
        for i=1,unit.id/3 do
         make_explosion(unit.x+rnd"32"-16,unit.y+rnd"32"-16, 2)
        end
       --end
       target.life-=(100+rnd"50")
       target.hitby=unit
       return
      end
     end
     -- 2) turn to face target
     if not unit.norotate then
      local a=atan2(unit.x-target.x, unit.y-target.y)   
      while (unit.r != a) do
        turntowardtarget(unit, a)
      end
     end
     -- 3) commence firing
     if targdist<=unit.range*5 then
      if (unit.fire_cooldown<=0 and not unit.bullet_x) unit.fire(unit) unit.fire_cooldown=unit.arms/4
     elseif unit.speed==0 then
      -- turrets default to guard if out of range
      do_guard(unit)
     end
     yield()
     -- deviators should only fire once, per attack
     -- likewise, abort attack if unit becomes converted to "our" side
     if (unit.id==38 or target.faction==unit.faction) break
    end -- 4) repeat 1-3 until target destroyed

    -- reset to guard
    do_guard(self)
   end)
  
 else
  --
  -- palace attack!
  --
  -- palace weapons (emperor also uses death hand)
  local weapons={22,23,36,36}
  -- printh("target id = "..target.id)
  -- printh("target owner = "..target.owner)
  do_attack(m_map_obj_tree(obj_data[weapons[unit.faction]], unit.x,unit.y, unit.owner), target)      
  unit.fire_cooldown = 1750 --350=1m (so 1750 = 5mins for palace weapon again, avg for all factions)
 end
end

-- ping out from initial pos, calling func for each "ripple"
-- until func returns true, then return position
-- source = unit doing ping
function ping(unit,x,y,func,max_dist)
  -- ...to the target pos
  for dist=1,max_dist or 64 do
    for xx=x-dist,x+dist do
      for yy=y-dist,y+dist do
        if ((xx==x-dist or xx==x+dist or yy==y-dist or yy==y+dist) and (func(unit,xx,yy))) return xx,yy
      end
    end
    -- give others a chance!
    yield()
  end  
end

function wrap_mget(mx,my)
 if(my>31)mx+=64 my-=32
 return mget(mx,my)
end

function wrap_mset(mx,my,value)
 if(my>31)mx+=64 my-=32
 mset(mx,my,value)
end

function is_free_tile(unit,x,y)
 return not fget(wrap_mget(x,y),0)
   and object_tiles[x..","..y]==nil
end

function is_danger_tile(unit,x,y)
 local target=units[object_tiles[x..","..y]]
 if (target!=null and target.owner!=unit.owner and target.created_by!=unit.created_by and fow[x][y]==16) do_attack(unit,target) return true
end

function move_unit_pos(unit,x,y,dist_to_keep,try_hail)
  local flying = unit.z>1

  -- before moving, can carryall take us?
  local carryall=has_obj and has_obj[31] or false
  if try_hail then 
   if carryall and not carryall.hail then
    --stop("breakpoint")
    --unit.state=7
    carryall.hail,carryall.hx,carryall.hy = unit,x,y
    unit.hail=carryall   
    carryall.cor=cocreate(function(unit_c)
     local fare=unit_c.hail
     move_unit_pos(unit_c,flr(fare.x/8),flr(fare.y/8))
     del(units, fare)
     move_unit_pos(carryall,carryall.hx,carryall.hy)
     fare:set_pos(carryall.x,carryall.y)
     add(units, fare)
     --unit.lift.hail=nil
     do_guard(carryall)
     do_guard(fare, 9)
    end)
   end
   return
  end
  
  ::restart_move_unit::

  -- check target valid
  if not flying and not is_free_tile(nil,x,y) then   
    -- target tile occupied
    -- move as close as possible
    x,y=ping(unit,x,y,is_free_tile)
  end

  -- create co-routine to find path (over number of cycles)  
  -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding
  unit.tx,unit.ty,unit.prev_state,unit.state = x,y,unit.state,1
   
  -- (pn-minified/modified) "pathfinder"
  -- by @casualeffects
  -- http://graphicscodex.com
  unit.path = nil
  local start, goal, node_to_id = { x = flr(unit.x/8), y = flr(unit.y/8)}, {x = unit.tx, y = unit.ty}, function (node) return shl(node.y, 8) + node.x end
  
  -- the final step in the
  -- current shortest path
  local shortest, 
  -- maps each node to the step
  -- on the best known path to
  -- that node
  best_table = {
   last = start,
   cost_from_start = 0,
   cost_to_goal = manhattan_distance(start, goal)
  }, {}
 
  best_table[node_to_id(start)] = shortest
  
  -- array of frontier paths each
  -- represented by their last
  -- step, used as a priority
  -- queue. elements past
  -- frontier_len are ignored
  local frontier, frontier_len, goal_id, max_number, count = {shortest}, 1, node_to_id(goal), 32767.99, 0

  -- while there are frontier paths
  while frontier_len > 0 do
   --printh("searching ..."..frontier_len)
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
   
   if node_to_id(p) == goal_id then
    -- we're done.  generate the
    -- path to the goal by
    -- retracing steps. reuse
    -- 'p' as the path
    p = {goal}
 
    while shortest.prev do
     shortest = best_table[node_to_id(shortest.prev)]
     add(p, shortest.last)
    end
 
    -- we've found the shortest path
    unit.path = p
    goto end_pathfinding
    --return p
   end -- if
 
   -- consider each neighbor n of
   -- p which is still in the
   -- frontier queue
   for n in all(map_neighbors(p,flying)) do
    -- find the current-best
    -- known way to n (or
    -- create it, if there isn't
    -- one)
    local id = node_to_id(n)
    local curr_cost = not flying and fget(wrap_mget(n.x, n.y), 1) and 4 or 1
    if (p.x != n.x and p.y != n.y) curr_cost+=.2

    local old_best, new_cost_from_start =
     best_table[id],
     shortest.cost_from_start + curr_cost --edge_cost(p, n, flying)
    
    if not old_best then
     -- create an expensive
     -- dummy path step whose
     -- cost_from_start will
     -- immediately be
     -- overwritten
     old_best = {
      last = n,
      cost_from_start = max_number,
      cost_to_goal = manhattan_distance(n, goal)
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
   
   -- (pn) added "unreachable destination" check
   count+=1
   if count%4==0 then
    yield()
    if (count>3000 or stat(0)/2048>.8) goto end_pathfinding --return nil --printh(">> assume unreachable!")
   end

  end -- while frontier not empty

  ::end_pathfinding::


  -- todo: check path valid???
  -- now auto-move to path
  unit.prev_state,unit.state = unit.state,2 --moving

  -- loop all path nodes...
  if unit.path!=nil then

    for i=#unit.path-1,1,-1 do
      local node=unit.path[i]

      if not unit.norotate then
        -- rotate to angle
        local a=atan2(
         unit.x-(node.x*8),  --dx
         unit.y-(node.y*8) ) --dy
        while (unit.r != a) do
          turntowardtarget(unit, a)
        end
      end
      
      -- check new position/tile is still free
      -- (if not flying)
      if(not flying and not is_free_tile(nil,node.x,node.y)) goto restart_move_unit
      
      -- move to new position      
      local scaled_speed,distance = unit.speed or .5, sqrt((node.x*8-unit.x)^2+(node.y*8-unit.y)^2)
      
      -- don't remove these!
      -- (must capture _outside_ the for..loop below)
      local step_x,step_y = scaled_speed * (node.x*8 - unit.x) / distance, scaled_speed * (node.y*8 - unit.y) / distance
      
      for i = 0, distance/scaled_speed-1 do
        -- declare intentions (do it here so always present)
        object_tiles[node.x..","..node.y]=unit
        unit.x+=step_x
        unit.y+=step_y
        yield()
      end
      -- update tile blocking
      unit.x,unit.y,object_tiles[node.x..","..node.y] = node.x*8, node.y*8,unit
      
      -- reveal fog?
      -- todo: stop flying units doing this (shouldn't need to, as owner will be diff.)
      reveal_fow(unit)

      -- are we close enough?
      if (dist(unit.x,unit.y,unit.tx*8,unit.ty*8) <= (dist_to_keep or 0)) break -- stop now
    end

  end -- path nil (can happen if unit is "pinned in")

  -- arrived?
  unit.state=0 --idle
end



-->8
-- draw related 
--------------------------------
function draw_level()
 -- draw the map, objects - everything except ui
	cls"15" --draw_sand
 
 -- cam position (+ any "shaking")
 camera(camx+(16-rnd"32")*shake, camy+(16-rnd"32")*shake)
 
 -- finally, fade out the shake
 shake = (shake>0.05) and shake*0.95 or 0
 -- reset to 0 when very low
 --if (shake<0.05) shake=0

 -- draw sandworm
 if worm_segs then
  for i=1,#worm_segs do
   if (i%2==1) fillp(0xa5a5.8)
   circfill(
    worm_segs[i][1]+4,
    worm_segs[i][2]+4,4,
    worm_cols[i%#worm_cols+1])
   fillp()
  end
  -- eating?
  if (worm_frame>0) spr(88+worm_frame, head_worm_x, head_worm_y)
 end

 palt(11,true)

 -- don't trans black
 palt(0,false) 
  
 map(0,0, 0,0, 64,32)
 map(64,0, 0,256, 64,32)


 -- buildings
 for _,building in pairs(buildings) do 
  if not show_menu then 
    building:update()
    if (building.build_obj) building.build_obj:update()
  end
  building:draw()
  -- draw selected reticule
  if (building == selected_obj) rect(selected_obj.x, selected_obj.y, selected_obj.x+selected_obj.w-1, selected_obj.y+selected_obj.h-1, 7)  
 end

 pal()
 
 -- draw units
 for _,unit in pairs(units) do
  if (not show_menu) unit:update()
  if (unit.process!=2 or unit.speed==0) unit:draw()
  -- draw selected reticule
  if (unit == selected_obj) spr(17, selected_obj.x, selected_obj.y)
 end

 -- particles
 --draw_particles()
 for k,p in pairs(particles) do
  -- patterns
  -- filled = 0x0/0xff
  -- check1 = 0XA5A5
  -- check2 = 0XA0A0
  -- check3 = 0X8020
  --
  --local col=flr((#p.cols/p.life_orig)*p.life)+1
  if (p.pattern) fillp(p.pattern)
  circfill(p.x,p.y,p.r,p.cols[ flr((#p.cols/p.life_orig)*p.life)+1 ]) --col
  fillp()
 end

 -- draw fog-of-war
 draw_fow()

end



function draw_radar()  
 rect(90,90,125,125,p_col1)
 rect(91,91,124,124,p_col2)  
 rectfill(92,92,123,123,0)

 -- anim?
 -- https://youtu.be/T337FK6L0h0?t=2891
 if hq!=last_hq then
  radar_frame,radar_dir = hq and 1 or 59, hq and 1 or -1  
  sfx"55"
  update_radar_data()
 end  
 last_hq=hq

 if radar_frame>0 and radar_frame<60 then
   radar_frame+=radar_dir
   -- draw radar anim
   clip(
     max(108-radar_frame,91),
     max(108-(radar_frame>20 and radar_frame-20 or 0),91),
     min(radar_frame*2,33),
     min((radar_frame>20 and radar_frame-20 or 1)*2,33))
   for i=1,300 do
     pset(92+rnd"32",92+rnd"32",5+rnd"3")
   end
   clip()
   return
 end
   
  -- draw radar data
  for xx=0,31 do
   for yy=0,31 do
    if (radar_data[xx..","..yy]) pset(92+xx,92+yy,radar_data[xx..","..yy])
   end
  end
  
  -- draw "view" bounds
  local cx,cy=92+camx/16,92+camy/16
  rect(cx,cy, cx+7,cy+7, 7)
end

function set_message(msg)
  message,msgcount = msg,500
end

function draw_ui()
 -- ui (score, mouse, etc.)
 camera(0,0)
 pal()
 -- selected objects?
 palt(0,false)
 
 -- object menu icon/buttons?
 if selected_obj and selected_obj.ico_obj then
  selected_obj.ico_obj:set_pos(109,20)
  selected_obj.ico_obj:draw() 
  if selected_obj.build_obj and selected_obj.owner==1 then
   selected_obj.build_obj:set_pos(109,44)
   selected_obj.build_obj:draw() 
  end
  -- repair?
  repair_obj=nil
  if selected_obj.life<selected_obj.hitpoint 
   and selected_obj.owner==1
   and selected_obj.id!=4
   and (selected_obj.type==2
     or selected_obj.speed==0) then
    repair_obj=m_obj_from_ref(obj_data[80], 117,28, 5, {}, nil,draw_action, repair_click) 
    repair_obj:draw()
  end
  -- fire palace weapon?
  launch_obj=nil
  if selected_obj.id==19 
   and selected_obj.fire_cooldown<=0 then
    launch_obj=m_obj_from_ref(obj_data[81], 109,29, 5, {}, nil,draw_action, launch_click) 
    launch_obj:draw()  
  end
 end

 -- top/header bar
 rectfill(0,0,127,8,9) 
 -- update/draw message
 --if (msgcount>0) msgcount-=1 print(message, 2,2,0)
 -- score
 strnum=getscoretext(credits[1])
 ?sub("000000", #strnum+1)..strnum, 103,2, p_col2
 
 -- placement?
 if selected_obj 
  and selected_obj.build_obj 
  and (selected_obj.build_obj.type==4
   or selected_obj.build_obj.speed==0)
  and selected_obj.build_obj.life>=100 then
  -- draw placement
  -- todo: improve this code!
  local mxpos,mypos = flr((cursor.x+camx)/8), flr((cursor.y+camy)/8)
  local sxpos,sypos,w,h = mxpos*8-camx,mypos*8-camy,selected_obj.build_obj.spr_w,selected_obj.build_obj.spr_h
  -- check ok to place
  placement_pos_ok,placement_inner_invalid,placement_damage = false,false,false
  for xx=-1,w do
    for yy=-1,h do
     if xx==-1 or xx==w or yy==-1 or yy==h then     
      -- check edges
      if (wrap_mget(mxpos+xx, mypos+yy)==16 or wrap_mget(mxpos+xx, mypos+yy)>=58) placement_pos_ok=true
     else
      -- check inner
      local val=wrap_mget(mxpos+xx, mypos+yy)
      if (val>=9 and val<=15) placement_damage=true
      if (object_tiles[mxpos+xx..","..mypos+yy] or val==0 or val<8 or val>16) placement_inner_invalid=true
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
  fillp(0xA5A5.8)
  rectfill(0,0,127,127,0)
  fillp()
  
  rectfill(3, 22, 124, 95, p_col2)
  rect(4, 23, 123, 94, p_col1) 

  -- build menu?
  if selected_obj.build_objs then
    selected_obj.valid_build_objs={}
    rectfill(6,25,27,92,0)
    local icount=1
    for i=1,#selected_obj.build_objs do
     local curr_item=selected_obj.build_objs[i]
     if curr_item.req_id==nil 
      or has_obj[curr_item.req_id]
      -- todo: filter out palace + starport if already built (takes more tokens tho!)
      --and (curr_item.max==nil or not has_obj[curr_item.id])
     then
      selected_obj.valid_build_objs[icount]=curr_item
      if icount>=menu_pos and icount<=menu_pos+2 then
        curr_item:set_pos(9,28+(icount-menu_pos)*19)
        curr_item:draw()
      else
        -- hide!
        curr_item:set_pos(-16,16)
      end
      -- draw selected reticule
      if selected_subobj == curr_item then 
        sel_build_item_idx=icount
        rect(curr_item.x-2, curr_item.y-2, 
            curr_item.x+17, curr_item.y+17, 
            7)
        ?selected_subobj.name,30,26,7
        ?"cOST:"..selected_subobj.cost,85,33,9
        ?selected_subobj.description,30,39,6
      end
      icount+=1
     end -- unlocked
    end -- for
  end -- has build obs

  -- ui elements (buttons)?
  for _,controls in pairs(ui_controls) do
    controls:draw()
  end
 end

 -- cursor
 palt(11,true)
 cursor:draw()
end

function m_button(x,y,text,func_onclick,_w)
 add(ui_controls,{
  x=x,
  y=y,
  w=_w or #text*4+2,
  h=8,
  text=text,
  get_hitbox=function(self)
   return self    
   end,
  draw=function(self)
    if(#text>1)rectfill(self.x,self.y,self.x+self.w,self.y+self.h, 7)
    if(#text>1)rectfill(self.x+1,self.y+1,self.x+self.w-1,self.y+self.h-1, self.hover and 12 or 6)
    ?self.text,self.x+2,self.y+2,(#text>1) and 0 or (self.hover and 12 or 7)
    --if (debug_collision) draw_hitbox(self)
  end,
  func_onclick = func_onclick
 })
end

function draw_obj(obj)
 spr(obj.obj_spr, obj.x, obj.y, obj.spr_w, obj.spr_h)
end



-->8
-- game flow / collisions
--------------------------------


-- check all collisions
function collisions()
 clickedsomething=false 
 -- selected obj ui collision
 if selected_obj then
   ui_collision_mode=true
   check_hover_select(repair_obj)
   check_hover_select(launch_obj)
   if (selected_obj.ico_obj and not show_menu and not clickedsomething) check_hover_select(selected_obj.ico_obj)   
   foreach(selected_obj.build_objs, check_hover_select)   
   if (show_menu) foreach(ui_controls, check_hover_select)
   ui_collision_mode=false
 end
 -- check map collisions
 if not show_menu 
  and not clickedsomething then  
  -- unit collisions
  foreach(units, check_hover_select)
  -- building collisions 
  foreach(buildings, check_hover_select)
 end
  
 -- check for radar click
 if left_button_down
    and not show_menu 
    and cursx>89 and cursx<122
    and cursy>90 and cursy<123 then
      -- clicked radar
      camx,camy = mid(0,(cursx-94)*16, 400),mid(-8,(cursy-94)*16, 400)

 -- clicked something?
 elseif left_button_clicked then
  target_mode=false
  -- update message
  if (selected_obj) set_message(selected_obj.name)
 
  if clickedsomething then    
    -- clicked quick build?
    if (not show_menu and selected_obj.func_onclick and selected_obj.parent!=nil) selected_obj:func_onclick() selected_obj=last_selected_obj return
    -- click button?
    if (show_menu and selected_subobj.text and selected_subobj.func_onclick) selected_subobj:func_onclick()  
    -- clicked own unit, first time?
    if (selected_obj.owner==1 and selected_obj.type==1 and selected_obj!=last_selected_obj and selected_obj.speed>0) sfx"62"    
    -- clicked enemy object, last clicked ours (unit or palace)?... attack!
    if (selected_obj.owner==2 and last_selected_obj and (last_selected_obj.type==1 or last_selected_obj.id==19) and last_selected_obj.owner==1) selected_obj.flash_count=10 do_attack(last_selected_obj, selected_obj) selected_obj=nil
  -- deselect?
  else 
    -- do we have a unit selected?
    if selected_obj 
     and selected_obj.type==1
     and selected_obj.owner==1 
     and selected_obj.speed>0 
     and selected_obj.state!=7 then     
     selected_obj.cor = cocreate(function(unit)
       move_unit_pos(unit, flr((camx+cursx)/8), flr((camy+cursy)/8))
       do_guard(unit)
      end)

    end
    
    -- placement?
    if selected_obj 
     and selected_obj.build_obj 
     and selected_obj.build_obj.life>=100
     and placement_pos_ok then
      -- place object
      local objref = selected_obj.build_obj.ref
      m_map_obj_tree(objref,
       flr((cursor.x+camx)/8) *8,
       flr((cursor.y+camy)/8) *8, 1)      
      -- reset build
      reset_build(selected_obj.build_obj)
      sfx"61"
    end

    if (not show_menu) selected_obj=nil
  end 
 
 elseif right_button_clicked and not show_menu then
  -- cancel selection
  selected_obj,target_mode = nil,false
 end --if buttonclicked
end

function reset_build(obj)
  obj.life,obj.process,obj.spent,obj.done = 0,0,0,false
end


function check_hover_select(obj)
  -- null-check
  if (obj==nil) return
  obj.hover = collide(cursor, obj)
  if left_button_clicked and obj.hover then
   if show_menu then
    selected_subobj = obj
   else
    -- is object hidden by fow?
    -- or clicking a harvester unloading or unit repairing?    
    if (obj.type<=2 and fow[flr((cursor.x+camx)/8)][flr((cursor.y+camy)/8)]!=16 or obj.state==8) return
    
    -- was our harvester selected before clicking a refinery/repair?
    if selected_obj
     and (obj.id==6 and selected_obj.id==30 
       or obj.id==14 and selected_obj.id>24)
     and obj.owner==1 then
     -- send harvester/unit to refinery/repair facility
     --selected_obj.state=7
     -- update last factory (in case changed)     
     selected_obj.state,selected_obj.last_fact,obj.incoming = 7,obj,true
     selected_obj.cor = cocreate(function(unit)
      move_unit_pos(unit, (obj.x+16)/8, (obj.y+16)/8, 0, true)
      if (unit.hail==nil) do_guard(unit, 9)
     end)
     return -- register "no click"

    else 
     -- somethign else clicked (e.g. building) - so select it
     selected_obj = obj
    end    
   end
   clickedsomething=true
  end

end




-->8
-- ai-related code

-- whether worm is at surface (+ve) or not
worm_life=0

-- ai strategy code (attack, build, repair, etc.)
function update_ai()
 -- depending on ai level...
 if t()>ai_level and t()%ai_level*2==0 then  
  -- --------------------
  -- unit attacks
  -- 
  -- find the first ai unit and attack player  
  local ai_unit=rnd(units)
  if ai_unit.owner==2 and ai_unit.arms>0 and ai_unit.state==0 then
   -- select a random target (unit or building)
   p_target=(rnd"2"<1)and rnd(units) or rnd(buildings)
   if (p_target and p_target.owner==1 or p_target.created_by==1) do_attack(ai_unit, p_target)
  end
  -- --------------------
  -- repair/build units
  -- 
  local ai_building=rnd(buildings) 
  -- if ai owned...
  if ai_building.owner==2 then
    -- if building is factory, builds units and is not already building...
    if ai_building.build_obj and ai_building.build_obj.ref.type==1 and ai_building.build_obj.process!=1 then
     -- select a random unit to build
     local u=rnd(ai_building.build_objs)
     ai_building.build_obj=u
     u:func_onclick()
    end

    -- repair?
    if ai_building.life<ai_building.hitpoint and ai_building.process!=2 then
     -- auto-repair
     process_click(ai_building, 2)
    end
  end

  -- -------------------------
  -- todo: fire palace weapons
  -- 
  if p_target and p_target.owner==1 and p_target.type==2 
   and ai_palace and ai_palace.fire_cooldown<=0 then 
    do_attack(ai_palace, p_target)
  end

 end

 -- --------------------
 -- sandworm
 -- 
 worm_life-=1
 -- appear/disappear
 if worm_life<0 then
  if worm_segs then
   -- hide worm
   worm_segs=nil
  else
   -- show worm
   worm_segs,worm_dir,worm_turn,worm_cols,worm_frame={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0    
  end
  worm_life_start=rnd"5000"
  worm_life=worm_life_start
 end

 if worm_segs then
  -- movement/turning
  if (_t%6<1 or #worm_segs<30) and worm_frame==0 then
   while #worm_segs<31 do
    if(rnd"9"<.5) worm_turn=rnd".04"-.02
    -- ref to head
    head_worm_x,head_worm_y=worm_segs[#worm_segs][1],worm_segs[#worm_segs][2]
    add(worm_segs,{head_worm_x+sin(worm_dir),head_worm_y-cos(worm_dir)})
    worm_dir+=worm_turn
   end   
  end
  if (#worm_segs>30) del(worm_segs,worm_segs[1])
  if (worm_frame>0) worm_frame+=.01 add_spice_cloud(head_worm_x,head_worm_y,rnd"1")
  if (worm_frame>2) worm_frame=0
  if (worm_life>worm_life_start-128 or worm_life<128) add_spice_cloud(head_worm_x,head_worm_y,rnd"1")
 end

end


-->8
--other helper functions
--------------------------------

-- set/unset the loop flag
-- for specified pattern
function set_loop(enabled)
 local val=peek(0x3115)
 if ((band(val, 128) > 0) != enabled) val=bxor(val,128)
 poke(0x3115, val)  
end


function collide(o1, o2)
 local hb1,hb2 = o1:get_hitbox(),o2:get_hitbox()
 return hb1.x < hb2.x + hb2.w and
  hb1.x + hb1.w > hb2.x and
  hb1.y < hb2.y + hb2.h and
  hb1.y + hb1.h >hb2.y
end

-- function draw_hitbox(obj)
--  local hb=obj:get_hitbox()
--  rect(hb.x,hb.y,hb.x+hb.w,hb.y+hb.h,obj.hover and 11 or 8)
-- end

-- function alternate()
--  return flr(t())%2==0
-- end

-- explode object data
function explode_data()
 str_arrays=split(obj_data,"|","\n")
 -- replace with exploded data
 obj_data={}
 -- loop all objects
 for i=2,#str_arrays-1 do
  new_obj={}
  -- loop all properties
  for j=1,#str_arrays[i] do
   local val=str_arrays[i][j]
   -- convert all but the text columns to numbers
   if (j!=2 and j<29)val=tonum(val)
   if j==29 then
    --restore new lines
    str_breaks=split(val,"~")
    val=""
    for i=1,#str_breaks do
      val=val.."\n"..str_breaks[i]
    end
   end
   new_obj[str_arrays[1][j]]=val
  end
  obj_data[tonum(str_arrays[i][1])]=new_obj
 end
end

-- Large scores (by @Felice)
-- https://www.lexaloffle.com/bbs/?pid=22677
function getscoretext(val)
 local s,v = "",abs(val)
 repeat
     s = (v % 0x0.000a / 0x.0001)..s
     v /= 10
 until v==0
 if (val<0) s = "-"..s
 return s 
end


-- split string
-- https://www.lexaloffle.com/bbs/?tid=32520
 function split(str,d,dd)
 local a,s,tk={},"",""
 
 if (dd~=nil) str=split(str,dd)
 while #str>0 do
  if type(str)=="table" then
   s=str[1]
   add(a,split(s,d))
   del(str,s)
  else
   s,str=sub(str,1,1),sub(str,2)
   if s==d then 
    add(a,tk)
    tk=""
   else
    tk=tk..s
   end
  end
 end
 add(a,tk)
 return a
 end

-- rotate sprite (modified to allow for trans cols)
-- by freds72
-- https://www.lexaloffle.com/bbs/?pid=52525#p52541

function rspr(sx,sy,x,y,a,w,trans,single_col)
	local ca,sa=cos(a),sin(a)	
	local ddx0,ddy0,mask = ca,sa,shl(0xfff8,(w-1))
	w*=4
	ca*=w-0.5
	sa*=w-0.5
	local dx0,dy0,w = sa-ca+w,-ca-sa+w,2*w-1	
	for ix=0,w do
		local srcx,srcy=dx0,dy0
		for iy=0,w do
			if band(bor(srcx,srcy),mask)==0 then
				local c=sget(sx+srcx,sy+srcy)
				if (c!=trans) pset(x+ix,y+iy, single_col or c)
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

function turntowardtarget(unit, targetangle)  
  local diff = targetangle-unit.r
  
  -- skip?
  if (unit.z>1) unit.r = targetangle

  -- never turn more than 180
  if diff > 0.5 then
   diff -= 1
  elseif diff < -0.5 then
   diff += 1
  end

  if diff > 0.0087 then   
   unit.r += 0.0087
  elseif diff < -0.0087 then
   unit.r -= 0.0087
  else
  -- we're already very close
   unit.r = targetangle
  end   
  
  yield()
end


-- returns any neighbor map
-- position at which flag zero
-- is unset
function map_neighbors(node,flying)
 local neighbors = {}
 for xx = -1, 1 do
  for yy = -1, 1 do
   if (xx!=0 or yy!=0) maybe_add(node.x+xx, node.y+yy, neighbors, flying)
  end
 end
 return neighbors
end

-- maybe adds the node to neighbors table
-- (if flag zero is unset at this position)
function maybe_add(nx, ny, ntable, flying)
 if (flying or not fget(wrap_mget(nx,ny),0) and object_tiles[nx..","..ny]==nil and nx>=0 and ny>=0 and nx<=63 and ny<=63) add(ntable, {x=nx, y=ny})
end

-- estimates the cost from a to
-- b by assuming that the graph
-- is a regular grid and all
-- steps cost 1.
function manhattan_distance(a, b)
 return abs(a.x - b.x) + abs(a.y - b.y)
end



--
-- particle related
-- (loosly inspired by @casualeffects' fast particle system)
--

function add_particle(x, y, r, dx, dy, dr, ddy, life, cols, pattern)
  local p={
    x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,
    life=0,ddy=ddy,
    cols=cols, pattern=pattern,
    y_orig=y, life_orig=life
  }
  add(particles, p)
end



__gfx__
bbbbbbbbbb171bbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbb9b5d555d555d555d55d555d5bbbbbbbbb1d5155555d555d5bdddddddd
bb11bbbbb17771bbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb991555515d15555155d51555515dbbbd5b5155d55dd5155551d5555555
bb171bbb1711171bbbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b5d55d5515d55d555155d55d5d5155551555d5155155d55d5d5015515
bb1771bb7717177bbbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbb55515d5555515d5d55d51555155d55d5d5555d5555d51555d5105555
bb17771b1711171bbbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99bd55d5555d55555555555d55d55d5155555d155d55555d55dd5555111
bb177771b17771bbbbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbb55d551d555d515555d155d555555d55d155555555d155d55d1555101
bb17711bbb171bbbbbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb1555555555555515555555515d155d55b51bbd5b55555551d5555111
bbb11bbbbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbb55d5515555d55555155d55b55555551bbbbbbbb5155d55bd5515555
ddddddddb7bbbb7bbbbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d555555577bbbb77bb77bbb7bbbbbbbbbb66669bbbbbbbbbb6bbbbbb1555515d4444444444555155544444444444444444444444544224222242224442422442
d5555555bbbbbbbbb79bb77b0000b000b66dd66bbd5bb5bbbbbbbb6b5d55d444444444444445d555444444444444444444444444524442444424442224444221
d5555555bbbbbbbb79b779bb07700077b6d55d6bb5dbbbbbbbbbbbbb55544444444444444444445d444444444444444444444442522222212222222242222110
d5555555bbbbbbbbbb799bbb00777770b6d55d6bbbbb555bbbbbbbbb555444444444444444444445444444444444444444444422502112121121122121121200
d5555555bbbbbbbbb799bbbb07700077b66dd66bbbbb5d5bbbb6bbbb55d444444444444444444445444444444444444444444242550221200012210012100005
d555555577bbbb77b79bbbbb0000b000bb6666bbbbbb555bbbbbbbbb154444444444444444444444444444444444444444444240555000055000000500055555
d5555555b7bbbb7b7bbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb55444444444444444444444444444444444444444444442155555555555555555555d555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb0000000000000000
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000b00000000
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
bbbbbbbbbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbb7bbb7bbb7bbb7bbbbbbbbbbdddddddddddddddddddddddddfffb1ffddddd999dddddddd
b0eee0bbb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbbcbbbcbbbcbbbcbbbdeeedbbd555555555555544c4555555df4aa14ff559999999555765
b0d6d0bbb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbbebbbebbbebbbebbb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
bbc7cbbbbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbb0bbb0bb0b0b0b0bb6d7d6bbd4c455444445549904499c95df444444f52449494425dffd
b0c7c0bbbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbbbb7bbbbbbb7bbbbb6d4d6bb4a042499999452424297a094dffffffff5424444424556d5
b0ccc0bbb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbbbbcbbbbbbbcbbbbb69996bb49029999c0994922229aa094d44444444522424244255425
bb6b6bbbb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbbbebbbbbbbebbbbbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbbbbbbbbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbbbbbbbbbd2499a77a0a94942d1542425d44411114555224225ff2225
d77dd77d67d6fffdddd776ddddddddddddddddddddd777ddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99424d15242f5d55555555555555555f44225
76667666561ffff1d576db65d5577655d5555555d5766665d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d76dbbb5d576db65d5557555d5766665d5bbbbb5bbbddbbbbbdadbbbbbb77bbbd52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d66d11b5d76dbbb5d5576655d5d66625d5555555bbd66dbbbb666bbbc767767cd5424999994942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d66d01b0d66d11b5d55d6255d5dd2225d55aaa55bbd66dbbbbb6bbbbc767767cd5542494949424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d66d0b01d66d01b0d55d2215d5dd2221d5555555bbbddbbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
6115511151551005d56dd015d66d0b01d5551155d5512211d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5511155d56dd015d5555555d5551115d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5ddddd776ddd111ddddd777ddddddddddddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc055d55576db65555555d5766665d5555555d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d5576dbbb555c055d5766665d5557555d5558555b1b11b1bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd5566d11b55ee055d5d66625d5576655d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad5555055d5566d01b0555055d5dd2225d55d6255d55aaa55b651156b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d5566d0b01555055d5dd2221d55d2215d5555555b7b55b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5556dd015555555d5512211d5551155d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d5555111d5555555d5551115d5555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666dddddddddddddddddddddddd66666666666ddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4dddddd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddddd4ddd5dd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddd5ddd5dddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5ddd766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd44d6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5dddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5dd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4d5dddd5dd0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c0777767767767d4dddddd51d0001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5511111766d0d66d542222222222245d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d55555556d666662d52c02c020200225d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5ee0ee022200225d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d55555556dd00022d551011011111115d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d55555555dd0d021d555011011111155d222444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555555100011d555555555555555d555222255555555d111111111194421
ddddddddddddddd6766dddddddddddddd7766ddd577777d59ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
d55555555c0555d6766dd555d76555557c67c676576666d59999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
d5d6d555ee055dd6766dd155d6d5555dcd76dc6d576666d0ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
d576dddd550516d6766d6105d556555dccddccd5576666d099999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
d50015055505ddd6766ddd05d5c7c5cd6cccc6dc56dddd10777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
d55555555d101dd6766dd105d1dcd1c1d6666d1c56dddd1066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
d455555550001dd6766dd105d1cdc177660dd1c656dddd106666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
d15ddddddddd1dd6d16dd105d51117c67c601ccd5d111110dddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
d55776d7777716d6116d6105d500dcd76dcd0dd1dddddddddddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110d5ddddd5dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005d55ddd55dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555d555d555dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c6055d5551555dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055d55111555555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076d511111555555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dd111111155555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
ffffffffffffffffffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
ffffffffffffffffffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
ffffffffffffffffffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
ffffffffffffffffffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
ff77777777ffffffff77757777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
ff766666666fffffff766657666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
ff7666666666ffffff5555565555ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
f766666666666ffff777777577777fff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
f7666666666666fff7666665766666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
f76666666666666ff76666665766666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
f55555555555555ff55555555555555f6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
ffffffffffffffffffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
fffffffffffffffffffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
fffffffffffffffffffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
fffffffffffffffffffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
ffffffffffffffffffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffc7cccccccccccccccccccccccccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff54ccccccccccccccccccccccccccccc006ccccccc
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660ccccc2888887660cccc4ff54cccccccccccccc7ffc455550cccc7f000005550cc
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cccc288888887ccccccc54cccccff5ccccccc44ffff4ccccc4fffffffff4ccccc
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444ccccc5225222222287ccc45555cc4ffffcccc50005444544ccc45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cc55588888888855cc54fffffffffff5cc5000005ffff505c5016054ff501605c
916666d001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950400000000045995000005999400095061052995061059
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999ffccccccccccc99f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
bbbbbbbbbbb7bbbb445d44999fcfcccccccccccccccccccccdcccdcccd1cccccccccccccccccc60ccc06cccccccccccccccccccccccccccccccccccccccccccc
bbbbbbbbbbcccbbb44d499999949fcccccccccccccccc6ccccdcccdccc1ccccccccc77cccccc515cc8115cccccc8787ccccccccccccccccc6ccccccccccccccc
bbbbb6bbbdddddbb44dd66666699fcccccccc6cccccc6f6cd77ddddddd1dddddcc77577cccc51cccc00015cccc755567cccccccccccccccc76cccccccccccccc
bbbbb7bccccccccc445d5555555ddcddcccc6f6cccccfffcc66dcccdc1c1cccccc5775d60051ccccc808d15006d85866cccccccccccccccc765cc77775cccccc
bbbcdcd5dd6d6d6d44dd96969696ddddccccfffcccccc5ccccccdccf1fff167cccc5566dd106ccccc000d601dd6555ddccc5f7cccccccccc7756777780777ccc
bbcccccc5ddddddb444666666666ddd5ccccc5cccccccfccddddddf1fffff1ddccc7666666666cccc8086666666858dd9cc65c6f6ccccccc765d656520dd777c
bbbd6d65dccccccb4446f66666f6d5ddf6cccf9999999fcc55555dd505050fddccc0000000000ccccccc00000000001149cffcf80ccccccc775cdd5d1ccc775d
bbcccccc5c5c5c5c4446664446666dddfff6cf9ccccc9fccdddd5ddd505050ddccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0f6cd0ccccccc5ccc505ccd667
bbdddddd5ddddddd4445649994666dddf9999fcccf6ccfccddd65dddddddddddccdd66ddddddd5ccccc5ddddddd66ddc4443ff005c01cccccc5ccccdcdccdddc
99955555ddddddd94545699999666d5d49119fccf6f6cfffdd22205d5ddd5dddccddd66dd555d5ccccc5d555dd66dddc22450f605d0ffff9c5ccccccccccc5cc
666dddd5555555554456699999666ddd4900944c5f659999d82d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336d8d2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446f600244ff999455d44444444549
996666666669699944467777777666dd777666666353655dd8dffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355f332494fff9444444449999999
9999996999999999444fffffffff942f666666666353d33dfffffffff5f6667d999dd6677766d5999995d6677766dd9924335203504449f9999999999999f999
44449999449444944444ffffffff560f6666ddddddddddddfff4f4f4f56ddddd99ddd66dd566d5999995d665dd66ddd9446f2446f09999ff9999999999998999
44444444444444444444ffffffffffffddddddddddddddddffffffffffffffff99dd666dd5666d59995d6665dd666dd9443324430044499f9999999999999999
__gff__
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
0000000000000000001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
121212000000001616161600420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a4900160085850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a3a10100c830a85420a6c0a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a1010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d00800e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120000160000010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200160000850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000121200000000850085006a0a0085001d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000003d00000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000c090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121200000000000000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a0a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a0a1e1b1b1b1c0a6000000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d620a0a0a1a1b1c1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a0a0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000000000000000090a650a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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
011000200c0430c04305155051550515511975051551197506155061550615511975031550315503155039750c0430c0430515505155051551810005155181000d1550d1550d155181000c1550c1550c15518100
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
00 08492262
01 080a490b
00 080a0c0b
00 080a0c0b
00 0d0f0e0b
00 0d0f0e0b
00 10121113
00 10121113
00 10121413
00 10121513
00 16181719
00 101b1a13
00 101b1c13
00 100a0c13
00 1e0f0e13
00 16181719
00 1f0a0c13
00 16181719
02 080a490b

