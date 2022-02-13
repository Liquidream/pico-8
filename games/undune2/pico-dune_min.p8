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
_1,_2,_3=1,nil,{}
_gd(6,"⬆️",function()
_5=mid(1,_5-1,#_bp._eo)
_2=_bp._eo[_5]
if(_5<_1) _1-=1
end, 10)
_gd(17,"⬇️",function()
_5=mid(1,_5+1,#_bp._eo)
_2=_bp._eo[_5]
if(_5>_1+2) _1=min(_1+1,#_bp._eo-2)
end, 10)
_gd(32,"build",function()
_6=nil
_d6:_br()
end)
_gd(96,"close",function()
_6=nil
end)
_6=self
end
g_._ab=function(self)
local _9=self._9
pal({nil,nil,nil,nil,nil,nil,nil,_9,nil,_9,_9,self.col1,nil,_9})
if self._af then
pal(self._cf[self._ac], self.col1)
else
pal(11,self.col1)
self._ac=1
end
end
local _aa=function(self)
pal(7,8)
if(self.id==80 and _bp._ad==2 and not _bp._ae) pal(7,11)
end
function _7(self, _8)
self._c3,self.last_process,self._ad=0,self._ad,_8
if(self._cr>=0 and self.last_process>0) self._ae=not self._ae
if(_8==1) self._b3._af=true self._b3._ag=self
end
local _ah=[[id|_bv|_au|ico_spr|type|w|h|z|trans_col|_bn|_bo|_ap|col1|_9|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_fw|power|_e6|_b8|_gb|range|_co|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|_cr|_cy|_ad|spent|_c4|_cs|_ct|_ac|col_cycle_src|storage|capacity|is_repairable|ai_build|moves|tracked|onfoot|is_building|is_unit|is_dockable|capturable|can_capture|_cf|_bz|description|_b5|_br
1|64|64|170|2|2|2|0||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|1|||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_4
2|22|22|162|2|2|2|0||1|||||7|5|2|2|1|4|||20|0|0|0|0||||||nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|||1|nil|nil|nil|||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|22|162|2|1|1|0||1|||||6|6|2|2|1|1|||5|0|0|0|0||||||nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|||1|nil|nil|nil|||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|133|133|164|2|1|1|0||1|||||||2|2|7|4|||50|0|0|200|0|||||53|nil|164||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|||1|nil|nil|nil|||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
5|66|66|172|2|2|2|0||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|nil||2|0|0|0|0|0|0|1|1|11|0|nil|1|nil|nil|||1|nil|nil|1||12,12,12,12,12,12,12,12,12,12,13,1,0,0,0,0,0,0,0,0,1,13|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
6|68|68|174|2|3|2|0||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|nil||4|0|0|0|0|0|0|1|1|11|1000|nil|1|nil|nil|||1|nil|1|1||11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ab|
7|106|106|136|2|2|2|0||1|||||||2|2|5|2|||400|30|0|2000|0|||||53|nil||2|0|0|0|0|0|0|1|1|11|0|nil|1|nil|nil|||1|nil|nil|nil||8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
8|104|104|134|2|2|2|0||1|||||||2|2|6|2|||150|5|0|600|0|||||53|nil|||0|0|0|0|0|0|1|1||1000|nil|1|nil|nil|||1|nil|nil|1|||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
9|108|108|168|2|2|2|0||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|nil|||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_4
10|110|110|138|2|2|2|0||1|||||||2|2|7|2|-1||400|10|0|1600|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|nil|||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_4
11|96|96|140|2|2|2|0||1|||||||2|2|6|2|||400|20|0|1400|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|1|||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_4
12|98|98|142|2|3|2|0||1|||||||2|2|11|3|||600|20|0|800|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|1|||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_4
13|101|101|166|2|3|2|0||1|||||||2|2|12|5|||500|35|0|1600|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|1|||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_4
14|128|128|230|2|3|2|0||1|||||||2|2|12|5|||700|20|0|800|0|||||53|nil||2|0|0|0|0|0|0|1|1|8|0|nil|1|nil|nil|||1|nil|1|1||0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
15|71|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|80|800|0|5|1|27|58|53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|1|nil|1|||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
16|87|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|240|800|0|10|2|40|59|53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|1|nil|1|||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
17|61|61|228|2|3|3|0||1|||||11|3|2|2|11|6||1|500|50|0|2000|0|||||53|nil||4|0|0|0|0|0|0|1|1|11|0|nil|1|nil|nil|||1|nil|nil|1||11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVE~SHIPMENTS FROM~c.h.o.a.m.|_ab|_4
18|131|131|224|2|2|2|0||1|||||||2|2|12|7|||500|40|0|1600|0|||||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|nil|||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
19|58|58|226|2|3|3|0||1|||||||2|2|17|8||1|999|80|0|4000|0|||2,400||53|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|nil|||1|nil|nil|nil|||pALACE|tHIS IS YOUR pALACE.||
20|49|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||24|80|0.05|3|1|15|60|57|1|48|20|0|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
21|48|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|3|1|15|60|57|1|49|20|0|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1||iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
22|49|111|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|7|2|17|59|57|1|48|20|0|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
23|48|127|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|7|2|17|59|57|1|49|20|0|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|1|nil|1|nil||1||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|440|0.1|4|1|17|60|57|1|49|20|0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||1600|40|0.4|1|1|800|60|57|1|49|20|0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||64|440|0.1|2|2|17|59|57|nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|1|nil|1|nil||nil||tROOPERS|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
27|51|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|1||150||32|400|0.6|4|1|17|60|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
28|52|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||56|520|0.5|4|1|17|60|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
29|53|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||100|800|0.25|5|1|27|58|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
30|55|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||240|1200|0.2|6|1|30|58|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||sIEGE tANK|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
31|54|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||600|400|0.3|10|2|40|59|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||lAUNCHER|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
32|50|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||nil|600|0.1|0||0||54|nil|||0|0|0|0|0|0|1|1||0|0|1|1|1|1|nil|nil|1|nil||nil||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
33|73|73|238|1|1|1|8|11|13|17||||11|3|2|2|13|5|||800||nil|400|0.75|0||0||54|nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|1|nil||nil||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
34|40|40|160|1|1|1|4|11|13|||||||2|2|18|7|-3||600||296|4|1|10|2|33|59|54|nil|41|10|0|0|0|0|0|0|1|1||0|nil|nil|1|1|nil|nil|nil|1|nil||nil||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
35|38|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||nil|600|0.1|0||0||54|nil|||0|0|0|0|0|0|1|1||0|nil|1|nil|1|nil|nil|nil|1|nil||nil||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
36|57|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||240|440|0.3|9|3|27|52|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
37|56|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||320|1600|0.1|8|1|33|58|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
38|72|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||1600|40|1|0|20|800|59|54|nil|||0|0|0|0|0|0|1|1||0|nil|nil|0|1|nil|nil|nil|1|nil||nil||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
38.5|72|72||1|1|1|8|11|||0|||||2|2|13|8|4||0||1600|40|1|0|20|800|59|54|nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|1|nil||nil||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
39|51|205|204|1|1|1|1|11|11|||||11|1|2|2||2|2||150||40|320|0.75|4|1|17|60|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|nil|nil|nil|1|nil||nil||rAIDER tRIKE|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
40|54|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||0|480|0.3|9|1.9|60|59|54|nil|||0|0|0|0|0|0|1|1||0|nil|1|1|1|1|nil|nil|1|nil||nil||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
41|88|88||9|1|1|1|11||||||||2|2||3|||0||300|4000|0.35|0|30|7|50||nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|1|nil|nil|nil|nil|nil||nil||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
42|32|32||1|1|1|1|11|||2|||||1|1|||||||nil|4|0.1|||||53|1|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|nil|nil|nil|nil|nil||nil||sPICE bLOOM|||
80|3|3|3|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|||nil|nil|nil||nil||rEPAIR||_aa|action_click
81|1|1|1|3|1|1|0|11||||||||1|1|||||||0|0|||||||nil|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil|||nil|nil|nil||nil||lAUNCH||_aa|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _ai=_gv(_ah,"|","\n")
_ah={}
for i=2,46 do
local _aj={}
for j=1,61 do
local _ak=_ai[i][j]
if(j<57) _ak=tonum(_ak)
if j==59 then
_al,_ak=_gv(_ak,"~"),"" for line in all(_al) do
_ak..=line.."\n" end
end
_aj[_ai[1][j]]=_ak
end
_ah[_ai[i][1]]=_aj
end
for i=-3,66 do
_w[i]={}
for l=-3,66 do
_w[i][l]=0
end
end
cursor={
w=8,h=8,_am=function(self)
return {
x=self.x+(_d0 and 0 or _as),y=self.y+(_d0 and 0 or _at),w=0,h=0
}
end,_an=function(self)
local _ao=(_bp and _bp.is_unit and _bp._ap==1 or _d2) and 3 or 0
spr(_ao/3, self.x-_ao, self.y-_ao)
end
}
for my=0,31 do
for mx=0,127 do
local _aq,_ar=nil,mget(mx,my)
if(_ar==1) _as,_at,_aq=_f[1][4]-56,_f[1][5]-56,_ah[1]
for o in all(_ah) do
if(o._au==_ar) _aq=o break
end
if _aq and (_ar==1 or _ar>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_ff(mx,my+1))
_be(_aq, ox*8, oy*8)
end
end
end
_av=cocreate(function()
while true do
if t_%30==0 then
_gt(false)
_k={}
for _cx in all(_j) do
_k[_cx:_c6()]=_cx
end
local _aw={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ax=_ff(i,l)*8
if(_w[i][l]==16) _aw[(i/2).."," ..(l/2)]=_ax>0 and sget(_ax%128+3, _ax\128*8+3) or 15
end
yield()
end
end
_ay,_az,_a0,_o=0,0,{0,0},{{},{}}
for building in all(_i) do
if building.id!=4 then
if building._ap==1 or (hq and _gq(building)) then
_aw[(building.x\16).."," ..building.y\16]=building.col1
end
if building._ap==1 then
_ay-=building.power
_az+=building.storage
end
_a0[building._ap]+=1
_gx(_o[building._bq], building.id, building)
_k[building:_c6()]=building
end
end
for _cx in all(_j) do
if hq and (_cx._ap==1 or _gq(_cx) and _cx.z==1) then
_aw[(_cx.x\16).."," .._cx.y\16]=_cx.col1
end
if(_cx._bq>0) _gx(_o[_cx._bq], _cx.id, _cx)
end
hq,_l=_o[1][7] and _ay>0,_aw
local _a1,_a2=0
for yy=0,31 do
for xx=0,31 do
local _ak=_l[xx.."," ..yy] or 0
if xx%2==0 then
_a2=_ak
else
_a2|=_ak<<4 poke(0x4300+_a1,_a2) _a2=0 _a1+=1
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
_a6,_a7,_a8,_a9,_ba={{rnd"500",rnd"500" }},rnd"1",0,_gv"15,9,4",0
end
function _bb(_bc,_bd)
local _bg=_bc.req_faction
return not _bg
or _bg==_bd
or (_bg<0 and _bg!=-_bd)
end
function _be(_aq, x,y, _ap, _bf)
local _bh=_b0(_aq, x,y, _aq.type, nil, g_[_aq._b4], g_[_aq._b5], nil)
_bh.ico_obj,_bh._cr,_bi,_bh._ap=_b0(_aq, 107,0, 4, _bh, nil, nil, g_[_aq._br]), _bi and _aq._b8/2 or _aq._b8, false, _bh._ap or _ap
if _bf then
_bh._bj=_bf._bj
else
if _bh._ap then
_bh._bj,_h=1,_f[1]
else
local _bk=9999
for i=1,#_f do
local _bl=_g1(x,y,_f[i][4],_f[i][5])
if(_bl<_bk) _bh._bj,_bh._ap,_bk=i,min(i,2),_bl
end
end
end
_bh._bq,_bh.build_objs,_h=_ap or _bh._ap,{},_f[_bh._bj or _bf._bj]
_bm=_h[1]
_bh._e7,_bh.col1,_bh._9=_bm,_h[2],_h[3]
if(not _bb(_bh,_bm)) return
for o in all(_ah) do
if o._bn
and (o._bn==_bh.id or o._bo==_bh.id)
and _bb(o,_bm)
then
add(_bh.build_objs,_b0(o, 107,0, 5, _bh, nil, nil, function(self)
if _6 then
_bp=self
else
if(self.is_building and #_i<150) or self.is_unit and #_j<85 then
_7(self, 1)
elseif _bh._bq==1 then
_gf"uNABLE TO CREATE MORE" end
end
end)
)
end
end
if _bh._ap>1 then
_bh.ico_obj._br=nil
end
if _aq.col1 then
_bh.col1,_bh._9=_aq.col1,_aq._9
end
if(_bh.z>1) _bh._ap=0
local _bs,_bt=x\8,y\8
if _aq.is_building and not _aq.is_unit then
local _bu=_aq._bv==22
for xx=0,_aq.w-1 do
for yy=0,_aq.h-1 do
local _ak=_ff(_bs+xx, _bt+yy)
if not _bu or (_ak>=12 and _ak<=21) then
_fg(_bs+xx, _bt+yy, _bu and 22 or _bh._ap==1 and 81 or 103)
end
end
end
if(not _bu) add(_i,_bh)
if _bh.id==6 and not _bh._b3 then
_d7(_bh)
end
else
_bh.r=_bh.norotate!=1 and (_bs%8)*.125
if _bh._e6 then
_bh._bw=function(self)
self._cu,self._c1,self.bullet_y,self.bullet_tx,self._bx=4,self.x+4,self.y+4,self._cz.x+self._cz.w/2,self._cz.y+self._cz.h/2
local dx,dy=self.bullet_tx-self._c1,self._bx-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._by=dx/d,dy/d
_gr(self.fire_sfx)
_dd(self)
end
if _bh.moves then
_bh._bz=_gv"aTREIDES,oRDOS,hARKONNEN,sARDAUKAR" [_bh._e7].." " .._bh._bz
else
_fg(_bs,_bt,_bh._ap==1 and 2 or 133)
end
end
if(_bf and _bf.id==6) _bh._b9=_bf
add(_j,_bh)
_et(_bh, nil, true)
end
_dd(_bh)
return _bh
end
function _b0(_b1, x,y, _b2, _b3, _b4, _b5, _br)
local _b6={
_b7=_b1,id=_b1.id,_b8=_b1._b8,x=x,y=y,z=_b1.z,
_ca=x/8,_cb=y/8,type=_b2,_b3=_b3,_br=_br,w=_b1.w*8,
h=_b1.h*8,_cc=_b1._bv,_cd=_b1.w,
_ce=_b1.h,
_cf=_gv(_b1._cf),_am=function(self)
return {
x=self.x,y=self.y-self.z,w=(_b2>3 and 16 or self.w),h=(_b2>3 and 16 or self.h)
}
end,_an=function(self)
local x=self.x
local y=self.y
if _b2>2
or (x+self.w>=_as
and x<=_as+127
and y+self.h>=_at
and y<_at+127+self.z)
then
pal()
palt(0,false)
if(self.trans_col and _b2<=3) palt(self.trans_col,true)
if(self._e7 and self.id!=18) pal(12,self.col1) pal(14,self._9)
if _b2>3 then
local _cg=_b2==5 and self or self._b3
rectfill(x-1,y-1,x+16,y+19,0)
local hp=_cg._b8
local _ak=self._ad==1 and _cg._cr/6.666 or 15*(_cg._cr/hp)
if(_cg._cr>0 and not _6) rectfill(x,y+17,x+_ak,y+18, self._ad==1 and 12 or (split"8,10,11,11")[_cg._cr\(hp/3)+1])
pal(11,_cg.icol1) pal(3,_cg.icol2)
end
if self._cf then
pal(self.col_cycle_src, self._cf[self._ac])
end
if(flr(self._ct)%2==0) pal(_gv"7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7")
if(_b5) _b5(self)
if self.r then
if not self._cw or self._cw>.025 then
local ca,sa=cos(.25-self.r),sin(.25-self.r)
local _ch,_ci,_cj=ca,sa,0xfff8
ca*=4-.5
sa*=4-.5
local _ck,_cl=sa-ca+4,-ca-sa+4
for ix=0,7 do
local _cm,_cn=_ck,_cl
for iy=0,7 do
if((_cm|_cn) & _cj)==0 then
local c=sget(self._bv%16*8+_cm,self._bv\16*8+_cn)
if c!=self.trans_col then
if(self.z) pset(x+ix,y+iy, 1)
pset(x+ix,y+iy-self.z,c)
end
end
_cm-=_ci
_cn+=_ch
end
_ck+=_ch
_cl+=_ci
end
end
else
if _b2>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
if _b2==5 then
if _b1.is_building then
fillp"0XAFAF" rectfill(x+15,y+15,x+15-(self._cd*2),y+15-(self._ce*2),245)
fillp()
end
if self._ae and not _6 then
?"\^jsc\f0\^:⁶:00666666666666\f8\vt\^:⁶:00666666666666"
end
end
else
spr(self._bv, x, y, self._cd, self._ce)
end
end
if self._c1 then
if self._co==1 then
pset(self._c1,self.bullet_y, rnd{8,9})
else
local _cp=self._co<=2
_g7(
self._c1, self.bullet_y,_cp and 1.9 or 0,0, 0, _cp and -.3 or 1,0,_cp and 10 or 2.5,_cp and _gv"7,10,9,8,2" or {15},rnd{0xa5a5.8,0})
end
end
if(self._cr<self._b8/3 and not self.onfoot and _g2"10" and _b2<=2) _g7(x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,_gv"10,8,9,6", rnd{0xa5a5.8,0})
self._cs=0
end
end,_cq=function(self)
local _cr,id=self._cr,self.id
self._ct=max(self._ct-.4,1)
if self._cs>0 and self._bq>0 and id!=42 then
_0[self._e7]=true
_gt(true)
if(stat"54" >5) music"0"
if(self._e6 and self._cu==0) _e3(self, self._c0)
if(self._bv<=49 and _cr<100) self._cd,self._ce=0.5,0.5
if(self.is_repairable and not self.is_building and _cr<75 and self._cu<=6) _gn(self,_g0(self._bq,14) or self._b9)
end
if(_b2<=2 and _cr<=0 and not self._cw) self._cu=5 self._cv=nil self._cw=.25 _gr(self.death_sfx) _a5+=(_b2==2 or self.id==38) and .25 or 0
if self._cw then
self._cw-=.025
if self._cw<=0 then
if _b2==2 then
for xx=0,self._cd-1 do
for yy=0,self._ce-1 do
_fg(self.x/8+xx, self.y/8+yy, 21)
end
end
del(_i,self)
_q[self._c0._bq]+=1
else
local gx,gy=self:_c7()
if(_ff(gx,gy)==0) _fg(gx,gy,33)
if(id<=16) _fg(gx,gy,21)
if(self._b9) self._b9._af=false
if(self._ex and self._ex.id==14) self._ex._cf={0}
_d3(self)
if id==42 then
_fb(self,gx,gy,function (_cx,x,y)
if(_ff(x,y)==0) _fg(x,y,10)
end,4, true)
end
if(self._c0) _r[self._c0._bq]+=1
end
self:_c8()
else
if(_g2(_b2==2 and 1 or 8)) _db(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self.framecount then
self._cy+=1
if self._cy > self.framecount then
self._cy=0
if self.altframe
and self._cu==2 then
self._bv=self._cc+(self.altframe-self._bv)
end
if self._cf then
self._ac+=1
if(self._ac>#self._cf) self._ac=1
end
end
end
if self._c1 then
self._c1+=self.bullet_dx*2
self.bullet_y+=self._by*2
if _g1(
self._c1,self.bullet_y,self.bullet_tx,self._bx) < 2
then
_db(self._c1, self.bullet_y, self._co)
local _cz=self._cz
if _g1(
self._c1,self.bullet_y,_cz.x+_cz.w/2,_cz.y+_cz.h/2) < 4
then
_cz._cr-=self._e6*rnd"1"
_cz._cs,_cz._c0=self._co,self
if id==40 and _cz.moves and _g2"5" then
_e8(_cz, self)
_et(self)
elseif _cz.old_fact_data then
_cz.old_fact_data,_cz._e7,_cz._ap,_cz._bq,_cz.col1,_cz._9
=
nil,unpack(_cz.old_fact_data)
_et(_cz)
end
end
self._c1=nil
end
end
if self._ad>0
and not self._ae
and not self._c2 then
if self._ad==1 and self.spent>self._fw then
self._c2=true
if(self._b3._ap==1) _gr"56" _gf"cONSTRUCTION cOMPLETE"
if _b1.is_unit
and self._bn !=1 then
local ux,uy=_e1(self._b3)
_be(_b1,ux,uy,self._b3._ap,self._b3)
_gi(self)
end
elseif self._ad==2 and _cr>self._b8 then
self._ad=0
if _b2==1 and self.moves then
self._ex._cf,self._cu={0},0
self:_c5(_e1(self))
end
else
if self._c3>3 then
if(_c9(-1,self._ad==1 and self._b3 or self)) self._c3=0 self.spent+=1
else
self._c3+=1
self._cr=(self._ad==1 and (self.spent/self._fw)*100 or _cr+1)
end
end
end
self._c4=max(self._c4-.1)
if self._ap==1 then
if(id==5) self._bz="wINDTRAP (∧" .._ay..")"
if(self.storage>0) self._bz=_b1._bz.." (" ..flr(_ds/_az*100).."%)" end
end,_c5=function(self,x,y)
self.x,self.y=x,y
end,_c6=function(self)
local x,y=self:_c7()
return x.."," ..y
end,_c7=function(self)
return self.x\8,self.y\8
end,_c8=function(self)
if(_bp==self) _bp=nil
end
}
for k,v in pairs(_b1) do
if not _b6[k] and v!="" then
_b6[k]=v
end
end
return _b6
end
function _c9(_da, _b6)
if(_g[_b6._ap]+_da<0) return false
_g[_b6._ap]+=_da
if _b6._ap==1 then _gr"63" end
return true
end
function _db(x,y,_dc)
_g7(x, y, 2,0, 0, .1, -.01, _dc==1 and 5 or 20, _dc==1.9 and _gv"3,11,3" or _gv"5,7,5,7,10,8,9,2", _g2"2" and 0xa5a5.8)
end
function _dd(_de)
if(_de._ap!=1 and _de._cu!=4) return
local _df=_de.type+1
for xx=-_df,_df do
for yy=-_df,_df do
local _dg,_dh=_de.x\8+xx,_de.y\8+yy
_w[_dg][_dh]=16
_er(_dg,_dh)
for dy=-1,1 do
for dx=-1,1 do
_er(_dg+dx,_dh+dy)
end
end
end
end
end
function _update60()
local _di,_dj,_dk=stat"32",stat"33",stat"34"
_dl,_dm,_dn=(_dk==1 and _d4 !=_dk) or btnp"5", (_dk>0) or btn"5", (_dk==2 and _d4 !=_dk) or btnp"4"
if not _do then
_do,_dp=64,64
elseif _di==_dq and _dj==_dr then
b=btn()
_do+=b\2%2-b%2
_dp+=b\8%2-b\4%2
else
_do,_dp=_di,_dj
end
_do,_dp=mid(_do,127),mid(_dp,127)
cursor.x,cursor.y,_dq,_dr=_do,_dp,_di,_dj
if not _6 then
if(_do<2) _as-=2
if(_do>125) _as+=2
if(_dp<2) _at-=2
if(_dp>125) _at+=2
_as,_at,_ds=mid(_as,_x),mid(-10,_at,_x),tostr(_g[1])
if t_%6<1 and _ba==0 then
if(_g2"18") _a8=rnd".04" -.02
_dt,_du=_a6[#_a6][1],_a6[#_a6][2]
add(_a6,{_dt+sin(_a7),_du-cos(_a7)})
_a7+=_a8
end
if(#_a6>30) del(_a6,_a6[1])
if(_ba>0) _ba+=1 _e2(_dt,_du,rnd"1")
_ba%=200
for _cx in all(_j) do
if(_cx._cv) _dv=coresume(_cx._cv, _cx)
if(not _dv) _cx._cv=nil
if fget(_ff(_cx:_c7()),2)
and _g1(_dt,_du,_cx.x,_cx.y) < 1
and _cx.z==1
then
_d3(_cx)
_ba=1
_gr"50" end
end
for p in all(_n) do
p.dy +=p._g8
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cr +=1
if(p._cr>=p._hc) del(_n,p)
end
if t()%_b==0 then
local _dw=rnd(_j)
if _dw._ap==2 and _0[_dw._e7] and _dw._e6 and _dw._cu==0 then
_gp(_dw)
end
local _dx=rnd(_i)
if _dx._ap==2
and (not _dx._ag or _dx._ag._ad!=1)
then
local u=rnd(_dx.build_objs)
if u and u.ai_build then
u:_br()
end
if _dx._cr<_dx._b8 and _dx._ad!=2 then
_7(_dx, 2)
end
local _dy=_g0(2,19)
if _dy
and _0[_dy._e7]
and _dy._c4<=0
then
_gp(_dy)
end
end
end
assert(coresume(_av))
end
_dz=false
if _bp then
_d0=true
_gj(_em)
_gj(_en)
if(_bp.ico_obj and not _6 and not _dz) _gj(_bp.ico_obj) _gj(_bp._ag)
if(_6) foreach(_bp.build_objs, _gj) foreach(_3, _gj)
_d0=false
end
if not _6
and not _dz then
foreach(_j, _gj)
foreach(_i, _gj)
end
if _dm
and not _6
and _do>91 and _do<123
and _dp>91 and _dp<123 then
_as,_at=mid((_do-96)*16, _x),mid(-10,(_dp-97)*16, _x)
_bp=_d5
elseif _dl then
if _dz then
if(_bp) _v=0
if not _6 and _bp._b3 then
if(_bp._br) _bp:_br()
_bp=_d5
goto skip_collisions
end
if(_6 and _2._ge and _2._br) _2:_br()
if(_bp._ap==1 and _bp.is_unit and _bp!=_d5 and _bp.moves) _gr"62"
if(_bp._bq!=1 and _d5 and (_d5.is_unit or (_d5.id==19 and _d2)) and _d5._ap==1) _bp._ct=10 _e3(_d5, _bp, true) _bp=nil
else
if _bp
and _bp._ap==1
and _bp.moves
and _bp._cu!=7 then
_bp._cv=cocreate(function(_cx)
_fj(_cx, (_as+_do)\8, (_at+_dp)\8)
_et(_cx, nil, true)
end)
end
local _d1=_bp and _bp._ag
if _d1
and _d1._cr>=100
and _ei then
_be(_d1._b7,(cursor.x+_as)\8 *8,(cursor.y+_at)\8 *8, 1)
_gi(_d1)
_gr"61" end
end
_d2=false
elseif _dn and not _6 then
_bp,_d2=nil,false
end
::skip_collisions::
_d4,_d5,_d6=_dk,_bp,_2
t_+=1
end
function _d3(_cx)
del(_j,_cx)
if _cx.id==32 and #_o[_cx._bq][32]<=1 then
_d9=_g0(_cx._bq,6)
if(_d9) _d7(_d9)
end
end
function _d7(_d8)
local _ea=_be(_ah[32],_d8.x,_d8.y,_d8._ap,_d8)
_ea._cu=9
end
function _draw()
cls"15"
camera(_as+(16-rnd"32")*_a5, _at+(16-rnd"32")*_a5)
_a5=(_a5>0.05) and _a5*0.95 or 0
for i=1,#_a6 do
if(i!=#_a6 and i%2==1) fillp(0xa5a5.8)
circfill(
_a6[i][1]+4,_a6[i][2]+4,4,_a9[(i-#_a6)%3+1])
fillp()
end
if(_ba>0) spr(88+_ba\100, _dt, _du)
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
for building in all(_i) do
if not _6
then
if(t_%3==0) building:_cq()
if(building._ag) building._ag:_cq()
end
building:_an()
if(building==_bp) rect(_bp.x, _bp.y, _bp.x+_bp.w-1, _bp.y+_bp.h-1, 7)
end
pal()
for p=1,2 do
for _cx in all(_j) do
if(p==1 and _cx.z==1) or (p==2 and _cx.z>1) then
if(not _6) _cx:_cq()
if(_cx._ad!=2 or not _cx.moves) _cx:_an()
if(_cx==_bp) ?"\f7\^:42c300000000c342",_bp.x, _bp.y-_bp.z
end
end
end
pal()
for p in all(_n) do
if(p._ha) fillp(p._ha)
circfill(p.x,p.y,p.r,p._g9[ flr((#p._g9/p._hc)*p._cr)+1 ])
fillp()
end
local _eb,_ec=_as\8,_at\8
palt(0,false)
palt(11,true)
for xx=_eb-1,_eb+16 do
for yy=_ec-1,_ec+16 do
local gx,gy,_ed=xx*8,yy*8,_w[xx][yy]
if _ed!=0 and _ed!=16 then
spr(_ed+31,gx,gy)
elseif _ed<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
local _d1=_bp and _bp._ag
if _d1
and (_d1.type==5
and not _d1.moves)
and _d1._cr>=100 then
local _ee,_ef=(cursor.x+_as)\8, (cursor.y+_at)\8
local _eg,_eh,w,h=_ee*8-_as,_ef*8-_at,_d1._cd,_d1._ce
_ei,_ej,_bi=false,false,false
for xx=-1,w do
for yy=-1,h do
local _ak=_ff(_ee+xx, _ef+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(fget(_ak,4)) _ei=true
else
if(_ak>=12 and _ak<=21) _bi=true
if(_gc(_ee+xx,_ef+yy) or _ak==0 or _ak<=11 or _ak>=23) _ej=true
end
end
end
if(_ej and _d1._b7._bv!=22) _ei=false
fillp"0b1110110110110111.1" rectfill(_eg, _eh,_eg+_d1.w, _eh+_d1.h, _ei and 11 or 8)
fillp()
end
rectfill(0,0,127,8,9)
line(0,9,127,9,4)
_v-=1
?(_v>0 and _gh or _bp and _bp._bz or""),2,2,0
?sub("00000", #_ds).._ds, 103,2, _d
if hq!=_y then
_u=1
if _y then _gf"pOWER LOW. bUILD wINDTRAP" end
_gr"55" end
_y=hq
local _ek=5934
for _el=17152,17648,16 do
memcpy(0x6000+_ek, _el, 16)
_ek+=64
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
_bp.ico_obj:_c5(107,20)
_bp.ico_obj:_an()
_em,_en=nil,nil
if _bp._ap==1 then
if _d1 then
_d1:_c5(107,44)
_d1:_an()
end
if _bp._cr<_bp._b8
and _bp.is_repairable
and _bp.is_building then
_em=_b0(_ah[80], 115,28, 3, {}, nil, _aa, function()
_7(_d5, 2)
end)
_em:_an()
end
if(_bp.id==19
and _bp._c4<=0)
or _bp.id==35
then
_en=_b0(_ah[81], 107,29, 3, {}, nil, _aa, function()
if _d5.id!=35 then
_gf"pICK tARGET" _d2=true
else
local mx,my=_d5:_c7()
local _ak=_ff(mx,my)
if _ak>=12 and _ak<=22 then
_d5._cr=0
_d5=nil
_be(_ah[1],mx*8,my*8,1)
_gr"61" end
end
end)
_en:_an()
end
end
end
pal()
if _6 then
fillp(▒)
rectfill(unpack(split"0,0,127,127,0"))
fillp()
rectfill(3,22,124,96,_d)
rect(3,22,124,96,_c)
if _bp.build_objs then
_bp._eo={}
rectfill(unpack(split"6,25,27,93,0"))
local _ep=1
for i=1,#_bp.build_objs do
local _eq=_bp.build_objs[i]
if not _eq.req_id
or _o[_bp._bq][_eq.req_id]
and _eq.req_level<=_a
then
_bp._eo[_ep]=_eq
if _ep>=_1 and _ep<=_1+2 then
_eq:_c5(9,28+(_ep-_1)*20)
_eq:_an()
else
_eq.x=-16
end
_2=_2 or _bp._eo[1]
if _2==_eq then
_5=_ep
rect(_eq.x-2, _eq.y-2,_eq.x+17, _eq.y+17,7)
?"\^j87\-f\|e\^h\f7" .._2._bz.."\^jl8\-h\|h\f9cOST:" .._2._fw.."\n\|h\f6" .._2.description
end
_ep+=1
end
end
end
foreach(_3, function(c) c:_an() end)
end
palt(11,true)
cursor:_an()
end
function _er(x,y)
if x>=0 and x<=66 and y>=0 and y<=66
and _w[x][y]!=0 then
local _cj=0
if(_w[x][y-1]>0) _cj+=1
if(_w[x-1][y]>0) _cj+=2
if(_w[x+1][y]>0) _cj+=4
if(_w[x][y+1]>0) _cj+=8
_w[x][y]=1 + _cj
end
end
function _es(x,y)
return fget(_ff(x,y),7)
end
function _et(_cx, _eu, _ev)
_cx._cu,_cx.link,_cx._ew=_eu or 0,nil,true
if(_ev) _cx.gx,_cx.gy=_cx.x,_cx.y
_cx._cv=cocreate(function(self)
while true do
if self.z>1 then
_fj(self,mid(flr(self._ca+rnd"32")-16,64),mid(flr(self._cb+rnd"32")-16,64))
end
if self.id==34 then
_gp(self)
elseif _g2"250" and self._e6 and self._cu!=8 then
local gx,gy=self:_c7()
_fb(self,gx,gy,function (_cx,x,y)
local _cz=_gc(x,y)
if _cz!=null and _cz._bq!=_cx._bq and _w[x][y]==16 and _cz.z<=1 then
_e3(_cx,_cz)
return true
end
end,max(4,self.range))
end
local _b9=self._ex or self._b9
if self.id==32 then
self._bz="hARVESTER (" ..flr(self.capacity*0.0667).."%)"
if self._cu==0 or self._cu==9 then
if self.capacity<1500
and self._cu!=7 and self._cu!=9 then
self._ex=nil
local sx,sy
local tx,ty=self:_c7()
if _es(tx,ty) and not self._ey then
sx,sy=tx,ty
else
_fb(self,tx,ty,function(_cx,x,y)
if _es(x,y) and _g2"16" then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cx._ew=_fj(_cx,sx,sy,nil,not _cx._ew)
if not _cx._ew and not _g0(_cx._bq,33) then
self:_c5(_e1(self))
end
if(_es(_cx:_c7())) _cx._cu=6
end
elseif self.capacity >=1500
and self._cu<7 then
self.sx,self.sy=self:_c7()
_gn(self,_b9 or _g0(_cx._bq,6))
end
elseif self._cu==6 then
self._ey=false
_e2(_cx.x, _cx.y, _cx.r+.75+rnd".2" -.1)
local _ez=_cx:_c6()
self.capacity+=.5
_m[_ez]=(_m[_ez] or 1000)-1
if _m[_ez] <=0 then
local _bs,_bt=self:_c7()
for yy=-1,1 do
for xx=-1,1 do
_ak=_ff(_bs+xx,_bt+yy)
_fg(_bs+xx,_bt+yy,(xx==0 and yy==0) and 0 or ((_ak>1 and _ak<10) and 10 or _ak)
)
end
end
self._cu=0
end
if(self.capacity%300==0) self._ey=true self._cu=0
end
end
if self.id>26 then
if self._cu==9 then
if _b9._cr>0 and not _b9._e0 and self._cr>0 then
_b9._af,self._cu,self.r=false,8,.25
self:_c5(_b9.x+16,_b9.y+4)
self:_c8()
if self.capacity and _b9.id==6 then
_b9._e0=self
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
_z[self._ap]+=.5
if tonum(_ds)<_az then
_c9(2,self)
elseif self._ap==1 then
_gf"sPICE LOST. bUILD sILOS" end
end
yield()
end
self.capacity,_b9._e0,self._cu=0,nil,0
if self.sx then
_fj(self, self.sx, self.sy, 0, true)
else
self:_c5(_e1(self))
end
else
self._ad,self._c3,_b9.col_cycle_src,_b9._cf=2,0,8,_gv"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _e1(_cz)
local ux,uy=_fb(_cz,(_cz.x+8)\8, (_cz.y+8)\8, _fi, 99, true)
return ux*8,uy*8
end
function _e2(x,y,r)
if(_g2"5") _g7(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gv"2,4,9,15", 0xa5a5.8)
end
function _e3(_cx, _cz, _e4)
if _cx.id!=19 then
local _e5=_cx.range*5
_cx._cu,_cx._cz,_cx._cv=3,_cz,cocreate(function(self)
while _cz._cr>0 and _cz._cu!=8 do
if _g1(_cx.x,_cx.y,_cz.x,_cz.y) > _e5
and _cx.moves then
if not _e4 and _g1(_cx.x,_cx.y,_cx.gx,_cx.gy) > _e5 then
goto exit_attack
end
_fj(_cx,(_cz.x+rnd(_cz.w))\8,(_cz.y+rnd(_cz.h))\8,_e5)
if _cx._e6==1600 then
_cx._cr=0
for i=1,_cx.id/3 do
_db(_cx.x+rnd"32" -16,_cx.y+rnd"32" -16, 2)
end
_cz._cr-=(1000+rnd"600")
_cz._c0=_cx
return
end
end
if not _cx.norotate then
local a=atan2(_cx.x-_cz.x, _cx.y-_cz.y)
while (_cx.r !=a) do
_g4(_cx, a)
end
end
if _g1(_cx.x,_cx.y,_cz.x,_cz.y)<=_e5 then
if _e4 and _cz.capturable and _cx.can_capture and _cz._cr<=_cz._b8/3
then
_fj(_cx,_cz.x\8,_cz.y\8,0)
_e8(_cz, _cx)
if(_cz._e0) _e8(_cz._e0, _cx)
_cx._cr=0
elseif _cx._c4<=0 and not _cx._c1 and _cz._cr>0 then
_cx._bw(_cx)
_cx._c4=_cx.fire_rate
end
elseif not _cx.moves then
_et(_cx)
end
yield()
if(_cx.id==40 or _cx.id==34 or _cz._e7==_cx._e7 or _cz.link) break
end
::exit_attack::
if(not _e4) _fj(_cx,_cx.gx\8,_cx.gy\8)
_et(_cx)
end)
else
_e3(_be(_ah[({24,25,38,38.5})[_cx._e7]], _cx.x,_cx.y, _cx._ap, _cx), _cz)
_cx._c4=1750
end
end
function _e8(_e9, _fa)
_e9.old_fact_data,_e9._e7,_e9._ap,_e9._bq,_e9.col1,_e9._9
=
{_e9._e7,_e9._ap,_e9._bq,_e9.col1,_e9._9},_fa._e7,_fa._ap,_fa._bq,_fa.col1,_fa._9
end
function _fb(_cx,x,y,_fc,_fd,_fe)
for t=0,_fd or 4,.04 do
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
local _fm=_gc(x,y)
return not fget(_ff(x,y),0)
and (not _fm or _fm==_cx or (_fm.onfoot and _cx.tracked and _fm._bq!=_cx._bq))
end
function _fj(_cx,x,y,_fk,_fl,_eu)
local _fn=_cx.z>1
if _fl then
local _fo=_g0(_cx._bq,33)
if _fo and not _fo.link and _fo._e7==_cx._e7 then
_fo.link,_cx.link,_cx._cu, _fo._cv=_cx,_fo,2, cocreate(function(unit_c)
_fj(unit_c,_cx.x\8,_cx.y\8)
_cx:_c8()
if _cx._cr>0 then
_fo._bv=149
del(_j,_cx)
_fj(_fo,x,y)
_cx:_c5(_fo.x,_fo.y)
add(_j, _cx)
_et(_cx,_eu)
end
_fo._bv=73
_et(_fo)
end)
return
end
end
::restart_move_unit::
if not _fn and not _fi(_cx,x,y) then
x,y=_fb(_cx,x,y,_fi)
end
_cx.tx,_cx.ty,_cx.prev_state,_cx._cu,_cx._fp=x*8,y*8,_cx._cu,1,nil
local start, goal, _fr={ x=_cx.x\8, y=_cx.y\8}, {x=x, y=y}, function (_fq) return (_fq.y<<8) + _fq.x end
local _fz,_fs={
_ft=start,_fu=0,_fv=_g6(start, goal)
}, {}
_fs[_fr(start)]=_fz
local frontier, frontier_len, goal_id, max_number, count={_fz}, 1, _fr(goal), 32767.99, 0
while frontier_len > 0 do
local _fw=max_number
for i=1, frontier_len do
local _fx=frontier[i]._fu + frontier[i]._fv
if(_fx <=_fw) _fy,_fw=i,_fx
end
_fz=frontier[_fy]
frontier[_fy], _fz._f0=frontier[frontier_len], true
frontier_len -=1
local p=_fz._ft
if _fr(p)==goal_id then
p={goal}
while _fz._f5 do
_fz=_fs[_fr(_fz._f5)]
add(p, _fz._ft)
end
_cx._fp=p
goto end_pathfinding
end
local _f1={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx,ny=p.x+xx,p.y+yy
local _fm=_gc(nx,ny)
if(xx!=0 or yy!=0)
and _fn or not fget(_ff(nx,ny),0)
and _fi(_cx,nx,ny)
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_f1, {x=nx, y=ny})
end
end
end
for n in all(_f1) do
local id=_fr(n)
local _f2=not _fn and fget(_ff(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _f2+=.2
local _f4, _f3=
_fs[id],_fz._fu + _f2
if not _f4 then
_f4={
_ft=n,_fu=max_number,_fv=_g6(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fs[id]=_f4, _f4
end
if not _f4._f0 and _f4._fu > _f3 then
_f4._fu, _f4._f5=_f3, p
end
end
count+=1
yield()
if(count>3000 or stat"0" >1638) goto end_pathfinding
end
::end_pathfinding::
_cx.prev_state,_cx._cu=_cx._cu,2
if _cx._fp then
for i=#_cx._fp-1,1,-1 do
local _fq=_cx._fp[i]
local nx,ny,ux,uy=_fq.x,_fq.y,_cx.x,_cx.y
if not _cx.norotate then
local a=atan2(
ux-(nx*8),uy-(ny*8) )
while (_cx.r !=a) do
_g4(_cx, a)
end
end
if(not _fn and not _fi(_cx,nx,ny)) goto restart_move_unit
local _f6,_f7=_cx._gb or .5, sqrt((nx*8-ux)^2+(ny*8-uy)^2)
local _f8,_f9=_f6 * (nx*8-ux) / _f7, _f6 * (ny*8-uy) / _f7
local _ga=_gc(nx,ny)
if(_ga and _ga.onfoot and _cx.tracked) _ga._cr=0
for i=0, _f7/_f6-1 do
_k[nx.."," ..ny]=_cx
_cx.x+=_f8
_cx.y+=_f9
if _cx.id==33 then
if _cx.link then
local d=_g1(_cx.x,_cx.y,_cx.tx,_cx.ty)
if(d<32) _cx.z=d/4
end
_cx.z=mid(2,_cx.z+0.1,8)
_cx._gb=_cx.z/12
end
yield()
end
_cx:_c5(nx*8,ny*8)
_k[nx.."," ..ny]=_cx
_dd(_cx)
if(_g1(_cx.x,_cx.y,_cx.tx,_cx.ty) <=(_fk or 0)) break
end
else
_cx._cu=0
return false
end
_cx._cu=0
return true
end
function _gc(tx,ty)
return _k[tx.."," ..ty]
end
function _gd(x,_ge,_br,_w)
add(_3,{
x=x,y=85,w=_w or 22,h=8,_ge=_ge,_am=function(self)
return self
end,_an=function(self)
local c=self._gm and 7 or 6
if(#_ge>1)rectfill(x,85,x+self.w,93, c)
?_ge,x+2,87,#_ge>1 and 0 or c
end,_br=_br
})
end
function _gf(_gg)
_gh,_v=_gg,500
end
function _gi(_b6)
_b6._cr,_b6._ad,_b6.spent,_b6._c2=0,0,0,false
if(_b6._b3) _b6._b3._af=false
end
function _gj(_b6)
if(not _b6) return
local _gk,_gl=cursor:_am(),_b6:_am()
_b6._gm=_gk.x <=_gl.x + _gl.w and
_gk.x + _gk.w >=_gl.x and
_gk.y <=_gl.y + _gl.h and
_gk.y + _gk.h >=_gl.y
if _dl and _b6._gm then
if _6 then
_2=_b6
else
if(_b6.type<=2 and _w[(cursor.x+_as)\8][(cursor.y+_at)\8]==0 or _b6._cu==8) return
if _bp
and _d5
and (_b6.id==6 and _d5.id==32
or _b6.id==14 and _d5.id>26)
and _b6._ap==1 and _d5._ap==1
then
_gn(_d5,_b6)
return
else
_bp=_b6
end
end
_dz=true
end
end
function _gn(_cx,_d8)
local _d8,_go,_fl=_d8 or _g0(_cx._bq,1) or _cx
_cx._cu,_d8._af,_cx._ex=7,true,_d8
if(_cx.id!=32 or _d8.id==6) _cx._b9=_d8
_cx._cv=cocreate(function(_cx)
if(_d8.is_dockable) _go,_fl=9,true
_fj(_cx, (_d8.x+16)/8, _d8.y/8, 0, _fl, _go or 0)
if(not _cx.link) _et(_cx, _go)
end)
end
function _gp(_b6)
local _cz=rnd(_i)
if(_cz._bq!=_b6._bq and _gq(_cz)) _e3(_b6, _cz, true)
end
function _gq(_b6)
local x,y=_b6:_c7()
return _w[x][y]==16
end
function _gr(_gs)
sfx(_gs,3)
end
function _gt(_gu)
local _ak=peek(0x3115)
if(_ak & 128 > 0 !=_gu) _ak=_ak^^128
poke(0x3115, _ak)
end
function _gv(_gw,d,dd)
d=d or","
if(dd) _gw=split(_gw,dd)
if type(_gw)=="table" then
local t={}
while #_gw>0 do
local s=_gw[1]
add(t,split(s,d))
del(_gw,s)
end
return t
else
return split(_gw,d)
end
end
function _gx(_gy,_gz,_de)
if(not _gy[_gz]) _gy[_gz]={}
add(_gy[_gz],_de)
end
function _g0(_bq,id)
local _gy=_o[_bq][id]
if(_gy) return rnd(_gy)
end
function _g1(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _g2(_g3)
return rnd(_g3)<1
end
function _g4(_cx, _g5)
local _da=_g5-_cx.r
if(_cx.z>1) _cx.r=_g5
if _da > 0.5 then
_da -=1
elseif _da < -0.5 then
_da +=1
end
if _da > 0.0087 then
_cx.r +=0.0087
elseif _da < -0.0087 then
_cx.r -=0.0087
else
_cx.r=_g5
end
yield()
end
function _g6(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g7(x, y, r, dx, dy, dr, _g8, _cr, _g9, _ha)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cr=0,_g8=_g8,_g9=_g9, _ha=_ha,_hb=y, _hc=_cr }, 1)
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
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242550221200012210012100005
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240555000055000000500055555
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d555555555444444444444444444444444444444444444444444442155555555555555555555d555
bbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbddddddddbbbbbbbbbb0ee0bbbbbbbbbbbbbbbbbbbbbbbbbbb1000000bbbbbbb50000001bbbbbbbbb5000001b00000000
bbbbbbbbbb66669bbbbbbbbbbbbbbb51d555555515bbbbbbbb5c65bbbbbbbbbbbb676bbbbb676bbbb5b1b000bbbbbb10000b1b5b1bbbbbbbb1b1b1bb00000000
bbb777bbb66dd66bbd5bb5bbbbbbb5b0d55555550b5bbbbbbb0c60bbbbbbbbbbbbb7bbbbbbb7bbbbbb5b1b00bbbbb5b000b1b5bb01bbbbbbbb5b5bbb00000000
bb77994bb6d55d6bb5dbbbbbbbbbbb10d555555501bbbbbbbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbbbbb1b0bbbbbb100b1bbbbb0bbbbbbbbbbbbbbb00000000
bb79994bb6d55d6bbbbb555bbbbbb1b0d55555550b1bbbbbbbbc7bbbbbbbbbbb7e777e7bbb676bbbbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbb00000000
bb79944bb66dd66bbbbb5d5bbb5b1b00d555555500b1b5bbbb0cc0bbbbb5b5bbbbb7bbbbbbb7bbbbbbbbb5b0bbbbbb100b5bbbbb0bbbbbbbbbbbbbbb00000000
bbb444bbbb6666bbbbbb555bb5b1b000d5555555000b1b5bbb5dd5bbbb1b1b1bbbbcbbbbbbbcbbbbbbbbbb51bbbbbbb115bbbbbb01bbbbbbbbbbbbbb00000000
bbbbbbbbb9bbbbbbbbbbbbbbb1000000d55555550000001bbb0cc0bbb1000005bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bb0eee00bbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77debb0cecccebdeeedbbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cbbc066eccb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbbcceccccb6d7d6bbd4c455444444549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debbc066eccb6d4d6bb4a042499999442424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebb0ceccceb69996bb49029999c0994422229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0bb0eee00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a99442d1542425d44411114555224225ff2225
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbb11bbbbbdadbbbbbb77bbbd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d5555555bb1771bbbb666bbbc767767cd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55bb1661bbbbb6bbbbc767767cd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbbd7bbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5d5555555d5d1b115d6ddcdd551110001ddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc0556dd577765d5555ddd6dd0dd55d110001d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d55766116555c055d6dd15d1d1510c01d5558555b11dd11bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd57661bb155ee0ddd1ddd500155560d5d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad55550556d76101b105d5055d1111005dddd6d15d55aaa55b611116b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d576000b015d5055d111100111111105d5555555b7bd6b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5d600b015d6d555d511005555551015d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d55d1b1155d5d555d555555555555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d50477777b617405d4447ff7265557f6d195656565999959
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
d55776d7777716d6116d6105d500dcd76dcd0dd1b5e77e5bdddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110bec77ccbdddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005bee77ecbdddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555c767767cdddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c6055c767767cdddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055bee77ecb5555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076be5775cb55555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dbb6556bb55555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
05050505064400006800680042000d0d140405050506131014040505061344000068004200000000008565000000000000000011120000004940000d0d0d2f2f0000000405050505090909090500000000000000000a00000000000000000000000000000000000000110d0d14070600000000000000000a0505050508002d47
050505050a0000000000000000000405050505080505050505050505050600000000000000000000002400000012000000000042004200420000001404052f2f0000000505050509090909050500000000000000000000000000000000000000000000000000000000130d140000000000000000000000000000000000002d00
05050506858542004200650000000a050508110f120a050909050505050557858585858557000000002462000024000000001100000000000085850405052f2f12000405090505050909090505050600000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000002d57
0505050613850000000000000085000a081124242412050509090505050585242424242485120000002400000024000000005785858585858585040505052f2f140005090905050909050509090905000000000000000a0000110f0d0f12000000110f0d0f1200000000000000000000000000000b0b0b000000000000002d00
05050505068585858585858585851249113a00002424120a05050505050585243a00002485240000008585858585000000242410101010101404050505052f2f00000a05050a0505050505090905050600000000000000110f0d0d0d0d0d0000110d0d0d0d0d0f1200000000000000000000000b0b0b0b0b0000000000002d33
0a210505050613570d0d101024244000240000006200001205050505050885240000002485246e00242424242424242424240004050505050505050505052f2f00000000000000000000050509090505000000000000000d0d0d0d0d0d1400000c0d0d0d0d0d0d0d0f0f12000000000000000405060b0b0b0000000000002d00
0a0505050905062438140000130d0000240000000000002424120a08001185240000002485240000242414001324242424000405050505050505086800122f2f0000110f0d0f120000000a0509090905060000000000110d0d0d0d0d140000000c0d0d0d0d0d0d0d0d0d0d0f120000000004050505060b0b0b00000000002d34
00000005090508240d040507060c246e0085248524856000850e00000013578524242485572485850014040506856e2424000505050505050508110000242f2f110f0d0d0d0d0d1204060005090905050500000000000c0d0d0d1400000000000c0d0d0d0d0d0d0d0d0d0d0d0e000000040509090905060b0b0b000000002d00
0000000a050800240e050905051385000085858585850000850d120000000057858585570d101014000005050885242424000505050505050811440000242f2f0d0d0d1d0d0d0d140505050509090909050000000000130d14000000000000000c0d0d0d0d10100d0d0d0d1014000000050505090505050b0b0b0b0000002d35
00000000000000240e050509050a858585850d100d858585850d0d120000040505060c0d0e00000000000a081185858557000505050505081136000000242f2f0d1d0d0d0d0d14040505050505050909050000000000000000000011120000000c0d0d0d0e0000000000000000000000050505090905080b0b0b0b0000002d00
12000000000057570e05050508000c570d0e000000130d0d57240d0e0004050905050c0d0e000000000000110d0d0d0d0e00040505050885850d858585242f2f0d0d0d1010140405050509050509090505000011120000040506110d0d1200000c0d0d0d0e00000000000000000000000a05090905080b0b0b0b000000002d37
0e000000000057571405050500000c0d0d0e0000000013101024380d120a050909050c0d0e0000000000110d0d370d0d0d12000a37110f856000650000242f2f0d1014000004050909050505050509090506110d0e00040505050c0d0d0d0000130d0d0d0e0000000000000000000000000a050508000b0b0b00000000002d00
0d120000000004050505050500000c0d370e000000000000002424240d12050905080c0d0d12000000110d0d0d0d0d5724242412000a13850000000000242f2f1400000000000a05050800050505050508110d0d0e0005090905130d0d140000000c0d0d0d1200000000000000000000000000000000000b0b00000000002d36
0d0d1200000005090909050500000c0d0d0d12000000000000001324240e0a0508110d0d0d0d0f0f0f0d0d100d0d0d243a000024000000008585858585852f2f00000000000000000000000a05050508110d0d0d0e000509090505060000000000130d0d0d0d12000000000000000000000000000000000b0b00000000002d00
0d0d0d1200000a05090505050000130d0d0d0d12000000000000000c24240f1200000000130d0d0d0d14000000130d2400000024123700000013856200002f2f0000000000000000000000000000110f0d0d0d0d0e0005050934050500000000000000130d0d0d0f12000000000000000000000000000b0b0b0b0b0000002d32
0d0d0d0d12000005050505080000000c0d0d0d0e000000000000000c0d24240d120000000000130d1400000000001324000000240e0000000000850000002f2f0000000000000000000000000015100d0d0d0d0d0e00000a05050508340000340000000000130d101407000000000000000000000000000b0b0b000004052d00
0d0d0d0d0e00000a080000000000000c0d0d0d1400000020000000130d0d24240e00000000000000000000000000005724242424240000000000242424242f2f000000000000000000000000000000130d0d0d0d0d1200000a0508000037000000000000040505050505050506000000000000000000000b0b0b040505052d49
0d0d10100e000000000000000000000c0d0d1400000000000000000000130d240d120000000000000000200000000000000024400049000037000c246e242f2f00000000000000000000110f0000000000000c343434120000003400000038383838380005050509090905050500000000000000000000000000050909092d00
0d14040505062100000000000000000c0d140000000000000000000000000c240d0e0000000000000000000000000000000024000000000000000c2424242f2f000405050600000000110d0d0000000000000c0d0d0d0d12000000110f0f0f0d0d14000405050909050505050800000000000000002000000000050909092d95
0e04050905050506000000000000001314000000000000000000000000001357570e000000000000000000000000040506000c242400000000000c8585852f2f0005090505060000000c0d0d1200000000000c3636363d0d0d8547855785478557000000000000050509051112000000000000000000000000000a0505092d00
0e05090905050505000000000000000000000000000000000000000000000057570e00000000000000000000000a050505002442000000000000131057372f2f0005050905050000000c0d0d0d00000020000c0d0d0d0d0d0d420d420d012238850000000000000a0505080c0e00000000000000000000000000110e05092d28
0e0a05050505050800000000000000000000000000000000000000000000110d0d140000000000000000000505050509050057000012000000150000000d2f2f0005090909050000000c0d0d0d12000000110d3838380d0d0d0d0d0d0d22220d85000000000000000000000c0d12000000000000000000000000000405052d00
0d0f0f120a000000000000000000000004050600000000000000000000110d0d14000000000000110f0d0f120509050505002457440000240e00000000132f2f0005090909050000000c0d0d0d0d0f0f0f0d0d0d0d0d0d600d830d6a0d38440d0e000000000000000000000c0d0d0f1200000000000000000000000a05082d29
0d0d0d0e00000000000000000000040505050500000000000a00110f0f0d0d14000000000000000c0d0d0d0e0509090905001324000000240000000000002f2f0a05050505080000000c0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d0d0d0d0d0d0e0000000000000000000013100d0d0d12000000000000000000000000002d00
1010101400000000000000000405050909090500000000000000130d10101400000000000000000c0d0d1014050509050800000c140000000000000000002f2f0000000000000000000c0d0d0d0d0d1014000000000c0d680d0d100d1038620d0e000000000000000000000000130d0d0e000000000000000000000000002d26
0000000000000000000000000509090905050506000000070000000000000000000000000000000c0d1400040505050800000000000000000000000000002f2f0000000000000000000c0d0d0d0d14000000000000130d0d0d14000049130d0d0e00000000000000000000000406130d0e000000000000000000000000002d00
0000000000000000000000000a05090905080b0b000000050000000000000000000000000000110d140000000a050800000000000a0000040506000000002f2f000000000000000000130d0d0d1400000000000000000c0d140000000000130d14000000000000110e040505050506130d0f1200000000000000000000002d39
000000000000000000000000000a0505080b0b0b000000050600000000000000000000110d0d0d0e000000000000000000000000000405050505050506002f2f00110f0e0000000000001310140000000000000000001314000000000000000004050a0000000000000509050505050506130d0e000000000000000000002d00
0000000000000000000000000000000b0b0b0000000000000000000000000000000000130d0d0d14000004050505060000000000000005090905050505062f2f00000000000000000000000000000000000000000000000000000000000005050505050600000000040509090509090905000000000000000000000000002d38
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000005050505000000000a00000a050909090909052f2f0000000000000000000000000000000000000000000000000004050507000a050505080b0b000000050505050505050508000004050505060000000000002d00
0000000000000000040505060000000000000000000000000000000000000000000000000000000000040505050508110f0e0000000000050505050905082f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f48
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

