pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================
cartdata"pn_undune2"
local _a,_b,_c,_d,_e,_f,_g=dget"0",dget"1",dget"7",dget"8",dget"26",{},{
dget"35",
2500,
dget"36"
}
for i=1,dget"5" do
local _h={}
for j=1,5 do
_h[j]=dget(i*5+j)
end
add(_f,_h)
end
local g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,hq,_u,_v,_w,_x,_y={},{},{},{},{},{},{},{{},{}},t(),1,{0,0},{0,0},0,0,false,0,0,{},_e*8-128,0
local _z,_0,_1,_2=hq,{0,0},{},0
g_._6=function(self)
if self._b2._7==1 then
_3,_4,_5=1,{}
_f5(6,"⬆️",function()
_y=mid(1,_y-1,#_bp._ef)
_5=_bp._ef[_y]
if(_y<_3) _3-=1
end, 10)
_f5(17,"⬇️",function()
_y=mid(1,_y+1,#_bp._ef)
_5=_bp._ef[_y]
if(_y>_3+2) _3=min(_3+1,#_bp._ef-2)
end, 10)
_f5(32,_bp.id==5 and"order" or"build",function()
_8=nil
if(_dx) _dx:_b5()
end)
_f5(96,"close",function()
_8=nil
end)
_8=self
end
end
g_._ad=function(self)
local _ab=self._ab
pal({nil,nil,nil,nil,nil,nil,nil,_ab,nil,_ab,_ab,self.col1,nil,_ab})
if self._ah then
pal(self._cf[self._ae], self.col1)
else
pal(11,self.col1)
self._ae=1
end
end
local _ac=function(self)
pal(7,8)
if(self.id==80 and _bp._af==2 and not _bp._ag) pal(7,11)
end
function _9(self, _aa)
self.procstep,self.last_process,self._af=0,self._af,_aa
if(self.last_process>0) self._ag=not self._ag
if(_aa==1) self._b2._ah=true self._b2._ai=self
end
local _aj=[[id|_bu|_av|my|ico_spr|type|w|h|z|trans_col|_bn|_bo|_7|col1|_ab|icol1|icol2|ico_w|ico_h|req_id|req_faction|max|_ei|power|_e1|_b8|_f3|range|_cm|fire_size|fire_rate|fire_sfx|death_sfx|norotate|altframe|_cw|_cp|_af|spent|_cz|_cr|_cs|_ae|col_cycle_src|storage|capacity|is_repairable|ai_build|ai_priority|moves|tracked|on_foot|is_building|is_unit|is_dockable|capturable|can_fire|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|req_level|_cf|_by|description|_b4|_b5
1|64|64||170|2|2|2|0||nil|||||||2|2|1|||100|0||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||1,1,1,1||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_6
2|22|22||162|2|2|2|0||1|||||7|5|2|2|1|||20|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0.5|nil||nil|1|nil|nil|nil|nil||1|nil|||4,4,4,4||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22||162|2|1|1|0||1|||||6|6|2|2|1|||5|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil||nil|1|nil|nil|nil|nil||1|nil|||1,1,1,1||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
13|133|133||164|2|1|1|0||1|||||||2|2|16|||50|0||50|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|3|nil||nil|1|nil|nil|nil|nil||nil|nil|||4,4,4,4||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
18|66|66||172|2|2|2|0||1|||||||2|2|1|||300|-100||200|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||1,1,1,1|12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
17|68|68||174|2|3|2|0||1|||||||2|2|18|||400|30||450|0||||||53|nil||8|0|0|0|0|0|1|1|11|1000|nil|1|nil|30|nil||nil|1|nil|1|1|nil||1|1|||1,1,1,1|11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ad|
16|106|106||136|2|2|2|0||1|||||||2|2|17|||400|30||500|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|27.5|nil||nil|1|nil|nil|nil|nil||1|1|||2,2,2,2|8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
15|104|104||134|2|2|2|0||1|||||||2|2|17|||150|5||150|0||||||53|nil|||0|0|0|0|0|1|1||1000|nil|1|nil|15|nil||nil|1|nil|nil|1|nil||1|1|||2,2,2,2||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
12|108|108||168|2|2|2|0||1|||||11|3|2|2|16|-3||300|10||300|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||2,2,2,2||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_6
11|110|110||138|2|2|2|0||1|||||||2|2|16|-1||400|10||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|17.5|nil||nil|1|nil|nil|nil|nil||1|1|||4,4,2,4||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_6
14|96|96||140|2|2|2|0||1|||||||2|2|17|||400|20||350|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||2,2,3,2||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_6
7|98|98||142|2|3|2|0||1|||||||2|2|14|||600|20||200|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|60|nil||nil|1|nil|nil|1|nil||1|1|||3,3,3,3||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_6
6|101|101||166|2|3|2|0||1|||||||2|2|14|||500|35||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||5,5,5,5||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_6
9|128|128||230|2|3|2|0||1|||||||2|2|14|||700|20||200|0||||||53|nil||2|0|0|0|0|0|1|1|8|0|nil|1|nil|60|nil||nil|1|nil|1|1|nil||1|1|||5,5,5,5|0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
10|71|71|0|232|1|1|1|1|11|1|||||||2|2|16|||125|10|20|200|0|5|1|0|27|58|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|nil||nil|1|1|nil|1|1||1|1|6|6|5,5,5,5||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
8|87|87|2|234|1|1|1|1|11|1|||||||2|2|16|||250|20|60|200|0|10|2|1.9|40|59|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|7.5|nil||nil|1|1|nil|1|1||1|1|6|6|6,6,6,6||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
5|61|61||228|2|3|3|0||1|||||11|3|2|2|17||1|500|50||500|0||||||53|nil||8|0|0|0|0|0|1|1|11|0|nil|1|nil|25|nil||nil|1|nil|nil|1|nil||1|1|||6,6,6,6|11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|_ad|_6
4|131|131||224|2|2|2|0||1|||||||2|2|16|||500|40||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||7,7,7,7||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
19|58|58||226|2|3|3|0||1|||||||2|2|5||1|999|80||1000|0||||2,400||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|40|nil||nil|1|nil|nil|nil|nil||1|1|||8,8,8,8||pALACE|tHIS IS YOUR pALACE.||
23|49|49||236|1|0.5|0.5|1|11|12|||||15|3|2|2|12|-3||60|0|6|20|0.05|3|1|0|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|1|nil|1|nil|1|nil||1|1|nil|nil|||2,2,2,2||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
22|48|48||236|1|1|1|1|11|12|||||15|3|2|2|12|-3||100|0|4|50|0.03|3|1|0|15|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|2|1|nil|1|nil|1|nil||1|1|nil|nil|||2,2,2,2||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
21|49|111||194|1|0.5|0.5|1|11|11|||||12|9|2|2|11|-1||100|0|4|45|0.07|5|2|1|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|1|nil|1|nil||1|1|nil|nil|||3,3,1,3||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
20|48|127||194|1|1|1|1|11|11|||||5|5|2|2|11|-1||200|0|8|110|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|5|1|nil|1|nil|1|nil||1|1|nil|nil|||3,3,1,3||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|253||236|1|1|1|1|11||||9|4|9|1|2|2||1||0|0|16|220|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|1|nil|1|nil||1|nil|nil|nil|||8,8,8,8||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||2||0|0|400|10|0.27|1|1|0|800|60|57|1|49|8|0|0|0|0|0|1|1||0|nil|nil|nil|70|1|nil|1|nil|1|nil||1|nil|nil|nil|||8,8,8,8||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||||0|0|16|110|0.1|5|2|1|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|5|1|nil|1|nil|1|nil||1|nil|nil|nil|||4,4,4,4||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
42|51|51|4|204|1|1|1|1|11|14|5||||15|4|2|2|1|1||150|0|8|100|0.3|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|5|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|2,2,2,2||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
41|52|52|6|206|1|1|1|1|11|14|5||||||2|2|1|||200|0|14|130|0.27|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3,3,3,3||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
36|53|53|8|196|1|1|1|1|11|7|5||||||2|2|17|||300|0|25|200|0.17|5|1|0|27|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|10|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|4,4,4,4||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
35|55|55|10|198|1|1|1|1|11|7|5||||15|4|2|2|17|||600|0|60|300|0.13|6|1|0|30|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|6,6,6,6||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
34|54|54|12|202|1|1|1|1|11|7|5||||15|4|2|2|17|-2||450|0|150|100|0.2|10|2|1.9|40|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|5,5,5,5||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
38|50|50|14|192|1|1|1|1|11|7|5||||12|12|2|2|17|||300|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|0|1|1|15|1|1|nil|nil|1|nil||nil|nil|1|nil|8|7|2,2,2,2||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
39|73|73|16|238|1|1|1|8|11|6|5||||11|3|2|2|17|||800|0|0|100|1.33|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1.6|1|nil|nil|nil|1|nil||nil|nil|1|nil|8|7|5,5,5,5||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
33|20|40|20|160|1|1|1|4|11|6|||||||2|2|4|-3||600|0|37|1|0.80|4|2|1.9|33|59|54|nil|22|8|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|7,7,7,7||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
37|38|38|24|192|1|1|1|1|11|7|5||||0|5|2|2|17|||900|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|1|nil|nil|nil|1|nil||1|nil|1|nil|8|7|4,4,4,4||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
30|57|57|26|198|1|1|1|1|11|7|||||12|9|2|2|4|1||600|0|60|110|0.2|9|3|0|27|52|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|11|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|7,7,7,7||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
32|56|56|28|200|1|1|1|1|11|7|||8|12|||2|2|4|3||800|0|80|400|0.07|8|2|1|33|61|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|18|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|8,8,8,8||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
50|72|72|30||1|1|1|8|11|||0|||||2|2||3||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|8,8,8,8||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
50.5|72|72|30||1|1|1|8|11|||0|||||2|2||4||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|8,8,8,8||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
40|51|205|4|204|1|1|1|1|11|14|||||11|1|2|2|1|2||150|0|10|80|0.4|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|2,2,2,2||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
31|54|202|12|202|1|1|1|1|11|7|||||11|3|2|2|4|2||750|0|0|120|0.2|9|1.9|1.9|60|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|17.5|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|7,7,7,7||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
61|88|88|||9|1|1|1|11||||||||2|2||||0|0|300|1000|0.35|0|||7|50||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|nil|nil|||nil|nil|nil|||3,3,3,3||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
62|32|32|||1|1|1|1|11|||2|||||1|1|||||||1|0.1||||||53|1|||0|0|0|0|0|1|1||0|nil|nil|nil|0|nil|nil|nil|nil|nil|nil|||nil|nil|nil|||1,1,1,1||sPICE bLOOM|||
80|3|3||3|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil|||1,1,1,1||rEPAIR||_ac|action_click
81|1|1||1|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil|||1,1,1,1||lAUNCH||_ac|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _ak=_gp(_aj,"|","\n")
_aj={}
for i=2,46 do
local _al={}
for j=1,68 do
local _am=_ak[i][j]
if(j<63) _am=tonum(_am)
if j==66 then
_an,_am=_gp(_am,"~"),"" for line in all(_an) do
_am..=line.."\n" end
end
_al[_ak[1][j]]=_am
end
_aj[_ak[i][1]]=_al
end
for i=-3,66 do
_w[i]={}
for l=-3,66 do
_w[i][l]=0
end
end
cursor={
w=8,h=8,_ao=function(self)
return {
x=self.x+(_dq and 0 or _at),y=self.y+(_dq and 0 or _au),w=0,h=0
}
end,_ap=function(self)
local _aq=(_bp and _bp.is_unit and _bp._7==1 or _ds) and 3 or 0
spr(_aq/3, self.x-_aq, self.y-_aq)
end
}
for my=0,31 do
for mx=0,125 do
local _ar,_as=mget(mx,my)
if(_ar==171) _at,_au,_as=_f[1][4]-56,_f[1][5]-56,_aj[1]
for o in all(_aj) do
if(o._av==_ar) _as=o break
end
if _as and _ar>=32 then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_fb(mx,my+1))
_be(_as, ox*8, oy*8)
end
end
end
_aw=cocreate(function()
while true do
if t_%30==0 then
_gn(false)
_k={}
for _cv in all(_j) do
_k[_c1(_cv)]=_cv
end
local _ax={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ay=_fb(i,l)*8
if(_w[i][l]==16) _ax[(i/2).."," ..(l/2)]=_ay>0 and sget(_ay%128+3, _ay\128*8+3) or 15
end
yield()
end
end
_az,_a0,_a1,_o=0,0,{0,0},{{},{}}
for building in all(_i) do
if building.id!=13 then
if building._7==1 or hq and _gj(building) then
_ax[(building.x\16).."," ..building.y\16]=building.col1
end
if building._7==1 then
_az-=building.power
_a0+=building.storage
end
_a1[building._7]+=1
_gr(_o[building._bq], building.id, building)
_k[_c1(building)]=building
end
end
for _cv in all(_j) do
if hq and (_cv._7==1 or _gj(_cv) and not _cv._cg) then
_ax[(_cv.x\16).."," .._cv.y\16]=_cv.col1
end
if(_cv._bq>0) _gr(_o[_cv._bq], _cv.id, _cv)
end
hq,_l=_o[1][16] and _az>0,_ax
local _a2,_a3=0
for yy=0,30 do
for xx=0,31 do
local _am=_l[xx.."," ..yy] or 0
if xx%2==0 then
_a3=_am
else
_a3|=_am<<4 poke(0x4300+_a2,_a3) _a3=0 _a2+=1
end
end
if(yy%2==0) yield()
end
if(_g[3]>0 and _g[1]>=_g[3]) _a4=1
if(_a1[2]==0 and _a>1) _a4=2
if(_a1[1]==0) _a4=3
if _a4 then
local _a5=40
for data in all{_a4,t()-_p,_0[1],_0[2],_r[1],_r[2],_q[1],_q[2]} do
dset(_a5, data)
_a5+=1
end
?"\^jae\+8h\#0\^w\^t         \^-w\^-t\^d2\^jaf\-cmission " ..(_a4<3 and"complete" or"failed"),_c
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _a6=0
_a7,_a8,_a9,_ba={split"250,250" },rnd"1",0,0
end
function _bb(_bc,_bd)
local _bg=_bc.req_faction
return not _bg
or _bg==_bd
or (_bg<0 and _bg!=-_bd)
end
function _be(_as, x,y, _7, _bf)
local _bh=_bz(_as, x,y, _as.type, nil, g_[_as._b3], g_[_as._b4], nil)
_bh.ico_obj,_bh._cp,_bi,_bh._7=_bz(_as, 107,0, 4, _bh, nil, nil, g_[_as._b5]), _bi and _as._b8/2 or _as._b8, false, _bh._7 or _7
if _bf then
_bh._bj=_bf._bj
else
if _bh._7 then
_bh._bj,_h=1,_f[1]
else
local _bk=9999
for i=1,#_f do
local _bl=_gv(x,y,_f[i][4],_f[i][5])
if(_bl<_bk) _bh._bj,_bh._7,_bk=i,min(i,2),_bl
end
end
end
_bh._bq,_bh.build_objs,_h=_7 or _bh._7,{},_f[_bh._bj or _bf._bj]
_bm=_h[1]
_bh._e3,_bh.col1,_bh._ab=_bm,_h[2],_h[3]
if(not _bb(_bh,_bm)) return
for o in all(_aj) do
if o._bn
and (o._bn==_bh.id or o._bo==_bh.id)
and _bb(o,_bm)
then
add(_bh.build_objs,_bz(o, 107,0, 5, _bh, nil, nil, function(self)
if _8 then
_bp=self
else
if self.is_building and #_i<150 or self.is_unit and #_j<75 then
_9(self, 1)
elseif _bh._bq==1 then
_f7"uNABLE TO CREATE MORE" end
end
end)
)
end
end
if _as.col1 then
_bh.col1,_bh._ab=_as.col1,_as._ab
end
if(_bh._cg) _bh._7=0
local _br,_bs=x\8,y\8
if _as.is_building and not _as.is_unit then
local _bt=_as._bu==22
for xx=0,_as.w-1 do
for yy=0,_as.h-1 do
if not _bt or fget(_fb(_br+xx, _bs+yy),5) then
_fc(_br+xx, _bs+yy, _bt and 22 or _bh._7==1 and 81 or 103)
end
end
end
if(not _bt) add(_i,_bh)
if _bh.id==17 and not _bh._b2 then
_dy(_bh)
end
else
_bh.r=not _bh.norotate and (_br%8)*.125
if _bh.can_fire then
_bh._bv=function(self)
self._ct,self._cy,self.bullet_y,self.bullet_tx,self._bw=4,self.x+4,self.y+4,self._cx.x+self._cx.w/2,self._cx.y+self._cx.h/2
local dx,dy=self.bullet_tx-self._cy,self._bw-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bx=dx/d,dy/d
_gl(self.fire_sfx)
_c8(self)
end
if _bh.moves then
_bh._by=split"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_bh._e3].." " .._bh._by
else
_fc(_br,_bs,_bh._7==1 and 2 or 133)
end
end
if(_bf and _bf.id==17) _bh._cb=_bf
add(_j,_bh)
_en(_bh, nil, true)
end
_c8(_bh)
return _bh
end
function _bz(_b0, x,y, _b1, _b2, _b3, _b4, _b5)
local _b6={
_b7=_b0,id=_b0.id,_b8=_b0._b8,x=x,y=y,_b9=x/8,_ca=y/8,type=_b1,_b2=_b2,_b5=_b5,w=_b0.w*8,
h=_b0.h*8,_cc=_b0._bu,_cd=_b0.w,
_ce=_b0.h,
_cf=split(_b0._cf),_cg=_b0.z>1,_ao=function(self)
return {
x=self.x,y=self.y-self.z,w=_b1>3 and 16 or self.w,h=_b1>3 and 16 or self.h
}
end,_ap=function(self)
local x,y,_ch=self.x\1,self.y\1,self.r
if _b1>2
or (x+self.w>=_at
and x<=_at+127
and y+self.h>=_au
and y<_au+127+self.z)
then
pal()
palt(0,false)
if _ch then
ovalfill(x+3, y+3, x+self.shad_w, y+self.shad_h, 1)
end
if(self.trans_col and _b1<=3) palt(self.trans_col,true)
if(self._e3 and self.id!=4) pal(12,self.col1) pal(14,self._ab)
if _b1>3 then
local _ci=_b1==5 and self or self._b2
?"\#0\-j\|g\^x7  \n\-j  \n\-j  \n\-j\^y2  ",x,y
local hp=_ci._b8
local _am=self._af==1 and _ci._cp/6.666 or 15*(_ci._cp/hp)
if(_ci._cp>0 and not _8) rectfill(x,y+17,x+_am,y+18, self._af==1 and 12 or (split"8,10,11,11")[_ci._cp\(hp/3)+1])
pal(11,_ci.icol1) pal(3,_ci.icol2)
end
if self._cf then
pal(self.col_cycle_src, self._cf[self._ae])
end
if(flr(self._cs)%2==0) pal(split"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")
if(_b4) _b4(self)
if _ch then
local cs,ss,_cj,_ck,cx,cy,dx,dy=cos(_ch),sin(_ch),126.7,self.my-0.3,127.5,self.my+.5,x+3.5,y-self.z+3.5
_ck -=cy
_cj -=cx
local sx,sy,_cl=cs*_cj+cx,-ss*_cj+cy,-_cj*8
for py=dy-_cl, dy+_cl do
tline(dx-_cl,py,dx+_cl,py,sx+ss*_ck,sy+cs*_ck,cs/8,-ss/8)
_ck+=.125
end
else
if _b1>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
if _b1==5 then
if _b0.is_building then
fillp"0XAFAF" rectfill(x+15,y+15,x+15-(self._cd*2),y+15-(self._ce*2),245)
fillp()
end
if self._ag and not _8 then
?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666"
end
end
else
spr(self._bu, x, y, self._cd, self._ce)
end
end
end
if _b1<=2 then
if self._cy then
if self._cm==1 then
pset(self._cy,self.bullet_y, rnd{8,9})
else
local _cn=self._cm<=2
_g1(
self._cy, self.bullet_y,self.fire_size,
0, 0, _cn and -.3 or 1,0,_cn and 10 or 2.5,_cn and split"7,10,9,8,2" or {15})
end
end
if((self._bu==72 or self._cp<self._b8/2 and self.can_smoke) and _gw"7") _g1(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,split"10,9,8,6")
self._cr=0
end
end,_co=function(self)
local _cp,id,_cq=self._cp,self.id,self._cq
self._cs=max(self._cs-.4,1)
if self._cr>0 and self._bq>0 and id!=42 then
_gn(true)
if(stat"54" >5) music"0"
if(self.is_repairable and self.moves and _cp<99 and self._ct<=6) _gg(self,_gu(self._bq,9) or self._cb)
if(self._bu<=49 and _cp<100) self._cd,self._ce=0.5,0.5
if(self.can_fire and self._ct==0) _ey(self, _cq)
end
if(_b1<=2 and _cp<=0 and not self.death_time) self._ct,self.death_time,self._cu=5,.25 _gl(self.death_sfx) _a6+=(_b1==2 or self._bu==72) and .25 or 0
if self.death_time then
self.death_time-=.025
if self.death_time<=0 then
if _b1==2 then
for xx=0,self._cd-1 do
for yy=0,self._ce-1 do
_fc(self.x/8+xx, self.y/8+yy, 21)
if(self.soldiers_on_destroy and #_j<75) _be(_aj[rnd{21,23}],self.x+xx*8,self.y+yy*8,self._7,self)
end
end
del(_i,self)
_q[_cq._bq]+=1
else
local gx,gy=_c2(self)
if(_fb(gx,gy)==0) _fc(gx,gy,33)
if(id<=16) _fc(gx,gy,21)
if(self._cb) self._cb._ah=false
if(self._er and self._er.id==9) self._er._cf={0}
_du(self)
if id==42 then
_e7(self,gx,gy,function (_cv,x,y)
if(_fb(x,y)==0) _fc(x,y,10)
end,4, true)
end
if(_cq) _r[_cq._bq]+=1
end
_c3(self)
else
if(_gw(1) and not self.on_foot) _c6(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self._cw then
if t_%self._cw==0 then
if self.altframe
and self._ct==2 then
self._bu=self._cc+(self.altframe-self._bu)
self.my=self._bu
end
self._ae=(self._ae%#self._cf)+1
end
end
if self._cy then
self._cy+=self.bullet_dx*2
self.bullet_y+=self._bx*2
if _gv(
self._cy,self.bullet_y,self.bullet_tx,self._bw) < 2
then
_c6(self._cy, self.bullet_y, self._cm, self.fire_size)
local _cx=self._cx
if _gv(
self._cy,self.bullet_y,_cx.x+_cx.w/2,_cx.y+_cx.h/2) < 4
then
_cx._cp-=self._e1*rnd"1" _cx._cr,_cx._cq=self._cm,self
if id==40 and _cx.moves and _gw"5" then
_e4(_cx, self)
_en(self)
elseif _cx.old_fact_data then
_cx._e3,_cx._7,_cx._bq,_cx.col1,_cx._ab,_cx.old_fact_data
=
unpack(_cx.old_fact_data)
_en(_cx)
end
end
self._cy=nil
end
end
if self._af>0
and not self._ag
and not self._gc then
if self._af==1 and self.spent>=self._ei then
self._gc,self._cp=true,100
if(self._b2._7==1) _gl"56" _f7"cONSTRUCTION cOMPLETE"
if _b0.is_unit
and self._bn !=1 then
local ux,uy=_ew(self._b2)
_be(_b0,ux,uy,self._b2._7,self._b2)
_ga(self)
end
elseif self._af==2 and _cp>self._b8 then
self._af=0
if self.is_unit and self.moves then
self._er._cf,self._ct={0},0
_c0(self,_ew(self))
end
else
if _c4(-.25,self._af==1 and self._b2 or self) then
self.spent+=.25
self._cp=self._af==1 and (self.spent/self._ei)*100 or _cp+2
end
end
end
self._cz=max(self._cz-.1)
if self._7==1 then
if(id==18) self._by="wINDTRAP (\|f\^:0804061f0c040200\|h\-f" .._az..")"
if(self.storage>0) self._by=_b0._by.." (" ..flr(_dk/_a0*100).."%)" end
end
}
for k,v in pairs(_b0) do
if not _b6[k] and v!="" then
_b6[k]=v
end
end
return _b6
end
function _c0(_b6,x,y)
_b6.x,_b6.y=x,y
end
function _c1(self)
local x,y=_c2(self)
return x.."," ..y
end
function _c2(_b6)
return (_b6.x+4)\8,(_b6.y+4)\8
end
function _c3(_b6)
_bp=_bp!=_b6 and _bp
end
function _c4(_c5, _b6)
if(_g[_b6._7]+_c5<0) return false
_g[_b6._7]+=_c5
if _b6._7==1 and _g[1]%5==0 then _gl"63" end
return true
end
function _c6(x,y,_c7)
_g1(x, y, 2,0, 0, .1, -.01, _c7==1 and 5 or 20, _c7==1.9 and split"3,11,3" or split"5,7,5,7,10,8,9,2")
end
function _c8(_c9)
if(_c9._7!=1 and _c9._ct!=4) return
local _da=_c9.type+1
for xx=-_da,_da do
for yy=-_da,_da do
local _db,_dc=_c9.x\8+xx,_c9.y\8+yy
_w[_db][_dc]=16
_ej(_db,_dc)
for dy=-1,1 do
for dx=-1,1 do
_ej(_db+dx,_dc+dy)
end
end
end
end
end
function _update60()
local _dd,_de,_df=stat"32",stat"33",stat"34"
left_button_clicked,right_button_clicked
=
(_df==1 and _dv !=_df) or btnp"5",(_df==2 and _dv !=_df) or btnp"4"
if not _dg then
_dg,_dh=64,64
elseif _dd==_di and _de==_dj then
b=btn()
_dg+=b\2%2-b%2
_dh+=b\8%2-b\4%2
else
_dg,_dh=_dd,_de
end
_dg,_dh=mid(_dg,127),mid(_dh,127)
cursor.x,cursor.y,_di,_dj=_dg,_dh,_dd,_de
cx,cy=(_at+_dg)\8,(_au+_dh)\8
_2+=1
if not _8 then
if(_dg<2) _at-=2
if(_dg>125) _at+=2
if(_dh<2) _au-=2
if(_dh>125) _au+=2
_at,_au,_dk=mid(_at,_x),mid(-10,_au,_x),tostr(flr(_g[1]))
if t_%6==0 and _ba==0 then
if(_gw"18") _a9=rnd".04" -.02
_dl,_dm=_a7[#_a7][1],_a7[#_a7][2]
add(_a7,{_dl+sin(_a8),_dm-cos(_a8)})
_a8+=_a9
local _cv=_f4((_dl+4)\8,(_dm+4)\8)
if _cv and not _cv._cg and fget(_fb(_c2(_cv)),2) then
_du(_cv)
_ba=1
_gl"50" end
end
if(#_a7>30) del(_a7,_a7[1])
if(_ba>0) _ba+=1 _ex(_dl,_dm,rnd"1")
_ba%=200
for _cv in all(_j) do
if(_cv._cu) then
if(not coresume(_cv._cu, _cv)) _cv._cu=nil
end
end
for p in all(_n) do
p.dy +=p._g2
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cp +=1
if(p._cp>=p._g6) del(_n,p)
end
if t_%_b==0 then
local _cv=rnd(_j)
if(_1[_cv._e3] or t_%18000==0)
and _cv._7==2
and _cv.can_fire
and _cv._ct==0
then
_gi(_cv)
end
local _dn=rnd(_i)
if _dn._7==2
and (not _dn._ai or _dn._ai._af!=1)
and t()>300
then
local u=rnd(_dn.build_objs)
if u and u.ai_build then
u:_b5()
end
if _dn._cp<_dn._b8 and _dn._af!=2 then
_9(_dn, 2)
end
end
local _do=_gu(2,19)
if _do
and _1[_do._e3]
and _do._cz<=0
then
_gi(_do)
end
end
coresume(_aw)
end
_dp=false
if _bp then
_dq=true
_gb(_ed)
_gb(_ee)
if(_bp.ico_obj and not _8 and not _dp) _gb(_bp.ico_obj) _gb(_bp._ai)
if(_8) foreach(_bp.build_objs, _gb) foreach(_4, _gb)
_dq=false
end
if not _8
and not _dp then
foreach(_j, _gb)
foreach(_i, _gb)
end
if(stat"34" >0 or left_button_clicked or right_button_clicked)
and not _8
and _dg>91 and _dg<123
and _dh>91 and _dh<123 then
_bp=_dw
if(stat"34" ==1 or left_button_clicked) and _dt((_dg-91)*2, (_dh-91)*2) then
elseif _2>10 then
_at,_au=mid((_dg-96)*16, _x),mid(-10,(_dh-97)*16, _x)
end
elseif left_button_clicked then
if _dp then
if(_bp) _v=0
if not _8 and _bp._b2 then
if(_bp._b5) _bp:_b5()
_bp=_dw
goto skip_collisions
end
if(_8 and _5._f6 and _5._b5) _5:_b5()
if(_bp._7==1 and _bp.is_unit and _bp!=_dw and _bp.moves) _gl"62"
if(_bp._bq!=1 and _dw and (_dw.is_unit or (_dw.id==19 and _ds)) and _dw._7==1) _bp._cs=10 _ey(_dw, _bp, true) _bp=nil
else
_dt(cx,cy)
local _dr=_bp and _bp._ai
if _dr
and _dr._gc
and _d9 then
_be(_dr._b7,cx*8,cy*8,1)
_ga(_dr)
_gl"61" end
end
_ds=false
elseif right_button_clicked and not _8 then
_ds,_bp=false
end
::skip_collisions::
_dv,_dw,_dx=_df,_bp,_5
t_+=1
end
function _dt(x,y)
if _bp
and _bp._7==1
and _bp.moves
and _bp._ct!=7
then
_bp._cu=cocreate(function(_cv)
_ff(_cv, x, y)
_en(_cv, nil, true)
end)
_c3(_bp)
_2=0
return true
end
return false
end
function _du(_cv)
del(_j,_cv)
if _cv.id==38 and #_o[_cv._bq][38]<=1 then
_d0=_gu(_cv._bq,17)
if(_d0) _dy(_d0)
end
end
function _dy(_dz)
local _d1=_be(_aj[38],_dz.x,_dz.y,_dz._7,_dz)
_d1._ct=9
end
function _draw()
cls"15"
camera(_at+(16-rnd"32")*_a6, _au+(16-rnd"32")*_a6)
_a6=_a6>0.05 and _a6*0.95 or 0
for i=1,#_a7 do
if(i!=#_a7 and i%2==1) fillp(0xa5a5.8)
circfill(
_a7[i][1]+4,_a7[i][2]+4,4,split"15,9,4" [(i-#_a7)%3+1])
fillp()
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
if(_ba>0) spr(88+_ba\100, _dl, _dm)
for building in all(_i) do
if not _8
then
if(t_%3==0) building:_co()
if(building._ai) building._ai:_co()
end
building:_ap()
if(building==_bp) rect(_bp.x, _bp.y, _bp.x+_bp.w-1, _bp.y+_bp.h-1, 7)
end
pal()
for p=1,2 do
for _cv in all(_j) do
if(p==1 and not _cv._cg) or (p==2 and _cv._cg) then
if(not _8) _cv:_co()
if(_cv._af!=2 or not _cv.moves) _cv:_ap()
if(_cv==_bp) ?"\f7\^:42c300000000c342",_bp.x, _bp.y-_bp.z
end
end
end
pal()
for p in all(_n) do
if(p._g4) fillp(p._g4)
circfill(p.x,p.y,p.r,p._g3[ flr((#p._g3/p._g6)*p._cp)+1 ])
fillp()
end
local _d2,_d3=_at\8,_au\8
palt(0,false)
palt(11,true)
for xx=_d2-1,_d2+16 do
for yy=_d3-1,_d3+16 do
local gx,gy,_d4=xx*8,yy*8,_w[xx][yy]
if _d4!=0 and _d4!=16 then
spr(_d4+31,gx,gy)
elseif _d4<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
local _dr=_bp and _bp._ai
if _dr
and (_dr.type==5
and not _dr.moves)
and _dr._gc
then
local _d5,_d6=(_dg+_at)\8, (_dh+_au)\8
local _d7,_d8,w,h=_d5*8-_at,_d6*8-_au,_dr._cd,_dr._ce
_d9,_ea,_bi=false,false,false
for xx=-1,w do
for yy=-1,h do
local _am=_fb(_d5+xx, _d6+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_am,4)) _d9=true
else
if(fget(_am,5)) _bi=true
if(not _fe(nil,_d5+xx,_d6+yy) or _am==0 or _am<=11 or _am>=23) _ea=true
end
end
end
if(_ea and _dr._b7._bu!=22) _d9=false
fillp"0b1110110110110111.1" rectfill(_d7, _d8,_d7+_dr.w, _d8+_dr.h, _d9 and 11 or 8)
fillp()
end
?"\^j02\f4\|f\^x3\*z-\*8-\n\^xz\^j00\#9   \^xn \^j01\|j\^xz\^y2   \^xn "
_v-=1
?(_v>0 and _f9 or _bp and _bp._by or""),2,2,0
?sub("00000", #_dk).._dk, 103,2, _d
if hq!=_z then
_u=1
if _z then _f7"pOWER LOW. bUILD wINDTRAP" end
_gl"55" end
_z=hq
local _eb=5934
for _ec=17152,17632,16 do
memcpy(0x6000+_eb, _ec, 16)
_eb+=64
end
?"\^jnn\|e\-e\^x3\^y5\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jvn\^y5\|j\-e\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jnm\-g\|j\^y1\^x2\*5▤゛\^jnv\|f\^y1\^x2\*5▤゛\^g",_d
?"\f7\|e\-f\^x3\^y4\^h\-f\|c\n|\n|\^g\|i\-n\^h\-f\|c\n|\n|\^g\^x2\-a\|e\*4-\^g\^y5\-a\|j\*4_\0",ceil(92+_at/16),ceil(92+_au/16)
if _u>0 and _u<77 then
for i=1,300 do
pset(92+rnd"31",92+rnd"31",5+rnd"3")
end
_u+=1
end
if _bp and _bp.ico_spr then
_c0(_bp.ico_obj,107,20)
_bp.ico_obj:_ap()
_ed,_ee=nil
if _bp._7==1 then
if _dr then
_c0(_dr,107,44)
_dr:_ap()
end
if _bp._cp<_bp._b8
and _bp.is_repairable
and _bp.is_building then
_ed=_bz(_aj[80], 115,28, 3, {}, nil, _ac, function()
_9(_dw, 2)
end)
_ed:_ap()
end
if(_bp.id==19
and _bp._cz<=0)
or _bp.id==37
then
_ee=_bz(_aj[81], 107,29, 3, {}, nil, _ac, function()
if _dw.id!=37 then
_f7"pICK tARGET" _ds=true
else
local mx,my=_c2(_dw)
local _am=_fb(mx,my)
if _am>=12 and _am<=22 then
_dw._cp,_dw=0
_be(_aj[1],mx*8,my*8,1)
_gl"61" end
end
end)
_ee:_ap()
end
end
end
pal()
if _8 then
fillp(▒)
rectfill(unpack(split"0,0,127,127,0"))
fillp()
rectfill(3,18,124,92,_d)
rect(3,18,124,92,_c)
_bp._ef={}
rectfill(unpack(split"6,21,27,89,0"))
local _eg=1
for i=1,#_bp.build_objs do
local _eh=_bp.build_objs[i]
_eh.x=-20
if(_o[_bp._bq][_eh.req_id])
and split(_eh.req_level)[dget"6" ]<=_a
and _bb(_eh,dget"6")
then
_bp._ef[_eg]=_eh
if _eg>=_3 and _eg<=_3+2 then
_c0(_eh, 9, 24+(_eg-_3)*20)
_eh:_ap()
end
_5=_5 or _bp._ef[1]
if _5==_eh then
_y=_eg
if(_bp.id==5) srand(t_\3600) _5._ei=_5._b7._ei \ (rnd"0.533" +0.8)
?"\f7\^x3\-f\|c\*6-\n\-d\|d|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|d|    \^x4 |\^x3\n\^x3\-f\|d\*6-",9,_eh.y
?"\^j87\-f\|a\^h\f7" .._5._by.."\n\|h\f9\^:041f051f141f0400\-f\|h" .._5._ei.."\^je8\|d\fd\^:1f1b111b1f0e0400\|h" .._5._b8..(_5.is_building and"\^jl8\|d\fa\^:0804061f0c040200\|h" .._5.power or"\^jl8\|d\f8\^:081c226b221c0800\|h\-h" .._5._e1).."\n\|g\f6" .._5.description
end
_eg+=1
end
end
foreach(_4, function(c) c:_ap() end)
end
palt(11,true)
cursor:_ap()
end
function _ej(x,y)
local _ek=0
if x>=0 and x<=66 and y>=0 and y<=66
and _w[x][y]!=0 then
if(_w[x][y-1]>0) _ek+=1
if(_w[x-1][y]>0) _ek+=2
if(_w[x+1][y]>0) _ek+=4
if(_w[x][y+1]>0) _ek+=8
_w[x][y]=1 + _ek
end
local _el=_f4(x,y)
if(_el and _el.is_building) _1[_el._e3]=true
end
function _em(x,y)
return fget(_fb(x,y),7)
end
function _en(_cv, _eo, _ep)
_cv._ct,_cv._es,_cv._eq=_eo or 0,true
if(_ep) _cv.gx,_cv.gy=_cv.x,_cv.y
_cv._cu=cocreate(function(self)
while true do
if self._cg then
_ff(self,mid(flr(self._b9+rnd"32")-16,64),mid(flr(self._ca+rnd"32")-16,64))
end
if self.id==33 then
_gi(self)
elseif _gw"250" and self.can_fire and self._ct!=8 then
local gx,gy=_c2(self)
_e7(self,gx,gy,function (_cv,x,y)
local _cx=_f4(x,y)
if _cx and _cx._bq!=_cv._bq and _w[x][y]==16 and (not _cx._cg or _cv.id==8) then
_ey(_cv,_cx)
return true
end
end,max(4,self.range))
end
local _cb=self._er or self._cb
if self.id==38 then
self._by="hARVESTER (" ..(self.capacity\14).."%)"
if self._ct==0 or self._ct==9 then
if self.capacity<1400
and self._ct!=7 and self._ct!=9 then
self._er=nil
local sx,sy
local tx,ty=_c2(self)
if _em(tx,ty) and not self._et then
sx,sy=tx,ty
else
_e7(self,tx,ty,function(_cv,x,y)
if _em(x,y) then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cv._es=_ff(_cv,sx,sy,nil,not _cv._es)
if not _cv._es and not _gu(_cv._bq,39) then
_c0(self,_ew(self))
end
if(_em(_c2(_cv))) _cv._ct=6
end
elseif self.capacity >=1400
and self._ct<7 then
self.sx,self.sy=_c2(self)
_gg(self,_cb or _gu(_cv._bq,17))
end
elseif self._ct==6 then
self._et=false
_ex(_cv.x, _cv.y, _cv.r+.75+rnd".2" -.1)
local _eu=_c1(_cv)
self.capacity+=.25
_m[_eu]=(_m[_eu] or 1000)-.5
if _m[_eu] <=0 then
local _br,_bs=_c2(self)
for yy=-1,1 do
for xx=-1,1 do
_am=_fb(_br+xx,_bs+yy)
_fc(_br+xx,_bs+yy,(xx==0 and yy==0) and 0 or ((_am>3 and _am<10) and 10 or _am)
)
end
end
self._ct=0
end
if(self.capacity%350==0) self._et=true self._ct=0
end
end
if self.id>=30 then
if self._ct==9 then
if _cb._cp>0 and not _cb._ev and self._cp>0 then
_cb._ah,self._ct,self.r=false,8,.25
_c0(self,_cb.x+16,_cb.y+4)
_c3(self)
if self.capacity and _cb.id==17 then
_cb._ev=self
while self.capacity>0 do
self.capacity-=1
_0[self._7]+=.5
if tonum(_dk)<_a0 then
_c4(.5,self)
elseif self._7==1 then
_f7"sPICE LOST. bUILD sILOS" end
yield()
end
self.capacity,self._ct,_cb._ev=0,0
if self.sx then
_ff(self, self.sx, self.sy, 0, true)
else
_c0(self,_ew(self))
end
else
self._af,self.procstep,_cb.col_cycle_src,_cb._cf=2,0,8,split"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _ew(_cx)
local ux,uy=_e7(_cx,(_cx.x+8)\8, (_cx.y+8)\8, _fe, 99, true)
return ux*8,uy*8
end
function _ex(x,y,r)
if(_gw"10") _g1(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split"2,4,9,15")
end
function _ey(_cv, _cx, _ez)
local id=_cv.id
if id!=19 then
local _e0=_cv.range*5
_cv._ct,_cv._cx,_cv._cu=3,_cx,cocreate(function(self)
while _cx._cp>0 and _cx._ct!=8 do
if _gv(_cv.x,_cv.y,_cx.x,_cx.y) > _e0
and _cv.moves then
if not _ez and _gv(_cv.x,_cv.y,_cv.gx,_cv.gy) > _e0 then
goto exit_attack
end
if _ff(_cv,(_cx.x+rnd(_cx.w))\8,(_cx.y+rnd(_cx.h))\8,_e0)
and _cv._e1==400
then
_cv._cp=0
for i=1,15 do
_c6(_cv.x+rnd"32" -16,_cv.y+rnd"32" -16, 2)
end
_cx._cp-=(1000+rnd"600")
_cx._cq=_cv
return
end
end
if not _cv.norotate then
local a=atan2(_cv.x-_cx.x, _cv.y-_cx.y)
while (_cv.r !=a) do
_gy(_cv, a)
end
end
local _e2=_gv(_cv.x,_cv.y,_cx.x,_cx.y)
if _e2<=_e0 then
if _ez and _cx.capturable and _cv.can_capture and _cx._cp<=_cx._b8/3
then
_ff(_cv,_cx.x\8,_cx.y\8,0)
_e4(_cx, _cv)
if(_cx._ev) _e4(_cx._ev, _cv)
_cv._cp=0
elseif _cv._cz<=0 and not _cv._cy and _cx._cp>0
and (_e2>=20 or id!=34) then
_cv._bv(_cv)
_cv._cz=_cv.fire_rate
end
elseif _cv.is_building then
_en(_cv)
end
yield()
if(id==31 or id==33 or _cx._e3==_cv._e3 or _cx._eq) break
end
::exit_attack::
if(not _ez) _ff(_cv,_cv.gx\8,_cv.gy\8)
_en(_cv, nil, true)
end)
else
_ey(_be(_aj[({24,25,50,50.5})[_cv._e3]], _cv.x,_cv.y, _cv._7, _cv), _cx, true)
_cv._cz=583
end
end
function _e4(_e5, _e6)
_e5.old_fact_data,_e5._e3,_e5._7,_e5._bq,_e5._bj,_e5.col1,_e5._ab
=
{_e5._e3,_e5._7,_e5._bq,_e5.col1,_e5._ab},_e6._e3,_e6._7,_e6._bq,_e6._bj,_e6.col1,_e6._ab
end
function _e7(_cv,x,y,_e8,_e9,_fa)
for t=rnd"1",_e9 or 4,.075 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_e8(_cv,xx,yy)) return xx,yy
if(not _fa) yield()
end
end
function _fb(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _fc(mx,my,_fd)
if(my>31)mx+=64 my-=32
mset(mx,my,_fd)
end
function _fe(_cv,x,y)
local _el=_f4(x,y)
return not fget(_fb(x,y),0)
and (not _el
or _el==_cv
or _el._cg
or (_el.on_foot and _cv and _cv.tracked and _el._bq!=_cv._bq))
end
function _ff(_cv,x,y,_fg,_fh,_eo)
if _fh then
local _fi=_gu(_cv._bq,39)
if _fi and not _fi._eq and _fi._e3==_cv._e3 then
_fi._eq,_cv._eq,_cv._ct, _fi._cu=_cv,_fi,2, cocreate(function(unit_c)
_ff(unit_c,_cv.x\8,_cv.y\8)
_c3(_cv)
if _cv._cp>0 then
_fi.my=18
del(_j,_cv)
_ff(_fi,x,y)
_c0(_cv,_fi.x,_fi.y)
add(_j, _cv)
_en(_cv,_eo)
end
_fi.my=16
_en(_fi)
end)
return
end
end
::restart_move_unit::
if not _cv._cg and not _fe(_cv,x,y) then
x,y=_e7(_cv,x,y,_fe)
end
_cv.tx,_cv.ty,_cv.prev_state,_cv._ct,_cv._fj=x*8,y*8,_cv._ct,1
if true then
local start, goal, _fl={ x=_cv.x\8, y=_cv.y\8}, {x=x, y=y}, function (_fk) return (_fk.y<<8) + _fk.x end
local _fs,_fm={
_fn=start,_fo=0,_fp=_g0(start, goal)
}, {}
_fm[_fl(start)]=_fs
local frontier, frontier_len, goal_id, max_number, count={_fs}, 1, _fl(goal), 32767.99, 0
while frontier_len > 0 do
local _ei=max_number
for i=1, frontier_len do
local _fq=frontier[i]._fo + frontier[i]._fp
if(_fq <=_ei) _fr,_ei=i,_fq
end
_fs=frontier[_fr]
frontier[_fr], _fs._ft=frontier[frontier_len], true
frontier_len -=1
local p=_fs._fn
if _fl(p)==goal_id then
p={goal}
while _fs._fx do
_fs=_fm[_fl(_fs._fx)]
add(p, _fs._fn)
end
_cv._fj=p
goto end_pathfinding
end
local _fu={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _el=_f4(nx,ny)
if(xx!=0 or yy!=0)
and _cv._cg or (not fget(_fb(nx,ny),0) or _cv.on_foot and fget(_fb(nx,ny),1))
and _fe(_cv,nx,ny)
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fu, {x=nx, y=ny})
end
end
end
for n in all(_fu) do
local id=_fl(n)
local _fw, _fv=
_fm[id],_fs._fo + ((p.x !=n.x and p.y !=n.y) and 1.2 or 1)
if not _fw then
_fw={
_fn=n,_fo=max_number,_fp=_g0(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fm[id]=_fw, _fw
end
if not _fw._ft and _fw._fo > _fv then
_fw._fo, _fw._fx=_fv, p
end
end
count+=1
if(not _cv._cg) yield()
if(count>3000 or stat"0" >1843) goto end_pathfinding
end
end
::end_pathfinding::
_cv.prev_state,_cv._ct=_cv._ct,2
if _cv._fj then
for i=#_cv._fj-1,1,-1 do
local _fk=_cv._fj[i]
local nx,ny,ux,uy=_fk.x,_fk.y,_cv.x,_cv.y
local mx,my=nx*8,ny*8
if not _cv.norotate then
local a=atan2(ux-mx, uy-my)
while (_cv.r !=a) do
_gy(_cv, a)
end
end
if(not _cv._cg and not _fe(_cv,nx,ny)) goto restart_move_unit
local _fy,_fz=_cv._f3, _gv(mx,my,ux,uy)
local _f0,_f1=_fy * (mx-ux) / _fz, _fy * (my-uy) / _fz
local _f2=_f4(nx,ny)
if(_f2 and _f2.on_foot and _cv.tracked) _f2._cp=0
for i=0, _fz/_fy-1 do
_k[nx.."," ..ny]=_cv
_cv.x+=_f0
_cv.y+=_f1
if _cv.id==39 then
if _cv._eq then
local d=_gv(_cv.x,_cv.y,_cv.tx,_cv.ty)
if(d<32) _cv.z=d/4
end
_cv.z=mid(2,_cv.z+0.1,8)
_cv._f3=_cv.z/10
end
yield()
end
_c0(_cv,mx,my)
_k[nx.."," ..ny]=_cv
_c8(_cv)
if(_gv(_cv.x,_cv.y,_cv.tx,_cv.ty) <=(_fg or 0)) break
end
else
_cv._ct=0
return false
end
_cv._ct=0
return true
end
function _f4(tx,ty)
return _k[tx.."," ..ty]
end
function _f5(x,_f6,_b5,_w)
add(_4,{
x=x,y=81,w=_w or 22,h=8,_f6=_f6,_ao=function(self)
return self
end,_ap=function(self)
local c,b=self._gf and 7 or 6,#_f6>1
if(b) ?"\-g\|g\^x2███\^x1█\n\-g\|e\^x2███\^x1█",x,81,c
?_f6,x+2,83,b and 0 or c
end,_b5=_b5
})
end
function _f7(_f8)
_f9,_v=_f8,500
end
function _ga(_b6)
_b6._cp,_b6._af,_b6.spent,_b6._gc=0,0,0
if(_b6._b2) _b6._b2._ah=false
end
function _gb(_b6)
if(not _b6) return
local _gd,_ge=cursor:_ao(),_b6:_ao()
_b6._gf=_gd.x <=_ge.x + _ge.w and
_gd.x + _gd.w >=_ge.x and
_gd.y <=_ge.y + _ge.h and
_gd.y + _gd.h >=_ge.y
if left_button_clicked and _b6._gf then
if _8 then
_5=_b6
else
if(_b6.type<=2 and _w[cx][cy]==0 or _b6._ct==8) return
if _bp
and _dw
and (_b6.id==17 and _dw.id==38
or _b6.id==9 and _dw.id>=30)
and _b6._7==1 and _dw._7==1
then
_gg(_dw,_b6)
return
else
_bp=_b6
end
end
_dp=true
end
end
function _gg(_cv,_dz)
local _dz,_gh,_fh=_dz or _gu(_cv._bq,1) or _cv
_cv._ct,_dz._ah,_cv._er=7,true,_dz
if(_cv.id!=38 or _dz.id==17) _cv._cb=_dz
_cv._cu=cocreate(function(_cv)
if(_dz.is_dockable) _gh,_fh=9,true
_ff(_cv, (_dz.x+16)/8, _dz.y/8, 0, _fh, _gh or 0)
if(not _cv._eq) _en(_cv, _gh)
end)
end
function _gi(_b6)
local _gk,_cx=0
for building in all(_i) do
if building._bq!=_b6._bq
and _gj(building)
and building.ai_priority > _gk
then
_cx,_gk=building,building.ai_priority
end
end
if(_cx) _ey(_b6, _cx, true)
end
function _gj(_b6)
local x,y=_c2(_b6)
return _w[x][y]==16
end
function _gl(_gm)
sfx(_gm,3)
end
function _gn(_go)
local _am=peek(0x3115)
if(_am & 128 > 0 !=_go) _am=_am^^128
poke(0x3115, _am)
end
function _gp(_gq,d,dd)
d=d or","
if(dd) _gq=split(_gq,dd)
if type(_gq)=="table" then
local t={}
while #_gq>0 do
local s=_gq[1]
add(t,split(s,d))
del(_gq,s)
end
return t
else
return split(_gq,d)
end
end
function _gr(_gs,_gt,_c9)
if(not _gs[_gt]) _gs[_gt]={}
add(_gs[_gt],_c9)
end
function _gu(_bq,id)
local _gs=_o[_bq][id]
if(_gs) return rnd(_gs)
end
function _gv(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gw(_gx)
return rnd(_gx)<1
end
function _gy(_cv, _gz)
local _c5=_gz-_cv.r
if _c5 > 0.5 then
_c5 -=1
elseif _c5 < -0.5 then
_c5 +=1
end
if _c5 > 0.0087 then
_cv.r +=0.0087
elseif _c5 < -0.0087 then
_cv.r -=0.0087
else
_cv.r=_gz
end
if(not _cv._cg) yield()
end
function _g0(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g1(x, y, r, dx, dy, dr, _g2, _cp, _g3)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cp=0,_g2=_g2,_g3=_g3, _g4=rnd{0xa5a5.8,0x5a5a.8},_g5=y, _g6=_cp }, 1)
end
__gfx__
11bbbbbbbb171bbb577777d5bbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbb7a9bbbb95555555d555555d155dbbbbbbbbbb
171bbbbbb17771bb576666d5bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99b7a9bbbbbbbd5515555555515555d59bbb9d5d9b
1771bbbb1711171b576666d00000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b7a9b7a9bbbd555d5515d5d5555d515db55515515
17771bbb7717177b576666d007700077bbb99b9bb9999b9bb9b99bbbb9b9bb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
177771bb1711171b56dddd1000777770bbbbb9b99bb9999b9b9bbbbbbb9bb999b9b99bbb99999999b999b99bbbbbbbbbbd55d55155155555d515559b155555d5
17711bbbb17771bb56dddd1007700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb7a9bbbbbd515d55d555d5555d555dbbd55d5555
b11bbbbbbb171bbb56dddd100000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbba9bbbb7ab95d5555555555155155dbbb5d555d15
bbbbbbbbbbbbbbbb5d111110bbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbb7a9bbbd551d5515d555d555559bb55515555
55551d51bbbbbbbbbbbbbbbbbd5d555555d555dbdddddddddddddddd55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d55d5155bbbbbbdddbbbbbbbbd5551551555d5dbd5555555d55555551555515d4444444444555155544444444444444444444444544224222242224442422442
5155555dbbbb9d5555d9bbbbbb55d5555d5555bbd5015515d55555555d55d444444444444445d555444444444444444444444444524442444424442224444221
5d55d555bbbd555d5555dbbbbbd15d5d55555dbbd5105555d5555555555d4444444444444444445d444444444444444444444442522222212222222242222110
55d555d1bb955555d55559bbbb955555d555d9bbd5555111d5555555555444444444444444444445444444444444444444444422502112121121122121121200
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242510221200012210012100001
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240551000000000000000011111
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d5555555554444444444444444444444444444444444444444444421555111111111111111110115
bbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbddddddddbbbbbbbbbbbbbbbbbbbbbbbbbbb7bbbbbbbbbbbbb1000000bbbbbbb50000001bbbbbbbbb5000001bbbb9ddbb
bbbbbbbbbb66669bbbbbbbbbbbbbbb51d555555515bbbbbbbbbbbbbbbbbbbbbbbbbebbbbbbbbebbbb5b1b000bbbbbb10000b1b5b1bbbbbbbb1b1b1bbb9d555db
bbb777bbb66dd66bbd5bb5bbbbbbb5b0d55555550b5bbbbb050b5050bbbbbbbbbb67bb6bbb66bb6bbb5b1b00bbbbb5b000b1b5bb01bbbbbbbb5b5bbb9d5d5d59
bb77994bb6d55d6bb5dbbbbbbbbbbb10d555555501bbbbbbcdcccccebbbbbbbbbc77677bbc77677bbbbbb1b0bbbbbb100b1bbbbb0bbbbbbbbbbbbbbbd555155d
bb79994bb6d55d6bbbbb555bbbbbb1b0d55555550b1bbbbbcdc7766ebbbbbbbbbb67bb6bbb66bb6bbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbbd515555d
bb79944bb66dd66bbbbb5d5bbb5b1b00d555555500b1b5bb050b5050bbb5b5bbbbbebbbbbbbbebbbbbbbb5b0bbbbbb100b5bbbbb0bbbbbbbbbbbbbbbd555d559
bbb444bbbb6666bbbbbb555bb5b1b000d5555555000b1b5bbbbbbbbbbb1b1b1bbbb7bbbbbbbbbbbbbbbbbb51bbbbbbb115bbbbbb01bbbbbbbbbbbbbb95555ddb
bbbbbbbbb9bbbbbbbbbbbbbbb1000000d55555550000001bbbbbbbbbb1000005bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5bbbbbbbbbbbbbbbb9dd9bbb
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
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbb11bbbbbbb6dbbbbb6bb7cd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d555555566d671bb76666a986d77777bd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55777671bbbbbb6dbb6d77777bd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbb11bbbbbbbbbbbbbb6bb7cd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
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
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d50477777b617401d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f441d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177401d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff441d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd52d0d0276ee06d6d504777777777401d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d5120001767606d6d544ff7fff7ff441d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5511111766d0d66d542222222222241d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d55555556d666662d52c02c020200221d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5ee0ee022200221d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d55555556dd00022d551011011111111d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d555555552202021d555011011111111d222444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555555100011d555555555555555d555222255555555d111111111194421
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
040018018c8c8c8c8c8c8c0e2828282828282828282a180b4b4b4b4b4b4b4b4b060e0e000800000000000000000100280000000000000000000001010101010101010001000102010000010101020201011101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101090000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
05050505064400006800680042000d0d140405050506131014040505061344000068004200000000008565000000000000000011120000004940000d0d0d2d2d0000000405050505090909090500000000000000000a00000000000000000000000000000000000000110d0d14070600000000000000000a0505050508002d47
050505050a0000000000000000000405050505080505050505050505050600000000000000000000002400000012000000000042004200420000001404052d2d0000000505050509090909050500000000000000000000000000000000000000000000000000000000130d140000000000000000000000000000000000002d00
05050506858542004200650000000a050508110f120a050909050505050557858585858557000000002462000024000000001100000000000085850405052d2d12000405090505050909090505050600000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000002d57
0505050613850000000000000085000a081124242412050509090505050585242424242485120000002400000024000000005785858585858585040505052d2d140005090905050909050509090905000000000000000a0000110f0d0f12000000110f0d0f1200000000000000000000000000000b0b0b000000000000002d00
05050505068585858585858585851249113a00002424120a05050505050585243a00002485240000008585858585000000242410101010101404050505052d2d00000a05050a0505050505090905050600000000000000110f0d0d0d0d0d0000110d0d0d0d0d0f1200000000000000000000000b0b0b0b0b0000000000002d33
0a2f0505050613570d0d101024244000240000006200001205050505050885240000002485246e00242424242424242424240004050505050505050505052d2d00000000000000000000050509090505000000000000000d0d0d0d3a0d1400000c0d0d0d0d0d0d0d0f0f12000000000000000405060b0b0b0000000000002d00
0a0505050905062438140000130d0000240000000000002424120a08001185240000002485240000242414001324242424000405050505050505086800122d2d0000110f0d0f120000000a0509090905060000000000110d0d0d0d0d140000000c0d0d0d0d0d0d0d0d0d0d0f120000000004050505060b0b0b00000000002d34
00000005090508240d040507060c246e0085248524856000850e00000013572424242424572485850014040506856e2424000505050505050508110000242d2d110f0d0d0d0d0d1204060005090905050500000000000c0d0d0d1400000000000c0d0d0d0d0d0d0d0d0d0d0d0e000000040509090905060b0b0b000000002d00
0000000a05080024ca050905051385000085858585850000850d120000000057858585570d101014000005050885242424000505050505050811440000242d2d0d0d0d1d0d0d0d140505050509090909050000000000130d14000000000000000c0d0d0d0d10100d0d0d0d1014000000050505090505050b0b0b0b0000002d35
00000000000000240e050509050a858585850d100d858585850d0d120000040505060c0d0e00000000000a08118585855700050505ca05081136000000242d2d0d1d0d0d0d0d14040505050505050909050000000000000000000011120000000c0d0d0d0e0000000000000000000000050505090905080b0b0b0b0000002d00
12000000000057570e05050508000c570d0e000000130d0d57240d0e0004050905050c0d0e000000000000110d0d0d0d0e00040505050885850d858585242d2d0d0d0d1010140405050509050509090505000011120000040506113a0d1200000c0d0d0d0e00000000000000000000000a05090905080b0b0b0b000000002d37
0e000000000057571405050500000c0d0d0e0000000013101024380d120a050909050c0d0e0000000000110d0d370d0d0d12000a37110f856000650000242d2d0d1014000004050909050505050509090506110d0e00040505050c0d0d0d0000130d0d0d0e0000000000000000000000000a050508000b0b0b00000000002d00
0d120000000004050505050500000c0d370e000000000000002424ca0d12050905080c0d0d12000000110d0d0d0d0d5724242412000a13850000000000242d2d1400000000000a05050800050505050508110d0d0e0005090905130d0d140000000c0d0d0d1200000000000000000000000000000000000b0b00000000002d36
0d0d1200000005090909050500000c0d0d0d12000000000000001324240e0a0508110d0d0d0d0f0f0f0d0d100d0d0d243a000024000000008585858585852d2d00000000000000000000000a05050508110d0d0d0e000509090505060000000000130d0d0d0d12000000000000000000000000000000000b0b00000000002d00
0d0d0d1200000a05090505050000130d0d0d0d12000000000000000c24240f1200000000130d0d0d0d14000000130d2400000024123700000013856200002d2d0000000000000000000000000000110f0d0d0d0d0e0005050909050500000000000000130d0d0d0f12000000000000000000000000000b0b0b0b0b0000002d32
0d0d0d0d12000005050505080000000c0d0d0d0e000000000000000c0d24240d120000000000130d1400000000001324000000240e0000000000850000002d2d000000000000000000000000002f100d0d0d0d0d0e00000a05050508000000000000000000130d101407000000000000000000000000000b0b0b000004052d00
0d0d0d0d0e00000a080000000000000c0d0d0d1400000020000000130d0d24240e00000000000000000000000000005724242424240000000000242424242d2d000000000000000000000000000000130d0d0d0d0d1200000a0508000000000000000000040505050505050506000000000000000000000b0b0b040505052d49
0d0d10100e000000000000000000000c0d0d1400000000000000000000130d240d120000000000000000200000000000000024400049000037000c246e242d2d00000000000000000000110f0000000000000c0d0d0d120000000000000000110f0e000005050509090905050500000000000000000000000000050909092d00
0d14040505062f00000000000000000c0d140000000000000000000000000c240d0e0000000000000000000000000000000024000000000000000c2424242d2d000405050600000000110d0d0000000000000c0d0d0d0d120000001139380f370d14000405050909050505050800000000000000002000000000050909092d95
0e04050905050506000000000000001314000000000000000000000000001357570e000000000000000000000000040506000c242400000000000c8585852d2d0005090505060000000c0d0d1200000000000c0d0d0d0d0d0f0f0f370d0d0d0d0e000000000a05050509051112000000000000000000000000000a0505092d00
0e05090905050505000000000000000000000000000000000000000000000057570e00000000000000000000000a050505002442000000000000131057372d2d0005050905050000000c0d0d0d00000020000c0d0d0d0d0d0d0d0d0d0dab220dca0000000000000a0505080c0e000000000000000000000000000c0e05092d28
0e0a05050505050800000000000000000000000000000000000000000000110d0d1400000000000000000005050505090500570000120000002f0000000d2d2d0005090909050000000c0d0d0d12000000110d0d0d0d0d0d0d0d360d0d22220d0e000000000000000000000c0d1200000000000000000000002f000405052d00
0d0f0f120a000000000000000000000004050600000000000000000000110d0d14000000000000110f0d0f120509050505002457440000240e00000000132d2d0005090909050000000c0d0d0d0d0f0f0f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d37000000000000000000000c0d0d0f1200000000000000002f00000a05082d29
0d0d0d0e00000000000000000000040505050500000000000a00110f0f0d0d14000000000000000c0d0d0d0e0509090905001324000000240000000000002d2d0a05050505080000000c0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d34ca0d0d0d0e0000000000000000000013100d0d0d12000000000000000000000000002d00
1010101400000000000000000405050909090500000000000000130d10101400000000000000000c0d0d1014050509050800000c140000000000000000002d2d0000000000000000000c0d0d0d0d0d1014000000000c0d0d0d0d100d0d0d38390e000000000000000000000000130d0d0e000000000000000000000000002d26
0000000000000000000000000509090905050506000000070000000000000000000000000000000c0d1400040505050800000000000000000000000000002d2d0000000000000000000c0d0d0d0d14000000000000130d0d0d14000000130d0d0e00000000000000000000000406130d0e000000000000000000000000002d00
0000000000000000000000000a05090905080b0b000000050000000000000000000000000000110d140000000a050800000000000a0000040506000000002d2d000000000000000000130d0d0d1400000000000000000c0d140000000000130d14000000000000110e040505050506130d0f1200000000000000000000002d39
000000000000000000000000000a0505080b0b0b000000050600000000000000000000110d0d0d0e000000000000000000000000000405050505050506002d2d00110f0e0000000000001310140000000000000000001314000000000000000004050a0000000000000509050505050506130d0e000000000000000000002d00
0000000000000000000000000000000b0b0b0000000000000000000000000000000000130d0d0d14000004050505060000000000000005090905050505062d2d00000000000000000000000000000000000000000000000000000000000005050505050600000000040509090509090905000000000000000000000000002d38
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000005050505000000000a00000a050909090909052d2d0000000000000000000000000000000000000000000000000004050507000a050505080b0b000000050505050505050508000004050505060000000000002d00
0000000000000000040505060000000000000000000000000000000000000000000000000000000000040505050508110f0e0000000000050505050905082d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d48
000000000004050505090505060000000000000000000000000000000000000000000000000000000000110f0f0f0f0d14000000000000050505090905002d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d00
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