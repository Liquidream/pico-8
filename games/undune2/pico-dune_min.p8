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
if self._b3._7==1 then
_3,_4,_5=1,{}
_f9(6,"⬆️",function()
_y=mid(1,_y-1,#_bq._ej)
_5=_bq._ej[_y]
if(_y<_3) _3-=1
end, 10)
_f9(17,"⬇️",function()
_y=mid(1,_y+1,#_bq._ej)
_5=_bq._ej[_y]
if(_y>_3+2) _3=min(_3+1,#_bq._ej-2)
end, 10)
_f9(32,_bq.id==17 and"order" or"build",function()
_8=nil
if(_d0) _d0:_b6()
end)
_f9(96,"close",function()
_8=nil
end)
_8=self
end
end
g_._ad=function(self)
local _ab=self._ab
pal({nil,nil,nil,nil,nil,nil,nil,_ab,nil,_ab,_ab,self.col1,nil,_ab})
if self._ah then
pal(self._cg[self._ae], self.col1)
else
pal(11,self.col1)
self._ae=1
end
end
local _ac=function(self)
pal(7,8)
if(self.id==80 and _bq._af==2 and not _bq._ag) pal(7,11)
end
function _9(self, _aa)
self._c2,self.last_process,self._af=0,self._af,_aa
if(self.last_process>0) self._ag=not self._ag
if(_aa==1) self._b3._ah=true self._b3._ai=self
end
local _aj=[[id|_bv|_av|my|ico_spr|type|w|h|z|trans_col|_bo|_bp|_7|col1|_ab|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_em|power|_e5|_b9|_f7|range|_co|fire_size|fire_rate|fire_sfx|death_sfx|norotate|altframe|_cy|_cr|_af|spent|_c3|_ct|_cu|_ae|col_cycle_src|storage|capacity|is_repairable|ai_build|ai_priority|moves|tracked|on_foot|is_building|is_unit|is_dockable|capturable|can_fire|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|_cg|_bz|description|_b5|_b6
1|64|64||170|2|2|2|0||nil|||||||2|2|1|1|||100|0||1600|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1||||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_6
2|22|22||162|2|2|2|0||1|||||7|5|2|2|1|4|||20|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0.5|nil||nil|1|nil|nil|nil|nil||1|nil||||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22||162|2|1|1|0||1|||||6|6|2|2|1|1|||5|0||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil||nil|1|nil|nil|nil|nil||1|nil||||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|133|133||164|2|1|1|0||1|||||||2|2|7|4|||50|0||200|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|3|nil||nil|1|nil|nil|nil|nil||nil|nil||||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
5|66|66||172|2|2|2|0||1|||||||2|2|1|1|||300|-100||800|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|30|nil||nil|1|nil|nil|1|nil||1|1|||12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
6|68|68||174|2|3|2|0||1|||||||2|2|5|1|||400|30||1800|0||||||53|nil||8|0|0|0|0|0|1|1|11|1000|nil|1|nil|30|nil||nil|1|nil|1|1|nil||1|1|||11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ad|
7|106|106||136|2|2|2|0||1|||||||2|2|5|2|||400|30||2000|0||||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|27.5|nil||nil|1|nil|nil|nil|nil||1|1|||8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
8|104|104||134|2|2|2|0||1|||||||2|2|6|2|||150|5||600|0||||||53|nil|||0|0|0|0|0|1|1||1000|nil|1|nil|15|nil||nil|1|nil|nil|1|nil||1|1||||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
9|108|108||168|2|2|2|0||1|||||11|3|2|2|7|2|-3||300|10||1200|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1||||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_6
10|110|110||138|2|2|2|0||1|||||||2|2|7|2|-1||400|10||1600|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|17.5|nil||nil|1|nil|nil|nil|nil||1|1||||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_6
11|96|96||140|2|2|2|0||1|||||||2|2|6|2|||400|20||1400|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1||||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_6
12|98|98||142|2|3|2|0||1|||||||2|2|11|3|||600|20||800|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|60|nil||nil|1|nil|nil|1|nil||1|1||||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_6
13|101|101||166|2|3|2|0||1|||||||2|2|12|5|||500|35||1600|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|20|nil||nil|1|nil|nil|1|nil||1|1||||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_6
14|128|128||230|2|3|2|0||1|||||||2|2|12|5|||700|20||800|0||||||53|nil||2|0|0|0|0|0|1|1|8|0|nil|1|nil|60|nil||nil|1|nil|1|1|nil||1|1|||0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
15|71|71|0|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|80|800|0|5|1|0|27|58|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|nil||nil|1|1|nil|1|1||1|1|6|6||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
16|87|87|2|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|240|800|0|10|2|1.9|40|59|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|7.5|nil||nil|1|1|nil|1|1||1|1|6|6||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
17|61|61||228|2|3|3|0||1|||||11|3|2|2|6|6||1|500|50||2000|0||||||53|nil||8|0|0|0|0|0|1|1|11|0|nil|1|nil|25|nil||nil|1|nil|nil|1|nil||1|1|||11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|_ad|_6
18|131|131||224|2|2|2|0||1|||||||2|2|12|7|||500|40||1600|0||||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|10|nil||nil|1|nil|nil|nil|nil||1|1||||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
19|58|58||226|2|3|3|0||1|||||||2|2|17|8||1|999|80||4000|0||||2,400||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|40|nil||nil|1|nil|nil|nil|nil||1|1||||pALACE|tHIS IS YOUR pALACE.||
20|49|49||236|1|0.5|0.5|1|11|9|||||15|3|2|2|9|2|-3||60|0|24|80|0.05|3|1|0|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|1|nil|1|nil|1|nil||1|1|nil|nil||||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
21|48|48||236|1|1|1|1|11|9|||||15|3|2|2|9|2|-3||100|0|16|200|0.03|3|1|0|15|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|2|1|nil|1|nil|1|nil||1|1|nil|nil||||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
22|49|111||194|1|0.5|0.5|1|11|10|||||||2|2|10|3|-1||100|0|16|180|0.07|7|2|1|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|1|nil|1|nil||1|1|nil|nil||||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
23|48|127||194|1|1|1|1|11|10|||||||2|2|10|3|-1||200|0|32|440|0.1|7|2|1|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|5|1|nil|1|nil|1|nil||1|1|nil|nil||||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|253||236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0|0|64|440|0.1|4|1|0|17|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|1|nil|1|nil||1|nil|nil|nil||||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0|0|1600|40|0.27|1|1|0|800|60|57|1|49|8|0|0|0|0|0|1|1||0|nil|nil|nil|70|1|nil|1|nil|1|nil||1|nil|nil|nil||||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0|0|64|440|0.1|2|2|1|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|5|1|nil|1|nil|1|nil||1|nil|nil|nil||||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
27|51|51|4|204|1|1|1|1|11|11|17||||15|4|2|2|11|2|1||150|0|32|400|0.3|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|5|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
28|52|52|6|206|1|1|1|1|11|11|17||||||2|2|11|3|||200|0|56|520|0.27|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
29|53|53|8|196|1|1|1|1|11|12|17||||||2|2|7|4|||300|0|100|800|0.17|5|1|0|27|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|10|1|1|nil|nil|1|nil||1|nil|1|nil|7|6||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
30|55|55|10|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600|0|240|1200|0.13|6|1|0|30|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|8|7||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
31|54|54|12|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450|0|600|400|0.2|10|2|1.9|40|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|15|1|1|nil|nil|1|nil||1|nil|1|nil|7|6||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
32|50|50|14|192|1|1|1|1|11|12|17||||12|12|2|2|12|2|||300|0|0|600|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|0|1|1|15|1|1|nil|nil|1|nil||nil|nil|1|nil|8|7||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
33|73|73|16|238|1|1|1|8|11|13|17||||11|3|2|2|13|5|||800|0|0|400|1.33|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1.6|1|nil|nil|nil|1|nil||nil|nil|1|nil|8|7||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
34|20|40|20|160|1|1|1|4|11|13|||||||2|2|18|7|-3||600|0|296|4|1|7|2|1.9|33|59|54|nil|22|8|0|0|0|0|0|1|1||0|nil|nil|1|3|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
35|38|38|24|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900|0|0|600|0.13|0|||0||54|nil|||0|0|0|0|0|1|1||0|nil|1|nil|15|1|nil|nil|nil|1|nil||1|nil|1|nil|8|7||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
36|57|57|26|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600|0|240|440|0.2|9|3|0|27|52|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|11|1|1|nil|nil|1|nil||1|nil|1|nil|7|6||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
37|56|56|28|200|1|1|1|1|11|12|||8|12|||2|2|18|8|3||800|0|320|1600|0.07|8|2|1|33|61|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|18|1|1|nil|nil|1|nil||1|nil|1|nil|8|7||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
38|72|72|30||1|1|1|8|11|||0|||||2|2|13|8|3||0|0|1600|40|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
38.5|72|72|30||1|1|1|8|11|||0|||||2|2|13|8|4||0|0|1600|40|0.67|0|20|0|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|1|nil||1|nil|nil|nil|6|6||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
39|51|205|4|204|1|1|1|1|11|11|||||11|1|2|2|11|2|2||150|0|40|320|0.4|4|1|0|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|6|1|nil|nil|nil|1|nil||1|nil|1|nil|6|6||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
40|54|202|12|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750|0|0|480|0.2|9|1.9|1.9|60|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|17.5|1|1|nil|nil|1|nil||1|nil|1|nil|7|6||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
41|88|88|||9|1|1|1|11||||||||2|2||3|||0|0|300|4000|0.35|0|||7|50||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|0|1|nil|nil|nil|nil|nil|||nil|nil|nil||||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
42|32|32|||1|1|1|1|11|||2|||||1|1||1||||||4|0.1||||||53|1|||0|0|0|0|0|1|1||0|nil|nil|nil|0|nil|nil|nil|nil|nil|nil|||nil|nil|nil||||sPICE bLOOM|||
80|3|3||3|3|1|1|0|11||||||||1|1||1||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||rEPAIR||_ac|action_click
81|1|1||1|3|1|1|0|11||||||||1|1||1||||||0|0|||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil||nil|||nil|nil|nil|||nil|nil|nil||||lAUNCH||_ac|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _ak=_gs(_aj,"|","\n")
_aj={}
for i=2,46 do
local _al={}
for j=1,68 do
local _am=_ak[i][j]
if(j<64) _am=tonum(_am)
if j==66 then
_an,_am=_gs(_am,"~"),"" for line in all(_an) do
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
x=self.x+(_du and 0 or _at),y=self.y+(_du and 0 or _au),w=0,h=0
}
end,_ap=function(self)
local _aq=(_bq and _bq.is_unit and _bq._7==1 or _dw) and 3 or 0
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
mset(mx,my,_ff(mx,my+1))
_bf(_as, ox*8, oy*8)
end
end
end
_aw=cocreate(function()
while true do
if t_%30==0 then
_gq(false)
_k={}
for _cx in all(_j) do
_k[_c5(_cx)]=_cx
end
local _ax={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ay=_ff(i,l)*8
if(_w[i][l]==16) _ax[(i/2).."," ..(l/2)]=_ay>0 and sget(_ay%128+3, _ay\128*8+3) or 15
end
yield()
end
end
_az,_a0,_a1,_o=0,0,{0,0},{{},{}}
for building in all(_i) do
if building.id!=4 then
if building._7==1 or (hq and _gm(building)) then
_ax[(building.x\16).."," ..building.y\16]=building.col1
end
if building._7==1 then
_az-=building.power
_a0+=building.storage
end
_a1[building._7]+=1
_gu(_o[building._br], building.id, building)
_k[_c5(building)]=building
end
end
for _cx in all(_j) do
if hq and (_cx._7==1 or _gm(_cx) and not _cx._ci) then
_ax[(_cx.x\16).."," .._cx.y\16]=_cx.col1
end
if(_cx._br>0) _gu(_o[_cx._br], _cx.id, _cx)
end
hq,_l=_o[1][7] and _az>0,_ax
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
?"\^jae\+8h\#0\^w\^t         \^-w\^-t\^d2\^jaf\-cmission " ..(_a3<3 and"complete" or"failed"),_c
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _a6=0
_a7,_a8,_a9,_ba,_bb={{rnd"500",rnd"500" }},rnd"1",0,split"15,9,4",0
end
function _bc(_bd,_be)
local _bh=_bd.req_faction
return not _bh
or _bh==_be
or (_bh<0 and _bh!=-_be)
end
function _bf(_as, x,y, _7, _bg)
local _bi=_b0(_as, x,y, _as.type, nil, g_[_as._b4], g_[_as._b5], nil)
_bi.ico_obj,_bi._cr,_bj,_bi._7=_b0(_as, 107,0, 4, _bi, nil, nil, g_[_as._b6]), _bj and _as._b9/2 or _as._b9, false, _bi._7 or _7
if _bg then
_bi._bk=_bg._bk
else
if _bi._7 then
_bi._bk,_h=1,_f[1]
else
local _bl=9999
for i=1,#_f do
local _bm=_gy(x,y,_f[i][4],_f[i][5])
if(_bm<_bl) _bi._bk,_bi._7,_bl=i,min(i,2),_bm
end
end
end
_bi._br,_bi.build_objs,_h=_7 or _bi._7,{},_f[_bi._bk or _bg._bk]
_bn=_h[1]
_bi._e7,_bi.col1,_bi._ab=_bn,_h[2],_h[3]
if(not _bc(_bi,_bn)) return
for o in all(_aj) do
if o._bo
and (o._bo==_bi.id or o._bp==_bi.id)
and _bc(o,_bn)
then
add(_bi.build_objs,_b0(o, 107,0, 5, _bi, nil, nil, function(self)
if _8 then
_bq=self
else
if self.is_building and #_i<150 or self.is_unit and #_j<75 then
_9(self, 1)
elseif _bi._br==1 then
_gb"uNABLE TO CREATE MORE" end
end
end)
)
end
end
if _as.col1 then
_bi.col1,_bi._ab=_as.col1,_as._ab
end
if(_bi._ci) _bi._7=0
local _bs,_bt=x\8,y\8
if _as.is_building and not _as.is_unit then
local _bu=_as._bv==22
for xx=0,_as.w-1 do
for yy=0,_as.h-1 do
if not _bu or fget(_ff(_bs+xx, _bt+yy),5) then
_fg(_bs+xx, _bt+yy, _bu and 22 or _bi._7==1 and 81 or 103)
end
end
end
if(not _bu) add(_i,_bi)
if _bi.id==6 and not _bi._b3 then
_d2(_bi)
end
else
_bi.r=_bi.norotate!=1 and (_bs%8)*.125
if _bi.can_fire then
_bi._bw=function(self)
self._cv,self._c0,self.bullet_y,self.bullet_tx,self._bx=4,self.x+4,self.y+4,self._cz.x+self._cz.w/2,self._cz.y+self._cz.h/2
local dx,dy=self.bullet_tx-self._c0,self._bx-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._by=dx/d,dy/d
_go(self.fire_sfx)
_dc(self)
end
if _bi.moves then
_bi._bz=split"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_bi._e7].." " .._bi._bz
else
_fg(_bs,_bt,_bi._7==1 and 2 or 133)
end
end
if(_bg and _bg.id==6) _bi._cc=_bg
add(_j,_bi)
_er(_bi, nil, true)
end
_dc(_bi)
return _bi
end
function _b0(_b1, x,y, _b2, _b3, _b4, _b5, _b6)
local _b7={
_b8=_b1,id=_b1.id,_b9=_b1._b9,x=x,y=y,_ca=x/8,_cb=y/8,type=_b2,_b3=_b3,_b6=_b6,w=_b1.w*8,
h=_b1.h*8,_cd=_b1._bv,_ce=_b1.w,
_cf=_b1.h,
_cg=split(_b1._cg),_ch=_b1._em,_ci=_b1.z>1,_ao=function(self)
return {
x=self.x,y=self.y-self.z,w=_b2>3 and 16 or self.w,h=_b2>3 and 16 or self.h
}
end,_ap=function(self)
local x,y,_cj=self.x\1,self.y\1,self.r
if _b2>2
or (x+self.w>=_at
and x<=_at+127
and y+self.h>=_au
and y<_au+127+self.z)
then
pal()
palt(0,false)
if _cj then
ovalfill(x+3, y+3, x+self.shad_w, y+self.shad_h, 1)
end
if(self.trans_col and _b2<=3) palt(self.trans_col,true)
if(self._e7 and self.id!=18) pal(12,self.col1) pal(14,self._ab)
if _b2>3 then
local _ck=_b2==5 and self or self._b3
?"\#0\-j\|g\^x7  \n\-j  \n\-j  \n\-j\^y2  ",x,y
local hp=_ck._b9
local _am=self._af==1 and _ck._cr/6.666 or 15*(_ck._cr/hp)
if(_ck._cr>0 and not _8) rectfill(x,y+17,x+_am,y+18, self._af==1 and 12 or (split"8,10,11,11")[_ck._cr\(hp/3)+1])
pal(11,_ck.icol1) pal(3,_ck.icol2)
end
if self._cg then
pal(self.col_cycle_src, self._cg[self._ae])
end
if(flr(self._cu)%2==0) pal(split"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")
if(_b5) _b5(self)
if _cj then
if not self.death_time then
local cs,ss,_cl,_cm,cx,cy,dx,dy=cos(_cj),sin(_cj),126.7,self.my-0.3,127.5,self.my+.5,x+3.5,y-self.z+3.5
_cm -=cy
_cl -=cx
local sx,sy,_cn=cs*_cl+cx,-ss*_cl+cy,-_cl*8
for py=dy-_cn, dy+_cn do
tline(dx-_cn,py,dx+_cn,py,sx+ss*_cm,sy+cs*_cm,cs/8,-ss/8)
_cm+=.125
end
end
else
if _b2>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
if _b2==5 then
if _b1.is_building then
fillp"0XAFAF" rectfill(x+15,y+15,x+15-(self._ce*2),y+15-(self._cf*2),245)
fillp()
end
if self._ag and not _8 then
?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666" 
end
end
else
spr(self._bv, x, y, self._ce, self._cf)
end
end
end
if _b2<=2 then
if self._c0 then
if self._co==1 then
pset(self._c0,self.bullet_y, rnd{8,9})
else
local _cp=self._co<=2
_g4(
self._c0, self.bullet_y,self.fire_size,
0, 0, _cp and -.3 or 1,0,_cp and 10 or 2.5,_cp and split"7,10,9,8,2" or {15})
end
end
if((self._bv==72 or self._cr<self._b9/2 and self.can_smoke) and _gz"7") _g4(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,split"10,9,8,6")
self._ct=0
end
end,_cq=function(self)
local _cr,id,_cs=self._cr,self.id,self._cs
self._cu=max(self._cu-.4,1)
if self._ct>0 and self._br>0 and id!=42 then
_gq(true)
if(stat"54" >5) music"0"
if(self.is_repairable and self.moves and _cr<99 and self._cv<=6) _gj(self,_gx(self._br,14) or self._cc)
if(self._bv<=49 and _cr<100) self._ce,self._cf=0.5,0.5
if(self.can_fire and self._cv==0) _e2(self, _cs)
end
if(_b2<=2 and _cr<=0 and not self.death_time) self._cv,self.death_time,self._cw=5,.25 _go(self.death_sfx) _a6+=(_b2==2 or self._bv==72) and .25 or 0
if self.death_time then
self.death_time-=.025
if self.death_time<=0 then
if _b2==2 then
for xx=0,self._ce-1 do
for yy=0,self._cf-1 do
_fg(self.x/8+xx, self.y/8+yy, 21)
if(self.soldiers_on_destroy and #_j<75) _bf(_aj[rnd{20,22}],self.x+xx*8,self.y+yy*8,self._7,self)
end
end
del(_i,self)
_q[_cs._br]+=1
else
local gx,gy=_c6(self)
if(_ff(gx,gy)==0) _fg(gx,gy,33)
if(id<=16) _fg(gx,gy,21)
if(self._cc) self._cc._ah=false
if(self._ev and self._ev.id==14) self._ev._cg={0}
_d1(self)
if id==42 then
_fb(self,gx,gy,function (_cx,x,y)
if(_ff(x,y)==0) _fg(x,y,10)
end,4, true)
end
if(_cs) _r[_cs._br]+=1
end
_c7(self)
else
if(_gz(1) and not self.on_foot) _da(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self._cy then
if t_%self._cy==0 then
if self.altframe
and self._cv==2 then
self._bv=self._cd+(self.altframe-self._bv)
self.my=self._bv
end
self._ae=(self._ae%#self._cg)+1
end
end
if self._c0 then
self._c0+=self.bullet_dx*2
self.bullet_y+=self._by*2
if _gy(
self._c0,self.bullet_y,self.bullet_tx,self._bx) < 2
then
_da(self._c0, self.bullet_y, self._co, self.fire_size)
local _cz=self._cz
if _gy(
self._c0,self.bullet_y,_cz.x+_cz.w/2,_cz.y+_cz.h/2) < 4
then
_cz._cr-=self._e5*rnd"1" _cz._ct,_cz._cs=self._co,self
if id==40 and _cz.moves and _gz"5" then
_e8(_cz, self)
_er(self)
elseif _cz.old_fact_data then
_cz._e7,_cz._7,_cz._br,_cz.col1,_cz._ab,_cz.old_fact_data
=
unpack(_cz.old_fact_data)
_er(_cz)
end
end
self._c0=nil
end
end
if self._af>0
and not self._ag
and not self._c1 then
if self._af==1 and self.spent>self._em then
self._c1=true
if(self._b3._7==1) _go"56" _gb"cONSTRUCTION cOMPLETE"
if _b1.is_unit
and self._bo !=1 then
local ux,uy=_e0(self._b3)
_bf(_b1,ux,uy,self._b3._7,self._b3)
_ge(self)
end
elseif self._af==2 and _cr>self._b9 then
self._af=0
if self.is_unit and self.moves then
self._ev._cg,self._cv={0},0
_c4(self,_e0(self))
end
else
if self._c2>3 then
if(_c8(-1,self._af==1 and self._b3 or self)) self._c2=0 self.spent+=1
else
self._c2+=1
self._cr=(self._af==1 and (self.spent/self._em)*100 or _cr+2)
end
end
end
self._c3=max(self._c3-.1)
if self._7==1 then
if(id==5) self._bz="wINDTRAP (\|f\^:0804061f0c040200\|h\-f" .._az..")"
if(self.storage>0) self._bz=_b1._bz.." (" ..flr(_do/_a0*100).."%)" end
end
}
for k,v in pairs(_b1) do
if not _b7[k] and v!="" then
_b7[k]=v
end
end
return _b7
end
function _c4(_b7,x,y)
_b7.x,_b7.y=x,y
end
function _c5(self)
local x,y=_c6(self)
return x.."," ..y
end
function _c6(_b7)
return (_b7.x+4)\8,(_b7.y+4)\8
end
function _c7(_b7)
_bq=_bq!=_b7 and _bq
end
function _c8(_c9, _b7)
if(_g[_b7._7]+_c9<0) return false
_g[_b7._7]+=_c9
if _b7._7==1 then _go"63" end
return true
end
function _da(x,y,_db)
_g4(x, y, 2,0, 0, .1, -.01, _db==1 and 5 or 20, _db==1.9 and split"3,11,3" or split"5,7,5,7,10,8,9,2")
end
function _dc(_dd)
if(_dd._7!=1 and _dd._cv!=4) return
local _de=_dd.type+1
for xx=-_de,_de do
for yy=-_de,_de do
local _df,_dg=_dd.x\8+xx,_dd.y\8+yy
_w[_df][_dg]=16
_en(_df,_dg)
for dy=-1,1 do
for dx=-1,1 do
_en(_df+dx,_dg+dy)
end
end
end
end
end
function _update60()
local _dh,_di,_dj=stat"32",stat"33",stat"34"
left_button_clicked,right_button_clicked
=
(_dj==1 and _dy !=_dj) or btnp"5",(_dj==2 and _dy !=_dj) or btnp"4"
if not _dk then
_dk,_dl=64,64
elseif _dh==_dm and _di==_dn then
b=btn()
_dk+=b\2%2-b%2
_dl+=b\8%2-b\4%2
else
_dk,_dl=_dh,_di
end
_dk,_dl=mid(_dk,127),mid(_dl,127)
cursor.x,cursor.y,_dm,_dn=_dk,_dl,_dh,_di
cx,cy=(_at+_dk)\8,(_au+_dl)\8
_2+=1
if not _8 then
if(_dk<2) _at-=2
if(_dk>125) _at+=2
if(_dl<2) _au-=2
if(_dl>125) _au+=2
_at,_au,_do=mid(_at,_x),mid(-10,_au,_x),tostr(_g[1])
if t_%6<1 and _bb==0 then
if(_gz"18") _a9=rnd".04" -.02
_dp,_dq=_a7[#_a7][1],_a7[#_a7][2]
add(_a7,{_dp+sin(_a8),_dq-cos(_a8)})
_a8+=_a9
local _cx=_f8(_dp\8,_dq\8)
if _cx and not _cx._ci and fget(_ff(_c6(_cx)),2) then
_d1(_cx)
_bb=1
_go"50" end
end
if(#_a7>30) del(_a7,_a7[1])
if(_bb>0) _bb+=1 _e1(_dp,_dq,rnd"1")
_bb%=200
for _cx in all(_j) do
if(_cx._cw) then
if(not coresume(_cx._cw, _cx)) _cx._cw=nil
end
end
for p in all(_n) do
p.dy +=p._g5
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cr +=1
if(p._cr>=p._g9) del(_n,p)
end
if t()%_b==0 then
local _cx=rnd(_j)
if(_1[_cx._e7] or t()%300==0)
and _cx._7==2
and _cx.can_fire
and _cx._cv==0
then
_gl(_cx)
end
local _dr=rnd(_i)
if _dr._7==2
and (not _dr._ai or _dr._ai._af!=1)
then
local u=rnd(_dr.build_objs)
if u and u.ai_build then
u:_b6()
end
if _dr._cr<_dr._b9 and _dr._af!=2 then
_9(_dr, 2)
end
end
local _ds=_gx(2,19)
if _ds
and _1[_ds._e7]
and _ds._c3<=0
then
_gl(_ds)
end
end
coresume(_aw)
end
_dt=false
if _bq then
_du=true
_gf(_eh)
_gf(_ei)
if(_bq.ico_obj and not _8 and not _dt) _gf(_bq.ico_obj) _gf(_bq._ai)
if(_8) foreach(_bq.build_objs, _gf) foreach(_4, _gf)
_du=false
end
if not _8
and not _dt then
foreach(_j, _gf)
foreach(_i, _gf)
end
if(stat"34" >0 or left_button_clicked or right_button_clicked)
and not _8
and _dk>91 and _dk<123
and _dl>91 and _dl<123 then
_bq=_dz
if(stat"34" ==1 or left_button_clicked) and _dx((_dk-91)*2, (_dl-91)*2) then
elseif _2>10 then
_at,_au=mid((_dk-96)*16, _x),mid(-10,(_dl-97)*16, _x)
end
elseif left_button_clicked then
if _dt then
if(_bq) _v=0
if not _8 and _bq._b3 then
if(_bq._b6) _bq:_b6()
_bq=_dz
goto skip_collisions
end
if(_8 and _5._ga and _5._b6) _5:_b6()
if(_bq._7==1 and _bq.is_unit and _bq!=_dz and _bq.moves) _go"62"
if(_bq._br!=1 and _dz and (_dz.is_unit or (_dz.id==19 and _dw)) and _dz._7==1) _bq._cu=10 _e2(_dz, _bq, true) _bq=nil
else
_dx(cx,cy)
local _dv=_bq and _bq._ai
if _dv
and _dv._cr>=100
and _ed then
_bf(_dv._b8,cx*8,cy*8,1)
_ge(_dv)
_go"61" end
end
_dw=false
elseif right_button_clicked and not _8 then
_dw,_bq=false
end
::skip_collisions::
_dy,_dz,_d0=_dj,_bq,_5
t_+=1
end
function _dx(x,y)
if _bq
and _bq._7==1
and _bq.moves
and _bq._cv!=7
then
_bq._cw=cocreate(function(_cx)
_fj(_cx, x, y)
_er(_cx, nil, true)
end)
_c7(_bq)
_2=0
return true
end
return false
end
function _d1(_cx)
del(_j,_cx)
if _cx.id==32 and #_o[_cx._br][32]<=1 then
_d4=_gx(_cx._br,6)
if(_d4) _d2(_d4)
end
end
function _d2(_d3)
local _d5=_bf(_aj[32],_d3.x,_d3.y,_d3._7,_d3)
_d5._cv=9
end
function _draw()
cls"15"
camera(_at+(16-rnd"32")*_a6, _au+(16-rnd"32")*_a6)
_a6=_a6>0.05 and _a6*0.95 or 0
for i=1,#_a7 do
if(i!=#_a7 and i%2==1) fillp(0xa5a5.8)
circfill(
_a7[i][1]+4,_a7[i][2]+4,4,_ba[(i-#_a7)%3+1])
fillp()
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
if(_bb>0) spr(88+_bb\100, _dp, _dq)
for building in all(_i) do
if not _8
then
if(t_%3==0) building:_cq()
if(building._ai) building._ai:_cq()
end
building:_ap()
if(building==_bq) rect(_bq.x, _bq.y, _bq.x+_bq.w-1, _bq.y+_bq.h-1, 7)
end
pal()
for p=1,2 do
for _cx in all(_j) do
if(p==1 and not _cx._ci) or (p==2 and _cx._ci) then
if(not _8) _cx:_cq()
if(_cx._af!=2 or not _cx.moves) _cx:_ap()
if(_cx==_bq) ?"\f7\^:42c300000000c342",_bq.x, _bq.y-_bq.z
end
end
end
pal()
for p in all(_n) do
if(p._g7) fillp(p._g7)
circfill(p.x,p.y,p.r,p._g6[ flr((#p._g6/p._g9)*p._cr)+1 ])
fillp()
end
local _d6,_d7=_at\8,_au\8
palt(0,false)
palt(11,true)
for xx=_d6-1,_d6+16 do
for yy=_d7-1,_d7+16 do
local gx,gy,_d8=xx*8,yy*8,_w[xx][yy]
if _d8!=0 and _d8!=16 then
spr(_d8+31,gx,gy)
elseif _d8<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
local _dv=_bq and _bq._ai
if _dv
and (_dv.type==5
and not _dv.moves)
and _dv._cr>=100 then
local _d9,_ea=(_dk+_at)\8, (_dl+_au)\8
local _eb,_ec,w,h=_d9*8-_at,_ea*8-_au,_dv._ce,_dv._cf
_ed,_ee,_bj=false,false,false
for xx=-1,w do
for yy=-1,h do
local _am=_ff(_d9+xx, _ea+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_am,4)) _ed=true
else
if(fget(_am,5)) _bj=true
if(not _fi(nil,_d9+xx,_ea+yy) or _am==0 or _am<=11 or _am>=23) _ee=true
end
end
end
if(_ee and _dv._b8._bv!=22) _ed=false
fillp"0b1110110110110111.1" rectfill(_eb, _ec,_eb+_dv.w, _ec+_dv.h, _ed and 11 or 8)
fillp()
end
rectfill(unpack(split"0,0,127,8,9"))
line(unpack(split"0,9,127,9,4"))
_v-=1
?(_v>0 and _gd or _bq and _bq._bz or""),2,2,0
?sub("00000", #_do).._do, 103,2, _d
if hq!=_z then
_u=1
if _z then _gb"pOWER LOW. bUILD wINDTRAP" end
_go"55" end
_z=hq
local _ef=5934
for _eg=17152,17632,16 do
memcpy(0x6000+_ef, _eg, 16)
_ef+=64
end
?"\^jnn\|e\-e\^x3\^y5\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jvn\^y5\|j\-e\^h\-f\|c\n|\n|\n|\n|\n|\n|\^y1\n|\^jnm\-g\|j\^y1\^x2\*5▤゛\^jnv\|f\^y1\^x2\*5▤゛\^g",_d
?"\f7\|e\-f\^x3\^y4\^h\-f\|c\n|\n|\^g\|i\-n\^h\-f\|c\n|\n|\^g\^x2\-a\|e\*4-\^g\^y5\-a\|j\*4_\0",ceil(92+_at/16),ceil(92+_au/16)
if _u>0 and _u<77 then
for i=1,300 do
pset(92+rnd"31",92+rnd"31",5+rnd"3")
end
_u+=1
end
if _bq and _bq.ico_spr then
_c4(_bq.ico_obj,107,20)
_bq.ico_obj:_ap()
_eh,_ei=nil
if _bq._7==1 then
if _dv then
_c4(_dv,107,44)
_dv:_ap()
end
if _bq._cr<_bq._b9
and _bq.is_repairable
and _bq.is_building then
_eh=_b0(_aj[80], 115,28, 3, {}, nil, _ac, function()
_9(_dz, 2)
end)
_eh:_ap()
end
if(_bq.id==19
and _bq._c3<=0)
or _bq.id==35
then
_ei=_b0(_aj[81], 107,29, 3, {}, nil, _ac, function()
if _dz.id!=35 then
_gb"pICK tARGET" _dw=true
else
local mx,my=_c6(_dz)
local _am=_ff(mx,my)
if _am>=12 and _am<=22 then
_dz._cr,_dz=0
_bf(_aj[1],mx*8,my*8,1)
_go"61" end
end
end)
_ei:_ap()
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
if _bq.build_objs then
_bq._ej={}
rectfill(unpack(split"6,21,27,89,0"))
local _ek=1
for i=1,#_bq.build_objs do
local _el=_bq.build_objs[i]
if(_o[_bq._br][_el.req_id])
and _el.req_level<=_a
and _bc(_el,dget"6")
then
_bq._ej[_ek]=_el
if _ek>=_3 and _ek<=_3+2 then
_c4(_el, 9, 24+(_ek-_3)*20)
_el:_ap()
else
_el.x=-16
end
_5=_5 or _bq._ej[1]
if _5==_el then
_y=_ek
if(_bq.id==17) srand(t_\3600) _5._em=_5._ch \ (rnd"1.334" +0.666)
?"\f7\^x3\-f\|c\*6-\n\-d\|d|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|f|    \^x4 |\^x3\n\-d\|d|    \^x4 |\^x3\n\^x3\-f\|d\*6-",9,_el.y
?"\^j87\-f\|a\^h\f7" .._5._bz.."\n\|h\f9\^:041f051f141f0400\-f\|h" .._5._em.."\^je8\|d\fd\^:1f1b111b1f0e0400\|h" .._5._b9..(_5.is_building and"\^jl8\|d\fa\^:0804061f0c040200\|h" .._5.power or"\^jl8\|d\f8\^:081c226b221c0800\|h\-h" .._5._e5).."\n\|g\f6" .._5.description
end
_ek+=1
end
end
end
foreach(_4, function(c) c:_ap() end)
end
palt(11,true)
cursor:_ap()
end
function _en(x,y)
local _eo=0
if x>=0 and x<=66 and y>=0 and y<=66
and _w[x][y]!=0 then
if(_w[x][y-1]>0) _eo+=1
if(_w[x-1][y]>0) _eo+=2
if(_w[x+1][y]>0) _eo+=4
if(_w[x][y+1]>0) _eo+=8
_w[x][y]=1 + _eo
end
local _ep=_f8(x,y)
if(_ep and _ep.is_building) _1[_ep._e7]=true
end
function _eq(x,y)
return fget(_ff(x,y),7)
end
function _er(_cx, _es, _et)
_cx._cv,_cx._ew,_cx._eu=_es or 0,true
if(_et) _cx.gx,_cx.gy=_cx.x,_cx.y
_cx._cw=cocreate(function(self)
while true do
if self._ci then
_fj(self,mid(flr(self._ca+rnd"32")-16,64),mid(flr(self._cb+rnd"32")-16,64))
end
if self.id==34 then
_gl(self)
elseif _gz"250" and self.can_fire and self._cv!=8 then
local gx,gy=_c6(self)
_fb(self,gx,gy,function (_cx,x,y)
local _cz=_f8(x,y)
if _cz and _cz._br!=_cx._br and _w[x][y]==16 and (not _cz._ci or _cx.id==16) then
_e2(_cx,_cz)
return true
end
end,max(4,self.range))
end
local _cc=self._ev or self._cc
if self.id==32 then
self._bz="hARVESTER (" ..(self.capacity\15).."%)"
if self._cv==0 or self._cv==9 then
if self.capacity<1500
and self._cv!=7 and self._cv!=9 then
self._ev=nil
local sx,sy
local tx,ty=_c6(self)
if _eq(tx,ty) and not self._ex then
sx,sy=tx,ty
else
_fb(self,tx,ty,function(_cx,x,y)
if _eq(x,y) then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cx._ew=_fj(_cx,sx,sy,nil,not _cx._ew)
if not _cx._ew and not _gx(_cx._br,33) then
_c4(self,_e0(self))
end
if(_eq(_c6(_cx))) _cx._cv=6
end
elseif self.capacity >=1500
and self._cv<7 then
self.sx,self.sy=_c6(self)
_gj(self,_cc or _gx(_cx._br,6))
end
elseif self._cv==6 then
self._ex=false
_e1(_cx.x, _cx.y, _cx.r+.75+rnd".2" -.1)
local _ey=_c5(_cx)
self.capacity+=.5
_m[_ey]=(_m[_ey] or 1000)-1
if _m[_ey] <=0 then
local _bs,_bt=_c6(self)
for yy=-1,1 do
for xx=-1,1 do
_am=_ff(_bs+xx,_bt+yy)
_fg(_bs+xx,_bt+yy,(xx==0 and yy==0) and 0 or ((_am>3 and _am<10) and 10 or _am)
)
end
end
self._cv=0
end
if(self.capacity%300==0) self._ex=true self._cv=0
end
end
if self.id>26 then
if self._cv==9 then
if _cc._cr>0 and not _cc._ez and self._cr>0 then
_cc._ah,self._cv,self.r=false,8,.25
_c4(self,_cc.x+16,_cc.y+4)
_c7(self)
if self.capacity and _cc.id==6 then
_cc._ez=self
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
_0[self._7]+=.5
if tonum(_do)<_a0 then
_c8(2,self)
elseif self._7==1 then
_gb"sPICE LOST. bUILD sILOS" end
end
yield()
end
self.capacity,self._cv,_cc._ez=0,0
if self.sx then
_fj(self, self.sx, self.sy, 0, true)
else
_c4(self,_e0(self))
end
else
self._af,self._c2,_cc.col_cycle_src,_cc._cg=2,0,8,split"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _e0(_cz)
local ux,uy=_fb(_cz,(_cz.x+8)\8, (_cz.y+8)\8, _fi, 99, true)
return ux*8,uy*8
end
function _e1(x,y,r)
if(_gz"10") _g4(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,split"2,4,9,15")
end
function _e2(_cx, _cz, _e3)
local id=_cx.id
if id!=19 then
local _e4=_cx.range*5
_cx._cv,_cx._cz,_cx._cw=3,_cz,cocreate(function(self)
while _cz._cr>0 and _cz._cv!=8 do
if _gy(_cx.x,_cx.y,_cz.x,_cz.y) > _e4
and _cx.moves then
if not _e3 and _gy(_cx.x,_cx.y,_cx.gx,_cx.gy) > _e4 then
goto exit_attack
end
if _fj(_cx,(_cz.x+rnd(_cz.w))\8,(_cz.y+rnd(_cz.h))\8,_e4)
and _cx._e5==1600
then
_cx._cr=0
for i=1,15 do
_da(_cx.x+rnd"32" -16,_cx.y+rnd"32" -16, 2)
end
_cz._cr-=(1000+rnd"600")
_cz._cs=_cx
return
end
end
if not _cx.norotate then
local a=atan2(_cx.x-_cz.x, _cx.y-_cz.y)
while (_cx.r !=a) do
_g1(_cx, a)
end
end
local _e6=_gy(_cx.x,_cx.y,_cz.x,_cz.y)
if _e6<=_e4 then
if _e3 and _cz.capturable and _cx.can_capture and _cz._cr<=_cz._b9/3
then
_fj(_cx,_cz.x\8,_cz.y\8,0)
_e8(_cz, _cx)
if(_cz._ez) _e8(_cz._ez, _cx)
_cx._cr=0
elseif _cx._c3<=0 and not _cx._c0 and _cz._cr>0
and (_e6>=20 or id!=31) then
_cx._bw(_cx)
_cx._c3=_cx.fire_rate
end
elseif _cx.is_building then
_er(_cx)
end
yield()
if(id==40 or id==34 or _cz._e7==_cx._e7 or _cz._eu) break
end
::exit_attack::
if(not _e3) _fj(_cx,_cx.gx\8,_cx.gy\8)
_er(_cx, nil, true)
end)
else
_e2(_bf(_aj[({24,25,38,38.5})[_cx._e7]], _cx.x,_cx.y, _cx._7, _cx), _cz)
_cx._c3=583
end
end
function _e8(_e9, _fa)
_e9.old_fact_data,_e9._e7,_e9._7,_e9._br,_e9._bk,_e9.col1,_e9._ab
=
{_e9._e7,_e9._7,_e9._br,_e9.col1,_e9._ab},_fa._e7,_fa._7,_fa._br,_fa._bk,_fa.col1,_fa._ab
end
function _fb(_cx,x,y,_fc,_fd,_fe)
for t=rnd"1",_fd or 4,.075 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_fc(_cx,xx,yy)) return xx,yy
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
function _fi(_cx,x,y)
local _ep=_f8(x,y)
return not _ep or _ep==_cx or _ep._ci or (_ep.on_foot and _cx.tracked and _ep._br!=_cx._br)
end
function _fj(_cx,x,y,_fk,_fl,_es)
local gx,gy=_cx.x\8,_cx.y\8
if _fl then
local _fm=_gx(_cx._br,33)
if _fm and not _fm._eu and _fm._e7==_cx._e7 then
_fm._eu,_cx._eu,_cx._cv, _fm._cw=_cx,_fm,2, cocreate(function(unit_c)
_fj(unit_c,gx,gy)
_c7(_cx)
if _cx._cr>0 then
_fm.my=18
del(_j,_cx)
_fj(_fm,x,y)
_c4(_cx,_fm.x,_fm.y)
add(_j, _cx)
_er(_cx,_es)
end
_fm.my=16
_er(_fm)
end)
return
end
end
::restart_move_unit::
if not _cx._ci and not _fi(_cx,x,y) then
x,y=_fb(_cx,x,y,_fi)
end
_cx.tx,_cx.ty,_cx.prev_state,_cx._cv,_cx._fn=x*8,y*8,_cx._cv,1
if true then
local start, goal, _fp={ x=gx, y=gy}, {x=x, y=y}, function (_fo) return (_fo.y<<8) + _fo.x end
local _fw,_fq={
_fr=start,_fs=0,_ft=_g3(start, goal)
}, {}
_fq[_fp(start)]=_fw
local frontier, frontier_len, goal_id, max_number, count={_fw}, 1, _fp(goal), 32767.99, 0
while frontier_len > 0 do
local _em=max_number
for i=1, frontier_len do
local _fu=frontier[i]._fs + frontier[i]._ft
if(_fu <=_em) _fv,_em=i,_fu
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
_cx._fn=p
goto end_pathfinding
end
local _fy={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _ep=_f8(nx,ny)
if(xx!=0 or yy!=0)
and _cx._ci or (not fget(_ff(nx,ny),0) or _cx.on_foot and fget(_ff(nx,ny),1))
and _fi(_cx,nx,ny)
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
_fr=n,_fs=max_number,_ft=_g3(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fq[id]=_f0, _f0
end
if not _f0._fx and _f0._fs > _fz then
_f0._fs, _f0._f1=_fz, p
end
end
count+=1
if(not _cx._ci) yield()
if(count>3000 or stat"0" >1843) goto end_pathfinding
end
end
::end_pathfinding::
_cx.prev_state,_cx._cv=_cx._cv,2
if _cx._fn then
for i=#_cx._fn-1,1,-1 do
local _fo=_cx._fn[i]
local nx,ny,ux,uy=_fo.x,_fo.y,_cx.x,_cx.y
local mx,my=nx*8,ny*8
if not _cx.norotate then
local a=atan2(ux-mx, uy-my)
while (_cx.r !=a) do
_g1(_cx, a)
end
end
if(not _cx._ci and not _fi(_cx,nx,ny)) goto restart_move_unit
local _f2,_f3=_cx._f7, _gy(mx,my,ux,uy)
local _f4,_f5=_f2 * (mx-ux) / _f3, _f2 * (my-uy) / _f3
local _f6=_f8(nx,ny)
if(_f6 and _f6.on_foot and _cx.tracked) _f6._cr=0
for i=0, _f3/_f2-1 do
_k[nx.."," ..ny]=_cx
_cx.x+=_f4
_cx.y+=_f5
if _cx.id==33 then
if _cx._eu then
local d=_gy(_cx.x,_cx.y,_cx.tx,_cx.ty)
if(d<32) _cx.z=d/4
end
_cx.z=mid(2,_cx.z+0.1,8)
_cx._f7=_cx.z/10
end
yield()
end
_c4(_cx,mx,my)
_k[nx.."," ..ny]=_cx
_dc(_cx)
if(_gy(_cx.x,_cx.y,_cx.tx,_cx.ty) <=(_fk or 0)) break
end
else
_cx._cv=0
return false
end
_cx._cv=0
return true
end
function _f8(tx,ty)
return _k[tx.."," ..ty]
end
function _f9(x,_ga,_b6,_w)
add(_4,{
x=x,y=81,w=_w or 22,h=8,_ga=_ga,_ao=function(self)
return self
end,_ap=function(self)
local c,b=self._gi and 7 or 6,#_ga>1
if(b) ?"\-g\|g\^x2███\^x1█\n\-g\|e\^x2███\^x1█",x,81,c
?_ga,x+2,83,b and 0 or c
end,_b6=_b6
})
end
function _gb(_gc)
_gd,_v=_gc,500
end
function _ge(_b7)
_b7._cr,_b7._af,_b7.spent,_b7._c1=0,0,0,false
if(_b7._b3) _b7._b3._ah=false
end
function _gf(_b7)
if(not _b7) return
local _gg,_gh=cursor:_ao(),_b7:_ao()
_b7._gi=_gg.x <=_gh.x + _gh.w and
_gg.x + _gg.w >=_gh.x and
_gg.y <=_gh.y + _gh.h and
_gg.y + _gg.h >=_gh.y
if left_button_clicked and _b7._gi then
if _8 then
_5=_b7
else
if(_b7.type<=2 and _w[cx][cy]==0 or _b7._cv==8) return
if _bq
and _dz
and (_b7.id==6 and _dz.id==32
or _b7.id==14 and _dz.id>26)
and _b7._7==1 and _dz._7==1
then
_gj(_dz,_b7)
return
else
_bq=_b7
end
end
_dt=true
end
end
function _gj(_cx,_d3)
local _d3,_gk,_fl=_d3 or _gx(_cx._br,1) or _cx
_cx._cv,_d3._ah,_cx._ev=7,true,_d3
if(_cx.id!=32 or _d3.id==6) _cx._cc=_d3
_cx._cw=cocreate(function(_cx)
if(_d3.is_dockable) _gk,_fl=9,true
_fj(_cx, (_d3.x+16)/8, _d3.y/8, 0, _fl, _gk or 0)
if(not _cx._eu) _er(_cx, _gk)
end)
end
function _gl(_b7)
local _gn,_cz=0
for building in all(_i) do
if building._br!=_b7._br
and _gm(building)
and building.ai_priority > _gn
then
_cz,_gn=building,building.ai_priority
end
end
if(_cz) _e2(_b7, _cz, true)
end
function _gm(_b7)
local x,y=_c6(_b7)
return _w[x][y]==16
end
function _go(_gp)
sfx(_gp,3)
end
function _gq(_gr)
local _am=peek(0x3115)
if(_am & 128 > 0 !=_gr) _am=_am^^128
poke(0x3115, _am)
end
function _gs(_gt,d,dd)
d=d or","
if(dd) _gt=split(_gt,dd)
if type(_gt)=="table" then
local t={}
while #_gt>0 do
local s=_gt[1]
add(t,split(s,d))
del(_gt,s)
end
return t
else
return split(_gt,d)
end
end
function _gu(_gv,_gw,_dd)
if(not _gv[_gw]) _gv[_gw]={}
add(_gv[_gw],_dd)
end
function _gx(_br,id)
local _gv=_o[_br][id]
if(_gv) return rnd(_gv)
end
function _gy(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gz(_g0)
return rnd(_g0)<1
end
function _g1(_cx, _g2)
local _c9=_g2-_cx.r
if _c9 > 0.5 then
_c9 -=1
elseif _c9 < -0.5 then
_c9 +=1
end
if _c9 > 0.0087 then
_cx.r +=0.0087
elseif _c9 < -0.0087 then
_cx.r -=0.0087
else
_cx.r=_g2
end
if(not _cx._ci) yield()
end
function _g3(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g4(x, y, r, dx, dy, dr, _g5, _cr, _g6)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cr=0,_g5=_g5,_g6=_g6, _g7=rnd{0xa5a5.8,0x5a5a.8},_g8=y, _g9=_cr }, 1)
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
bbbbbbbbbb66669bbbbbbbbbbbbbbb51d555555515bbbbbbbbbbbbbbbbbbbbbbbbbebbbbbbbbbbbbb5b1b000bbbbbb10000b1b5b1bbbbbbbb1b1b1bbb9d555db
bbb777bbb66dd66bbd5bb5bbbbbbb5b0d55555550b5bbbbb050b5050bbbbbbbbbb67bb6bbb66eb6bbb5b1b00bbbbb5b000b1b5bb01bbbbbbbb5b5bbb9d5d5d59
bb77994bb6d55d6bb5dbbbbbbbbbbb10d555555501bbbbbbcdcccccebbbbbbbbbc77677bbc77677bbbbbb1b0bbbbbb100b1bbbbb0bbbbbbbbbbbbbbbd555155d
bb79994bb6d55d6bbbbb555bbbbbb1b0d55555550b1bbbbbcdc7766ebbbbbbbbbb67bb6bbb66eb6bbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbbd515555d
bb79944bb66dd66bbbbb5d5bbb5b1b00d555555500b1b5bb050b5050bbb5b5bbbbbebbbbbbbbbbbbbbbbb5b0bbbbbb100b5bbbbb0bbbbbbbbbbbbbbbd555d559
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
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbbbbbbbbb7cebbbd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbbbbbbbbbb7bbb7d1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbb11bbbbbbb6dbbbbb6bb7cd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d555555566d671bb76666a986d77777bd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55777671bbbbbb6dbb6d77777bd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbb11bbbbbbbbbbbbbb6bb7cd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbbbbbbbbbbbbbbbbbb7bbb7d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbbbbbbbbbbbbbbbbb7cebbbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
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
d55776d7777716d6116d6105d500dcd76dcd0dd1bb7cebbbdddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110bec71cc7dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005bec61c7cdddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c5556d77777edddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c60556d77777edddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055bec61c7c5555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076bee71ee755555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dbb7cebbb55555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
cccccccccbb3ccccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccbbc3ccccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddcccccccccccccccc
cccccccbbcc3ccccccccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccbbccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddddddddddddddddddddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccddddddddddddddddddddddddddddddddddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc76753355335cccccc055ffccccccccccccc4ff75550ccdddddddd7773330ddddd28888dc660dddd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc76667555dd555ccccc0f7557ccccccccccc4ffff7fccccddddd4bbbb75550dddd2888888dcddddddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755dddd55ccccc0f7fff7ccccccc54454444444f7cdd45444444444ddddd5225222222287ddd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cd54bbbbbbbbbbb5dd55588888888855dd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
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
040018008c8c8c8c8c8c8c0e2828282828282828282a180b4b4b4b4b4b4b4b4b060e0e000800000000000000000100280000000000000000000001010101010101010001000102010000010101020201011101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101090000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
05050505064400006800680042000d0d140405050506131014040505061344000068004200000000008565000000000000000011120000004940000d0d0d2d2d0000000405050505090909090500000000000000000a00000000000000000000000000000000000000110d0d14070600000000000000000a0505050508002d47
050505050a0000000000000000000405050505080505050505050505050600000000000000000000002400000012000000000042004200420000001404052d2d0000000505050509090909050500000000000000000000000000000000000000000000000000000000130d140000000000000000000000000000000000002d00
05050506858542004200650000000a050508110f120a050909050505050557858585858557000000002462000024000000001100000000000085850405052d2d12000405090505050909090505050600000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000002d57
0505050613850000000000000085000a081124242412050509090505050585242424242485120000002400000024000000005785858585858585040505052d2d140005090905050909050509090905000000000000000a0000110f0d0f12000000110f0d0f1200000000000000000000000000000b0b0b000000000000002d00
05050505068585858585858585851249113a00002424120a05050505050585243a00002485240000008585858585000000242410101010101404050505052d2d00000a05050a0505050505090905050600000000000000110f0d0d0d0d0d0000110d0d0d0d0d0f1200000000000000000000000b0b0b0b0b0000000000002d33
0a210505050613570d0d101024244000240000006200001205050505050885240000002485246e00242424242424242424240004050505050505050505052d2d00000000000000000000050509090505000000000000000d0d0d0d0d0d1400000c0d0d0d0d0d0d0d0f0f12000000000000000405060b0b0b0000000000002d00
0a0505050905062438140000130d0000240000000000002424120a08001185240000002485240000242414001324242424000405050505050505086800122d2d0000110f0d0f120000000a0509090905060000000000110d0d0d0d0d140000000c0d0d0d0d0d0d0d0d0d0d0f120000000004050505060b0b0b00000000002d34
00000005090508240d040507060c246e0085248524856000850e00000013572424242424572485850014040506856e2424000505050505050508110000242d2d110f0d0d0d0d0d1204060005090905050500000000000c0d0d0d1400000000000c0d0d0d0d0d0d0d0d0d0d0d0e000000040509090905060b0b0b000000002d00
0000000a05080024ca050905051385000085858585850000850d120000000057858585570d101014000005050885242424000505050505050811440000242d2d0d0d0d1d0d0d0d140505050509090909050000000000130d14000000000000000c0d0d0d0d10100d0d0d0d1014000000050505090505050b0b0b0b0000002d35
00000000000000240e050509050a858585850d100d858585850d0d120000040505060c0d0e00000000000a08118585855700050505ca05081136000000242d2d0d1d0d0d0d0d14040505050505050909050000000000000000000011120000000c0d0d0d0e0000000000000000000000050505090905080b0b0b0b0000002d00
12000000000057570e05050508000c570d0e000000130d0d57240d0e0004050905050c0d0e000000000000110d0d0d0d0e00040505050885850d858585242d2d0d0d0d1010140405050509050509090505000011120000040506110d0d1200000c0d0d0d0e00000000000000000000000a05090905080b0b0b0b000000002d37
0e000000000057571405050500000c0d0d0e0000000013101024380d120a050909050c0d0e0000000000110d0d370d0d0d12000a37110f856000650000242d2d0d1014000004050909050505050509090506110d0e00040505050c0d0d0d0000130d0d0d0e0000000000000000000000000a050508000b0b0b00000000002d00
0d120000000004050505050500000c0d370e000000000000002424ca0d12050905080c0d0d12000000110d0d0d0d0d5724242412000a13850000000000242d2d1400000000000a05050800050505050508110d0d0e0005090905130d0d140000000c0d0d0d1200000000000000000000000000000000000b0b00000000002d36
0d0d1200000005090909050500000c0d0d0d12000000000000001324240e0a0508110d0d0d0d0f0f0f0d0d100d0d0d243a000024000000008585858585852d2d00000000000000000000000a05050508110d0d0d0e000509090505060000000000130d0d0d0d12000000000000000000000000000000000b0b00000000002d00
0d0d0d1200000a05090505050000130d0d0d0d12000000000000000c24240f1200000000130d0d0d0d14000000130d2400000024123700000013856200002d2d0000000000000000000000000000110f0d0d0d0d0e0005050909050500000000000000130d0d0d0f12000000000000000000000000000b0b0b0b0b0000002d32
0d0d0d0d12000005050505080000000c0d0d0d0e000000000000000c0d24240d120000000000130d1400000000001324000000240e0000000000850000002d2d0000000000000000000000000015100d0d0d0d0d0e00000a05050508000000000000000000130d101407000000000000000000000000000b0b0b000004052d00
0d0d0d0d0e00000a080000000000000c0d0d0d1400000020000000130d0d24240e00000000000000000000000000005724242424240000000000242424242d2d000000000000000000000000000000130d0d0d0d0d1200000a0508000000000000000000040505050505050506000000000000000000000b0b0b040505052d49
0d0d10100e000000000000000000000c0d0d1400000000000000000000130d240d120000000000000000200000000000000024400049000037000c246e242d2d00000000000000000000110f0000000000000c0d0d0d120000000000000000110f0e000005050509090905050500000000000000000000000000050909092d00
0d14040505062100000000000000000c0d140000000000000000000000000c240d0e0000000000000000000000000000000024000000000000000c2424242d2d000405050600000000110d0d0000000000000c0d0d0d0d120000001139380f370d14000405050909050505050800000000000000002000000000050909092d95
0e04050905050506000000000000001314000000000000000000000000001357570e000000000000000000000000040506000c242400000000000c8585852d2d0005090505060000000c0d0d1200000000000c0d0d0d0d0d0f0f0f370d0d0d0d0e000000000a05050509051112000000000000000000000000000a0505092d00
0e05090905050505000000000000000000000000000000000000000000000057570e00000000000000000000000a050505002442000000000000131010372d2d0005050905050000000c0d0d0d00000020000c0d0d0d0d0d0d0d0d0d0dab220dca0000000000000a0505080c0e00000000000000000000000000110e05092d28
0e0a05050505050800000000000000000000000000000000000000000000110d0d140000000000000000000505050509050057000012000000150000000d2d2d0005090909050000000c0d0d0d12000000110d0d0d0d0d0d0d0d360d0d22220d0e000000000000000000000c0d12000000000000000000000000000405052d00
0d0f0f120a000000000000000000000004050600000000000000000000110d0d14000000000000110f0d0f120509050505002457440000240e00000000132d2d0005090909050000000c0d0d0d0d0f0f0f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d37000000000000000000000c0d0d0f1200000000000000000000000a05082d29
0d0d0d0e00000000000000000000040505050500000000000a00110f0f0d0d14000000000000000c0d0d0d0e0509090905001324000000240000000000002d2d0a05050505080000000c0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d34ca0d0d0d0e0000000000000000000013100d0d0d12000000000000000000000000002d00
1010101400000000000000000405050909090500000000000000130d10101400000000000000000c0d0d1014050509050800000c140000000000000000002d2d0000000000000000000c0d0d0d0d0d1014000000000c0d0d0d0d100d0d0d38390e000000000000000000000000130d0d0e000000000000000000000000002d26
0000000000000000000000000509090905050506000000070000000000000000000000000000000c0d1400040505050800000000000000000000000000002d2d0000000000000000000c0d0d0d0d14000000000000130d0d0d14000000130d0d0e00000000000000000000000406130d0e000000000000000000000000002d00
0000000000000000000000000a05090905080b0b000000050000000000000000000000000000110d140000000a050800000000000a0000040506000000002d2d000000000000000000130d0d0d1400000000000000000c0d140000000000130d14000000000000110e040505050506130d0f1200000000000000000000002d39
000000000000000000000000000a0505080b0b0b000000050600000000000000000000110d0d0d0e000000000000000000000000000405050505050506002d2d00110f0e0000000000001310140000000000000000001314000000000000000004050a0000000000000509050505050506130d0e000000000000000000002d00
0000000000000000000000000000000b0b0b0000000000000000000000000000000000130d0d0d14000004050505060000000000000005090905050505062d2d00000000000000000000000000000000000000000000000000000000000005050505050600000000040509090509090905000000000000000000000000002d38
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000005050505000000000a00000a050909090909052d2d0000000000000000000000000000000000000000000000000004050507000a050505080b0b000000050505050505050508000004050505060000000000002d00
0000000000000000040505060000000000000000000000000000000000000000000000000000000000040505050508110f0e0000000000050505050905082d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d48
000000000004050505090505060000000000000000000000000000000000000000000000000000000000110f0f0f0f0d14000000000000050505090905002d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0000
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