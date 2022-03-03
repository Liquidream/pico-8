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
local g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,hq,_u,_v,_w,_x,_y={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,0,{},_e*8-128,0
local _z,_0,_1,_2=hq,{0,0},{},0
g_._6=function(self)
if self._b2._7==1 then
_3,_4,_5=1,{}
_f6(6,"⬆️",function()
_y=mid(1,_y-1,#_bp._eg)
_5=_bp._eg[_y]
if(_y<_3) _3-=1
end, 10)
_f6(17,"⬇️",function()
_y=mid(1,_y+1,#_bp._eg)
_5=_bp._eg[_y]
if(_y>_3+2) _3=min(_3+1,#_bp._eg-2)
end, 10)
_f6(32,_bp.id==5 and"order" or"build",function()
_8=nil
if(_dy) _dy:_b5()
end)
_f6(96,"close",function()
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
self._cz,self.last_process,self._af=0,self._af,_aa
if(self.last_process>0) self._ag=not self._ag
if(_aa==1) self._b2._ah=true self._b2._ai=self
end
local _aj=[[id|_bu|_av|my|ico_spr|type|w|h|z|trans_col|_bn|_bo|_7|col1|_ab|icol1|icol2|ico_w|ico_h|req_id|req_faction|max|_ej|power|_e2|_b8|_f4|range|_cm|fire_size|fire_rate|fire_sfx|death_sfx|norotate|altframe|_cw|_cp|_af|spent|_c0|_cr|_cs|_ae|col_cycle_src|storage|capacity|is_repairable|ai_build|ai_priority|moves|tracked|on_foot|is_building|is_unit|is_dockable|capturable|can_fire|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|req_level|_cf|_by|description|_b4|_b5
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
21|49|111||194|1|0.5|0.5|1|11|11|||||12|9|2|2|11|-1||100|0|4|45|0.07|7|2|1|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|1|nil|1|nil||1|1|nil|nil|||3,3,1,3||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
20|48|127||194|1|1|1|1|11|11|||||5|5|2|2|11|-1||200|0|8|110|0.1|7|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|5|1|nil|1|nil|1|nil||1|1|nil|nil|||3,3,1,3||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|253||236|1|1|1|1|11|||0|9|4|9|1|2|2||1||0|0|16|110|0.1|4|1|0|17|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|1|nil|1|nil||1|nil|nil|nil|||8,8,8,8||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||2||0|0|400|10|0.27|1|1|0|800|60|57|1|49|8|0|0|0|0|0|1|1||0|nil|nil|nil|70|1|nil|1|nil|1|nil||1|nil|nil|nil|||8,8,8,8||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||||0|0|16|110|0.1|2|2|1|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|5|1|nil|1|nil|1|nil||1|nil|nil|nil|||4,4,4,4||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
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
local _ak=_gq(_aj,"|","\n")
_aj={}
for i=2,46 do
local _al={}
for j=1,68 do
local _am=_ak[i][j]
if(j<63) _am=tonum(_am)
if j==66 then
_an,_am=_gq(_am,"~"),"" for line in all(_an) do
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
x=self.x+(_dr and 0 or _at),y=self.y+(_dr and 0 or _au),w=0,h=0
}
end,_ap=function(self)
local _aq=(_bp and _bp.is_unit and _bp._7==1 or _dt) and 3 or 0
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
mset(mx,my,_fc(mx,my+1))
_be(_as, ox*8, oy*8)
end
end
end
_aw=cocreate(function()
while true do
if t_%30==0 then
_go(false)
_k={}
for _cv in all(_j) do
_k[_c2(_cv)]=_cv
end
local _ax={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ay=_fc(i,l)*8
if(_w[i][l]==16) _ax[(i/2).."," ..(l/2)]=_ay>0 and sget(_ay%128+3, _ay\128*8+3) or 15
end
yield()
end
end
_az,_a0,_a1,_o=0,0,{0,0},{{},{}}
for building in all(_i) do
if building.id!=13 then
if building._7==1 or hq and _gk(building) then
_ax[(building.x\16).."," ..building.y\16]=building.col1
end
if building._7==1 then
_az-=building.power
_a0+=building.storage
end
_a1[building._7]+=1
_gs(_o[building._bq], building.id, building)
_k[_c2(building)]=building
end
end
for _cv in all(_j) do
if hq and (_cv._7==1 or _gk(_cv) and not _cv._cg) then
_ax[(_cv.x\16).."," .._cv.y\16]=_cv.col1
end
if(_cv._bq>0) _gs(_o[_cv._bq], _cv.id, _cv)
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
local _bl=_gw(x,y,_f[i][4],_f[i][5])
if(_bl<_bk) _bh._bj,_bh._7,_bk=i,min(i,2),_bl
end
end
end
_bh._bq,_bh.build_objs,_h=_7 or _bh._7,{},_f[_bh._bj or _bf._bj]
_bm=_h[1]
_bh._e4,_bh.col1,_bh._ab=_bm,_h[2],_h[3]
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
_f8"uNABLE TO CREATE MORE" end
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
if not _bt or fget(_fc(_br+xx, _bs+yy),5) then
_fd(_br+xx, _bs+yy, _bt and 22 or _bh._7==1 and 81 or 103)
end
end
end
if(not _bt) add(_i,_bh)
if _bh.id==17 and not _bh._b2 then
_dz(_bh)
end
else
_bh.r=not _bh.norotate and (_br%8)*.125
if _bh.can_fire then
_bh._bv=function(self)
self._ct,self._cy,self.bullet_y,self.bullet_tx,self._bw=4,self.x+4,self.y+4,self._cx.x+self._cx.w/2,self._cx.y+self._cx.h/2
local dx,dy=self.bullet_tx-self._cy,self._bw-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bx=dx/d,dy/d
_gm(self.fire_sfx)
_c9(self)
end
if _bh.moves then
_bh._by=split"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_bh._e4].." " .._bh._by
else
_fd(_br,_bs,_bh._7==1 and 2 or 133)
end
end
if(_bf and _bf.id==17) _bh._cb=_bf
add(_j,_bh)
_eo(_bh, nil, true)
end
_c9(_bh)
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
if(self._e4 and self.id!=4) pal(12,self.col1) pal(14,self._ab)
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
_g2(
self._cy, self.bullet_y,self.fire_size,
0, 0, _cn and -.3 or 1,0,_cn and 10 or 2.5,_cn and split"7,10,9,8,2" or {15})
end
end
if((self._bu==72 or self._cp<self._b8/2 and self.can_smoke) and _gx"7") _g2(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,split"10,9,8,6")
self._cr=0
end
end,_co=function(self)
local _cp,id,_cq=self._cp,self.id,self._cq
self._cs=max(self._cs-.4,1)
if self._cr>0 and self._bq>0 and id!=42 then
_go(true)
if(stat"54" >5) music"0"
if(self.is_repairable and self.moves and _cp<99 and self._ct<=6) _gh(self,_gv(self._bq,9) or self._cb)
if(self._bu<=49 and _cp<100) self._cd,self._ce=0.5,0.5
if(self.can_fire and self._ct==0) _ez(self, _cq)
end
if(_b1<=2 and _cp<=0 and not self.death_time) self._ct,self.death_time,self._cu=5,.25 _gm(self.death_sfx) _a6+=(_b1==2 or self._bu==72) and .25 or 0
if self.death_time then
self.death_time-=.025
if self.death_time<=0 then
if _b1==2 then
for xx=0,self._cd-1 do
for yy=0,self._ce-1 do
_fd(self.x/8+xx, self.y/8+yy, 21)
if(self.soldiers_on_destroy and #_j<75) _be(_aj[rnd{21,23}],self.x+xx*8,self.y+yy*8,self._7,self)
end
end
del(_i,self)
_q[_cq._bq]+=1
else
local gx,gy=_c3(self)
if(_fc(gx,gy)==0) _fd(gx,gy,33)
if(id<=16) _fd(gx,gy,21)
if(self._cb) self._cb._ah=false
if(self._es and self._es.id==9) self._es._cf={0}
_dv(self)
if id==42 then
_e8(self,gx,gy,function (_cv,x,y)
if(_fc(x,y)==0) _fd(x,y,10)
end,4, true)
end
if(_cq) _r[_cq._bq]+=1
end
_c4(self)
else
if(_gx(1) and not self.on_foot) _c7(self.x+rnd(self.w),self.y+rnd(self.h))
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
if _gw(
self._cy,self.bullet_y,self.bullet_tx,self._bw) < 2
then
_c7(self._cy, self.bullet_y, self._cm, self.fire_size)
local _cx=self._cx
if _gw(
self._cy,self.bullet_y,_cx.x+_cx.w/2,_cx.y+_cx.h/2) < 4
then
_cx._cp-=self._e2*rnd"1" _cx._cr,_cx._cq=self._cm,self
if id==40 and _cx.moves and _gx"5" then
_e5(_cx, self)
_eo(self)
elseif _cx.old_fact_data then
_cx._e4,_cx._7,_cx._bq,_cx.col1,_cx._ab,_cx.old_fact_data
=
unpack(_cx.old_fact_data)
_eo(_cx)
end
end
self._cy=nil
end
end
if self._af>0
and not self._ag
and not self._gd then
if self._af==1 and self.spent>=self._ej then
self._gd,self._cp=true,100
if(self._b2._7==1) _gm"56" _f8"cONSTRUCTION cOMPLETE"
if _b0.is_unit
and self._bn !=1 then
local ux,uy=_ex(self._b2)
_be(_b0,ux,uy,self._b2._7,self._b2)
_gb(self)
end
elseif self._af==2 and _cp>self._b8 then
self._af=0
if self.is_unit and self.moves then
self._es._cf,self._ct={0},0
_c1(self,_ex(self))
end
else
if self._cz>=8 then
if(_c5(-4,self._af==1 and self._b2 or self)) self._cz=0 self.spent+=4
else
self._cz+=1
self._cp=(self._af==1 and (self.spent/self._ej)*100 or _cp+2)
end
end
end
self._c0=max(self._c0-.1)
if self._7==1 then
if(id==18) self._by="wINDTRAP (\|f\^:0804061f0c040200\|h\-f" .._az..")"
if(self.storage>0) self._by=_b0._by.." (" ..flr(_dl/_a0*100).."%)" end
end
}
for k,v in pairs(_b0) do
if not _b6[k] and v!="" then
_b6[k]=v
end
end
return _b6
end
function _c1(_b6,x,y)
_b6.x,_b6.y=x,y
end
function _c2(self)
local x,y=_c3(self)
return x.."," ..y
end
function _c3(_b6)
return (_b6.x+4)\8,(_b6.y+4)\8
end
function _c4(_b6)
_bp=_bp!=_b6 and _bp
end
function _c5(_c6, _b6)
if(_g[_b6._7]+_c6<0) return false
_g[_b6._7]+=_c6
if _b6._7==1 then _gm"63" end
return true
end
function _c7(x,y,_c8)
_g2(x, y, 2,0, 0, .1, -.01, _c8==1 and 5 or 20, _c8==1.9 and split"3,11,3" or split"5,7,5,7,10,8,9,2")
end
function _c9(_da)
if(_da._7!=1 and _da._ct!=4) return
local _db=_da.type+1
for xx=-_db,_db do
for yy=-_db,_db do
local _dc,_dd=_da.x\8+xx,_da.y\8+yy
_w[_dc][_dd]=16
_ek(_dc,_dd)
for dy=-1,1 do
for dx=-1,1 do
_ek(_dc+dx,_dd+dy)
end
end
end
end
end
function _update60()
local _de,_df,_dg=stat"32",stat"33",stat"34"
left_button_clicked,right_button_clicked
=
(_dg==1 and _dw !=_dg) or btnp"5",(_dg==2 and _dw !=_dg) or btnp"4"
if not _dh then
_dh,_di=64,64
elseif _de==_dj and _df==_dk then
b=btn()
_dh+=b\2%2-b%2
_di+=b\8%2-b\4%2
else
_dh,_di=_de,_df
end
_dh,_di=mid(_dh,127),mid(_di,127)
cursor.x,cursor.y,_dj,_dk=_dh,_di,_de,_df
cx,cy=(_at+_dh)\8,(_au+_di)\8
_2+=1
if not _8 then
if(_dh<2) _at-=2
if(_dh>125) _at+=2
if(_di<2) _au-=2
if(_di>125) _au+=2
_at,_au,_dl=mid(_at,_x),mid(-10,_au,_x),tostr(_g[1])
if t_%6==0 and _ba==0 then
if(_gx"18") _a9=rnd".04" -.02
_dm,_dn=_a7[#_a7][1],_a7[#_a7][2]
add(_a7,{_dm+sin(_a8),_dn-cos(_a8)})
_a8+=_a9
local _cv=_f5((_dm+4)\8,(_dn+4)\8)
if _cv and not _cv._cg and fget(_fc(_c3(_cv)),2) then
_dv(_cv)
_ba=1
_gm"50" end
end
if(#_a7>30) del(_a7,_a7[1])
if(_ba>0) _ba+=1 _ey(_dm,_dn,rnd"1")
_ba%=200
for _cv in all(_j) do
if(_cv._cu) then
if(not coresume(_cv._cu, _cv)) _cv._cu=nil
end
end
for p in all(_n) do
p.dy +=p._g3
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cp +=1
if(p._cp>=p._g7) del(_n,p)
end
if t_%_b==0 then
local _cv=rnd(_j)
if(_1[_cv._e4] or t_%18000==0)
and _cv._7==2
and _cv.can_fire
and _cv._ct==0
then
_gj(_cv)
end
local _do=rnd(_i)
if _do._7==2
and (not _do._ai or _do._ai._af!=1)
and t()>300
then
local u=rnd(_do.build_objs)
if u and u.ai_build then
u:_b5()
end
if _do._cp<_do._b8 and _do._af!=2 then
_9(_do, 2)
end
end
local _dp=_gv(2,19)
if _dp
and _1[_dp._e4]
and _dp._c0<=0
then
_gj(_dp)
end
end
coresume(_aw)
end
_dq=false
if _bp then
_dr=true
_gc(_ee)
_gc(_ef)
if(_bp.ico_obj and not _8 and not _dq) _gc(_bp.ico_obj) _gc(_bp._ai)
if(_8) foreach(_bp.build_objs, _gc) foreach(_4, _gc)
_dr=false
end
if not _8
and not _dq then
foreach(_j, _gc)
foreach(_i, _gc)
end
if(stat"34" >0 or left_button_clicked or right_button_clicked)
and not _8
and _dh>91 and _dh<123
and _di>91 and _di<123 then
_bp=_dx
if(stat"34" ==1 or left_button_clicked) and _du((_dh-91)*2, (_di-91)*2) then
elseif _2>10 then
_at,_au=mid((_dh-96)*16, _x),mid(-10,(_di-97)*16, _x)
end
elseif left_button_clicked then
if _dq then
if(_bp) _v=0
if not _8 and _bp._b2 then
if(_bp._b5) _bp:_b5()
_bp=_dx
goto skip_collisions
end
if(_8 and _5._f7 and _5._b5) _5:_b5()
if(_bp._7==1 and _bp.is_unit and _bp!=_dx and _bp.moves) _gm"62"
if(_bp._bq!=1 and _dx and (_dx.is_unit or (_dx.id==19 and _dt)) and _dx._7==1) _bp._cs=10 _ez(_dx, _bp, true) _bp=nil
else
_du(cx,cy)
local _ds=_bp and _bp._ai
if _ds
and _ds._gd
and _ea then
_be(_ds._b7,cx*8,cy*8,1)
_gb(_ds)
_gm"61" end
end
_dt=false
elseif right_button_clicked and not _8 then
_dt,_bp=false
end
::skip_collisions::
_dw,_dx,_dy=_dg,_bp,_5
t_+=1
end
function _du(x,y)
if _bp
and _bp._7==1
and _bp.moves
and _bp._ct!=7
then
_bp._cu=cocreate(function(_cv)
_fg(_cv, x, y)
_eo(_cv, nil, true)
end)
_c4(_bp)
_2=0
return true
end
return false
end
function _dv(_cv)
del(_j,_cv)
if _cv.id==38 and #_o[_cv._bq][38]<=1 then
_d1=_gv(_cv._bq,17)
if(_d1) _dz(_d1)
end
end
function _dz(_d0)
local _d2=_be(_aj[38],_d0.x,_d0.y,_d0._7,_d0)
_d2._ct=9
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
if(_ba>0) spr(88+_ba\100, _dm, _dn)
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
if(p._g5) fillp(p._g5)
circfill(p.x,p.y,p.r,p._g4[ flr((#p._g4/p._g7)*p._cp)+1 ])
fillp()
end
local _d3,_d4=_at\8,_au\8
palt(0,false)
palt(11,true)
for xx=_d3-1,_d3+16 do
for yy=_d4-1,_d4+16 do
local gx,gy,_d5=xx*8,yy*8,_w[xx][yy]
if _d5!=0 and _d5!=16 then
spr(_d5+31,gx,gy)
elseif _d5<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
local _ds=_bp and _bp._ai
if _ds
and (_ds.type==5
and not _ds.moves)
and _ds._gd
then
local _d6,_d7=(_dh+_at)\8, (_di+_au)\8
local _d8,_d9,w,h=_d6*8-_at,_d7*8-_au,_ds._cd,_ds._ce
_ea,_eb,_bi=false,false,false
for xx=-1,w do
for yy=-1,h do
local _am=_fc(_d6+xx, _d7+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_am,4)) _ea=true
else
if(fget(_am,5)) _bi=true
if(not _ff(nil,_d6+xx,_d7+yy) or _am==0 or _am<=11 or _am>=23) _eb=true
end
end
end
if(_eb and _ds._b7._bu!=22) _ea=false
fillp"0b1110110110110111.1" rectfill(_d8, _d9,_d8+_ds.w, _d9+_ds.h, _ea and 11 or 8)
fillp()
end
?"\^j02\f4\|f\^x3\*z-\*8-\n\^xz\^j00\#9   \^xn \^j01\|j\^xz\^y2   \^xn "
_v-=1
?(_v>0 and _ga or _bp and _bp._by or""),2,2,0
?sub("00000", #_dl).._dl, 103,2, _d
if hq!=_z then
_u=1
if _z then _f8"pOWER LOW. bUILD wINDTRAP" end
_gm"55" end
_z=hq
local _ec=5934
for _ed=17152,17632,16 do
memcpy(0x6000+_ec, _ed, 16)
_ec+=64
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
_c1(_bp.ico_obj,107,20)
_bp.ico_obj:_ap()
_ee,_ef=nil
if _bp._7==1 then
if _ds then
_c1(_ds,107,44)
_ds:_ap()
end
if _bp._cp<_bp._b8
and _bp.is_repairable
and _bp.is_building then
_ee=_bz(_aj[80], 115,28, 3, {}, nil, _ac, function()
_9(_dx, 2)
end)
_ee:_ap()
end
if(_bp.id==19
and _bp._c0<=0)
or _bp.id==37
then
_ef=_bz(_aj[81], 107,29, 3, {}, nil, _ac, function()
if _dx.id!=37 then
_f8"pICK tARGET" _dt=true
else
local mx,my=_c3(_dx)
local _am=_fc(mx,my)
if _am>=12 and _am<=22 then
_dx._cp,_dx=0
_be(_aj[1],mx*8,my*8,1)
_gm"61" end
end
end)
_ef:_ap()
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
_bp._eg={}
rectfill(unpack(split"6,21,27,89,0"))
local _eh=1
for i=1,#_bp.build_objs do
local _ei=_bp.build_objs[i]
_ei.x=-20
if(_o[_bp._bq][_ei.req_id])
and split(_ei.req_level)[dget"6" ]<=_a
and _bb(_ei,dget"6")
then
_bp._eg[_eh]=_ei
if _eh>=_3 and _eh<=_3+2 then
_c1(_ei, 9, 24+(_eh-_3)*20)
_ei:_ap()
end
_5=_5 or _bp._eg[1]
if _5==_ei then
_y=_eh
if(_bp.id==5) srand(t_\3600) _5._ej=_5._b7._ej \ (rnd"0.533" +0.8)
?"\f7\^x3\-f\|c\*6-\n\-d\|d|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|d|    \^x4 |\^x3\n\^x3\-f\|d\*6-",9,_ei.y
?"\^j87\-f\|a\^h\f7" .._5._by.."\n\|h\f9\^:041f051f141f0400\-f\|h" .._5._ej.."\^je8\|d\fd\^:1f1b111b1f0e0400\|h" .._5._b8..(_5.is_building and"\^jl8\|d\fa\^:0804061f0c040200\|h" .._5.power or"\^jl8\|d\f8\^:081c226b221c0800\|h\-h" .._5._e2).."\n\|g\f6" .._5.description
end
_eh+=1
end
end
foreach(_4, function(c) c:_ap() end)
end
palt(11,true)
cursor:_ap()
end
function _ek(x,y)
local _el=0
if x>=0 and x<=66 and y>=0 and y<=66
and _w[x][y]!=0 then
if(_w[x][y-1]>0) _el+=1
if(_w[x-1][y]>0) _el+=2
if(_w[x+1][y]>0) _el+=4
if(_w[x][y+1]>0) _el+=8
_w[x][y]=1 + _el
end
local _em=_f5(x,y)
if(_em and _em.is_building) _1[_em._e4]=true
end
function _en(x,y)
return fget(_fc(x,y),7)
end
function _eo(_cv, _ep, _eq)
_cv._ct,_cv._et,_cv._er=_ep or 0,true
if(_eq) _cv.gx,_cv.gy=_cv.x,_cv.y
_cv._cu=cocreate(function(self)
while true do
if self._cg then
_fg(self,mid(flr(self._b9+rnd"32")-16,64),mid(flr(self._ca+rnd"32")-16,64))
end
if self.id==33 then
_gj(self)
elseif _gx"250" and self.can_fire and self._ct!=8 then
local gx,gy=_c3(self)
_e8(self,gx,gy,function (_cv,x,y)
local _cx=_f5(x,y)
if _cx and _cx._bq!=_cv._bq and _w[x][y]==16 and (not _cx._cg or _cv.id==8) then
_ez(_cv,_cx)
return true
end
end,max(4,self.range))
end
local _cb=self._es or self._cb
if self.id==38 then
self._by="hARVESTER (" ..(self.capacity\14).."%)"
if self._ct==0 or self._ct==9 then
if self.capacity<1400
and self._ct!=7 and self._ct!=9 then
self._es=nil
local sx,sy
local tx,ty=_c3(self)
if _en(tx,ty) and not self._eu then
sx,sy=tx,ty
else
_e8(self,tx,ty,function(_cv,x,y)
if _en(x,y) then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cv._et=_fg(_cv,sx,sy,nil,not _cv._et)
if not _cv._et and not _gv(_cv._bq,39) then
_c1(self,_ex(self))
end
if(_en(_c3(_cv))) _cv._ct=6
end
elseif self.capacity >=1400
and self._ct<7 then
self.sx,self.sy=_c3(self)
_gh(self,_cb or _gv(_cv._bq,17))
end
elseif self._ct==6 then
self._eu=false
_ey(_cv.x, _cv.y, _cv.r+.75+rnd".2" -.1)
local _ev=_c2(_cv)
self.capacity+=.25
_m[_ev]=(_m[_ev] or 1000)-.5
if _m[_ev] <=0 then
local _br,_bs=_c3(self)
for yy=-1,1 do
for xx=-1,1 do
_am=_fc(_br+xx,_bs+yy)
_fd(_br+xx,_bs+yy,(xx==0 and yy==0) and 0 or ((_am>3 and _am<10) and 10 or _am)
)
end
end
self._ct=0
end
if(self.capacity%350==0) self._eu=true self._ct=0
end
end
if self.id>=30 then
if self._ct==9 then
if _cb._cp>0 and not _cb._ew and self._cp>0 then
_cb._ah,self._ct,self.r=false,8,.25
_c1(self,_cb.x+16,_cb.y+4)
_c4(self)
if self.capacity and _cb.id==17 then
_cb._ew=self
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%8==0 then
_0[self._7]+=.5
if tonum(_dl)<_a0 then
_c5(4,self)
elseif self._7==1 then
_f8"sPICE LOST. bUILD sILOS" end
end
yield()
end
self.capacity,self._ct,_cb._ew=0,0
if self.sx then
_fg(self, self.sx, self.sy, 0, true)
else
_c1(self,_ex(self))
end
else
self._af,self._cz,_cb.col_cycle_src,_cb._cf=2,0,8,split"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _ex(_cx)
local ux,uy=_e8(_cx,(_cx.x+8)\8, (_cx.y+8)\8, _ff, 99, true)
return ux*8,uy*8
end
function _ey(x,y,r)
if(_gx"10") _g2(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split"2,4,9,15")
end
function _ez(_cv, _cx, _e0)
local id=_cv.id
if id!=19 then
local _e1=_cv.range*5
_cv._ct,_cv._cx,_cv._cu=3,_cx,cocreate(function(self)
while _cx._cp>0 and _cx._ct!=8 do
if _gw(_cv.x,_cv.y,_cx.x,_cx.y) > _e1
and _cv.moves then
if not _e0 and _gw(_cv.x,_cv.y,_cv.gx,_cv.gy) > _e1 then
goto exit_attack
end
if _fg(_cv,(_cx.x+rnd(_cx.w))\8,(_cx.y+rnd(_cx.h))\8,_e1)
and _cv._e2==1600
then
_cv._cp=0
for i=1,15 do
_c7(_cv.x+rnd"32" -16,_cv.y+rnd"32" -16, 2)
end
_cx._cp-=(1000+rnd"600")
_cx._cq=_cv
return
end
end
if not _cv.norotate then
local a=atan2(_cv.x-_cx.x, _cv.y-_cx.y)
while (_cv.r !=a) do
_gz(_cv, a)
end
end
local _e3=_gw(_cv.x,_cv.y,_cx.x,_cx.y)
if _e3<=_e1 then
if _e0 and _cx.capturable and _cv.can_capture and _cx._cp<=_cx._b8/3
then
_fg(_cv,_cx.x\8,_cx.y\8,0)
_e5(_cx, _cv)
if(_cx._ew) _e5(_cx._ew, _cv)
_cv._cp=0
elseif _cv._c0<=0 and not _cv._cy and _cx._cp>0
and (_e3>=20 or id!=34) then
_cv._bv(_cv)
_cv._c0=_cv.fire_rate
end
elseif _cv.is_building then
_eo(_cv)
end
yield()
if(id==31 or id==33 or _cx._e4==_cv._e4 or _cx._er) break
end
::exit_attack::
if(not _e0) _fg(_cv,_cv.gx\8,_cv.gy\8)
_eo(_cv, nil, true)
end)
else
_ez(_be(_aj[({24,25,50,50.5})[_cv._e4]], _cv.x,_cv.y, _cv._7, _cv), _cx)
_cv._c0=583
end
end
function _e5(_e6, _e7)
_e6.old_fact_data,_e6._e4,_e6._7,_e6._bq,_e6._bj,_e6.col1,_e6._ab
=
{_e6._e4,_e6._7,_e6._bq,_e6.col1,_e6._ab},_e7._e4,_e7._7,_e7._bq,_e7._bj,_e7.col1,_e7._ab
end
function _e8(_cv,x,y,_e9,_fa,_fb)
for t=rnd"1",_fa or 4,.075 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_e9(_cv,xx,yy)) return xx,yy
if(not _fb) yield()
end
end
function _fc(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _fd(mx,my,_fe)
if(my>31)mx+=64 my-=32
mset(mx,my,_fe)
end
function _ff(_cv,x,y)
local _em=_f5(x,y)
return not fget(_fc(x,y),0)
and (not _em
or _em==_cv
or _em._cg
or (_em.on_foot and _cv and _cv.tracked and _em._bq!=_cv._bq))
end
function _fg(_cv,x,y,_fh,_fi,_ep)
if _fi then
local _fj=_gv(_cv._bq,39)
if _fj and not _fj._er and _fj._e4==_cv._e4 then
_fj._er,_cv._er,_cv._ct, _fj._cu=_cv,_fj,2, cocreate(function(unit_c)
_fg(unit_c,_cv.x\8,_cv.y\8)
_c4(_cv)
if _cv._cp>0 then
_fj.my=18
del(_j,_cv)
_fg(_fj,x,y)
_c1(_cv,_fj.x,_fj.y)
add(_j, _cv)
_eo(_cv,_ep)
end
_fj.my=16
_eo(_fj)
end)
return
end
end
::restart_move_unit::
if not _cv._cg and not _ff(_cv,x,y) then
x,y=_e8(_cv,x,y,_ff)
end
_cv.tx,_cv.ty,_cv.prev_state,_cv._ct,_cv._fk=x*8,y*8,_cv._ct,1
if true then
local start, goal, _fm={ x=_cv.x\8, y=_cv.y\8}, {x=x, y=y}, function (_fl) return (_fl.y<<8) + _fl.x end
local _ft,_fn={
_fo=start,_fp=0,_fq=_g1(start, goal)
}, {}
_fn[_fm(start)]=_ft
local frontier, frontier_len, goal_id, max_number, count={_ft}, 1, _fm(goal), 32767.99, 0
while frontier_len > 0 do
local _ej=max_number
for i=1, frontier_len do
local _fr=frontier[i]._fp + frontier[i]._fq
if(_fr <=_ej) _fs,_ej=i,_fr
end
_ft=frontier[_fs]
frontier[_fs], _ft._fu=frontier[frontier_len], true
frontier_len -=1
local p=_ft._fo
if _fm(p)==goal_id then
p={goal}
while _ft._fy do
_ft=_fn[_fm(_ft._fy)]
add(p, _ft._fo)
end
_cv._fk=p
goto end_pathfinding
end
local _fv={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _em=_f5(nx,ny)
if(xx!=0 or yy!=0)
and _cv._cg or (not fget(_fc(nx,ny),0) or _cv.on_foot and fget(_fc(nx,ny),1))
and _ff(_cv,nx,ny)
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fv, {x=nx, y=ny})
end
end
end
for n in all(_fv) do
local id=_fm(n)
local _fx, _fw=
_fn[id],_ft._fp + ((p.x !=n.x and p.y !=n.y) and 1.2 or 1)
if not _fx then
_fx={
_fo=n,_fp=max_number,_fq=_g1(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fn[id]=_fx, _fx
end
if not _fx._fu and _fx._fp > _fw then
_fx._fp, _fx._fy=_fw, p
end
end
count+=1
if(not _cv._cg) yield()
if(count>3000 or stat"0" >1843) goto end_pathfinding
end
end
::end_pathfinding::
_cv.prev_state,_cv._ct=_cv._ct,2
if _cv._fk then
for i=#_cv._fk-1,1,-1 do
local _fl=_cv._fk[i]
local nx,ny,ux,uy=_fl.x,_fl.y,_cv.x,_cv.y
local mx,my=nx*8,ny*8
if not _cv.norotate then
local a=atan2(ux-mx, uy-my)
while (_cv.r !=a) do
_gz(_cv, a)
end
end
if(not _cv._cg and not _ff(_cv,nx,ny)) goto restart_move_unit
local _fz,_f0=_cv._f4, _gw(mx,my,ux,uy)
local _f1,_f2=_fz * (mx-ux) / _f0, _fz * (my-uy) / _f0
local _f3=_f5(nx,ny)
if(_f3 and _f3.on_foot and _cv.tracked) _f3._cp=0
for i=0, _f0/_fz-1 do
_k[nx.."," ..ny]=_cv
_cv.x+=_f1
_cv.y+=_f2
if _cv.id==39 then
if _cv._er then
local d=_gw(_cv.x,_cv.y,_cv.tx,_cv.ty)
if(d<32) _cv.z=d/4
end
_cv.z=mid(2,_cv.z+0.1,8)
_cv._f4=_cv.z/10
end
yield()
end
_c1(_cv,mx,my)
_k[nx.."," ..ny]=_cv
_c9(_cv)
if(_gw(_cv.x,_cv.y,_cv.tx,_cv.ty) <=(_fh or 0)) break
end
else
_cv._ct=0
return false
end
_cv._ct=0
return true
end
function _f5(tx,ty)
return _k[tx.."," ..ty]
end
function _f6(x,_f7,_b5,_w)
add(_4,{
x=x,y=81,w=_w or 22,h=8,_f7=_f7,_ao=function(self)
return self
end,_ap=function(self)
local c,b=self._gg and 7 or 6,#_f7>1
if(b) ?"\-g\|g\^x2███\^x1█\n\-g\|e\^x2███\^x1█",x,81,c
?_f7,x+2,83,b and 0 or c
end,_b5=_b5
})
end
function _f8(_f9)
_ga,_v=_f9,500
end
function _gb(_b6)
_b6._cp,_b6._af,_b6.spent,_b6._gd=0,0,0
if(_b6._b2) _b6._b2._ah=false
end
function _gc(_b6)
if(not _b6) return
local _ge,_gf=cursor:_ao(),_b6:_ao()
_b6._gg=_ge.x <=_gf.x + _gf.w and
_ge.x + _ge.w >=_gf.x and
_ge.y <=_gf.y + _gf.h and
_ge.y + _ge.h >=_gf.y
if left_button_clicked and _b6._gg then
if _8 then
_5=_b6
else
if(_b6.type<=2 and _w[cx][cy]==0 or _b6._ct==8) return
if _bp
and _dx
and (_b6.id==17 and _dx.id==38
or _b6.id==9 and _dx.id>=30)
and _b6._7==1 and _dx._7==1
then
_gh(_dx,_b6)
return
else
_bp=_b6
end
end
_dq=true
end
end
function _gh(_cv,_d0)
local _d0,_gi,_fi=_d0 or _gv(_cv._bq,1) or _cv
_cv._ct,_d0._ah,_cv._es=7,true,_d0
if(_cv.id!=38 or _d0.id==17) _cv._cb=_d0
_cv._cu=cocreate(function(_cv)
if(_d0.is_dockable) _gi,_fi=9,true
_fg(_cv, (_d0.x+16)/8, _d0.y/8, 0, _fi, _gi or 0)
if(not _cv._er) _eo(_cv, _gi)
end)
end
function _gj(_b6)
local _gl,_cx=0
for building in all(_i) do
if building._bq!=_b6._bq
and _gk(building)
and building.ai_priority > _gl
then
_cx,_gl=building,building.ai_priority
end
end
if(_cx) _ez(_b6, _cx, true)
end
function _gk(_b6)
local x,y=_c3(_b6)
return _w[x][y]==16
end
function _gm(_gn)
sfx(_gn,3)
end
function _go(_gp)
local _am=peek(0x3115)
if(_am & 128 > 0 !=_gp) _am=_am^^128
poke(0x3115, _am)
end
function _gq(_gr,d,dd)
d=d or","
if(dd) _gr=split(_gr,dd)
if type(_gr)=="table" then
local t={}
while #_gr>0 do
local s=_gr[1]
add(t,split(s,d))
del(_gr,s)
end
return t
else
return split(_gr,d)
end
end
function _gs(_gt,_gu,_da)
if(not _gt[_gu]) _gt[_gu]={}
add(_gt[_gu],_da)
end
function _gv(_bq,id)
local _gt=_o[_bq][id]
if(_gt) return rnd(_gt)
end
function _gw(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gx(_gy)
return rnd(_gy)<1
end
function _gz(_cv, _g0)
local _c6=_g0-_cv.r
if _c6 > 0.5 then
_c6 -=1
elseif _c6 < -0.5 then
_c6 +=1
end
if _c6 > 0.0087 then
_cv.r +=0.0087
elseif _c6 < -0.0087 then
_cv.r -=0.0087
else
_cv.r=_g0
end
if(not _cv._cg) yield()
end
function _g1(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g2(x, y, r, dx, dy, dr, _g3, _cp, _g4)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cp=0,_g3=_g3,_g4=_g4, _g5=rnd{0xa5a5.8,0x5a5a.8},_g6=y, _g7=_cp }, 1)
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
0d0d0d000000000000000000130d14000a000a00000000000000000000000405030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303032d47
0d0d140000000000000000000000000000000000000000000000000000000a05030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303032d00
000000000000000a000000000000000000000000200000000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d57
0000001112000a00000000000000000000000a00000000000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0000110d0d0e0505050600000000000030000000000000000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d33
00110d0d14040509090500000000000000000000330000000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0d0d0d0005090905060000442424244224240f000000111200000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d34
0d0d0d140405050508003024242424242424246c6e240f0d0d0d12000000110d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0d0d04050505080000002442240d18181c24242424340d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d35
0d0d140509050800330011242424241d1e6a242424240d0d0d0d0d0d0d0d0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d0d0405090906000011340d0d0d300d0d24240d0d0d0d300d0d0d000000130d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d37
0d14050909090600110d0d0d0d0d0d0d0d1407063400130d0d0d14000000000c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
14040509090506110d0d140000000c340e070506000a000c0d1400000000000c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d36
00000505050800130d0d000000000c0d0e0a050830000013140000000000000c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
000000300000000013140000110d0d0d0d12000000000000000000000000000c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d32
0000000000000000000000110d0d0d0d0d0d120000000000200000000000110d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
07070600000000000000000c0d0d0d0d0d0d0e00000000000000000705070c0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d49
09090600000000000000000c0d0d0d0d0d0d0e0000000000070505050505130d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
05090600000000000000000c0d0d0d0d0d0d0d1200110f0f0f120a050505060c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d95
05050600000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
05060000000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d28
1200000000002000000000130d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d12000000000000000000000d0d0d1718190d0d0d0d0d0d0d0e05050505080c030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d29
0d0e00000000000000000000130d0d1d1b1b196f0d0d0d0d0d0e0a050508110d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d140000000000000000000000130dcd1d1e1f0d0d0d0d0d0d100f0f0f0f0d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d26
1400000000070505070000000000130d330dab0d420d0d143100130d0d0d1400030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0000000000050909050700000000000c0d0d0d0d0d0d0e340000000c0d0e0000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d39
00000000000505090505000000006f136a0d440d0d0d0e006f00000c0d0e0000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
00000000000405090905000000000031130d0d0dcd330e000000000c0d0e0000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d38
0000000011120505050a000000000000341310100d0d1400000000130d0d1200030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
000000110d0d0f0f120000070507000000000000000000000705070000130d0d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d48
0000000c0d0d0d0d0d0d12050505000000000000000000000a0505050507130d030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
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
0101000030f450000031f2531f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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