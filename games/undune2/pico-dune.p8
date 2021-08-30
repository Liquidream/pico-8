pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

cartdata("pn_undune2") 

-- data flags
p_level,ai_level,p_col1,p_col2=dget"0",dget"1",dget"7",dget"8"
bases,credits={},
{
 dget"35">>16, -- player starting credits
 500>>16,     -- ai starting credits
 dget"36">>16  -- target credits
}

for i=1,dget"5" do
 local base={}
 for j=1,5 do
  base[j]=dget(i*5+j)
 end
 add(bases,base)
end


-- fields
g_,buildings,units,object_tiles,radar_data,spice_tiles,particles,has_obj,start_time,t_,build_dest,unit_dest,keyx,keyy,hq,radar_frame,message,msgcount,fow={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,"",0,{}
last_hq=hq

g_.factory_click=function(self)
  menu_pos,selected_subobj,ui_controls=1,nil,{}
  -- create buttons
  m_button(6,"⬆️",function()
   sel_build_item_idx=mid(1,sel_build_item_idx-1,#selected_obj.valid_build_objs)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]
   if (sel_build_item_idx<menu_pos) menu_pos-=1
  end, 10)
  m_button(17,"⬇️",function()
   local len=#selected_obj.valid_build_objs
   if (sel_build_item_idx<len) sel_build_item_idx=mid(1,sel_build_item_idx+1,len)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]   
   if (sel_build_item_idx>menu_pos+2) menu_pos=min(menu_pos+1,len-2)
  end, 10)
  m_button(32,"build",function()
   show_menu=nil
   last_selected_subobj:func_onclick()
  end)
  m_button(96,"close",function()
   show_menu=nil
  end)
  -- show build menu
  show_menu=self
end
g_.draw_refinery=function(self)
  local col2=self.col2
  pal{
   [8]=col2,
   [10]=col2,
   [11]=col2,
   [12]=self.col1,
   [14]=self.col2
  }  
  if self.incoming then
   pal(self.col_cycle[self.col_cycle_pos], self.col1)
  else
   pal(11,self.col1)
   self.col_cycle_pos=1
  end
end
draw_action=function(self)
 pal(7,8)
 if (self.id==80 and selected_obj.process==2 and not selected_obj.procpaused) pal(7,11)
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
  if val>=12 and val<=22 then
   last_selected_obj.life=0
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
obj_data=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|storage|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|22|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|22|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|0|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|1000|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1||0||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1||0||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1||0||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|0|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1||0||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1||0||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1||0||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1||0||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||448|400|0.3|9|2|112|58|54||||0|0|0|0|0|0|1|1||0||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||300|20|1|9|2|20||54||41|5|0|0|0|0|0|0|1|1||0||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1||0||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1||0||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||50|480|0.3|7|2|500|59|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1||0||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|32||1|1|1|1|11|||2|||||1|1|||||||0|4|0|||||53|1|||0|0|0|0|0|0|1|1||0||||||
80|rEPAIR|3|3|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||draw_action||action_click
81|lAUNCH|1|1|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||draw_action||action_click]]




-->8
--p8 functions
--

function _init()
 -- Enable "locked" mouse pointer
 poke(0x5f2d, 1) --0x5)

 -- menuitem(1,"exit to title",function()
 --  load("pico-dune-main")
 -- end)
 
 -- menuitem(1,"! win level !",function()
 --  endstate=2
 -- end)

 --  
 -- explode object data
 -- 
 local str_arrays=split2d(obj_data,"|","\n")
 obj_data={}
 -- loop all objects
 for i=2,45 do
  local new_obj={}
  -- loop all properties
  for j=1,51 do
   local val=str_arrays[i][j]
   -- convert all but the text columns to numbers
   if (j!=2 and j<46)val=tonum(val)
   if j==47 then
    --restore new lines
    str_breaks,val=split2d(val,"~"),""
    for line in all(str_breaks) do
      val..="\n"..line
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
   fow[i][l]=0--16 --0
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
 for my=0,31 do
   for mx=0,127 do
     local objref=nil
     local spr_val=mget(mx,my)
     -- handle player start pos (const yard) as a special case
     -- center camera & create player const yard
     if (spr_val==1) camx,camy,objref=bases[1][4]-56,bases[1][5]-56,obj_data[1]      
     -- find object for id
     for o in all(obj_data) do         
      if (o.obj_spr!=nil and o.obj_spr==spr_val) objref=o break       
     end
     if objref!=nil and (spr_val==1 or spr_val>=32) then --don't create "concrete" as objs
       local ox,oy=mx,my
       if (ox>63) oy+=32 ox-=64
       mset(mx,my,wrap_mget(mx,my+1))
       m_map_obj_tree(objref, ox*8,oy*8)
     end
   end
 end
  

 -- worker
 worker_cor = cocreate(function()
  while true do

  if t_%30==0 then
   -- reset music (will set if more attack)
    set_loop"false"  --5
   -- 
   -- update_obj_tiles()
   -- 
   -- update positions of pathfinding "blocker" objects 
   object_tiles={}
   for unit in all(units) do
    object_tiles[unit:get_tile_pos_index()]=unit
   end

   -- 
   -- update_radar_data()
   -- 
   new_radar_data={}
   -- landscape/fow
   if hq then    
    for i=0,62,2 do
      for l=0,62,2 do
       -- look at tile spr and if not fow, get col?
       local mspr_off=wrap_mget(i,l)*8
       if(fow[i][l]==16) new_radar_data[(i/2)..","..(l/2)] = mspr_off>0 and sget(mspr_off%128+3, mspr_off\8\16*8+3) or 15
      end
      yield()
    end
   end  

   -- -- structures
   -- reset vars for this pass
   power_bal,total_storage,has_radar,building_count = 0,0,false,{0,0}
   has_obj={{},{}}

   for building in all(buildings) do  
    -- if our building, or ai not under fog of war
    if building.owner==1 or (hq and is_visible(building)) then
     new_radar_data[(building.x\2\8)..","..building.y\2\8] = building.col1
    end
    -- track power/radar
    if building.owner==1 then
     -- player owned
     power_bal -= building.power
     if (building.id==7) has_radar=true
     total_storage+=building.storage
    end
    -- track counts & objs
    building_count[building.owner]+=1
    add_with_init(has_obj[building.created_by] ,building.id, building)
   end
      
   -- units
   for unit in all(units) do
    -- if our unit, or ai not under fog of war
    if hq and (unit.owner==1 or is_visible(unit) and unit.z==1) then
     new_radar_data[(unit.x\2\8)..","..unit.y\2\8] = unit.col1
    end
    if (unit.created_by>0) add_with_init(has_obj[unit.created_by], unit.id, unit)
   end
  
   -- has radar-outpost + enough power?
   hq,music_state,radar_data = (has_radar and power_bal>0),2,new_radar_data
   
 
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
    -- save game data state
    local offset=40
    for data in all{endstate,t()-start_time,strnum,getscoretext(credits[2]),unit_dest[1],unit_dest[2],build_dest[1],build_dest[2]} do
     dset(offset, data)
     offset+=1
    end 
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


function m_map_obj_tree(objref, x,y, owner, factory) 
  local newobj=m_obj_from_ref(objref, x,y, objref.type, nil, g_[objref.func_init], g_[objref.func_draw], g_[objref.func_update], nil)
  newobj.ico_obj,newobj.life=m_obj_from_ref(objref, 109,0, 3, newobj, nil, nil, g_[objref.func_onclick]), placement_damage and objref.hitpoint/2 or objref.hitpoint -- unless built without concrete
  -- player-controlled or ai?
  -- 0=auto, 1=player, 2=computer/ai
  newobj.owner=newobj.owner or owner
  if not factory then
   -- unless explicitly stated...
   if not newobj.owner then
    --calc closest base/owner
    local best_dist=9999
    for i=1,#bases do
     local curr_dist=dist(x,y,bases[i][4],bases[i][5])
     if (curr_dist<best_dist) newobj.base_idx,newobj.owner,best_dist=i,min(i,2),curr_dist
    end
   else 
    -- assume player-owned
    -- (only wrong with blooms, as factory takes priority, but player can still attack)
    newobj.base_idx,base=1,bases[1]
   end 
  else
   --created by factory
   newobj.base_idx=factory.base_idx
  end
  
  newobj.created_by,newobj.build_objs,base = owner or newobj.owner,{},bases[newobj.base_idx or factory.base_idx]
  new_faction=base[1]
  newobj.faction,newobj.col1,newobj.col2 = new_faction,base[2],base[3]
  -- go through all ref's and see if any valid for this building
  for o in all(obj_data) do
   local req_faq=o.req_faction
    if (o.parent_id!=nil and (o.parent_id==newobj.id or o.parent2_id==newobj.id))					
     and (not req_faq
      or (req_faq>0 and req_faq==new_faction)
      or (req_faq<0 and -new_faction!=req_faq))
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
  
  if newobj.owner>1 then
    newobj.ico_obj.func_onclick=nil --make ai icons un-clickable
  end

  -- override cols?
  if objref.col1 then
   newobj.col1,newobj.col2 = objref.col1,objref.col2
  end
  
  -- (flying objs are automomous & don't reveal map)
  if (newobj.z>1) newobj.owner=0

  local xpos,ypos = x\8,y\8
  
  -- building props?
  if objref.type==2 then
    -- prepare the map?
    local slabs=objref.obj_spr==22
    for xx=0,objref.w-1 do
      for yy=0,objref.h-1 do
       -- block map under building (diff tiles for player/ai-owned)
       wrap_mset(xpos+xx, ypos+yy, slabs and 22 or newobj.owner==1 and 149 or 23)
      end
    end
    if (not slabs) add(buildings,newobj)
    -- other building stuff
    -- refinery?
    if newobj.id==6 and not newobj.parent then
     -- auto-create harvester
     create_harvester(newobj)
    end
  else
    -- unit props
    newobj.r=newobj.norotate!=1 and flr(rnd"8")*.125
    if newobj.arms>0 then
     -- combat stuff
     newobj.fire=function(self)
       -- now firing, fire bullet/missile
       self.state,self.bullet_x,self.bullet_y,self.bullet_tx,self.bullet_ty = 4,self.x+4,self.y+4,self.target.x+self.target.w/2,self.target.y+self.target.h/2
       -- normalize dx,dy
       local dx,dy = self.bullet_tx-self.bullet_x,self.bullet_ty-self.bullet_y
       local d=sqrt(dx*dx+dy*dy)
       self.bullet_dx,self.bullet_dy = (dx/d)*2,(dy/d)*2
       ssfx(self.fire_sfx)
       reveal_fow(self)
     end
     -- rocket/cannon turret?
     if (newobj.speed==0) wrap_mset(xpos,ypos,149)
    else
     -- harvesters
     if (newobj.id==32) newobj.capacity=0-- factory=nil
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
   draw=function(self)
     local x=self.x
     local y=self.y
     local ty=self.type
     -- skips if off-screen
     if ty>2
      or (x+self.w>=camx
       and x<=camx+127
       and y+self.h>=camy
       and y<camy+127+self.z)
     then
       pal()
       palt(0,false)
       if (self.trans_col and ty<=2 or ty>=5) palt(self.trans_col,true)   
       -- faction? (if not IX)
       if (self.faction and self.id!=18) pal(12,self.col1) pal(14,self.col2)
       
       -- icon mode
       if ty>2 and ty<5 then
         local this = ty==4 and self or self.parent
         -- bg
         rectfill(x-1,y-1,x+16,y+19, 0)
         -- draw health/progress
         local hp = this.hitpoint
         local val = self.process==1 and 15*(this.life/100) or 15*(this.life/hp)
         if (this.life>0 and not show_menu) rectfill(x,y+17,x+val,y+18, self.process==1 and 12 or this.life<hp*.33 and 8 or this.life<hp*.66 and 10 or 11)
         pal(11,this.icol1) pal(3,this.icol2)
       end

       -- colour anim?
       if self.col_cycle then
        pal(self.col_cycle_src, self.col_cycle[self.col_cycle_pos])
       end

       -- pre-draw override?
       if (func_draw) func_draw(self)

       -- rotating obj?
       if self.r then
        if not self.death_time or self.death_time>.025  then
         rsspr(self.obj_spr%16*8,self.obj_spr\16*8, x, y, .25-self.r, 1, self.trans_col, self.z, flr(self.flash_count)%2==0 and 7 or nil)
         -- draw twice (shadow first, then norm)         
         -- for i=1,2 do
         --  if (i==2 or self.speed>0) rspr(self.obj_spr%16*8,self.obj_spr\16*8, x, y-(i==2 and self.z or 0), .25-self.r, 1, self.trans_col, i==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
         -- end
        end
       -- norm sprite
       else       
         -- non-rotational sprite
         if ty>2 then
          -- icon
          spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
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
       if (self.life<self.hitpoint*.33 and not self.altframe and rnd"10"<1 and ty<=2) add_particle(self.x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,split2d("10,8,9,6,5"), rnd"2"<1 and 0xa5a5.8 or 0)
       -- reset hit flag
       self.hit=0
    end --abort if off-screen
   end,
   update=function(self)
     local life=self.life
     local ty=self.type
     -- update targeting flash
     self.flash_count=max(self.flash_count-.4,1)
     -- check for attack
     if self.hit>0 and self.created_by>0 then 
       -- reinstate loop
       set_loop"true" --5
       -- switch music (if passed the loop point)?
       -- 0=normal, 1=battle, 2=leaving_battle
       if (music_state==0 or stat(24)>5) music_state=1 music"0"
       -- can we retaliate (unit/turret)?
       if (self.arms>0 and self.state==0) do_attack(self, self.hitby)
       -- lose soldiers
       if (self.obj_spr<=49 and life<100) self.spr_w,self.spr_h=0.5,0.5
       -- req repair pickup
       if (life<50 and self.state!=7) return_to_fact(self,safe_rnd(has_obj[self.created_by][14]) or self.last_fact) --TODO: chk last fact being set to facts (unless harvester!)
     end
     -- check for death
     if (ty<=2 and life<=0 and not self.death_time) self.state=5 self.cor=nil self.death_time=(ty==2 and 1 or .5) ssfx(self.death_sfx) shake+=((ty==2 or self.id==38) and 0.25 or 0)
     if self.death_time then
      self.death_time-=.025
      if self.death_time<=0 then
        if ty==2 then         
         -- building?         
         for xx=0,self.spr_w-1 do
           for yy=0,self.spr_h-1 do
             wrap_mset(self.x/8+xx, self.y/8+yy, 21)
           end
         end
         del(buildings,self)
         build_dest[self.hitby.created_by]+=1
        else
         -- unit
         local gx,gy = self:get_tile_pos()
         if (wrap_mget(gx,gy)<9) wrap_mset(gx,gy,33) --scorch sand
         if (self.id<=16) wrap_mset(gx,gy,21)
         -- clear incoming?
         if (self.last_fact) self.last_fact.incoming=false
         delete_unit(self)
         -- bloom
         if self.id==42 then
          ping(self,gx,gy,
           function (unit,x,y)
            if (wrap_mget(x,y)==0) wrap_mset(x,y,10)
           end,
           4, true)
         end
         if (self.hitby) unit_dest[self.hitby.created_by]+=1
        end      
        if(selected_obj==self) selected_obj=nil
      else
        -- dying
        if (rnd(ty==2 and 2 or 8)<1) make_explosion(self.x+rnd(self.w),self.y+rnd(self.h))
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
          -- todo: this really should be parent, in case building close to enemy const. yard
          m_map_obj_tree(self.ref,ux,uy,self.parent.owner,self.parent)
          -- reset build
          reset_build(self)
        end
      elseif self.process==2 and life>self.hitpoint then
        -- repair complete
        self.process=0
        -- move unit to safe place?
        if ty==1 and self.speed>0 then
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
    return self.x\8,self.y\8
   end
  }

 -- copy ref properties to object (where empty!)
 for k,v in pairs(ref_obj) do
  if not obj[k] and v!="" then
   obj[k] = v
  end
 end

 -- finally, init obj
 if (func_init) func_init(obj)

 return obj
end


function transact(diff, obj)
 if (getscoretext(credits[obj.owner])+diff<0) return false
 credits[obj.owner]+=sgn(diff)*(abs(diff)>>16)
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
 
 if(object.owner<=0 or object.id==42) return -- show all bases for demo!
 --if(object.owner!=1 and object.state!=4) return

 local size = object.type==2 and 3 or 2
 -- clear group of tiles
 for xx=-size,size do
  for yy=-size,size do
   -- clear tile
   local posx,posy = object.x\8+xx,object.y\8+yy
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
  camx,camy = mid(camx,368),mid(-8,camy,368)
   
  -- update all unit coroutines 
  -- (pathfinding, moving, attacking, etc.)
  for unit in all(units) do
    if unit then    
      if (unit.cor) active,ex=coresume(unit.cor, unit)
      --if(ex) stop(trace(unit.cor, ex))
      if (not active) unit.cor = nil

      -- check sandworm collision        
      if worm_segs -- worm present
       and fget(wrap_mget(unit:get_tile_pos()),2)  --unit on sand       
       and dist(head_worm_x,head_worm_y,unit.x,unit.y) < 1
       and unit.z==1
       then
        delete_unit(unit)
        worm_frame=.01
        ssfx"50"
      end
    end
  end
   
  --update_particles()
  for p in all(particles) do
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
  
  -- bg work
  assert(coresume(worker_cor))
 end -- no menu
 
 update_collisions()

 last_mouse_btn,last_selected_obj,last_selected_subobj = mouse_btn,selected_obj,selected_subobj 
 t_+=1
end

function delete_unit(unit)
 del(units,unit)
 if unit.id==32 and #has_obj[unit.created_by][32]<=1 then
  -- auto-create harvester
  refinery=safe_rnd(has_obj[unit.created_by][6])
  if (refinery) create_harvester(refinery)
 end
end

function create_harvester(fact)
 local ux,uy=nearest_space_to_object(fact)
 local new = m_map_obj_tree(obj_data[32],ux,uy,fact.owner,fact)
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


function is_spice_tile(x,y)
  local val=wrap_mget(x,y)
  return val>=4 and val<=10
end

function do_guard(unit, start_state)
 -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 4=firing, 5=exploding, 
 --(6=harvesting, 7=returning, 9=ready-to-unload/repair, 8=unloading/repairing)
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
   if rnd(250)<1 and self.arms>0 and self.state!=8 then
    -- is danger tile?
    local gx,gy = self:get_tile_pos()
    ping(self,gx,gy,
     function (unit,x,y)
      local target=object_tiles[x..","..y]
      if target!=null and target.created_by!=unit.created_by and fow[x][y]==16 and target.z==1 then
       do_attack(unit,target) 
       return true
      end
     end,
     max(4,self.range)) -- fixes lookout range (was self.range)

   -- ornithopter?
   elseif self.id==34 then
     -- select a random target (unit or building)
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
            if is_spice_tile(x,y) then-- and rnd"10"<1 then
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
    elseif self.capacity >= 150--1500 
     and self.state!=7 then
      -- return to refinery when full
      self.sx,self.sy=self:get_tile_pos() -- remember where we were!
      return_to_fact(self,last_fact or safe_rnd(has_obj[unit.created_by][6]))

     -- harvesting spice
    elseif self.state==6 then
     self.newspot=false
     -- spice clouds
     add_spice_cloud(unit.x, unit.y, unit.r+.75+rnd".2"-.1)

     -- update spice tile state
     local unit_pos = unit:get_tile_pos_index()
     --harvester should take about 110 secs to fill!
     self.capacity+=.5
     spice_tiles[unit_pos],self.name = (spice_tiles[unit_pos] or 1000)-1,"hARVESTER ("..flr(self.capacity/1500*100).."% fULL)"
     -- done current spot?
     if spice_tiles[unit_pos] <= 0 then      
      -- (clear spice tile + depleat surrounding tiles)
      local xpos,ypos=self:get_tile_pos()
      for yy=-1,1 do
       for xx=-1,1 do
        val=wrap_mget(xpos+xx,ypos+yy)        
        wrap_mset(xpos+xx,ypos+yy,
        (xx==0 and yy==0) and 0 or ((val>1 and val<8) and 10 or val)
       )
       end
      end
      -- go back to guard (look for more spice to harvest)
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
    if self.state==9 then
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
       self.x,self.y=nearest_space_to_object(self)
       if (self.sx) move_unit_pos(self, self.sx, self.sy, 0, true)      
      else
       -- must be a repairable unit
       -- spark flash while repairing       
       self.process,self.procstep,last_fact.col_cycle_src,last_fact.col_cycle = 2,0,8,split2d("7,10,0,0,7,0,0")
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
 local ux,uy = ping(target,(target.x+8)\8, (target.y+8)\8, is_free_tile, nil, true)
 return ux*8,uy*8
end

function add_spice_cloud(x,y,r)
 -- spice clouds
 if (rnd"5"<1) add_particle(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split2d("2,4,9,15"), 0xa5a5.8)
end

function do_attack(unit, target)
 ai_awake=true
 -- normal attack?
 if unit.id != 19 then
   -- 0=idle/guarding, 1=pathfinding, 2=moving, 3=attacking, 5=exploding
   unit.state,unit.target,unit.cor = 3,target, cocreate(function(self)
    while target.life>0 do
     local targdist=dist(unit.x,unit.y,target.x,target.y)
     --  1) move to within firing range of target
     if targdist > unit.range*5
      and unit.speed>0 then
      -- move to within firing range of target
      move_unit_pos(unit,target.x\8,target.y\8,unit.range*5)

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
      if (unit.fire_cooldown<=0 and not unit.bullet_x) unit.fire(unit) unit.fire_cooldown=unit.fire_rate
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
 for t=0,max_dist or 4,.04 do
 --for t=0,max_dist or 64,.02 do
 	local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
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
   and not object_tiles[x..","..y]
end

function move_unit_pos(unit,x,y,dist_to_keep,try_hail,start_state)
  local flying = unit.z>1
  -- before moving, can a carryall take us?  
  if try_hail then
   local carryall=has_obj and safe_rnd(has_obj[unit.created_by][33])
   if carryall and not carryall.link and carryall.faction==unit.faction then
     -- link them and set unit to "moving" to wait for pickup
     carryall.link,unit.link,unit.state, carryall.cor = unit,carryall,2, cocreate(function(unit_c)     
      move_unit_pos(unit_c,unit.x\8,unit.y\8)
      if(selected_obj==unit) selected_obj=nil
      if unit.life>0 then
       del(units,unit)
       move_unit_pos(carryall,x,y)
       unit:set_pos(carryall.x,carryall.y)
       add(units, unit)
       do_guard(unit,start_state)
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

  -- use coroutine to find path
  unit.tx,unit.ty,unit.prev_state,unit.state,unit.path = x*8,y*8,unit.state,1,nil
   
  -- (pn-minified/modified) "pathfinder"
  -- by @casualeffects
  -- http://graphicscodex.com  
  local start, goal, node_to_id = { x = unit.x\8, y = unit.y\8}, {x = x, y = y}, function (node) return (node.y<<8) + node.x end
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

        -- carry-all height
        if unit.id==33 then        
         if unit.link then
          local d=dist(unit.x,unit.y,unit.tx,unit.ty)
          if (d<32) unit.z = d/4
         end
         unit.z = mid(2,unit.z+0.1,8)
         unit.speed = unit.z/12
        end

        yield()
      end
      -- update tile blocking
      unit.x,unit.y,object_tiles[node.x..","..node.y] = node.x*8, node.y*8,unit
      
      -- reveal fog?
      reveal_fow(unit)

      -- are we close enough?
      if (dist(unit.x,unit.y,unit.tx,unit.ty) <= (dist_to_keep or 0)) break -- stop now
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
  
 map(0,0,  0,0,   64,32, 127)
 map(64,0, 0,256, 64,32, 127)


 -- buildings
 for building in all(buildings) do 
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
  for unit in all(units) do
   if (p==1 and unit.z==1) or (p==2 and unit.z>1) then
    if (not show_menu) unit:update()
    if (unit.process!=2 or unit.speed==0) unit:draw()
    -- reticule
    if (unit == selected_obj) spr(2, selected_obj.x, selected_obj.y)
   end
  end
 end

 -- particles
 --draw_particles()
 for p in all(particles) do
  if (p.pattern) fillp(p.pattern)
  circfill(p.x,p.y,p.r,p.cols[ flr((#p.cols/p.life_orig)*p.life)+1 ])
  fillp()
 end

 -- draw fog-of-war
 local mapx,mapy=camx\8,camy\8
 palt(0,false)
 palt(11,true)
 for xx=mapx-1,mapx+16 do
  for yy=mapy-1,mapy+16 do
    local gx,gy=xx*8,yy*8
    if fow[xx][yy]!=0 and fow[xx][yy]!=16 then
     spr(fow[xx][yy]+31,gx,gy)
    elseif fow[xx][yy]<16 then
     rectfill(gx, gy, gx+7, gy+7, 0)
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
 rect(90,90,124,124,p_col1)
 rect(91,91,123,123,p_col2)  
 rectfill(92,92,122,122,0)

 
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
     max(109-radar_frame,91),
     max(109-(radar_frame>20 and radar_frame-20 or 0),92),
     min(radar_frame*2,32),
     min((radar_frame>20 and radar_frame-20 or 1)*2,32))
   for i=1,300 do
     pset(92+rnd"32",91+rnd"32",5+rnd"3")
   end
   clip()
   return
 end
  
 -- draw radar data
 for xx=0,30 do
  for yy=0,30 do
   local k=xx..","..yy
   if (radar_data[k]) pset(92+xx,92+yy,radar_data[k])
  end
 end
 
 -- draw "view" bounds
 local cx,cy=92+camx/16,93+camy/16
 rect(cx,cy, cx+7,cy+6, 7)

 local sel_build_obj = selected_obj and selected_obj.build_obj 

 -- object menu icon/buttons? 
 if selected_obj and selected_obj.ico_spr then
  selected_obj.ico_obj:set_pos(109,20)
  selected_obj.ico_obj:draw()  
  -- player icons (build, actions, etc.)
  repair_obj,launch_obj=nil,nil
  if selected_obj.owner==1 then   
   -- build
   if sel_build_obj then
    sel_build_obj:set_pos(109,44)
    sel_build_obj:draw()    
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
 if sel_build_obj 
  and (sel_build_obj.type==4
   and sel_build_obj.speed==0)
  and sel_build_obj.life>=100 then
  -- draw placement
  -- todo: improve this code!
  local mxpos,mypos = (cursor.x+camx)\8, (cursor.y+camy)\8
  local sxpos,sypos,w,h = mxpos*8-camx,mypos*8-camy,sel_build_obj.spr_w,sel_build_obj.spr_h
  -- check ok to place
  placement_pos_ok,placement_inner_invalid,placement_damage = false,false,false
  for xx=-1,w do
    for yy=-1,h do
     local val=wrap_mget(mxpos+xx, mypos+yy)
     if xx==-1 or xx==w or yy==-1 or yy==h then     
      -- check edges
      if (val==22 or val>=58) placement_pos_ok=true
     else
      -- check inner      
      if (val>=12 and val<=21) placement_damage=true
      if (object_tiles[mxpos+xx..","..mypos+yy] or val==0 or val<=12 or val>=23) placement_inner_invalid=true
     end
    end
  end
  if (placement_inner_invalid)placement_pos_ok=false

  fillp("0b1110110110110111.1")
  rectfill(sxpos, sypos,
           sxpos+sel_build_obj.w, sypos+sel_build_obj.h, placement_pos_ok and 11 or 8)
  fillp()
 end


 if show_menu then  
  fillp(▒)
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
     if not curr_item.req_id
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

 -- pal() --else green=black

  -- ui elements (buttons)?
  for controls in all(ui_controls) do
    controls:draw()
  end
 end  -- if show_menu

 -- cursor
 palt(11,true)
 cursor:draw()

end

function m_button(x,text,func_onclick,_w)
 add(ui_controls,{
  x=x,
  y=83,
  w=_w or 22,
  h=8,
  text=text,
  get_hitbox=function(self)
   return self    
   end,
  draw=function(self)
    if(#text>1)rectfill(self.x,83,self.x+self.w,91, self.hover and p_col1 or 6)
    ?self.text,self.x+2,85,(#text>1) and 0 or (self.hover and p_col1 or 6)
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
      camx,camy = mid(0,(cursx-94)*16, 368),mid(-8,(cursy-94)*16, 368)
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
    if (selected_obj.created_by!=1 and last_selected_obj and (last_selected_obj.type==1 or (last_selected_obj.id==19 and target_mode)) and last_selected_obj.owner==1) selected_obj.flash_count=10 do_attack(last_selected_obj, selected_obj) selected_obj=nil

  -- deselect?
  else
    -- do we have a unit selected?
    if selected_obj 
     and selected_obj.owner==1 
     and selected_obj.speed>0 
     and selected_obj.state!=7 then     
     selected_obj.cor = cocreate(function(unit)
       move_unit_pos(unit, (camx+cursx)\8, (camy+cursy)\8)
       do_guard(unit)
      end)

    end
    
    -- placement?
    local sel_build_obj = selected_obj and selected_obj.build_obj 
    if sel_build_obj
     and sel_build_obj.life>=100
     and placement_pos_ok then
      -- place object
      m_map_obj_tree(sel_build_obj.ref,
       (cursor.x+camx)\8 *8,
       (cursor.y+camy)\8 *8, 1)      
      -- reset build
      reset_build(sel_build_obj)
      ssfx"61"
    end

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
  if (not obj) return
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
    if (obj.type<=2 and fow[(cursor.x+camx)\8][(cursor.y+camy)\8]!=16 or obj.state==8) return
    
     -- was our harvester selected before clicking a refinery/repair?
    if selected_obj
     and last_selected_obj
     and (obj.id==6 and last_selected_obj.id==32 
      or obj.id==14 and last_selected_obj.id>26)
     and obj.owner==1 and last_selected_obj.owner==1
    then
     return_to_fact(last_selected_obj,obj)
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
 fact = fact or safe_rnd(has_obj[unit.created_by][1]) or unit
 -- update last factory (in case changed)     
 unit.state,fact.incoming,unit.return_to = 7,true,fact
 if (unit.id!=32 or fact.id==6) unit.last_fact=fact
 unit.cor = cocreate(function(unit)
  local init_state=fact.id!=1 and 9 or 0
  move_unit_pos(unit, (fact.x+16)/8, fact.y/8, 0, true, init_state)
  if (not unit.link) do_guard(unit, init_state) 
 end)
end


-->8
-- ai-related code

-- whether worm is at surface (+ve) or not
worm_life=0

-- ai strategy code (attack, build, repair, etc.)
function update_ai()
 -- depending on ai level...
 if ai_awake and t()%ai_level==0 then
 --if ai_awake and t()>ai_level*20 and t()%ai_level==0 then
  --
  -- unit attacks
  -- 
  -- find the first ai unit and attack player  
  local ai_unit=rnd(units)
  if ai_unit.owner==2 and ai_unit.arms>0 and ai_unit.state==0 then
   -- select a random target (unit or building)
   attack_rnd_enemy(ai_unit)
  end
  
  -- build units/repair
  -- 
  local ai_building=rnd(buildings) 
  -- if ai owned...
  --  is factory, builds units and is not already building...
  if ai_building.owner==2 and
    (not ai_building.build_obj or ai_building.build_obj.process!=1) then    
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
  local ai_palace = safe_rnd(has_obj[2][19])
  if ai_palace and ai_palace.fire_cooldown<=0
   and p_target and p_target.type==2 then -- any player building
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
   worm_segs,worm_dir,worm_turn,worm_cols,worm_frame={{rnd"500",rnd"500"}},rnd"1",0,split2d("15,9,4"),0
  end
  worm_life_start=rnd"5000"
  worm_life=worm_life_start
 end

 if worm_segs then
  -- movement/turning
  if (t_%6<1 or #worm_segs<30) and worm_frame==0 then
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
 -- find rnd enemy unit (or building) to attack
 -- note: leave p_target global for palace attacks
 repeat
  -- favour attacking units (as they can attack you more!)
  p_target=(rnd"4"<1) and rnd(units) or rnd(buildings)
 until p_target.created_by!=obj.created_by
 if (p_target and is_visible(p_target)) do_attack(obj, p_target)
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
 if (val & 128 > 0 != enabled) val=val^^128
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
 -- (pn) disabled -ve score as should not be possible
 --if (val<0) s = "-"..s
 return s
end

function split2d(str,d,dd) 
 d=d or ","
 if (dd) str=split(str,dd) 
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

function add_with_init(table,index,object)
 if (not table[index]) table[index]={}
 add(table[index],object)
end

function safe_rnd(table)
 if(table) return rnd(table)
end

-- rotate sprite (modified to allow for trans cols, shadow + solid col)
-- orig by freds72
-- https://www.lexaloffle.com/bbs/?pid=52525#p52541
function rsspr(sx,sy,x,y,a,w,trans,shad_dist,single_col)
	local ca,sa=cos(a),sin(a)	
	local ddx0,ddy0,mask = ca,sa,0xfff8<<w-1
	w*=4
	ca*=w-0.5
	sa*=w-0.5
	local dx0,dy0,w = sa-ca+w,-ca-sa+w,2*w-1	
	for ix=0,w do
		local srcx,srcy=dx0,dy0
		for iy=0,w do
			if ((srcx|srcy) & mask)==0 then
				local c=sget(sx+srcx,sy+srcy)
				if c!=trans then
				 if (shad_dist) pset(x+ix,y+iy, 1)
				 pset(x+ix,y+iy-shad_dist, single_col or c)
				end				 
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
 if (flying or not fget(wrap_mget(nx,ny),0) and not fget(wrap_mget(nx,ny),7) and not object_tiles[nx..","..ny] and nx>=0 and ny>=0 and nx<=63 and ny<=63) add(ntable, {x=nx, y=ny})
end

function manhattan_distance(a, b)
 return abs(a.x-b.x) + abs(a.y-b.y)
end

-- particle related
-- (loosly inspired by @casualeffects' fast particle system)
function add_particle(x, y, r, dx, dy, dr, ddy, life, cols, pattern)
  add(particles, {
    x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,
    life=0,ddy=ddy,
    cols=cols, pattern=pattern,
    y_orig=y, life_orig=life }, 1)
end





__gfx__
bbbbbbbbbb171bbbb7bbbb7bbbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbbb9bbbbb95555555d555555d155dbbbbbbbbbb
bb11bbbbb17771bb77bbbb77bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99bb99bbbbbbbd5515555555515555d59bbb9d5d9b
bb171bbb1711171bbbbbbbbb0000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9bb9bbb79bbbd555d5515d5d5555d515db55515515
bb1771bb7717177bbbbbbbbb07700077bbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
bb17771b1711171bbbbbbbbb00777770bbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99bbb99bbbbbd55d55155155555d515559b155555d5
bb177771b17771bbbbbbbbbb07700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb79bbbbbbd515d55d555d5555d555dbbd55d5555
bb17711bbb171bbb77bbbb770000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb99bbbbb9b95d5555555555155155dbbb5d555d15
bbb11bbbbbbbbbbbb7bbbb7bbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbbb99bbbd551d5515d555d555559bb55515555
55551d51bbbbbbbbbbbbbbbbbd5d555555d555dbdddddddddddddddd55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d55d5155bbbbbbdddbbbbbbbbd5551551555d5dbd5555555d55555551555515d4444444444555155544444444444444444444444544224222242224442422442
5155555dbbbb9d5555d9bbbbbb55d5555d5555bbd5015515d55555555d55d444444444444445d555444444444444444444444444524442444424442224444221
5d55d555bbbd555d5555dbbbbbd15d5d55555dbbd5105555d5555555555d4444444444444444445d444444444444444444444442522222212222222242222110
55d555d1bb955555d55559bbbb955555d555d9bbd5555111d5555555555444444444444444444445444444444444444444444422502112121121122121121200
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242550221200012210012100005
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240555000055000000500055555
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d555555555444444444444444444444444444444444444444444442155555555555555555555d555
bbbbbbbbbbb9bbbbbbbbbbbbbbbbb1b1bbbbbbbb1b1bbbbbbb0ee0bbbbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbb0000000010bbbbbbb0000000000000000
bbbbbbbbbb66669bbbbbbbbbbbb1bb00b6bbbbbb00bb1bbbbb5c65bbbbbbbbbbbb676bbbbb676bbbb0000000bbbbb1000000000b00bbbbbbb000000b00000000
bbb777bbb66dd66bbd5bb5bbbb1b0000bbbbbb6b0001b1bbbb0c60bbbbbbbbbbbbb7bbbbbbb7bbbb1b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
bb77994bb6d55d6bb5dbbbbbb1b00000bbbbbbbb00000b1bbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
bb79994bb6d55d6bbbbb555bbb000000bbbbbbbb000001bbbbbc7bbbbbb1b1bb7e777e7bbb676bbbb1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
bb79944bb66dd66bbbbb5d5b1b000000bbb6bbbb000000b1bb0cc0bbbb1b1b1bbbb7bbbbbbb7bbbbbb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
bbb444bbbb6666bbbbbb555bb0000000bbbbbbbb0000000bbb5dd5bbb000000bbbbcbbbbbbbcbbbbbbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
bbbbbbbbb9bbbbbbbbbbbbbb10000000bbbbbbbb00000001bb0cc0bb00000000bbbbbbbbbbbbbbbbbbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cb0cecec0bb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbec6c6cebb6d7d6bbd4c455444444549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debee6e6eebb6d4d6bb4a042499999442424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebec0c0cebb69996bb49029999c0994422229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0b00ccc00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a99442d1542425d44411114555224225ff2225
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbbddbbbbbdadbbbbbb77bbbd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d5555555bbd66dbbbb666bbbc767767cd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55bbd66dbbbbb6bbbbc767767cd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbbddbbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5d5555555d5d1b115d6ddcdd551110001ddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc0556dd577765d5555ddd6dd0dd55d110001d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d55766116555c055d6dd15d1d1510c01d5558555b1b11b1bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd57661bb155ee0ddd1ddd500155560d5d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad55550556d76101b105d5055d1111005dddd6d15d55aaa55b651156b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d576000b015d5055d111100111111105d5555555b7b55b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5d600b015d6d555d511005555551015d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d55d1b1155d5d555d555555555555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd52d0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d5120001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5511111766d0d66d542222222222245d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d55555556d666662d52c02c020200225d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5ee0ee022200225d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d55555556dd00022d551011011111115d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d555555552202021d555011011111155d222444455550550944242424294ddd2
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
0400800004040404040404060808080808080808080208010101010101010101060606010400000000000000000000010000000000000000000001010101010101010001000102010000010101020201010101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
05050505064400006800680042000d0d140405050506131014040505061344000068004200000000008565000000000000000011120000004940000d0d0d2f2f0000000405050505090909090500000000000000000a00000000000000000000000000000000000000110d0d14070600000000000000000a0505050508000000
050505050a0000000000000000000405050505080505050505050505050600000000000000000000001600000012000000000042004200420000001404052f2f0000000505050509090909050500000000000000000000000000000000000000000000000000000000130d140000000000000000000000000000000000000000
05050506858542004200650000000a050508110f120a050909050505050557858585858557000000001662000016000000001100000000000085850405052f2f12000405090505050909090505050600000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050613850000000000000085000a081116161612050509090505050585853a00008585120000001600000016000000005785858585858585040505052f2f140005090905050909050509090905000000000000000a0000110f0d0f12000000110f0d0f1200000000000000000000000000000b0b0b000000000000000000
05050505068585858585858585851249113a00001616120a05050505050585160000001685160000008585858585000000161610101010101404050505052f2f00000a05050a0505050505090905050600000000000000110f0d0d0d0d0d0000110d0d0d0d0d0f1200000000000000000000000b0b0b0b0b0000000000000000
0a210505050613570d0d101016164000160000006200001205050505050885850000008585166e00161616161616161616160004050505050505050505052f2f00000000000000000000050509090505000000000000000d0d0d0d0d0d1400000c0d0d0d0d0d0d0d0f0f12000000000000000405060b0b0b0000000000000000
0a0505050905061637140000130d0000160000000000001616120a08001185858516858585160000161614001316161616000405050505050505086800122f2f0000110f0d0f120000000a0509090905060000000000110d0d0d0d0d140000000c0d0d0d0d0d0d0d0d0d0d0f120000000004050505060b0b0b00000000000000
00000005090508160d040507060c856e0085168516856000850e00000013578585858585571685850014040506856e0016000505050505050508110000162f2f110f0d0d0d0d0d1204060005090905050500000000000c0d0d0d1400000000000c0d0d0d0d0d0d0d0d0d0d0d0e000000040509090905060b0b0b000000000000
0000000a050800160e050905051385000085858585850000850d120000000057858585570d101014000005050885000016000505050505050811440000162f2f0d0d0d1d0d0d0d140505050509090909050000000000130d14000000000000000c0d0d0d0d10100d0d0d0d1014000000050505090505050b0b0b0b0000000000
00000000000000160e050509050a858585850d100d858585850d0d120000040505060c0d0e00000000000a081185858557000505050505081136000000162f2f0d1d0d0d0d0d14040505050505050909050000000000000000000011120000000c0d0d0d0e0000000000000000000000050505090905080b0b0b0b0000000000
12000000000057570e05050508000c570d0e000000130d0d57160d0e0004050905050c0d0e000000000000110d0d0d0d0e000405050508858585858585162f2f0d0d0d1010140405050509050509090505000011120000040506110d0d1200000c0d0d0d0e00000000000000000000000a05090905080b0b0b0b000000000000
0e000000000057571405050500000c0d0d0e0000000013101016370d120a050909050c0d0e0000000000110d0d370d0d0d12000a37110f856000650000162f2f0d1014000004050909050505050509090506110d0e00040505050c0d0d0d0000130d0d0d0e0000000000000000000000000a050508000b0b0b00000000000000
0d120000000004050505050500000c0d370e000000000000001616160d12050905080c0d0d12000000110d0d0d0d0d5716161612000a13850000000000162f2f1400000000000a05050800050505050508110d0d0e0005090905130d0d140000000c0d0d0d1200000000000000000000000000000000000b0b00000000000000
0d0d1200000005090909050500000c0d0d0d12000000000000001316160e0a0508110d0d0d0d0f0f0f0d0d100d0d0d163a000016000000008585858585852f2f00000000000000000000000a05050508110d0d0d0e000509090505060000000000130d0d0d0d12000000000000000000000000000000000b0b00000000000000
0d0d0d1200000a05090505050000130d0d0d0d12000000000000000c16160f1200000000130d0d0d0d14000000130d1600000016123700000013856200002f2f0000000000000000000000000000110f0d0d0d0d0e0005050909050500000000000000130d0d0d0f12000000000000000000000000000b0b0b0b0b0000000000
0d0d0d0d12000005050505080000000c0d0d0d0e000000000000000c0d16160d120000000000130d1400000000001316000000160e0000000000850000002f2f0000000000000000000000000015100d0d0d0d0d0e00000a05050508000000000000000000130d101407000000000000000000000000000b0b0b000004050000
0d0d0d0d0e00000a080000000000000c0d0d0d1400000020000000130d0d16160e00000000000000000000000000005716161616160000000000161616162f2f000000000000000000000000000000130d0d0d0d0d1200000a0508000000000000000000040505050505050506000000000000000000000b0b0b040505050000
0d0d10100e000000000000000000000c0d0d1400000000000000000000130d160d120000000000000000200000000000000016400049000037000c166e002f2f00000000000000000000110f0000000000000c0d0d0d120000000000000000110f0e000005050509090905050500000000000000000000000000050909090000
0d14040505062100000000000000000c0d140000000000000000000000000c160d0e0000000000000000000000000000000016000000000000000c1600002f2f000405050600000000110d0d0000000000000c0d0d0d0d12000000110f380f370d14000405050909050505050800000000000000002000000000050909090000
0e04050905050506000000000000001314000000000000000000000000001357570e000000000000000000000000040506000c161600000000000c8585852f2f0005090505060000000c0d0d1200000000000c0d0d0d0d0d0f0f0f0d300d0d0d0e000000000a05050509051112000000000000000000000000000a0505090000
0e05090905050505000000000000000000000000000000000000000000000057570e00000000000000000000000a050505001642000000000000131057372f2f0005050905050000000c0d0d0d00000020000c0d0d0d0d0d0d36440d0d01220d360000000000000a0505080c0e00000000000000000000000000110e05090000
0e0a05050505050800000000000000000000000000000000000000000000110d0d140000000000000000000505050509050057000012000000150000000d2f2f0005090909050000000c0d0d0d12000000110d0d0d0d0d0d0d0d0d0d0d22220d0e000000000000000000000c0d12000000000000000000000000000405050000
0d0f0f120a000000000000000000000004050600000000000000000000110d0d14000000000000110f0d0f120509050505001657440000160e00000000132f2f0005090909050000000c0d0d0d0d0f0f0f0d0d0d0d0d0d0d0d6a0d0d4942160d37000000000000000000000c0d0d0f1200000000000000000000000a05080000
0d0d0d0e00000000000000000000040505050500000000000a00110f0f0d0d14000000000000000c0d0d0d0e0509090905001316000000160000000000002f2f0a05050505080000000c0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d340d0d0d0d0e0000000000000000000013100d0d0d12000000000000000000000000000000
1010101400000000000000000405050909090500000000000000130d10101400000000000000000c0d0d1014050509050800000c140000000000000000002f2f0000000000000000000c0d0d0d0d0d1014000000000c0d0d0d0d100d100d380d0e000000000000000000000000130d0d0e000000000000000000000000000000
0000000000000000000000000509090905050506000000070000000000000000000000000000000c0d1400040505050800000000000000000000000000002f2f0000000000000000000c0d0d0d0d14000000000000130d0d0d14000000130d0d0e00000000000000000000000406130d0e000000000000000000000000000000
0000000000000000000000000a05090905080b0b000000050000000000000000000000000000110d140000000a050800000000000a0000040506000000002f2f000000000000000000130d0d0d1400000000000000000c0d140000000000130d14000000000000110e040505050506130d0f1200000000000000000000000000
000000000000000000000000000a0505080b0b0b000000050600000000000000000000110d0d0d0e000000000000000000000000000405050505050506002f2f00110f0e0000000000001310140000000000000000001314000000000000000004050a0000000000000509050505050506130d0e000000000000000000000000
0000000000000000000000000000000b0b0b0000000000000000000000000000000000130d0d0d14000004050505060000000000000005090905050505062f2f00000000000000000000000000000000000000000000000000000000000005050505050600000000040509090509090905000000000000000000000000000000
0000000000000000000000000000000000000000000000000000004200000000000000000000000000000005050505000000000a00000a050909090909052f2f0000000000000000000000000000000000000000000000000004050507000a050505080b0b000000050505050505050508000004050505060000000000000000
0000000000000000040505060000000000000000000000000000000000000000000000000000000000040505050508110f0e0000000000050505050905082f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000004050505090505060000000000000000000000000000000000000000000000000000000000110f0f0f0f0d14000000000000050505090905002f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
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
01040000039230531308933093130b9430d3130e95310313129631331314973153131696315313149531331311943103130f9330d3130c9330a31308923073130592303313019130031308303073030430301303
0109000020f1220f2220f3220f4220f5220f6220f7220f6220f5220f4220f3220f2220f1220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f02
010900002cf122cf222cf322cf422cf522cf622cf722cf622cf522cf422cf322cf222cf122cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf02
010400000647307b710a6730cb711093313631159331ab510145302b510565307b310b9330e6211092315b410044300b410064302b4106923096210b92310b210041300b110061300b110191304611069130bb11
01020000104230db53306532db532b953276532495323b53206531f4531c9531b6531895316b531564313b4312943104430f9430db330b63309b3308923066230492303b230162300b2300933002150094300615
00040000049132ff13069132cf13039132af23049230592327f230693326f330493325f430694325f430494328f430794329f430a94326f530595324f530795329f2321f432cf632ff7330610306103061030615
010400002b72418765187641876518764187551875418755187541874518744187451873418735187341872518724187251870418705187041870518704187051870418705187041870518704187051870418705
010800003a9703a9523a925249003a9703a9503f9703f9503f9403f9323f9203f9103f91518900189000090000900009000090000900009000090000900009000090000900009000090000900009000090000000
010200002cd732cd732cd732cd732cd632cd632cd632cd632bd132bd532ad532ad1329d5329d4328d4327d4326d132594324d432293320d331e9031cd331a93319d0317d231592313d131191300d0300d0300d03
000200000fd130452011d33107301ad43157501fd531b76326d601d76332d70157732ed600b7632ad600975323d50057431cd400673316d200a72310d10027130ad15007030dd0009d0006d0003d0001d0001d00
0101000030e71189753fe000000000000000000d97118e75000000000000000000003097118e7500e0018e0116e0100e0113e0111e0100e010de010ce0100e0109e0107e0100e0105e0104e0100e0101e0100e01
0102000033b6131863006102f86316b61006101eb531c851006101885116b430061013b4311841006100d8410cb430061009b3307831006100582104b230061001b1100811006140061507b0007b0006b0105b01
010100003062030610306203c6103c6203c6100060000600006000060000600006000060000600006000060000600006000060000600006000060000600006003060030600306003c6003c6003c6000060000600
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

