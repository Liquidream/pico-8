pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================
cartdata"pn_undune2"
_a,_b,_c,_d,_e,_f,_g=dget"0",dget"1",dget"7",dget"8",dget"26",{},{
dget"35",
dget"35",
dget"36"
}
for i=1,dget"5" do
local _h={}
for j=1,5 do
_h[j]=dget(i*5+j)
end
add(_f,_h)
end
g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,hq,_u,_v,_w,_x={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,0,{},_e*8-128
_y,_z=hq,{0,0}
_0={}
g_._4=function(self)
_1,_2,_3=1,nil,{}
_f5(6,"⬆️",function()
_5=mid(1,_5-1,#_bm._eq)
_2=_bm._eq[_5]
if(_5<_1) _1-=1
end, 10)
_f5(17,"⬇️",function()
local _6=#_bm._eq
_5=mid(1,_5+1,_6)
_2=_bm._eq[_5]
if(_5>_1+2) _1=min(_1+1,_6-2)
end, 10)
_f5(32,"build",function()
_7=nil
_d7:_bn()
end)
_f5(96,"close",function()
_7=nil
end)
_7=self
end
g_._ac=function(self)
local _aa=self._aa
pal{
[8]=_aa,[10]=_aa,[11]=_aa,[12]=self.col1,[14]=_aa
}
if self._ag then
pal(self._b9[self._ad], self.col1)
else
pal(11,self.col1)
self._ad=1
end
end
_ab=function(self)
pal(7,8)
if(self.id==80 and _bm._ae==2 and not _bm._af) pal(7,11)
end
function _8(self, _9)
self._cx,self.last_process,self._ae=0,self._ae,_9
if(self._cm>=0 and self.last_process>0) self._af=not self._af
if(_9==1) self._by._ag=true self._by._ah=self
end
_ai=[[id|_av|ico_spr|type|w|h|z|trans_col|_bk|_bl|_aq|col1|_aa|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_fs|power|_e4|_b3|_f4|range|_ci|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|_cm|_cs|_ae|spent|_cy|_ck|_cn|_ad|col_cycle_src|storage|capacity|repairable_unit|ai_build|moves|_b9|_cz|description|_b0|_bn
1|64|170|2|2|2|0||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||cONSTRUCTION yARD|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||_4
2|22|162|2|2|2|0||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||lARGE cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
3|22|162|2|1|1|0||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||sMALL cONCRETE sLAB|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||
4|133|164|2|1|1|0||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||dEFENSIVE wALL|tHE wALL IS USED FOR~PASSIVE DEFENSE.||
5|66|172|2|2|2|0||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||1|0|0|0|0|0|0|1|1|11|0|nil|nil|nil|nil|0,0,0,0,0,0,0,0,1,13,12,12,12,12,12,12,12,12,12,12,13,1|wINDTRAP|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||
6|68|174|2|3|2|0||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||2|0|0|0|0|0|0|1|1|11|1000|nil|nil|nil|nil|11,10,8,8|sPICE rEFINERY|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ac|
7|106|136|2|2|2|0||1|||||||2|2|5|2|||400|30|0|2000|0|||||53|||1|0|0|0|0|0|0|1|1|11|0|nil|nil|nil|nil|8,0,8,0,0,0|rADAR oUTPOST|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||
8|104|134|2|2|2|0||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000|nil|nil|nil|nil||sPICE sTORAGE sILO|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||
9|108|168|2|2|2|0||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||bARRACKS|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||_4
10|110|138|2|2|2|0||1|||||||2|2|7|2|||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||wor tROOPER fACILITY|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||_4
11|96|140|2|2|2|0||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||lIGHT vEHICLE fACTORY|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||_4
12|98|142|2|3|2|0||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||hEAVY vEHICLE fACTORY|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||_4
13|101|166|2|3|2|0||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||hI-tECH fACTORY|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||_4
14|128|230|2|3|2|0||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||0|0|0|0|0|0|0|1|1|8|0|nil|nil|nil|nil|0|rEPAIR fACILITY|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||
15|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|80|800|0|5|1|27|58|53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||cANNON tURRET|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||
16|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|240|800|0|10|2|40|59|53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||rOCKET tURRET|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||
17|61|228|2|3|3|0||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||2|0|0|0|0|0|0|1|1|11|0|nil|nil|nil|nil|11,10,8,8|sTARPORT|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|_ac|_4
18|131|224|2|2|2|0||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||hOUSE OF ix|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||
19|58|226|2|3|3|0||1|||||||2|2|17|8||1|999|80|0|4000|0|||2,400||53||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||pALACE|tHIS IS YOUR pALACE.||
20|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||24|80|0.05|3|1|15|60|57|1|48|10|0|0|0|0|0|0|1|1||0|nil|nil|1|1||iNFANTRY sOLDIER|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
21|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|3|1|15|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil|nil|1|1||lIGHT iNFANTRY sQUAD|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||
22|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|7|2|17|59|57|1|48|10|0|0|0|0|0|0|1|1||0|nil|nil|1|1||hEAVY tROOPER|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
23|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|7|2|17|59|57|1|49|10|0|0|0|0|0|0|1|1||0|nil|nil|1|1||hEAVY tROOPERS|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||
24|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|440|0.1|4|1|17|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil|nil|nil|1||fREMEN|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||
25|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||1600|40|0.4|1|1|800|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil|nil|nil|1||sABOTEUR|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||
26|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||64|440|0.1|2|2|17|59|57||||0|0|0|0|0|0|1|1||0|nil|nil|nil|1||sARDAUKAR|tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||
27|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|4|1|17|60|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||tRIKE|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||
28|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||56|520|0.5|4|1|17|60|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||qUAD|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||
29|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||100|800|0.25|5|1|27|58|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||cOMBAT tANK|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||
30|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||240|1200|0.2|6|1|30|58|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||sIEGE tANK|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||
31|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||600|400|0.3|10|2|40|59|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||rOCKET lAUNCHER|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||
32|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||nil|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|0|1|1|1||hARVESTER|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||
33|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||nil|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0|nil|nil|nil|1||cARRYALL|tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||
34|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||296|4|1|10|2|33|59|54||41|5|0|0|0|0|0|0|1|1||0|nil|nil|1|1||oRNITHOPTER|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||
35|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||nil|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|nil|1|nil|1||mcv|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||
36|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||240|440|0.3|9|3|27|52|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||sONIC tANK|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||
37|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||320|1600|0.1|8|1|33|58|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||dEVASTATOR|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||
38|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||1600|40|1|0|20|800|59|54||||0|0|0|0|0|0|1|1||0|nil|nil|0|1||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
38.5|72||1|1|1|8|11|||0|||||2|2|13|8|4||0||1600|40|1|0|20|800|59|54||||0|0|0|0|0|0|1|1||0|nil|nil|nil|1||dEATH hAND|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||
39|51|204|1|1|1|1|11|11|||||11|1|2|2||2|2||150||40|320|0.75|4|1|17|60|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||rAIDER|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||
40|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||0|480|0.3|9|1.9|60|59|54||||0|0|0|0|0|0|1|1||0|nil|1|1|1||dEVIATOR|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||
41|88||9|1|1|1|11||||||||2|2||3|||0||300|4000|0.35|0|30|7|50|||||0|0|0|0|0|0|1|1||0|nil|nil|nil|1||sANDWORM|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||
42|32||1|1|1|1|11|||2|||||1|1|||||||nil|4|0.1|||||53|1|||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||sPICE bLOOM|||
80|3|3|5|1|1|0|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||rEPAIR||_ab|action_click
81|1|1|5|1|1|0|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|nil|nil|nil||lAUNCH||_ab|action_click]]
function _init()
poke(0x5f2d, 0x5)
local _aj=_gn(_ai,"|","\n")
_ai={}
for i=2,46 do
local _ak={}
for j=1,53 do
local _al=_aj[i][j]
if(j<49) _al=tonum(_al)
if j==51 then
_am,_al=_gn(_al,"~"),"" for line in all(_am) do
_al..="\n" ..line
end
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
x=self.x+(_d1 and 0 or _at),y=self.y+(_d1 and 0 or _au),w=0,h=0
}
end,_ao=function(self)
local _ap=(_bm and _bm.type==1 and _bm._aq==1 or _d3) and 3 or 0
spr(_ap/3, self.x-_ap, self.y-_ap)
end
}
for my=0,31 do
for mx=0,127 do
local _ar,_as=nil,mget(mx,my)
if(_as==1) _at,_au,_ar=_f[1][4]-56,_f[1][5]-56,_ai[1]
for o in all(_ai) do
if(o._av!=nil and o._av==_as) _ar=o break
end
if _ar!=nil and (_as==1 or _as>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_fa(mx,my+1))
_ba(_ar, ox*8, oy*8)
end
end
end
_aw=cocreate(function()
while true do
if t_%30==0 then
_gl(false)
_k={}
for _cr in all(_j) do
_k[_cr:_c1()]=_cr
end
_ax={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ay=_fa(i,l)*8
if(_w[i][l]==16) _ax[(i/2).."," ..(l/2)]=_ay>0 and sget(_ay%128+3, _ay\8\16*8+3) or 15
end
yield()
end
end
_az,_a0,_a1,_a2,_o=0,0,false,{0,0},{{},{}}
for building in all(_i) do
if building.id!=4 then
if building._aq==1 or (hq and _gi(building)) then
_ax[(building.x\2\8).."," ..building.y\2\8]=building.col1
end
if building._aq==1 then
_az -=building.power
if(building.id==7) _a1=true
_a0+=building.storage
end
_a2[building._aq]+=1
_gp(_o[building.created_by], building.id, building)
end
end
for _cr in all(_j) do
if hq and (_cr._aq==1 or _gi(_cr) and _cr.z==1) then
_ax[(_cr.x\2\8).."," .._cr.y\2\8]=_cr.col1
end
if(_cr.created_by>0) _gp(_o[_cr.created_by], _cr.id, _cr)
end
hq,_l=_a1 and _az>0,_ax
local _a3,_a4=0
for yy=0,31 do
for xx=0,31 do
local _al=_l[xx.."," ..yy] or 0
if xx%2==0 then
_a4=_al
else
_a4|=_al<<4 poke(0x4300+_a3,_a4) _a4=0 _a3+=1
end
end
if(yy%2==0) yield()
end
if(_g[3]>0 and _g[1]>_g[3]) _a5=1
if(_a2[2]==0 and _a>1) _a5=2
if(_a2[1]==0) _a5=3
if _a5 then
local _a6=40
for data in all{_a5,t()-_p,_z[1],_z[2],_r[1],_r[2],_q[1],_q[2]} do
dset(_a6, data)
_a6+=1
end
rectfill(30,54,104,70,0)
?"mission " ..(_a5<3 and"complete" or"failed"),36,60,_c
flip()
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _bc=0
end
function _a7(_a8,_a9)
local _bd=_a8.req_faction
return not _bd
or (_bd>0 and _bd==_a9)
or (_bd<0 and -_a9!=_bd)
end
function _ba(_ar, x,y, _aq, _bb)
local _be=_bv(_ar, x,y, _ar.type, nil, g_[_ar._bz], g_[_ar._b0], nil)
_be.ico_obj,_be._cm,_bf,_be._aq=_bv(_ar, 107,0, 3, _be, nil, nil, g_[_ar._bn]), _bf and _ar._b3/2 or _ar._b3, false, _be._aq or _aq
if _bb then
_be._bg=_bb._bg
else
if _be._aq then
_be._bg,_h=1,_f[1]
else
local _bh=9999
for i=1,#_f do
local _bi=_gt(x,y,_f[i][4],_f[i][5])
if(_bi<_bh) _be._bg,_be._aq,_bh=i,min(i,2),_bi
end
end
end
_be.created_by,_be.build_objs,_h=_aq or _be._aq,{},_f[_be._bg or _bb._bg]
_bj=_h[1]
_be._e5,_be.col1,_be._aa=_bj,_h[2],_h[3]
if(not _a7(_be,_bj)) return
for o in all(_ai) do
if o._bk!=nil
and (o._bk==_be.id or o._bl==_be.id)
and _a7(o,_bj)
then
add(_be.build_objs,_bv(o, 107,0, 4, _be, nil, nil, function(self)
if _7 then
_bm=self
else
_8(self, 1)
end
end)
)
end
end
if _be._aq>1 then
_be.ico_obj._bn=nil
end
if _ar.col1 then
_be.col1,_be._aa=_ar.col1,_ar._aa
end
if(_be.z>1) _be._aq=0
local _bo,_bp=x\8,y\8
if _ar.type==2 then
local _bq=_ar._av==22
for xx=0,_ar.w-1 do
for yy=0,_ar.h-1 do
local _al=_fa(_bo+xx, _bp+yy)
if not _bq or (_al>=12 and _al<=21) then
_fb(_bo+xx, _bp+yy, _bq and 22 or _be._aq==1 and 81 or 103)
end
end
end
if(not _bq) add(_i,_be)
if _be.id==6 and not _be._by then
_d8(_be)
end
else
_be.r=_be.norotate!=1 and (_bo%8)*.125
if _be._e4 then
_be._br=function(self)
self._co,self._cv,self.bullet_y,self.bullet_tx,self._bs=4,self.x+4,self.y+4,self._ct.x+self._ct.w/2,self._ct.y+self._ct.h/2
local dx,dy=self.bullet_tx-self._cv,self._bs-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bt=(dx/d)*2,(dy/d)*2
_gj(self.fire_sfx)
_c7(self)
end
if(not _be.moves) _fb(_bo,_bp,_be._aq==1 and 22 or 36)
end
if(_bb and _bb.id==6) _be._bu=_bb
add(_j,_be)
_et(_be)
end
_c7(_be)
return _be
end
function _bv(_bw, x,y, _bx, _by, _bz, _b0, _bn)
local _b1={
_b2=_bw,id=_bw.id,_b3=_bw._b3,x=x,y=y,z=_bw.z,
_b4=x/8,_b5=y/8,type=_bx,_by=_by,_bn=_bn,w=_bw.w*8,
h=_bw.h*8,_b6=_bw._av,_b7=_bw.w,
_b8=_bw.h,
_b9=_gn(_bw._b9),_an=function(self)
return {
x=self.x,y=self.y-self.z,w=(self.type>2 and self.type<5 and 16 or self.w),h=(self.type>2 and self.type<5 and 16 or self.h)
}
end,_ao=function(self)
local x=self.x
local y=self.y
local ty=self.type
if ty>2
or (x+self.w>=_at
and x<=_at+127
and y+self.h>=_au
and y<_au+127+self.z)
then
pal()
palt(0,false)
if(self.trans_col and ty<=2 or ty>=5) palt(self.trans_col,true)
if(self._e5 and self.id!=18) pal(12,self.col1) pal(14,self._aa)
if ty>2 and ty<5 then
local _ca=ty==4 and self or self._by
rectfill(x-1,y-1,x+16,y+19,0)
local hp=_ca._b3
local _al=self._ae==1 and _ca._cm/6.666 or 15*(_ca._cm/hp)
if(_ca._cm>0 and not _7) rectfill(x,y+17,x+_al,y+18, self._ae==1 and 12 or (split"8,10,11,11")[_ca._cm\(hp/3)+1])
pal(11,_ca.icol1) pal(3,_ca.icol2)
end
if self._b9 then
pal(self.col_cycle_src, self._b9[self._ad])
end
if(_b0) _b0(self)
if self.r then
if not self._cq or self._cq>.025 then
local ca,sa=cos(.25-self.r),sin(.25-self.r)
local _cb,_cc,_cd=ca,sa,0xfff8
ca*=4-.5
sa*=4-.5
local _ce,_cf=sa-ca+4,-ca-sa+4
for ix=0,7 do
local _cg,_ch=_ce,_cf
for iy=0,7 do
if((_cg|_ch) & _cd)==0 then
local c=sget(self._av%16*8+_cg,self._av\16*8+_ch)
if c!=self.trans_col then
if(self.z) pset(x+ix,y+iy, 1)
pset(x+ix,y+iy-self.z, flr(self._cn)%2==0 and 7 or nil or c)
end
end
_cg-=_cc
_ch+=_cb
end
_ce+=_cb
_cf+=_cc
end
end
else
if ty>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
else
spr(self._av, self.x, self.y, self._b7, self._b8)
end
end
if self._cv then
if self._ci==1 then
pset(self._cv,self.bullet_y, _gu"2" and 8 or 9)
else
local _cj=self._ci<=2
_gz(
self._cv, self.bullet_y,_cj and 1.9 or 0,0, 0, _cj and -.3 or 1,0,_cj and 10 or 2.5,_cj and _gn"7,10,9,8,2" or {15},_gu"2" and 0xa5a5.8 or 0)
end
end
if(self._cm<self._b3*.33 and not self.altframe and _gu"10" and ty<=2) _gz(self.x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,_gn"10,8,9,6", _gu"2" and 0xa5a5.8 or 0)
self._ck=0
end
end,_cl=function(self)
local _cm,ty,id=self._cm,self.type,self.id
self._cn=max(self._cn-.4,1)
if self._ck>0 and self.created_by>0 and id!=42 then
_0[self._e5]=true
_gl(true)
if(stat"54" >5) music"0"
if(self._e4 and self._co==0) _e2(self, self._cu)
if(self._av<=49 and _cm<100) self._b7,self._b8=0.5,0.5
if(self.repairable_unit and _cm<75 and self._co<=6) _gf(self,_gs(_o[self.created_by][14]) or self._bu)
end
if(ty<=2 and _cm<=0 and not self._cq) self._co=5 self._cp=nil self._cq=.25 _gj(self.death_sfx) _bc+=(ty==2 or self.id==38) and .25 or 0
if self._cq then
self._cq-=.025
if self._cq<0 then
if ty==2 then
for xx=0,self._b7-1 do
for yy=0,self._b8-1 do
_fb(self.x/8+xx, self.y/8+yy, 21)
end
end
del(_i,self)
_q[self._cu.created_by]+=1
else
local gx,gy=self:_c2()
if(_fa(gx,gy)<9) _fb(gx,gy,33)
if(id<=16) _fb(gx,gy,21)
if(self._bu) self._bu._ag=false
if(self._ew) self._ew._b9={0}
_d4(self)
if id==42 then
_e6(self,gx,gy,function (_cr,x,y)
if(_fa(x,y)==0) _fb(x,y,10)
end,4, true)
end
if(self._cu) _r[self._cu.created_by]+=1
end
if(_bm==self) _bm=nil
else
if(_gu(ty==2 and 1 or 8)) _c5(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self.framecount!=nil then
self._cs+=1
if self._cs > self.framecount then
self._cs=0
if self.altframe
and self._co==2 then
self._av=self._b6+(self.altframe-self._av)
end
if self._b9 then
self._ad+=1
if(self._ad>#self._b9) self._ad=1
end
end
end
if self._cv then
self._cv+=self.bullet_dx
self.bullet_y+=self._bt
if _gt(
self._cv,self.bullet_y,self.bullet_tx,self._bs) < 2
then
_c5(self._cv, self.bullet_y, self._ci)
local _ct=self._ct
if _gt(
self._cv,self.bullet_y,_ct.x+_ct.w/2,_ct.y+_ct.h/2) < 4
then
_ct._cm-=self._e4*rnd"1"
_ct._ck,_ct._cu=self._ci,self
if id==40 and _ct.moves and _gu"5" then
_ct.old_fact_data,_ct._e5,_ct._aq,_ct.created_by,_ct.col1,_ct._aa
=
{_ct._e5,_ct._aq,_ct.created_by,_ct.col1,_ct._aa},self._e5,self._aq,self.created_by,self.col1,self._aa
_et(self)
elseif _ct.old_fact_data then
_ct.old_fact_data,_ct._e5,_ct._aq,_ct.created_by,_ct.col1,_ct._aa
=
nil,unpack(_ct.old_fact_data)
_et(_ct)
end
end
self._cv=nil
end
end
if self._ae>0
and not self._af
and not self._cw then
if self._ae==1 and self.spent>self._fs then
self._cw=true
if(self._by._aq==1) _gj"56" _f7"cONSTRUCTION cOMPLETE"
if self._b2.type==1
and self._bk !=1 then
local ux,uy=_e0(self._by)
_ba(self._b2,ux,uy,self._by._aq,self._by)
_ga(self)
end
elseif self._ae==2 and _cm>self._b3 then
self._ae=0
if ty==1 and self.moves then
self._ew._b9,self._co={0},0
self.x,self.y=_e0(self)
end
else
if self._cx>(self._ae==1 and 3 or 100) then
if(_c3(-1,self._ae==1 and self._by or self)) self._cx=0 self.spent+=1
else
self._cx+=1
self._cm=(self._ae==1 and (self.spent/self._fs)*100 or _cm+(self._b2.type==1 and .5 or 3))
end
end
end
self._cy=max(self._cy-.1)
if self._aq==1 then
if(id==5) self._cz="wINDTRAP (∧" .._az..")"
if(self.storage>0) self._cz=self._b2._cz.." (" ..flr(_dm/_a0*100).."%)" end
end,_c0=function(self,x,y)
self.x,self.y=x,y
end,_c1=function(self)
local x,y=self:_c2()
return x.."," ..y
end,_c2=function(self)
return self.x\8,self.y\8
end
}
for k,v in pairs(_bw) do
if not _b1[k] and v!="" then
_b1[k]=v
end
end
return _b1
end
function _c3(_c4, _b1)
if(_g[_b1._aq]+_c4<0) return false
_g[_b1._aq]+=_c4
if(_b1._aq==1) sfx"63" return true
end
function _c5(x,y,_c6)
_gz(x, y, 2,0, 0, .1, -.01, _c6==1 and 5 or 20, _c6==1.9 and _gn"3,11,3" or _gn"5,7,5,7,10,8,9,2", _gu"2" and 0xa5a5.8)
end
function _c7(_c8)
if(_c8._aq!=1 and _c8._co!=4) return
local _c9=_c8.type+1
for xx=-_c9,_c9 do
for yy=-_c9,_c9 do
local _da,_db=_c8.x\8+xx,_c8.y\8+yy
_w[_da][_db]=16
_er(_da,_db)
for dy=-1,1 do
for dx=-1,1 do
_er(_da+dx,_db+dy)
end
end
end
end
end
function _update60()
_dc,_dd,_de=stat"32",stat"33",stat"34" _df,_dg,_dh=(_de==1 and _d5 !=_de) or btnp"5", (_de>0) or btn"5", (_de==2 and _d5 !=_de) or btnp"4"
if _di==nil then
_di,_dj=64,64
elseif _dc==_dk and _dd==_dl then
b=btn()
_di+=b\2%2-b%2
_dj+=b\8%2-b\4%2
else
_di,_dj=_dc,_dd
end
_di,_dj=mid(_di,127),mid(_dj,127)
cursor.x,cursor.y,_dk,_dl=_di,_dj,_dc,_dd
if not _7 then
if(_di<2) _at-=2
if(_di>125) _at+=2
if(_dj<2) _au-=2
if(_dj>125) _au+=2
_at,_au,_dm=mid(_at,_x),mid(-10,_au,_x),tostr(_g[1])
for _cr in all(_j) do
if(_cr._cp) _dn=coresume(_cr._cp, _cr)
if(not _dn) _cr._cp=nil
if _ds
and fget(_fa(_cr:_c2()),2)
and _gt(_dy,_dz,_cr.x,_cr.y) < 1
and _cr.z==1
then
_d4(_cr)
_do=1
_gj"50" end
end
for p in all(_n) do
p.dy +=p._g0
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._cm +=1
if(p._cm>=p._g4) del(_n,p)
end
if t()%_b==0 then
for i=1,4 do
local _dp=rnd(_j)
if _dp._aq==2 and _0[_dp._e5] and _dp._e4 and _dp._co==0 then
_gh(_dp)
end
end
local _dq=rnd(_i)
if _dq._aq==2
and (not _dq._ah or _dq._ah._ae!=1)
and #_j<95
then
local u=rnd(_dq.build_objs)
if u and u.ai_build then
u:_bn()
end
if _dq._cm<_dq._b3 and _dq._ae!=2 then
_8(_dq, 2)
end
local _dr=_gs(_o[2][19])
if _dr
and _0[_dr._e5]
and _dr._cy<=0
then
_gh(_dr)
end
end
end
_dx-=1
if _dx<0 then
if _ds then
_ds=nil
else
_ds,_dt,_du,_dv,_do={{rnd"500",rnd"500" }},rnd"1",0,_gn"15,9,4",0
end
_dw=rnd"5000" _dx=_dw
end
if _ds then
if(t_%6<1 or #_ds<30) and _do==0 then
while #_ds<31 do
if(_gu"18") _du=rnd".04" -.02
_dy,_dz=_ds[#_ds][1],_ds[#_ds][2]
add(_ds,{_dy+sin(_dt),_dz-cos(_dt)})
_dt+=_du
end
end
if(#_ds>30) del(_ds,_ds[1])
if(_do>0) _do+=1 _e1(_dy,_dz,rnd"1")
_do%=200
end
assert(coresume(_aw))
end
_d0=false
if _bm then
_d1=true
_gb(_eg)
_gb(_eh)
if(_bm.ico_obj and not _7 and not _d0) _gb(_bm.ico_obj) _gb(_bm._ah)
if(_7) foreach(_bm.build_objs, _gb) foreach(_3, _gb)
_d1=false
end
if not _7
and not _d0 then
foreach(_j, _gb)
foreach(_i, _gb)
end
if _dg
and not _7
and _di>91 and _di<123
and _dj>91 and _dj<123 then
_at,_au=mid((_di-96)*16, _x),mid(-10,(_dj-97)*16, _x)
_bm=_d6
elseif _df then
if _d0 then
if(_bm) _v=0
if not _7 and _bm._by!=nil then
if(_bm._bn) _bm:_bn()
_bm=_d6
goto skip_collisions
end
if(_7 and _2._f6 and _2._bn) _2:_bn()
if(_bm._aq==1 and _bm.type==1 and _bm!=_d6 and _bm.moves) _gj"62"
if(_bm.created_by!=1 and _d6 and (_d6.type==1 or (_d6.id==19 and _d3)) and _d6._aq==1) _bm._cn=10 _e2(_d6, _bm) _bm=nil
else
if _bm
and _bm._aq==1
and _bm.moves
and _bm._co!=7 then
_bm._cp=cocreate(function(_cr)
_fe(_cr, (_at+_di)\8, (_au+_dj)\8)
_et(_cr)
end)
end
local _d2=_bm and _bm._ah
if _d2
and _d2._cm>=100
and _em then
_ba(_d2._b2,(cursor.x+_at)\8 *8,(cursor.y+_au)\8 *8, 1)
_ga(_d2)
_gj"61" end
end
_d3=false
elseif _dh and not _7 then
_bm,_d3=nil,false
end
::skip_collisions::
_d5,_d6,_d7=_de,_bm,_2
t_+=1
end
function _d4(_cr)
del(_j,_cr)
if _cr.id==32 and #_o[_cr.created_by][32]<=1 then
_ea=_gs(_o[_cr.created_by][6])
if(_ea) _d8(_ea)
end
end
function _d8(_d9)
local _eb=_ba(_ai[32],_d9.x,_d9.y,_d9._aq,_d9)
_eb._co=9
end
function _draw()
cls"15"
camera(_at+(16-rnd"32")*_bc, _au+(16-rnd"32")*_bc)
_bc=(_bc>0.05) and _bc*0.95 or 0
if _ds then
for i=1,#_ds do
if(i%2==1) fillp(0xa5a5.8)
circfill(
_ds[i][1]+4,_ds[i][2]+4,4,_dv[i%#_dv+1])
fillp()
end
if(_do>0) spr(88+_do\100, _dy, _dz)
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
for building in all(_i) do
if not _7
then
if(t_%6==0) building:_cl()
if(building._ah) building._ah:_cl()
end
building:_ao()
if(building==_bm) rect(_bm.x, _bm.y, _bm.x+_bm.w-1, _bm.y+_bm.h-1, 7)
end
pal()
for p=1,2 do
for _cr in all(_j) do
if(p==1 and _cr.z==1) or (p==2 and _cr.z>1) then
if(not _7) _cr:_cl()
if(_cr._ae!=2 or not _cr.moves) _cr:_ao()
if(_cr==_bm) spr(2, _bm.x, _bm.y-_bm.z)
end
end
end
for p in all(_n) do
if(p._g2) fillp(p._g2)
circfill(p.x,p.y,p.r,p._g1[ flr((#p._g1/p._g4)*p._cm)+1 ])
fillp()
end
local _ec,_ed=_at\8,_au\8
palt(0,false)
palt(11,true)
for xx=_ec-1,_ec+16 do
for yy=_ed-1,_ed+16 do
local gx,gy=xx*8,yy*8
if _w[xx][yy]!=0 and _w[xx][yy]!=16 then
spr(_w[xx][yy]+31,gx,gy)
elseif _w[xx][yy]<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
rectfill(0,0,127,8,9)
line(0,9,127,9,4)
_v-=1
?(_v>0 and _f9 or _bm and _bm._cz or""),2,2,0
?sub("000000", #_dm+1).._dm, 103,2, _d
if hq!=_y then
_u=1
if _y then _f7"pOWER LOW.bUILD wINDTRAP" end
_gj"55" end
_y=hq
local _ee=5934
for _ef=17152,17648,16 do
memcpy(0x6000+_ee, _ef, 16)
_ee+=64
end
rect(91,91,123,123,_d)
local cx,cy=ceil(92+_at/16),ceil(92+_au/16)
rect(cx,cy, cx+7,cy+7, 7)
if _u>0 and _u<77 then
_u+=1
rectfill(92,92,122,122,0)
for i=1,300 do
pset(92+rnd"31",92+rnd"31",5+rnd"3")
end
end
local _d2=_bm and _bm._ah
if _bm and _bm.ico_spr then
_bm.ico_obj:_c0(107,20)
_bm.ico_obj:_ao()
_eg,_eh=nil,nil
if _bm._aq==1 then
if _d2 then
_d2:_c0(107,44)
_d2:_ao()
end
if _bm._cm<_bm._b3
and _bm.id!=4
and (_bm.type==2
or not _bm.moves) then
_eg=_bv(_ai[80], 115,28, 5, {}, nil,_ab, function()
_8(_d6, 2)
end)
_eg:_ao()
end
if(_bm.id==19
and _bm._cy<=0)
or _bm.id==35
then
_eh=_bv(_ai[81], 107,29, 5, {}, nil,_ab, function()
if _d6.id!=35 then
_f7"pICK tARGET" _d3=true
else
local mx,my=_d6:_c2()
local _al=_fa(mx,my)
if _al>=12 and _al<=22 then
_d6._cm=0
_ba(_ai[1],mx*8,my*8,1)
_gj"61" end
_d6=nil
end
end)
_eh:_ao()
end
end
end
pal()
if _d2
and (_d2.type==4
and not _d2.moves)
and _d2._cm>=100 then
local _ei,_ej=(cursor.x+_at)\8, (cursor.y+_au)\8
local _ek,_el,w,h=_ei*8-_at,_ej*8-_au,_d2._b7,_d2._b8
_em,_en,_bf=false,false,false
for xx=-1,w do
for yy=-1,h do
local _al=_fa(_ei+xx, _ej+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(_al==22 or _al>=58 and _al<=81) _em=true
else
if(_al>=12 and _al<=21) _bf=true
if(_k[_ei+xx.."," .._ej+yy] or _al==0 or _al<=11 or _al>=23) _en=true
end
end
end
if(_en and _d2._b2._av!=22)_em=false
fillp"0b1110110110110111.1" rectfill(_ek, _el,_ek+_d2.w, _el+_d2.h, _em and 11 or 8)
fillp()
end
if _7 then
fillp(▒)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,_d)
rect(3,22,124,95,_c)
if _bm.build_objs then
_bm._eq={}
rectfill(6,25,27,92,0)
local _eo=1
for i=1,#_bm.build_objs do
local _ep=_bm.build_objs[i]
if not _ep.req_id
or _o[_bm.created_by][_ep.req_id]
and _ep.req_level<=_a
then
_bm._eq[_eo]=_ep
if _eo>=_1 and _eo<=_1+2 then
_ep:_c0(9,28+(_eo-_1)*19)
_ep:_ao()
else
_ep:_c0(-16,16)
end
_2=_2 or _bm._eq[1]
if _2==_ep then
_5=_eo
rect(_ep.x-2, _ep.y-2,_ep.x+17, _ep.y+17,7)
?_2._cz,30,26
?"cOST:" .._2._fs,85,33,9
?_2.description,30,34,6
end
_eo+=1
end
end
end
for controls in all(_3) do
controls:_ao()
end
end
palt(11,true)
cursor:_ao()
end
function _er(x,y)
if(x<0 or x>#_w or y<0 or y>#_w) return
local _cd=0
if _w[x][y]!=0 then
if(_w[x][y-1]>0) _cd+=1
if(_w[x-1][y]>0) _cd+=2
if(_w[x+1][y]>0) _cd+=4
if(_w[x][y+1]>0) _cd+=8
_w[x][y]=1 + _cd
end
end
function _es(x,y)
local _al=_fa(x,y)
return _al>=4 and _al<=10
end
function _et(_cr, _eu)
_cr._co,_cr.link,_cr._ev=_eu or 0,nil,true
_cr._cp=cocreate(function(self)
while true do
if self.z>1 then
_fe(self,mid(flr(self._b4+rnd"32")-16,64),mid(flr(self._b5+rnd"32")-16,64))
end
if self.id==34 then
_gh(self)
elseif _gu"250" and self._e4 and self._co!=8 then
local gx,gy=self:_c2()
_e6(self,gx,gy,function (_cr,x,y)
local _ct=_k[x.."," ..y]
if _ct!=null and _ct.created_by!=_cr.created_by and _w[x][y]==16 and _ct.z==1 then
_e2(_cr,_ct)
return true
end
end,max(4,self.range))
end
local _bu=self._ew or self._bu
if self.id==32 then
self._cz="hARVESTER (" ..flr(self.capacity/1500*100).."%)"
if self._co==0 or self._co==9 then
if self.capacity<1500
and self._co!=7 and self._co!=9 then
self._ew=nil
local sx,sy
local tx,ty=self:_c2()
if _es(tx,ty) and not self._ex then
sx,sy=tx,ty
else
_e6(self,tx,ty,function(_cr,x,y)
if _es(x,y) and _gu"2" then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cr._ev=_fe(_cr,sx,sy,nil,not _cr._ev)
if not _cr._ev and not _gs(_o[_cr.created_by][33]) then
self.x,self.y=_e0(self)
end
if(_es(_cr:_c2())) _cr._co=6
end
elseif self.capacity >=1500
and self._co<7 then
self.sx,self.sy=self:_c2()
_gf(self,_bu or _gs(_o[_cr.created_by][6]))
end
elseif self._co==6 then
self._ex=false
_e1(_cr.x, _cr.y, _cr.r+.75+rnd".2" -.1)
local _ey=_cr:_c1()
self.capacity+=.5
_m[_ey]=(_m[_ey] or 1000)-1
if _m[_ey] <=0 then
local _bo,_bp=self:_c2()
for yy=-1,1 do
for xx=-1,1 do
_al=_fa(_bo+xx,_bp+yy)
_fb(_bo+xx,_bp+yy,(xx==0 and yy==0) and 0 or ((_al>1 and _al<8) and 10 or _al)
)
end
end
self._co=0
end
if(self.capacity%300==0) self._ex=true self._co=0
end
end
if self.id>26 then
if self._co==9 then
if _bu._cm>0 and not _bu._ez and self._cm>0 then
_bu._ag,self._co,self.r,self.x,self.y=false,8,.25,_bu.x+16,_bu.y+4
if(_bm==self) _bm=nil
if self.capacity and _bu.id==6 then
_bu._ez=true
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
_z[self._aq]+=.5
if tonum(_dm)<_a0 then
_c3(2,self)
elseif self._aq==1 then
_f7"sPICE LOST. bUILD sILO" end
end
yield()
end
self.capacity,_bu._ez,self._co=0,false,0
if self.sx then
_fe(self, self.sx, self.sy, 0, true)
else
self.x,self.y=_e0(self)
end
else
self._ae,self._cx,_bu.col_cycle_src,_bu._b9=2,0,8,_gn"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _e0(_ct)
local ux,uy=_e6(_ct,(_ct.x+8)\8, (_ct.y+8)\8, _fd, nil, true)
return ux*8,uy*8
end
function _e1(x,y,r)
if(_gu"5") _gz(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gn"2,4,9,15", 0xa5a5.8)
end
function _e2(_cr, _ct)
if _cr.id!=19 then
_e3,_cr._co,_cr._ct,_cr._cp=_cr.range*5,3,_ct, cocreate(function(self)
while _ct._cm>0 and _ct._co!=8 do
if _gt(_cr.x,_cr.y,_ct.x,_ct.y) > _e3
and _cr.moves then
_fe(_cr,(_ct.x+rnd(_ct.w))\8,(_ct.y+rnd(_ct.h))\8,_e3)
if _cr._e4==1600 then
_cr._cm=0
for i=1,_cr.id/3 do
_c5(_cr.x+rnd"32" -16,_cr.y+rnd"32" -16, 2)
end
_ct._cm-=(1000+rnd"600")
_ct._cu=_cr
return
end
end
if not _cr.norotate then
local a=atan2(_cr.x-_ct.x, _cr.y-_ct.y)
while (_cr.r !=a) do
_gw(_cr, a)
end
end
if _gt(_cr.x,_cr.y,_ct.x,_ct.y)<=_e3 then
if(_cr._cy<=0 and not _cr._cv and _ct._cm>0) _cr._br(_cr) _cr._cy=_cr.fire_rate
elseif not _cr.moves then
_et(_cr)
end
yield()
if(_cr.id==40 or _cr.id==34 or _ct._e5==_cr._e5 or _ct.link) break
end
_et(_cr)
end)
else
_e2(_ba(_ai[({24,25,38,38.5})[_cr._e5]], _cr.x,_cr.y, _cr._aq, _cr), _ct)
_cr._cy=1750
end
end
function _e6(_cr,x,y,_e7,_e8,_e9)
for t=0,_e8 or 4,.04 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_e7(_cr,xx,yy)) return xx,yy
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
function _fd(_cr,x,y)
return not fget(_fa(x,y),0)
and not _k[x.."," ..y]
end
function _fe(_cr,x,y,_ff,_fg,_eu)
local _fh=_cr.z>1
if _fg then
local _fi=_o and _gs(_o[_cr.created_by][33])
if _fi and not _fi.link and _fi._e5==_cr._e5 then
_fi.link,_cr.link,_cr._co, _fi._cp=_cr,_fi,2, cocreate(function(unit_c)
_fe(unit_c,_cr.x\8,_cr.y\8)
if(_bm==_cr) _bm=nil
if _cr._cm>0 then
_fi._av=149
del(_j,_cr)
_fe(_fi,x,y)
_cr:_c0(_fi.x,_fi.y)
add(_j, _cr)
_et(_cr,_eu)
end
_fi._av=73
_et(_fi)
end)
return
end
end
::restart_move_unit::
if not _fh and not _fd(nil,x,y) then
x,y=_e6(_cr,x,y,_fd)
end
_cr.tx,_cr.ty,_cr.prev_state,_cr._co,_cr._fj=x*8,y*8,_cr._co,1,nil
local start, goal, _fl={ x=_cr.x\8, y=_cr.y\8}, {x=x, y=y}, function (_fk) return (_fk.y<<8) + _fk.x end
local _ft,_fm={
_fn=start,_fo=0,_fp=_gy(start, goal)
}, {}
_fm[_fl(start)]=_ft
local frontier, frontier_len, goal_id, max_number, count={_ft}, 1, _fl(goal), 32767.99, 0
while frontier_len > 0 do
local _fs, _fq=max_number
for i=1, frontier_len do
local _fr=frontier[i]._fo + frontier[i]._fp
if(_fr <=_fs) _fq,_fs=i,_fr
end
_ft=frontier[_fq]
frontier[_fq], _ft._fu=frontier[frontier_len], true
frontier_len -=1
local p=_ft._fn
if _fl(p)==goal_id then
p={goal}
while _ft._fz do
_ft=_fm[_fl(_ft._fz)]
add(p, _ft._fn)
end
_cr._fj=p
goto end_pathfinding
end
local _fv={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx=p.x+xx
local ny=p.y+yy
if(xx!=0 or yy!=0)
and _fh or not fget(_fa(nx,ny),0)
and not fget(_fa(nx,ny),7)
and not _k[nx.."," ..ny]
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fv, {x=nx, y=ny})
end
end
end
for n in all(_fv) do
local id=_fl(n)
local _fw=not _fh and fget(_fa(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _fw+=.2
local _fy, _fx=
_fm[id],_ft._fo + _fw
if not _fy then
_fy={
_fn=n,_fo=max_number,_fp=_gy(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fm[id]=_fy, _fy
end
if not _fy._fu and _fy._fo > _fx then
_fy._fo, _fy._fz=_fx, p
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat"0" /2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
_cr.prev_state,_cr._co=_cr._co,2
if _cr._fj!=nil then
for i=#_cr._fj-1,1,-1 do
local _fk=_cr._fj[i]
if not _cr.norotate then
local a=atan2(
_cr.x-(_fk.x*8),
_cr.y-(_fk.y*8) )
while (_cr.r !=a) do
_gw(_cr, a)
end
end
if(not _fh and not _fd(nil,_fk.x,_fk.y)) goto restart_move_unit
local _f0,_f1=_cr._f4 or .5, sqrt((_fk.x*8-_cr.x)^2+(_fk.y*8-_cr.y)^2)
local _f2,_f3=_f0 * (_fk.x*8 - _cr.x) / _f1, _f0 * (_fk.y*8 - _cr.y) / _f1
for i=0, _f1/_f0-1 do
_k[_fk.x.."," .._fk.y]=_cr
_cr.x+=_f2
_cr.y+=_f3
if _cr.id==33 then
if _cr.link then
local d=_gt(_cr.x,_cr.y,_cr.tx,_cr.ty)
if(d<32) _cr.z=d/4
end
_cr.z=mid(2,_cr.z+0.1,8)
_cr._f4=_cr.z/12
end
yield()
end
_cr.x,_cr.y,_k[_fk.x.."," .._fk.y]=_fk.x*8, _fk.y*8,_cr
_c7(_cr)
if(_gt(_cr.x,_cr.y,_cr.tx,_cr.ty) <=(_ff or 0)) break
end
else
_cr._co=0
return false
end
_cr._co=0
return true
end
function _f5(x,_f6,_bn,_w)
add(_3,{
x=x,y=83,w=_w or 22,h=8,_f6=_f6,_an=function(self)
return self
end,_ao=function(self)
local c=self._ge and 7 or 6
if(#_f6>1)rectfill(self.x,83,self.x+self.w,91, c)
?self._f6,self.x+2,85,#_f6>1 and 0 or c
end,_bn=_bn
})
end
function _f7(_f8)
_f9,_v=_f8,500
end
function _ga(_b1)
_b1._cm,_b1._ae,_b1.spent,_b1._cw=0,0,0,false
if(_b1._by) _b1._by._ag=false
end
function _gb(_b1)
if(not _b1) return
local _gc,_gd=cursor:_an(),_b1:_an()
_b1._ge=_gc.x <=_gd.x + _gd.w and
_gc.x + _gc.w >=_gd.x and
_gc.y <=_gd.y + _gd.h and
_gc.y + _gc.h >=_gd.y
if _df and _b1._ge then
if _7 then
_2=_b1
else
if(_b1.type<=2 and _w[(cursor.x+_at)\8][(cursor.y+_au)\8]!=16 or _b1._co==8) return
if _bm
and _d6
and (_b1.id==6 and _d6.id==32
or _b1.id==14 and _d6.id>26)
and _b1._aq==1 and _d6._aq==1
then
_gf(_d6,_b1)
return
else
_bm=_b1
end
end
_d0=true
end
end
function _gf(_cr,_d9)
_d9=_d9 or _gs(_o[_cr.created_by][1]) or _cr
_cr._co,_d9._ag,_cr._ew=7,true,_d9
if(_cr.id!=32 or _d9.id==6) _cr._bu=_d9
_cr._cp=cocreate(function(_cr)
local _gg=_d9.id!=1 and 9 or 0
_fe(_cr, (_d9.x+16)/8, _d9.y/8, 0, true, _gg)
if(not _cr.link) _et(_cr, _gg)
end)
end
_dx=0
function _gh(_b1)
local _ct=rnd(_i)
if(_ct.created_by!=_b1.created_by and _gi(_ct)) _e2(_b1, _ct)
end
function _gi(_b1)
local x,y=_b1:_c2()
return _w[x][y]==16
end
function _gj(_gk)
sfx(_gk,3)
end
function _gl(_gm)
local _al=peek(0x3115)
if(_al & 128 > 0 !=_gm) _al=_al^^128
poke(0x3115, _al)
end
function _gn(_go,d,dd)
d=d or","
if(dd) _go=split(_go,dd)
if type(_go)=="table" then
local t={}
while #_go>0 do
local s=_go[1]
add(t,split(s,d))
del(_go,s)
end
return t
else
return split(_go,d)
end
end
function _gp(_gq,_gr,_c8)
if(not _gq[_gr]) _gq[_gr]={}
add(_gq[_gr],_c8)
end
function _gs(_gq)
if(_gq) return rnd(_gq)
end
function _gt(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gu(_gv)
return rnd(_gv)<1
end
function _gw(_cr, _gx)
local _c4=_gx-_cr.r
if(_cr.z>1) _cr.r=_gx
if _c4 > 0.5 then
_c4 -=1
elseif _c4 < -0.5 then
_c4 +=1
end
if _c4 > 0.0087 then
_cr.r +=0.0087
elseif _c4 < -0.0087 then
_cr.r -=0.0087
else
_cr.r=_gx
end
yield()
end
function _gy(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _gz(x, y, r, dx, dy, dr, _g0, _cm, _g1, _g2)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_cm=0,_g0=_g0,_g1=_g1, _g2=_g2,_g3=y, _g4=_cm }, 1)
end
__gfx__
11bbbbbbbb171bbbb7bbbb7bbbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbbb9bbbbb95555555d555555d155dbbbbbbbbbb
171bbbbbb17771bb77bbbb77bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99bb99bbbbbbbd5515555555515555d59bbb9d5d9b
1771bbbb1711171bbbbbbbbb0000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9bb9bbb79bbbd555d5515d5d5555d515db55515515
17771bbb7717177bbbbbbbbb07700077bbb99b9bb9999b9bb9b99bbbb9b9bb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
177771bb1711171bbbbbbbbb00777770bbbbb9b99bb9999b9b9bbbbbbb9bb999b9b99bbb99999999b999b99bbb99bbbbbd55d55155155555d515559b155555d5
17711bbbb17771bbbbbbbbbb07700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb79bbbbbbd515d55d555d5555d555dbbd55d5555
b11bbbbbbb171bbb77bbbb770000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb99bbbbb9b95d5555555555155155dbbb5d555d15
bbbbbbbbbbbbbbbbb7bbbb7bbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbbb99bbbd551d5515d555d555559bb55515555
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
bb77994bb6d55d6bb5dbbbbbbbbbbb10d555555501bbbbbbbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbbbbb1b0bbbbbb100b1bbbbb0b5bbbbbbbbbbbbb00000000
bb79994bb6d55d6bbbbb555bbbbbb1b0d55555550b1bbbbbbbbc7bbbbbbbbbbb7e777e7bbb676bbbbbbbbb10bbbbb5b001bbbbbb01bbbbbbbbbbbbbb00000000
bb79944bb66dd66bbbbb5d5bbb5b1b00d555555500b1b5bbbb0cc0bbbbb5b5bbbbb7bbbbbbb7bbbbbbbbb5b0bbbbbb100b5bbbbb0b5bbbbbbbbbbbbb00000000
bbb444bbbb6666bbbbbb555bb5b1b000d5555555000b1b5bbb5dd5bbbb1b1b1bbbbcbbbbbbbcbbbbbbbbbb51bbbbbbb115bbbbbb01bbbbbbbbbbbbbb00000000
bbbbbbbbb9bbbbbbbbbbbbbbb1000000d55555550000001bbb0cc0bbb1000005bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5bbbbbbbbbbbbbbb00000000
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
99900999999999999999999999999999999999999999999999999990099999999999999999999999999999999999999999999991119111911991919111911199
99099990090099900900090099090990090009000990090099999909999009000990090999000900090009999999999999999991919191991991919991919199
99099909090909099990990909090909999099909909090909999909990909000909090999009990990099999999999999999991919191991991119991911199
99099909090909990990990099090909999099909909090909999909990909090900090999099990990999999999999999999991919191991999919991999199
99900900990909009990990909900990099099000900990909999990090099090909999009900990999009999999999999999991119111911199919991999199
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
000000000000000000000000000000000000000000000000000000000000f1f5ff9f595f9f9959599999595999995f1900000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000f1fffffff99ffff9999999999999999f9999190000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000001fffffff999f99f99999999999999999ff99910000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000f5fffff99ff9ffff9999999f9999999f999f590000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000015ffffffffffffff9999999f9999999f99f99951000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000fffffffffff99fff999f9999999f9999ff9fff99000000000000000000000000000000
00000000000000000000000000000000000000001f5000001f5000001ffffffffff99fffff99f9ff9999f9ff999f9f99f5000000000000000000000000000000
0000000000000000000000000000000000000f1f5ff1f1f1fff1f1f1ffffffffffffffff999f9999f99f9999f9f9999f10000000000000000000000000000000
000000000000000000000000000000000000d1f5ffff5f5fffff5f5fffffffffff9ff99f9f999f9999999f99999f999590000000000000000000000000000000
00000000000000000000000000000000000515dfffffffffffffffffffffffffffff99fffff9999f9ff9999f9f9999f910000000000000000000000000000000
0000000000000000000000000000000000015559fffffffffffffffffffffffffff999f99f9ff9999f9ff9999ff9f995f000000000000ccccccccccccc0cc000
000000000000000000000000000000000005555dffffffffffffffffffffffffff99ff9ffff91cc19ff999f99f9fffff1000000000000ccccccccccccc0cc000
0000000000000000000000000000000000155555dfffffffffffffffffffffffffffffffff90d11d0999f999f9fffffff100000000000cccccccccccccdcc000
0000000000000000000000000000000000555d55dffffffffffffffffffffffffffff99ffff01cc109ff9fff99ffffffff00000000000ccccccccccccccdc000
00000000000000000000000000000000005d155dfffffffffffffffffffffffffff99fffff91cccc199f9f99f9fffffff5000000000009accc5acccccc55c000
00000000000000000000000000000000001555d59fffffffffffffffffffffffffffffff9991cccc19f9999f99ffffff1000000000000575c544aaacccccc000
000000000000000000000000000000000001d515dfffffffffffffffffffffffff9ff99f9f90cccc099f99999fffff9550000000000005d75144444aaaccc000
0000000000000000000000000000000000055d55dfffffffffffffffffffffffffff99fffff0cccc0f9999f99ffffd5510000000000009511199994444ccc000
00000000000000000000000000000000000115559ffffffffffffffffffffffffff999f99f9111111ff9f99fffff955550000000000009001199999991515000
00000000000000000000000000000000000d555dffffffffffffffffffffffffff99ff9ffff911119f9fffffffffd515100000000000050d0199999991515000
00000000000000000000000000000000000155dfffffffffffff7fffffffffffffffffffff99f999f9fffffffffd55551100000000000501015aaaaaaa444000
0000000000000000000000000000000000555559ffffffffffffcffffffffffffffff99fffff9fff99fffffffffd5d5555000000000004500545aa7444445000
0000000000000000000000001f500000155d155dffffffffffff1ffffffffffffffffffffff99fffffffffffff55d55555000000000005444544444445444000
000000000000000000000f1f5d515151515555d59ffffffffff0f0ffffffffffffffffffffffffff99ffffffdd55555510000000000004554444544544454000
00000000000000000000f19555515d5d5555d515dffffffffffffffffffffffffffff777ff9ff99f9fffff9d55515d5550000000000005444554455454544000
0000000000000000000f1d555d5555155d155d55dfffffffffffffffffffffffffff77994fff99fffffffd555d55551510000000000004554545545555445000
0000000000000000000195555555155555d515559fffffffffffffffffffffffffff79994ff999f99fff95555555155550000000000000000000000000000000
0000000000000000000f551555d555d5555d555dffffffffffffffffffffffffffff79944f99ff9fffffd51555d555d51000000000000bbbbbbbbbbbbbbbb000
00000000000000000015555515555555155155dffffffffffffffffffffffffffffff444fffffffffffd5555155555551100000000000bbbbbbbbbbbbbbbb000
000000000000000000fd5d5555515d555d555559fffffffffffffffffffffffffffffffffffff99ffffd5d5555515d555d000000000000000000000000000000
000000000000000000ff95555555d5555555d55555ffffffffffffffffffffffffffffffffffffffff55d5555555d55555000000000000000000000000000000
0000000000000000001ffd55155555555155555551dfffffffffffffffffffffffffffffffffffffdd5555555155555510000000000000000000000000000000
00000000000000000001d555d5515d5d55515d5d5555d9ffffffffffffffffffffffffffffffff9d55515d5d55515d5550000000000000000000000000000000
0000000000000000000955515d5555155d5555155d5555dffffffffffffffffffffffffffffffd555d5555155d55551510000000000000000000000000000000
0000000000000000000155d5515515555555155555d55559ffffffffffffffffffffffffffff955555551555555515555000000000000ffffffffffffffff000
0000000000000000000d515d55d555d555d555d55555d55dffffffffffffffffffffffffffffd51555d555d555d555d51000000000000ffffffffffffffff000
000000000000000000015d55555555551555555515555555dffffffffffffffffffffffffffd555515555555155555551100000000000ffffffffffffffff000
0000000000000000005fd551d5515d555d515d555d555d55dffffffffffffffffffffffffffd5d5555515d555d515d555d00000000000ffffffffffffffff000
000000001f5000001ffd5d555555d5555555d5555555d5555555d55555ffffffffdddcdddddddddddddddddddd55d5555500000000000ff77777777ffffff000
00000f1f5ff1f1f1fffd55515555555551500500515555555155555551ff9d5d9fd560d55555555555d55555555555551000000000000ff766657666fffff000
0000f1f5ffff5f5fffff55d555515d5d5551dccc65515d5d55515d5d5555515515d56d1555c5555555d5ccccc5515d555000000000000ff7555565555ffff000
000f1fffffffffffffffd15d5d5555155d51677c1d5555155d5555155d55d5155dd5110d560d6c0655d55555555555151000000000000f777777577777fff000
0001ffffffffffffffff9555555515555551dccc655515555555155555155555d5d51001d6d6110dd5d55111555515555000000000000f7666665766666ff000
000f5fffffffffffffffff9d55d555d555d0010015d555d555d555d555d55d5555d515050116dd0dd5d5555555d555d51000000000000f76666665766666f000
0015fffffffffffffffffffffd555555155115111555555515555555155d555d15d55d155106dd15d5d55515555555551100000000000fddddddddddddddf000
00ffffffffffffffffffffffff515d555d515d555d515d555d515d555d55515555d566665551ddd501d5511155515d555d00000000000ffffffffffffffff000
00fffffffffffffffffffffffffd5d555555d5555555d555557777777777777777d6ddcdd551110001dddddddd55d5555500000000000ffffffffffffffff000
001ffffffffffffffffffffffffd555155555555515555555176667666561ffff7d6dd0dd55d110001d55111555555551000000000000ffffffffffffffff000
0001ffffffffffffffffffffffff55d555515d5d55515d5d5576667666565f4447d6dd15d1d1510c01d5551555515d555000000000000ffffffffffffffff000
000f5fffffffffffffffffffffffd15d5d5555155d5555155d76621662165ffff7d1ddd500155560d5d55555555555151000000000000ffffffffffffffff000
0001ffffffffffffffffffffffff955555551555555515555572221222165f1017d1111005dddd6d15d551115555155550000000000000000000000000000000
000f5fffffffffffffffffffffffff9d55d555d555d555d555722112211ddf1007d111100111111105d5555555d555d51000000000000cccccccccccccccc000
0001fffffffffffffffffffffffffffffd55555515555555157115511151551007d511005555551015d5ccccc55555551100000000000cccccccccccccccc000
005fffffffffffffffffffffffffffffff515d555d515d555d76767555d55d5557d555555555555555d5555555515d555d000000000000000000000000000000
00fffffffffffffffff7ffffffffffffffff95555555d555557d6d65d555d555d755d5555555d5555555d5555555d55555000000000000000000000000000000
001ffffffffffffffffcfffffffffffffffffd55155555555176d1d555155dc05755555551555555515555555155555510000000000000000000000000000000
0001fffffffffffffff1ffffffffffffffffd555d5515d5d557555555a5d511057515d5d55515d5d55515d5d55515d5550000000000000000000000000000000
000f5fffffffffffff0f0ffffffffffffff955515d5555155d75aaa99a555550575555155d5555155d5555155d55551510000000000000000000000000000000
0001fffffffffffffffffffffffffffffffd55d5515515555575aaa55ad555505755155555551555555515555555155550000000000000000000000000000000
000f5ffffffffffffffffffffffffffffffd515d55d555d55575a1199a55d51557d555d555d555d555d555d555d555d510000000000000000000000000000000
0001fffffffffffffffffffffffffffffff95d5555555555157544445a1555551755555515555555155555551555555511000000000000000000000000000000
005fffffffffffffffffffffffffffffffffd551d5515d555d7777777777777777515d555d515d555d515d555d515d555d000000000000000000000000000000
00ffffffffffffffffffffffffffffffff55d5555555d55555d6dddddd6ddddddddddddddddddddddd5bd55b555bd55b55510000000000000000000000000000
001fffffffffffffffffffffffffffffdd5555555155555551dd577765d5555555d555555555555555b5551151b555b551b55150000000000000000000000000
0001ffffffffffffffffffffffffff9d55515d5d55515d5d55d576611655577765d554777777777455515b171b515b5d5b515d1d000000000000000000000000
000f5ffffffffffffffffffffffffd555d5555155d5555155dd766111155766116d544ff7fff7ff44555b5177155b515bd555511500000000000000000000000
0001ffffffffffffffffffffffff9555555515555555155555d761011107661111d5047777786174055b1517771b155b55551555100000000000000000000000
000f5fffffffffffffffffffffffd51555d555d555d555d555d760001017610111d544ff7ff6d1f445b55517777155b555b555d5500000000000000000000000
0001fffffffffffffffffffffffd55551555555515555555156d60010157600010d504777771177405555b1771155b551b555555510000000000000000000000
005ffffffffffffffffffffffffd5d5555515d555d515d555dd5d111155d600101d544ff7fff7ff44551bd511d51bd55bd515d555d0000000000000000000000
00ffffffffffffffff55d5555555d5555555d5555555d55555d5555555d5d11115d5047777777774055bd55b555b551b5155d555555000001550000015510000
0015ffffffffffffdd555555515555555150050051555555516dd577765d5555ddd544ff7fff7ff445b555b551b55db155b55555515151515151515151555150
000f5fffffffff9d55515d5d55515d5d5551dccc65515d5d55d55766116555c055d542222222222245515b5d5b515b555b515d5d55515d5d55515d5d55515d1d
0001fffffffffd555d5555155d5555155d51677c1d5555155dd5766111155110ddd52c02c02020022555b515bd5db5d5b55555155d5555155d5555155d555511
000f1fffffff955555551555555515555551dccc65551555556d761011105d5055d5110110222002255b155b555bd55bd1551555555515555555155555551555
0000f1f5ffffd51555d555d555d555d555d0010015d555d555d5760001015d5055d551011011111115b555b555bd55b555b555d555d555d555d555d555d555d5
00000f1f5ffd15151555555515555555155115111555555515d5d6001015d6d555d555011011111155555b551bdf9b5d9b555555155555551555555515555555
000000001ff1000005515d555d515d555d515d555d515d555dd55d111155d5d555d55555555555555551bd55bdffbfffbf515d555d515d555d515d555d515d55
00000000000000000055d5555555d5555555d5555555d55555ddd777c066666ddddddddddd55d555dffbfffbfffbfffbfffffffffffd5d555555d5555555d555
000000000000000000155555515555555155555551555555516667d110dddd6576675555551555d5dffcfffffffffffffffffffffffd55515555555551555555
000000000000000000015d5d55515d5d55515d5d55515d5d556dd7ddd0d6666dddddd567655d5555fff1ffffffcccccccccccccccccccccccccccccccccccd55
0000000000000000000555155d5555155d5555155d5555155d6dd766d0d6dd611111ddddd555555dff0f0fffffc111111111111111111111111111111111c515
000000000000000000011555555515555555155555551555556dd11666666d705501111115d555d9ffffffffffc100000000000000000000000000000001c555
0000000000000000000555d555d555d555d555d555d555d5556d766111111770505542142555d9ffffffffffffc100000000000000000000000000000001c5d5
000000000000000000015555155555551555555515555555156d55d5dd6661100555425425dfffffffffffffffc100000000000000000000000000000001c555
000000000000000000515d555d515d555d515d555d515d555d6ddd6ddd7111102555425425ffffffffffffffffc100000000000000000000000000000001cd55
00000000000000000055551d5155d5555555d5555555d555556d7777777111104555425425ffffffffffffffffc100000007777777700000000000000001c555
000000000000000000155d51555555555155555551555555516d7011111ddd644555555555ffffffffffffffffc100000007000cc9700000000000000001c555
0000000000000000000155555d515d5d55515d5d55515d5d556770d1d11ddd705555555555ffffffffffffffffc10000000700cfc5700000000000000001cd55
0000000000000000000155d5555555155d5555155d5555155dddd0d1d11677705555555555ffffffffffffffffc1000000070c5c55700000000000000001c515
000000000000000000051555d1551555555515555555155555ddd0d1dd111115dddddd5555ffffffffffffffffc1000000070fccc5700000000000000001c555
00000000000000000000511555d555d555d555d555d555d5550001d1111111105555555555ffffffffffffffffc100000007005c5c750000000000000001c5d5
000000000000000000000d1d5f55555515555555155555551500111ddd111115dddddd5555ffffffffffffffffc1000000077777777f0000000000000001c555
0000000000000000000000001f515d555d515d555d515d555d011111111111105555555555ffffffffffffffffc100000000000000000000000000000001cd55
00000000000000000000000000fd5d555555551d5155d5555555d5555555d555dffffffffff99fffffffffffffc100000000000000000000000000000001cd55
000000000000000000000000001d555155d55d515555555551555555511555d5dfffffffffffffff99ffffffffc100000000000000000000000000000001c551
000000000000000000000000000155d5555155555d515d5d55515d5d555d5555ffffffffff9ff99f9fffffffffc100000000000000000000000000000001c5d5
000000000000000000000000000f515d5d5d55d5555555155d5555155d55555dfff9f9ff9fff99ffffffffffffc100000000000000000000000000000001c15d
000000000000000000000000000195555555d555d15515555555155555d555d9ffff9ff999f999f99fffffffffc100000000000000000000000000000001c555
000000000000000000000000000f5f9d555d551555d555d555d555d55555d9ffff999f99f999ff9fffffffffffc100000000000000000000000000000001cf9d
0000000000000000000000000001fffffddf9d5d9f5555551555555515dfffffff9f99f99fffffffffffffffffc100000000000000000000000000000001cfff
000000000000000000000000005fffffffffffffff515d555d515d555dfffffffff99f99f9fff99fffffffffffc100000000000000000000000000000001cfff
00000000000000000000000000fffffffffffffffffffffffff99fffff99f9ff9999f9ff999f9f99f9ffffffffc100000000000000000000000000000001cfff
0000000000000000000000000015ffffffffffffffffffffffffffff999f9999f99f9999f9f9999f99ffffffffc100000000000000000000000000000001cfff
000000000000000000000000000f5fffffffffffffffffffff9ff99f9f999f9999999f99999f99999fffffffffc100000000000000000000000000000001cff5
0000000000000000000000000001ffffffffffffffffffffffff99fffff9999f9ff9999f9f9999f99fffffffffc100000000000000000000000000000001cfff
000000000000000000000000000f1ffffffffffffffffffffff999f99f9ff9999f9ff9999ff9f99fffffffffffc100000000000000000000000000000001cff1
0000000000000000000000000000f1f5fffff5f5fffff5f5ff99f595fff995f59ff995f59f9ff5f5fffff5f5ffc100000000000000000000000000000001cf1f
00000000000000000000000000000f1f5fff1f1f1fff1f1f1fff1f1f1f9919191999191919ff1f1f1fff1f1f1fc100000000000000000000000000000001c1f0
000000000000000000000000000000001ff1000005f1000005f1000005f1000005f1000005f1000005f1000005c100000000000000000000000000000001c000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c100000000000000000000000000000001c000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c100000000000000000000000000000001c000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c100000000000000000000000000000001c000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c111111111111111111111111111111111c000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccc000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
040080000c0c0c0c0c0c0c0e0808080808080808080a08090909090909090909060e0e000800000000000000000000010000000000000000000001010101010101010001000102010000010101020201010101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
000000000000000000000b0b0b0000000000000000000000040506000004050600136822850000000000000000000004050600000b0b0b0b0b0b0b0b0b002f2f00000000000c0d0d0e00000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d120a0508110d0d0d0d1200110d0d0d0d0d0000
0000000000000000000b0b0b0b0b0b0000000000000000000a090a00000a050a0000222285120000300000000004050505050506000b0b0b0b0b0b0b00002f2f00000000110d0d0d0d0f0d0d0d0f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0f0d0d0d0d0d0d0d0d0d0d140000130000
00000000000004050a050600000b0b0b0030000000000405050905070a050905050600682240220a000a0000000509090509050a0b0b0b0b0b0b0b0000002f2f000000000c0d0d0d0d0d0d0d0d0d0d17190d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d0d0d0d0d0d0d0d1400130d0d0d0d14000000000000
000000000000050505050505060b0b0b0b00331112000505090905050909090909050622222222850e00000000050509090909050b0b0b0b0b0b000000002f2f0000110d0d0d0d0d0d0d0d0d1718181c1e0d1400000c0d0d0d0d0d0d0d0d0d0d0d0e00000000130d0d0d0d0d0d0d0d0d0d140000000c0d0d0e00000000000000
0000000000000a050505090905000b0b0b0000130d120a050509090909090905050a44222285858504050506000a050509090905060b0b0b0b0b000000002f2f0d0d0d0e0000130d0d0d0d0d1d1e1e1f0d0d000000130d0d0d0d0d0d0d0d0d0d0d0e000000000000130d0d0d0d0d0d1400000000000c0d0d0d00000000000000
0b0000000000000a05050505080b0b0b0b040506130d120a050505050505050a2424222222000000000505050000050909090508000b0b0b0b0b000000002f2f0d0d0d0d00000000040a130d0d0d0d0d0d14000000000c0d0d14000007130d0d0d0d120000000000000000131400000000000000110d0d0d0d00000000000000
0b000000110d0d0d0e0a050a000b0b0b0b05050506130d856a222462222242222442226022003500000a050a0000050909050a000000000b0b00000000002f2f0d0d0d0e000000000505050506130d0d0e00000000000c0d0e0004050506130d0d0d0d12000000000000000000000000000000110d0d0d0d0d00000000000000
000000110d0d0d1404050505000b0b0b0b05090905061385222224222222222224222222221200000000000000000a0505081112000000000000000000002f2f0d0d0d0d120000000505090505060c0d0d00000000000c0d14000509090506130d0d0d0d1200000000000000000000000000110d0d0d0d0d0e00000000000000
0000001314040505050905080b0b0b0b0b0a050505050600000013858585858524858585856e2200340000000000000000110d0d12000000000a000000002f2f00130d0d0d12000005090909050a0c0d0d120000000013140000050905050500130d0d0d0e000000000000000000000000110d0d0d0d0d0d1400000000000000
0000000000050909090905000b0b300b0b0b0a0505050a00003000000000000000000000242222850000000000000000110d0d0d0d0f00000000000000002f2f00000c0d0d0d12000a05090905110d0d0d0e00000000000000000a0505050a0000000c0d0d120000000000000000110d0d0d1400001310100000000000000000
0b000000000a05090905080b0b0b0b0b0b0b0b0b350b0b0b000000000000000035000030008585850e000000000000110d0d0d0d0d0d0d0d0f0d0d0f00002f2f00000c0d0d0d0d0d12050505050c0d0d0d0e000000000000000000050905000000000d0d0d0d0f0f0e00000000000c0d0d140000000000000000000000000000
0b0000000000050505080b0b0b0b0b0b0b0b040506000b330b00000000000000000000000000131400330b0b000000130d0d0d0d0d0d0d100d100d0d0a002f2f0000130d0d0d0d0d0d12050505130d0d0d14000000000000000b0b0a050a000000000d0d0d0d0d0d140000000000130d14000000000000000000000000000000
0000000000000a05080b0b0b0b0b0b0b04050505050600000000350000003300000000000035000000000b0b0b00000000130d0d100000000000001000002f2f000000130d0d0d0d0d0d0a050a00130d140000000000000000000b0b0b00000000000d0d0d0d0d14000000000000000000000000000000000000000000000000
0000000000000000000b0b0b0b0b0b0b0b0505050505000000000000000000000000000000000000000b0b0b0b0b00000000130d000000000000000000002f2f0000000000130d0d0d0d1200000000000000000000000000000000000000000000000c0d0d14070505060000000000000000000b0b0b0000000b0b0b00000000
0000000000000000000b0b0b0b0b0b0b0b0a0505050a0000110d0d1200000000000000003400000b0b0b0b00000b0b000000000c0000000000000a0000002f2f0b0000000000130d0d0d0d1200000000000b0b0b0b000000000000000000000000000d0d0d040505050a00000000000000000b0b0b0b0b0b0b0b0b0b0b0b0000
0000000000000000000b0b0b0b0b0b0b00000000000000000d0d0d0d0e0000000a0011120000000b0b00000000000b0b0000110d120000000a0b0b0000002f2f0b0b0b0b000000130d0d0d0d120000000b0b0b0b0b0b0000000000000000200000000c0d0e0a0509090500000000000000000b0b0b0b0b0b0b0b0b0b0b0b0000
0000000000000000000b0b0b0b0b0b0b00000000000000000000130e000000000000130d12000000000000000000000000000c0d0e0000000000000000002f2f0b0b0b0b0b000000130d0d0d0d12000000000b0b00000000000000000000000000000c0d0d1205050905000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0000
0000000000000000000b0b0b0b0b0b0b000b0b0b0b0000000000000000000004050600131400000000000000000000000000130d0d0f00000000000000002f2f0b0b0b0b0b0b00000000130d0d0d1200000000000000000000000000000000000000130d0d1405050508000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0000
04050505060000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000000000000005090530000000000000000f0e000000000000000c0d0e00000000000a00002f2f0b0b0b00000b0b000000000c0d0d0d12000000000000110d0d0d1200000000000000001310000a000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000
050505090500000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000000000000a0508000000000000000f0d0d0e0000000000000c0d0d0f000000000000002f2f0b0b000000000b0b000000130d0d0d0d0f0d0d0d0f0f0d0d360d100000000000000000000000000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000
0505090905000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000000000000000000000000000000c0d10000000000000000d0d0d0d0f0000000000002f2f0b00000000000b0b00000000130d0d0d0d0d0d0d0d0d0d340d14000000000000000000000000000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000
05050505050000000000000000000b0b0b0b0b0405060b0b0b0b000000000000000000000000000000000000000000000000000d0d0d0d0d0f00000000002f2f0000000000000b0b0000000000130d0d0d0d0d0d340d0d0d0d3400000000000000000000000000000000000705060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0000
0d0d12050a000000000000000000000000000005050505050506000011330d0f0f0f0d0d1200000000000000000000000000000c0d0d0d0d0d00000000002f2f0b0b0b0b0b0b0b0b0000000000000c0d0d0d0d0d0d0d01220d0000000000000d0f0d0e0000000b0b0b0405050505060b0b0b0b0b0b00000b0b0b0b0b0b0b0000
0d0d0d0d1200000000110d0d120000000000000a05050909090506110d0d0d330d0d0d0d0d12000000000000000000000000110d0d0d0d0d1000000000002f2f0b0b0b0b0b0b0b0b0b0b0b000000130d0d0d0d300d0d2222143000000000000c0d14000000000000000a0505090905060b0b0b0b000000000000000000000000
0d0d0d0d0d0d0f0f0d0d0d0d0e00000000000000040909050505050c0d0d0d0d0d0d0d0d0d0d1200000000000000000000000c0d0d0d0d100000000000002f2f0b0b0b0b0b0b0b0b0b0b0b0b000000130d0d0d0d0d340d0d00000000000000131400000000000000000a0905090505050b0b0b0b000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d140000000b0b00000509090505050a130d0d0d0d0d14000000130d0f0f0d0d120000000000000d0d140000000000000000002f2f0b0b0b0b0b0b0b0b0b0b0b000a00000000000c0d0d0d300d00000000000000000000000000000a000004050509090905060b0b0b00000000000000000b0b0000
0d0d0d0d0d0d0d0d0d0d0d0d0000000b0b0b0b0b050905050a000000130d0d0d0d00000000000c0d0d0d0d0d0d120000000000000000000000000000110d2f2f0b0b0b0b0b0b0b0b0b0b00000000000000000c0d0d0d0d140000000000000000000000000a0000110e0a050509090905000b0b0b000000000000000b0b0b0000
0d0d0d0d0d0d0d0d0d0d0d140000000b0b0b0b0b0a0505050a000000000c0d0d0e0042000000130d0d0d0d0d0d0e00000000000000000000000000110d0d2f2f0b0b0b0b0b0b0b0b0b0b000000000a000000130d0d0d1400000000000000000000000b0b0000000000000509090905050b0b0b0b0b0000000000000b0b0b0000
0d0d0d0d0d0d0d0d0d0d140000000000000000000000000000000000000c0d0d0d0000000000000c0d0d0d0d0d14040506000000000000000000110d0d0d2f2f0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000b0b0b0b00000000000a05090909050b0b0b0b0b00000000000b0b0b0b0000
0d0d0d100d0d0d0d0d1400000000000000000000000000000000110d0d0d0d0d0e0000000000110d0d0d0d0d0e040505050600111200000000000d0d0d0d2f2f0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0a0000000000000000000000000000000b0b0b0b0b0b0b0000000b0b05050505080b0b0b0b0b0b0000000b0b0b0b0b0000
0d140000000c0d0d0e0000000000110d0d0f0f0d0d0f0f0d0d0d0d0d0d0d0d0d0d0d0d1200110d0d0d0d0d0d0d0509090905000d0e00000000110d0d0d0d2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
14000000000c0d0d0e00000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0e0a0509050a110d0d120000000d0d0d0d0d2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
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