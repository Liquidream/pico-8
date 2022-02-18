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
local g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,hq,_u,_v,_w,_x={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,0,{},_e*8-128
local _y,_z=hq,{0,0}
local _0={}
g_._4=function(self)
if self._b2._5==1 then
_1,_2,_3=1,{}
_f8(6,"⬆️",function()
_6=mid(1,_6-1,#_bp._eh)
_3=_bp._eh[_6]
if(_6<_1) _1-=1
end, 10)
_f8(17,"⬇️",function()
_6=mid(1,_6+1,#_bp._eh)
_3=_bp._eh[_6]
if(_6>_1+2) _1=min(_1+1,#_bp._eh-2)
end, 10)
_f8(32,"build",function()
_7=nil
_dy:_b5()
end)
_f8(96,"close",function()
_7=nil
end)
_7=self
end
end
g_._ac=function(self)
local _aa=self._aa
pal({nil,nil,nil,nil,nil,nil,nil,_aa,nil,_aa,_aa,self.col1,nil,_aa})
if self._ag then
pal(self._cf[self._ad], self.col1)
else
pal(11,self.col1)
self._ad=1
end
end
local _ab=function(self)
pal(7,8)
if(self.id==80 and _bp._ae==2 and not _bp._af) pal(7,11)
end
function _8(self, _9)
self._cz,self.last_process,self._ae=0,self._ae,_9
if(self.last_process>0) self._af=not self._af
if(_9==1) self._b2._ag=true self._b2._ah=self
end
local _ai=[[id|_bu|_au|my|ico_spr|type|w|h|z|trans_col|_bn|_bo|_5|col1|_aa|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_fr|power|_e1|_b8|_f6|range|_cl|fire_rate|fire_sfx|death_sfx|norotate|altframe|_cv|_co|_ae|spent|_c0|_cq|_cr|_ad|col_cycle_src|storage|capacity|is_repairable|ai_build|moves|tracked|onfoot|is_building|is_unit|is_dockable|capturable|can_capture|can_smoke|soldiers_on_destroy|shad_w|shad_h|_cf|_by|description|_b4|_b5
1|64|64||170|2|2|2|0||nil|||||||2|2|nil|1|||100|0|nil|1600|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|1||1|1||||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_4
2|22|22||162|2|2|2|0||1|||||7|5|2|2|1|4|||20|0|nil|0|0||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|nil||nil|1|nil|nil|nil||1|nil||||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22||162|2|1|1|0||1|||||6|6|2|2|1|1|||5|0|nil|0|0||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|nil||nil|1|nil|nil|nil||1|nil||||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|133|133||164|2|1|1|0||1|||||||2|2|7|4|||50|0|nil|200|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|nil||nil|1|nil|nil|nil||nil|nil||||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
5|66|66||172|2|2|2|0||1|||||||2|2|1|1|||300|-100|nil|800|0|||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|nil||nil|1|nil|nil|1||1|1|||12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
6|68|68||174|2|3|2|0||1|||||||2|2|5|1|||400|30|nil|1800|0|||||53|nil||8|0|0|0|0|0|1|1|11|1000|nil|1|nil|nil||nil|1|nil|1|1||1|1|||11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ac|
7|106|106||136|2|2|2|0||1|||||||2|2|5|2|||400|30|nil|2000|0|||||53|nil||4|0|0|0|0|0|1|1|11|0|nil|1|nil|nil||nil|1|nil|nil|nil||1|1|||8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
8|104|104||134|2|2|2|0||1|||||||2|2|6|2|||150|5|nil|600|0|||||53|nil|||0|0|0|0|0|1|1||1000|nil|1|nil|nil||nil|1|nil|nil|1||1|1||||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
9|108|108||168|2|2|2|0||1|||||11|3|2|2|7|2|-3||300|10|nil|1200|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|nil||1|1||||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_4
10|110|110||138|2|2|2|0||1|||||||2|2|7|2|-1||400|10|nil|1600|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|nil||1|1||||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_4
11|96|96||140|2|2|2|0||1|||||||2|2|6|2|||400|20|nil|1400|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|1||1|1||||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_4
12|98|98||142|2|3|2|0||1|||||||2|2|11|3|||600|20|nil|800|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|1||1|1||||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_4
13|101|101||166|2|3|2|0||1|||||||2|2|12|5|||500|35|nil|1600|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|1||1|1||||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_4
14|128|128||230|2|3|2|0||1|||||||2|2|12|5|||700|20|nil|800|0|||||53|nil||2|0|0|0|0|0|1|1|8|0|nil|1|nil|nil||nil|1|nil|1|1||1|1|||0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
15|71|71|0|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|80|800|0|5|1|27|58|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|1|nil|1||1|1|6|6||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
16|87|87|2|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|240|800|0|10|2|40|59|53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|1|nil|1||1|1|6|6||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
17|61|61||228|2|3|3|0||1|||||11|3|2|2|11|6||1|500|50|nil|2000|0|||||53|nil||8|0|0|0|0|0|1|1|11|0|nil|1|nil|nil||nil|1|nil|nil|1||1|1|||11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|_ac|_4
18|131|131||224|2|2|2|0||1|||||||2|2|12|7|||500|40|nil|1600|0|||||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|nil||1|1||||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
19|58|58||226|2|3|3|0||1|||||||2|2|17|8||1|999|80|nil|4000|0|||2,400||53|nil|||0|0|0|0|0|1|1||0|nil|1|nil|nil||nil|1|nil|nil|nil||1|1||||pALACE|tHIS IS YOUR pALACE.||
20|49|49||236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||24|80|0.05333333333|3|1|15|60|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1|nil|nil||||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
21|48|48||236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.03333333333|3|1|15|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1|nil|nil||||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
22|49|111||194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.06666666667|7|2|17|59|57|1|48|16|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1|nil|nil||||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
23|48|127||194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|7|2|17|59|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1|nil|nil||||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|253||236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|440|0.1|4|1|17|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil|nil|nil||||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48||236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||1600|40|0.2666666667|1|1|800|60|57|1|49|16|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil|nil|nil||||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48||236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||64|440|0.1|2|2|17|59|57|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil|nil|nil||||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
27|51|51|4|204|1|1|1|1|11|11|17||||15|4|2|2||2|1||150||32|400|0.3|4|1|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil|1|nil|6|6||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
28|52|52|6|206|1|1|1|1|11|11|17||||||2|2||3|||200||56|520|0.2666666667|4|1|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil|1|nil|6|6||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
29|53|53|8|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||100|800|0.1666666667|5|1|27|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|7|6||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
30|55|55|10|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||240|1200|0.1333333333|6|1|30|58|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|8|7||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
31|54|54|12|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||600|400|0.2|10|2|40|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|7|6||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
32|50|50|14|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||nil|600|0.1333333333|0||0||54|nil|||0|0|0|0|0|1|1||0|0|1|1|1|1|nil|nil|1|nil||nil|1|nil|8|7||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
33|73|73|16|238|1|1|1|8|11|13|17||||11|3|2|2|13|5|||800||nil|400|1.333333333|0||0||54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|1|nil||nil|1|nil|8|7||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
34|20|40|20|160|1|1|1|4|11|13|||||||2|2|18|7|-3||600||128|4|1|7|2|33|59|54|nil|22|8|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|nil|nil|1|nil||nil|nil|nil|6|6||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
35|38|38|24|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||nil|600|0.1333333333|0||0||54|nil|||0|0|0|0|0|1|1||0|nil|1|nil|1|nil|nil|nil|1|nil||nil|1|nil|8|7||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
36|57|57|26|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||240|440|0.2|9|3|27|52|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|7|6||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
37|56|56|28|200|1|1|1|1|11|12|||8|12|||2|2|18|8|3||800||320|1600|0.06666666667|8|1|33|61|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|8|7||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
38|72|72|30||1|1|1|8|11|||0|||||2|2|13|8|3||0||1600|40|0.6666666667|0|20|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|0|1|nil|nil|nil|1|nil||nil|nil|nil|6|6||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
38.5|72|72|30||1|1|1|8|11|||0|||||2|2|13|8|4||0||1600|40|0.6666666667|0|20|800|59|54|nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|1|nil||nil|nil|nil|6|6||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
39|51|205|4|204|1|1|1|1|11|11|||||11|1|2|2||2|2||150||40|320|0.4|4|1|17|60|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil|1|nil|6|6||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
40|54|202|12|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||nil|480|0.2|9|1.9|60|59|54|nil|||0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil|1|nil|7|6||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
41|88|88|||9|1|1|1|11||||||||2|2||3|||0||300|4000|0.35|0|30|7|50||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|nil|nil||nil|nil|nil||||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
42|32|32|||1|1|1|1|11|||2|||||1|1|||||||nil|4|0.1|||||53|1|||0|0|0|0|0|1|1||0|nil|nil|nil|nil|nil|nil|nil|nil|nil||nil|nil|nil||||sPICE bLOOM|||
80|3|3||3|3|1|1|0|11||||||||1|1|||||||nil|0|0||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|nil|||nil|nil|nil||nil|nil|nil||||rEPAIR||_ab|action_click
81|1|1||1|3|1|1|0|11||||||||1|1|||||||nil|0|0||||||nil|||0|0|0|0|0|1|1||0|nil|nil|nil|nil|||nil|nil|nil||nil|nil|nil||||lAUNCH||_ab|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _aj=_gq(_ai,"|","\n")
_ai={}
for i=2,46 do
local _ak={}
for j=1,65 do
local _al=_aj[i][j]
if(j<61) _al=tonum(_al)
if j==63 then
_am,_al=_gq(_al,"~"),"" for line in all(_am) do
_al..=line.."\n" end
end
_ak[_aj[1][j]]=_al
end
_ai[_aj[i][1]]=_ak
end
for i=-3,66 do
_w[i]={}
for l=-3,66 do
_w[i][l]=0
end
end
cursor={
w=8,h=8,_an=function(self)
return {
x=self.x+(_ds and 0 or _as),y=self.y+(_ds and 0 or _at),w=0,h=0
}
end,_ao=function(self)
local _ap=(_bp and _bp.is_unit and _bp._5==1 or _du) and 3 or 0
spr(_ap/3, self.x-_ap, self.y-_ap)
end
}
for my=0,31 do
for mx=0,125 do
local _aq,_ar=mget(mx,my)
if(_aq==1) _as,_at,_ar=_f[1][4]-56,_f[1][5]-56,_ai[1]
for o in all(_ai) do
if(o._au==_aq) _ar=o break
end
if _ar and (_aq==1 or _aq>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_fa(mx,my+1))
_be(_ar, ox*8, oy*8)
end
end
end
_av=cocreate(function()
while true do
if t_%30==0 then
_go(false)
_k={}
for _cu in all(_j) do
_k[_cu:_c2()]=_cu
end
local _aw={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ax=_fa(i,l)*8
if(_w[i][l]==16) _aw[(i/2).."," ..(l/2)]=_ax>0 and sget(_ax%128+3, _ax\128*8+3) or 15
end
yield()
end
end
_ay,_az,_a0,_o=0,0,{0,0},{{},{}}
for building in all(_i) do
if building.id!=4 then
if building._5==1 or (hq and _gl(building)) then
_aw[(building.x\16).."," ..building.y\16]=building.col1
end
if building._5==1 then
_ay-=building.power
_az+=building.storage
end
_a0[building._5]+=1
_gs(_o[building._bq], building.id, building)
_k[building:_c2()]=building
end
end
for _cu in all(_j) do
if hq and (_cu._5==1 or _gl(_cu) and _cu.z==1) then
_aw[(_cu.x\16).."," .._cu.y\16]=_cu.col1
end
if(_cu._bq>0) _gs(_o[_cu._bq], _cu.id, _cu)
end
hq,_l=_o[1][7] and _ay>0,_aw
local _a1,_a2=0
for yy=0,31 do
for xx=0,31 do
local _al=_l[xx.."," ..yy] or 0
if xx%2==0 then
_a2=_al
else
_a2|=_al<<4 poke(0x4300+_a1,_a2) _a2=0 _a1+=1
end
end
if(yy%2==0) yield()
end
if(_g[3]>0 and _g[1]>=_g[3]) _a3=1
if(_a0[2]==0 and _a>1) _a3=2
if(_a0[1]==0) _a3=3
if _a3 then
local _a4=40
for data in all{_a3,t()-_p,_z[1],_z[2],_r[1],_r[2],_q[1],_q[2]} do
dset(_a4, data)
_a4+=1
end
?"\^jae\+8h\#0\^w\^t         \^-w\^-t\^d2\^jaf\-cmission " ..(_a3<3 and"complete" or"failed"),_c
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _a5=0
_a6,_a7,_a8,_a9,_ba={{rnd"500",rnd"500" }},rnd"1",0,_gq"15,9,4",0
end
function _bb(_bc,_bd)
local _bg=_bc.req_faction
return not _bg
or _bg==_bd
or (_bg<0 and _bg!=-_bd)
end
function _be(_ar, x,y, _5, _bf)
local _bh=_bz(_ar, x,y, _ar.type, nil, g_[_ar._b3], g_[_ar._b4], nil)
_bh.ico_obj,_bh._co,_bi,_bh._5=_bz(_ar, 107,0, 4, _bh, nil, nil, g_[_ar._b5]), _bi and _ar._b8/2 or _ar._b8, false, _bh._5 or _5
if _bf then
_bh._bj=_bf._bj
else
if _bh._5 then
_bh._bj,_h=1,_f[1]
else
local _bk=9999
for i=1,#_f do
local _bl=_gw(x,y,_f[i][4],_f[i][5])
if(_bl<_bk) _bh._bj,_bh._5,_bk=i,min(i,2),_bl
end
end
end
_bh._bq,_bh.build_objs,_h=_5 or _bh._5,{},_f[_bh._bj or _bf._bj]
_bm=_h[1]
_bh._e2,_bh.col1,_bh._aa=_bm,_h[2],_h[3]
if(not _bb(_bh,_bm)) return
for o in all(_ai) do
if o._bn
and (o._bn==_bh.id or o._bo==_bh.id)
and _bb(o,_bm)
then
add(_bh.build_objs,_bz(o, 107,0, 5, _bh, nil, nil, function(self)
if _7 then
_bp=self
else
if self.is_building and #_i<150 or self.is_unit and #_j<85 then
_8(self, 1)
elseif _bh._bq==1 then
_ga"uNABLE TO CREATE MORE" end
end
end)
)
end
end
if _ar.col1 then
_bh.col1,_bh._aa=_ar.col1,_ar._aa
end
if(_bh.z>1) _bh._5=0
local _br,_bs=x\8,y\8
if _ar.is_building and not _ar.is_unit then
local _bt=_ar._bu==22
for xx=0,_ar.w-1 do
for yy=0,_ar.h-1 do
local _al=_fa(_br+xx, _bs+yy)
if not _bt or (_al>=12 and _al<=21) then
_fb(_br+xx, _bs+yy, _bt and 22 or _bh._5==1 and 81 or 103)
end
end
end
if(not _bt) add(_i,_bh)
if _bh.id==6 and not _bh._b2 then
_d0(_bh)
end
else
_bh.r=_bh.norotate!=1 and (_br%8)*.125
if _bh._e1 then
_bh._bv=function(self)
self._cs,self._cx,self.bullet_y,self.bullet_tx,self._bw=4,self.x+4,self.y+4,self._cw.x+self._cw.w/2,self._cw.y+self._cw.h/2
local dx,dy=self.bullet_tx-self._cx,self._bw-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bx=dx/d,dy/d
_gm(self.fire_sfx)
_c9(self)
end
if _bh.moves then
_bh._by=_gq"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_bh._e2].." " .._bh._by
else
_fb(_br,_bs,_bh._5==1 and 2 or 133)
end
end
if(_bf and _bf.id==6) _bh._b9=_bf
add(_j,_bh)
_en(_bh, nil, true)
end
_c9(_bh)
return _bh
end
function _bz(_b0, x,y, _b1, _b2, _b3, _b4, _b5)
local _b6={
_b7=_b0,id=_b0.id,_b8=_b0._b8,x=x,y=y,z=_b0.z,
_ca=x/8,_cb=y/8,type=_b1,_b2=_b2,_b5=_b5,w=_b0.w*8,
h=_b0.h*8,_cc=_b0._bu,_cd=_b0.w,
_ce=_b0.h,
_cf=_gq(_b0._cf),_an=function(self)
return {
x=self.x,y=self.y-self.z,w=_b1>3 and 16 or self.w,h=_b1>3 and 16 or self.h
}
end,_ao=function(self)
local x,y,_cg=self.x\1,self.y\1,self.r
if _b1>2
or (x+self.w>=_as
and x<=_as+127
and y+self.h>=_at
and y<_at+127+self.z)
then
pal()
palt(0,false)
if _cg then
ovalfill(x+3, y+3, x+self.shad_w, y+self.shad_h, 1)
end
if(self.trans_col and _b1<=3) palt(self.trans_col,true)
if(self._e2 and self.id!=18) pal(12,self.col1) pal(14,self._aa)
if _b1>3 then
local _ch=_b1==5 and self or self._b2
rectfill(x-1,y-1,x+16,y+19,0)
local hp=_ch._b8
local _al=self._ae==1 and _ch._co/6.666 or 15*(_ch._co/hp)
if(_ch._co>0 and not _7) rectfill(x,y+17,x+_al,y+18, self._ae==1 and 12 or (split"8,10,11,11")[_ch._co\(hp/3)+1])
pal(11,_ch.icol1) pal(3,_ch.icol2)
end
if self._cf then
pal(self.col_cycle_src, self._cf[self._ad])
end
if(flr(self._cr)%2==0) pal(_gq"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")
if(_b4) _b4(self)
if _cg then
if not self.death_time or self.death_time>.025 then
local cs,ss,_ci,_cj,cx,cy,dx,dy=cos(_cg),sin(_cg),126.7,self.my-0.3,127.5,self.my+.5,x+3.5,y-self.z+3.5
_cj -=cy
_ci -=cx
local sx,sy,_ck=cs*_ci+cx,-ss*_ci+cy,-_ci*8
for py=dy-_ck, dy+_ck do
tline(dx-_ck,py,dx+_ck,py,sx+ss*_cj,sy+cs*_cj,cs/8,-ss/8)
_cj+=.125
end
end
else
if _b1>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
if _b1==5 then
if _b0.is_building then
fillp"0XAFAF" rectfill(x+15,y+15,x+15-(self._cd*2),y+15-(self._ce*2),245)
fillp()
end
if self._af and not _7 then
?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666" 
end
end
else
spr(self._bu, x, y, self._cd, self._ce)
end
end
end
if _b1<=2 then
if self._cx then
if self._cl==1 then
pset(self._cx,self.bullet_y, rnd{8,9})
else
local _cm=self._cl<=2
_g2(
self._cx, self.bullet_y,_cm and 1.9 or 0,0, 0, _cm and -.3 or 1,0,_cm and 10 or 2.5,_cm and _gq"7,10,9,8,2" or {15},rnd{0xa5a5.8,0})
end
end
if((self._bu==72 or self._co<self._b8/3 and self.can_smoke) and _gx"10") _g2(x+3.5,y+3.5-self.z, 1, .1,-.02,.05, -.002, 80,_gq"10,8,9,6", rnd{0xa5a5.8,0})
self._cq=0
end
end,_cn=function(self)
local _co,id,_cp=self._co,self.id,self._cp
self._cr=max(self._cr-.4,1)
if self._cq>0 and self._bq>0 and id!=42 then
_0[self._e2]=true
_go(true)
if(stat"54" >5) music"0"
if(self.is_repairable and self.moves and _co<99 and self._cs<=6) _gi(self,_gv(self._bq,14) or self._b9)
if(self._bu<=49 and _co<100) self._cd,self._ce=0.5,0.5
if(self._e1 and self._cs==0) _ey(self, _cp)
end
if(_b1<=2 and _co<=0 and not self.death_time) self._cs,self.death_time,self._ct=5,.25 _gm(self.death_sfx) _a5+=(_b1==2 or self.id==38) and .25 or 0
if self.death_time then
self.death_time-=.025
if self.death_time<=0 then
if _b1==2 then
for xx=0,self._cd-1 do
for yy=0,self._ce-1 do
_fb(self.x/8+xx, self.y/8+yy, 21)
if(self.soldiers_on_destroy) _be(_ai[rnd{20,22}],self.x+xx*8,self.y+yy*8,self._5,self)
end
end
del(_i,self)
_q[_cp._bq]+=1
else
local gx,gy=self:_c3()
if(_fa(gx,gy)==0) _fb(gx,gy,33)
if(id<=16) _fb(gx,gy,21)
if(self._b9) self._b9._ag=false
if(self._er and self._er.id==14) self._er._cf={0}
_dz(self)
if id==42 then
_e6(self,gx,gy,function (_cu,x,y)
if(_fa(x,y)==0) _fb(x,y,10)
end,4, true)
end
if(_cp) _r[_cp._bq]+=1
end
self:_c4()
else
if(_gx(_b1==2 and 1 or 4) and not self.onfoot) _c7(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self._cv then
if t_%self._cv==0 then
if self.altframe
and self._cs==2 then
self._bu=self._cc+(self.altframe-self._bu)
self.my=self._bu
end
self._ad=(self._ad%#self._cf)+1
end
end
if self._cx then
self._cx+=self.bullet_dx*2
self.bullet_y+=self._bx*2
if _gw(
self._cx,self.bullet_y,self.bullet_tx,self._bw) < 2
then
_c7(self._cx, self.bullet_y, self._cl)
local _cw=self._cw
if _gw(
self._cx,self.bullet_y,_cw.x+_cw.w/2,_cw.y+_cw.h/2) < 4
then
_cw._co-=self._e1*rnd"1" _cw._cq,_cw._cp=self._cl,self
if id==40 and _cw.moves and _gx"5" then
_e3(_cw, self)
_en(self)
elseif _cw.old_fact_data then
_cw._e2,_cw._5,_cw._bq,_cw.col1,_cw._aa,_cw.old_fact_data
=
unpack(_cw.old_fact_data)
_en(_cw)
end
end
self._cx=nil
end
end
if self._ae>0
and not self._af
and not self._cy then
if self._ae==1 and self.spent>self._fr then
self._cy=true
if(self._b2._5==1) _gm"56" _ga"cONSTRUCTION cOMPLETE"
if _b0.is_unit
and self._bn !=1 then
local ux,uy=_ew(self._b2)
_be(_b0,ux,uy,self._b2._5,self._b2)
_gd(self)
end
elseif self._ae==2 and _co>self._b8 then
self._ae=0
if self.is_unit and self.moves then
self._er._cf,self._cs={0},0
self:_c1(_ew(self))
end
else
if self._cz>3 then
if(_c5(-1,self._ae==1 and self._b2 or self)) self._cz=0 self.spent+=1
else
self._cz+=1
self._co=(self._ae==1 and (self.spent/self._fr)*100 or _co+1)
end
end
end
self._c0=max(self._c0-.1)
if self._5==1 then
if(id==5) self._by="wINDTRAP (∧" .._ay..")"
if(self.storage>0) self._by=_b0._by.." (" ..flr(_dl/_az*100).."%)" end
end,_c1=function(self,x,y)
self.x,self.y=x,y
end,_c2=function(self)
local x,y=self:_c3()
return x.."," ..y
end,_c3=function(self)
return (self.x+4)\8,(self.y+4)\8
end,_c4=function(self)
if(_bp==self) _bp=nil
end
}
for k,v in pairs(_b0) do
if not _b6[k] and v!="" then
_b6[k]=v
end
end
return _b6
end
function _c5(_c6, _b6)
if(_g[_b6._5]+_c6<0) return false
_g[_b6._5]+=_c6
if _b6._5==1 then _gm"63" end
return true
end
function _c7(x,y,_c8)
_g2(x, y, 2,0, 0, .1, -.01, _c8==1 and 5 or 20, _c8==1.9 and _gq"3,11,3" or _gq"5,7,5,7,10,8,9,2", _gx"2" and 0xa5a5.8)
end
function _c9(_da)
if(_da._5!=1 and _da._cs!=4) return
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
cx,cy=(_as+_dh)\8,(_at+_di)\8
if not _7 then
if(_dh<2) _as-=2
if(_dh>125) _as+=2
if(_di<2) _at-=2
if(_di>125) _at+=2
_as,_at,_dl=mid(_as,_x),mid(-10,_at,_x),tostr(_g[1])
if t_%6<1 and _ba==0 then
if(_gx"18") _a8=rnd".04" -.02
_dm,_dn=_a6[#_a6][1],_a6[#_a6][2]
add(_a6,{_dm+sin(_a7),_dn-cos(_a7)})
_a7+=_a8
local _cu=_f7(_dm\8,_dn\8)
if _cu and fget(_fa(_cu:_c3()),2) then
_dz(_cu)
_ba=1
_gm"50" end
end
if(#_a6>30) del(_a6,_a6[1])
if(_ba>0) _ba+=1 _ex(_dm,_dn,rnd"1")
_ba%=200
for _cu in all(_j) do
if(_cu._ct) then
if(not coresume(_cu._ct, _cu)) _cu._ct=nil
end
end
for p in all(_n) do
p.dy +=p._g3
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._co +=1
if(p._co>=p._g7) del(_n,p)
end
if t()%_b==0 then
local _do=rnd(_j)
if _do._5==2 and _0[_do._e2] and _do._e1 and _do._cs==0 then
_gk(_do)
end
local _dp=rnd(_i)
if _dp._5==2
and (not _dp._ah or _dp._ah._ae!=1)
then
local u=rnd(_dp.build_objs)
if u and u.ai_build then
u:_b5()
end
if _dp._co<_dp._b8 and _dp._ae!=2 then
_8(_dp, 2)
end
end
local _dq=_gv(2,19)
if _dq
and _0[_dq._e2]
and _dq._c0<=0
then
_gk(_dq)
end
end
coresume(_av)
end
_dr=false
if _bp then
_ds=true
_ge(_ef)
_ge(_eg)
if(_bp.ico_obj and not _7 and not _dr) _ge(_bp.ico_obj) _ge(_bp._ah)
if(_7) foreach(_bp.build_objs, _ge) foreach(_2, _ge)
_ds=false
end
if not _7
and not _dr then
foreach(_j, _ge)
foreach(_i, _ge)
end
if(stat"34" >0 or left_button_clicked or right_button_clicked)
and not _7
and _dh>91 and _dh<123
and _di>91 and _di<123 then
_bp=_dx
if(stat"34" ==1 or left_button_clicked) and _dv((_dh-91)*2, (_di-91)*2) then
else
_as,_at=mid((_dh-96)*16, _x),mid(-10,(_di-97)*16, _x)
end
elseif left_button_clicked then
if _dr then
if(_bp) _v=0
if not _7 and _bp._b2 then
if(_bp._b5) _bp:_b5()
_bp=_dx
goto skip_collisions
end
if(_7 and _3._f9 and _3._b5) _3:_b5()
if(_bp._5==1 and _bp.is_unit and _bp!=_dx and _bp.moves) _gm"62"
if(_bp._bq!=1 and _dx and (_dx.is_unit or (_dx.id==19 and _du)) and _dx._5==1) _bp._cr=10 _ey(_dx, _bp, true) _bp=nil
else
_dv(cx,cy)
local _dt=_bp and _bp._ah
if _dt
and _dt._co>=100
and _eb then
_be(_dt._b7,cx*8,cy*8,1)
_gd(_dt)
_gm"61" end
end
_du=false
elseif right_button_clicked and not _7 then
_du,_bp=false
end
::skip_collisions::
_dw,_dx,_dy=_dg,_bp,_3
t_+=1
end
function _dv(x,y)
if _bp
and _bp._5==1
and _bp.moves
and _bp._cs!=7
then
_bp._ct=cocreate(function(_cu)
_fe(_cu, x, y)
_en(_cu, nil, true)
end)
return true
end
return false
end
function _dz(_cu)
del(_j,_cu)
if _cu.id==32 and #_o[_cu._bq][32]<=1 then
_d2=_gv(_cu._bq,6)
if(_d2) _d0(_d2)
end
end
function _d0(_d1)
local _d3=_be(_ai[32],_d1.x,_d1.y,_d1._5,_d1)
_d3._cs=9
end
function _draw()
cls"15"
camera(_as+(16-rnd"32")*_a5, _at+(16-rnd"32")*_a5)
_a5=_a5>0.05 and _a5*0.95 or 0
for i=1,#_a6 do
if(i!=#_a6 and i%2==1) fillp(0xa5a5.8)
circfill(
_a6[i][1]+4,_a6[i][2]+4,4,_a9[(i-#_a6)%3+1])
fillp()
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
if(_ba>0) spr(88+_ba\100, _dm, _dn)
for building in all(_i) do
if not _7
then
if(t_%3==0) building:_cn()
if(building._ah) building._ah:_cn()
end
building:_ao()
if(building==_bp) rect(_bp.x, _bp.y, _bp.x+_bp.w-1, _bp.y+_bp.h-1, 7)
end
pal()
for p=1,2 do
for _cu in all(_j) do
if(p==1 and _cu.z==1) or (p==2 and _cu.z>1) then
if(not _7) _cu:_cn()
if(_cu._ae!=2 or not _cu.moves) _cu:_ao()
if(_cu==_bp) ?"\f7\^:42c300000000c342",_bp.x, _bp.y-_bp.z
end
end
end
pal()
for p in all(_n) do
if(p._g5) fillp(p._g5)
circfill(p.x,p.y,p.r,p._g4[ flr((#p._g4/p._g7)*p._co)+1 ])
fillp()
end
local _d4,_d5=_as\8,_at\8
palt(0,false)
palt(11,true)
for xx=_d4-1,_d4+16 do
for yy=_d5-1,_d5+16 do
local gx,gy,_d6=xx*8,yy*8,_w[xx][yy]
if _d6!=0 and _d6!=16 then
spr(_d6+31,gx,gy)
elseif _d6<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
local _dt=_bp and _bp._ah
if _dt
and (_dt.type==5
and not _dt.moves)
and _dt._co>=100 then
local _d7,_d8=(_dh+_as)\8, (_di+_at)\8
local _d9,_ea,w,h=_d7*8-_as,_d8*8-_at,_dt._cd,_dt._ce
_eb,_ec,_bi=false,false,false
for xx=-1,w do
for yy=-1,h do
local _al=_fa(_d7+xx, _d8+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_al,4)) _eb=true
else
if(_al>=12 and _al<=21) _bi=true
if(_f7(_d7+xx,_d8+yy) or _al==0 or _al<=11 or _al>=23) _ec=true
end
end
end
if(_ec and _dt._b7._bu!=22) _eb=false
fillp"0b1110110110110111.1" rectfill(_d9, _ea,_d9+_dt.w, _ea+_dt.h, _eb and 11 or 8)
fillp()
end
rectfill(0,0,127,8,9)
line(0,9,127,9,4)
_v-=1
?(_v>0 and _gc or _bp and _bp._by or""),2,2,0
?sub("00000", #_dl).._dl, 103,2, _d
if hq!=_y then
_u=1
if _y then _ga"pOWER LOW. bUILD wINDTRAP" end
_gm"55" end
_y=hq
local _ed=5934
for _ee=17152,17648,16 do
memcpy(0x6000+_ed, _ee, 16)
_ed+=64
end
rect(91,91,123,123,_d)
local cx,cy=ceil(92+_as/16),ceil(92+_at/16)
rect(cx,cy, cx+7,cy+7, 7)
if _u>0 and _u<77 then
for i=1,300 do
pset(92+rnd"31",92+rnd"31",5+rnd"3")
end
_u+=1
end
if _bp and _bp.ico_spr then
_bp.ico_obj:_c1(107,20)
_bp.ico_obj:_ao()
_ef,_eg=nil
if _bp._5==1 then
if _dt then
_dt:_c1(107,44)
_dt:_ao()
end
if _bp._co<_bp._b8
and _bp.is_repairable
and _bp.is_building then
_ef=_bz(_ai[80], 115,28, 3, {}, nil, _ab, function()
_8(_dx, 2)
end)
_ef:_ao()
end
if(_bp.id==19
and _bp._c0<=0)
or _bp.id==35
then
_eg=_bz(_ai[81], 107,29, 3, {}, nil, _ab, function()
if _dx.id!=35 then
_ga"pICK tARGET" _du=true
else
local mx,my=_dx:_c3()
local _al=_fa(mx,my)
if _al>=12 and _al<=22 then
_dx._co,_dx=0
_be(_ai[1],mx*8,my*8,1)
_gm"61" end
end
end)
_eg:_ao()
end
end
end
pal()
if _7 then
fillp(▒)
rectfill(unpack(split"0,0,127,127,0"))
fillp()
rectfill(3,22,124,96,_d)
rect(3,22,124,96,_c)
if _bp.build_objs then
_bp._eh={}
rectfill(unpack(split"6,25,27,93,0"))
local _ei=1
for i=1,#_bp.build_objs do
local _ej=_bp.build_objs[i]
if(not _ej.req_id
or _o[_bp._bq][_ej.req_id])
and _ej.req_level<=_a
and _bb(_ej,dget"6")
then
_bp._eh[_ei]=_ej
if _ei>=_1 and _ei<=_1+2 then
_ej:_c1(9,28+(_ei-_1)*20)
_ej:_ao()
else
_ej.x=-16
end
_3=_3 or _bp._eh[1]
if _3==_ej then
_6=_ei
rect(_ej.x-2, _ej.y-2,_ej.x+17, _ej.y+17,7)
?"\^j87\-f\|e\^h\f7" .._3._by.."\^jl8\-h\|h\f9cOST:" .._3._fr.."\n\|h\f6" .._3.description
end
_ei+=1
end
end
end
foreach(_2, function(c) c:_ao() end)
end
palt(11,true)
cursor:_ao()
end
function _ek(x,y)
if x>=0 and x<=66 and y>=0 and y<=66
and _w[x][y]!=0 then
local _el=0
if(_w[x][y-1]>0) _el+=1
if(_w[x-1][y]>0) _el+=2
if(_w[x+1][y]>0) _el+=4
if(_w[x][y+1]>0) _el+=8
_w[x][y]=1 + _el
end
end
function _em(x,y)
return fget(_fa(x,y),7)
end
function _en(_cu, _eo, _ep)
_cu._cs,_cu._es,_cu._eq=_eo or 0,true
if(_ep) _cu.gx,_cu.gy=_cu.x,_cu.y
_cu._ct=cocreate(function(self)
while true do
if self.z>1 then
_fe(self,mid(flr(self._ca+rnd"32")-16,64),mid(flr(self._cb+rnd"32")-16,64))
end
if self.id==34 then
_gk(self)
elseif _gx"250" and self._e1 and self._cs!=8 then
local gx,gy=self:_c3()
_e6(self,gx,gy,function (_cu,x,y)
local _cw=_f7(x,y)
if _cw and _cw._bq!=_cu._bq and _w[x][y]==16 and (_cw.id!=34 or _cu.id==16) then
_ey(_cu,_cw)
return true
end
end,max(4,self.range))
end
local _b9=self._er or self._b9
if self.id==32 then
self._by="hARVESTER (" ..(self.capacity\15).."%)"
if self._cs==0 or self._cs==9 then
if self.capacity<1500
and self._cs!=7 and self._cs!=9 then
self._er=nil
local sx,sy
local tx,ty=self:_c3()
if _em(tx,ty) and not self._et then
sx,sy=tx,ty
else
_e6(self,tx,ty,function(_cu,x,y)
if _em(x,y) and _gx"10" then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cu._es=_fe(_cu,sx,sy,nil,not _cu._es)
if not _cu._es and not _gv(_cu._bq,33) then
self:_c1(_ew(self))
end
if(_em(_cu:_c3())) _cu._cs=6
end
elseif self.capacity >=1500
and self._cs<7 then
self.sx,self.sy=self:_c3()
_gi(self,_b9 or _gv(_cu._bq,6))
end
elseif self._cs==6 then
self._et=false
_ex(_cu.x, _cu.y, _cu.r+.75+rnd".2" -.1)
local _eu=_cu:_c2()
self.capacity+=.5
_m[_eu]=(_m[_eu] or 1000)-1
if _m[_eu] <=0 then
local _br,_bs=self:_c3()
for yy=-1,1 do
for xx=-1,1 do
_al=_fa(_br+xx,_bs+yy)
_fb(_br+xx,_bs+yy,(xx==0 and yy==0) and 0 or ((_al>1 and _al<10) and 10 or _al)
)
end
end
self._cs=0
end
if(self.capacity%300==0) self._et=true self._cs=0
end
end
if self.id>26 then
if self._cs==9 then
if _b9._co>0 and not _b9._ev and self._co>0 then
_b9._ag,self._cs,self.r=false,8,.25
self:_c1(_b9.x+16,_b9.y+4)
self:_c4()
if self.capacity and _b9.id==6 then
_b9._ev=self
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
_z[self._5]+=.5
if tonum(_dl)<_az then
_c5(2,self)
elseif self._5==1 then
_ga"sPICE LOST. bUILD sILOS" end
end
yield()
end
self.capacity,self._cs,_b9._ev=0,0
if self.sx then
_fe(self, self.sx, self.sy, 0, true)
else
self:_c1(_ew(self))
end
else
self._ae,self._cz,_b9.col_cycle_src,_b9._cf=2,0,8,_gq"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _ew(_cw)
local ux,uy=_e6(_cw,(_cw.x+8)\8, (_cw.y+8)\8, _fd, 99, true)
return ux*8,uy*8
end
function _ex(x,y,r)
if(_gx"5") _g2(x+ sin(r)*5.5 +3.5,y- cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gq"2,4,9,15", 0xa5a5.8)
end
function _ey(_cu, _cw, _ez)
if _cu.id!=19 then
local _e0=_cu.range*5
_cu._cs,_cu._cw,_cu._ct=3,_cw,cocreate(function(self)
while _cw._co>0 and _cw._cs!=8 do
if _gw(_cu.x,_cu.y,_cw.x,_cw.y) > _e0
and _cu.moves then
if not _ez and _gw(_cu.x,_cu.y,_cu.gx,_cu.gy) > _e0 then
goto exit_attack
end
_fe(_cu,(_cw.x+rnd(_cw.w))\8,(_cw.y+rnd(_cw.h))\8,_e0)
if _cu._e1==1600 then
_cu._co=0
for i=1,_cu.id/3 do
_c7(_cu.x+rnd"32" -16,_cu.y+rnd"32" -16, 2)
end
_cw._co-=(1000+rnd"600")
_cw._cp=_cu
return
end
end
if not _cu.norotate then
local a=atan2(_cu.x-_cw.x, _cu.y-_cw.y)
while (_cu.r !=a) do
_gz(_cu, a)
end
end
if _gw(_cu.x,_cu.y,_cw.x,_cw.y)<=_e0 then
if _ez and _cw.capturable and _cu.can_capture and _cw._co<=_cw._b8/3
then
_fe(_cu,_cw.x\8,_cw.y\8,0)
_e3(_cw, _cu)
if(_cw._ev) _e3(_cw._ev, _cu)
_cu._co=0
elseif _cu._c0<=0 and not _cu._cx and _cw._co>0 then
_cu._bv(_cu)
_cu._c0=_cu.fire_rate
end
elseif _cu.is_building then
_en(_cu)
end
yield()
if(_cu.id==40 or _cu.id==34 or _cw._e2==_cu._e2 or _cw._eq) break
end
::exit_attack::
if(not _ez) _fe(_cu,_cu.gx\8,_cu.gy\8)
_en(_cu, nil, true)
end)
else
_ey(_be(_ai[({24,25,38,38.5})[_cu._e2]], _cu.x,_cu.y, _cu._5, _cu), _cw)
_cu._c0=583
end
end
function _e3(_e4, _e5)
_e4.old_fact_data,_e4._e2,_e4._5,_e4._bq,_e4._bj,_e4.col1,_e4._aa
=
{_e4._e2,_e4._5,_e4._bq,_e4.col1,_e4._aa},_e5._e2,_e5._5,_e5._bq,_e5._bj,_e5.col1,_e5._aa
end
function _e6(_cu,x,y,_e7,_e8,_e9)
for t=0,_e8 or 4,.04 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_e7(_cu,xx,yy)) return xx,yy
if(not _e9) yield()
end
end
function _fa(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _fb(mx,my,_fc)
if(my>31)mx+=64 my-=32
mset(mx,my,_fc)
end
function _fd(_cu,x,y)
local _fh=_f7(x,y)
return not fget(_fa(x,y),0)
and (not _fh or _fh==_cu or _fh.z>1 or (_fh.onfoot and _cu.tracked and _fh._bq!=_cu._bq))
end
function _fe(_cu,x,y,_ff,_fg,_eo)
local _fi=_cu.z>1
if _fg then
local _fj=_gv(_cu._bq,33)
if _fj and not _fj._eq and _fj._e2==_cu._e2 then
_fj._eq,_cu._eq,_cu._cs, _fj._ct=_cu,_fj,2, cocreate(function(unit_c)
_fe(unit_c,_cu.x\8,_cu.y\8)
_cu:_c4()
if _cu._co>0 then
_fj.my=18
del(_j,_cu)
_fe(_fj,x,y)
_cu:_c1(_fj.x,_fj.y)
add(_j, _cu)
_en(_cu,_eo)
end
_fj.my=16
_en(_fj)
end)
return
end
end
::restart_move_unit::
if not _fi and not _fd(_cu,x,y) then
x,y=_e6(_cu,x,y,_fd)
end
_cu.tx,_cu.ty,_cu.prev_state,_cu._cs,_cu._fk=x*8,y*8,_cu._cs,1
if true then
local start, goal, _fm={ x=_cu.x\8, y=_cu.y\8}, {x=x, y=y}, function (_fl) return (_fl.y<<8) + _fl.x end
local _fu,_fn={
_fo=start,_fp=0,_fq=_g1(start, goal)
}, {}
_fn[_fm(start)]=_fu
local frontier, frontier_len, goal_id, max_number, count={_fu}, 1, _fm(goal), 32767.99, 0
while frontier_len > 0 do
local _fr=max_number
for i=1, frontier_len do
local _fs=frontier[i]._fp + frontier[i]._fq
if(_fs <=_fr) _ft,_fr=i,_fs
end
_fu=frontier[_ft]
frontier[_ft], _fu._fv=frontier[frontier_len], true
frontier_len -=1
local p=_fu._fo
if _fm(p)==goal_id then
p={goal}
while _fu._f0 do
_fu=_fn[_fm(_fu._f0)]
add(p, _fu._fo)
end
_cu._fk=p
goto end_pathfinding
end
local _fw={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _fh=_f7(nx,ny)
if(xx!=0 or yy!=0)
and _fi or not fget(_fa(nx,ny),0)
and _fd(_cu,nx,ny)
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fw, {x=nx, y=ny})
end
end
end
for n in all(_fw) do
local id=_fm(n)
local _fx=not _fi and fget(_fa(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _fx+=.2
local _fz, _fy=
_fn[id],_fu._fp + _fx
if not _fz then
_fz={
_fo=n,_fp=max_number,_fq=_g1(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fn[id]=_fz, _fz
end
if not _fz._fv and _fz._fp > _fy then
_fz._fp, _fz._f0=_fy, p
end
end
count+=1
if(not _fi) yield()
if(count>3000 or stat"0" >1638) goto end_pathfinding
end
end
::end_pathfinding::
_cu.prev_state,_cu._cs=_cu._cs,2
if _cu._fk then
for i=#_cu._fk-1,1,-1 do
local _fl=_cu._fk[i]
local nx,ny,ux,uy=_fl.x,_fl.y,_cu.x,_cu.y
local mx,my=nx*8,ny*8
if not _cu.norotate then
local a=atan2(ux-mx, uy-my)
while (_cu.r !=a) do
_gz(_cu, a)
end
end
if(not _fi and not _fd(_cu,nx,ny)) goto restart_move_unit
local _f1,_f2=_cu._f6 or .5, _gw(mx,my,ux,uy)
local _f3,_f4=_f1 * (mx-ux) / _f2, _f1 * (my-uy) / _f2
local _f5=_f7(nx,ny)
if(_f5 and _f5.onfoot and _cu.tracked) _f5._co=0
for i=0, _f2/_f1-1 do
_k[nx.."," ..ny]=_cu
_cu.x+=_f3
_cu.y+=_f4
if _cu.id==33 then
if _cu._eq then
local d=_gw(_cu.x,_cu.y,_cu.tx,_cu.ty)
if(d<32) _cu.z=d/4
end
_cu.z=mid(2,_cu.z+0.1,8)
_cu._f6=_cu.z/10
end
yield()
end
_cu:_c1(mx,my)
_k[nx.."," ..ny]=_cu
_c9(_cu)
if(_gw(_cu.x,_cu.y,_cu.tx,_cu.ty) <=(_ff or 0)) break
end
else
_cu._cs=0
return false
end
_cu._cs=0
return true
end
function _f7(tx,ty)
return _k[tx.."," ..ty]
end
function _f8(x,_f9,_b5,_w)
add(_2,{
x=x,y=85,w=_w or 22,h=8,_f9=_f9,_an=function(self)
return self
end,_ao=function(self)
local c=self._gh and 7 or 6
if(#_f9>1)rectfill(x,85,x+self.w,93, c)
?_f9,x+2,87,#_f9>1 and 0 or c
end,_b5=_b5
})
end
function _ga(_gb)
_gc,_v=_gb,500
end
function _gd(_b6)
_b6._co,_b6._ae,_b6.spent,_b6._cy=0,0,0,false
if(_b6._b2) _b6._b2._ag=false
end
function _ge(_b6)
if(not _b6) return
local _gf,_gg=cursor:_an(),_b6:_an()
_b6._gh=_gf.x <=_gg.x + _gg.w and
_gf.x + _gf.w >=_gg.x and
_gf.y <=_gg.y + _gg.h and
_gf.y + _gf.h >=_gg.y
if left_button_clicked and _b6._gh then
if _7 then
_3=_b6
else
if(_b6.type<=2 and _w[cx][cy]==0 or _b6._cs==8) return
if _bp
and _dx
and (_b6.id==6 and _dx.id==32
or _b6.id==14 and _dx.id>26)
and _b6._5==1 and _dx._5==1
then
_gi(_dx,_b6)
return
else
_bp=_b6
end
end
_dr=true
end
end
function _gi(_cu,_d1)
local _d1,_gj,_fg=_d1 or _gv(_cu._bq,1) or _cu
_cu._cs,_d1._ag,_cu._er=7,true,_d1
if(_cu.id!=32 or _d1.id==6) _cu._b9=_d1
_cu._ct=cocreate(function(_cu)
if(_d1.is_dockable) _gj,_fg=9,true
_fe(_cu, (_d1.x+16)/8, _d1.y/8, 0, _fg, _gj or 0)
if(not _cu._eq) _en(_cu, _gj)
end)
end
function _gk(_b6)
local _cw=rnd(_i)
if(_cw._bq!=_b6._bq and _gl(_cw)) _ey(_b6, _cw, true)
end
function _gl(_b6)
local x,y=_b6:_c3()
return _w[x][y]==16
end
function _gm(_gn)
sfx(_gn,3)
end
function _go(_gp)
local _al=peek(0x3115)
if(_al & 128 > 0 !=_gp) _al=_al^^128
poke(0x3115, _al)
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
function _gz(_cu, _g0)
local _c6=_g0-_cu.r
if(_cu.z>1) _cu.r=_g0
if _c6 > 0.5 then
_c6 -=1
elseif _c6 < -0.5 then
_c6 +=1
end
if _c6 > 0.0087 then
_cu.r +=0.0087
elseif _c6 < -0.0087 then
_cu.r -=0.0087
else
_cu.r=_g0
end
yield()
end
function _g1(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g2(x, y, r, dx, dy, dr, _g3, _co, _g4, _g5)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_co=0,_g3=_g3,_g4=_g4, _g5=_g5,_g6=y, _g7=_co }, 1)
end
__gfx__
11bbbbbbbb171bbb577777d5bbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbbb9bbbbb95555555d555555d155dbbbbbbbbbb
171bbbbbb17771bb576666d5bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99bb99bbbbbbbd5515555555515555d59bbb9d5d9b
1771bbbb1711171b576666d00000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9bb9bbb79bbbd555d5515d5d5555d515db55515515
17771bbb7717177b576666d007700077bbb99b9bb9999b9bb9b99bbbb9b9bb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
177771bb1711171b56dddd1000777770bbbbb9b99bb9999b9b9bbbbbbb9bb999b9b99bbb99999999b999b99bbb99bbbbbd55d55155155555d515559b155555d5
17711bbbb17771bb56dddd1007700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb79bbbbbbd515d55d555d5555d555dbbd55d5555
b11bbbbbbb171bbb56dddd100000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb99bbbbb9b95d5555555555155155dbbb5d555d15
bbbbbbbbbbbbbbbb5d111110bbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbbb99bbbd551d5515d555d555559bb55515555
55551d51bbbbbbbbbbbbbbbbbd5d555555d555dbdddddddddddddddd55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d55d5155bbbbbbdddbbbbbbbbd5551551555d5dbd5555555d55555551555515d4444444444555155544444444444444444444444544224222242224442422442
5155555dbbbb9d5555d9bbbbbb55d5555d5555bbd5015515d55555555d55d444444444444445d555444444444444444444444444524442444424442224444221
5d55d555bbbd555d5555dbbbbbd15d5d55555dbbd5105555d5555555555d4444444444444444445d444444444444444444444442522222212222222242222110
55d555d1bb955555d55559bbbb955555d555d9bbd5555111d5555555555444444444444444444445444444444444444444444422502112121121122121121200
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242510221200012210012100001
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240551000000000000000011111
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d5555555554444444444444444444444444444444444444444444421555111111111111111110115
bbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbddddddddbbbbbbbbbbbbbbbbbbbbbbbbbbb7bbbbbbbbbbbbb1000000bbbbbbb50000001bbbbbbbbb5000001b00000000
bbbbbbbbbb66669bbbbbbbbbbbbbbb51d555555515bbbbbbbbbbbbbbbbbbbbbbbbbebbbbbbbb6bbbb5b1b000bbbbbb10000b1b5b1bbbbbbbb1b1b1bb00000000
bbb777bbb66dd66bbd5bb5bbbbbbb5b0d55555550b5bbbbb050b5050bbbbbbbbbbb76b6bbbb6eb6bbb5b1b00bbbbb5b000b1b5bb01bbbbbbbb5b5bbb00000000
bb77994bb6d55d6bb5dbbbbbbbbbbb10d555555501bbbbbbcdcccccebbbbbbbbbc77777bbc77677bbbbbb1b0bbbbbb100b1bbbbb0bbbbbbbbbbbbbbb00000000
bb79994bb6d55d6bbbbb555bbbbbb1b0d55555550b1bbbbbcdc7766ebbbbbbbbbbb76b6bbbb6eb6bbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbb00000000
bb79944bb66dd66bbbbb5d5bbb5b1b00d555555500b1b5bb050b5050bbb5b5bbbbbebbbbbbbb6bbbbbbbb5b0bbbbbb100b5bbbbb0bbbbbbbbbbbbbbb00000000
bbb444bbbb6666bbbbbb555bb5b1b000d5555555000b1b5bbbbbbbbbbb1b1b1bbbb7bbbbbbbbbbbbbbbbbb51bbbbbbb115bbbbbb01bbbbbbbbbbbbbb00000000
bbbbbbbbb9bbbbbbbbbbbbbbb1000000d55555550000001bbbbbbbbbb1000005bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb022200bbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb00ee00bbbbbb00bbb00b00bb677776bb6cccc6bb0eecce0b082d882bd6666dbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbedeccccebb6ccdebb6cccdebbeccddcbbe076dcbbecd66dcb807e288be9ddcebd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bceccccceb00c76cbbbc776ebbe0667dbbecccdcb0666777db882d888ba947debd4c455444444549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbcecccccebb6ccdebb6cccdebbeccddcbbe076dcb0666777db807e288be9ddceb4a042499999442424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbedeccccebbbbb00bbb00b00bb677776bb6cccc6bbecd66dcb082d882bd6666db49029999c0994422229aa094d44444444522424244255425
bbbebbbbbbbebbbbb00ee00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0eecce0b022200bbbbbbbbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbd2499a77a0a99442d1542425d44411114555224225ff2225
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbbbbbbbbb6cc6bbd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbbbbbbbbbbeebbed1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbb11bbbbbbb6dbbbbb6dbced52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d555555566d671bb76666a98d7777777d5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55777671bbbbbb6dbbd7777777d5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbb11bbbbbbbbbbbbbb6dbced55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbbbbbbbbbbbbbbbbbbeebbed55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbbbbbbbbbbbbbbbbb6cc6bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
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
d55776d7777716d6116d6105d500dcd76dcd0dd1bbbccbbbdddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110bee77ee5dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc00565e66ecedddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c55557777777dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c605557777777dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd05565e66ece5555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076bcc77cc555555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dbbbccbbb55555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
040018008c8c8c8c8c8c8c0e0808080808080808080a18090909090909090909060e0e000800000000000000000100010000000000000000000001010101010101010001000102010000010101020201011101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101090000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000022000000000c0d0d0d0d12000a05050a0000000000000000000000130d100e0000000c0d0d0d12000000000000000000000000000000002f2f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0d0d0d0d0d0d0d2d47
0000000000000000000000110d0d0d0d0d0d0d120805080000000000000000000000000000000000000d0d0d0d0e000000000000000000000000000000002f2f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0d0d0d0d0d0d0d2d00
00000000000000000000000d0d0d0d0d0d0d0d0d0f0d0d0d0f0f1200000000000000000000000000000d0d0d0d0e000000000000000000110d0d0f1200002f2f000000000000000000000000000000000000000000000000000000000000000000000011120000000000000000000000000000110f0d0d0d0d0d0d0d0d0d2d57
00000000000000000000110d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d1200000000040507000000000000130d0d0d0d0406000000000000000d0d0d0d0d0d122f2f00000000000000000000000000000000000000000000000000000000000000000000110d0d120000000000000000000000000c0d0d0d0d0d0d0d0d0d14002d00
000000000000000000110d0d0d0d0d0d0d0d0d0d0d0d100d0d0d100d12000007050505000000000000000c0d0d0d0505050505060000000c0d0d0d0d0d0d2f2f000000000000000000000000000000000000000000000000000000000000000000110d0d0d0e000000000000000000000000000c0d0d0d0d0d0d140000002d33
0000000000000000110d0d0d0d0d100d100d0d0d0d140000000000130d0e04050505050000000000000013100d140a09050505050506000c0d0d0d0d0d0d2f2f00000a0000000000000000000000000000000000000000000000110d0d1200110d0d0d0d0d0e000000000000000000000000000c0d0d0d0d0d14000000002d00
0d0d0f0d0d0f0f0d0d0d0d0d0d14000000130d0d0e00000000000000000005090905050000000000000000000004050905090909050a110d0d0d0d0d0d0d2f2f000000000000110f1200000000000000000000000000110d0d0f0d0d0d0d0d0d0d0d0d0d0d0e000000000000000000310000000c0d0d0d0d0e00000000002d34
0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000c0d0e0000000405050506000509050905000000000000000000000505090905090505110d0d0d0d0d0d0d142f2f000a00000000130d14000000000000000000000000000d0d0d0d0d0d17190d0d0d0d0d0d0d0e00000000000000000000000000130d0d0d0d0e00000000002d00
00130d0d100d0d100d100d0d140000000000130d140000000a09090508000a0505050600000000000000000000050909090509050c0d0d0d0d0d0d0e00002f2f000000000000000000000000000000000000000000000c0d0d0d0d0d1d1b1b18190d0d0d0d0e0000000000000007050600000000130d0d0d0e00000000002d35
000000000000000000000c0d000000000000000c120000000a050508110f0d12050a00000000000000000000000a050909050905060c0d0d0d0d0d0e00002f2f000000000000000000000000000000000000000000000d0d0d0d0d0d0d1d1b1c1f0d140406130d0f0d0e00000005050500000000000c0d0d0e00111200002d00
000000000000000000000d0d000000000000000c0e00006f0a0508110d0d0d0d12000000000000000000110d12000a050509090505130d0d0d0d0d0d12002f2f0000000000000000000000000000110f120000000000130d0d140000000c1d1e0d14040505000c0d0d000000000805080000000000130d0d0d0d0d0d0d0d2d37
000000000000000000000d0d000000000000110d0e003100000a110d0d0d0d0d0e0000000000000000000d0d0d1200000a05090905060c0d0d0d0d0d0e002f2f00070000000000000000110d0f0f0d0d14000000000000131400000000130d0d0d0405050800130d0d00000000000000000000000000130d0d0d0d0d0d0d2d00
0000000000000000000013140000000000000c0d0d12000000110d0d0d0d0d0d0e000000000000000000130d0d1400000005050505060c0d0d0d0d0d0d002f2f0506000000000000000000130d0d0d0d0000000000000000000000000000130d14050505000000130e0000000000000000000000000000130d0d0d0d0d0d2d36
000000000000000000220000000000000000130d340d0d0f0dcd330d0d0d0d0d0e00000000000000000000131400000000000a0a110d0d0d0d0d0d0d0d002f2f05050600000000000000000000130d0e0000000000000000000000000000000405050508000405060e000000000000000000000000000000130d0d0d100d2d00
00000000000a110f0e00000000000000006f00130d0d01220d0d0d0d0d0d0d0d0d1200000000000000000000000000000000110d0d0d0d0d0d0d0d0d0e002f2f0905000000000000000000000000000d1200111200000000000000000405050505050811120a080c0d0d12000000000000000011123007050600070506002d32
00000405070c0d0d0000000000000000000031000c0d22220d340d0d0d0d0d0d0d0d000000000000000000000000000000110d0d0d0d0d0d0d0d0d0d0e002f2f090a110d12000000000000000000000c0d0d0d0d12000000000000000a0505000a08110d0d0f0e00130d0d12000000330000110d0d040505050505050a002d00
00000a0905070d140000000000000000000000110d0d340d0d0d0d0d0d0d0d0d0d0d120000000000000000000000000000130d0d0d0d0d0d0d0d0d0d14002f2f0a000c0d0d120000000000000000000c0d0d0d0d0e0000330031000008050800000a130d0d140705070013140000000007000c0d0d0a0909090909050a002d49
00070509090a1300000000000000000000110d0d0dcd0d440d0d0d100d0d0d0d0d0d0d000000000000000000000000000000130d0d0d0d0d0d14070600002f2f00000d0d0d0e0000000000000000000c0d0d1400000000000000000000000007050700070505050530000000000000000506130d140505090909090506002d00
04050909050505000a0000000000110d0d0d0d0d0d0d0d0d0d140a0000130d0d0d0d0d0e0000000000000000000000000000000000130d0d1407050500002f2f00000c0d0d0d0000000000000000110d0d140000000000040506000000000005050505050905050800000000000000000505060c0a0505050909050800002d95
0505050505050800110f0d0d0f0f0d0d0d0d100d0d0d0d0d140a0a0a0000130d0d0d0d00000000000000000000000000000000000000130d0705050500002f2f00110d0d0d0d0e000000000000000c0d0e07070600000005050506000000000a05090509090905000000000000000000300811330a0505090905080000002d00
05090505080000110d0d0d10100d0d0d10140013100d0d140a0a0a0a0a0000130d100d12000000000000000000000000000000000000070a0509090506002f2f000c0d0d0d0d00000000000000000c0d0e0505050600000509050500000000000509090909050834000000000000000000110d0d120a05050508000033002d28
0a0508000000000d0d140000000000000000000000000a050a0a0a0a0a00000000000c0d000000003600110d0d12000000000000000005090909050800002f2f110d0d0d0d1400000000000000000c0d0e0505050500000505090500000000000a050509090500000000000000110d0d330d6a22246c24240d0f0d1200002d00
000000000000130d14000000000000000000000000000000000000000000000000000c0d1200000000000d0d0d0d0d120000000000000a05050508000a002f2f130d0d0d0d0000000000000000000c0d0e0a050505000005090905000a0000000000050505080000000000110d0d0d0d0d0d22222424242424240d0d0d122d29
000000000000000000000000000000000000000000000000000000000000000000000c0d1400000000110d17190d0d0d0d120000000000000000001112002f2f06130d0d0e0000000000000000000c0d0d0d12050800000a050505060000000000000a05080000000000110d0d0d0d17181c2440221a1c4422220d0d0d0d2d00
000000000000000000000000000000000000000000000000000000000000000000110d0d00000000000d0d1d1f0d0d0d0d14000000000000000000130d0f2f2f05060c0d0e0000000000000000000c0d0d0d0d0f0d120000000000000405050600000000000000000000130d0d340d1d1f2424222224242222220d100d0d2d26
0000000000000000000000000000000000000000000000000000000000000000110d0d140000000000130d0d0d0d0d0d0d000000000000000000000000132f2f050a0d0d0d1200000000000000000c0d0d0e0000130d0d0d1200000005050a00003300000000000000000000130d0d6022244222422268222414340000002d00
0d0f0d12000000000000000000000000000000110f0d0d1200000000000000000c1400000000000000000c0d0d0d0d0d14000000000000000000000000002f2f00000c0d0d0d0d120000000000110d0d0d14000000130d0d0d1400000a0505060000000000000000000000000000132222242222222222221400000000002d39
0d0d0d0d1200000000000000000000000000110d0d0d0d0d140000000000001114000000000000000000130d0d0d0d0d42000000000000000000000000002f2f0000130d0d0d0d140000000000000c0d1400000000000c0d14000000000505050000000000000000000000000000000000000000003100000000000000002d00
0d0d0d0d14000000000000000000000000000d0d0d0d0d0e00000000000000000000000000000000000000130d0d0d1400000000000000000000000000002f2f05060000000000000000000000001314000000000000131400000000000a05080000000000000000000000000000000000000033000000000000000000002d38
0d0d0d14000000000000000000000000000013100d0d1014000000000000000000000000000000000000000000131400000000000000000000000000110d2f2f05050600000004050505060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d00
0d140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110f0d0d0f0d0d2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2d48
140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110d0d0d0d0d0d0d2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f0000
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