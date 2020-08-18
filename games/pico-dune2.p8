pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

cartdata("pn_undune2") 

-- data flags
p_level,p_faction,p_col1,p_col2,ai_faction,ai_col1,ai_col2,ai_level=dget"0",dget"1",dget"2",dget"3",dget"20",dget"21",dget"22",dget"23"

credits={
 shr(dget"6",16), -- player starting credits
 shr(500,16),     -- ai starting credits
 shr(dget"7",16)  -- target credits
}

-- DEBUG #####
-- player
--p_level,p_faction,p_col1,p_col2=1,1,12,1 -- atreides
--p_level,p_faction,p_col1,p_col2=1,2,11,3 -- ordos
--p_level,p_faction,p_col1,p_col2=1,3,8,2  -- harkonnen
--ai
--ai_faction,ai_col1,ai_col2,ai_level=1,12,1,2    -- atreides
--ai_faction,ai_col1,ai_col2,ai_level=3,8,2,1    -- harkonnen
--credits={shr(999,16), shr(999,16), shr(9999,16) }


-- fields
_g,buildings,units,object_tiles,radar_data,spice_tiles,particles,has_obj,start_time,_t,build_dest,unit_dest,keyx,keyy,hq,radar_frame={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0
last_hq,message,msgcount,fow=hq,"",0,{}

_g.factory_click=function(self)
  menu_pos,selected_subobj,ui_controls=1,nil,{}
  -- create buttons
  m_button(6,84,"⬆️",function()
   sel_build_item_idx=mid(1,sel_build_item_idx-1,#selected_obj.valid_build_objs)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]
   if (sel_build_item_idx<menu_pos) menu_pos-=1
  end, 10)
  m_button(17,84,"⬇️",function()
   local len=#selected_obj.valid_build_objs
   if (sel_build_item_idx<len) sel_build_item_idx=mid(1,sel_build_item_idx+1,len)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]   
   if (sel_build_item_idx>menu_pos+2) menu_pos=min(menu_pos+1,len-2)
  end, 10)
  m_button(32,83,"build",function()
   show_menu=nil
   last_selected_subobj:func_onclick()
  end)
  m_button(96,83,"close",function()
   show_menu=nil
  end)
  -- show build menu
  show_menu=self
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
launch_click=function(self)
 -- palace? 
 if last_selected_obj.id!=35 then
  -- go into launch mode 
  set_message"pick target"
  target_mode=true
 else
  -- mcv mode
  local mx,my=last_selected_obj:get_tile_pos()
  local val=wrap_mget(mx,my)
  if val>=9 and val<=15 then
   last_selected_obj.life=0
   --del(units,last_selected_obj)
   m_map_obj_tree(obj_data[1],mx*8,my*8,1)
   ssfx"61"
  end
  last_selected_obj=nil
 end
end


function process_click(self, mode)
  -- toggle/switch mode (building/repairing) depending on state & click
  self.procstep,self.last_process,self.process=0,self.process,mode
  if (self.life>0 and self.last_process>0) self.procpaused=not self.procpaused  
  if (mode==1) self.parent.incoming=true self.parent.build_obj=self
end

-- object data
obj_data=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1|||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1|||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1|||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1|||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1|||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1|||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1|||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1|||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1|||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1|||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1|||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1|||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1|||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1|||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1|||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1|||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||448|400|0.3|9|2|112|58|54||||0|0|0|0|0|0|1|1|||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1|||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1|||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||300|20|1|9|2|20||54||41|5|0|0|0|0|0|0|1|1|||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1|||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1|||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1|||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1|||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1|||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||50|480|0.3|7|2|500|58|54||||0|0|0|0|0|0|1|1|||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1|||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|32||1|1|1|1|11|||0|||||1|1|||||||0|4|0||||||1|||0|0|0|0|0|0|1|1|||||||
80|rEPAIR|19||5|1|1|1|11||||||||1|1||||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
81|lAUNCH|1||5|1|1|1|11||||||||1|1||||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
99|worker|0||10|1|1|1||||0|||||||||||||0|99|0|||||||||0|0|0|0|0|0|1|1|||||||]]



-->8
--p8 functions
--

function _init()
 -- enable mouse
 poke(0x5f2d, 1)

 menuitem(1,"exit to title",function()
  load("pico-dune-main")
 end)

 --  
 -- explode object data
 -- 
 local str_arrays=split2d(obj_data,"|","\n")
 obj_data={}
 -- loop all objects
 for i=2,46 do
  local new_obj={}
  -- loop all properties
  for j=1,50 do
   local val=str_arrays[i][j]
   -- convert all but the text columns to numbers
   if (j!=2 and j<45)val=tonum(val)
   if j==46 then
    --restore new lines
    str_breaks,val=split2d(val,"~"),""
    for line in all(str_breaks) do
      val=val.."\n"..line
    end
   end
   new_obj[str_arrays[1][j]]=val
  end
  obj_data[tonum(str_arrays[i][1])]=new_obj
 end

 -- init fog of war?
 for i=-2,66 do
  fow[i]={}
  for l=-2,66 do
   fow[i][l]=16
  end
 end

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
   spr((selected_obj and selected_obj.type==1 and selected_obj.owner==1 or target_mode) and 1,
    self.x, self.y)
  end
  }

 -- discover_objs()
 -- analyse current map & spawn objs
 -- (first pass find the player start pos/const yard)
 -- (second finds everything else)
 for i=1,2 do
  for my=0,31 do
    for mx=0,127 do
      local objref=nil
      local spr_val=mget(mx,my)
      
      -- handle player start pos (const yard) as a special case
      if i==1 and spr_val==1 then
       -- found player start position
       pstartx,pstarty=wrap_discover_obj_pos(mx,my)
       --pstartx,pstarty=mx*8,my*8        
       -- center camera & create player const yard
       camx,camy,objref=pstartx-56,pstarty-56,obj_data[1]

      elseif i==2
       and spr_val>=32 then --don't create "concrete" as objs
       
       -- find object for id
       for _,o in pairs(obj_data) do         
        if (o.obj_spr!=nil and o.obj_spr==spr_val) objref=o break       
       end
      end
      
      if objref!=nil then
        local ox,oy=wrap_discover_obj_pos(mx,my)
        --local ox,oy=mx,my
        --if (ox>63) oy+=32 ox-=64
        mset(mx,my,0)
        m_map_obj_tree(objref, ox,oy)
      end
    end
  end  
 end

 -- worker
 worker = m_map_obj_tree(obj_data[99], -8,-8)
 worker.cor = cocreate(function()

  while true do

  if _t%30==0 then
   -- 
   -- update_obj_tiles()
   -- 
   -- update positions of pathfinding "blocker" objects 
   object_tiles={}
   -- (The pico-8 map is a 128x32 (or 128x64 using shared space))
   for k,unit in pairs(units) do  
    object_tiles[unit:get_tile_pos_index()]=k
   end

   -- 
   -- update_radar_data()
   -- 
   new_radar_data={}
   -- landscape/fow
   if hq then  
    for i=0,124,4 do
      for l=0,124,4 do
       -- look at tile spr and if not fow, get col?
       local mx,my = i/2,l/2
       if(my>=32)mx+=64 my-=32
       local mspr=mget(mx,my)
       local col=sget((mspr*8)%128+4, (mspr*8)/16)
       if(fow[i/2][l/2]==16) new_radar_data[(i/2/2)..","..(l/2/2)] = col!=11 and col or 15
      end
      yield()
    end
   end  

   -- -- structures
   -- reset vars for this pass
   power_bal,total_storage,has_radar,building_count = 0,0,false,{0,0}
   if (_t%100==0) has_obj={{},{}} 

   for _,building in pairs(buildings) do  
    -- if our building, or ai not under fog of war
    if building.owner==1 or (hq and is_visible(building)) then --fow[posx][posy]==16) then
     new_radar_data[flr(building.x/2/8)..","..flr(building.y/2/8)] = building.col1
    end
    -- track power/radar
    if building.owner==1 then
     -- player owned
     power_bal -= building.power
     if (building.id==7) has_radar=true
     if (sub(building.name,1,5)=="sPICE") total_storage+=1000
    end
    -- track counts & objs
    building_count[building.owner]+=1
    has_obj[building.created_by][building.id]=building
   end
   
   
   -- units
   for _,unit in pairs(units) do
    -- if our unit, or ai not under fog of war
    if hq and (unit.owner==1 or is_visible(unit) and unit.z==1) then
     new_radar_data[flr(unit.x/2/8)..","..flr(unit.y/2/8)] = unit.col1
    end
    if (unit.created_by>0) has_obj[unit.created_by][unit.id]=unit
   end
  
   -- has radar-outpost + enough power?
   hq,music_state,radar_data = (has_radar and power_bal>0),2 ,new_radar_data
   -- reset music (will set if more attack)
   set_loop(false)  --5
 
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
  end --alt?

  yield()

  end -- while

 end) --worker


 music"7"
 shake=0
end

function wrap_discover_obj_pos(mx,my)
 if (mx>63) my+=32 mx-=64
 return mx*8,my*8
end

function m_map_obj_tree(objref, x,y, owner, factory)
  local newobj=m_obj_from_ref(objref, x,y, objref.type, nil, _g[objref.func_init], _g[objref.func_draw], _g[objref.func_update], nil)
  newobj.ico_obj,newobj.life = m_obj_from_ref(objref, 109,0, 3, newobj, nil, nil, _g[objref.func_onclick]), placement_damage and objref.hitpoint/2 or objref.hitpoint -- unless built without concrete
  -- player-controlled or ai?
  -- todo: this whole thing may not be needed as once we have plr start pos, that might be all we need
  newobj.owner=newobj.owner or owner or dist(x,y,pstartx,pstarty)<75 and 1 or 2
  newobj.created_by,newobj.build_objs = owner or newobj.owner, {}
  -- go through all ref's and see if any valid for this building
  for o in all(obj_data) do
   local req_faq=o.req_faction
    if (o.parent_id!=nil and (o.parent_id==newobj.id or o.parent2_id==newobj.id))					
     and (req_faq==nil
      or (req_faq>0 and req_faq==p_faction)
      or (req_faq<0 and -p_faction!=req_faq))
    then
      add(newobj.build_objs,
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
    end
  end

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
  
  -- (flying objs are automomous & don't reveal map)
  if (newobj.z>1) newobj.owner=0

  local xpos,ypos = flr(x/8),flr(y/8)
  
  -- building props?        
  if objref.type==2 then
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
     -- auto-create harvester
     local ux,uy=nearest_space_to_object(newobj)
     m_map_obj_tree(obj_data[32],ux,uy,newobj.owner,newobj)
    end
  else
  -- unit props  
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
       ssfx(self.fire_sfx)
       reveal_fow(self)
     end
     -- rocket/cannon turret?
     if (newobj.id==15 or newobj.id==16) wrap_mset(xpos, ypos, 149)
    else
     -- harvesters
     if (newobj.id==32) newobj.capacity=0 factory=nil
     -- non-fighting units
     newobj.last_fact=factory --default, for retreating
    end    
    add(units,newobj)
    -- default to guard
    do_guard(newobj)
  end
  reveal_fow(newobj)
  return newobj
end

function m_obj_from_ref(ref_obj, x,y, in_type, parent, func_init, func_draw, func_onclick)
 local obj={  
  ref=ref_obj,
  id=ref_obj.id,
  hitpoint=ref_obj.hitpoint,
  x=x,
  y=y,
  z=ref_obj.z, -- defaults  
  orig_x=x/8,
  orig_y=y/8,
  type=in_type,
  parent=parent,
  func_onclick=func_onclick,
  w=ref_obj.w*8, -- pixel dimensions 
  h=ref_obj.h*8,
  orig_spr=ref_obj.obj_spr,
  spr_w=ref_obj.w, -- defaults
  spr_h=ref_obj.h, --
  col_cycle=split2d(ref_obj.col_cycle),
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
       or self.y>camy+127+self.z)
     then
      -- don't draw, as off-screen
      return
     end

     pal()
     palt(0,false)
     if (self.trans_col and self.type<=2) palt(self.trans_col,true)     
     -- faction? (if not IX)
     if (self.faction and self.id!=18) pal(12,self.col1) pal(14,self.col2)
     -- colour anim?
     if self.col_cycle then
      pal(self.col_cycle_src, self.col_cycle[self.col_cycle_pos])
     end
     -- rotating obj?
     if self.r then
      if not self.death_time or self.death_time>.025  then
       -- draw twice (shadow first, then norm)
       for i=1,2 do
        if (i==2 or self.speed>0) rspr(self.obj_spr%16*8,flr(self.obj_spr/16)*8, self.x, self.y-(i==2 and self.z or 0), .25-self.r, 1, self.trans_col, i==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
       end
      end
     -- norm sprite
     else      
       -- icon mode
       if self.type>2 and self.type<5 then
         local this = self.type==4 and self or self.parent
         -- hover
         rectfill(self.x-1,self.y-1,self.x+16,self.y+19, 0)--(self.hover and #this.build_objs>0) and p_col1 or 0)         
         -- draw health/progress
         local hp = this.hitpoint
         local val = self.process==1 and 15*(this.life/100) or 15*(this.life/hp)
         if (this.life>0 and not show_menu) rectfill(self.x,self.y+17,self.x+val,self.y+18, self.process==1 and 12 or this.life<hp*.33 and 8 or this.life<hp*.66 and 10 or 11)
         pal(11,this.icol1) pal(3,this.icol2)
       end
       -- non-rotational sprite
       if self.type>2 then
        -- icon
        spr(self.ico_spr, self.x, self.y, self.ico_w, self.ico_h)
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
        self.id==40 and {11} or is_missile and split2d("7,7,10,9,8,2,13,6,7") or {15},
        rnd"2"<1 and 0xa5a5.8 or 0)
      end
     end
     -- smoking?
     if (self.life<self.hitpoint*.33 and self.altframe==nil and rnd"10"<1 and self.type<=2) add_particle(self.x+3.5,self.y+3.5, 1, .1,-.02,.05, -.002, 80,split2d("10,8,9,6,5"), rnd"2"<1 and 0xa5a5.8 or 0)
     -- reset hit flag
     self.hit=0
   end,
   update=function(self)
     local life=self.life
     -- update targeting flash
     self.flash_count=max(self.flash_count-.4,1)
     -- check for attack
     if self.hit>0 and self.created_by>0 then 
       -- reinstate loop
       set_loop(true) --5
       -- switch music (if passed the loop point)?
       -- 0=normal, 1=battle, 2=leaving_battle
       if (music_state==0 or stat(24)>5) music_state=1 music"0"
       -- can we retaliate (unit/turret)?
       if (self.arms>0 and self.state==0) do_attack(self, self.hitby)
       -- lose soldiers
       if (self.obj_spr<=49 and life<100) self.spr_w,self.spr_h=0.5,0.5
       -- req repair pickup
       if (life<50 and self.state!=7) return_to_fact(self,has_obj[self.created_by][14] or self.last_fact) --TODO: chk last fact being set to facts (unless harvester!)
     end
     -- check for death
     if (self.type<=2 and life<=0 and self.death_time==nil) self.state=5 self.cor=nil self.death_time=(self.type==2 and 1 or .5) ssfx(self.death_sfx) shake+=((self.type==2 or self.id==38) and 0.25 or 0)
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
         local gx,gy = self:get_tile_pos()
         if (wrap_mget(gx,gy)<9) wrap_mset(gx,gy,20) --scorch sand
         if (self.id<=17) wrap_mset(gx,gy,15)
         del(units,self)
         -- bloom
         if self.id==42 then
          ping(self,gx,gy,
           function (unit,x,y)
            if (wrap_mget(x,y)==0) wrap_mset(x,y,8)
           end,
           4, true)
         end
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
        if self.id==40 and target.speed!=nil then
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
        if (self.parent.owner==1) ssfx"56" set_message("cONSTRUCTION cOMPLETE")
        -- auto-deploy units
        if self.ref.type==1
         and self.parent_id != 1 then
          -- find nearest point to factory
          local ux,uy=nearest_space_to_object(self.parent)
          m_map_obj_tree(self.ref,ux,uy,self.parent.owner,self.parent)
          -- reset build
          reset_build(self)
        end
      elseif self.process==2 and life>self.hitpoint then
        -- repair complete
        self.process=0
        -- move unit to safe place?
        if self.type==1 and self.speed>0 then
         -- stop flashing while repairing
         self.return_to.col_cycle={0}
         -- go back to guard
         self.state=0        
         -- find nearest point to factory
         self.x,self.y=nearest_space_to_object(self)
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

     -- specific update 
     -- if self.owner==1 and 
     if (self.id==5) self.name="wINDTRAP (pOWER:"..power_bal..")"
   end,

   set_pos=function(self,x,y)
    self.x,self.y=x,y
   end,
   get_tile_pos_index=function(self)
    local x,y = self:get_tile_pos()
    return x..","..y
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
 if (getscoretext(credits[obj.owner])+diff<0) return false
 credits[obj.owner]+=sgn(diff)*shr(abs(diff),16)
 if (obj.owner==1) sfx"63"
 return true
end

function make_explosion(x,y,size_type)
 add_particle(x, y, 2, 
         0,0,.1,0, size_type==1 and 5 or 30, split2d("5,7,10,8,9,2"), rnd"2"<1 and 0xa5a5.8 or 0)
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


function _update60()

 -- update_level()
 -- mouse control
  mouse_x,mouse_y,mouse_btn=stat"32",stat"33",stat"34"
  left_button_clicked,left_button_down,right_button_clicked = (mouse_btn==1 and last_mouse_btn != mouse_btn) or btnp"4", (mouse_btn>0) or btn"4", (mouse_btn==2 and last_mouse_btn != mouse_btn) or btnp"5"
  -- keyboard input
  for k=0,1 do
   if (btn(k)) keyx+=k*2-1
   if (btn(k+2)) keyy+=k*2-1
   --if (btn(4,1)) stop("paused")
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
       and dist(head_worm_x,head_worm_y,unit.x,unit.y) < 1
       and unit.z==1
       then
        del(units,unit)
        worm_frame=.01
        ssfx"50"
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
    
  -- ai overall decision making (not individual units)
  update_ai()  
 end -- no menu
 
 update_collisions()

 last_mouse_btn,last_selected_obj,last_selected_subobj = mouse_btn,selected_obj,selected_subobj 
 _t+=1
end


function _draw()
 -- draw the map, objects - everything except ui
 draw_level()
 -- draw score, mouse, etc.
 draw_ui()
end

-->8
-- init related
--

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
--

function update_level()
  end

function is_spice_tile(x,y)
  local val=wrap_mget(x,y)
  return val>=2 and val<=8
end

function do_guard(unit, start_state)
 -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding, 
 --(6=harvesting, 7=returning, 9=ready-to-unload/repair, 8=offloading/repairing)
 unit.state,unit.link = start_state or 0,nil
 unit.cor = cocreate(function(self)
  while true do
   -- if carryall/ornithopter only
   if self.z>1 then
    -- move around origin point (but keep to map boundary!)
    move_unit_pos(self, 
     mid(flr(self.orig_x+rnd"32")-16,64), 
     mid(flr(self.orig_y+rnd"32")-16,64))
   end

   -- be on look-out
   if rnd"250"<1 and self.arms>0 and self.state!=8 then    
    -- is danger tile?
    local gx,gy = self:get_tile_pos()
    ping(self,gx,gy,
     function (unit,x,y)
      local target=units[object_tiles[x..","..y]]
      if (target!=null and target.created_by!=unit.created_by and fow[x][y]==16 and target.z==1) do_attack(unit,target) return true
     end,
     5) -- fixes lookout range (was self.range)

   -- ornithopter?
   elseif self.id==34 then
     -- select a random target (unit or building)
     -- (will ignore fow!)
     attack_rnd_enemy(self)
   end


   local last_fact = self.return_to or self.last_fact
   
   -- if a harvester only
   if self.id==32 then   
    if self.state==0 or self.state==9 then
    
     if self.capacity<=1500 
      and self.state!=7 and self.state!=9 then
      -- clear last fact visit
      self.return_to=nil
      local sx,sy
      local tx,ty=self:get_tile_pos()
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
      self.sx,self.sy=self:get_tile_pos() -- remember where we were!
      return_to_fact(self,last_fact or has_obj[unit.created_by][6])

     -- harvesting spice
    elseif self.state==6 then
     self.newspot=false
     -- spice clouds
     add_spice_cloud(unit.x, unit.y, unit.r+.75+rnd".2"-.1)

     -- update spice tile state
     local unit_pos = unit:get_tile_pos_index()
     --harvester should take about 110 secs to fill!
     spice_tiles[unit_pos],self.capacity,self.name = (spice_tiles[unit_pos] or 1000)-1, (self.capacity or 0)+.5,"hARVESTER ("..flr(self.capacity/1500*100).."% fULL)"
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
   if self.id>26 then    
    -- is carrying spice & close to refinary
    -- or been sent to repair facility
    -- todo: if route impossible, use carryall to move unit
    if self.state==9 then --dist(self.x,self.y,self.last_fact.x,self.last_fact.y)<22 then  
     
     -- check last factory is not destroyed or already busy
     -- (and that we are still alive!)
     if last_fact.life>0 and not last_fact.occupied and self.life>0 then      
      -- center inside factory (refinery)
      -- todo: make sure can't overlap (block the tiles as well?)      
      last_fact.incoming,self.state,self.r,self.x,self.y = false,8,.25,last_fact.x+16,last_fact.y+4

      -- if selected, deselect
      if (selected_obj==self) selected_obj=nil
      
      -- is this a harvester & refinery?
      if self.capacity and last_fact.id==6 then 
       last_fact.occupied=true       
       -- unloading?
       while self.capacity>0 do
        self.capacity-=1        
        -- only make money if human player (and capacity!)
        if flr(self.capacity)%4==0 then
         if tonum(strnum)<total_storage then
          transact(2,self)
         elseif self.owner==1 then
          set_message"sPICE LOST. bUILD sILO"
         end
        end
        yield()       
       end --while unloading
       -- go back to guard (search for spice) mode
       self.capacity,last_fact.occupied,self.state = 0,false,0
       if (self.sx) move_unit_pos(self, self.sx, self.sy, 0, true)
      else
       -- must be a repairable unit
       -- spark flash while repairing       
       self.process,self.procstep,last_fact.col_cycle_src,last_fact.col_cycle = 2,0,8, split2d("7,10,0,0,7,0,0")
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

-- always skip yield (as called directly)
function nearest_space_to_object(target)
 local ux,uy = ping(target,flr((target.x+8)/8), flr((target.y+8)/8), is_free_tile, nil, true)
 return ux*8, uy*8
end

function add_spice_cloud(x,y,r)
 -- spice clouds
 if (rnd"5"<1) add_particle(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split2d("2,4,9,15"), 0xa5a5.8)
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
      if unit.id==25 or unit.id==38 then
       unit.life=0
        for i=1,unit.id/3 do
         make_explosion(unit.x+rnd"32"-16,unit.y+rnd"32"-16, 2)
        end
       --end
       target.life-=(400+rnd"200")
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
      if (unit.fire_cooldown<=0 and not unit.bullet_x) unit.fire(unit) unit.fire_cooldown=unit.fire_rate --unit.arms/4
     elseif unit.speed==0 then
      -- turrets default to guard if out of range
      do_guard(unit)
     end
     yield()
     -- deviators should only fire once, per attack
     -- likewise, abort attack if unit becomes converted to "our" side
     if (unit.id==40 or unit.id==34 or target.faction==unit.faction or target.link) break
    end -- 4) repeat 1-3 until target destroyed

    -- reset to guard
    do_guard(self)
   end)
  
 else
  --
  -- palace attack!
  --
  -- palace weapons (emperor also uses death hand)
  local weapons={24,25,38,38}
  do_attack(m_map_obj_tree(obj_data[weapons[unit.faction]], unit.x,unit.y, unit.owner), target)      
  unit.fire_cooldown = 1750 --350=1m (so 1750 = 5mins for palace weapon again, avg for all factions)
 end
end

-- ping out from initial pos, calling func for each "ripple"
-- until func returns true, then return position
-- source = unit doing ping
function ping(unit,x,y,func,max_dist,skip_yield)
 for t=0,max_dist or 64,.02 do
 	local xx,yy=flr(x+t*cos(t)),flr(y+t*sin(t))
		if (func(unit,xx,yy)) return xx,yy
  -- give others a chance!  
  if (not skip_yield) yield()  -- (better perf for unit updates, but causes pauses on start/deploy harvester)  
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

function move_unit_pos(unit,x,y,dist_to_keep,try_hail,start_state)
  local flying = unit.z>1
  -- before moving, can carryall take us?
  if try_hail then
   local carryall=has_obj and has_obj[unit.created_by][33] or false   
   if carryall and not carryall.link then
     carryall.link,unit.link = unit,carryall     
     carryall.cor=cocreate(function(unit_c)
      move_unit_pos(unit_c,flr(unit.x/8),flr(unit.y/8))
      if(selected_obj==unit) selected_obj=nil
      if unit.life>0 then
       del(units, unit)
       move_unit_pos(carryall,x,y)
       unit:set_pos(carryall.x,carryall.y)
       add(units, unit)
       do_guard(unit, start_state)
      end
      do_guard(carryall)
     end)
    return
   end
  end
  
  ::restart_move_unit::

  -- check target valid
  if not flying and not is_free_tile(nil,x,y) then   
    -- target tile occupied
    -- move as close as possible
    x,y=ping(unit,x,y,is_free_tile)
  end

  -- use co-routine to find path
  -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding
  unit.tx,unit.ty,unit.prev_state,unit.state = x,y,unit.state,1
   
  -- (pn-minified/modified) "pathfinder"
  -- by @casualeffects
  -- http://graphicscodex.com
  unit.path = nil
  local start, goal, node_to_id = { x = flr(unit.x/8), y = flr(unit.y/8)}, {x = unit.tx, y = unit.ty}, function (node) return shl(node.y, 8) + node.x end
  local shortest, 
  best_table = {
   last = start,
   cost_from_start = 0,
   cost_to_goal = manhattan_distance(start, goal)
  }, {} 
  best_table[node_to_id(start)] = shortest
  local frontier, frontier_len, goal_id, max_number, count = {shortest}, 1, node_to_id(goal), 32767.99, 0
  while frontier_len > 0 do
   -- find and extract the shortest path
   local cost, index_of_min = max_number
   for i = 1, frontier_len do
    local temp = frontier[i].cost_from_start + frontier[i].cost_to_goal
    if (temp <= cost) index_of_min,cost = i,temp
   end
   shortest = frontier[index_of_min]
   frontier[index_of_min], shortest.dead = frontier[frontier_len], true
   frontier_len -= 1
   local p = shortest.last
   if node_to_id(p) == goal_id then
    p = {goal}
    while shortest.prev do
     shortest = best_table[node_to_id(shortest.prev)]
     add(p, shortest.last)
    end
    unit.path = p
    goto end_pathfinding
   end
   for n in all(map_neighbors(p,flying)) do
    local id = node_to_id(n)
    local curr_cost = not flying and fget(wrap_mget(n.x, n.y), 1) and 4 or 1
    if (p.x != n.x and p.y != n.y) curr_cost+=.2

    local old_best, new_cost_from_start =
     best_table[id],
     shortest.cost_from_start + curr_cost    
    if not old_best then     
     old_best = {
      last = n,
      cost_from_start = max_number,
      cost_to_goal = manhattan_distance(n, goal)
     }
     frontier_len += 1
     frontier[frontier_len], best_table[id] = old_best, old_best
    end
    if not old_best.dead and old_best.cost_from_start > new_cost_from_start then
     old_best.cost_from_start, old_best.prev = new_cost_from_start, p
    end
   end   
   count+=1
   if count%4==0 then
    yield()
    -- (pn) added "unreachable destination" check
    if (count>3000 or stat(0)/2048>.8) goto end_pathfinding
   end
  end

  ::end_pathfinding::

  -- now auto-move to path
  unit.prev_state,unit.state = unit.state,2

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
--
function draw_level()
 -- draw the map, objects - everything except ui
	cls"15"
 
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
  -- reticule
  if (building == selected_obj) rect(selected_obj.x, selected_obj.y, selected_obj.x+selected_obj.w-1, selected_obj.y+selected_obj.h-1, 7)  
 end

 pal()
 
 -- draw units (2-passes, ground & flying)
 for p=1,2 do
  for _,unit in pairs(units) do
   if (p==1 and unit.z==1) or (p==2 and unit.z>1) then
    if (not show_menu) unit:update()
    if (unit.process!=2 or unit.speed==0) unit:draw()
    -- reticule
    if (unit == selected_obj) spr(16, selected_obj.x, selected_obj.y)
   end
  end
 end

 -- particles
 --draw_particles()
 for k,p in pairs(particles) do
  -- patterns
  -- filled = 0x0/0xff
  -- check1 = 0XA5A5
  -- check2 = 0XA0A0
  -- check3 = 0X8020
  if (p.pattern) fillp(p.pattern)
  circfill(p.x,p.y,p.r,p.cols[ flr((#p.cols/p.life_orig)*p.life)+1 ]) --col
  fillp()
 end

 -- draw fog-of-war
 local mapx,mapy=flr(camx/8),flr(camy/8) 
 palt(0,false)
 palt(11,true)
 for xx=mapx-1,mapx+16 do
  for yy=mapy-1,mapy+16 do
    if fow[xx][yy]!=0 and fow[xx][yy]!=16 then
     spr(fow[xx][yy]+31,xx*8,yy*8)
    elseif fow[xx][yy]<16 then
     rectfill(xx*8, yy*8, xx*8+7, yy*8+7, 0)
    end
  end
 end

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
 
 -- top/header bar
 rectfill(0,0,127,8,9) 

 -- 
 -- draw_radar()
 -- 
 rect(90,90,125,125,p_col1)
 rect(91,91,124,124,p_col2)  
 rectfill(92,92,123,123,0)

 
 -- update/draw message
 if (msgcount>0) msgcount-=1 print(message, 2,2)

 -- score
 strnum=getscoretext(credits[1])
 ?sub("000000", #strnum+1)..strnum, 103,2, p_col2

 -- turn on/off radar
 if hq!=last_hq then
  radar_frame,radar_dir = hq and 1 or 59, hq and 1 or -1
  if (radar_dir<1) set_message("pOWER LOW.bUILD wINDTRAP")
  ssfx"55"
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
 local cx,cy=92+camx/16,93+camy/16
 rect(cx,cy, cx+7,cy+6, 7)

 -- object menu icon/buttons? 
 if selected_obj and selected_obj.ico_spr then
  selected_obj.ico_obj:set_pos(109,20)
  selected_obj.ico_obj:draw()  
  -- player icons (build, actions, etc.)
  repair_obj,launch_obj=nil,nil
  if selected_obj.owner==1 then   
   -- build
   if selected_obj.build_obj then
    selected_obj.build_obj:set_pos(109,44)
    selected_obj.build_obj:draw()    
   end
   -- repair? 
   if selected_obj.life<selected_obj.hitpoint   
    and selected_obj.id!=4
    and (selected_obj.type==2
      or selected_obj.speed==0) then
     repair_obj=m_obj_from_ref(obj_data[80], 117,28, 5, {}, nil,draw_action, repair_click) 
     repair_obj:draw()
   end
   -- fire palace weapon?   
   if (selected_obj.id==19 
    and selected_obj.fire_cooldown<=0)
     or selected_obj.id==35
    then
     launch_obj=m_obj_from_ref(obj_data[81], 109,29, 5, {}, nil,draw_action, launch_click) 
     launch_obj:draw()  
   end

  end
 end

 pal()

 -- placement?
 if selected_obj 
  and selected_obj.build_obj 
  and (selected_obj.build_obj.type==4
   and selected_obj.build_obj.speed==0)
  and selected_obj.build_obj.life>=100 then
  -- draw placement
  -- todo: improve this code!
  local mxpos,mypos = flr((cursor.x+camx)/8), flr((cursor.y+camy)/8)
  local sxpos,sypos,w,h = mxpos*8-camx,mypos*8-camy,selected_obj.build_obj.spr_w,selected_obj.build_obj.spr_h
  -- check ok to place
  placement_pos_ok,placement_inner_invalid,placement_damage = false,false,false
  for xx=-1,w do
    for yy=-1,h do
     local val=wrap_mget(mxpos+xx, mypos+yy)
     if xx==-1 or xx==w or yy==-1 or yy==h then     
      -- check edges
      if (val==16 or val>=58) placement_pos_ok=true
     else
      -- check inner      
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
      or has_obj[selected_obj.created_by][curr_item.req_id]      
      and curr_item.req_level<=p_level
     then
      selected_obj.valid_build_objs[icount]=curr_item
      if icount>=menu_pos and icount<=menu_pos+2 then
        curr_item:set_pos(9,28+(icount-menu_pos)*19)
        curr_item:draw()
      else
        -- hide!
        curr_item:set_pos(-16,16)
      end
      -- default selection
      selected_subobj = selected_subobj or selected_obj.valid_build_objs[1]
      -- draw selected reticule
      if selected_subobj == curr_item then 
        sel_build_item_idx=icount
        rect(curr_item.x-2, curr_item.y-2, 
            curr_item.x+17, curr_item.y+17, 
            7)
        ?selected_subobj.name,30,26,7
        ?"cOST:"..selected_subobj.cost,85,33,9
        ?selected_subobj.description,30,34,6
      end
      icount+=1
     end -- unlocked
    end -- for
  end -- has build obs

  pal() --else green=black

  -- ui elements (buttons)?
  for _,controls in pairs(ui_controls) do
    controls:draw()
  end
 end  -- if show_menu

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
    if(#text>1)rectfill(self.x,self.y,self.x+self.w,self.y+self.h, self.hover and p_col1 or 6)
    ?self.text,self.x+2,self.y+2,(#text>1) and 0 or (self.hover and p_col1 or 6)
  end,
  func_onclick = func_onclick
 })
end

function draw_obj(obj)
 spr(obj.obj_spr, obj.x, obj.y, obj.spr_w, obj.spr_h)
end


-->8
-- game flow / collisions


-- check all collisions
function update_collisions()
 clickedsomething=false 
 -- selected obj ui collision
 if selected_obj then
   ui_collision_mode=true
   check_hover_select(repair_obj)
   check_hover_select(launch_obj)
   if (selected_obj.ico_obj and not show_menu and not clickedsomething) check_hover_select(selected_obj.ico_obj) check_hover_select(selected_obj.build_obj)
   if (show_menu) foreach(selected_obj.build_objs, check_hover_select) foreach(ui_controls, check_hover_select)
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
      camx,camy = mid(0,(cursx-94)*16, 384),mid(-8,(cursy-94)*16, 384)
      selected_obj=last_selected_obj -- always do this, in case an obj under rader will select
 -- clicked something?
 elseif left_button_clicked then
  
  -- update message
  if (selected_obj and selected_obj.type<=2) set_message(selected_obj.name)
 
  if clickedsomething then   
    -- clicked factory/quick-build icon?
    if not show_menu and selected_obj.parent!=nil then 
     if (selected_obj.func_onclick) selected_obj:func_onclick()
     selected_obj=last_selected_obj
     return
    end
    -- click button?
    if (show_menu and selected_subobj.text and selected_subobj.func_onclick) selected_subobj:func_onclick()
    -- clicked own unit, first time?
    if (selected_obj.owner==1 and selected_obj.type==1 and selected_obj!=last_selected_obj and selected_obj.speed>0) ssfx"62"    
    -- clicked enemy object, last clicked ours (unit or palace)?... attack!
    if (selected_obj.created_by!=1 and last_selected_obj and (last_selected_obj.type==1 or (last_selected_obj.id==19 and target_mode)) and last_selected_obj.owner==1) selected_obj.flash_count=10 do_attack(last_selected_obj, selected_obj) selected_obj=nil -- periodically reset the list of built obj's (done here as bug if done in radar code, as delay in populating)   

  -- deselect?
  else
    -- do we have a unit selected?
    if selected_obj 
     --and selected_obj.type==1
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
      m_map_obj_tree(selected_obj.build_obj.ref,
       flr((cursor.x+camx)/8) *8,
       flr((cursor.y+camy)/8) *8, 1)      
      -- reset build
      reset_build(selected_obj.build_obj)
      ssfx"61"
    end

    --if (not show_menu) selected_obj=nil
  end 
  
  target_mode=false
  
 elseif right_button_clicked and not show_menu then
  -- cancel selection
  selected_obj,target_mode = nil,false
 end --if buttonclicked
end

function reset_build(obj)
 obj.life,obj.process,obj.spent,obj.done = 0,0,0,false
 if (obj.parent) obj.parent.incoming=false
end


function check_hover_select(obj)
  -- null-check
  if (obj==nil) return
  --  collide()
  local hb1,hb2 = cursor:get_hitbox(),obj:get_hitbox()
  obj.hover = hb1.x < hb2.x + hb2.w and
   hb1.x + hb1.w > hb2.x and
   hb1.y < hb2.y + hb2.h and
   hb1.y + hb1.h >hb2.y

  if left_button_clicked and obj.hover then
   if show_menu then
    selected_subobj = obj
   else
    -- is object hidden by fow?
    -- or clicking a harvester unloading or unit repairing?
    if (obj.type<=2 and fow[flr((cursor.x+camx)/8)][flr((cursor.y+camy)/8)]!=16 or obj.state==8) return
    
     -- was our harvester selected before clicking a refinery/repair?
    if selected_obj
     and (obj.id==6 and selected_obj.id==32 
      or obj.id==14 and selected_obj.id>26)
     and obj.owner==1 and selected_obj.owner==1
    then
     return_to_fact(selected_obj,obj)
     return -- register "no click"

    else 
     -- something else clicked, so select it
     selected_obj = obj
    end    
   end
   clickedsomething=true
  end

end

 -- send harvester/unit to refinery/repair facility
function return_to_fact(unit,fact)
 -- ensure that we always have a value (even for discovered objs)
 fact = fact or has_obj[unit.created_by][1] or unit
 -- update last factory (in case changed)     
 unit.state,fact.incoming,unit.return_to = 7,true,fact
 if (unit.id!=32 or fact.id==6) unit.last_fact=fact
 unit.cor = cocreate(function(unit)
  local init_state=fact.id!=1 and 9 or 0
  move_unit_pos(unit, (fact.x+16)/8, fact.y/8, 0, true, init_state)
  if (unit.link==nil) do_guard(unit, init_state) 
 end)
end


-->8
-- ai-related code

-- whether worm is at surface (+ve) or not
worm_life=0

-- ai strategy code (attack, build, repair, etc.)
function update_ai()
 -- depending on ai level...
 if t()*20>ai_level and t()%ai_level==0 then  
  
  -- unit attacks
  -- 
  -- find the first ai unit and attack player  
  local ai_unit=rnd(units)
  if ai_unit.owner==2 and ai_unit.arms>0 and ai_unit.state==0 then
   -- select a random target (unit or building)
   attack_rnd_enemy(ai_unit)
  end
  
  -- repair/build units
  -- 
  local ai_building=rnd(buildings) 
  -- if ai owned...
  --  is factory, builds units and is not already building...
  if ai_building.owner==2 and
    (ai_building.build_obj==nil or ai_building.build_obj.process!=1) then    
    -- select a random unit to build
    local u=rnd(ai_building.build_objs)
    if u and u.speed>0 then
     u:func_onclick()
    end    

    -- repair?
    if ai_building.life<ai_building.hitpoint and ai_building.process!=2 then
     -- auto-repair
     process_click(ai_building, 2)
    end
  end

  -- fire palace weapons
  -- 
  if p_target and p_target.type==2 --(always an enemy at this point)
   and ai_palace and ai_palace.fire_cooldown<=0 then 
    do_attack(ai_palace, p_target)
  end

 end

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
  --if (worm_life>worm_life_start-128 or worm_life<128) add_spice_cloud(head_worm_x,head_worm_y,rnd"1")
 end

end


function attack_rnd_enemy(obj)
 local p_target=find_rnd_enemy(obj)
 if (p_target and is_visible(p_target)) do_attack(obj, p_target)
end

-- find rnd enemy unit (or building) to attack
function find_rnd_enemy(obj)
 local enemy_obj
 repeat
  -- favour attacking units (as they can attack you more!)
  enemy_obj=(rnd"4"<1)and rnd(units) or rnd(buildings)
 until enemy_obj.created_by!=obj.created_by
 return enemy_obj
end

function is_visible(obj)
 local x,y = obj:get_tile_pos()
 return fow[x][y]==16
end

-->8
--other helper functions

function ssfx(sfx_num)
 sfx(sfx_num,3)
end

-- set/unset the loop flag
-- for specified pattern
function set_loop(enabled)
 local val=peek(0x3115)
 if (band(val, 128) > 0 != enabled) val=bxor(val,128)
 poke(0x3115, val)  
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

function split2d(str,d,dd) 
 d=d or ","
 if (dd~=nil) str=split(str,dd) 
 if type(str)=="table" then
  local t={}
  while #str>0 do
   local s=str[1]   
   add(t,split(s,d))
   del(str,s)
  end
  return t
 else
  return split(str,d)
 end 
end


-- rotate sprite (modified to allow for trans cols)
-- by freds72
-- https://www.lexaloffle.com/bbs/?pid=52525#p52541
function rspr(sx,sy,x,y,a,w,trans,single_col)
	local ca,sa=cos(a),sin(a)	
	local ddx0,ddy0,mask = ca,sa,shl(0xfff8,w-1)
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
-- (thx @jamesedge - https://twitter.com/jamesedge/status/1292016544164315138)
function dist(x1,y1,x2,y2)
 return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
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

function maybe_add(nx, ny, ntable, flying)
 if (flying or not fget(wrap_mget(nx,ny),0) and object_tiles[nx..","..ny]==nil and nx>=0 and ny>=0 and nx<=63 and ny<=63) add(ntable, {x=nx, y=ny})
end

function manhattan_distance(a, b)
 return abs(a.x - b.x) + abs(a.y - b.y)
end

-- particle related
-- (loosly inspired by @casualeffects' fast particle system)
function add_particle(x, y, r, dx, dy, dr, ddy, life, cols, pattern)
  local p={
    x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,
    life=0,ddy=ddy,
    cols=cols, pattern=pattern,
    y_orig=y, life_orig=life
  }
  add(particles, p, 1)
end




__gfx__
bbbbbbbbbb171bbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbb9b5d555d555d555d55d555d5bbbbbbbbb1d515555dddddddddddddddd
bb11bbbbb17771bbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99d555515d15555155d515555dbd5bd5db5155d55dd5555555d5555555
bb171bbb1711171bbbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b5d55d5515d55d555155d55d5d5155551555d5155d5015515d5555555
bb1771bb7717177bbbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbb55515d5555515d5d55d51555155d55d5d5555d55d5105555d5555555
bb17771b1711171bbbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99b155d5555d55555555555d55155d5155555d155d5d5555111d5555555
bb177771b17771bbbbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbb55d551d555d515555d155d555555d55d15555555d1555101d5555555
bb17711bbb171bbbbbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbbd5555555555555155555555d5d155d55b51bd5dbd5555111d5555555
bbb11bbbbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbb55d5515555d55555155d55b55555551bbbbbbbbd5515555d5555555
b7bbbb7bbbbbbbbbbbbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
77bbbb77bbbbbbbbbb77bbb7bbbbbbbbbb66669bbbbbbbbbb6bbbbbb1555515d4444444444555155544444444444444444444444544224222242224442422442
bbbbbbbb0000b000b79bb77bbbb777bbb66dd66bbd5bb5bbbbbbbb6b5d55d444444444444445d555444444444444444444444444524442444424442224444221
bbbbbbbb0770007779b779bbbb77994bb6d55d6bb5dbbbbbbbbbbbbb55544444444444444444445d444444444444444444444442522222212222222242222110
bbbbbbbb00777770bb799bbbbb79994bb6d55d6bbbbb555bbbbbbbbb555444444444444444444445444444444444444444444422502112121121122121121200
bbbbbbbb07700077b799bbbbbb79944bb66dd66bbbbb5d5bbbb6bbbb55d444444444444444444445444444444444444444444242550221200012210012100005
77bbbb770000b000b79bbbbbbbb444bbbb6666bbbbbb555bbbbbbbbb154444444444444444444444444444444444444444444240555000055000000500055555
b7bbbb7bbbbbbbbb7bbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb55444444444444444444444444444444444444444444442155555555555555555555d555
bbbbbbbbbbbbbbbbbbbbbbbbbbbbb1b1bbbbbbbb1b1bbbbbbb0ee0bbbbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbb0000000010bbbbbbb0000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbb1bb00bbbbbbbb00bb1bbbbb5c65bbbbbbbbbbbb676bbbbb676bbbb0000000bbbbb1000000000b00bbbbbbb000000b00000000
bbbbbbbbbbbbbbbbbbbbbbbbbb1b0000bbbbbbbb0001b1bbbb0c60bbbbbbbbbbbbb7bbbbbbb7bbbb1b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
bbbbbbbbbbbbbbbbbbbbbbbbb1b00000bbbbbbbb00000b1bbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
bbbbbbbbbbbbbbbbbbbbbbbbbb000000bbbbbbbb000001bbbbbc7bbbbbb1b1bb7e777e7bbb676bbbb1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbb1b000000bbbbbbbb000000b1bb0cc0bbbb1b1b1bbbb7bbbbbbb7bbbbbb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbbb0000000bbbbbbbb0000000bbb5dd5bbb000000bbbbcbbbbbbbcbbbbbbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbbb00000001bb0cc0bb00000000bbbbbbbbbbbbbbbbbbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cb0cecec0bb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbec6c6cebb6d7d6bbd4c455444445549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debee6e6eebb6d4d6bb4a042499999452424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebec0c0cebb69996bb49029999c0994922229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0b00ccc00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a94942d1542425d44411114555224225ff2225
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
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd5dd0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d51d0001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
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
ccccc7776cccccccffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
ccccc77767ccccccffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
ccccc79767ccccccffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
ccccc97767ccccccffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67000dcccccc11116666dc0157d7
ccccc79967ccccccff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
ccccc777667cccccff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650111dccc7776d76d1c11111110
ccccc677687cccccff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
7ccccc77867cccccf7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd011111d5ddd6d1d6d1ccd7d0d6d
97cccc77887cd6ccf7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055511d5ddd6d1d6d1ddd7d0d7d
c9776d77d677756cf76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755011111d55556d1d4d9949945499
7d679d77dd6707dffddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
dff67d775d567100ffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
9999917799909999fffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
9444546444516449fffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
9999944444499999fffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
9999999999999999ffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
cccccccccbb3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccbbc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
cccccccbbcc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccbbccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccddddddddddddddddccccccccccccccccddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc76753355335cccccc055ffccccccccccccc4ff75550ccdddddddd7773330dcccc2888887660ccdd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc76667555dd555ccccc0f7557ccccccccccc4ffff7fccccddddd4bbbb75550dccc288888887ccccddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755dddd55ccccc0f7fff7ccccccc54454444444f7cdd45444444444dddcc5225222222287cdd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cd54bbbbbbbbbbb5dc55588888888855cd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
9166660001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950360000000635995000005999300095061052995061059
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999ff99fffffff9999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
fffffffffff7ffff445d44999fcfcccccccccccccccccccccdcccdcccd1cccccccccccccccccc60ccc06cccccccccccccccccccccccccccccccccccccccccccc
ffffffffffcccfff44d499999949fcccccccccccccccc6ccccdcccdccc1ccccccccc77cccccc515cc8115cccccc8787ccccccccccccccccc6ccccccccccccccc
fffff6fffdddddff44dd66666699fcccccccc6cccccc6f6cd77ddddddd1dddddcc77577cccc51cccc00015cccc755567cccccccccccccccc76cccccccccccccc
fffff7fccccccccc445d5555555ddcddcccc6f6cccccfffcc66dcccdc1c1cccccc5775d60051ccccc808d15006d85866cccccccccccccccc765cc77775cccccc
fffcdcd5dd6d6d6d44dd96969696ddddccccfffcccccc5ccccccdccf1fff167cccc5566dd106ccccc000d601dd6555ddccc5b7cccccccccc7756777780777ccc
ffcccccc5ddddddf444666666666ddd5ccccc5cccccccfccddddddf1fffff1ddccc7666666666cccc8086666666858dd9cc65c6b6ccccccc765d656520dd777c
fffd6d65dccccccf4446f66666f6d5ddf6cccf9999999fcc55555dd505050fddccc0000000000ccccccc00000000001149cbbcb20ccccccc775cdd5d1ccc775d
ffcccccc5c5c5c5c4446664446666dddfff6cf9ccccc9fccdddd5ddd505050ddccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0b6cd0ccccccc5ccc505ccd667
ffdddddd5ddddddd4445649994666dddf9999fcccf6ccfccddd65dddddddddddccdd66ddddddd5ccccc5ddddddd66ddc4443bb005c01cccccc5ccccdcdccdddc
99955555ddddddd94545699999666d5d49119fccf6f6cfffdd22205d5ddd5dddccddd66dd555d5ccccc5d555dd66dddc22450b605d0ffff9c5ccccccccccc5cc
666dddd5555555554456699999666ddd4900944c5f659999d82d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336d8d2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446b600244ff999455d44444444549
996666666669699944467777777666dd777666666353655dd8dffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355b332494fff9444444449999999
9999996999999999444fffffffff942f666666666353d33dfffffffff5f6667d999dd6677766d5999995d6677766dd9924335203504449f9999999999999f999
44449999449444944444ffffffff560f6666ddddddddddddfff4f4f4f56ddddd99ddd66dd566d5999995d665dd66ddd9446b2446b09999ff9999999999993999
44444444444444444444ffffffffffffddddddddddddddddffffffffffffffff99dd666dd5666d59995d6665dd666dd9443324430044499f9999999999999999
__label__
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922292229222922299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292999292929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292922292929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292929992929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922292229222922299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
ff77fff7d5555555580555d6766dd55515555155f6fffffff6fffffff6fffffff6ffffffffffffffd576dc65d5577655ffffff99f6fff1000000000000000000
f79ff77fd5d6d55522055dd6766dd1555d55d555ffffff6fffffff6fffffff6fffffff6fffffffffd76dccc5d576dc659ff99f9fffff1f000000000000000000
79f779ffd576dddd550516d6766d610555515d5dffffffffffffffffffffffffffffffffffffffffd66d11c5d76dccc5ff99fffffffff1000000000000000000
ff799fffd50015055505ddd6766ddd05d5555555ffffffffffffffffffffffffffffffffffffffffd66d01c0d66d11c5f999f99fffff1f000000000000000000
f799ffffd55555555d101dd6766dd10555d51555fff6fffffff6fffffff6fffffff6ffffffffffffd66d0c01d66d01c099ff9ffffff6f1000000000000000000
f79fffffd455555550001dd6766dd10555555515ffffffffffffffffffffffffffffffffffffffffd56dd015d66d0c01ffffffffffffff000000000000000000
7fffffffd15ddddddddd1dd6d16dd105555d5555ffffffffffffffffffffffffffffffffffffffffd5511155d56dd015fff99ffffffffff00000000000000000
ffffffffd55776d7777716d6116d610555d555d5ffffffffffffffffd76d76dd577777d5577777d5ddddd776ddd111ddffffffffffffffff0000000000000000
f6ffffffd55666666666ddd6766ddd0515555155fffffffff6ffffffd77556d5576666d5576666d5d55576dc65555555f6ffffffff77fff7f0000007f0000007
ffffff6fd56ddddddddd1d00000001055d55d555ffffffffffffff6fd5511d15576666d0576666d0d5576dccc5558055ffffff6ff79ff77ff191f17ff191f17f
ffffffffd5d111111111101d6dd6d00555515d5dffffffffffffffffd7516155576666d0576666d0d5566d11c5522055ffffffff79f779ff791719ff791719ff
ffffffffd551a1a11111000000000005d5555555ffffffffffffffffd66d155556dddd1056dddd10d5566d01c0555055ffffffffff799fffff799fffff799fff
fff6ffffd45111111111016d6d6d6d0555d51555fffffffffff6ffffd5d1115556dddd1056dddd10d5566d0c01555055fff6fffff799fffff799fffff799ffff
ffffffffd4455555555555555555555555555515ffffffffffffffffd511111556dddd1056dddd10d5556dd015555555fffffffff79ffffff79ffffff79fffff
ffffffffd11555555555555555555555555d5555ffffffffffffffffd11111115d1111105d111110d5555111d5555555ffffffff7fffffff7fffffff7fffffff
ffffffffdddddddddddddddddddddddd55d555d5ddd66666dddddddd577777d5dddddddddddddddddddd666666ddddddf99ffff9fffffffffffffffff99ffff9
ffffffffd5555555555555448455555515555155d566777665555555576666d5d555555555555555d566ddddd6111110ffffff99ff77fff7f6ffffffffffff99
ffffffffd5555555555554a9044555555d55d555d767666d6d555555576666d0d554777777777455d5dddd000066dd669ff99f9ff79ff77fffffff6f9ff99f9f
ffffffffd4845544444554990449989555515d5dd767666d6d555555576666d0d544ff7fff7ff445d5dd0000001111ddff99ffff79f779ffffffffffff99ffff
ffffffff4a042499999452424297a094d5555555d766ddd66d55555556dddd10d504777778617405d50000000066dd10f999f99fff799ffffffffffff999f99f
ffffffff4902999980994922229aa09455d51555d6d66666d155555556dddd10d544ff7ff6d1f445d55555555511111099ff9ffff799fffffff6ffff99ff9fff
ffffffff242499a22099942dd149994255555515d6dd0d022166666556dddd10d504777771177405d551f6155566dd66fffffffff79fffffffffffffffffffff
ffffffffd2499a77a0a94942d1542425555d5555d6dd0002266807665d111110d544ff7fff7ff445d550f605551111ddfff99fff7ffffffffff00ffffff99fff
ffffffffd1499a77aaa99424d15242f5ddddddddd5dd0d02762206d6577777d5d504777777777405d555f655551d6d10fffffffff99ffff9f99028f9f99ffff9
f6ffffffd1299aaaaaa94942d551414fd5555555d51d0001767606d6576666d5d544ff7fff7ff445d5516615551d6d10f6ffffffffffff99fff86229ffffff99
ffffff6fd52499aaaa9494245552424fd5555555d5511111766d0d66576666d0d542222222222245d5505505551d6d10ffffff6f9ff99f9f9f888d0f9ff99f9f
ffffffffd5424999994942425551424fd5555555d55555556d666662576666d0d528028020200225d5555555551d6d10ffffffffff99ffffff08855fff99ffff
ffffffffd5542494949424255555114fd5555555d55555556dd0d02256dddd10d522022022200225d55555555510d010fffffffff999f99ff056599ff999f99f
fff6ffffd5514242424242159989554fd5555555d55555556dd0002256dddd10d551011011111115d555550f050aaa00fff6ffff99ff9fff95f59fff99ff9fff
ffffffffd55f1424242421197a09954fd5555555d55555555dd0d02156dddd10d555011011111155d55f0f5555555555ffffffffffffffffffffffffffffffff
ffffffffd559989212121119aa09954fd5555555d5555555551000115d111110d555555555555555d555555555555555fffffffffff99ffffff99ffffff99fff
ffffffffd597a099fffffff455555425ddd776ddddddddddddddddddddddddddddd776ddddddddddd199999999999999f99ffff9fff9fffff99ffff9f99ffff9
ffffffffd59aa094dddddddf5fff2225d576dc65d5577655d5555555d5ddddd5d576dc65d5577655d494955949999249ffffff99ff66669fffffff99ffffff99
ffffffffdf249492dd929ddf5ffff225d76dccc5d576dc65d555555566d66d55d76dccc5d576dc65d1942559992299999ff99f9ff66dd66f9ff99f9f9ff99f9f
ffffffffdff2424fd9d2d9df54444445d66d11c5d76dccc5d555555577d66d55d66d11c5d76dccc5d495f5f4f4121419ff99fffff6d55d6fff99ffffff99ffff
ffffffffd1fffff1d99299df5ffffff5d66d01c0d66d11c5d5555555d55dd555d66d01c0d66d11c5d195656565999959f999f99ff6d55d6ff999f99ff999f99f
ffffffffd4414141111111145ffffff5d66d0c01d66d01c0d5555555d5511155d66d0c01d66d01c0d49995555594495999ff9ffff66dd66f99ff9fff99ff9fff
ffffffffd14404455555555454444445d56dd015d66d0c01d5555555d5111115d56dd015d66d0c01d194958055944959ffffffffff6666ffffffffffffffffff
ffffffffd51111155555555452222225d5511155d56dd015d5555555d1111111d5511155d56dd015d499922055944959fff99ffff9fffffffff99ffffff99fff
dfff61ffddddd999dddddddd55d555d5ddddd776ddd111dd1d515555577777d5ddddd776ddd111ddd195594095999959f99ffff9f99ffff9f99ffff9f99ffff9
df44414ff55999999955576515555155d55576dc655555555155d55d576666d5d55576dc65555555d495594495977779ffffff99ffffff99ffffff99ffffff99
dfff4144f54499999445f66f5d55d555d5576dccc5558055555d5155576666d0d5576dccc555805599995299257777779ff99f9f9ff99f9f9ff99f9f9ff99f9f
df444444f52449494425dffd55515d5dd5566d11c5522055d5555d55576666d0d5566d11c55220559429444444776666ff99ffffff99ffffff99ffffff99ffff
dffffffff5424444424556d5d5555555d5566d01c055505555d155d556dddd10d5566d01c05550559999242424766666f999f99ff999f99ff999f99ff999f99f
d4444444452242424425542555d51555d5566d0c015550551555555556dddd10d5566d0c01555055944242424296666d99ff9fff99ff9fff99ff9fff99ff9fff
d4144114455422422455542555555515d5556dd015555555f51ffd5f56dddd10d5556dd015555555944242424294ddd2ffffffffffffffffffffffffffffffff
d44411114555224225ff2225555d5555d5555111d5555555ffffffff5d111110d5555111d5555555d111111111194421fff99ffffff99ffffff99ffffff99fff
d55555555555555555f4422555d555d51d5155555d555d5fffffffffddddddddd77dd77d67d6fffdf99ffff9f99ffff9f99ffff9fffffffff99ffff9ffffffff
ddddd88ddd88dd5d5fff4445155551555155d55dd5155551ffffffffd5ddddd576667666561ffff1ffffff99ffffff99ffffff99ff77fff7ffffff99ffff9fff
dd55885dddd885dd5f4444455d55d555555d5155155d55d5ffffffffd5d66d5576667666565f44419ff99f9f9ff99f9f9ff99f9ff79ff77f9ff99f9fffff9999
d5588dd2d2d5885d5fff476555515d5dd5555d5555d51555ffffffffd5d66d55d6621662165ffff1ff99ffffff99ffffff99ffff79f779ffff99fffffff99f9f
d588d522d22dd8855444f66fd555555555d155d55555d55dffffffffd67dd555d2221222165f1011f999f99ff999f99ff999f99fff799ffff999f99ffffff9f9
d88dd225dd22d5885414dffd55d51555155555555d155d55ffffffffd7711155622112211ddf100199ff9fff99ff9fff99ff9ffff799ffff99ff9fffffff9999
d8d522dd2d522dd8544446d455555515f51ffd5f55555551ffffffffd51111156115511151551005fffffffffffffffffffffffff79ffffffffffffffff99f9f
d5d225d222dd22dd55555425555d5555ffffffff5155d55ffff76fffd111111166767555d55d5555fff99ffffff99ffffff99fff7ffffffffff99fffffff99f9
dddddd22222ddddd555554251d515555ffffffffffffffffddd76ddd577777d56d6d65d555d555d5fffffffff99ffff9f99ffff9ffffffffffffffff99f9ff99
ddd22dd222d522dd5fff22255155d55df6ffffffffffffffd7d55d75576666d566d1d555155d80555dfffd5fffffff99ffffff99ffff9fffffffffff9f9999f9
d8dd225d2d522dd85ffff225555d5155ffffff6fffffffffd6511565576666d0d555555a5d522055d51555519ff99f9f9ff99f9fffff9999ffffffff999f9999
d88d522dd522d58854444445d5555d55ffffffffffffffffddd66dd5576666d015aaa99a5555505d155d55d5ff99ffffff99fffffff99f9ff9ffff9ff9999f9f
d588dd22d22d58855ffffff555d155d5ffffffffffffffffd151151556dddd1055aaa55ad555505555d51555f999f99ff999f99ffffff9f9ff99f9999ff9999f
4d5885d2d2d5885d5ffffff515555555fff6ffffffffffffd551115556dddd10d5a1199a55d515555555d55d99ff9fff99ff9fffffff9999999f99f9f999f99f
d4d588dd5dd88ddd54444445f51ffd5fffffffffffffffffd511111556dddd105544445a155555155d155d55fffffffffffffffffff99f9f9f99f99f99f999f9
dd4dd88ddd88dddd55555555ffffffffffffffffffffffffd11111115d111110d5151515555d555555555551fff99ffffff99fffffff99f9f92882f9ff9fff99
dddddddddddddddddd4dddddffffffffffffffffffffffff577777d5ddd776ddddddddddddddddddddd7778066666dddddddddddfffffffff0d22d0999f9ff99
d557755555555ddddd4ddd5dff77fff7f6fffffff6ffffff576666d5d576dc65d5577655d55555556667d220dddd657667555555fffffffff02882099f9999f9
d566969666655ddd5ddd5dddf79ff77fffffff6fffffff6f576666d0d76dccc5d576dc65d55555556dd7ddd0d6666dddddd56765ffffffff9288882f999f9999
d5ddadadddd55ddddd5dd5dd79f779ffffffffffffffffff576666d0d66d11c5d76dccc5d55555556dd766d0d6dd611111ddddd5fffffffff288882ff9999f9f
7777a7a71155544dd555dd44ff799fffffffffffffffffff56dddd10d66d01c0d66d11c5d55555556dd11666666d705501111115fffffffff088880f9ff9999f
7d9d9d9711555ddddd5d5dddf799fffffff6fffffff6ffff56dddd10d66d0c01d66d01c0d55555556d7661111117705055421425ffffffff9088889f9999f99f
7da76767115767dd5dddddddf79fffffffffffffffffffff56dddd10d56dd015d66d0c01d55555556d55d5dd6661100555425425fffffffff522295999f999f9
75776d675576667ddd4dd5dd7fffffffffffffffffffffff5d111110d5511155d56dd015d55555556ddd6ddd7111102555425425ffffffffff55559f9f9fff99
75777777766767667d4dddddffffffffffffffffffffffff577777d5ddddd776ddd111dddddddddd6d7777777111104555425425fffffffffffff9f9f9ffffff
7d7807777677677675555555ff77fff7ff77fff7f6ffffff576666d5d55576dc65555555d55555556d7011111ddd644555555555ffffffffffffff9f9fffffff
7d220dddd666d66d75555555f79ff77ff79ff77fffffff6f576666d0d5576dccc5558055d55555556770d1d11ddd705555555555ffffffffffffffffffffffff
7ddd0d777d66d6dd7655555579f779ff79f779ffffffffff576666d0d5566d11c5522055d5555555ddd0d1d11677705555555555ffffffffffffffffffffffff
777757707dddddd77d675555ff799fffff799fffffffffff56dddd10d5566d01c0555055d5555555ddd0d1dd111115dddddd5555ffffffffffffffffffffffff
ddddddd07777777776d75555f799fffff799fffffff6ffff56dddd10d5566d0c01555055d55555550001d1111111105555555555ffffffffffffffffffffffff
d111d1d5ddddddddd7775555f79ffffff79fffffffffffff56dddd10d5556dd015555555d555555500111ddd111115dddddd5555ffffffffffffffffffffffff
d5555555d1d1d1d1dddd55557fffffff7fffffffffffffff5d111110d5555111d5555555d5555555011117111111105555555555ffffffffffffffffffffffff
ffffffffffffffffffffffffff62226fffffffffffffffffd76d76dd577777d5dddddddd577777d5dd7d76ddddddddddddddddddddddddddddd777dddddddddd
ff77fff7ff77fff7ff77fff7ff80808ff00fffffffffffffd77556d5576666d5d5ddddd5576666d5d66d56d5d555555555555555d5555555d5766665d5555555
f79ff77ff79ff77ff79ff77fff87878ff2d886ffffffffffd5511d15576666d0d5d66d55576666d0ddd11d75d588888888888888888888888888888888888885
79f779ff79f779ff79f779ffff86868ff867800fffffffffd7516155576666d0d5d66d55576666d0d1566565d582222222222222222222222222222222222855
ff799fffff799fffff799fffff8ddd8ff2d8865fffffffffd66d155556dddd10d55dd77556dddd10d5511dd5d582000000000000000000000000000000002855
f799fffff799fffff799ffffff68886ff00555ffffffffffd5d1115556dddd10d551167556dddd10d5511155d58208f5ff8f0000000000000000000000002855
f79ffffff79ffffff79fffffff55555ff55fffffffffffffd511111556dddd10d511111556dddd10d5111115d582077777777000000000000000000000002855
7fffffff7fffffff7fffffffffffffffffffffffffffffffd11111115d111110d11111115d111110d1111111d582f7d8888f7f00000000000000000000002855
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff577777d5d582f7dd88df7f000000000000000000000028dd
ff77fff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff576666d5d582f7df8d8f7000000000000000000000002855
f79ff77ffffffffffffffffffffffffffffffffffffffffffffffffffff7ff67ffffffffffffffff576666d0d582f78888887000000000000000000000002855
79f779fffffffffffffffffffffffffffffffffffffffffffffffffffff116766fffffffffffffff576666d0d58207ffff8d7000000000000000000000002855
ff7191ffffffffffffffffffffffffffffffffffffffffffffffffffffff776fffffffffffffffff56dddd10d582077777777000000000000000000000002855
f7191f1fffffffffffffffffffffffffffffffffffffffffffffffffffff777fffffffffffffffff56dddd10d582000f00000000000000000000000000002855
f000000ffffffffffffffffffffffffffffffffffffffffffffffffffffcff17ffffffffffffffff56dddd10d582000000000000000000000000000000002885
00000000fffffffffffffffffffffffffffffffffffffffffffffffffff555575fffffffffffffff5d111110d582000000000000000000000000000000002855
000000001f1fffffffffffffffffffffffffffffffffff88ffffffffffff555fffffffffffffffffdd76d1dddd820000000000000000000000000000000028ff
0000000000ff1ffffffffffffffffffffffffffffff5ff77ffffffffffff555fffffffffffffffffd5d5ddd5d5820000000000000000000000000000000028ff
000000000001f1fffffffffffffffffffffffffffff28f66f56ffffffff5ff55ffffffffffffffff66516155d5820000000000000000000000000000000028ff
0000000000000f1ffffffffffffffffffffffffffff77777775ffffffffffff5ffffffffffffffff77516155d5820000000000000000000000000000000028ff
00000000000001fffffffffffffffffffffffffffff77777775fffffffffffffffffffffffffffffd555d555d5820000000000000000000000000000000028ff
00000000000000f1fffffffffffffffffffffffffff28f66f56fffffffffffffffffffffffffffffd576d155d5820000000000000000000000000000000028ff
000000000000000ffffffffffffffffffffffffffff5ff77ffffffffffffffffffffffffffffffffd5111115d5820000000000000000000000000000000028ff
0000000000000001ffffffffffffffffffffffffffffff88fffffffffffffff11fffffffffffffffd1111111d1820000000000000000000000000000000028ff
00000000000000000fffffffffffffffffffffffffffff55fffffffffffffff171ffffffffffffffffffffffff820000000000000000000000000000000028ff
00000000000000000077fff7ff77fff7fffffffffff5ff55fffffffffffffff1771fffffff77fff7ff77fff7ff820000000000000000000000000000000028f7
0000000000000000001ff77ff79ff77ffffffffffff55f55f55ffffffffffff17771fffff79ff77ff79ff77fff8200000000000000000000000000000000287f
000000000000000000f179ff79f779fffffffffffff55555555ffffffffffff177771fff79f779ff79f779ffff820000000000000000000000000000000028ff
000000000000000000199fffff799ffffffffffffff55555555ffffffffffff17711ffffff799fffff799fffff820000000000000000000000000000000028ff
00000000000000000091fffff799fffffffffffffff55f55f55fffffffffffff11fffffff799fffff799ffffff8200000000000000000000000000000000281f
0000000000000000001ffffff79ffffffffffffffff5ff55fffffffffffffffffffffffff79ffffff79fffffff8200000000000000000000000000000000280f
00000000000000000fffffff7fffffffff0220ffffffff55ffffffffffffffffffffffff7fffffff7fffffffff82000000000000000000000000000000002800
00000000000000000fffffffffffffffff5865ffffffffffffffffffffffffffffffffffffffffffffffffffff82000000000000000000000000000000002800
00000000000000000077fff7ff77fff7ff0860ffffffffffffffffffffffffffffffffffff77fff7ff77fff7ff82000000000000000000000000000000002800
0000000000000000001ff77ff79ff77fff5875fffffffffffffffffffffffffffffffffff79ff77ff79ff77fff82000000000000000000000000000000002800
000000000000000000f179ff79f779ffff5875ffffffffffffffffffffffffffffffffff79f779ff79f779ffff82000000000000000000000000000000002800
000000000000000000199fffff799fffff0880fffffffffffffffffffff1f1fffff1f1ffff7191ffff7191ffff82222222222222222222222222222222222800
00000000000000000091fffff799ffffff5dd5ffffffffffffffffffff1f1f1fff1f1f1ff7191f1ff7191f1fff88888888888888888888888888888888888800
0000000000000000001ffffff79fffffff0880fffffffffffffffffff000000ff000000ff000000ff000000ff000000ff000000ff00000000000000000000000
00000000000000000fffffff7fffffffff5555ffffffffffffffffff000000000000000000000000000000000000000000000000100000000000000000000000

__gff__
0400040404040404040000000000020000000606060604010101010101010101000101010000000000000101010000010000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000012121200000000000000000000000203040000020304000d680e85000000000000000000000203040000121212121212121212002f2f0000000000090a0a0b0000000000090a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0c0803060c0a0a0a0a0c000c0a0a0a0a0a2f2f
000000000000000000121212121212000000000000000000080708000008030800000e0e850c0000300000000002030303030304001212121212121200002f2f000000000c0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d00000d2f2f
0000000000000203080304000012121200300000000002030307030508030703030400680e400e08000800000003070703070308121212121212120000002f2f00000000090a0a0a0a0a0a0a0a0a0a17190a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d000d0a0a0a0a0a0a0a0a0a0a0a0a0a0d000d0a0a0a0a0d000000002f2f
00000000000003030303030304121212120033090c00030307070303070707070703040e0e0e0e850b0000000003030707070703121212121212000000002f2f00000c0a0a0a0a0a0a0a0a0a1718181c1e0a0d0000090a0a0a0a0a0a0a0a0a0a0a0b000000000d0a0a0a0a0a0a0a0a0a0a0d000000090a0a0b00000000002f2f
000000000000080303030707030012121200000d0a0c080303070707070707030308440e0e858585020303040008030307070703041212121212000000002f2f0a0a0a0b00000d0a0a0a0a0a1d1e1e1f0a0a0000000d0a0a0a0a0a0a0a0a0a0a0a0b0000000000000d0a0a0a0a0a0a0d0000000000090a0a0a00000000002f2f
12000000000000080303030306121212120203040d0a0c0803030303030303080f0f0e0e0e000000000303030000030707070306001212121212000000002f2f0a0a0a0a0000000002080d0a0a0a0a0a0a0d00000000090a0a0d0000050d0a0a0a0a0c00000000000000000d0d000000000000000c0a0a0a0a00000000002f2f
120000000c0a0a0a0b0803080012121212030303040d0a856a0e0f620e0e420e0f420e600e003500000803080000030707030800000000121200000000002f2f0a0a0a0b0000000003030303040d0a0a0b00000000000a0a0a00020303040d0a0a0a0a0c0000000000000000000000000000000c0a0a0a0a0a00000000002f2f
0000000c0a0a0a0d02030303001212121203070703040d850e0e0f0e0e0e0e0e0f0e0e0e0e000000000000000000080303060c0c000000000000000000002f2f0a0a0a0a0c0000000303070303040a0a0a0000000000090a0d0003070703040d0a0a0a0a0c000000000000000000000000000c0a0a0a0a0a0b00000000002f2f
000000090d0203030307030612121212120803030303040000000d85858585850f858585856e0e003400000000000000000c0a0a0c0000000008000000002f2f000d0a0a0a0c0000030707070308090a0a0c000000000d0d00000307030303000d0a0a0a0b0000000000000000000000000c0a0a0a0a0a0a0d00000000002f2f
0000000000030707070703001212301212120803030308000030000000000000000000000f0e0e8500000000000000000c0a0a0a0a0c00000000000000002f2f0000090a0a0a0c0008030707030c0a0a0a0b00000000000000000803030308000000090a0a0c00000000000000000c0a0a0a0d00000d0d0d0000000000002f2f
120000000008030707030612121212121212121235121212000000000000000035000030008585850b0000000000000c0a0a0a0a0a0a0a0a0c0a0a0c00002f2f0000090a0a0a0a0a0c03030303090a0a0a0b000000000000000000030703000000000a0a0a0a0a0a0d0000000000090a0a0d0000000000000000000000002f2f
12000000000003030306121212121212121202030400123312000000000000000000000000000d0d003312120000000d0a0a0a0a0a0a0a0d0a0d0a0a08002f2f00000d0a0a0a0a0a0a0c0303030d0a0a0a0d000000000000001212080308000000000a0a0a0a0a0a0000000000000d0a0d000000000000000000000000002f2f
000000000000080306121212121212120203030303040000000035000000330000000000003500000000121212000000000d0a0a0d0000000000000d00002f2f0000000d0a0a0a0a0a0a080308000d0a0d00000000000000000012121200000000000a0a0a0a0a0d000000000000000d00000000000000000000000000002f2f
00000000000000000012121212121212120303030303000000000000000000000000000000000000001212121212000000000d0a000000000000000000002f2f00000000000d0a0a0a0a0c0000000000000000000000000000000000000000000000090a0a0d0503030400000000000000000012121200000012121200002f2f
0000000000000000001212121212121212080303030800000c0a0a0c000000000000000034000012121212000012120000000009000000000000080000002f2f1200000000000d0a0a0a0a0c000000000012121212000000000000000000000000090a0a0a020303030800000000000000001212121212121212121212122f2f
0000000000000000001212121212121200000000000000090a0a0a0a0b0000000800090c00000012120000000000121200000c0a0c0000000812120000002f2f121212120000000d0a0a0a0a0c000000121212121212000000000000000013000000090a0b080307070300000000000000001212121212121212121212122f2f
00000000000000000012121212121212000000000000000000000d0b0000000000000d0a0c00000000000000000000000000090a0b0000000000000000002f2f12121212120000000d0a0a0a0a0c0000000012120000000000000000000000000000090a0a0c0303070300000000000000121212121212121212121212122f2f
00000000000000000012121212121212001212121200000000000000000000020304000d0b000000000000000000000000000d0a0a0c00000000000000002f2f121212121212000000000d0a0a0a0c000000000000000034000000000000000000000d0a0a0d0303030600000000000000121212121212121212121212122f2f
0203030304000000121212121212121212121212121212120000000000000003070330000000000000000c0b00000000000000090a0b00000000000800002f2f1212120000121200000000090a0a0a0c0000000034000c0a0a0a0c0000000000000000000d000800000000000000121212121212121212121212121212122f2f
03030307030000000000121212121212121212121212121212000000000000080306000000000000000c0a0a0b000000000000090a0a0c000000000000002f2f12120000000012120000000d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0d00000000000000000000000000000000000012121212121212121212121212121212122f2f
0303070703000000001212121212121212121212121212121212000000000000000000000000000000090a0d000000000000000a0a0a0a0c0000000000002f2f1200000000001212000000000d0a0a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000012121212121212121212121212121212122f2f
0303030303000000000000000000121212121202030412121212000000330000330000000000000000000000000000000000000a0a0a0a0a0c00000000002f2f000000000000121200000000000d0a0a0a0a0a0a0a0a0a0a0a34000000000000000c150000000000000000050304121212121212121212121212121212122f2f
0a0a0c030800000000000000000000000000000303030303030400000c0a0a0a0a0a0a0a0c0000000000000000000000000000090a0a0a0a0a00000000002f2f1212121212121212000000000000090a0a0a0a0a0a0a010e0a0000000000090a0a0a0b0000001212120203030303041212121212120000121212121212122f2f
0a0a0a0a0c000000000c0a0a0c00000000000008030307070703040c0a0a0a0a0a0a0a0a0a0c0000000000000000000000000c0a0a0a0a0a0d00000000002f2f12121212121212121212120000000d0a0a0a0a0a0a0a0e0e0d300000000000090a0a000000000000000803030707030412121212000000000000000000002f2f
0a0a0a0a0a0a0a0a0a0a0a0a0b0000000000000002070703030303090a0a0a0a0a0a0a0a0a0a000000000000000000000000090a0a0a0a0d0000000000002f2f1212121212121212121212120000000d0a0a0a0a0a0a0a0a000000000000000d0b00000000000000000807030703030312121212000000000000000000002f2f
0a0a0a0a0a0a0a0a0a0a0a0a0d00000012120000030707030303080d0a0a0a0a0a0d0000000d0a0a0a0a0a0c0000000000090a0a0d0000000000000000002f2f121212121212121212121200080000000030090a0a0a0a0a34000000000000000000000000000800000203030707070304121212000000000000000012122f2f
0a0a0a0a0a0a0a0a0a0a0a0a000000121212121203070303080000000d0a0a0a0a0000000000090a0a0a0a0a0a0c000000000d0000000000000000000c0a2f2f121212121212121212120000000000000000090a0a0a0a0d0000000000000000000000000800000c0d0803030707070300121212000000140000001212122f2f
0a0a0a0a0a0a0a0a0a0a0a0d00000012121212120803030308000000000a0a0a0b00000000000d0a0a0a0a0a0a0b000000000000000000000000000c0a0a2f2f1212121212121212121200000000080000000d0a0a0a0d3000000000000000000000121200000000000003070707030312121212120000000000001212122f2f
0a0a0a0a0a0a0a0a0a0a0d0000000000000000000000000000000000000a0a0a0a0000000000000a0a0a0a0a0a0d0203040000000000000000000c0a0a0a2f2f12121212121212121212120000000000000000000000000000000000000000000012121212000000000008030707070312121212120000000000121212122f2f
0a0a0a0a0a0a0a0a0a0d000000000000000000000000000000000c0a0a0a0a0a0b00000000000c0a0a0a0a0a0b0203030304000c0c0000000000090a0a0a2f2f12121212121212121212121212121208000000000000000000000000000000121212121212120000001212030303030612121212121200000012121212122f2f
0a0d000000090a0a0b00000000000c0a0a0a0a0a0c0c0a0a0a0a0a0a0a0a0a0a0a0a0a0c000c0a0a0a0a0a0a0a030707070300090b000000000c0a0a0a0a2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
0d00000000090a0a0b0000000000090a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0b08030703080c0a0a0c000000090a0a0a0a2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
__sfx__
010c0004246152461524615246250c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200020c4100c210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01030010184300c1700c1400c1150c3300c1700c1400c1150c3300c1700c1400c1150c3300c1700c1400c1150c1050c1050c1050c1050c1050c1050c1050c1050010500105001050010500105001050010500105
011000010015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010a0001001550c1000c1000c1050c3000c1000c1000c1050c3000c1000c1000c105184000c1000c1000c1050c3000c1000c1000c1050c3000c1000c1000c1050010500105001050010500105001050010500105
010700103061530600306153c605306153c605306150c0003c6103c615306153c605306153c605306150c0003c6050c6003c6050c6003c6050c6000c6000c6000c6000c6000c6000c6003c6050c6003c6050c000
010800203c615306003c6053c6053c6153c6053c6150c0003c6153c6053c605306003c615306003c6053c6053c6150c6003c6150c6003c6150c6000c6000c6000c6000c6000c6000c6003c6150c6003c6150c000
011406073c5303c5213c5113c5113c5113c5103c51000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
0114002011b4011b2111b1011b1011b1011b1011b1011b1011b1011b1011b1011b1011b1011b1011b1011b1011b4511b4511b4511b4511b4511b4511b4511b4511b4511b4511b4511b4511c4011c4011c4011c40
0114000011950119411193111921119111191011910119101191011915189001c901189011c901189011c9011b901189011b901189011c90118901219011890124b3524b3524b3524b3524c3024c3024c3024c30
010a00202bd3520d051fd2520d051fd1520d052bd3520d051fd2520d051fd1520d052bd3520d051fd2520d051fd1520d052bd3520d051fd2520d051fd1520d052bd3520d051fd1520d052bd3520d051fd1520d05
0114000011b6511b6511b6511b6511b6511b6511b6511b6511b6511b6511b6511b6511b6512b6512b6512b6511b6511b6511b6511b6511b6511b6511b6511b6511b6511b6511b6519c6018c6016c6014c6013c60
011400002bb202bc202bc202cb202cb252cc202cb252cc202cb252cc202cb252cc202cb252cc202ec202eb2530c2030c2030c202eb202eb252eb252eb252eb252eb252eb2527b2527b2522b2522b2522b2522b25
011400001d9651d965299651d9651d965299651d9651d965299651d9651d9651e9601e9601e9651e9651e9651d9651d965299651d9651d965299651d9651d965299651d9651d965259652496522965209651f965
0114000018b4018c4018c4019b4019b3519c6019b4519c4019b4519c4019b4519c4019b4519c401bc401bb451db451db451db451bb401bb451bb451bb451bb451bb451bb451bb451bb451bb451bb451bb451bb45
0114000018940189451894519940199451994519945199451994519945199451994519945199451b9401b9451d9401d9451d9451b9401b9451b9451b9451b9451b9451b9451b9451b9451b9451b9451b9451b945
011400002bb202bc202bc202cb202cb252cc202cb252cc202cb252cc202cb252cc202cb252cc202ec202eb2530c2030c2030c202eb202eb252eb252eb252eb252eb252eb252eb252eb2537c2033c202ec202bc20
010a00081981518815198151881531845188151981518815000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400002496524965309652496524965309652496524965309652496524965259602596025965259652596524965249653096524965249653096524965249653096524965249652c9652b965299652796526965
010a00081980518805198051880525855188051980518805000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010a00000c1350c1350c1350c1350c1350c1350a1200a1100a1100a1150a1300a1150a1300a1150a1300a1150a1300a1150a1300a1150a1300a1150a1300a11513135131350f1350f1350a1350a1350713507135
0128000011b4011b3111b2111b1111b1111b1111b1111b1511b4011b3111b2111b1111b1111b1111b1111b1511b4011b3111b2111b1111b1111b1111b1111b1512c4012c4012c450fc400fc400fc4512c4012c45
0128000020c2020c2020c2020c2020c2020c2020c2020c2022c2022c2025c202ac202ac2029c2027c2025c2024c2024c2024c2024c2024c2024c2024c2024c2025c2025c2025c2025c2025c2025c2025c2025c20
0128000020f2020f1120f151df201df111df111df111df151ef201ef111ef151bf201bf111bf151ef201ef152495629946249362992624916299162420029200259462a936259262a916259162a916252002a200
011e001010b5010b4110b3110b2110b1010b1010b1010b1512b5012b4112b3112b2112b1012b1012b1012b1510b0010b0010b0010b0010b0010b0010b0010b0012b0012b0012b0012b0012b0012b0012b0012b00
011e00100070517725187251772500705177251872517725007051672517725167250070516725197251672500705007050070500705007050070500705007050070500705007050070500705007050070500705
011e001010f3010f2110f1110f1512f3012f2510f3010f250df300df200df100df100ef300ef250df300df2500800000000000000000000000000000000000000000000000000000000000000000000000000000
010f002000d0000d001800300d0024d253f5053f51500d0000d0000d003f5153f51524d2500d0018d0018d0019d0500d0018d1500d003f51500d0000d0000d0000d0000d003f5153f51524d2525d2524d2525d25
010f002000d0000d001800300d0000d0000d0000d0000d0000d0000d0000d001700300d0000d0018d0018d0019d0500d001800300d0000d0000d0000d0000d0000d0000d001700318d0024d1525d1524d1525d15
011e000015b4015b3015b2015b1015b1015b1515b4015b3512b4012b3012b2515b4015b3015b2512b4012b3514b4014b3014b2014b1014b1014b1014b1014b1514b4014b3014b2014b1014b1014b1014b1014b15
011e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001df201df111ef201ef111ef101ef101ef15000001ef201ef11
013c000014b5014b4114b3114b2114b1114b1014b1514b0510b5010b4110b3110b2110b1110b1010b1510b0514b5014b4114b3114b2114b1114b1014b1514b0510b5010b4110b3110b2110b2110b1117b5513b55
013c00001495014941149311492114911149101491014915109501094110931109211091110910109101091514950149411493114921149111491014910149151095010941109311092110910109150b01507015
013c000014f4014f3114f2114f151bf401bf311bf211bf1520f3020f1123f2023f1122f2022f1122f1122f1120f4020f211bf401bf311bf211bf111bf101bf101cf401cf311cf211cf111cf101cf151cf001cf00
010f001024d1525d1524d1525d153cd1525d1524d1525d1524d1525d1524d1525d153cd1525d1524d1525d1500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d0500d05
013c000014b5014b4114b3114b2114b1114b1014b1514b0510b5010b4110b3110b2110b1110b150fb500fb2514b5014b4114b3114b2114b1114b1514b650fb6510b5010b4110b3110b250fb500fb350fb6513b65
013c000008f3008f2108f1108f1008f1514f0016f3016f2116f1116f1016f1016f1522f0022f0022f0022f002c5202c5153b5103b5103b5103b51508035030353a5103a5103a5103a51500f0000f000303507035
013c0000235202351527520275112751127515275052e5002852028511285151c5002b5202b5112b5151f50014950149411493114921149111491014915005001095010941109311092110911109101091500500
011e00001cf301cf211cf111cf101cf101cf151cf001cf051ef301ef211ef111ef101ef101ef101ef151ef0523f3023f2123f1123f1023f1023f1023f1023f1522f3022f2122f1122f1022f1022f1022f1022f15
011e001004f3004f2104f1104f1506f3006f2504f3004f2501f3001f2001f1001f1002f3002f2501f3001f2500800000000000000000000000000000000000000000000000000000000000000000000000000000
011e000014b5014b4114b3114b2114b1114b1014b1014b1014b1014b1014b1014b150000000000000000000010b5010b4110b3110b2110b1110b1010b1510b0013b5013b4113b3113b2113b1113b1013b1510b00
011e00001495014941149311492114911149101491014910149101491214912149121491214915009000090010950109411093110921109111091210912109151395013941139311392113911139121391213915
011e000017f4017f2117f1516f4016f2116f1116f1016f1510f4010f2110f150ff400ff210ff110ff100ff1510f4010f2110f1110f1010f1010f1010f1210f1213f4013f2113f1113f1216f4016f2116f1116f12
011e00000ff200ff110ff150df200df110df110df100df1507f1007f1107f1508f1008f1108f1108f1008f1510950109411093110921109111091210912109151395013941139311392113911139121391213915
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011e000017f4017f3017f2017f1017f1017f1017f1017f1017f1017f1017f1017f1217f1217f1217f1517f0010950109411093110921109101091010910109151295012941129311292112910129101291012915
010f00000495104950049500495004950049500495004950049400494004940049400494004940049400494004930049300493004930049200492004920049100491504910049000490004900049000490004900
010f00000595105951059510595105941059410594105941059310593105931059310592105921059210592105912059120591205912059120591205912059120591205912059120591205912059120591205912
010f000030f3530f2530f1530f1518d250000524f150000530f050000524f150000518d2500005000050000530f0530f0530f150000518d2524f0524f150000530f1524f15000050000518d25000050000500005
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01040000039230531308933093130b9430d3130e95310313129631331314973153131696315313149531331311943103130f9330d3130c9330a31308923073130592303313019130031308303073030430301303
0109000020f1220f2220f3220f4220f5220f6220f7220f6220f5220f4220f3220f2220f1220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f02
010900002cf122cf222cf322cf422cf522cf622cf722cf622cf522cf422cf322cf222cf122cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf02
010400000647307b710a6730cb711093313631159331ab510145302b510565307b310b9330e6211092315b410044300b410064302b4106923096210b92310b210041300b110061300b110191304611069130bb11
01020000104230db53306532db532b953276532495323b53206531f4531c9531b6531895316b531564313b4312943104430f9430db330b63309b3308923066230492303b230162300b2300933002150094300615
01040000049132ff13069132cf13039132af23049230592327f230693326f330493325f430694325f430494328f430794329f430a94326f530595324f530795329f2321f432cf632ff7330610306103061030615
010400002b72418765187641876518764187551875418755187541874518744187451873418735187341872518724187251870418705187041870518704187051870418705187041870518704187051870418705
010800003a9703a9523a925249003a9703a9503f9703f9503f9403f9323f9203f9103f91518900189000090000900009000090000900009000090000900009000090000900009000090000900009000090000000
010200002cd732cd732cd732cd732cd632cd632cd632cd632bd132bd532ad532ad1329d5329d4328d4327d4326d132594324d432293320d331e9031cd331a93319d0317d231592313d131191300d0300d0300d03
010200000fd130452011d33107301ad43157501fd531b76326d601d76332d70157732ed600b7632ad600975323d50057431cd400673316d200a72310d10027130ad15007030dd0009d0006d0003d0001d0001d00
0101000030e71189753fe000000000000000000d97118e75000000000000000000003097118e7500e0018e0116e0100e0113e0111e0100e010de010ce0100e0109e0107e0100e0105e0104e0100e0101e0100e01
0102000033b6131863006102f86316b61006101eb531c851006101885116b430061013b4311841006100d8410cb430061009b3307831006100582104b230061001b1100811006140061507b0007b0006b0105b01
010100003062030610306203c6103c6203c6100060000600006000060000600006000060000600006000060000600006000060000600006000060000600006003060030600306003c6003c6003c6000060000600
0101000030f650000031f4531f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 08090a62
00 0e100f11
00 0e0c0f11
00 0b120d13
00 0b120d13
02 1516170a
01 18191a1c
00 18191a1b
00 1d1e1b5b
00 1f202122
00 23242522
00 1819271b
00 1819261b
00 282a2922
00 282a2b22
00 182d5c44
02 2e2f3044

