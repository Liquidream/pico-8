pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- undune ii - map 8
-- by paul nicholas
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
local g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,_u,_v,_w,_x,_y={},{},{},{},{},{},{},{{},{}},t(),1,{0,0},{0,0},0,0,0,0,{},_e*8-128,0
local _z,_0,_1={0,0},{},0
g_._5=function(self)
if self._by._6==1 then
_2,_3,_4=1,{}
_f9(6,"⬆️",function()
_y=mid(1,_y-1,#_bl._ei)
_4=_bl._ei[_y]
if(_y<_2) _2-=1
end, 10)
_f9(17,"⬇️",function()
_y=mid(1,_y+1,#_bl._ei)
_4=_bl._ei[_y]
if(_y>_2+2) _2=min(_2+1,#_bl._ei-2)
end, 10)
_f9(32,_bl.id==5 and"order" or"build",function()
_7=nil
if(_dy) _dy:_b1()
end)
_f9(96,"close",function()
_7=nil
end)
_7=self
end
end
g_._ac=function(self)
local _aa=self._aa
pal({nil,nil,nil,nil,nil,nil,nil,_aa,nil,_aa,_aa,self.col1,nil,_aa})
if self._ag then
pal(self._ca[self._ad], self.col1)
else
pal(11,self.col1)
self._ad=1
end
end
local _ab=function(self)
pal(7,8)
if(self.id==80 and _bl._ae==2 and not _bl._af) pal(7,11)
end
function _8(self, _9)
self.procstep,self.last_process,self._ae=0,self._ae,_9
if(self.last_process>0) self._af=not self._af
if(_9==1) self._by._ag=true self._by._ah=self
end
local _ai=[[id|_bq|_ar|my|ico_spr|type|w|h|z|trans_col|_bj|_bk|_6|col1|_aa|icol1|icol2|ico_w|ico_h|req_id|req_faction|max|_el|power|_e5|_b4|_f7|range|_ck|fire_size|fire_rate|fire_sfx|death_sfx|norotate|altframe|_cu|_cn|_ae|spent|_cx|_cy|_cp|_ad|col_cycle_src|storage|capacity|is_repairable|ai_build|ai_priority|moves|tracked|on_foot|is_building|is_unit|is_dockable|capturable|can_fire|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|fow_range|is_limit_capped|req_level|_ca|_bu|description|_b0|_b1
1|64|64||170|2|2|2|0||nil|||||||2|2|1|||100|0||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||3|nil|1,1,1,1||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_5
2|22|22||162|2|2|2|0||1|||||7|5|2|2|1|||20|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0.5|nil||nil|1|nil|nil|nil|nil||1|nil|||3|1|4,4,4,4||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22||162|2|1|1|0||1|||||6|6|2|2|1|||5|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil||nil|1|nil|nil|nil|nil||1|nil|||2|1|1,1,1,1||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|131|131||224|2|2|2|0||1|||||||2|2|16|||500|40||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||4|1|7,7,7,7||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
5|61|61||228|2|3|3|0||1|||||11|3|2|2|17||1|500|50||500|0||||||53|nil||8|0|0|0|0|0|1|1|11|0|nil|1|nil|25|nil||nil|1|nil|nil|1|nil||1|1|||5|1|6,6,6,6|11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|_ac|_5
6|101|101||166|2|3|2|0||1|||||||2|2|14|||500|35||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||4|1|5,5,5,5||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_5
7|98|98||142|2|3|2|0||1|||||||2|2|14|||600|20||200|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|60|nil||nil|1|nil|nil|1|nil||1|1|||4|1|4,4,4,4||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_5
8|87|87|2|234|1|1|1|1|11|1|||||||2|2|16|||250|20|60|200|0|10|2|1.9|40|59|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|7.5|nil||nil|1|1|nil|1|1||1|1|0|0|6|nil|6,6,6,6||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
9|128|128||230|2|3|2|0||1|||||||2|2|14|||700|20||200|0||||||53|nil||2|0|0|0|0|0|1|1|8|0|nil|1|nil|60|nil||nil|1|nil|1|1|nil||1|1|||4|1|5,5,5,5|0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
10|71|71|0|232|1|1|1|1|11|1|||||||2|2|16|||125|10|20|200|0|5|1|0|27|58|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|nil||nil|1|1|nil|1|1||1|1|0|0|3|nil|5,5,5,5||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
11|110|110||138|2|2|2|0||1|||||||2|2|16|-1||400|10||400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|17.5|nil||nil|1|nil|nil|nil|nil||1|1|||4|1|4,4,2,4||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_5
12|108|108||168|2|2|2|0||1|||||11|3|2|2|16|-3||300|10||300|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1|||3|1|2,2,2,2||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_5
13|133|133||164|2|1|1|0||1|||||||2|2|16|||50|0||50|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|3|nil||nil|1|nil|nil|nil|nil||nil|nil|||2|1|4,4,4,4||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
14|96|96||140|2|2|2|0||1|||||||2|2|17|||400|20||350|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1|||4|1|2,2,3,2||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_5
15|104|104||134|2|2|2|0||1|||||||2|2|17|||150|5||150|0||||||53|nil|||0|0|0|0|0|1|1||1000|nil|1|nil|15|nil||nil|1|nil|nil|1|nil||1|1|||3|1|2,2,2,2||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
16|106|106||136|2|2|2|0||1|||||||2|2|17|||400|30||500|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|27.5|nil||nil|1|nil|nil|nil|nil||1|1|||6|1|2,2,2,2|8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
17|68|68||174|2|3|2|0||1|||||||2|2|18|||400|30||450|0||||||53|nil||8|0|0|0|0|0|1|1|11|1000|nil|1|nil|30|nil||nil|1|nil|1|1|nil||1|1|||4|1|1,1,1,1|11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ac|
18|66|66||172|2|2|2|0||1|||||||2|2|1|||300|-100||200|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||3|1|1,1,1,1|12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
19|58|58||226|2|3|3|0||1|||||||2|2|5||1|999|80||1000|0||||2,400||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|40|nil||nil|1|nil|nil|nil|nil||1|1|||5|1|8,8,8,8||pALACE|tHIS IS YOUR pALACE.||
20|48|127||194|1|1|1|1|11|11|||||5|5|2|2|11|-1||200|0|8|110|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|5|1|nil|1|nil|1|nil||1|1|nil|nil|||3|1|3,3,1,3||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
21|49|111||194|1|0.5|0.5|1|11|11|||||12|9|2|2|11|-1||100|0|4|45|0.07|5|2|1|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|1|nil|1|nil||1|1|nil|nil|||3|1|3,3,1,3||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
22|48|48||236|1|1|1|1|11|12|||||15|3|2|2|12|-3||100|0|4|50|0.03|3|1|0|15|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|2|1|nil|1|nil|1|nil||1|1|nil|nil|||3|1|2,2,2,2||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
23|49|49||236|1|0.5|0.5|1|11|12|||||15|3|2|2|12|-3||60|0|6|20|0.05|3|1|0|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|1|nil|1|nil|1|nil||1|1|nil|nil|||3|1|2,2,2,2||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
23.5|49|49||236|1|0.5|0.5|1|11||||||15|3|2|2|12|||60|0|6|20|0.05|3|1|0|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|1|nil|1|nil|1|nil||1|1|nil|nil|||3|1|2,2,2,2||iNFANTRY sOLDIER|||
24|48|253||236|1|1|1|1|11||||9|4|9|1|2|2||1||0|0|16|220|0.1|5|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|1|nil|1|nil||1|nil|nil|nil|||3|nil|8,8,8,8||fREMEN|||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||2||0|0|400|10|0.27|1|1|0|800|60|57|1|49|8|0|0|0|0|0|1|1||0|nil|nil|nil|70|1|nil|1|nil|1|nil||1|nil|nil|nil|||nil|nil|8,8,8,8||sABOTEUR|||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||||0|0|16|110|0.1|5|2|1|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|5|1|nil|1|nil|1|nil||1|nil|nil|nil|||3|1|4,4,4,4||tROOPERS|||
30|57|57|26|198|1|1|1|1|11|7|||||12|9|2|2|4|1||600|0|60|110|0.2|9|3|0|27|52|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|11|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|5|1|7,7,7,7||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
31|54|202|12|202|1|1|1|1|11|7|||||11|3|2|2|4|2||750|0|0|120|0.2|9|1.9|1.9|60|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|17.5|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|6|1|7,7,7,7||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
32|56|56|28|200|1|1|1|1|11|7|||8|12|||2|2|4|3||800|0|80|400|0.07|8|2|1|33|61|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|18|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|5|1|8,8,8,8||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
33|20|40|20|160|1|1|1|4|11|6|||||||2|2|4|-3||600|0|37|1|0.80|4|2|1.9|33|59|54|nil|22|8|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6|nil|1|7,7,7,7||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
34|54|54|12|202|1|1|1|1|11|7|5||||15|4|2|2|17|-2||450|0|150|100|0.2|10|2|1.9|40|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|6|1|5,5,5,5||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
35|55|55|10|198|1|1|1|1|11|7|5||||15|4|2|2|17|||600|0|60|300|0.13|6|1|0|30|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|8|7|5|1|6,6,6,6||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
36|53|53|8|196|1|1|1|1|11|7|5||||||2|2|17|||300|0|25|200|0.17|5|1|0|27|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|10|1|1|nil|nil|1|nil||1|nil|1|nil|7|6|4|1|4,4,4,4||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
37|38|38|24|192|1|1|1|1|11|7|5||||0|5|2|2|17|||900|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|1|nil|nil|nil|1|nil||1|nil|1|nil|8|7|3|1|4,4,4,4||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
38|50|50|14|192|1|1|1|1|11|7|5||||12|12|2|2|17|||300|0|0|150|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|0|1|1|15|1|1|nil|nil|1|nil||nil|nil|1|nil|8|7|3|1|2,2,2,2||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
39|73|73|16|238|1|1|1|8|11|6|5||||11|3|2|2|17|||800|0|0|100|1.33|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1.6|1|nil|nil|nil|1|nil||nil|nil|nil|nil|8|7|nil|1|5,5,5,5||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
41|52|52|6|206|1|1|1|1|11|14|5||||||2|2|1|||200|0|14|130|0.27|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|1|3,3,3,3||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
40|51|205|4|204|1|1|1|1|11|14|||||11|1|2|2|1|2||150|0|10|80|0.4|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|1|2,2,2,2||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
42|51|51|4|204|1|1|1|1|11|14|5||||15|4|2|2|1|1||150|0|8|100|0.3|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|5|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|3|1|2,2,2,2||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
50|72|72|30||1|1|1|8|11|||0|||||2|2||3||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|nil|nil|8,8,8,8||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
50.5|72|72|30||1|1|1|8|11|||0|||||2|2||4||0|0|400|10|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6|nil|nil|8,8,8,8||dEATH hAND|||
61|88|88|||9|1|1|1|11||||||||2|2||||0|0|300|1000|0.35|0|||7|50||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|nil|nil|||nil|1|nil||||nil|3,3,3,3||sANDWORM|||
43|32|32|||1|1|1|1|11|||2|||||1|1|||||||1|0.1||||||53|1|||0|0|0|0|0|1|1||0|nil|nil|nil|0|nil|nil|nil|nil|nil|nil|||nil|nil|nil|||nil|nil|1,1,1,1||sPICE bLOOM|||
80|3|3||3|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||nil|1,1,1,1||rEPAIR||_ab|action_click
81|1|1||1|3|1|1|0|11||||||||1|1||9|||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||nil|1,1,1,1||lAUNCH||_ab|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _aj=_gt(_ai,"|","\n")
_ai={}
for i=2,47 do
local _ak={}
for j=1,70 do
local _al=_aj[i][j]
if(j<65) _al=tonum(_al)
if j==68 then
_am,_al=_gt(_al,"~"),"" for line in all(_am) do
_al..=line.."\n" end
end
_ak[_aj[1][j]]=_al
end
_ai[_aj[i][1]]=_ak
end
for i=-5,67 do
_w[i]={}
for l=-5,67 do
_w[i][l]=0
end
end
for my=0,31 do
for mx=0,125 do
local _an,_ao=mget(mx,my)
if(_an==171) _ap,_aq,_ao=dget"27",dget"28",_ai[1]
for o in all(_ai) do
if(o._ar==_an) _ao=o break
end
if _ao and _an>=32 then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_ff(mx,my+1))
_bb(_ao, ox*8, oy*8)
end
end
end
_as=cocreate(function()
while true do
if t_%30==0 then
_gr(false)
_k={}
for _ct in all(_j) do
_k[_c0(_ct)]=_ct
end
local _at,_au,_av,_aw={},0,40
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ax=_ff(i,l)*8
if(_w[i][l]>0) _at[(i/2).."," ..(l/2)]=_ax>0 and sget(_ax%128+3, _ax\128*8+3) or 15
end
yield()
end
end
_ay,_az,_a0,_o,_a1=0,0,{0,0},{{},{}},split"0,0,0,0" for building in all(_i) do
if building.id!=13 then
if building._6==1 or hq and _gn(building) then
_at[(building.x\16).."," ..building.y\16]=building.col1
end
if building._6==1 then
_ay-=building.power
_az+=building.storage
end
_a0[building._6]+=1
_gv(_o[building._bm], building.id, building)
_k[_c0(building)]=building
end
end
for _ct in all(_j) do
if hq and (_ct._6==1 or _gn(_ct) and not _ct._cb) then
_at[(_ct.x\16).."," .._ct.y\16]=_ct.col1
end
if(_ct._bm>0) _gv(_o[_ct._bm], _ct.id, _ct)
if(_ct.is_limit_capped) _a1[_ct._e7]+=1
end
hq,_l=_o[1][16] and _ay>0,_at
for yy=0,30 do
for xx=0,31 do
local _al=_l[xx.."," ..yy] or 0
if xx%2==0 then
_aw=_al
else
_aw|=_al<<4 poke(0x4300+_au,_aw) _aw=0 _au+=1
end
end
if(yy%2==0) yield()
end
if(_g[3]>0 and _g[1]>=_g[3]) _a2=1
if(_a0[2]==0 and _a>1) _a2=2
if(_a0[1]==0) _a2=3
if _a2 then
for data in all{_a2,t()-_p,_z[1],_z[2],_r[1],_r[2],_q[1],_q[2]} do
dset(_av, data)
_av+=1
end
?"\^jae\+8h\#0\^w\^t         \^-w\^-t\^d2\^jaf\-cmission " ..(_a2<3 and"complete" or"failed"),_c
load"#undune2" end
end
yield()
end
end)
music"7" _a3=0
_a4,_a5,_a6,_a7={split"250,250" },rnd"1",0,0
end
function _a8(_a9,_ba)
local _bd=_a9.req_faction
return not _bd
or _bd==_ba
or (_bd<0 and _bd!=-_ba)
end
function _bb(_ao, x,y, _6, _bc)
local _be=_bv(_ao, x,y, _ao.type, nil, g_[_ao._bz], g_[_ao._b0], nil)
_be.ico_obj,_be._cn,_be._6=_bv(_ao, 107,0, 4, _be, nil, nil, g_[_ao._b1]), _ao._b4, _be._6 or _6
if _bc then
_be._bf=_bc._bf
else
if _be._6 then
_be._bf,_h=1,_f[1]
else
local _bg=9999
for i=1,#_f do
local _bh=_gz(x,y,_f[i][4],_f[i][5])
if(_bh<_bg) _be._bf,_be._6,_bg=i,min(i,2),_bh
end
end
end
_be._bm,_be.build_objs,_h=_6 or _be._6,{},_f[_be._bf or _bc._bf]
local _bi=_h[1]
_be._e7,_be.col1,_be._aa=_bi,_h[2],_h[3]
if(not _a8(_be,_bi)) return
for o in all(_ai) do
if o._bj
and (o._bj==_be.id or o._bk==_be.id)
and split(o.req_level)[_bi]<=_a
and _a8(o,_bi)
then
add(_be.build_objs,_bv(o, 107,0, 5, _be, nil, nil, function(self)
if _7 then
_bl=self
else
if self.is_building and #_i<150 or self.is_unit and _a1[_bi]<20 then
_8(self, 1)
elseif _be._bm==1 then
_gb"uNABLE TO CREATE MORE" end
end
end)
)
end
end
if _ao.col1 then
_be.col1,_be._aa=_ao.col1,_ao._aa
end
if(_be._cb) _be._6=0
local _bn,_bo=x\8,y\8
if _ao.is_building and not _ao.is_unit then
if(_ec) _be._cn/=2
local _bp=_ao._bq==22
for xx=0,_ao.w-1 do
for yy=0,_ao.h-1 do
if not _bp or fget(_ff(_bn+xx, _bo+yy),5)
and not _f8(_bn+xx, _bo+yy)
then
_fg(_bn+xx, _bo+yy, _bp and 22 or _be._6==1 and 81 or 103)
end
end
end
if(not _bp) add(_i,_be)
if _be.id==17 and not _be._by then
_dz(_be)
end
else
_be.r=not _be.norotate and (_bn%8)*.125
if _be.can_fire then
_be._br=function(self)
self._cq,self._cw,self.bullet_y,self.bullet_tx,self._bs=4,self.x+4,self.y+4,self._cv.x+self._cv.w/2,self._cv.y+self._cv.h/2
local dx,dy=self.bullet_tx-self._cw,self._bs-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bt=dx/d,dy/d
_gp(self.fire_sfx)
_c8(self,-6)
end
if _be.is_building then
_fg(_bn,_bo,_be._6==1 and 2 or 34)
end
_be._bu=split"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_be._e7].." " .._be._bu
end
if(_bc and _bc.id==17) _be._cf=_bc
add(_j,_be)
_er(_be, nil, true)
end
_c8(_be,1)
return _be
end
function _bv(_bw, x,y, _bx, _by, _bz, _b0, _b1)
local _b2={
_b3=_bw,id=_bw.id,_b4=_bw._b4,x=x,y=y,_b5=x/8,_b6=y/8,type=_bx,_by=_by,_b1=_b1,w=_bw.w*8,h=_bw.h*8,_b7=_bw._bq,_b8=_bw.w,_b9=_bw.h,_ca=split(_bw._ca),_cb=_bw.z>1,_cc=function(self)
return {
x=self.x,y=self.y-self.z,w=_bx>3 and 16 or self.w,h=_bx>3 and 16 or self.h
}
end,_cd=function(self)
local x,y,_ce=self.x\1,self.y\1,self.r
if _bx>2
or (x+self.w>=_ap
and x<=_ap+127
and y+self.h>=_aq
and y<_aq+127+self.z)
then
pal()
palt(0,false)
if _ce then
ovalfill(x+3, y+3, x+self.shad_w, y+self.shad_h, 1)
end
if(self.trans_col and _bx<=3) palt(self.trans_col,true)
if(self._e7 and self.id!=4) pal(12,self.col1) pal(14,self._aa)
if _bx>3 then
local _cg=_bx==5 and self or self._by
?"\#0\-g\|g\^xh \n\-g \n\-g \n\-g\^y2 ",x,y
local hp=_cg._b4
local _al=self._ae==1 and _cg._cn/6.666 or 15*(_cg._cn/hp)
if(_cg._cn>0 and not _7) rectfill(x,y+17,x+_al,y+18, self._ae==1 and 12 or (split"8,10,11,11")[_cg._cn\(hp/3)+1])
pal(11,_cg.icol1) pal(3,_cg.icol2)
end
if self._ca then
pal(self.col_cycle_src, self._ca[self._ad])
end
if(flr(self._cp)%2==0) pal(split"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")
if(_b0) _b0(self)
if _ce then
local cs,ss,_ch,_ci,cx,cy,dx,dy=cos(_ce),sin(_ce),126.7,self.my-0.3,127.5,self.my+.5,x+3.5,y-self.z+3.5
_ci -=cy
_ch -=cx
local sx,sy,_cj=cs*_ch+cx,-ss*_ch+cy,-_ch*8
for py=dy-_cj, dy+_cj do
tline(dx-_cj,py,dx+_cj,py,sx+ss*_ci,sy+cs*_ci,cs/8,-ss/8)
_ci+=.125
end
else
if _bx>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
if _bx==5 then
if _bw.is_building then
fillp"0XAFAF" rectfill(x+15,y+15,x+15-(self._b8*2),y+15-(self._b9*2),245)
fillp()
end
if self._af and not _7 then
?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666"
end
end
else
spr(self._bq, x, y, self._b8, self._b9)
end
end
end
if _bx<=2 then
if self._cw then
if self._ck==1 then
pset(self._cw,self.bullet_y, rnd{8,9})
else
local _cl=self._ck<=2
_g5(
self._cw, self.bullet_y,self.fire_size,0, 0,_cl and -.3 or 1,0,_cl and 10 or 2.5,_cl and split"7,10,9,8,2" or split"7,15")
end
end
if((self._bq==72 or self._cn<self._b4/2 and self.can_smoke) and _g0"7") _g5(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,split"10,9,8,6")
end
end,_cm=function(self)
local _cn,id,_co=self._cn,self.id,self._co
self._cp=max(self._cp-.4,1)
if self._cy>0 and self._bm>0 and id!=43 then
_gr(true)
if(stat"54" >5) music"0"
if(self.is_repairable and self.moves and _cn<self._b4/2 and self._cq<=6) _gk(self,_gy(self._bm,9) or self._cf)
if(self.on_foot and _cn<25) self._b8,self._b9=.5,.5
if(self.can_fire and self._cq==0) _e2(self, _co)
if(self.is_building and self._6==2) _cr=_co
end
if(_bx<=2 and _cn<=0 and not self.death_time) self._cq,self.death_time,self._cs=5,.25 _gp(self.death_sfx) _a3+=(_bx==2 or self._bq==72) and .25 or 0
if self.death_time then
self.death_time-=.025
if self.death_time<=0 then
if _bx==2 then
for xx=0,self._b8-1 do
for yy=0,self._b9-1 do
_fg(self.x/8+xx, self.y/8+yy, 21)
if(self.soldiers_on_destroy and #_j<75 and _g0"2") _bb(_ai[23.5],self.x+xx*8,self.y+yy*8,self._6,self)
end
end
del(_i,self)
_q[_co._bm]+=1
else
local gx,gy=_c1(self)
if(_ff(gx,gy)==0) _fg(gx,gy,33)
if(id<=10) _fg(gx,gy,21)
if(self._cf) self._cf._ag=false
if(self._ev and self._ev.id==9) self._ev._ca={0}
_dv(self)
if id==43 then
_fb(self,gx,gy,function (_ct,x,y)
if(_ff(x,y)==0) _fg(x,y,10)
end,4, true)
end
if(_co) _r[_co._bm]+=1
end
_c2(self)
else
if(not self.on_foot) _c6(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self._cu then
if t_%self._cu==0 then
if self.altframe
and self._cq==2 then
self._bq=self._b7+(self.altframe-self._bq)
self.my=self._bq
end
self._ad=(self._ad%#self._ca)+1
end
end
if self._cw then
self._cw+=self.bullet_dx*2
self.bullet_y+=self._bt*2
if _gz(
self._cw,self.bullet_y,self.bullet_tx,self._bs) < 2
then
_c6(self._cw, self.bullet_y, self._ck, self.fire_size)
local _cv=self._cv
if _gz(
self._cw,self.bullet_y,_cv.x+_cv.w/2,_cv.y+_cv.h/2) < 4
then
_cv._cn-=self._e5*rnd"1" _cv._cy,_cv._co=self._ck,self
if id==31 and _cv.moves and _g0"5" then
_e8(_cv, self)
_er(self)
elseif _cv.old_fact_data then
_cv._e7,_cv._6,_cv._bm,_cv.col1,_cv._aa,_cv.old_fact_data
=
unpack(_cv.old_fact_data)
_er(_cv)
end
end
self._cw=nil
end
end
if self._ae>0
and not self._af
and not self._gg then
if self._ae==1 and self.spent>=self._el then
self._gg,self._cn=true,100
if(self._by._6==1) _gp"56" _gb"cONSTRUCTION cOMPLETE"
if _bw.is_unit
and self._bj !=1 then
local ux,uy=_e0(self._by)
_bb(_bw,ux,uy,self._by._6,self._by)
_ge(self)
end
elseif self._ae==2 and _cn>self._b4 then
self._ae=0
if self.moves then
self._ev._ca,self._cq,self._cs={0},0,cocreate(function(_ct) _fj(_ct,_ct.gx\8,_ct.gy\8,0,true) end)
_cz(self,_e0(self))
end
else
if _c3(-.5,self._ae==1 and self._by or self) then
self.spent+=.5
self._cn=self._ae==1 and (self.spent/self._el)*100 or _cn+.5
end
end
end
self._cx=max(self._cx-.1)
if self._6==1 then
if(id==18) self._bu="wINDTRAP (\|f\^:0804061f0c040200\|h\-f" .._ay..")"
if(self.storage>0) self._bu=_bw._bu.." (" ..flr(_dl/_az*100).."%)" end
self._cy=0
end
}
for k,v in pairs(_bw) do
if not _b2[k] and v!="" then
_b2[k]=v
end
end
return _b2
end
function _cz(_b2,x,y)
_b2.x,_b2.y=x,y
end
function _c0(self)
local x,y=_c1(self)
return x.."," ..y
end
function _c1(_b2)
return (_b2.x+4)\8,(_b2.y+4)\8
end
function _c2(_b2)
_bl=_bl!=_b2 and _bl
end
function _c3(_c4, _b2)
if(_g[_b2._6]+_c4<0) return false
_g[_b2._6]+=_c4
if _b2._6==1 and _g[1]%10==0 and _dl!=_c5 then _c5=_dl _gp"63" end
return true
end
function _c6(x,y,_c7)
_g5(x, y, 2,0, 0, .1, -.01, _c7==1 and 5 or 20, _c7==1.9 and split"3,11,3" or split"5,7,5,7,10,8,9,2")
end
function _c8(_c9,_da,ox,oy)
if(_c9._6!=1 and _c9._cq!=4 or not _c9.fow_range) return
local _db,x,y=max(_c9.fow_range+_da,3),_c1(_c9)
if(ox) x,y=ox,oy
for xx=-_db,_db do
for yy=-_db,_db do
local _dc,_dd=x+xx,y+yy
if(_gz(x,y,_dc,_dd)<_db-1.5) then
_w[_dc][_dd]=16
for dy=-1,1 do
for dx=-1,1 do
_en(_dc+dx,_dd+dy)
end
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
local b=btn()
_dh+=b\2%2-b%2
_di+=b\8%2-b\4%2
else
_dh,_di=_de,_df
end
_dh,_di,_dj,_dk=mid(_dh,127),mid(_di,127),_de,_df
cx,cy=(_ap+_dh)\8,(_aq+_di)\8
_1+=1
if not _7 then
if(_dh<2) _ap-=2
if(_dh>125) _ap+=2
if(_di<2) _aq-=2
if(_di>125) _aq+=2
_ap,_aq,_dl=mid(_ap,_x),mid(-10,_aq,_x),tostr(flr(_g[1]))
if t_%6==0 and _a7==0 then
if(_g0"18") _a6=rnd".04" -.02
_dm,_dn=_a4[#_a4][1],_a4[#_a4][2]
add(_a4,{_dm+sin(_a5),_dn-cos(_a5)})
_a5+=_a6
local _ct=_f8((_dm+4)\8,(_dn+4)\8)
if _ct and not _ct._cb and fget(_ff(_c1(_ct)),2) then
_dv(_ct)
_a7=1
_gp"50" end
end
if(#_a4>30) del(_a4,_a4[1])
if(_a7>0) _a7+=1 _e1(_dm,_dn,rnd"1")
_a7%=200
for _ct in all(_j) do
if _ct._cs then
if(not coresume(_ct._cs, _ct)) _ct._cs=nil
end
end
for p in all(_n) do
p.dy +=p._g6
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cn +=1
if(p._cn>=p._ha) del(_n,p)
end
if t_%_b==0 then
local _do,_ct,_dp=rnd(_i),rnd(_j),_gy(2,19)
if _do._6==2
and (not _do._ah or _do._ah._ae!=1)
then
local u=rnd(_do.build_objs)
if u and u.ai_build
then
u:_b1()
end
if _do._cn<_do._b4 and _do._ae!=2 then
_8(_do, 2)
end
end
if(_0[_ct._e7] or t_%18000==0)
and _ct._6==2
and _ct.can_fire
and _ct._cq==0
then
if _cr then
_e2(_ct, _cr)
_cr=nil
else
_gm(_ct)
end
end
if _dp
and _0[_dp._e7]
and _dp._cx<=0
then
_gm(_dp)
end
end
coresume(_as)
t_+=1
end
_dq=false
if _bl then
_dr=true
_gf(_eg)
_gf(_eh)
if(_bl.ico_obj and not _7 and not _dq) _gf(_bl.ico_obj) _gf(_bl._ah)
if(_7) foreach(_bl.build_objs, _gf) foreach(_3, _gf)
_dr=false
end
if not _7
and not _dq then
foreach(_j, _gf)
foreach(_i, _gf)
end
if(stat"34" >0 or left_button_clicked or right_button_clicked)
and not _7
and _dh>91 and _dh<123
and _di>91 and _di<123 then
_bl=_dx
if(stat"34" ==1 or left_button_clicked) and _du((_dh-91)*2, (_di-91)*2) then
elseif _1>10 then
_ap,_aq=mid((_dh-96)*16, _x),mid(-10,(_di-97)*16, _x)
end
elseif left_button_clicked then
if _dq then
if(_bl) _v=0
if not _7 and _bl._by then
if(_bl._b1) _bl:_b1()
_bl=_dx
goto skip_collisions
end
if(_7 and _4._ga and _4._b1) _4:_b1()
if(_bl._6==1 and _bl.is_unit and _bl!=_dx and _bl.moves) _gp"62"
if(_bl._bm!=1 and _dx and (_dx.is_unit or (_dx.id==19 and _dt)) and _dx._6==1) _bl._cp=10 _e2(_dx, _bl, true) _bl=nil
else
_du(cx,cy)
local _ds=_bl and _bl._ah
if _ds
and _ds._gg
and _ea then
_bb(_ds._b3,cx*8,cy*8,1)
_ge(_ds)
_gp"61" end
end
_dt=false
elseif right_button_clicked and not _7 then
_dt,_bl=false
end
::skip_collisions::
_dw,_dx,_dy=_dg,_bl,_4
end
function _du(x,y)
if _bl
and _bl._6==1
and _bl.moves
and _bl._cq!=7
then
_bl._cs,_1=cocreate(function(_ct)
_fj(_ct, x, y)
_er(_ct, nil, true)
end), 0
_c2(_bl)
return true
end
return false
end
function _dv(_ct)
del(_j,_ct)
if _ct.id==38 and #_o[_ct._bm][38]<=1 then
_d1=_gy(_ct._bm,17)
if(_d1) _dz(_d1)
end
end
function _dz(_d0)
local _d2=_bb(_ai[38],_d0.x,_d0.y,_d0._6,_d0)
_d2._cq=9
end
function _draw()
cls"15"
camera(_ap+(16-rnd"32")*_a3, _aq+(16-rnd"32")*_a3)
_a3=_a3>0.05 and _a3*0.95 or 0
for i=1,#_a4 do
if(i!=#_a4 and i%2==1) fillp(0xa5a5.8)
circfill(
_a4[i][1]+4,_a4[i][2]+4,4,split"15,9,4" [(i-#_a4)%3+1])
fillp()
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
if(_a7>0) spr(88+_a7\100, _dm, _dn)
for building in all(_i) do
if not _7
then
if(t_%3==0) building:_cm()
if(building._ah) building._ah:_cm()
end
building:_cd()
if(building==_bl) rect(_bl.x, _bl.y, _bl.x+_bl.w-1, _bl.y+_bl.h-1, 7)
end
pal()
for p=1,2 do
for _ct in all(_j) do
if(p==1 and not _ct._cb) or (p==2 and _ct._cb) then
if(not _7) _ct:_cm()
if(_ct._ae!=2 or not _ct.moves) _ct:_cd()
if(_ct==_bl) ?"\f7\^:42c300000000c342",_bl.x, _bl.y-_bl.z
end
end
end
pal()
for p in all(_n) do
fillp(p._g8)
circfill(p.x,p.y,p.r,p._g7[ flr((#p._g7/p._ha)*p._cn)+1 ])
fillp()
end
local _d3,_d4=_ap\8,_aq\8
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
local _ds=_bl and _bl._ah
if _ds
and (_ds.type==5
and _ds.is_building)
and _ds._gg
then
local _d6,_d7=(_dh+_ap)\8, (_di+_aq)\8
local _d8,_d9,w,h=_d6*8-_ap,_d7*8-_aq,_ds._b8,_ds._b9
_ea,_eb,_ec=false,false,false
for xx=-1,w do
for yy=-1,h do
local _al=_ff(_d6+xx, _d7+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_al,4)) _ea=true
else
if(fget(_al,5)) _ec=true
if(not _fi(nil,_d6+xx,_d7+yy) or _al==0 or _al<=11 or _al>=23) _eb=true
end
end
end
if(_eb and _ds._b3._bq!=22) _ea=false
fillp"0b1110110110110111.1" rectfill(_d8, _d9,_d8+_ds.w, _d9+_ds.h, _ea and 11 or 8)
fillp()
end
?"\^j02\f4\|f\^x3\*z-\*8-\n\^xz\^j00\#9   \^xn \^j01\|j\^xz\^y2   \^xn "
_v-=1
?(_v>0 and _gd or _bl and _bl._bu or""),2,2,0
?sub("00000", #_dl).._dl, 103,2, _d
if hq!=_ed then
_u=1
if _ed then _gb"pOWER LOW. bUILD wINDTRAP" end
_gp"55" end
_ed=hq
local _ee=5934
for _ef=17152,17632,16 do
memcpy(0x6000+_ee, _ef, 16)
_ee+=64
end
?"\^jnn\|f\-e\^x3\^y5\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jvn\^y5\|j\-e\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jnm\-g\|j\^y1\^x2\*5▤゛\^jnv\|f\^y1\^x2\*5▤゛\^g",_d
?"\f7\|e\-f\^x3\^y4\^h\-f\|e\n|\n|\^g\|i\-n\^h\-f\|c\n|\n|\^g\^x2\-a\|e\*4-\^g\^y5\-a\|j\*4_\0",ceil(92+_ap/16),ceil(92+_aq/16)
if _u>0 and _u<77 then
for i=1,300 do
pset(92+rnd"31",92+rnd"31",5+rnd"3")
end
_u+=1
end
if _bl and _bl.ico_spr then
_cz(_bl.ico_obj,107,20)
_bl.ico_obj:_cd()
_eg,_eh=nil
if _bl._6==1 then
if _ds then
_cz(_ds,107,44)
_ds:_cd()
end
if _bl._cn<_bl._b4
and _bl.is_repairable
and _bl.is_building then
_eg=_bv(_ai[80], 115,28, 3, {}, nil, _ab, function()
_8(_dx, 2)
end)
_eg:_cd()
end
if(_bl.id==19
and _bl._cx<=0)
or _bl.id==37
then
_eh=_bv(_ai[81], 107,29, 3, {}, nil, _ab, function()
if _dx.id!=37 then
_gb"pICK tARGET" _dt=true
else
local mx,my=_c1(_dx)
local _al=_ff(mx,my)
if _al>=12 and _al<=22 then
_dx._cn,_dx=0
_bb(_ai[1],mx*8,my*8,1)
_gp"61" end
end
end)
_eh:_cd()
end
end
end
pal()
if _7 then
fillp(▒)
rectfill(unpack(split"0,0,127,127,0"))
fillp()
rectfill(3,18,124,92,_d)
rect(3,18,124,92,_c)
_bl._ei={}
rectfill(unpack(split"6,21,27,89,0"))
local _ej=1
for i=1,#_bl.build_objs do
local _ek=_bl.build_objs[i]
_ek.x=-20
if(_o[_bl._bm][_ek.req_id])
and _a8(_ek,dget"6")
then
_bl._ei[_ej]=_ek
if _ej>=_2 and _ej<=_2+2 then
_cz(_ek, 9, 24+(_ej-_2)*20)
_ek:_cd()
end
_4=_4 or _bl._ei[1]
if _4==_ek then
_y=_ej
if(_bl.id==5) srand(t_\3600) _4._el=_4._b3._el \ (rnd"0.533" +0.8)
?"\f7\^x3\-f\|c\*6-\n\-d\|d|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|d|    \^x4 |\^x3\n\^x3\-f\|d\*6-",9,_ek.y
?"\^j87\-f\|a\^h\f7" .._4._bu.."\n\|h\f9\^:041f051f141f0400\-f\|h" .._4._el.."\^je8\|d\fd\^:1f1b111b1f0e0400\|h" .._4._b4..(_4.is_building and"\^jl8\|d\fa\^:0804061f0c040200\|h" .._4.power or"\^jl8\|d\f8\^:081c226b221c0800\|h\-h" .._4._e5).."\n\|g\f6" .._4.description
end
_ej+=1
end
end
foreach(_3, function(c) c:_cd() end)
end
palt(11,true)
local _em=(_bl and _bl.is_unit and _bl._6==1 or _dt) and 3 or 0
spr(_em/3, _dh-_em, _di-_em)
end
function _en(x,y)
local _eo=0
if x>=0 and x<=62 and y>=0 and y<=62
and _w[x][y]!=0 then
if(_w[x][y-1]>0) _eo+=1
if(_w[x-1][y]>0) _eo+=2
if(_w[x+1][y]>0) _eo+=4
if(_w[x][y+1]>0) _eo+=8
_w[x][y]=1 + _eo
end
local _ep=_f8(x,y)
if(_ep and _ep.is_building) _0[_ep._e7]=true
end
function _eq(x,y)
return fget(_ff(x,y),7)
end
function _er(_ct, _es, _et)
_ct._cq,_ct._ew,_ct._eu=_es or 0,true
if(_et) _ct.gx,_ct.gy=_ct.x,_ct.y
_ct._cs=cocreate(function(self)
while true do
if self._cb then
_fj(self,mid(flr(self._b5+rnd"32")-16,64),mid(flr(self._b6+rnd"32")-16,64))
end
if self.id==33 then
_gm(self)
elseif _g0"250" and self.can_fire and self._cq!=8 then
local gx,gy=_c1(self)
_fb(self,gx,gy,function (_ct,x,y)
local _cv=_f8(x,y)
if _cv and _cv._bm!=_ct._bm and _w[x][y]==16 and (not _cv._cb or _ct.id==8) then
_e2(_ct,_cv)
return true
end
end,max(4,self.range))
end
local _cf=self._ev or self._cf
if self.id==38 then
self._bu="hARVESTER (" ..(self.capacity\14).."%)"
if self._cq==0 or self._cq==9 then
if self.capacity<1400
and self._cq!=7 and self._cq!=9 then
self._ev=nil
local sx,sy
local tx,ty=_c1(self)
if _eq(tx,ty) and not self._ex then
sx,sy=tx,ty
else
_fb(self,tx,ty,function(_ct,x,y)
if _eq(x,y) then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_ct._ew=_fj(_ct,sx,sy,nil,not _ct._ew)
if not _ct._ew and not _gy(_ct._bm,39) then
_cz(self,_e0(self))
end
if(_eq(_c1(_ct))) _ct._cq=6
end
elseif self.capacity >=1400
and self._cq<7 then
self.sx,self.sy=_c1(self)
_gk(self,_cf or _gy(_ct._bm,17))
end
elseif self._cq==6 then
self._ex=false
_e1(_ct.x, _ct.y, _ct.r+.75+rnd".2" -.1)
local _ey=_c0(_ct)
self.capacity+=.25
_m[_ey]=(_m[_ey] or 1000)-.5
if _m[_ey] <=0 then
local _bn,_bo=_c1(self)
for yy=-1,1 do
for xx=-1,1 do
_al=_ff(_bn+xx,_bo+yy)
_fg(_bn+xx,_bo+yy,(xx==0 and yy==0) and 0 or ((_al>3 and _al<10) and 10 or _al)
)
end
end
self._cq=0
end
if(self.capacity%350==0) self._ex=true self._cq=0
end
end
if self.id>=30 then
if self._cq==9 then
if _cf._cn>0 and not _cf._ez and self._cn>0 then
_cf._ag,self._cq,self.r=false,8,.25
_cz(self,_cf.x+16,_cf.y+4)
_c2(self)
if self.capacity and _cf.id==17 then
_cf._ez=self
while self.capacity>0 do
self.capacity-=1
_z[self._6]+=.125
if tonum(_dl)<_az then
_c3(.5,self)
elseif self._6==1 then
_gb"sPICE LOST. bUILD sILOS" end
yield()
end
self.capacity,self._cq,self._bu,_cf._ez=0,0,"hARVESTER (0%)"
if self.sx then
_fj(self, self.sx, self.sy, 0, true)
else
_cz(self,_e0(self))
end
else
self._ae,self.procstep,_cf.col_cycle_src,_cf._ca=2,0,8,split"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _e0(_cv)
local ux,uy=_fb(_cv,(_cv.x+8)\8, (_cv.y+8)\8, _fi, 99, true)
return ux*8,uy*8
end
function _e1(x,y,r)
if(_g0"10") _g5(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split"2,4,9,15")
end
function _e2(_ct, _cv, _e3)
local id=_ct.id
if id!=19 then
local _e4=_ct.range*5
_ct._cq,_ct._cv,_ct._cs=3,_cv,cocreate(function(self)
while _cv._cn>0 and _cv._cq!=8 do
if _gz(_ct.x,_ct.y,_cv.x,_cv.y) > _e4
and _ct.moves then
if not _e3 and _gz(_ct.x,_ct.y,_ct.gx,_ct.gy) > _e4 then
goto exit_attack
end
if _fj(_ct,(_cv.x+rnd(_cv.w))\8,(_cv.y+rnd(_cv.h))\8,_e4)
and _ct._e5==400
then
_ct._cn=0
for i=1,15 do
_c6(_ct.x+rnd"32" -16,_ct.y+rnd"32" -16, 2)
end
_cv._cn-=(1000+rnd"600")
_cv._co=_ct
return
end
end
if not _ct.norotate then
local a=atan2(_ct.x-_cv.x, _ct.y-_cv.y)
while (_ct.r !=a) do
_g2(_ct, a)
end
end
local _e6=_gz(_ct.x,_ct.y,_cv.x,_cv.y)
if _e6<=_e4 then
if _e3 and _cv.capturable and _ct.can_capture and _cv._cn<=_cv._b4/3
then
_fj(_ct,_cv.x\8,_cv.y\8,0)
_e8(_cv, _ct)
if(_cv._ez) _e8(_cv._ez, _ct)
_ct._cn=0
elseif _ct._cx<=0 and not _ct._cw and _cv._cn>0
and (_e6>=20 or id!=34) then
_ct._br(_ct)
_ct._cx=_ct.fire_rate
end
elseif _ct.is_building then
_er(_ct)
end
yield()
if(id==33 or _cv._e7==_ct._e7) break
end
::exit_attack::
if(not _e3 and _ct.moves) _fj(_ct,_ct.gx\8,_ct.gy\8)
_er(_ct, nil, true)
end)
else
_e2(_bb(_ai[({24,25,50,50.5})[_ct._e7]], _ct.x,_ct.y, _ct._6, _ct), _cv, true)
_ct._cx=583
end
end
function _e8(_e9, _fa)
_e9.old_fact_data,_e9._e7,_e9._6,_e9._bm,_e9._bf,_e9.col1,_e9._aa
=
{_e9._e7,_e9._6,_e9._bm,_e9.col1,_e9._aa},_fa._e7,_fa._6,_fa._bm,_fa._bf,_fa.col1,_fa._aa
end
function _fb(_ct,x,y,_fc,_fd,_fe)
for t=rnd"1",_fd or 4,.075 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_fc(_ct,xx,yy)) return xx,yy
if(not _fe) yield()
end
end
function _ff(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _fg(mx,my,_fh)
if(my>31)mx+=64 my-=32
mset(mx,my,_fh)
end
function _fi(_ct,x,y)
local _ep=_f8(x,y)
return not fget(_ff(x,y),0)
and (not _ep
or _ep==_ct
or _ep._cb
or (_ep.on_foot and _ct and _ct.tracked and _ep._bm!=_ct._bm))
end
function _fj(_ct,x,y,_fk,_fl,_es)
if _fl then
local _fm=_gy(_ct._bm,39)
if _fm and not _fm._eu and _fm._e7==_ct._e7 then
_fm._eu,_ct._eu,_fm._cs=_ct,_fm,cocreate(function(unit_c)
_fj(unit_c,_ct.x\8,_ct.y\8)
_c2(_ct)
if _ct._cn>0 then
_fm.my,_ct._cq=18,8
del(_j,_ct)
_fj(_fm,x,y)
_cz(_ct,_fm.x,_fm.y)
add(_j, _ct)
_er(_ct,_es)
end
_fm.my=16
_er(_fm)
end)
return
end
end
::restart_move_unit::
if not _ct._cb and not _fi(_ct,x,y) then
x,y=_fb(_ct,x,y,_fi)
end
_ct.tx,_ct.ty,_ct.prev_state,_ct._cq,_ct._fn=x*8,y*8,_ct._cq,1
if true then
local start, goal, _fp={ x=_ct.x\8, y=_ct.y\8}, {x=x, y=y}, function (_fo) return (_fo.y<<8) + _fo.x end
local _fw,_fq={
_fr=start,_fs=0,_ft=_g4(start, goal)
}, {}
_fq[_fp(start)]=_fw
local frontier, frontier_len, goal_id, max_number, count={_fw}, 1, _fp(goal), 32767.99, 0
while frontier_len > 0 do
local _el=max_number
for i=1, frontier_len do
local _fu=frontier[i]._fs + frontier[i]._ft
if(_fu <=_el) _fv,_el=i,_fu
end
_fw=frontier[_fv]
frontier[_fv], _fw._fx=frontier[frontier_len], true
frontier_len -=1
local p=_fw._fr
if _fp(p)==goal_id then
p={goal}
while _fw._f1 do
_fw=_fq[_fp(_fw._f1)]
add(p, _fw._fr)
end
_ct._fn=p
goto end_pathfinding
end
local _fy={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _ep=_f8(nx,ny)
if(xx!=0 or yy!=0)
and _ct._cb or not fget(_ff(nx,ny),0)
and _fi(_ct,nx,ny)
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fy, {x=nx, y=ny})
end
end
end
for n in all(_fy) do
local id=_fp(n)
local _f0, _fz=
_fq[id],_fw._fs + ((p.x !=n.x and p.y !=n.y) and 1.2 or 1)
if not _f0 then
_f0={
_fr=n,_fs=max_number,_ft=_g4(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fq[id]=_f0, _f0
end
if not _f0._fx and _f0._fs > _fz then
_f0._fs, _f0._f1=_fz, p
end
end
count+=1
if(not _ct._cb) yield()
if(count>3000 or stat"0" >1843) goto end_pathfinding
end
end
::end_pathfinding::
_ct.prev_state,_ct._cq=_ct._cq,2
if _ct._fn then
for i=#_ct._fn-1,1,-1 do
local _fo=_ct._fn[i]
local nx,ny,ux,uy=_fo.x,_fo.y,_ct.x,_ct.y
local mx,my=nx*8,ny*8
if not _ct.norotate then
local a=atan2(ux-mx, uy-my)
while (_ct.r !=a) do
_g2(_ct, a)
end
end
if(not _ct._cb and not _fi(_ct,nx,ny)) goto restart_move_unit
local _f2,_f3=_ct._f7, _gz(mx,my,ux,uy)
local _f4,_f5=_f2 * (mx-ux) / _f3, _f2 * (my-uy) / _f3
local _f6=_f8(nx,ny)
if(_f6 and _f6.on_foot and _ct.tracked) _f6._cn=0
_k[nx.."," ..ny]=_ct
_c8(_ct,0,nx,ny)
for i=1, _f3/_f2 do
_ct.x+=_f4
_ct.y+=_f5
if _ct.id==39 then
if _ct._eu then
local d=_gz(_ct.x,_ct.y,_ct.tx,_ct.ty)
if(d<32) _ct.z=d/4
end
_ct.z=mid(2,_ct.z+0.1,8)
_ct._f7=_ct.z/10
end
yield()
end
_cz(_ct,mx,my)
_k[nx.."," ..ny]=_ct
if(_gz(_ct.x,_ct.y,_ct.tx,_ct.ty) <=(_fk or 0)) break
end
else
_ct._cq=0
return false
end
_ct._cq=0
_c8(_ct,1)
return true
end
function _f8(tx,ty)
return _k[tx.."," ..ty]
end
function _f9(x,_ga,_b1,_w)
add(_3,{
x=x,y=81,w=_w or 22,h=8,_ga=_ga,_cc=function(self)
return self
end,_cd=function(self)
local c,b=self._gj and 7 or 6,#_ga>1
if(b) ?"\-g\|g\^x2███\^x1█\n\-g\|e\^x2███\^x1█",x,81,c
?_ga,x+2,83,b and 0 or c
end,_b1=_b1
})
end
function _gb(_gc)
_gd,_v=_gc,500
end
function _ge(_b2)
_b2._cn,_b2._ae,_b2.spent,_b2._gg=0,0,0
if(_b2._by) _b2._by._ag=false
end
function _gf(_b2)
if(not _b2) return
local _gh,_gi={
x=_dh+(_dr and 0 or _ap),y=_di+(_dr and 0 or _aq),w=0,h=0
},_b2:_cc()
_b2._gj=_gh.x <=_gi.x + _gi.w and
_gh.x + _gh.w >=_gi.x and
_gh.y <=_gi.y + _gi.h and
_gh.y + _gh.h >=_gi.y
if left_button_clicked and _b2._gj then
if _7 then
_4=_b2
else
if(_b2.type<=2 and _w[cx][cy]==0 or _b2._cq==8) return
if _bl
and _dx
and (_b2.id==17 and _dx.id==38
or _b2.id==9 and _dx.id>=30)
and _b2._6==1 and _dx._6==1
then
_gk(_dx,_b2)
return
else
_bl=_b2
end
end
_dq=true
end
end
function _gk(_ct,_d0)
local _d0,_gl,_fl=_d0 or _gy(_ct._bm,1) or _ct
_ct._cq,_d0._ag,_ct._ev=7,true,_d0
if(_ct.id!=38 or _d0.id==17) _ct._cf=_d0
_ct._cs=cocreate(function(_ct)
if(_d0.is_dockable) _gl,_fl=9,true
_fj(_ct, (_d0.x+16)/8, _d0.y/8, 0, _fl, _gl or 0)
if(not _ct._eu) _er(_ct, _gl)
end)
_c2(_ct)
end
function _gm(_b2)
local _go,_cv=0
for building in all(_i) do
if building._bm!=_b2._bm
and _gn(building)
and building.ai_priority > _go
then
_cv,_go=building,building.ai_priority
end
end
if(_cv) _e2(_b2, _cv, true)
end
function _gn(_b2)
local x,y=_c1(_b2)
return _w[x][y]==16
end
function _gp(_gq)
sfx(_gq,3)
end
function _gr(_gs)
local _al=peek(0x3115)
if(_al & 128 > 0 !=_gs) _al=_al^^128
poke(0x3115, _al)
end
function _gt(_gu,d,dd)
d=d or","
if(dd) _gu=split(_gu,dd)
if type(_gu)=="table" then
local t={}
while #_gu>0 do
local s=_gu[1]
add(t,split(s,d))
del(_gu,s)
end
return t
else
return split(_gu,d)
end
end
function _gv(_gw,_gx,_c9)
if(not _gw[_gx]) _gw[_gx]={}
add(_gw[_gx],_c9)
end
function _gy(_bm,id)
local _gw=_o[_bm][id]
if(_gw) return rnd(_gw)
end
function _gz(x1,y1,x2,y2)
return sqrt(((x1-x2)>>5)^2+((y1-y2)>>5)^2)<<5
end
function _g0(_g1)
return rnd(_g1)<1
end
function _g2(_ct, _g3)
local _c4=_g3-_ct.r
if _c4 > 0.5 then
_c4 -=1
elseif _c4 < -0.5 then
_c4 +=1
end
if _c4 > 0.0087 then
_ct.r +=0.0087
elseif _c4 < -0.0087 then
_ct.r -=0.0087
else
_ct.r=_g3
end
if(not _ct._cb) yield()
end
function _g4(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g5(x, y, r, dx, dy, dr, _g6, _cn, _g7)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cn=0,_g6=_g6,_g7=_g7, _g8=rnd{0xa5a5.8,0x5a5a.8},_g9=y, _ha=_cn }, 1)
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
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991119111911191119111911199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991919191999191919191919199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991919191911191919191919199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991919191919991919191919199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999991119111911191119111911199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
000000000000000000000000005155ffffffffffffff9999999f99999999ffffff55d555515d1d00000000000000000000000000000000000000000000000000
00000000000000000000000005155dfffffffffffff99f9ff9999f9ff9f99fffffd15d5d55551150000000000000000000000000000000000000000000000000
0000000000000000000000000155d9fffffffffffffff9f99ff9999f9f9fffffff95555555155510000000000000000000000000000000000000000000000000
0000000000000000000000000559ffffffffffffffff9999f999f99f9999ffffffff9d55d555d550000000000000000000000000000000000000000000000000
00000000000000000000000015fffffffffffffffff99f9f99f999f9f9f99ffffffffffd55555551000000000000000000000000000000000000000000000000
000000000000000000000000ffffffffffffffffffff99f9ff9fff999f99ffffffffffff515d555d000000000000000000000000000000000000000000000000
00000000000000000000001ffffffffffffffffff99fffff99f9ff999f9f99f9ffffffffff955555510000000000000000000000000000000000000000000000
0000000000000000000f1f5fffffffffffffffffffffff999f9999f9f9999f99fffffffffffd5515555150000000000000000000000000000000000000000000
000000000000000000f1f5ffffffffffffffffff9ff99f9f999f99999f99999fffffffffffd555d5515d1d000000000000000000000000000000000000000000
00000000000000000f1fffffffffffffffffffffff99fffff9999f9f9999f99ffffffffff955515d555511500000000000000000000000000000000000000000
000000000000000001fffffffffffffffffffffff999f99f9ff9999ff9f99ffffffffffffd55d551551555100000000000000000000000000000000000000000
00000000000000000f5fffffffffffffffffffff99ff9ffff999f99f9ffffffffffffffffd515d55d555d5500000000000000000000000000000000000000000
000000000000000015ffffffffffffffffffffffffffffff99f999f9fffffffffffffffff95d5555555555510000000000000000000000000000000000000000
0000000000000000fffffffffffffffffffffffffff99fffff9fff99ffffffffffffffffffd551d5515d555d0000000000000000000000000000000000000000
0000000000000019ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff95555555d555555100000000000000000000000000000000000000
0000000000091959fff9fffffffffffffffffffffffffffffffffffffffffffffffffffffffd5515555555515551500000000000000000000000000000000000
00000000009195999999ffffffffffffffffffffffffffffffffffffffffffffffffffffffd555d5515d5d55515d1d0000000000000000000000000000000000
0000000009199f9ff9f99ffffffffffffffffffffffffffffffffffffffffffffffffffff955515d5555155d5555115000000000000000000000000000000000
0000000001f9999f9f9ffffffffffffffffffffffffffffffffffffffffffffffffffffffd55d551551555555515551000000000000000000000000000000000
000000000959f99f9999fffffffffffffffffffffffffffffffffffffffffffffffffffffd515d55d555d555d555d55000000000000000000000000000000000
0000000015f999f9f9f99ffffffffffffffffffffffffffffffffffffffffffffffffffff95d5555555555155555555100000000000000000000000000000000
00000000ff9fff999f99ffffffffffffffffffffffffffffffffffffffffffffffffffffffd551d5515d555d515d555d00000000000000000000000000000000
000000009ff9999f99f9ff99ffffffffffffffffffffffffffffffffffffffffffffffffff95555555d5555555d5555551000000000000000000000000000000
00000000199999f99f9999f9fffffffffffffffffffffffffffffffffffffffffffffffffffd5515555555515555555155515000000000000000000000000000
0000000001999999999f9999ffffffffffffffffffffffffffffffffffffffffffffffffffd555d5515d5d55515d5d55515d1d00000000000000000000000000
0000000009999999f9999f9ffffffffffffffffffffffffffffffffffffffffffffffffff955515d5555155d5555155d55551150000000000000000000000000
00000000019999999ff9999ffffffffffffffffffffffffffffffffffffffffffffffffffd55d551551555555515555555155510000000000000000000000000
0000000009999999f999f99ffffffffffffffffffffffffffffffffffffffffffffffffffd515d55d555d555d555d555d555d550000000000000000000000000
000000000199999f99f999f9fffffffffffffffffffffffffffffffffffffffffffffffff95d5555555555155555551555555551000000000000000000000000
00000000599f9999ff9fff99fffffffffffffffffffffffffff6cfffffffffffffffffffffd551d5515d555d515d555d515d555d000000000000000000000000
0000000099f9ff9999f9ff99ffffffffffffffffffffffffff10ccffffffffffffffffff55d5555555d5555555d5555555d55555500000155100000000000000
000000001f9999f99f9999f9fffffffffffffffffffffffff10c7ccfffffffffffffffdd55555551555555515555555155555551515151511551d00000000000
00000000019f9999999f9999fffffffffffffffffffffffffc07c6c6ffffffffffff9d55515d5d55515d5d55515d5d55515d5d55515d5d555d55150000000000
0000000009999f9ff9999f9fffffffffffffffffffffffffffc66dc6fffffffffffd555d5555155d5555155d5555155d5555155d5555155d555551f000000000
0000000001f9999f9ff9999ffffffffffffffffffffffffffffcdcc1ffffffffff9555555515555555155555551555555515555555155555d555d91000000000
000000000999f99ff999f99ffffffffffffffffffffffffffff16c11ffffffffffd51555d555d555d555d555d555d555d555d555d555d55555d9f5f000000000
0000000001f999f999f999f9ffffffffffffffffffffffffffff111ffffffffffd5555155555551555555515555555155555551555555515dfffff5100000000
000000005f9fff99ff9fff99fffffffffffffffffffffffffffffffffffffffffd5d5555515d555d515d555d515d555d515d555d515d555dffffffff00000000
0000000099f9ff999f9f99f9ffffffffffffffffffffffffffffffffffffffff55d5555555d5555555d5555555d5555555d5555555d555dffffffffff1000000
000000001f9999f9f9999f99ffffffffffffffffffffffffffffffffffffffdd55555551555555515555555155555551555555511555d5dffffffffff5f1f000
00000000019f99999f99999fffffffffffffffffffffffffffffffffffff9d55515d5d55515d5d55515d5d55515d5d55515d5d555d5555ffffffffffff5f1f00
0000000009999f9f9999f99ffffffffffffffffffffffffffffffffffffd555d5555155d5555155d5555155d5555155d5555155d55555dfffffffffffffff1f0
0000000001f9999ff9f99fffffffffffffffffffffffffffffffffffff9555555515555555155555551555555515555555155555d555d9ffffffffffffffff10
000000000999f99f9fffffffffffffffffffffffffffffffffffffffffd51555d555d555d555d555d555d555d555d555d555d55555d9fffffffffffffffff5f0
0000000001f999f9fffffffffffffffffffffffffffffffffffffffffd5555155555551555555515555555155555551555555515dfffffffffffffffffffff51
000000005f9fff99fffffffffffffffffffffffffffffffffffffffffd5d5555515d555d50cddc0d515d555d515d555d515d555dffffffffffffffffffffffff
00000000ffffffffffffffffffffffffffffffffffffffffffffffffd77dd77d67d6fffd51d77d1555d5555555d555555d155dffffffffffffffffffffffffff
0000000015ffffddff9d5d9fff9d5d9fff9d5d9fff9d5d9fff9d5d9f76667666561ffff15c6776c155555551555555515555d59fffffffffffffffffffff9fff
000000000f5f9d55555155155551551555515515555155155551551576667666565f44415c6776c5515d5d55515d5d5555d515dfffffffffffffffffffff9999
0000000001fd555d55d5155d55d5155d55d5155d55d5155d55d5155dd6621662165ffff151d66d115555155d5555155d155d55dffffffffffffffffffff99f9f
000000000f155555155555d5155555d5155555d5155555d5155555d5d2221222165f101151c66c111515555555155555d515559ffffffffffffffffffffff9f9
0000000000d11555d55d5555d55d5555d55d5555d55d5555d55d5555622112211ddf1001d01661011555d555d555d5555d555dffffffffffffffffffffff9999
00000000000515555d555d155d555d155d555d155d555d155d555d1561155111515510055550011115555515555555155155dffffffffffffffffffffff99f9f
0000000000000015555155555551555555515555555155555551555566767555d55d5555515d1111515d555d515d555d555559ffffffffffffffffffffff99f9
000000000000000055d5555555d5555555d5555555d6565555d555556d6d65d555d555d555d5555555d5555555d555555d155dffffffffffffffffff99f9ff99
0000000000000000155555515555555155555551550ccc015555555166d1d555155dc0555555555155555551555555515555d59fffffffffffff9fff9f9999f9
0000000000000000015d5d55515d5d55515d5d55510c7c05515d5d55d555555a5d511055515d5d55515d5d55515d5d5555d515dfffffffffffff9999999f9999
00000000000000000555155d5555155d5555155d555c7c5d5555155d15aaa99a5555505d5555155d5555155d5555155d155d55dffffffffffff99f9ff9999f9f
0000000000000000011555555515555555155555550d6d055515555555aaa55ad5555055551555555515555555155555d515559ffffffffffffff9f99ff9999f
00000000000000000555d555d555d555d555d555d5011105d555d555d5a1199a55d51555d555d555d555d555d555d5555d555dffffffffffffff9999f999f99f
000000000000000001555515555555155555551555551115555555155544445a155555155555551555555515555555155155dffffffffffffff99f9f99f999f9
0000000000000000515d555d515d555d515d555d515d555d5150155dd5151515555d5555515d555d515d555d515d555d5555d9ffffffffffffff99f9ff9fff99
000000000000000055551d5155551d5155551d5155d55555506c115555d5555555d5555556ccc65555d5555555d5555555d6d155fffffffffffffffff99fffff
0000000000000000155d5155d55d5155d55d5155555555515666dcc155555551555555515cdddc51555555515555555155669aa1dfffffffffffffffffffff99
00000000000000000155555d5155555d5155555d515d5d550c6676c1515d5d55515d5d555c6c6c55515d5d55515d5d55566d491d55d9ffffffffffff9ff99f9f
00000000000000000d55d5555d55d5555d55d5555555155d11d777d10555155d5555155d5c7c7c1d5555155d5555155dddc77d6d5555dfffffffffffff99ffff
000000000000000001d555d155d555d155d555d15515555551c6777c15155555551555555c0c0c115515555555155555511dd661d55559fffffffffff999f99f
00000000000000000d5515555d5515555d551555d555d555d5ccd7d11555d555d555d555d6111611d555d555d555d555d511661155d55dffffffffff99ff9fff
0000000000000000019d5d9fdf9d5d9fdf9d5d9f5555551555511c111555551555555515555511155555551555555515555dd115555555dfffffffffffffffff
00000000000000005fffffffffffffffffffffff515d555d515d0111515d555d515d555d515d555d515d555d515d555d515d555d555d55dffffffffffff99fff
0000000000000000fffffffffffffffffffffffffd5d555555d5555555551d5155d5555555d5555555d5555555d5555555d5555555d55555ffffffffffffffff
00000000000000001ffffffffffffffffffffffffd55515555555551d55d5155555555515555555155555551555555515555555155555551ff9d5d9fff9d5d9f
000000000000000001ffffffffffffffffffffffff55d555515d5d555155555d515d5d55515d5d55515d5d55515d5d55515d5d55515d5d555551551555515515
00000000000000000fffffffffffffffffffffffffd15d5d5555155d5d55d5555555155d5555155d5555155d5555155d5555155d5555155d55d5155d55d5155d
000000000000000001ffffffffffffffffffffffff9555555515555555d555d1551555555515555555155555551555555515555555155555155555d5155555d5
00000000000000000fffffffffffffffffffffffffff9d55d555d5555d551555d555d555d555d555d555d555d555d555d555d555d555d555d55d5555d55d5555
000000000000000001fffffffffffffffffffffffffffffd55555515df9d5d9f5555551555555515555555155555551555555515555555155d555d155d555d15
00000000000000005fffffffffffffffffffffffffffffff515d555dffffffff515d555d515d555d515d555d515d555d515d555d515d555d5551555555515555
0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffff95555555d5555555d5555555d555555424444455d555d555d5555555d55555
000000000000000015fffffffffffffffffffffffffffffffffffffffffffffffffd551555555551555555515555555154422422445551555555555155555551
00000000000000000f5fffffffffffffffffffffffffffffffffffffffffffffffd555d5515d5d55515d5d55515d5d55524442444445d555515d5d55515d5d55
000000000000000001fffffffffffffffffffffffffffffffffffffffffffffff955515d5555155d5555155d555511111111111111111111111111111115155d
00000000000000000f1ffffffffffffffffffffffffffffffffffffffffffffffd55d55155155555551555555511000000000000000000000000000000015555
000000000000000000f1f5fffffffffffffffffffffffffffffffffffffffffffd515d55d555d555d555d555d55100000000000000000000000000000001d555
0000000000000000000f1f5ffffffffffffffffffffffffffffffffffffffffff95d555555555515555555155551000000000000000000000000000000015515
00000000000000000000001fffffffffffffffffffffffffffffffffffffffffffd551d5515d555d515d555d515100000000000000000000000000000001555d
000000000000000000000000fffffffffffffffffffffffffffffffffffffffffd5d555555d5555555d5555555d1000000000000000000000000000000015555
00000000000000000000000015fffffffffffffffffffffffffffffffffffffffd55515555555551555555515551000000000000000000000000000000015551
0000000000000000000000000f5fffffffffffffffffffffffffffffffffffffff55d555515d5d55515d5d555151000000000000000000000000000000015550
00000000000000000000000001ffffffffffffffffffffffffffffffffffffffffd15d5d5555155d5555155d5551000000000000000000000000000000011510
0000000000000000000000000f1fffffffffffffffffffffffffffffffffffffff95555555155555551555555511000000000000000000000000000000015150
00000000000000000000000000f1f5ffffffffffffffffffffffffffffffffffffff9d55d555d555d555d555d551000000000000000000000000000000011500
000000000000000000000000000f1f5ffffffffffffffffffffffffffffffffffffffffd55555515555555155551000000000000000000000000000000015000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffff515d555d515d555d5151000000000000000000000000000000010000
00000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffff95555555d5555555d1000000000777777770000000000000010000
0000000000000000000000000000000015fffffffffffffffffffffffffffffffffffffffffd5515555555515551000000000700000070000000000000010000
000000000000000000000000000000000f5fffffffffffffffffffffffffffffffffffffffd555d5515d5d555151000000000700000070000000000000010000
0000000000000000000000000000000001fffffffffffffffffffffffffffffffffffffff955515d5555155d5551000000000700c00070000000000000010000
000000000000000000000000000000000f1ffffffffffffffffffffffffffffffffffffffd55d551551555555511000000000700000070000000000000010000
0000000000000000000000000000000000f1f5fffff5f5fffff5f5fffffffffffffffffffd515d55d555d555d551000000000700000070000000000000010000
00000000000000000000000000000000000f1f5fff1f1f1fff1f1f1ffffffffffffffffff95d5555555555155551000000000700000070000000000000010000
000000000000000000000000000000000000001ff1000005f1000005ffffffffffffffffffd551d5115d555d5151000000000777777770000000000000010000
00000000000000000000000000000000000000000000000000000000ffffffffffffffffff9555551715555555d1000000000000000000000000000000010000
0000000000000000000000000000000000000000000000000000000015fffffffffffffffffd5515177155515551000000000000000000000000000000010000
000000000000000000000000000000000000000000000000000000000f5fffffffffffffffd555d517771d555151000000000000000000000000000000010000
0000000000000000000000000000000000000000000000000000000001fffffffffffffff955515d1777715d5551000000000000000000000000000000010000
000000000000000000000000000000000000000000000000000000000f1ffffffffffffffd55d551177115555511000000000000000000000000000000010000
0000000000000000000000000000000000000000000000000000000000f1f5fffff5f5fffd555555d115d555d551000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000f1f5fff1f1f1ff91d1515551515155551000000000000000000000000000000010000
000000000000000000000000000000000000000000000000000000000000001ff1000005f1000005510000055101000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111100000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
040019018c8c8c8c8c8c8c0e2828282828282828282a180b4b4b4b4b4b4b4b4b060e09000800000000000000000100280000000000000000000001010101010101010001000102010000010101020201011101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101090000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
00000c10101010101010101010140000000000000000000000000044222224244215000000001324242424242424240000370000000000000406000000002d2d00110d0d120a050505080000000000000013101010100d370d0d360d0d3912000a050505050505130d0d1d1b1c0d0e0000000000000000000000000000002d47
000c1400000000000004050506000000000000000000000037000022222224241515851200003685422240224422220000000000000000040505050600002d2d000c101010120a050500000000000000000000000000130d100d0d0d0d0d0d0f0f120505050505060c0d0d1a1c0d0d1200000000000000000000000000002d00
0000000000000000000509050506000000000000000000000000114222241719858585240f120085222222222222220000000000000000050505050500002d2d0000000000130f1200000000000000000000000000000000000c0d0d0d1d190d0d0e0a05050505050c0d0d1d1f0d0d0e00000000000000000000000000002d57
000000000000000004050909050500000000000d120000000000572222851d1a1924572424858585858542222424242449652222120000050909050800002d2d00000000000013140000000000000000000000000000000000130d0d0d0d1d0d0d1400000a0505050c0d0d0d0d0d0d0e00000000000000000000000000002d00
00000000000000000505090505050600000000130d12000000111010100d371d1f0d0d2424856e1524242222243a222224222222241200370909050000002d2d00000000000000000000000000000000000000000000000000000c0d0d0d0d0d0e000000000a05080c0d0d0d0d0d0d0d1200000000000000000000110d0f2d33
00000000000000000a0505050800000405050506130d0f0f0f14040506130d0d0d0d1400578515152424242424222222246222222424120a0505050000002d2d0f120000000000000000000000000000000000000000000000000c0d0d0d0d0d0e000000000000110d0d0d0d0d0d0d0d0e000000000000000000000d0d0d2d00
0000000000000000000a0508000004050909090500130d0d140405050506130d101438000024242424602224242222222422222224240d1205050a0000002d2d0d0d1200000000000000110f120000000000110d1200000000110d0d0d0d0d0d0e0000000000110d0d0d0d0d0d0d0d0d0e000000000000000000000c0d0d2d34
0000000000000000000000000000000509090505000013140405090909050600000000000000858585222224248524858585858585570d140505050000002d2d101014000000000505060c0d0e00000000000c0d0d120000000c0d171c0d0d0d1400000000110d0d0d0d1010100d0d0d0d120000000000000000001310102d00
0000000000000000000000000000000a05050505000000000a050909050505060000000000000c57858585245785858557050600380000040505080000002d2d000000000000040505050c0d0d12000000110d0d0d0d1200110d171c1f0d0d0e04050505060c0d0d0d0e0405060c0d0d0d0d1200000000000000000000002d35
000000000000000000000000000000000a05090506000000000a0505050909050600000000000c0d0d0d0d101014000405050500000000000000000000002d2d0000000000000a050505130d0d0e0000001310100d0d0d0f0d0d1d1f0d0d0d140505050505130d0d0d140a08000c0d0d0d0d0d12000004050600000000002d00
00000000000000000000000000000000000a050800000000000011120a0505080000000000000c0d371436000000040505050800000000000000000000002d2d000000000000000a050506130d14040506000000130d0d0d0d0d0d0d0d0d0e040505050505060c0d0e00000000130d0d0d0d0d0e040505050500000000002d37
0000110f120000000000000000000000000000000000000000110d0d120a08000000000000000c0d0d0000000004050909050000000000000000000c12002d2d0000000000000000000a0506000405050500000000130d0d0d0d0d0d0d0d0e0a0509090505050c0d0e00000000000c0d0d0d0d0d120505050500000004052d00
00000c0d0e0000000000000000000000000000000000000000130d0d0d1200000000000000110d0d0e0000000005090905080000000000000000000000002d2d0000000f0000000000000a05050505050506000000000c0d0d0d0d0d0d0d0d120a05090905080c0d0e00000000000c0d0d0d0d0d0e0a05050837000405052d36
00000c0d0d120000000000000b0b000000000000000000000000130d0d0e0000000000110f0d0d0d0d1200000405050905000000000000000000000000002d2d0000000c1200000000000000050505050505050600000c0d0d0d0d0d0d0d0d0d120a050508110d0d0e00000000000c0d0d0d101010120a080000000505052d00
00000c0d0d0d0f1200000000000b0b00000000000000000000000013101400000000110d0d0d0d0d0d1400000505090905060000000000000000000000002d2d0000000c0e0000000000000405050505050505050600130d0d0d1718190d0d0d0d0f0f0f0f0d0d0d0d0f0f0f0f0f0d0d0d140000005785858585858505092d32
00110d0d101010140000000000000b0b0000000000000000000000000000000000110d0d0d0d0d0d0e0000000a05050505050000000000000000000000002d2d0000000c0e0000000000040505050505090909050500000c0d0d1d1e1f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d370d0e000000000085682244222205092d00
000c0d14000000000000000000000b0b0000000000000000000000000000000000130d0d0d100d1014000000000a050509050000000000000000000000002d2d0000110d0e0000000004050505080005050909090505060c0d0d360d0d10101010100d0d0d0d0d0d0d24242424240d0d0e00003900008522222222220a052d49
00000000000000000000000000000b0b0000000000040505060000111200000000001310140000000000000000000a0505080000000000000000000000002d2d00000c0d0e000000000509090500000a050505050505050c0d0d0d10140000000000130d0d0d0d370d2414001324578585850000000085858585000000002d00
000000000000000000000000000405050600110f120509090500110d0e0000000000000000000000000000000000000000000000000000000000000000002d2d00000c0d0e000000000a0905080011120a0505050505050c370d1400000000000000000c0d0d1d0d242400000013858585858585858585853600000000042d95
0000000000000000000000000005050505060c0d0e0a050505110d0d0d12000000000000000000000000110d1200000000000000000000000000000000002d2d00000c0d0e0000000005050500000c0d120509090909050c0d1400000039ca0039ca1139ca0d0d24241400000000854222422242224222850000000000052d00
00000000000000000000000c1205090505110d1d0d120a05080c0d0d0d0e00000000000000000000110f0d0d0d12000000000000000000000000000000002d2d0000130d14000000000a050800000c0d0e0a05090905080c0e0000000000000000000c0d0d24240d140405050506852222222222222222850000000004052d28
0000000000000000000000130d050505080c0d0d0d0d0f0f0f0d0d0d0d140000000000110d0f0f0f0d0d0d0d1014000000000000000000000000000000002d2d00000000000000000000000000000c0d0e000a050508578585570000000000002485858585570d14040505050505858585858585854022850000000005052d00
000000000000000000000000000a0505000d0d0d0d0d0d0d0d0d0d0d0e0406000000110d0d0d0d0d0d0d0d140000000000000000000000000000000000002d2d00000000000000000000000000110d0d0d12000000118560228524578585855724856c22852414040505050505050c0d0d0d140013222262222212000a052d29
00000000000000000000000000000a0506130d0d0d101010100d0d0d0e05050000110d0d0d1718190d0d14000000000000000000000000000000000000002d2d0000000004060000000000110f0d0d0d0d0d12360013852222852485852485852485222285240405050505050505130d10140000000c0d2222220d0f120a2d00
00000000000000000000000000000005050613101400040506130d0d0e0a0800000c0d0d0d1d1e1f0d1400000000000000000000000000000000000000002d2d000000040505060000110f0d0d0d0d0d0d0d1400000024242424242462222240222424242424050505050505050506000004050506130d0d0d0d0d0d0d122d26
000000000000000000110f12000000050505060000000a0508000c0d0d120000110d101010100d0d140406000000000000000000000000000000000000002d2d110f120505110f0f0f0d0d0d0d0d0d0d0d140000040506000000242422222222228585858557050505050505050505060405090905000c0d0d0d0d0d0d0d2d00
00000000000000110f0d0d0e00000005090505060000000000000c0d0d0d0f0f0d1400000000131404060000000000000000000000040600000b0b0000002d2d0d0d100f100d0d0d0d0d17180d0d0d0d14000004050505060000248565222249682244222205050505050505050909050505050505060c0d0d0d0d0d0d0d2d39
000000000000000d0d0d0d0d12000005090909050000000000000c0d0d0d0d0d1400000004050505050505060000000000000000040505000000000000002d2d1014040506130d0d0d0d1d1f0d0d0d14000004050509090500002485222222242222222222050505050505050509090900000000000013101010101010102d00
0000000000000013101010101400000a050505050000003600110d0d0d0d0d140000000005050505050505080000000000000000050505000000000000002d2d00000a05080013101010100d10101400000005090505090500005785858500000000000004050800000a05050505050508000000000000000004050506002d38
00000000000004050505050600000000000a050800000000110d0d0d0d0d1400000000000a0505050508111200000000000000000a0505000000000000002d2d0000000000000000000000000000000000000505090505050000000000000000000000000000000000000a050505050800000000000000000405050508002d00
000000000004050909090905000000000000110f0f0f0f0fab2237ca0d0e00000405050600050508110f0d0d0f12000000000000000a08000000000000002d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d48
00001112040505090505050506000000000d0d0d0d0d340d22220d0d380e000405050905050505110d0d1718190d120000000000000000000000000000002d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d00
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
