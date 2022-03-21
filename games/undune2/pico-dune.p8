pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- undune ii
-- by paul nicholas

cartdata"pn_undune2"

-- data flags
local p_level,ai_level,p_col1,p_col2,mapsize,bases,credits = dget"0",dget"1",dget"7",dget"8",dget"26",{},
{
 dget"35", -- p
 2500,     -- ai
 dget"36"  -- targ
}

for i=1,dget"5" do
 local base={}
 for j=1,5 do
  base[j]=dget(i*5+j)
 end
 add(bases,base)
end


-- fields
local g_,buildings,units,object_tiles,radar_data,spice_tiles,particles,has_obj,start_time,t_,build_dest,unit_dest,keyx,keyy,radar_frame,msgcount,fow,cam_max,sel_build_item_idx={},{},{},{},{},{},{},{{},{}},t(),1,{0,0},{0,0},0,0,0,0,{},mapsize*8-128,0
local total_spice,ai_awake,last_cmd_time={0,0},{},0

g_.factory_click=function(self)
 if self.parent.owner==1 then
  menu_pos,ui_controls,selected_subobj=1,{}
  -- ui buttons
  m_button(6,"⬆️",function()
   sel_build_item_idx=mid(1,sel_build_item_idx-1,#selected_obj.valid_build_objs)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]
   if (sel_build_item_idx<menu_pos) menu_pos-=1
  end, 10)
  m_button(17,"⬇️",function()
   sel_build_item_idx=mid(1,sel_build_item_idx+1,#selected_obj.valid_build_objs)
   selected_subobj = selected_obj.valid_build_objs[sel_build_item_idx]   
   if (sel_build_item_idx>menu_pos+2) menu_pos=min(menu_pos+1,#selected_obj.valid_build_objs-2)
  end, 10)
  m_button(32,selected_obj.id==5 and "order" or "build",function()
   show_menu=nil
   if (last_selected_subobj) last_selected_subobj:func_onclick()
  end)
  m_button(96,"close",function()
   show_menu=nil
  end)
  -- show build menu
  show_menu=self
 end
end
g_.draw_refinery=function(self)
  local col2=self.col2
  pal({nil,nil,nil,nil,nil,nil,nil,col2,nil,col2,col2,self.col1,nil,col2})
  if self.incoming then
   pal(self.col_cycle[self.col_cycle_pos], self.col1)
  else
   pal(11,self.col1)
   self.col_cycle_pos=1
  end
end
local draw_action=function(self)
 pal(7,8)
 if (self.id==80 and selected_obj.process==2 and not selected_obj.procpaused) pal(7,11)
end
function process_click(self, mode)
  self.procstep,self.last_process,self.process=0,self.process,mode
  if (self.last_process>0) self.procpaused=not self.procpaused
  if (mode==1) self.parent.incoming=true self.parent.build_obj=self
end

-- object data
local obj_data=[[id|obj_spr|map_spr|my|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_size|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|life|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|storage|capacity|is_repairable|ai_build|ai_priority|moves|tracked|on_foot|is_building|is_unit|is_dockable|capturable|can_fire|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|fow_range|req_level|col_cycle|name|description|func_draw|func_onclick
1|64|64||170|2|2|2|0||nil|||||||2|2|1|||100|0||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||3|1,1,1,1||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||factory_click
2|22|22||162|2|2|2|0||1|||||7|5|2|2|1|||20|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0.5|nil||nil|1|nil|nil|nil|nil||1|nil|||3|4,4,4,4||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22||162|2|1|1|0||1|||||6|6|2|2|1|||5|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil||nil|1|nil|nil|nil|nil||1|nil|||2|1,1,1,1||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|131|131||224|2|2|2|0||1|||||||2|2|16|||500|40||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||4|7,7,7,7||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
5|61|61||228|2|3|3|0||1|||||11|3|2|2|17||1|500|50||500|0||||||53|nil||8|0|0|0|0|0|1|1|11|0|nil|1|nil|25|nil||nil|1|nil|nil|1|nil||1|1|||5|6,6,6,6|11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|draw_refinery|factory_click
6|101|101||166|2|3|2|0||1|||||||2|2|14|||500|35||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||4|5,5,5,5||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||factory_click
7|98|98||142|2|3|2|0||1|||||||2|2|14|||600|20||200|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|60|nil||nil|1|nil|nil|1|nil||1|1|||4|4,4,4,4||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||factory_click
8|87|87|2|234|1|1|1|1|11|1|||||||2|2|16|||250|20|60|200|0|10|2|1.9|40|59|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|7.5|nil||nil|1|1|nil|1|1||1|1|0|0|6|6,6,6,6||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
9|128|128||230|2|3|2|0||1|||||||2|2|14|||700|20||200|0||||||53|nil||2|0|0|0|0|0|1|1|8|0|nil|1|nil|60|nil||nil|1|nil|1|1|nil||1|1|||4|5,5,5,5|0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
10|71|71|0|232|1|1|1|1|11|1|||||||2|2|16|||125|10|20|200|0|5|1|0|27|58|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|nil||nil|1|1|nil|1|1||1|1|0|0|3|5,5,5,5||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
11|110|110||138|2|2|2|0||1|||||||2|2|16|-1||400|10||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|17.5|nil||nil|1|nil|nil|nil|nil||1|1|||4|4,4,2,4||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||factory_click
12|108|108||168|2|2|2|0||1|||||11|3|2|2|16|-3||300|10||300|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||3|2,2,2,2||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||factory_click
13|133|133||164|2|1|1|0||1|||||||2|2|16|||50|0||50|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|3|nil||nil|1|nil|nil|nil|nil||nil|nil|||2|4,4,4,4||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
14|96|96||140|2|2|2|0||1|||||||2|2|17|||400|20||350|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||4|2,2,3,2||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||factory_click
15|104|104||134|2|2|2|0||1|||||||2|2|17|||150|5||150|0||||||53|nil|||0|0|0|0|0|1|1||1000|nil|1|nil|15|nil||nil|1|nil|nil|1|nil||1|1|||3|2,2,2,2||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
16|106|106||136|2|2|2|0||1|||||||2|2|17|||400|30||500|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|27.5|nil||nil|1|nil|nil|nil|nil||1|1|||6|2,2,2,2|8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
17|68|68||174|2|3|2|0||1|||||||2|2|18|||400|30||450|0||||||53|nil||8|0|0|0|0|0|1|1|11|1000|nil|1|nil|30|nil||nil|1|nil|1|1|nil||1|1|||4|1,1,1,1|11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|draw_refinery|
18|66|66||172|2|2|2|0||1|||||||2|2|1|||300|-100||200|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||3|1,1,1,1|12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
19|58|58||226|2|3|3|0||1|||||||2|2|5||1|999|80||1000|0||||2,400||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|40|nil||nil|1|nil|nil|nil|nil||1|1|||5|8,8,8,8||pALACE|tHIS IS YOUR pALACE.||
20|48|127||194|1|1|1|1|11|11|||||5|5|2|2|11|-1||200|0|8|110|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|5|1|nil|1|nil|1|nil||1|1|nil|nil|||3|3,3,1,3||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
21|49|111||194|1|0.5|0.5|1|11|11|||||12|9|2|2|11|-1||100|0|4|45|0.07|5|2|1|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|1|nil|1|nil||1|1|nil|nil|||3|3,3,1,3||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
22|48|48||236|1|1|1|1|11|12|||||15|3|2|2|12|-3||100|0|4|50|0.03|3|1|0|15|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|2|1|nil|1|nil|1|nil||1|1|nil|nil|||3|2,2,2,2||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
23|49|49||236|1|0.5|0.5|1|11|12|||||15|3|2|2|12|-3||60|0|6|20|0.05|3|1|0|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|1|nil|1|nil|1|nil||1|1|nil|nil|||3|2,2,2,2||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
24|48|253||236|1|1|1|1|11||||9|4|9|1|2|2||1||0|0|16|220|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|1|nil|1|nil||1|nil|nil|nil|||3|8,8,8,8||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||2||0|0|400|10|0.27|1|1|0|800|60|57|1|49|8|0|0|0|0|0|1|1||0|nil|nil|nil|70|1|nil|1|nil|1|nil||1|nil|nil|nil|||nil|8,8,8,8||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||||0|0|16|110|0.1|5|2|1|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|5|1|nil|1|nil|1|nil||1|nil|nil|nil|||3|4,4,4,4||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
30|57|57|26|198|1|1|1|1|11|7|||||12|9|2|2|4|1||600|0|60|110|0.2|9|3|0|27|52|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|11|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|5|7,7,7,7||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
31|54|202|12|202|1|1|1|1|11|7|||||11|3|2|2|4|2||750|0|0|120|0.2|9|1.9|1.9|60|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|17.5|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|6|7,7,7,7||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
32|56|56|28|200|1|1|1|1|11|7|||8|12|||2|2|4|3||800|0|80|400|0.07|8|2|1|33|61|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|18|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|5|8,8,8,8||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
33|20|40|20|160|1|1|1|4|11|6|||||||2|2|4|-3||600|0|37|1|0.80|4|2|1.9|33|59|54|nil|22|8|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|nil|7,7,7,7||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
34|54|54|12|202|1|1|1|1|11|7|5||||15|4|2|2|17|-2||450|0|150|100|0.2|10|2|1.9|40|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|6|5,5,5,5||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
35|55|55|10|198|1|1|1|1|11|7|5||||15|4|2|2|17|||600|0|60|300|0.13|6|1|0|30|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|5|6,6,6,6||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
36|53|53|8|196|1|1|1|1|11|7|5||||||2|2|17|||300|0|25|200|0.17|5|1|0|27|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|10|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|4|4,4,4,4||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
37|38|38|24|192|1|1|1|1|11|7|5||||0|5|2|2|17|||900|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|1|nil|nil|nil|1|nil||1|nil|1|nil|8|7|3|4,4,4,4||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
38|50|50|14|192|1|1|1|1|11|7|5||||12|12|2|2|17|||300|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|0|1|1|15|1|1|nil|nil|1|nil||nil|nil|1|nil|8|7|3|2,2,2,2||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
39|73|73|16|238|1|1|1|8|11|6|5||||11|3|2|2|17|||800|0|0|100|1.33|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1.6|1|nil|nil|nil|1|nil||nil|nil|1|nil|8|7|nil|5,5,5,5||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
41|52|52|6|206|1|1|1|1|11|14|5||||||2|2|1|||200|0|14|130|0.27|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|3,3,3,3||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
40|51|205|4|204|1|1|1|1|11|14|||||11|1|2|2|1|2||150|0|10|80|0.4|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|2,2,2,2||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
42|51|51|4|204|1|1|1|1|11|14|5||||15|4|2|2|1|1||150|0|8|100|0.3|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|5|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|2,2,2,2||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
50|72|72|30||1|1|1|8|11|||0|||||2|2||3||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|nil|8,8,8,8||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
50.5|72|72|30||1|1|1|8|11|||0|||||2|2||4||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|nil|8,8,8,8||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
61|88|88|||9|1|1|1|11||||||||2|2||||0|0|300|1000|0.35|0|||7|50||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|nil|nil|||nil|nil|nil||||3,3,3,3||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
43|32|32|||1|1|1|1|11|||2|||||1|1|||||||1|0.1||||||53|1|||0|0|0|0|0|1|1||0|nil|nil|nil|0|nil|nil|nil|nil|nil|nil|||nil|nil|nil|||nil|1,1,1,1||sPICE bLOOM|||
80|3|3||3|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||1,1,1,1||rEPAIR||draw_action|action_click
81|1|1||1|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||1,1,1,1||lAUNCH||draw_action|action_click]]
-->8
--p8 functions
--

function _init()
 -- "locked" mouse
 poke(0x5f2d, 0x5)

 -- explode object_data
 local str_arrays=split2d(obj_data,"|","\n")
 obj_data={} -- keep global!
 -- objects
 for i=2,46 do
  local new_obj={}
  -- properties
  for j=1,69 do
   local val=str_arrays[i][j]
   if (j<64) val=tonum(val)
   if j==67 then
    --restore new lines
    str_breaks,val=split2d(val,"~"),""
    for line in all(str_breaks) do
      val..=line.."\n"
    end
   end
   new_obj[str_arrays[1][j]]=val
  end
  obj_data[str_arrays[i][1]]=new_obj
 end

 -- init fog of war?
 for i=-5,67 do
  fow[i]={}
  for l=-5,67 do
   fow[i][l]=0 --(16 for all)
  end
 end


 -- discover_objs()
 for my=0,31 do
   for mx=0,125 do
     local spr_val,objref = mget(mx,my)
     -- player start pos
     if (spr_val==171) camx,camy,objref=dget"27",dget"28",obj_data[1]

     for o in all(obj_data) do         
      if (o.map_spr==spr_val) objref=o break       
     end
     if objref and spr_val>=32 then --don't create "concrete" as objs
       local ox,oy=mx,my
       if (ox>63) oy+=32 ox-=64
       mset(mx,my,wrap_mget(mx,my+1))
       m_map_obj_tree(objref, ox*8, oy*8)
     end
   end
 end
 
  

 -- worker
 worker_cor = cocreate(function()
  while true do

  if t_%30==0 then
   
   set_loop(false) -- must stay boolean
   
   -- update "blocker" positions
   object_tiles={}
   for unit in all(units) do
    object_tiles[get_tile_pos_index(unit)]=unit
   end

   local new_radar_data={}
   -- landscape/fow
   if hq then
    for i=0,62,2 do
      for l=0,62,2 do
       local mspr_off=wrap_mget(i,l)*8
       if(fow[i][l]==16) new_radar_data[(i/2)..","..(l/2)] = mspr_off>0 and sget(mspr_off%128+3, mspr_off\128*8+3) or 15
      end
      yield()
    end
   end  

   -- -- structures
   -- reset vars for this pass
   power_bal,total_storage,building_count,has_obj = 0,0,{0,0},{{},{}}

   for building in all(buildings) do
    -- walls?
    if building.id!=13 then
     -- if our building, or ai visible
     if building.owner==1 or hq and is_visible(building) then
      new_radar_data[(building.x\16)..","..building.y\16] = building.col1
     end
     -- track power/radar
     if building.owner==1 then
      power_bal-=building.power
      total_storage+=building.storage
     end
     -- track counts & objs
     building_count[building.owner]+=1
     add_with_init(has_obj[building.created_by], building.id, building)
     -- allow buildings to be "found" by units     
     object_tiles[get_tile_pos_index(building)]=building
    end
   end
      
   -- units
   for unit in all(units) do
    -- if our unit, or ai not under fog of war
    if hq and (unit.owner==1 or is_visible(unit) and not unit.flying) then
     new_radar_data[(unit.x\16)..","..unit.y\16] = unit.col1
    end
    if (unit.created_by>0) add_with_init(has_obj[unit.created_by], unit.id, unit)
   end
  
   -- has radar-outpost + enough power?
   hq,radar_data = has_obj[1][16] and power_bal>0,new_radar_data

   -- radar > user mem
   local off,mval=0
   for yy=0,30 do
    for xx=0,31 do
     local val=radar_data[xx..","..yy] or 0
     if xx%2==0 then 
      mval=val
     else
      mval|=val<<4 poke(0x4300+off,mval) mval=0 off+=1
     end
    end
    if (yy%2==0) yield() --save cpu
   end

   -- check end states
   --
   -- p credits >= quota
   if (credits[3]>0 and credits[1]>=credits[3]) endstate=1
   -- ai has no buildings
   if (building_count[2]==0 and p_level>1) endstate=2
   -- p has no buildings
   if (building_count[1]==0) endstate=3

   -- game over?
   if endstate then
    -- save state
    local offset=40
    for data in all{endstate,t()-start_time,total_spice[1],total_spice[2],unit_dest[1],unit_dest[2],build_dest[1],build_dest[2]} do
     dset(offset, data)
     offset+=1
    end 
    ?"\^jae\+8h\#0\^w\^t         \^-w\^-t\^d2\^jaf\-cmission "..(endstate<3 and "complete" or "failed"),p_col1
    load"pico-dune-main"
   end  
  end

  yield()

  end

 end)


 music"7"
 shake=0

 -- init worm
 worm_segs,worm_dir,worm_turn,worm_frame={split"250,250"},rnd"1",0,0

end

function fact_allowed(src_obj,dest_fact)
 local req_fact=src_obj.req_faction 
 return not req_fact
      or req_fact==dest_fact 
      or (req_fact<0 and req_fact!=-dest_fact)
end

function m_map_obj_tree(objref, x,y, owner, factory) 
  local newobj=m_obj_from_ref(objref, x,y, objref.type, nil, g_[objref.func_init], g_[objref.func_draw], nil)
  -- 0=auto, 1=player, 2=computer/ai
  newobj.ico_obj,newobj.life,newobj.owner = m_obj_from_ref(objref, 107,0, 4, newobj, nil, nil, g_[objref.func_onclick]), objref.hitpoint, newobj.owner or owner
  if factory then
   --created by factory
   newobj.base_idx=factory.base_idx
  else
   -- explicitly stated...
   if newobj.owner then
    -- assume player-owned
    -- (only wrong with blooms, but player can still attack)
    newobj.base_idx,base=1,bases[1]
   else 
     --calc closest base/owner
    local best_dist=9999
    for i=1,#bases do
      local curr_dist=dist(x,y,bases[i][4],bases[i][5])
      if (curr_dist<best_dist) newobj.base_idx,newobj.owner,best_dist=i,min(i,2),curr_dist
    end
   end
  end
  
  newobj.created_by,newobj.build_objs,base = owner or newobj.owner,{},bases[newobj.base_idx or factory.base_idx]
  new_faction=base[1]
  newobj.faction,newobj.col1,newobj.col2 = new_faction,base[2],base[3]
  
  -- check faction is "allowed" obj
  if (not fact_allowed(newobj,new_faction)) return

  -- check validity
  for o in all(obj_data) do
    if o.parent_id
     and (o.parent_id==newobj.id or o.parent2_id==newobj.id)
     and split(o.req_level)[new_faction]<=p_level
     and fact_allowed(o,new_faction)
    then
      add(newobj.build_objs,
        m_obj_from_ref(o, 107,0, 5, newobj, nil, nil, function(self)
          -- building icon clicked
          if show_menu then
            selected_obj=self
          else
            if self.is_building and #buildings<150 or self.is_unit and #units<75 then
             --auto build
             process_click(self, 1)
            elseif newobj.created_by==1 then
             set_message"uNABLE TO CREATE MORE"
            end
          end
        end)
      )
    end
  end
  
  -- override cols?
  if objref.col1 then
   newobj.col1,newobj.col2 = objref.col1,objref.col2
  end
  
  -- (flying objs don't reveal map)
  if (newobj.flying) newobj.owner=0

  local xpos,ypos = x\8,y\8
  
  -- building props?
  if objref.is_building and not objref.is_unit then
    if (placement_damage) newobj.life/=2
    -- prepare the map?
    local slabs = objref.obj_spr==22
    for xx=0,objref.w-1 do
      for yy=0,objref.h-1 do
       if not slabs or fget(wrap_mget(xpos+xx, ypos+yy),5)
        and not get_tile_obj(xpos+xx, ypos+yy)
       then
        wrap_mset(xpos+xx, ypos+yy, slabs and 22 or newobj.owner==1 and 81 or 103)
       end
      end
    end
    if (not slabs) add(buildings,newobj)
    -- refinery?
    if newobj.id==17 and not newobj.parent then
     -- auto-create harvester
     create_harvester(newobj)     
    end
  else
    -- unit props
    newobj.r=not newobj.norotate and (xpos%8)*.125
    -- fighting units
    if newobj.can_fire then
     newobj.fire=function(self)
       -- now firing, fire bullet/missile
       self.state,self.bullet_x,self.bullet_y,self.bullet_tx,self.bullet_ty = 4,self.x+4,self.y+4,self.target.x+self.target.w/2,self.target.y+self.target.h/2
       -- normalize dx,dy
       local dx,dy = self.bullet_tx-self.bullet_x,self.bullet_ty-self.bullet_y
       local d=sqrt(dx*dx+dy*dy)
       self.bullet_dx,self.bullet_dy = dx/d,dy/d
       ssfx(self.fire_sfx)
       reveal_fow(self,-6)
     end
     -- building AND unit?
     if newobj.is_building then
      -- rocket/cannon turret
      wrap_mset(xpos,ypos,newobj.owner==1 and 2 or 34)
     end
    end

    newobj.name = split"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR"[newobj.faction].." "..newobj.name
    
    -- remember, if refinery
    if (factory and factory.id==17) newobj.last_fact=factory
   
    add(units,newobj)

    do_guard(newobj, nil, true)
  end
  reveal_fow(newobj,1)
  return newobj
end

function m_obj_from_ref(ref_obj, x,y, in_type, parent, func_init, func_draw, func_onclick)
 local obj={  
  ref=ref_obj,
  id=ref_obj.id,
  hitpoint=ref_obj.hitpoint,
  x=x,
  y=y,
  orig_x=x/8,
  orig_y=y/8,
  type=in_type,
  parent=parent,
  func_onclick=func_onclick,
  w=ref_obj.w*8,
  h=ref_obj.h*8,
  orig_spr=ref_obj.obj_spr,
  spr_w=ref_obj.w,
  spr_h=ref_obj.h,
  col_cycle=split(ref_obj.col_cycle),
  flying=ref_obj.z>1,
  get_hitbox=function(self)
    return {
     x=self.x,
     y=self.y-self.z,
     w=in_type>3 and 16 or self.w,
     h=in_type>3 and 16 or self.h
    }
   end,
   draw=function(self)
     local x,y,rot=self.x\1,self.y\1,self.r
     -- skips if off-screen
     if in_type>2
      or (x+self.w>=camx
       and x<=camx+127
       and y+self.h>=camy
       and y<camy+127+self.z)
     then
       pal()
       palt(0,false)
       -- shadow
       if rot then
        ovalfill(x+3, y+3, x+self.shad_w, y+self.shad_h, 1)
       end
       if (self.trans_col and in_type<=3) palt(self.trans_col,true)   
       if (self.faction and self.id!=4) pal(12,self.col1) pal(14,self.col2)
       
       -- icon mode
       if in_type>3 then
         local this = in_type==5 and self or self.parent
         -- bg
         ?"\#0\-j\|g\^x7  \n\-j  \n\-j  \n\-j\^y2  ",x,y
         -- draw health/progress
         local hp = this.hitpoint
         local val = self.process==1 and this.life/6.666 or 15*(this.life/hp)
         if (this.life>0 and not show_menu) rectfill(x,y+17,x+val,y+18, self.process==1 and 12 or (split"8,10,11,11")[this.life\(hp/3)+1])
         pal(11,this.icol1) pal(3,this.icol2)
       end

       -- colour anim?
       if self.col_cycle then
        pal(self.col_cycle_src, self.col_cycle[self.col_cycle_pos])
       end

       
       if (flr(self.flash_count)%2==0) pal(split"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")

       -- pre-draw override?
       if (func_draw) func_draw(self)

       -- rotating obj?
       if rot then
         local cs,ss,ssx,ssy,cx,cy,dx,dy = cos(rot),sin(rot),126.7,self.my-0.3,127.5,self.my+.5,x+3.5,y-self.z+3.5
         ssy -=cy
         ssx -=cx
         local sx,sy,delta_px =cs*ssx+cx,-ss*ssx+cy,-ssx*8 
         for py = dy-delta_px, dy+delta_px do
          tline(dx-delta_px,py,dx+delta_px,py,sx+ss*ssy,sy+cs*ssy,cs/8,-ss/8)
          ssy+=.125
         end
       else
         if in_type>2 then
          -- icon
          spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
          if in_type==5 then
           if ref_obj.is_building then
            fillp"0XAFAF"
            rectfill(x+15,y+15,x+15-(self.spr_w*2),y+15-(self.spr_h*2),245)
            fillp()
           end
           if self.procpaused and not show_menu then
            ?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666"
           end
          end
         else
          -- unit/obj
          spr(self.obj_spr, x, y, self.spr_w, self.spr_h)
         end
       end
     end

     if in_type<=2 then
      -- bullets/missiles
      if self.bullet_x then      
       if self.fire_type==1 then
        -- shell
        pset(self.bullet_x,self.bullet_y, rnd{8,9})
       else
        -- missile/sonic wave
        local is_missile = self.fire_type<=2
        add_particle(
         self.bullet_x, self.bullet_y, 
         self.fire_size,
         0, 0,
         is_missile and -.3 or 1,
         0,
         is_missile and 10 or 2.5, 
         is_missile and split"7,10,9,8,2" or split"7,15")
       end
      end
      -- smoking?
      if ((self.obj_spr==72 or self.life<self.hitpoint/2 and self.can_smoke) and chance"7") add_particle(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,split"10,9,8,6")
     end

   end,
   update=function(self)
     local life,id,hitby = self.life,self.id,self.hitby
     self.flash_count=max(self.flash_count-.4,1)
     -- check for attack (not bloom)
     if self.hit>0 and self.created_by>0 and id!=43 then        
       set_loop(true) -- must stay boolean
       -- switch music (if passed the loop point)
       if (stat"54">5) music"0"
       -- req repair pickup
       if (self.is_repairable and self.moves and life<self.hitpoint/2 and self.state<=6) return_to_fact(self,safe_rnd_has_obj(self.created_by,9) or self.last_fact)
       -- lose soldiers
       if (self.obj_spr<=49 and life<100) self.spr_w,self.spr_h=0.5,0.5
       -- can we retaliate?
       if (self.can_fire and self.state==0) do_attack(self, hitby)
       -- ai building?
       if (self.is_building and self.owner==2) p_attacker=hitby
     end
     -- check for death
     if (in_type<=2 and life<=0 and not self.death_time) self.state,self.death_time,self.cor=5,.25 ssfx(self.death_sfx) shake+=(in_type==2 or self.obj_spr==72) and .25 or 0
     if self.death_time then
      self.death_time-=.025
      if self.death_time<=0 then
        if in_type==2 then         
         -- building?         
         for xx=0,self.spr_w-1 do
           for yy=0,self.spr_h-1 do
             wrap_mset(self.x/8+xx, self.y/8+yy, 21)
             -- create soldiers (will be rnd, due to factions)
             if (self.soldiers_on_destroy and #units<75) m_map_obj_tree(obj_data[rnd{21,23}],self.x+xx*8,self.y+yy*8,self.owner,self)
           end
         end
         del(buildings,self)
         build_dest[hitby.created_by]+=1
        else
         -- unit
         local gx,gy = get_tile_pos(self)
         if (wrap_mget(gx,gy)==0) wrap_mset(gx,gy,33)
         if (id<=10) wrap_mset(gx,gy,21)
         if (self.last_fact) self.last_fact.incoming=false
         if (self.return_to and self.return_to.id==9) self.return_to.col_cycle={0}
         delete_unit(self)
         -- bloom
         if id==43 then
          ping(self,gx,gy,
           function (unit,x,y)
            if (wrap_mget(x,y)==0) wrap_mset(x,y,10)
           end,
           4, true)
         end
         if (hitby) unit_dest[hitby.created_by]+=1
        end
        deselect_check(self)
      else
        -- dying
        if (chance(1) and not self.on_foot) make_explosion(self.x+rnd(self.w),self.y+rnd(self.h))
      end
     end

     -- animated frame + colour cycle
     if self.framecount then
      if t_%self.framecount==0 then
       -- alternate moving frame?
       if self.altframe
        and self.state==2 then
         self.obj_spr=self.orig_spr+(self.altframe-self.obj_spr)
         self.my=self.obj_spr
       end 

       self.col_cycle_pos=(self.col_cycle_pos%#self.col_cycle)+1
      end
     end

     -- update bullets/missiles
     if self.bullet_x then
      self.bullet_x+=self.bullet_dx*2
      self.bullet_y+=self.bullet_dy*2
      -- check for target
      if dist(
       self.bullet_x,self.bullet_y,
       self.bullet_tx,self.bullet_ty) < 2 
      then
       --explosion
       make_explosion(self.bullet_x, self.bullet_y, self.fire_type, self.fire_size)
       -- did it hit (or did unit move)?
       local target=self.target
       if dist(
        self.bullet_x,self.bullet_y,
        target.x+target.w/2,
        target.y+target.h/2) < 4 
       then
        target.life-=self.arms*rnd"1"
        target.hit,target.hitby = self.fire_type,self

        -- deviator specific
        if id==31 and target.moves and chance"5" then
         change_fact(target, self)
         -- stop attacking "converted" obj
         do_guard(self) 
        elseif target.old_fact_data then
         -- revert back to orig faction
         target.faction,target.owner,target.created_by,target.col1,target.col2,
         target.old_fact_data
         =         
         unpack(target.old_fact_data)
         --
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

      if self.process==1 and self.spent>=self.cost then
        self.done,self.life=true,100
        if (self.parent.owner==1) ssfx"56" set_message"cONSTRUCTION cOMPLETE"
        -- auto-deploy units
        if ref_obj.is_unit
         and self.parent_id != 1 then
          -- find nearest point to factory
          local ux,uy=nearest_space_to_object(self.parent)
          m_map_obj_tree(ref_obj,ux,uy,self.parent.owner,self.parent)
          -- reset build
          reset_build(self)
        end
      elseif self.process==2 and life>self.hitpoint then
        -- repair complete
        self.process=0
        -- move unit to safe place?
        if self.is_unit and self.moves then
         -- stop flashing while repairing
         -- go back to guard
         -- find nearest point to factory
         self.return_to.col_cycle,self.state={0},0
         set_pos(self,nearest_space_to_object(self))
        end
      else
        -- continue...

         -- build/repair (only if have money)
         -- note: only reset the procstep if have funds (no free build/upgrades!)
         if transact(-.5,self.process==1 and self.parent or self) then 
          self.spent+=.5
          self.life=self.process==1 and (self.spent/self.cost)*100 or life+1
        end
      end
     end

     -- firing
     self.fire_cooldown=max(self.fire_cooldown-.1)

     -- specific update 
     if self.owner==1 then
      if (id==18) self.name="wINDTRAP (\|f\^:0804061f0c040200\|h\-f"..power_bal..")"
      if (self.storage>0) self.name=ref_obj.name.." ("..flr(strnum/total_storage*100).."%)"
     end

     self.hit=0
   end
  }

 -- copy ref properties to object (where empty!)
 for k,v in pairs(ref_obj) do
  if not obj[k] and v!="" then
   obj[k] = v
  end
 end

 return obj
end

function set_pos(obj,x,y)
 obj.x,obj.y=x,y
end 

function get_tile_pos_index(self)
 local x,y = get_tile_pos(self)
 return x..","..y
end  

function get_tile_pos(obj)
 return (obj.x+4)\8,(obj.y+4)\8
end

function deselect_check(obj)
 selected_obj = selected_obj!=obj and selected_obj
end

function transact(diff, obj)
 if (credits[obj.owner]+diff<0) return false
 credits[obj.owner]+=diff
 if obj.owner==1 and credits[1]%10==0 and strnum!=last_strnum then last_strnum=strnum ssfx"63" end
 return true
end

function make_explosion(x,y,size_type)
  add_particle(x, y, 2, 
         0, 0, .1, -.01, size_type==1 and 5 or 20, size_type==1.9 and split"3,11,3" or split"5,7,5,7,10,8,9,2")
end

function reveal_fow(object,boost_dist,ox,oy)
 
--if(object.owner<=0 or object.id==43 or not object.fow_range) return -- demo mode!
if(object.owner!=1 and object.state!=4 or not object.fow_range) return

 local size,x,y=max(object.fow_range+boost_dist,3),get_tile_pos(object)
 --moving? 
 if (ox) x,y=ox,oy

 for xx=-size,size do
  for yy=-size,size do
   local posx,posy = x+xx,y+yy
   if (dist(x,y,posx,posy)<size-1.5) then
    fow[posx][posy]=16
    for dy=-1,1 do
     for dx=-1,1 do
      test_tile(posx+dx,posy+dy)
     end
    end
   end
  end
 end
end


function _update60()

 -- update_level()
 local mouse_x,mouse_y,mouse_btn=stat"32",stat"33",stat"34"
 --
 left_button_clicked,
 right_button_clicked
  = 
 (mouse_btn==1 and last_mouse_btn != mouse_btn) or btnp"5", 
 (mouse_btn==2 and last_mouse_btn != mouse_btn) or btnp"4"
 
 if not cursx then
  -- initial pos
  cursx,cursy=64,64

 elseif mouse_x==lastmx and mouse_y==lastmy then
  -- keyboard input
  local b=btn()
  cursx+=b\2%2-b%2
  cursy+=b\8%2-b\4%2
 else
  -- mouse moved
  cursx,cursy = mouse_x,mouse_y
 end

 -- update cursor/mouse pos/cmd state
 cursx,cursy,lastmx,lastmy = mid(cursx,127),mid(cursy,127),mouse_x,mouse_y
 cx,cy=(camx+cursx)\8,(camy+cursy)\8 
 last_cmd_time+=1

 --
 -- game mode
 --
 if not show_menu then 
  -- auto-scroll (pan) map
  if (cursx<2) camx-=2
  if (cursx>125) camx+=2
  if (cursy<2) camy-=2
  if (cursy>125) camy+=2

  -- lock cam to map + calc score
  camx,camy,strnum = mid(camx,cam_max),mid(-10,camy,cam_max),tostr(flr(credits[1]))


  -- sandworm
  -- 

  -- movement/turning
  if t_%6==0 and worm_frame==0 then
    if (chance"18") worm_turn=rnd".04"-.02
    -- ref to head
    head_worm_x,head_worm_y=worm_segs[#worm_segs][1],worm_segs[#worm_segs][2]
    add(worm_segs,{head_worm_x+sin(worm_dir),head_worm_y-cos(worm_dir)})
    worm_dir+=worm_turn
    -- check collision
    local unit=get_tile_obj((head_worm_x+4)\8,(head_worm_y+4)\8)
    if unit and not unit.flying and fget(wrap_mget(get_tile_pos(unit)),2) then
     delete_unit(unit)
     worm_frame=1
     ssfx"50"
    end
   end   
  if (#worm_segs>30) del(worm_segs,worm_segs[1])
  if (worm_frame>0) worm_frame+=1 add_spice_cloud(head_worm_x,head_worm_y,rnd"1")
  worm_frame%=200

  -- update all unit coroutines 
  -- (pathfinding, moving, attacking, etc.)
  for unit in all(units) do
   if (unit.cor) then
    if (not coresume(unit.cor, unit)) unit.cor=nil
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
   -- death
   if (p.life>=p.life_orig) del(particles,p)
  end
    
  if t_%ai_level==0 then
   --printh("update_ai()"..t_)

   local ai_building,unit,ai_palace=rnd(buildings),rnd(units),safe_rnd_has_obj(2,19)

   -- build units/repair
   -- 
   if ai_building.owner==2    
    and (not ai_building.build_obj or ai_building.build_obj.process!=1)
   then
    -- build rnd unit
    local u=rnd(ai_building.build_objs)
    if u and u.ai_build 
     and t()>450 -- give player 7.5mins head-start
    then
     u:func_onclick()
    end

    -- repair?
    if ai_building.life<ai_building.hitpoint and ai_building.process!=2 then
     -- auto-repair
     process_click(ai_building, 2)
    end
   end

    -- attacks
    --
    -- find ai unit and attack player  
   if (ai_awake[unit.faction] or t_%18000==0) --default=18000 (every 5 mins)
    and unit.owner==2 
    and unit.can_fire 
    and unit.state==0 
   then
    -- are we under attack?
    if p_attacker then
     do_attack(unit, p_attacker)
     p_attacker=nil
    else
     attack_rnd_enemy(unit)
    end
   end
   
   if ai_palace
    and ai_awake[ai_palace.faction]
    and ai_palace.fire_cooldown<=0
    then
     attack_rnd_enemy(ai_palace)
   end

  end

  -- bg work
  coresume(worker_cor)
 end
 
 -- check all collisions
 clickedsomething=false 

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
 if (stat"34">0 or left_button_clicked or right_button_clicked)
    and not show_menu 
    and cursx>91 and cursx<123
    and cursy>91 and cursy<123 then
      -- clicked radar
      selected_obj=last_selected_obj -- always do this, in case an obj under rader will select
      -- move via radar?
      if (stat"34"==1 or left_button_clicked) and can_move_selected_unit_pos_with_cor((cursx-91)*2, (cursy-91)*2) then       
       -- done
      elseif last_cmd_time>10 then
       camx,camy = mid((cursx-96)*16, cam_max),mid(-10,(cursy-97)*16, cam_max)
      end

 -- clicked something?
 elseif left_button_clicked then
 
  if clickedsomething then   
    -- force update message
    if (selected_obj) msgcount=0
    
    -- clicked factory/quick-build icon?
    if not show_menu and selected_obj.parent then 
     if (selected_obj.func_onclick) selected_obj:func_onclick()
     selected_obj=last_selected_obj     
     goto skip_collisions --return
    end
    -- button?
    if (show_menu and selected_subobj.text and selected_subobj.func_onclick) selected_subobj:func_onclick()
    -- own unit, first time?
    if (selected_obj.owner==1 and selected_obj.is_unit and selected_obj!=last_selected_obj and selected_obj.moves) ssfx"62"    
    -- enemy object, last clicked ours (unit or palace)?... attack!
    if (selected_obj.created_by!=1 and last_selected_obj and (last_selected_obj.is_unit or (last_selected_obj.id==19 and target_mode)) and last_selected_obj.owner==1) selected_obj.flash_count=10 do_attack(last_selected_obj, selected_obj, true) selected_obj=nil

  -- deselect?
  else
    -- do we have a unit selected?
    can_move_selected_unit_pos_with_cor(cx,cy)
        
    -- placement?
    local sel_build_obj = selected_obj and selected_obj.build_obj 
    if sel_build_obj
     and sel_build_obj.done
     and placement_pos_ok then
      -- place object
      m_map_obj_tree(sel_build_obj.ref,cx*8,cy*8,1)
      -- reset build
      reset_build(sel_build_obj)
      ssfx"61"
    end

  end 
  
  target_mode=false
  
 elseif right_button_clicked and not show_menu then
  -- cancel selection
  target_mode,selected_obj = false
 end

 ::skip_collisions::

 last_mouse_btn,last_selected_obj,last_selected_subobj = mouse_btn,selected_obj,selected_subobj 
 t_+=1
end

function can_move_selected_unit_pos_with_cor(x,y)
 if selected_obj 
  and selected_obj.owner==1 
  and selected_obj.moves 
  and selected_obj.state!=7 
 then
  selected_obj.cor,last_cmd_time = cocreate(function(unit)
   move_unit_pos(unit, x, y)
   do_guard(unit, nil, true)  
  end), 0
  deselect_check(selected_obj)
  return true
 end
 return false
end

function delete_unit(unit)
 del(units,unit)
 if unit.id==38 and #has_obj[unit.created_by][38]<=1 then
  -- auto-create harvester
  refinery=safe_rnd_has_obj(unit.created_by,17)
  if (refinery) create_harvester(refinery)
 end
end

function create_harvester(fact)
 local new = m_map_obj_tree(obj_data[38],fact.x,fact.y,fact.owner,fact)
 new.state=9
end

function _draw()
	cls"15"
 
 -- cam position (+ any "shaking")
 camera(camx+(16-rnd"32")*shake, camy+(16-rnd"32")*shake)
 
 -- finally, fade out the shake
 shake = shake>0.05 and shake*0.95 or 0

 -- draw sandworm
 for i=1,#worm_segs do
  if (i!=#worm_segs and i%2==1) fillp(0xa5a5.8)
  circfill(
   worm_segs[i][1]+4,
   worm_segs[i][2]+4,4,
   split"15,9,4"[(i-#worm_segs)%3+1])
  fillp()
 end
 
 palt(11,true)
 palt(0,false) 
  
 map(0,0,  0,0,   64,32, 0x8)
 map(64,0, 0,256, 64,32, 0x8)

 -- worm eating?
 if (worm_frame>0) spr(88+worm_frame\100, head_worm_x, head_worm_y)

 -- buildings
 for building in all(buildings) do 
  if not show_menu
  then 
    if (t_%3==0) building:update() -- save cpu
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
   if (p==1 and not unit.flying) or (p==2 and unit.flying) then
    if (not show_menu) unit:update()
    if (unit.process!=2 or not unit.moves) unit:draw() 
    -- reticule
    if (unit == selected_obj) ?"\f7\^:42c300000000c342",selected_obj.x, selected_obj.y-selected_obj.z
   end
  end
 end

 pal() 

 -- particles
 for p in all(particles) do
  fillp(p.pattern)
  circfill(p.x,p.y,p.r,p.cols[ flr((#p.cols/p.life_orig)*p.life)+1 ])
  fillp()
 end

 -- draw fog-of-war
 local mapx,mapy=camx\8,camy\8
 palt(0,false)
 palt(11,true)
 for xx=mapx-1,mapx+16 do
  for yy=mapy-1,mapy+16 do
    local gx,gy,fow_tile=xx*8,yy*8,fow[xx][yy]
    if fow_tile!=0 and fow_tile!=16 then
     spr(fow_tile+31,gx,gy)
    elseif fow_tile<16 then
     rectfill(gx, gy, gx+7, gy+7, 0)
    end
  end
 end
 
 -- draw ui
 camera()
 pal()
 palt(0,false)
 

 local sel_build_obj = selected_obj and selected_obj.build_obj 
 
 -- placement?
 if sel_build_obj 
  and (sel_build_obj.type==5
  and sel_build_obj.is_building)
  and sel_build_obj.done
 then

  local mxpos,mypos = (cursx+camx)\8, (cursy+camy)\8
  local sxpos,sypos,w,h = mxpos*8-camx,mypos*8-camy,sel_build_obj.spr_w,sel_build_obj.spr_h
  -- check ok to place
  placement_pos_ok,placement_inner_invalid,placement_damage = false,false,false
  for xx=-1,w do
    for yy=-1,h do
     local val=wrap_mget(mxpos+xx, mypos+yy)
     if xx==-1 or xx==w or yy==-1 or yy==h then     
      -- check edges
      if (fget(val,4)) placement_pos_ok=true
     else
      -- check inner      
      if (fget(val,5)) placement_damage=true
      if (not is_free_tile(nil,mxpos+xx,mypos+yy) or val==0 or val<=11 or val>=23) placement_inner_invalid=true
     end
    end
  end
  if (placement_inner_invalid and sel_build_obj.ref.obj_spr!=22) placement_pos_ok=false

  fillp"0b1110110110110111.1"
  rectfill(sxpos, sypos,
           sxpos+sel_build_obj.w, sypos+sel_build_obj.h, placement_pos_ok and 11 or 8)
  fillp()
 end

 -- top/header bar
 ?"\^j02\f4\|f\^x3\*z-\*8-\n\^xz\^j00\#9   \^xn \^j01\|j\^xz\^y2   \^xn "
 
 msgcount-=1
 ?(msgcount>0 and message or selected_obj and selected_obj.name or ""),2,2,0
 -- score
 ?sub("00000", #strnum)..strnum, 103,2, p_col2

 if hq!=last_hq then
  radar_frame=1
  if last_hq then set_message"pOWER LOW. bUILD wINDTRAP" end
  ssfx"55"
 end  
 last_hq=hq

  
 local soff=5934
 for moff=17152,17632,16 do  
   memcpy(0x6000+soff, moff, 16)
   soff+=64
 end

 ?"\^jnn\|e\-e\^x3\^y5\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jvn\^y5\|j\-e\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jnm\-g\|j\^y1\^x2\*5▤゛\^jnv\|f\^y1\^x2\*5▤゛\^g",p_col2

 ?"\f7\|e\-f\^x3\^y4\^h\-f\|c\n|\n|\^g\|i\-n\^h\-f\|c\n|\n|\^g\^x2\-a\|e\*4-\^g\^y5\-a\|j\*4_\0",ceil(92+camx/16),ceil(92+camy/16)
 
 if radar_frame>0 and radar_frame<77 then
   -- draw radar anim   
   for i=1,300 do
     pset(92+rnd"31",92+rnd"31",5+rnd"3")
   end
   radar_frame+=1
 end

 -- object menu icon/buttons? 
 if selected_obj and selected_obj.ico_spr then
  set_pos(selected_obj.ico_obj,107,20)
  selected_obj.ico_obj:draw()  
  -- player icons (build, actions, etc.)
  repair_obj,launch_obj=nil
  if selected_obj.owner==1 then
   -- build
   if sel_build_obj then
    set_pos(sel_build_obj,107,44)
    sel_build_obj:draw()    
   end
   -- repair? 
   if selected_obj.life<selected_obj.hitpoint   
    and selected_obj.is_repairable
    and selected_obj.is_building then
     repair_obj=m_obj_from_ref(obj_data[80], 115,28, 3, {}, nil, draw_action, function()
      process_click(last_selected_obj, 2)
     end)     
     repair_obj:draw()
   end
   -- fire palace weapon?
   if (selected_obj.id==19 
    and selected_obj.fire_cooldown<=0)
     or selected_obj.id==37
    then
     launch_obj=m_obj_from_ref(obj_data[81], 107,29, 3, {}, nil, draw_action, function()
      -- palace? 
      if last_selected_obj.id!=37 then
       set_message"pICK tARGET"
       target_mode=true
      else
       -- mcv mode
       local mx,my=get_tile_pos(last_selected_obj)
       local val=wrap_mget(mx,my)
       if val>=12 and val<=22 then
        last_selected_obj.life,last_selected_obj=0
        m_map_obj_tree(obj_data[1],mx*8,my*8,1)
        ssfx"61"
       end
      end
     end) 
     launch_obj:draw()  
   end

  end
 end

 pal()

 if show_menu then  
  fillp(▒)
  rectfill(unpack(split"0,0,127,127,0"))
  fillp()
  rectfill(3,18,124,92,p_col2)
  rect(3,18,124,92,p_col1) 

  selected_obj.valid_build_objs={}
  rectfill(unpack(split"6,21,27,89,0"))
  local icount=1
  for i=1,#selected_obj.build_objs do
   local curr_item=selected_obj.build_objs[i]
   curr_item.x=-20
   if (has_obj[selected_obj.created_by][curr_item.req_id])
    and fact_allowed(curr_item,dget"6")
   then
    selected_obj.valid_build_objs[icount]=curr_item
    if icount>=menu_pos and icount<=menu_pos+2 then
     set_pos(curr_item, 9, 24+(icount-menu_pos)*20)
     curr_item:draw()
    end
    selected_subobj = selected_subobj or selected_obj.valid_build_objs[1]
    if selected_subobj == curr_item then
      sel_build_item_idx=icount
      -- adj price
      if (selected_obj.id==5) srand(t_\3600) selected_subobj.cost=selected_subobj.ref.cost \ (rnd"0.533"+0.8)
      ?"\f7\^x3\-f\|c\*6-\n\-d\|d|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|d|    \^x4 |\^x3\n\^x3\-f\|d\*6-",9,curr_item.y
      ?"\^j87\-f\|a\^h\f7"..selected_subobj.name.."\n\|h\f9\^:041f051f141f0400\-f\|h"..selected_subobj.cost.."\^je8\|d\fd\^:1f1b111b1f0e0400\|h"..selected_subobj.hitpoint..(selected_subobj.is_building and "\^jl8\|d\fa\^:0804061f0c040200\|h"..selected_subobj.power or "\^jl8\|d\f8\^:081c226b221c0800\|h\-h"..selected_subobj.arms).."\n\|g\f6"..selected_subobj.description
    end
    icount+=1
   end
  end

  -- ui elements (buttons)?
  foreach(ui_controls, function(c) c:draw() end)
 end

 -- cursor
 palt(11,true)
 local spr_off=(selected_obj and selected_obj.is_unit and selected_obj.owner==1 or target_mode) and 3 or 0
 spr(spr_off/3, cursx-spr_off, cursy-spr_off)

end

-->8
-- init related
--

function test_tile(x,y) 
 local mask=0
	if x>=0 and x<=62 and y>=0 and y<=62 -- bail
  and fow[x][y]!=0 then
  -- figure out bitmask
		if (fow[x][y-1]>0) mask+=1
		if (fow[x-1][y]>0) mask+=2
		if (fow[x+1][y]>0) mask+=4
		if (fow[x][y+1]>0) mask+=8
  fow[x][y]=1 + mask
	end
 -- update "awake"
 local obj_tile=get_tile_obj(x,y)
 if (obj_tile and obj_tile.is_building) ai_awake[obj_tile.faction]=true
end

-->8
-- update related
--


function is_spice_tile(x,y)
  return fget(wrap_mget(x,y),7)
end

function do_guard(unit, start_state, hold_pos)
 unit.state,unit.last_move_result,unit.link = start_state or 0,true
 
 if (hold_pos) unit.gx,unit.gy = unit.x,unit.y

 unit.cor = cocreate(function(self)
  while true do
   -- carryall/ornithopter only
   if self.flying then
    -- move around origin point
    move_unit_pos(self, 
     mid(flr(self.orig_x+rnd"32")-16,64), 
     mid(flr(self.orig_y+rnd"32")-16,64))
   end

   -- ornithopter?
   if self.id==33 then
    attack_rnd_enemy(self)
     
   -- all other units, be on look-out
   elseif chance"250" and self.can_fire and self.state!=8 then
    -- is danger tile?
    local gx,gy = get_tile_pos(self)
    ping(self,gx,gy,
     function (unit,x,y)
      local target=get_tile_obj(x,y)
      if target and target.created_by!=unit.created_by and fow[x][y]==16 and (not target.flying or unit.id==8) then
       do_attack(unit,target) 
       return true
      end
     end,
     max(4,self.range))
   end

   local last_fact = self.return_to or self.last_fact
   
   -- if a harvester only
   if self.id==38 then    
    self.name="hARVESTER ("..(self.capacity\14).."%)"

    if self.state==0 or self.state==9 then
    
     if self.capacity<1400 
      and self.state!=7 and self.state!=9 then
      -- clear last fact visit
      self.return_to=nil
      local sx,sy
      local tx,ty=get_tile_pos(self)
      if is_spice_tile(tx,ty) and not self.newspot then
        sx,sy=tx,ty
      else
        -- look for nearest spice
        ping(self,tx,ty,
          function(unit,x,y)
            if is_spice_tile(x,y) then            
             sx,sy=x,y --found spice
             return true
            end
          end,
        20)
      end
      -- found spice?
      if sx and sy then
        unit.last_move_result = move_unit_pos(unit,sx,sy,nil,not unit.last_move_result)
        -- if stuck + no carryall...
        if not unit.last_move_result and not safe_rnd_has_obj(unit.created_by,39) then
         -- trapped, move to safe spot
         set_pos(self,nearest_space_to_object(self))
        end
        if (is_spice_tile(get_tile_pos(unit))) unit.state=6
      end

     -- are we full?
     elseif self.capacity >= 1400
      and self.state<7 then
       -- return to refinery when full
       self.sx,self.sy=get_tile_pos(self) -- remember pos!
       return_to_fact(self,last_fact or safe_rnd_has_obj(unit.created_by,17))
     end
    elseif self.state==6 then
     self.newspot=false
     add_spice_cloud(unit.x, unit.y, unit.r+.75+rnd".2"-.1)

     -- update spice tile state
     local unit_pos = get_tile_pos_index(unit)
     self.capacity+=.25
     spice_tiles[unit_pos] = (spice_tiles[unit_pos] or 1000)-.5
     -- done current spot?
     if spice_tiles[unit_pos] <= 0 then      
      local xpos,ypos=get_tile_pos(self)
      for yy=-1,1 do
       for xx=-1,1 do
        val=wrap_mget(xpos+xx,ypos+yy)        
        wrap_mset(xpos+xx,ypos+yy,
        (xx==0 and yy==0) and 0 or ((val>3 and val<10) and 10 or val)
       )
       end
      end
      -- look for more spice to harvest
      self.state=0
     end
     -- move around the spice?
     if (self.capacity%350==0) self.newspot=true self.state=0

    end
   end

   -- if any "dockable" unit
   if self.id>=30 then    
    -- is carrying spice been sent to repair facility
    if self.state==9 then
     -- check last factory not destroyed/busy (+unit is alive!)
     if last_fact.life>0 and not last_fact.occupied and self.life>0 then      
      -- dock
      last_fact.incoming,self.state,self.r = false,8,.25
      set_pos(self,last_fact.x+16,last_fact.y+4)

      deselect_check(self)
      
      -- is this a harvester & refinery?
      if self.capacity and last_fact.id==17 then 
       last_fact.occupied=self       
       -- unloading?
       -- (700 credits for full unload in Dune2JS)
       while self.capacity>0 do
        self.capacity-=1
        -- only make money if (human player) has capacity
        total_spice[self.owner]+=.125 
         if tonum(strnum)<total_storage then
         transact(.5,self)
         elseif self.owner==1 then
          set_message"sPICE LOST. bUILD sILOS"
        end
        yield()
       end
       -- go back to guard (search for spice) mode      
       self.capacity,self.state,last_fact.occupied = 0,0
       if self.sx then 
        move_unit_pos(self, self.sx, self.sy, 0, true)      
       else
        set_pos(self,nearest_space_to_object(self)) -- ensure don't get stuck
       end
      else
       -- spark flash while repairing       
       self.process,self.procstep,last_fact.col_cycle_src,last_fact.col_cycle = 2,0,8,split"7,10,0,0,7,0,0"
      end
     
     end

    end
    
   end
   
   ::skip_end_guard::
   yield()
  
  end

 end) 
end

-- always skip yield (as called directly)
function nearest_space_to_object(target)
 local ux,uy = ping(target,(target.x+8)\8, (target.y+8)\8, is_free_tile, 99, true)
 return ux*8,uy*8
end

function add_spice_cloud(x,y,r)
 -- spice clouds
 if (chance"10") add_particle(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split"2,4,9,15")
end

function do_attack(unit, target, manual_attack)
 local id=unit.id
 -- normal attack?
 if id!=19 then 
   local firing_range = unit.range*5 --keep local!
   unit.state,unit.target,unit.cor = 3,target,cocreate(function(self)
   -- while still alive and not repairing/unloading...
   while target.life>0 and target.state!=8 do
    --  1) move to within firing range of target
    if dist(unit.x,unit.y,target.x,target.y) > firing_range
      and unit.moves then
     -- should we pursue?
     if not manual_attack and dist(unit.x,unit.y,unit.gx,unit.gy) > firing_range then
      -- too far away from guard pos
      goto exit_attack
     end
     -- move to within firing range of target
     if move_unit_pos(unit,(target.x+rnd(target.w))\8,(target.y+rnd(target.h))\8,firing_range) 
      and unit.arms==400 -- ...and IF successful AND saboteur or death hand? Boom!
     then
      unit.life=0
      for i=1,15 do
       make_explosion(unit.x+rnd"32"-16,unit.y+rnd"32"-16, 2)
      end
      --end
      target.life-=(1000+rnd"600")
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
    local _dist=dist(unit.x,unit.y,target.x,target.y)
    if _dist<=firing_range then
     -- capture?
     if manual_attack and target.capturable and unit.can_capture and target.life<=target.hitpoint/3 
      then
      move_unit_pos(unit,target.x\8,target.y\8,0)
      change_fact(target, unit)
      if (target.occupied) change_fact(target.occupied, unit)
      unit.life=0
     -- fire
     elseif unit.fire_cooldown<=0 and not unit.bullet_x and target.life>0 
       and (_dist>=20 or id!=34) then
      unit.fire(unit)
      unit.fire_cooldown=unit.fire_rate     
     end
    elseif unit.is_building then
     -- turrets default to guard if out of range
     do_guard(unit)
    end
    yield()
    -- thopters only fire once, per attack
    -- (+all units abort attack if unit=converted to "our" side)
    if (id==33 or target.faction==unit.faction or target.link) break
   end -- 4) repeat 1-3 until target destroyed

   -- reset to guard (curr pos)
   ::exit_attack::
   if (not manual_attack and unit.moves) move_unit_pos(unit,unit.gx\8,unit.gy\8)
   do_guard(unit, nil, true)
  end)
  
 else
  -- palace weapons
  do_attack(m_map_obj_tree(obj_data[({24,25,50,50.5})[unit.faction]], unit.x,unit.y, unit.owner, unit), target, true)
  unit.fire_cooldown=583
 end
end

function change_fact(target_obj, source_obj)
 target_obj.old_fact_data,
 target_obj.faction,target_obj.owner,target_obj.created_by,target_obj.base_idx,target_obj.col1,target_obj.col2
 =
 {target_obj.faction,target_obj.owner,target_obj.created_by,target_obj.col1,target_obj.col2},
 source_obj.faction,source_obj.owner,source_obj.created_by,source_obj.base_idx,source_obj.col1,source_obj.col2
end

function ping(unit,x,y,func,max_dist,skip_yield)
 for t=rnd"1",max_dist or 4,.075 do
 	local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
	 if (func(unit,xx,yy)) return xx,yy
  if (not skip_yield) yield()  
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
 local obj_tile=get_tile_obj(x,y)
 return not fget(wrap_mget(x,y),0)
   and (not obj_tile 
         or obj_tile==unit 
         or obj_tile.flying 
           or (obj_tile.on_foot and unit and unit.tracked and obj_tile.created_by!=unit.created_by))
end

function move_unit_pos(unit,x,y,dist_to_keep,try_hail,start_state)
  -- can a carryall take us?  
  if try_hail then
   local carryall=safe_rnd_has_obj(unit.created_by,39)
   if carryall and not carryall.link and carryall.faction==unit.faction then
     -- link them + set unit to "moving" to wait for pickup
     carryall.link,unit.link,unit.state, carryall.cor = unit,carryall,2, cocreate(function(unit_c)     
      move_unit_pos(unit_c,unit.x\8,unit.y\8)
      deselect_check(unit)
      if unit.life>0 then
       carryall.my=18
       del(units,unit)
       move_unit_pos(carryall,x,y)
       set_pos(unit,carryall.x,carryall.y)
       add(units, unit)
       do_guard(unit,start_state)
      end
      carryall.my=16
      do_guard(carryall)
     end)
    return
   end
  end
  
  ::restart_move_unit::

  if not unit.flying and not is_free_tile(unit,x,y) then   
    -- occupied, move close as poss
    x,y=ping(unit,x,y,is_free_tile)
  end

  -- use coroutine to find path
  unit.tx,unit.ty,unit.prev_state,unit.state,unit.path = x*8,y*8,unit.state,1
  
  -- "pathfinder"
  if true then --used to scope locals (free mem!)
   local start, goal, node_to_id = { x=unit.x\8, y=unit.y\8}, {x=x, y=y}, function (node) return (node.y<<8) + node.x end
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
    local cost = max_number
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
    -- map neighbors
    local neighbors = {}
    for xx = -1, 1 do
     for yy = -1, 1 do
      local nx,ny = p.x+xx,p.y+yy
      local obj_tile=get_tile_obj(nx,ny)
      if (xx!=0 or yy!=0)
       --maybe_add
       and unit.flying or (not fget(wrap_mget(nx,ny),0) or unit.on_foot and fget(wrap_mget(nx,ny),1))       
       and is_free_tile(unit,nx,ny)
       and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
        add(neighbors, {x=nx, y=ny})
      end
     end
    end
    --
    for n in all(neighbors) do
     local id = node_to_id(n)
     local old_best, new_cost_from_start =
      best_table[id],
      shortest.cost_from_start + ((p.x != n.x and p.y != n.y) and 1.2 or 1)
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
    if (not unit.flying) yield()
    -- "unreachable dest" + 90% mem check
    if (count>3000 or stat"0">1843) goto end_pathfinding
   end

  end

  ::end_pathfinding::

  -- now auto-move to path
  unit.prev_state,unit.state = unit.state,2

  -- loop all path nodes...
  if unit.path then

     for i=#unit.path-1,1,-1 do
      local node=unit.path[i]
      local nx,ny,ux,uy = node.x,node.y,unit.x,unit.y
      local mx,my = nx*8,ny*8
      if not unit.norotate then
        -- rotate to angle
        local a=atan2(ux-mx, uy-my)
        while (unit.r != a) do
          turntowardtarget(unit, a)
        end
      end
      
      -- check new position/tile is still free
      if(not unit.flying and not is_free_tile(unit,nx,ny)) goto restart_move_unit
      
      -- move to new position      
      local scaled_speed,distance = unit.speed, dist(mx,my,ux,uy)
      
      -- don't move these!
      local step_x,step_y = scaled_speed * (mx-ux) / distance, scaled_speed * (my-uy) / distance
      
      -- run over
      local prev_nunit=get_tile_obj(nx,ny)
      if (prev_nunit and prev_nunit.on_foot and unit.tracked) prev_nunit.life=0

      -- declare intentions
      object_tiles[nx..","..ny]=unit

      reveal_fow(unit,0,nx,ny)

      for i = 1, distance/scaled_speed do
        unit.x+=step_x
        unit.y+=step_y

        -- z-height
        if unit.id==39 then        
         if unit.link then
          local d=dist(unit.x,unit.y,unit.tx,unit.ty)
          if (d<32) unit.z = d/4
         end
         unit.z = mid(2,unit.z+0.1,8)
         unit.speed = unit.z/10
        end

        yield()
      end      
      
      set_pos(unit,mx,my)
      object_tiles[nx..","..ny]=unit      

      if (dist(unit.x,unit.y,unit.tx,unit.ty) <= (dist_to_keep or 0)) break -- stop now
    end

  else
   unit.state=0 --idle
   return false
  
  end -- "pinned in"

  -- arrived?
  unit.state=0
  reveal_fow(unit,1)
  return true
end

function get_tile_obj(tx,ty)
 return object_tiles[tx..","..ty]
end

-->8
-- draw related 
--
function m_button(x,text,func_onclick,_w)
 add(ui_controls,{
  x=x,
  y=81,
  w=_w or 22,
  h=8,
  text=text,
  get_hitbox=function(self)
   return self    
   end,
  draw=function(self)
    local c,b=self.hover and 7 or 6,#text>1
    if(b) ?"\-g\|g\^x2███\^x1█\n\-g\|e\^x2███\^x1█",x,81,c
    ?text,x+2,83,b and 0 or c
  end,
  func_onclick = func_onclick
 })
end

function set_message(msg)
  message,msgcount = msg,500
end


-->8
-- game flow

function reset_build(obj)
 obj.life,obj.process,obj.spent,obj.done = 0,0,0
 if (obj.parent) obj.parent.incoming=false
end

function check_hover_select(obj)
  if (not obj) return
  --  collide()
  local hb1,hb2 = {
    x=cursx+(ui_collision_mode and 0 or camx),
    y=cursy+(ui_collision_mode and 0 or camy),
    w=0,
    h=0
  },obj:get_hitbox()

  obj.hover = hb1.x <= hb2.x + hb2.w and
   hb1.x + hb1.w >= hb2.x and
   hb1.y <= hb2.y + hb2.h and
   hb1.y + hb1.h >= hb2.y

  if left_button_clicked and obj.hover then
   if show_menu then
    selected_subobj = obj
   else
    -- hidden by fow?
    if (obj.type<=2 and fow[cx][cy]==0 or obj.state==8) return
    
     -- was our unit selected before clicking our refinery/repair?
    if selected_obj
     and last_selected_obj
     and (obj.id==17 and last_selected_obj.id==38 
      or obj.id==9 and last_selected_obj.id>=30)
     and obj.owner==1 and last_selected_obj.owner==1
    then
     return_to_fact(last_selected_obj,obj)
     return -- "no click"

    else 
     -- something else clicked, so select it
     selected_obj = obj
    end    
   end
   clickedsomething=true
  end

end

function return_to_fact(unit,fact)
 -- ensure that we always have a value - KEEP LOCAL!
 local fact,init_state,try_hail = fact or safe_rnd_has_obj(unit.created_by,1) or unit
 -- always set last factory
 unit.state,fact.incoming,unit.return_to = 7,true,fact
 if (unit.id!=38 or fact.id==17) unit.last_fact=fact
 unit.cor = cocreate(function(unit)
  if (fact.is_dockable) init_state,try_hail=9,true
  move_unit_pos(unit, (fact.x+16)/8, fact.y/8, 0, try_hail, init_state or 0)
  if (not unit.link) do_guard(unit, init_state, true) 
 end)
end


-->8
-- ai-related code

function attack_rnd_enemy(obj)
 local best_priority,target=0
 for building in all(buildings) do
  if building.created_by!=obj.created_by 
   and is_visible(building) 
   and building.ai_priority > best_priority 
  then 
   target,best_priority=building,building.ai_priority
  end
 end
 if (target) do_attack(obj, target, true)
end

function is_visible(obj)
 local x,y = get_tile_pos(obj)
 return fow[x][y]==16
end

-->8
--other helper functions

function ssfx(sfx_num)
 sfx(sfx_num,3)
end

function set_loop(enabled)
 local val=peek(0x3115)
 if (val & 128 > 0 != enabled) val=val^^128
 poke(0x3115, val)  
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

function safe_rnd_has_obj(created_by,id)
 local table = has_obj[created_by][id]
 if(table) return rnd(table)
end


function dist(x1,y1,x2,y2)
 return sqrt(((x1-x2)>>5)^2+((y1-y2)>>5)^2)<<5
end

function chance(odds) --1/odds
 return rnd(odds)<1
end

function turntowardtarget(unit, targetangle)  
  local diff = targetangle-unit.r  
  -- never turn > 180
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
  -- close enough
   unit.r = targetangle
  end  
  -- flying=skip 
  if (not unit.flying) yield()
end

function manhattan_distance(a, b)
 return abs(a.x-b.x) + abs(a.y-b.y)
end

-- particle related
function add_particle(x, y, r, dx, dy, dr, ddy, life, cols)
  add(particles, {
    x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,
    life=0,ddy=ddy,
    cols=cols, pattern=rnd{0xa5a5.8,0x5a5a.8},
    y_orig=y, life_orig=life }, 1)
end




__gfx__
11bbbbbbbb171bbb51111110bbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbb7a9bbbb95555555d555555d155dbbbbbbbbbb
171bbbbbb17771bb55111100bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99b7a9bbbbbbbd5515555555515555d59bbb9d5d9b
1771bbbb1711171b555110000000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b7a9b7a9bbbd555d5515d5d5555d515db55515515
17771bbb7717177b5555000007700077bbb99b9bb9999b9bb9b99bbbb9b9bb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
177771bb1711171b5551100000777770bbbbb9b99bb9999b9b9bbbbbbb9bb999b9b99bbb99999999b999b99bbbbbbbbbbd55d55155155555d515559b155555d5
17711bbbb17771bb5511110007700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb7a9bbbbbd515d55d555d5555d555dbbd55d5555
b11bbbbbbb171bbb511111100000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbba9bbbb7ab95d5555555555155155dbbb5d555d15
bbbbbbbbbbbbbbbb11111111bbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbb7a9bbbd551d5515d555d555559bb55515555
55551d51bbbbbbbbbbbbbbbbbd5d555555d555dbdddddddddddddddd55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d55d5155bbbbbbdddbbbbbbbbd5551551555d5dbd5555555d55555551555515d4444444444555155544444444444444444444444544224222242224442422442
5155555dbbbb9d5555d9bbbbbb55d5555d5555bbd5015515d55555555d55d444444444444445d555444444444444444444444444524442444424442224444221
5d55d555bbbd555d5555dbbbbbd15d5d55555dbbd5105555d5555555555d4444444444444444445d444444444444444444444442522222212222222242222110
55d555d1bb955555d55559bbbb955555d555d9bbd5555111d5555555555444444444444444444445444444444444444444444422502112121121122121121200
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242510221200012210012100001
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240551000000000000000011111
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d5555555554444444444444444444444444444444444444444444421555111111111111111110115
bbbbbbbbbbb9bbbb51111110bbbbbbbbddddddddbbbbbbbbbbbbbbbbbbbbbbbbbbb7bbbbbbbbbbbbb1000000bbbbbbb50000001bbbbbbbbb5000001bbbb9ddbb
bbbbbbbbbb66669b55111100bbbbbb51d555555515bbbbbbbbbbbbbbbbbbbbbbbbbebbbbbbbbebbbb5b1b000bbbbbb10000b1b5b1bbbbbbbb1b1b1bbb9d555db
bbb777bbb66dd66b55511000bbbbb5b0d55555550b5bbbbb050b5050bbbbbbbbbb67bb6bbb66bb6bbb5b1b00bbbbb5b000b1b5bb01bbbbbbbb5b5bbb9d5d5d59
bb77994bb6d55d6b55550000bbbbbb10d555555501bbbbbbcdcccccebbbbbbbbbc77677bbc77677bbbbbb1b0bbbbbb100b1bbbbb0bbbbbbbbbbbbbbbd555155d
bb79994bb6d55d6b55511000bbbbb1b0d55555550b1bbbbbcdc7766ebbbbbbbbbb67bb6bbb66bb6bbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbbd515555d
bb79944bb66dd66b55111100bb5b1b00d555555500b1b5bb050b5050bbb5b5bbbbbebbbbbbbbebbbbbbbb5b0bbbbbb100b5bbbbb0bbbbbbbbbbbbbbbd555d559
bbb444bbbb6666bb51111110b5b1b000d5555555000b1b5bbbbbbbbbbb1b1b1bbbb7bbbbbbbbbbbbbbbbbb51bbbbbbb115bbbbbb01bbbbbbbbbbbbbb95555ddb
bbbbbbbbb9bbbbbb11111111b1000000d55555550000001bbbbbbbbbb1000005bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5bbbbbbbbbbbbbbbb9dd9bbb
b7bbb7bbb7bbb7bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb022200bbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb00ee00bbbbbb00bbb00b00bb677776bb6cccc6bb0eecce0b082d882bd6666dbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbedeccccebb6ccdebb6cccdebbeccddcbbe076dcbbecd66dcb807e288be9ddcebd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bceccccceb00c76cbbbc776ebbe0667dbbecccdcb0666777db882d888ba947debd4c455444444549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbcecccccebb6ccdebb6cccdebbeccddcbbe076dcb0666777db807e288be9ddceb4a042499999442424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbedeccccebbbbb00bbb00b00bb677776bb6cccc6bbecd66dcb082d882bd6666db49029999c0994422229aa094d44444444522424244255425
bbbebbbbbbbebbbbb00ee00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0eecce0b022200bbbbbbbbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbd2499a77a0a99442d1542425d44411114555224225ff2225
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbbbbbbbbb7ccbbbd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbbbbbbbbbb7bbb7d1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbb66dbbbbbb6dbbbbb6bb7cd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d555555566d676bb76666a986d77777bd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55777676bbbbbb6dbb6d77777bd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbb66dbbbbbbbbbbbbb6bb7cd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbbbbbbbbbbbbbbbbbb7bbb7d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbbbbbbbbbbbbbbbbb7ccbbbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5d5555555d5d1b115d6ddcdd551110001ddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc0556dd577765d5555ddd6dd0dd55d110001d5588855bb76d1bbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d55766116555c055d6dd15d1d1510c01d5558555bbb1d1bbbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd57661bb155ee0ddd1ddd500155560d5d555555566d16dbbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad55550556d76101b105d5055d1111005dddd6d15d55aaa5577616dbb76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d576000b015d5055d111100111111105d5555555bbb1d1bb76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5d600b015d6d555d511005555551015d5bbbbb5bb76d1bb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d55d1b1155d5d555d555555555555555d5555555bbbbbbbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddddddddddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd557777655555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd576ddd665555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd57d776d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d56d766d65555555d50477777b617401d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd566ddd665555555d544ff7ff6d1f441d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd5d66666d7777655d504777771177401d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd5dd0d0276c0d665d544ff7fff7ff441d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd5d200027ee06d65d504777777777401d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d512020d6d606d65d544ff7fff7ff441d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d511000566d0d661d542222222222241d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d5511111d66666d1d52c02c020200221d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d5555111dd0d0221d5ee0ee022200221d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d5555551d2000221d551011011111111d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d555555112020211d555011011111111d222444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555511000115d555555555555555d555222255555555d111111111194421
ddddddddddddddd6766dddddddddddddd7766ddd577777d59ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
d55555555c0555d6766dd555d76555557c67c676576666d59999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
d5d6d555ee055dd6766dd155d6d5555dcd76dc6d576666d0ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
d576dddd550516d6766d6105d556555dccddccd5576666d099999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
d50015055505ddd6766ddd05d5c7c5cd6cccc6dc56dddd10777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
d55555555d101dd6766dd105d1dcd1c1d6666d1c56dddd1066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
d455555550001dd6766dd105d1cdc177660dd1c656dddd106666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
d15ddddddddd1dd6d16dd105d51117c67c601ccd5d111110dddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
d55776d7777716d6116d6105d500dcd76dcd0dd1bb7ccbbbdddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110bee71ee7dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005ecc61c7cdddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c5556d77777edddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c60556d77777edddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055ecc61c7c5555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076bee71ee755555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dbb7ccbbb55555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
cccccccccbbcbcccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccbbcc3cccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddcccccccccccccccc
cccccccbbcc33cccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccbbccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccbcccc5f01ccccccbccccccccccccccccddddddddddddddddddddddddddddddddddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc76753355335ccbccc055ffcccccbbcccccc4ff75550ccdddddddd7773330ddddd28888dc660dddd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc76667555dd555cbbcc0f7557ccccbbccccc4ffff7fccccddddd4bbbb75550dddd2888888dcddddddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755dddd55cbbbc0f7fff7cccbbcc54454444444f7cdd45444444444ddddd5225222222287ddd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555cbccc0ff000550ccbc555fffffffff55cd54bbbbbbbbbbb5dd55588888888855dd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
9166660001110009bccc00df00cccccb950600000000065995040000000004599506000000000659950360000000635995000005999300095061052995061059
f90500000444000939999900ff999993995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
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
666dddd5555555554456699999666ddd4900944c5f659999de2d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336ded2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446b600244ff999455d44444444549
996666666669699944467777777666dd777666666353655ddedffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355b332494fff9444444449999999
9999996999999999444fffffffff942f666666666353d33dfffffffff5f6667d999dd6677766d5999995d6677766dd9924335203504449f9999999999999f999
44449999449444944444ffffffff560f6666ddddddddddddfff4f4f4f56ddddd99ddd66dd566d5999995d665dd66ddd9446b2446b09999ff9999999999993999
44444444444444444444ffffffffffffddddddddddddddddffffffffffffffff99dd666dd5666d59995d6665dd666dd9443324430044499f9999999999999999
__label__
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99909999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922992229222922299
99090909099009009999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292992999929292929299
99090909090909090999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292992992229292929299
99009909090009090999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292992992999292929299
99900990090909009999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922292229222922299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
fffffffffffffffffffffffffffffffffffffffffffff0ffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00fffffffffffffffffff10000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1dcc6fffffffffffffff5f0000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc67c00fffffffffffffff10000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1dcc61ffffffffffffff5f0000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00111ffffffffffffffff10000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff11ffffffffffffffffffff1000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffdddddddddddcddddddddddddddddddddd6dddddd6dddddddddddddddffffffffffffffffffffffffffffffff5000001ff100000000000000000000
ffffffffffd5555555d560d55555555555d5555555dd577765d5555555d5555555ff9d5d9ffffffffffffffffffffffffff1f1f1dd0000000000000000000000
ffffffffffd5555555d56d1555c5555555d5ccccc5d576611655577765d555555555515515ffffffffffffffffffffffffff5f5d550cccccccccccccccc00000
ffffffffffd5555555d5110d560d6c0655d5555555d766100155766116d555555555d5155dfffffffffffffffffffffffffffd555d0cccccccccccccccc00000
ffffffffffd5555555d51001d6d6110dd5d5511155d761010107661001d5555555155555d5ffffffffffffffffffffffffff9555550cccccccccccccccc00000
ffffffffffd5555555d515050116dd0dd5d5555555d760000017610101d5555555d55d5555ffffffffffffffffffffffffffd515550cccccccccccccccc00000
ffffffffffd5555555d55d155106dd15d5d55515556d60000157600000d55555555d555d15fffffffffffffffffffffffffd5555150cccccc006ccccccc00000
ffffffffffd5555555d566665551ddd501d5511155d5d101155d600001d555555555515555fffffffffffffffffffffffffd5d55550ccc7f000005550cc00000
ffddddddddddddddddd6ddcdd551110001ddddddddd5555555d5d10115ddddddddddddddddddddddddddddddddffffffff55d5555504fffffffff4ccccc00000
ffd5555555d5555555d6dd0dd55d110001d55111556dd577765d5555ddd5555555d766777755555555d5555555ff9d5d9f55555551045005444455005cc00000
ffd5555555d5555555d6dd15d1d1510c01d5551555d55766116555c055d5555555d7ddfff755555555d555555555515515515d5d5505016054ff501605c00000
ffd5555555d5555555d1ddd500155560d5d5555555d5766100155110ddd5555555d7777f7765555777d555555555d5155d5555155d0506105299506105900000
ffd5555555d5555555d1111005dddd6d15d55111556d761010105d5055d5555555d4447ff7265557f6d5555555155555d5551555550950052222250059900000
ffd5555555d5555555d111100111111105d5555555d5760000015d5055d5555555d4047777655777fdd5555555d55d5555d555d555099999999999999ff00000
ffd5555555d5555555d511005555551015d5ccccc5d5d6000015d6d555d5555555d44444442657ffffd55555555d555d1555555515099999999f999999900000
ffd5555555d5555555d555555555555555d5555555d55d101155d5d555d5555555d22244445557ff7fd555555555515555515d555d099fff9999999ff9900000
ffddddddddddddddddd6dddddd6dddddddddddddddddddddd6766ddddddddddddddddddddd5557ff7fdddddddd55d6565555d555550f99999999999999f00000
ffd5555555d5555555dd577765d5555555d55555555c0555d6766dd555d55555555555555555577777d5555555550ccc01555555510999f9999fffff99900000
ffd5555555d5555555d576611655577765d5d6d55511055dd6766dd155d55477777777745565544444d5555555510c7c05515d5d550000000000000000000000
ffd5555555d5555555d766100155766116d576dddd550516d6766d6105d544ff7fff7ff445265c04c0d5555555551c7c1d5555155d0bbbbbbbbbbbbbbbb00000
ffd5555555d5555555d761010107661001d50015055505ddd6766ddd05d50477777061740565110110d5555555550d6d05551555550bbbbbbbbbbbbbbbb00000
ffd5555555d5555555d760000017610101d55555555d101dd6766dd105d544ff7ff6d1f44526550550d5555555d5011105d555d5550000000000000000000000
ffd5555555d55555556d60000157600000d455555550001dd6766dd105d50477777117740555550550d555555555111115555555155555551555555551000000
ffd5555555d5555555d5d101155d600001d15ddddddddd1dd6d16dd105d544ff7fff7ff44555555555d5555555515d555d515d555d515d555d515d555d000000
ffddddddddddddddddd5555555d5d10115d55776d7777716d6116d6105d504777777777405dddddddddddddddd55d5555555d5555555d5555555d55555000000
ddd5555555d55555556dd577765d5555ddd55666666666ddd6766ddd05d544ff7fff7ff445d5555555d555555555555551555555515555555155555510000000
55d5555555d5555555d55766116555c055d56ddddddddd1d0000000105d542222222222245d5555555d5555555515d5d55515d5d55515d5d55515d5550000000
5dd5555555d5555555d5766100155110ddd5d111111111101d6dd6d005d52c02c020200225d5555555d55555555555155d5555155d5555155d55551510000000
55d5555555d55555556d761010105d5055d551a1a11111000000000005d511011022200225d5555555d555555555155555551555555515555555155550000000
55d5555555d5555555d5760000015d5055d45111111111016d6d6d6d05d551011011111115d5555555d5555555d555d555d555d555d555d555d555d510000000
15d5555555d5555555d5d6000015d6d555d44555555555555555555555d555011011111155d5555555d555555555555515555555155555551555555511000000
55d5555555d5555555d55d101155d5d555d11555555555555555555555d555555555555555d5555555d5555555515d555d515d555d515d555d515d555d000000
5555d5555555d55555ddd66666ddddddddddd66666ddddddddddd66666dddddddd55d5555555d5555555d5555555d5555557d5575555d5555555d55555000000
515555555155555551d566777665555555d566777665555555d566777665555555555555515555555155555551555555515c555c515555555155555510000000
55515d5d55515d5d55d767666d6d555555d767666d6d555555d767666d6d555555515d5d55515d5d55515d5d55515d5d55515d5155515d5d55515d5550000000
5d5555155d5555155dd767666d6d555555d767666d6d555555d767666d6d5555555555155d5555155d5555155d5555155d5055105d5555155d55551510000000
555515555555155555d766ddd66d555555d766ddd66d555555d766ddd66d55555555155555551555555515555555155555551755555515555555155550000000
55d555d555d555d555d6d66666d1555555d6d66666d1555555d6d66666d1555555d555d555d555d555d555d555d555d555d55cd555d555d555d555d510000000
155555551555555515d6dd0d0221666665d6dd0d0221666665d6dd0d022166666555555515555555155555551555555515555155155555551555555511000000
5d515d555d515d555dd6dd0002266c0766d6dd0002266c0766d6dd0002266c0766515d555d515d555d515d555d515d555d5150555d515d555d515d555d000000
5555d5555555d55555d52d0d02761106d6d52d0d02761106d6d52d0d02761106d6fffffffffffffffffffffffffd5d555555d5555555d5555555d55555000000
515555555155555551d5120001767606d6d5120001767606d6d5120001767606d6fff9fffff00f00fffffffffffd555155555555515555555155555510000000
55515d5d55515d5d55d5511111766d0d66d5511111766d0d66d5511111766d0d669999fffff1dccc6fffffffffff55d555515d5d55515d5d55515d5550000000
5d5555155d5555155dd55555556d666662d55555556d666662d55555556d666662f9f99ffff1677c1fffffffffffd15d5d5555155d5555155d55551510000000
555515555555155555d55555556dd0d022d55555556dd0d022d55555556dd0d0229f9ffffff1dccc6fffffffffff955555551555555515555555155550000000
55d555d555d555d555d55555556dd00022d55555556dd00022d55555556dd000229999fffff001001fffffffffffff9d55d555d555d555d555d555d510000000
155555551555555515d555555552202021d555555552202021d555555552202021f9f99ffff11f11fffffffffffffffffd555555155555551555555511000000
5d515d555d515d555dd555555555100011d555555555100011d5555555551000119f99ffffffffffffffffffffffffffff515d555d515d555d515d555d000000
dfffffffffffffffffffffffffff95555555d600555d155dffffffffff99f9ff99fffffffffffffffff99fffffffffffffff95555555d5555555d555df000000
dffffffffffffffffffffffffffffd5515566cc0515555d59fffffffff9f9999f9fff9ffffffffffffffffff99fffffffffffd5515555555511555d551000000
ffffffffffffffffffffffffffffd555d551cc7c0055d515dfffffffff999f99999999ffffffffffff9ff99f9fffffffffffd555d5515d5d555d5555f0000000
fffffffffffffffffffffffffff955515d550cc610155d55dff9f9ff9ff9999f9ff9f99fffffffffffff99fffffffffffff955515d5555155d55555d10000000
fffffffffffffffffffffffffffd55d5515511d111d515559fff9ff9999ff9999f9f9ffffffffffffff999f99ffffffffffd55d55155155555d555d1f0000000
fffffffffffffffffffffffffffd515d55d55501155d555dff999f99f9f999f99f9999ffffffffffff99ff9ffffffffffffd555555d555d55555591f00000000
fffffffffffffffffffffffffff95d5555555511155155dfff9f99f99f99f999f9f9f99ffffffffffffffffffffffffffff91d151555151515d5f1f000000000
ffffffffffffffffffffffffffffd551d5515d555d555559fff99f99f9ff9fff999f99fffffffffffffff99ffffffffffff100000551000005f1000000000000
ffffffffffffffffffffffffffff95555555d555555d155dfff99fffff99f9ff999f9f99f9fffffffffffffffffffffff5000000000000000000000000000000
fffffffffffffffffffffffffffffd5515555555515555d59fffffff999f9999f9f9999f99ffffffffffffffffffffff10000000000000000000000000000000
ffffffffffffffffffffffffffffd555d5515d5d5555d515df9ff99f9f999f99999f99999ffffffffffffffffffffff5f0000000000000000000000000000000
fffffffffffffffffffffffffff955515d5555155d155d55dfff99fffff9999f9f9999f99fffffffffffffffffffffff10000000000000000000000000000000
fffffffffffffffffffffffffffd55d55155155555d515559ff999f99f9ff9999ff9f99ffffffffffffffffffffffff5f0000000000000000000000000000000
fffff5f5fffff5f5fffffffffffd515d55d555d5555d555dff99ff9ffff999f99f9fffffffffffffffffffffffffffff10000000000000000000000000000000
5fff1f1f1fff1f1f1ffffffffff95d5555555555155155dfffffffffff99f999f9fffffffffffffffffffffffffffffff1000000000000000000000000000000
1ff1000005f1000005ffffffffffd551d5515d555d555559fffff99fffff9fff99ffffffffffffffffffffffffffffffff000000000000000000000000000000
00000000000000000055d5555555d5555555d5555555d55555fffffffffffffffffffffffffffffffffffffffffffffff5000000000000000000000000000000
00000000000000000015555551555555515555555155555551dffffffffffffffffffffffff171ffffffffffffffffff10000000000000000000000000000000
000000000000000000015d5d55515d5d55515d5d55515d5d5555d9ffffffffffffffffffff17771ffffffffffffffff5f0000000000000000000000000000000
0000000000000000000155155d5555155d5555155d5555155d5555dffffffffffffffffff1711171ffffffffffffffff10000000000000000000000000000000
00000000000000000005155555551555555515555555155555d55559fffffffffffffffff7717177fffffffffffffff5f0000000000000000000000000000000
0000000000000000000051d555d555d555d555d555d555d55555d55dfffffffffffffffff1711171ffffffffffffffff10000000000000000000000000000000
00000000000000000000051555551515155555551555555515555555dfffffffffffffffff17771ffffffffffffffffff1000000000000000000000000000000
0000000000000000000000001d51000005515d555d515d555d555d55dffffffffffffffffff171ffffffffffffffffffff000000000000000000000000000000
000000000000000000000000000000000055d5555555d5555555d55555fffffffffffffffffffffffffffffffffffffffff10000000000000000000000000000
0000000000000000000000000000000000155555515555555155555551dffffffffffffffffffffffffffffffff2222222222222222222222222222222220000
0000000000000000000000000000000000015d5d55515d5d55515d5d5555d9fffffffffffffffffffffffffffff2000000000000000000000000000000020000
00000000000000000000000000000000000555155d5555155d5555155d5555dffffffffffffffffffffffffffff2000000000000000000000000000000020000
0000000000000000000000000000000000011555555515555555155555d55559fffffffffffffffffffffffffff2000000777777770000000000000000020000
00000000000000000000000000000000000555d555d555d555d555d55555d55dfffffffffffffffffffffffffff2000000700000070000000000000000020000
0000000000000000000000000000000000015555155555551555555515555555dffffffffffffffffffffffffff2000000700000070000000000000000020000
0000000000000000000000000000000000515d555d515d555d515d555d555d55dffffffffffffffffffffffffff2000000700000070000000000000000020000
000000000000000000000000155000001555d5555555d5555555d555555d155dfffffffffffffffffffffffffff2000000700000070000000000000000020000
00000000000000000000051551515151515555555155555551555555515555d59ffffffffffffffffffffffffff2000000700000070000000000000000020000
00000000000000000000515555515d5d55515d5d55515d5d55515d5d5555d515dffffffffffffffffffffffffff2000000700000070000000000000000020000
0000000000000000000515155d5555155d5555155d5555155d5555155d155d55dffffffffffffffffffffffffff2000000777777770000000000000000020000
0000000000000000000115555555155555551555555515555555155555d515559ffffffffffffffffffffffffff2000000000000000000000000000000020000
0000000000000000000555d555d555d555d555d555d555d555d555d5555d555dfffffffffffffffffffffffffff2000000000000000000000000000000020000
00000000000000000015555515555555155555551555555515555555155155dffffffffffffffffffffffffffff2000000000800000000000000000000020000
000000000000000000515d555d515d555d515d555d515d555d515d555d555559fffffffffffffffffffffffffff2000000000000000000000000000000020000
1f500000155000001555d5555555d5555555d555555666655555d555555d155dfffffffffffffffffffffffffff2000000000000000000000000000000020000
fff1f151155151515155555551555555515555555666666661555555515555d59ffffffffffffffffffffffffff2000000000000000000000000000000020000
ffff5555d5515d5d55515d5d55515d5d55515d5d5666666665515d5d5555d515dffffffffffffffffffffffffff2000000000000000000000000000000020000
fff955515d5555155d5555155d5555155d55551566666666665555155d155d55dffffffffffffffffffffffffff2000000000000000000000000000000020000
fffd55d551551555555515555555155555551555666666666655155555d515559ffffffffffffffffffffffffff2000000000000000000000000000000020000
fffd515d55d555d555d555d555d555d555d517716666666666d555d5555d555dfffffffffffffffffffffffffff2000000000000000000000000000000020000
fff95d555555555515555555155555551555c7799666666665555555155155dffffffffffffffffffffffffffff2000000000000000000000000000000020000
ffffd551d5515d555d515d555d515d555d511799966666666d515d555d555559fffffffffffffffffffffffffff2000000000000000000000000000000020000
ffff95555555d5555555d5555555d55555c76799999666655555d5555555d55555fffffffffffffffffffffffff2000000000000000000000000000000020000
fffffd5515555555515555555155555551c7679999999555515555555155555551dfffffffffffffffffffffddf2000000000000000000000000000000020000
ffffd555d5515d5d55515d5d55515d5d5511178999995d5d55515d5d55515d5d5555d9ffffffffffffffff9d5552000000000000000000000000000000020000
fff955515d5555155d5555155d5555155d115788999555155d5555155d5555155d5555dffffffffffffffd555d52000000000000000000000000000000020000
fffd55d55155155555551555555515555555655888551555555515555555155555d55559ffffffffffff95555512000000000000000000000000000000020000
fffd515d55d555d555d555d555d555d555d5111155d555d555d555d555d555d55555d55dffffffffffffd51555d2000000000000000000000000000000020000
fff95d555555555515555555155555551555111115555555155555551555555515555555dffffffffffd55551552000000000000000000000000000000020000
ffffd551d5515d555d515d555d515d555d515d555d515d555d515d555d515d555d555d55dffffffffffd5d555552000000000000000000000000000000020000
ffff9600555500500555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555552000000000000000000000000000000020000
fff668801556888d2155555551555555515555555155555551555555515555555155555551555555515555555152222222222222222222222222222222220000
fff188780051877625515d5d55515d5d55515d5d55515d5d55515d5d55515d5d55515d5d55515d5d55515d5d55515d5d55515d55500000000000000000000000
fff908862056888d2d5555155d5555155d5555155d5555155d5555155d5555155d5555155d5555155d5555155d5555155d555515100000000000000000000000
fffd11d2215100100555155555551555555515555555155555551555555515555555155555551555555515555555155555551555500000000000000000000000
fffd510215d511d115d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d555d5100000000000000000000000

__gff__
040018018c8c8c8c8c8c8c0e2828282828282828282a180b4b4b4b4b4b4b4b4b060e08000800000000000000000100280000000000000000000001010101010101010001000102010000010101020201011101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101090000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0d14000000000509090909060000130d0d0d0d0d0d0e0405050909060c0d0d0f030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303032d47
000000000a000a0509090505000000130d0d0d0d14040505050508080c0d0d0d030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303032d00
000000000000000a08050800000000000000000000000000000000110d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d57
0000000000000030000000000000000000000030000000000000000c0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
000000000000000000000000000000000000000000000000000000130d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d33
000000110d120000000000000000000004050a070b00000000000000130d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
000011140000000000006f0000006f04050905050b0b00000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d34
0f0f14000000000000310011471200310a0509060b0b0b0b0000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0e0000000000000000110d0d0d120005050508000b0b0b0b00000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d35
0d0d00000000000000000cab220d34120a050800000b0b0b0b0b000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0e00000000000011cd332222490d570d120000000b0b300b0b000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d37
0d0d0f000000110f0d0d0d0d0d0d0d0d0d0d0000000b0b0b0b0b000000300000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d300e0000000c0d0d0d0d0d10100d0d0d14000000000b0b0b00000000002f00030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d36
0d0d0e000000130d0d0d0d0e316f130d1400000000000000000000002f000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0d0e000000000c0d0d0d0e0000000000000000000000300000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d32
0d0e0000000000130d0d0d0d120000000000000000111200110d140000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0e000000003000130d0d0d0d12000000000000110d0d0f0d14000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d49
0d0e0000000000000013100d0d0e0000003000110d0d0d0d1400000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0e0a00000705050707000c0d0d12000000110d0d0d10140000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d95
0d140007050505090905000d0d0d0d0f0f0f0d0d0d0e000000000000110f0f0f030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
1404050505050505050800130d0d0d100d0d10100d0e0000000000110d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d28
050505050509050a00003000000a0505050505060c0d12000000110d0d0d0d10030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
05090905090909050000000000050909090505080c0d0d0f0f0f0d0d0d0d1400030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d29
090505050505050a00000000000a0505050905110d0d0d0d0d0d0d0d0d0e0000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
050508110f0f120000000000000004050505080c0d0d0d0d0d0d0d0d0d0e0000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d26
00110d0d0d310d0d12000000003000000000110d0d0d0d0d0d0d0d0d0d0d1200030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0f0d0d0d0d0d0d0d0d1200000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0f030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d39
0d0d0d0d0d0d0d0d0d0d12000000000000110d0d0d0d0d0d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0d140405070d0d0d0d0d0e000000000f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d38
0d1400050905130d0d0d140700000000130d0d0d0d0d0d0d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
000000050505050505050505060000000000131010100d0d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d48
0000000a050505090909090505060000000000000000130d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
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
0101000030f450000031f2531f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

