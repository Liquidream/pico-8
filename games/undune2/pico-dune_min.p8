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
_a,_b,_c,_d,_e=dget"0",dget"1",dget"7",dget"8",dget"26" _f,_g={},{
dget"35" >>16,
500>>16,
dget"36" >>16
}
for i=1,dget"5" do
local _h={}
for j=1,5 do
_h[j]=dget(i*5+j)
end
add(_f,_h)
end
g_,_i,_j,_k,_l,_m,_n,_o,_p,t_,_q,_r,_s,_t,hq,_u,_v,_w,_x,_y={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,"",0,{},_e*8-128
_z=hq
_0={}
g_._4=function(self)
_1,_2,_3=1,nil,{}
_f3(6,"⬆️",function()
_5=mid(1,_5-1,#_bl._eo)
_2=_bl._eo[_5]
if(_5<_1) _1-=1
end, 10)
_f3(17,"⬇️",function()
local _6=#_bl._eo
if(_5<_6) _5=mid(1,_5+1,_6)
_2=_bl._eo[_5]
if(_5>_1+2) _1=min(_1+1,_6-2)
end, 10)
_f3(32,"build",function()
_7=nil
_d5:_bm()
end)
_f3(96,"close",function()
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
pal(self._b8[self._ad], self.col1)
else
pal(11,self.col1)
self._ad=1
end
end
_ab=function(self)
pal(7,8)
if(self.id==80 and _bl._ae==2 and not _bl._af) pal(7,11)
end
function _8(self, _9)
self._cv,self.last_process,self._ae=0,self._ae,_9
if(self._be>=0 and self.last_process>0) self._af=not self._af
if(_9==1) self._bx._ag=true self._bx._ah=self
end
_ai=[[id|_cx|_av|ico_spr|type|w|h|z|trans_col|_bj|_bk|_aq|col1|_aa|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_fr|power|_e3|_b2|_bt|range|_ch|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|_be|_cq|_ae|spent|_cw|_cj|_cl|_ad|col_cycle_src|storage|capacity|_b8|description|_bz|func_update|_bm
1|cONSTRUCTION yARD|64|170|2|2|2|0||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.|||_4
2|lARGE cONCRETE sLAB|22|162|2|2|2|0||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.|||
3|sMALL cONCRETE sLAB|22|162|2|1|1|0||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.|||
4|dEFENSIVE wALL|133|164|2|1|1|0||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0|nil||tHE wALL IS USED FOR~PASSIVE DEFENSE.|||
5|wINDTRAP|66|172|2|2|2|0||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|0|nil|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|||
6|sPICE rEFINERY|68|174|2|3|2|0||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|1000|nil|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ac||
7|rADAR oUTPOST|106|136|2|2|2|0||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.|||
8|sPICE sTORAGE sILO|104|134|2|2|2|0||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000|nil||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.|||
9|bARRACKS|108|168|2|2|2|0||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.|||_4
10|wor tROOPER fACILITY|110|138|2|2|2|0||1|||||||2|2|7|2|||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.|||_4
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|0||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.|||_4
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|0||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.|||_4
13|hI-tECH fACTORY|101|166|2|3|2|0||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.|||_4
14|rEPAIR fACILITY|128|230|2|3|2|0||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|nil|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1||0|nil||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.|||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|59|53||||0|0|0|0|0|0|1|1||0|nil||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.|||
17|sTARPORT|61|228|2|3|3|0||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|0|nil|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|_ac||_4
18|hOUSE OF ix|131|224|2|2|2|0||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.|||
19|pALACE|58|226|2|3|3|0||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1||0|nil||tHIS IS YOUR pALACE.|||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1||0|nil||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.|||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.|||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|59|57|1|48|10|0|0|0|0|0|0|1|1||0|nil||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.|||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|59|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.|||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.|||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.|||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|59|57||||0|0|0|0|0|0|1|1||0|nil||tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.|||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.|||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.|||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.|||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.|||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||224|400|0.3|9|2|56|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.|||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|0||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.|||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0|nil||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.|||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||20|20|1|9|2|100|59|54||41|5|0|0|0|0|0|0|1|1||0|nil||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.|||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|nil||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.|||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1||0|nil||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.|||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.|||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.|||
38.5|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|4||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.|||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.|||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||1|480|0.3|7|1.9|90|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.|||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1||0|nil||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.|||
42|sPICE bLOOM|32||1|1|1|0|11|||2|||||1|1|||||||0|4|0.1|||||53|1|||0|0|0|0|0|0|1|1||0|nil|||||
80|rEPAIR|3|3|5|1|1|0|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|||_ab||action_click
81|lAUNCH|1|1|5|1|1|0|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|||_ab||action_click]]
function _init()
poke(0x5f2d, 0x5)
local _aj=_gm(_ai,"|","\n")
_ai={}
for i=2,46 do
local _ak={}
for j=1,51 do
local _al=_aj[i][j]
if(j!=2 and j<47)_al=tonum(_al)
if j==48 then
_am,_al=_gm(_al,"~"),"" for line in all(_am) do
_al..="\n" ..line
end
end
_ak[_aj[1][j]]=_al
end
_ai[tonum(_aj[i][1])]=_ak
end
for i=-3,66 do
_x[i]={}
for l=-3,66 do
_x[i][l]=0
end
end
cursor={
w=8,h=8,_an=function(self)
return {
x=self.x+(_dz and 0 or _at),y=self.y+(_dz and 0 or _au),w=0,h=0
}
end,_ao=function(self)
local _ap=(_bl and _bl.type==1 and _bl._aq==1 or _d1) and 3 or 0
spr(_ap/3, self.x-_ap, self.y-_ap)
end
}
for my=0,31 do
for mx=0,127 do
local _ar=nil
local _as=mget(mx,my)
if(_as==1) _at,_au,_ar=_f[1][4]-56,_f[1][5]-56,_ai[1]
for o in all(_ai) do
if(o._av!=nil and o._av==_as) _ar=o break
end
if _ar!=nil and (_as==1 or _as>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_e9(mx,my+1))
_a9(_ar, ox*8, oy*8)
end
end
end
_aw=cocreate(function()
while true do
if t_%30==0 then
_gj"false"
_k={}
for _cp in all(_j) do
_k[_cp:_cz()]=_cp
end
_ax={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ay=_e9(i,l)*8
if(_x[i][l]==16) _ax[(i/2).."," ..(l/2)]=_ay>0 and sget(_ay%128+3, _ay\8\16*8+3) or 15
end
yield()
end
end
_az,_a0,_a1,_a2,_o=0,0,false,{0,0},{{},{}}
for building in all(_i) do
if building.id!=4 then
if building._aq==1 or (hq and _gg(building)) then
_ax[(building.x\2\8).."," ..building.y\2\8]=building.col1
end
if building._aq==1 then
_az -=building.power
if(building.id==7) _a1=true
_a0+=building.storage
end
_a2[building._aq]+=1
_go(_o[building.created_by], building.id, building)
end
end
for _cp in all(_j) do
if hq and (_cp._aq==1 or _gg(_cp) and _cp.z==1) then
_ax[(_cp.x\2\8).."," .._cp.y\2\8]=_cp.col1
end
if(_cp.created_by>0) _go(_o[_cp.created_by], _cp.id, _cp)
end
hq,_a3,_l=_a1 and _az>0,2,_ax
if(_g[3]>0 and _g[1]>_g[3]) _a4=1
if(_a2[2]==0 and _a>1) _a4=2
if(_a2[1]==0) _a4=3
if _a4 then
local _a5=40
for data in all{_a4,t()-_p,_dk,_gl(_g[2]),_r[1],_r[2],_q[1],_q[2]} do
dset(_a5, data)
_a5+=1
end
rectfill(30,54,104,70,0)
?"mission " ..(_a4<3 and"complete" or"failed"),36,60,_c
flip()
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _bb=0
end
function _a6(_a7,_a8)
local _bc=_a7.req_faction
return not _bc
or (_bc>0 and _bc==_a8)
or (_bc<0 and -_a8!=_bc)
end
function _a9(_ar, x,y, _aq, _ba)
local _bd=_bu(_ar, x,y, _ar.type, nil, g_[_ar._by], g_[_ar._bz], g_[_ar.func_update], nil)
_bd.ico_obj,_bd._be=_bu(_ar, 109,0, 3, _bd, nil, nil, g_[_ar._bm]), _el and _ar._b2/2 or _ar._b2
_bd._aq=_bd._aq or _aq
if _ba then
_bd._bf=_ba._bf
else
if _bd._aq then
_bd._bf,_h=1,_f[1]
else
local _bg=9999
for i=1,#_f do
local _bh=_gs(x,y,_f[i][4],_f[i][5])
if(_bh<_bg) _bd._bf,_bd._aq,_bg=i,min(i,2),_bh
end
end
end
_bd.created_by,_bd.build_objs,_h=_aq or _bd._aq,{},_f[_bd._bf or _ba._bf]
_bi=_h[1]
_bd._e4,_bd.col1,_bd._aa=_bi,_h[2],_h[3]
if(not _a6(_bd,_bi)) return
for o in all(_ai) do
if o._bj!=nil
and (o._bj==_bd.id or o._bk==_bd.id)
and _a6(o,_bi)
then
add(_bd.build_objs,_bu(o, 109,0, 4, _bd, nil, nil, function(self)
if _7 then
_bl=self
else
_8(self, 1)
end
end)
)
end
end
if _bd._aq>1 then
_bd.ico_obj._bm=nil
end
if _ar.col1 then
_bd.col1,_bd._aa=_ar.col1,_ar._aa
end
if(_bd.z>1) _bd._aq=0
local _bn,_bo=x\8,y\8
if _ar.type==2 then
local _bp=_ar._av==22
for xx=0,_ar.w-1 do
for yy=0,_ar.h-1 do
_fa(_bn+xx, _bo+yy, _bp and 22 or _bd._aq==1 and 81 or 103)
end
end
if(not _bp) add(_i,_bd)
if _bd.id==6 and not _bd._bx then
_d6(_bd)
end
else
_bd.r=_bd.norotate!=1 and (_bn%8)*.125
_bd._bq=function(self)
self._cm,self._ct,self.bullet_y,self.bullet_tx,self._br=4,self.x+4,self.y+4,self._cr.x+self._cr.w/2,self._cr.y+self._cr.h/2
local dx,dy=self.bullet_tx-self._ct,self._br-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bs=(dx/d)*2,(dy/d)*2
_gh(self.fire_sfx)
_c5(self)
end
if(_bd._bt==0) _fa(_bn,_bo,21)
add(_j,_bd)
_er(_bd)
end
_c5(_bd)
return _bd
end
function _bu(_bv, x,y, _bw, _bx, _by, _bz, _bm)
local _b0={
_b1=_bv,id=_bv.id,_b2=_bv._b2,x=x,y=y,z=_bv.z,
_b3=x/8,_b4=y/8,type=_bw,_bx=_bx,_bm=_bm,w=_bv.w*8,
h=_bv.h*8,_b5=_bv._av,_b6=_bv.w,
_b7=_bv.h,
_b8=_gm(_bv._b8),_an=function(self)
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
if(self._e4 and self.id!=18) pal(12,self.col1) pal(14,self._aa)
if ty>2 and ty<5 then
local _b9=ty==4 and self or self._bx
rectfill(x-1,y-1,x+16,y+19, 0)
local hp=_b9._b2
local _al=self._ae==1 and _b9._be/6.666 or 15*(_b9._be/hp)
if(_b9._be>0 and not _7) rectfill(x,y+17,x+_al,y+18, self._ae==1 and 12 or (split"8,10,11,11")[_b9._be\(hp/3)+1])
pal(11,_b9.icol1) pal(3,_b9.icol2)
end
if self._b8 then
pal(self.col_cycle_src, self._b8[self._ad])
end
if(_bz) _bz(self)
if self.r then
if not self._co or self._co>.025 then
local ca,sa=cos(.25-self.r),sin(.25-self.r)
local _ca,_cb,_cc=ca,sa,0xfff8
ca*=4-.5
sa*=4-.5
local _cd,_ce=sa-ca+4,-ca-sa+4
for ix=0,7 do
local _cf,_cg=_cd,_ce
for iy=0,7 do
if((_cf|_cg) & _cc)==0 then
local c=sget(self._av%16*8+_cf,self._av\16*8+_cg)
if c!=self.trans_col then
if(self.z) pset(x+ix,y+iy, 1)
pset(x+ix,y+iy-self.z, flr(self._cl)%2==0 and 7 or nil or c)
end
end
_cf-=_cb
_cg+=_ca
end
_cd+=_ca
_ce+=_cb
end
end
else
if ty>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
else
spr(self._av, self.x, self.y, self._b6, self._b7)
end
end
if self._ct then
if self._ch==1 then
pset(self._ct,self.bullet_y, rnd"2" <1 and 8 or 9)
else
local _ci=self._ch<=2
_gw(
self._ct, self.bullet_y,_ci and 1.9 or 0,0, 0, _ci and -.3 or 1,0,_ci and 10 or 2.5,_ci and _gm"7,10,9,8,2" or {15},rnd"2" <1 and 0xa5a5.8 or 0)
end
end
if(self._be<self._b2*.33 and not self.altframe and rnd"10" <1 and ty<=2) _gw(self.x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,_gm"10,8,9,6", rnd"2" <1 and 0xa5a5.8 or 0)
self._cj=0
end
end,_ck=function(self)
local _be=self._be
local ty=self.type
local id=self.id
self._cl=max(self._cl-.4,1)
if self._cj>0 and self.created_by>0 then
_gj"true"
if(_a3==0 or stat(24)>5) _a3=1 music"0"
if(self._e3>0 and self._cm==0) _e1(self, self._cs)
if(self._av<=49 and _be<100) self._b6,self._b7=0.5,0.5
if(_be<50 and self._cm!=7) _gc(self,_gr(_o[self.created_by][14]) or self._eu)
end
if(ty<=2 and _be<=0 and not self._co) self._cm=5 self._cn=nil self._co=(ty==2 and 1 or .5) _gh(self.death_sfx) _bb+=(ty==2 or self.id==38) and .25 or 0
if self._co then
self._co-=.025
if self._co<=0 then
if ty==2 then
for xx=0,self._b6-1 do
for yy=0,self._b7-1 do
_fa(self.x/8+xx, self.y/8+yy, 21)
end
end
del(_i,self)
_q[self._cs.created_by]+=1
else
local gx,gy=self:_c0()
if(_e9(gx,gy)<9) _fa(gx,gy,33)
if(id<=16) _fa(gx,gy,21)
if(self._eu) self._eu._ag=false
_d2(self)
if id==42 then
_e5(self,gx,gy,function (_cp,x,y)
if(_e9(x,y)==0) _fa(x,y,10)
end,4, true)
end
if(self._cs) _r[self._cs.created_by]+=1
end
if(_bl==self) _bl=nil
else
if(rnd(ty==2 and 2 or 8)<1) _c3(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self.framecount!=nil then
self._cq+=1
if self._cq > self.framecount then
self._cq=0
if self.altframe
and self._cm==2 then
self._av=self._b5+(self.altframe-self._av)
end
if self._b8 then
self._ad+=1
if(self._ad>#self._b8) self._ad=1
end
end
end
if self._ct then
self._ct+=self.bullet_dx
self.bullet_y+=self._bs
if _gs(
self._ct,self.bullet_y,self.bullet_tx,self._br) < 2
then
_c3(self._ct, self.bullet_y, self._ch)
local _cr=self._cr
if _gs(
self._ct,self.bullet_y,_cr.x+_cr.w/2,_cr.y+_cr.h/2) < 4
then
_cr._be-=self._e3
_cr._cj,_cr._cs=self._ch,self
_0[_cr._e4]=_cr.id!=42
if id==40 and _cr._bt!=nil then
_cr.old_fact_data,_cr._e4,_cr._aq,_cr.created_by,_cr.col1,_cr._aa
=
{_cr._e4,_cr._aq,_cr.created_by,_cr.col1,_cr._aa},self._e4,self._aq,self.created_by,self.col1,self._aa
_er(self)
elseif _cr.old_fact_data then
_cr.old_fact_data,_cr._e4,_cr._aq,_cr.created_by,_cr.col1,_cr._aa
=
nil,unpack(_cr.old_fact_data)
_er(_cr)
end
end
self._ct=nil
end
end
if self._ae>0
and not self._af
and not self._cu then
if self._ae==1 and self.spent>self._fr then
self._cu=true
if(self._bx._aq==1) _gh"56" _f5"cONSTRUCTION cOMPLETE"
if self._b1.type==1
and self._bj !=1 then
local ux,uy=_ez(self._bx)
_a9(self._b1,ux,uy,self._bx._aq,self._bx)
_f7(self)
end
elseif self._ae==2 and _be>self._b2 then
self._ae=0
if ty==1 and self._bt>0 then
self._ev._b8,self._cm={0},0
self.x,self.y=_ez(self)
end
else
if self._cv>(self._ae==1 and 3 or 100) then
if(_c1(-1,self._ae==1 and self._bx or self)) self._cv=0 self.spent+=1
else
self._cv+=1
self._be=(self._ae==1 and (self.spent/self._fr)*100 or _be+.5)
end
end
end
self._cw=max(self._cw-.1)
if self._aq==1 then
if(id==5) self._cx="wINDTRAP (∧" .._az..")"
if(self.storage>0) self._cx=self._b1._cx.." (" ..flr(_dk/_a0*100).."%)" end
end,_cy=function(self,x,y)
self.x,self.y=x,y
end,_cz=function(self)
local x,y=self:_c0()
return x.."," ..y
end,_c0=function(self)
return self.x\8,self.y\8
end
}
for k,v in pairs(_bv) do
if not _b0[k] and v!="" then
_b0[k]=v
end
end
return _b0
end
function _c1(_c2, _b0)
if(_gl(_g[_b0._aq])+_c2<0) return false
_g[_b0._aq]+=sgn(_c2)*(abs(_c2)>>16)
if(_b0._aq==1) sfx"63" return true
end
function _c3(x,y,_c4)
_gw(x, y, 2,0, 0, .1, -.01, _c4==1 and 5 or 20, _c4==1.9 and _gm"3,11,3" or _gm"5,7,5,7,10,8,9,2", rnd"2" <1 and 0xa5a5.8)
end
function _c5(_c6)
if(_c6._aq!=1 and _c6._cm!=4) return
local _c7=_c6.type==2 and 3 or 2
for xx=-_c7,_c7 do
for yy=-_c7,_c7 do
local _c8,_c9=_c6.x\8+xx,_c6.y\8+yy
_x[_c8][_c9]=16
_ep(_c8,_c9)
for dy=-1,1 do
for dx=-1,1 do
_ep(_c8+dx,_c9+dy)
end
end
end
end
end
function _update60()
_da,_db,_dc=stat"32",stat"33",stat"34" _dd,_de,_df=(_dc==1 and _d3 !=_dc) or btnp"5", (_dc>0) or btn"5", (_dc==2 and _d3 !=_dc) or btnp"4"
if _dg==nil then
_dg,_dh=64,64
elseif _da==_di and _db==_dj then
b=btn()
_dg+=b\2%2-b%2
_dh+=b\8%2-b\4%2
else
_dg,_dh=_da,_db
end
_dg,_dh=mid(_dg,127),mid(_dh,127)
cursor.x,cursor.y,_di,_dj=_dg,_dh,_da,_db
if not _7 then
if(_dg<4) _at-=2
if(_dg>123) _at+=2
if(_dh<4) _au-=2
if(_dh>123) _au+=2
_at,_au,_dk=mid(_at,_y),mid(-10,_au,_y),_gl(_g[1])
for _cp in all(_j) do
if(_cp._cn) _dl=coresume(_cp._cn, _cp)
if(not _dl) _cp._cn=nil
if _dq
and fget(_e9(_cp:_c0()),2)
and _gs(_dw,_dx,_cp.x,_cp.y) < 1
and _cp.z==1
then
_d2(_cp)
_dm=1
_gh"50" end
end
for p in all(_n) do
p.dy +=p._gx
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._be +=1
if(p._be>=p._g1) del(_n,p)
end
if t()%_b==0 then
local _dn=rnd(_j)
if _dn._aq==2 and _0[_dn._e4] and _dn._e3>0 and _dn._cm==0 then
_ge(_dn)
end
local _do=rnd(_i)
if _do._aq==2
and (not _do._ah or _do._ah._ae!=1) then
local u=rnd(_do.build_objs)
if u and u._bt>0 then
u:_bm()
end
if _do._be<_do._b2 and _do._ae!=2 then
_8(_do, 2)
end
end
local _dp=_gr(_o[2][19])
if _dp
and _0[_dp._e4]
and _dp._cw<=0
and _gf and _gf.type==2 then
_e1(_dp, _gf)
end
end
_dv-=1
if _dv<0 then
if _dq then
_dq=nil
else
_dq,_dr,_ds,_dt,_dm={{rnd"500",rnd"500" }},rnd"1",0,_gm"15,9,4",0
end
_du=rnd"5000" _dv=_du
end
if _dq then
if(t_%6<1 or #_dq<30) and _dm==0 then
while #_dq<31 do
if(rnd"9" <.5) _ds=rnd".04" -.02
_dw,_dx=_dq[#_dq][1],_dq[#_dq][2]
add(_dq,{_dw+sin(_dr),_dx-cos(_dr)})
_dr+=_ds
end
end
if(#_dq>30) del(_dq,_dq[1])
if(_dm>0) _dm+=1 _e0(_dw,_dx,rnd"1")
_dm%=200
end
assert(coresume(_aw))
end
_dy=false
if _bl then
_dz=true
_f8(_ed)
_f8(_ee)
if(_bl.ico_obj and not _7 and not _dy) _f8(_bl.ico_obj) _f8(_bl._ah)
if(_7) foreach(_bl.build_objs, _f8) foreach(_3, _f8)
_dz=false
end
if not _7
and not _dy then
foreach(_j, _f8)
foreach(_i, _f8)
end
if _de
and not _7
and _dg>89 and _dg<122
and _dh>90 and _dh<123 then
_at,_au=mid((_dg-94)*16, _y),mid(-10,(_dh-94)*16, _y)
_bl=_d4
elseif _dd then
if(_bl and _bl.type<=2) _f5(_bl._cx)
if _dy then
if not _7 and _bl._bx!=nil then
if(_bl._bm) _bl:_bm()
_bl=_d4
goto skip_collisions
end
if(_7 and _2._f4 and _2._bm) _2:_bm()
if(_bl._aq==1 and _bl.type==1 and _bl!=_d4 and _bl._bt>0) _gh"62"
if(_bl.created_by!=1 and _d4 and (_d4.type==1 or (_d4.id==19 and _d1)) and _d4._aq==1) _bl._cl=10 _e1(_d4, _bl) _bl=nil
else
if _bl
and _bl._aq==1
and _bl._bt>0
and _bl._cm!=7 then
_bl._cn=cocreate(function(_cp)
_fd(_cp, (_at+_dg)\8, (_au+_dh)\8)
_er(_cp)
end)
end
local _d0=_bl and _bl._ah
if _d0
and _d0._be>=100
and _ej then
_a9(_d0._b1,(cursor.x+_at)\8 *8,(cursor.y+_au)\8 *8, 1)
_f7(_d0)
_gh"61" end
end
_d1=false
elseif _df and not _7 then
_bl,_d1=nil,false
end
::skip_collisions::
_d3,_d4,_d5=_dc,_bl,_2
t_+=1
end
function _d2(_cp)
del(_j,_cp)
if _cp.id==32 and #_o[_cp.created_by][32]<=1 then
_d8=_gr(_o[_cp.created_by][6])
if(_d8) _d6(_d8)
end
end
function _d6(_d7)
local ux,uy=_ez(_d7)
local _d9=_a9(_ai[32],ux,uy,_d7._aq,_d7)
end
function _draw()
cls"15"
camera(_at+(16-rnd"32")*_bb, _au+(16-rnd"32")*_bb)
_bb=(_bb>0.05) and _bb*0.95 or 0
if _dq then
for i=1,#_dq do
if(i%2==1) fillp(0xa5a5.8)
circfill(
_dq[i][1]+4,_dq[i][2]+4,4,_dt[i%#_dt+1])
fillp()
end
if(_dm>0) spr(88+_dm\100, _dw, _dx)
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
for building in all(_i) do
if not _7 then
building:_ck()
if(building._ah) building._ah:_ck()
end
building:_ao()
if(building==_bl) rect(_bl.x, _bl.y, _bl.x+_bl.w-1, _bl.y+_bl.h-1, 7)
end
pal()
for p=1,2 do
for _cp in all(_j) do
if(p==1 and _cp.z==1) or (p==2 and _cp.z>1) then
if(not _7) _cp:_ck()
if(_cp._ae!=2 or _cp._bt==0) _cp:_ao()
if(_cp==_bl) spr(2, _bl.x, _bl.y-_bl.z)
end
end
end
for p in all(_n) do
if(p._gz) fillp(p._gz)
circfill(p.x,p.y,p.r,p._gy[ flr((#p._gy/p._g1)*p._be)+1 ])
fillp()
end
local _ea,_eb=_at\8,_au\8
palt(0,false)
palt(11,true)
for xx=_ea-1,_ea+16 do
for yy=_eb-1,_eb+16 do
local gx,gy=xx*8,yy*8
if _x[xx][yy]!=0 and _x[xx][yy]!=16 then
spr(_x[xx][yy]+31,gx,gy)
elseif _x[xx][yy]<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
camera()
pal()
palt(0,false)
rectfill(0,0,127,8,9)
line(0,9,127,9,4)
rect(90,90,124,124,_c)
rect(91,91,123,123,_d)
rectfill(92,92,122,122,0)
if(_w>0) _w-=1 ?_v,2,2
?sub("000000", #_dk+1).._dk, 103,2, _d
if hq!=_z then
_u,_ec=hq and 1 or 59, hq and 1 or -1
if(_ec<1) _f5"pOWER LOW.bUILD wINDTRAP" _gh"55" end
_z=hq
if _u>0 and _u<60 then
_u+=_ec
clip(
max(109-_u,91),max(109-(_u>20 and _u-20 or 0),92),min(_u*2,32),min((_u>20 and _u-20 or 1)*2,32))
for i=1,300 do
pset(92+rnd"32",91+rnd"32",5+rnd"3")
end
clip()
return
end
for xx=0,30 do
for yy=0,30 do
local k=xx.."," ..yy
if(_l[k]) pset(92+xx,92+yy,_l[k])
end
end
local cx,cy=92+_at/16,93+_au/16
rect(cx,cy, cx+7,cy+6, 7)
local _d0=_bl and _bl._ah
if _bl and _bl.ico_spr then
_bl.ico_obj:_cy(109,20)
_bl.ico_obj:_ao()
_ed,_ee=nil,nil
if _bl._aq==1 then
if _d0 then
_d0:_cy(109,44)
_d0:_ao()
end
if _bl._be<_bl._b2
and _bl.id!=4
and (_bl.type==2
or _bl._bt==0) then
_ed=_bu(_ai[80], 117,28, 5, {}, nil,_ab, function()
_8(_d4, 2)
end)
_ed:_ao()
end
if(_bl.id==19
and _bl._cw<=0)
or _bl.id==35
then
_ee=_bu(_ai[81], 109,29, 5, {}, nil,_ab, function()
if _d4.id!=35 then
_f5"pick target" _d1=true
else
local mx,my=_d4:_c0()
local _al=_e9(mx,my)
if _al>=12 and _al<=22 then
_d4._be=0
_a9(_ai[1],mx*8,my*8,1)
_gh"61" end
_d4=nil
end
end)
_ee:_ao()
end
end
end
pal()
if _d0
and (_d0.type==4
and _d0._bt==0)
and _d0._be>=100 then
local _ef,_eg=(cursor.x+_at)\8, (cursor.y+_au)\8
local _eh,_ei,w,h=_ef*8-_at,_eg*8-_au,_d0._b6,_d0._b7
_ej,_ek,_el=false,false,false
for xx=-1,w do
for yy=-1,h do
local _al=_e9(_ef+xx, _eg+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(_al==22 or _al>=58 and _al<=81) _ej=true
else
if(_al>=12 and _al<=21) _el=true
if(_k[_ef+xx.."," .._eg+yy] or _al==0 or _al<=11 or _al>=23) _ek=true
end
end
end
if(_ek)_ej=false
fillp("0b1110110110110111.1")
rectfill(_eh, _ei,_eh+_d0.w, _ei+_d0.h, _ej and 11 or 8)
fillp()
end
if _7 then
fillp(▒)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,_d)
rect(3,22,124,95,_c)
if _bl.build_objs then
_bl._eo={}
rectfill(6,25,27,92,0)
local _em=1
for i=1,#_bl.build_objs do
local _en=_bl.build_objs[i]
if not _en.req_id
or _o[_bl.created_by][_en.req_id]
and _en.req_level<=_a
then
_bl._eo[_em]=_en
if _em>=_1 and _em<=_1+2 then
_en:_cy(9,28+(_em-_1)*19)
_en:_ao()
else
_en:_cy(-16,16)
end
_2=_2 or _bl._eo[1]
if _2==_en then
_5=_em
rect(_en.x-2, _en.y-2,_en.x+17, _en.y+17,7)
?_2._cx,30,26
?"cOST:" .._2._fr,85,33,9
?_2.description,30,34,6
end
_em+=1
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
function _ep(x,y)
if(x<0 or x>#_x or y<0 or y>#_x) return
local _cc=0
if _x[x][y]!=0 then
if(_x[x][y-1]>0) _cc+=1
if(_x[x-1][y]>0) _cc+=2
if(_x[x+1][y]>0) _cc+=4
if(_x[x][y+1]>0) _cc+=8
_x[x][y]=1 + _cc
end
end
function _eq(x,y)
local _al=_e9(x,y)
return _al>=4 and _al<=10
end
function _er(_cp, _es)
_cp._cm,_cp.link,_cp._et=_es or 0,nil,true
_cp._cn=cocreate(function(self)
while true do
if self.z>1 then
_fd(self,mid(flr(self._b3+rnd"32")-16,64),mid(flr(self._b4+rnd"32")-16,64))
end
if rnd(250)<1 and self._e3>0 and self._cm!=8 then
local gx,gy=self:_c0()
_e5(self,gx,gy,function (_cp,x,y)
local _cr=_k[x.."," ..y]
if _cr!=null and _cr.created_by!=_cp.created_by and _x[x][y]==16 and _cr.z==1 then
_e1(_cp,_cr)
return true
end
end,max(4,self.range))
elseif self.id==34 then
_ge(self)
end
local _eu=self._ev or self._eu
if self.id==32 then
if self._cm==0 or self._cm==9 then
if self.capacity<=1500
and self._cm!=7 and self._cm!=9 then
self._ev=nil
local sx,sy
local tx,ty=self:_c0()
if _eq(tx,ty) and not self._ew then
sx,sy=tx,ty
else
_e5(self,tx,ty,function(_cp,x,y)
if _eq(x,y) and rnd"10" <1 then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cp._et=_fd(_cp,sx,sy,nil,not _cp._et)
if(_eq(_cp:_c0())) _cp._cm=6
end
end
elseif self.capacity >=1500
and self._cm!=7 then
self.sx,self.sy=self:_c0()
_gc(self,_eu or _gr(_o[_cp.created_by][6]))
elseif self._cm==6 then
self._ew=false
_e0(_cp.x, _cp.y, _cp.r+.75+rnd".2" -.1)
local _ex=_cp:_cz()
self.capacity+=.5
_m[_ex],self._cx=(_m[_ex] or 1000)-1,"hARVESTER (" ..flr(self.capacity/1500*100).."%)"
if _m[_ex] <=0 then
local _bn,_bo=self:_c0()
for yy=-1,1 do
for xx=-1,1 do
_al=_e9(_bn+xx,_bo+yy)
_fa(_bn+xx,_bo+yy,(xx==0 and yy==0) and 0 or ((_al>1 and _al<8) and 10 or _al)
)
end
end
self._cm=0
end
if(self.capacity%300==0) self._ew=true self._cm=0
end
end
if self.id>26 then
if self._cm==9 then
if _eu._be>0 and not _eu._ey and self._be>0 then
_eu._ag,self._cm,self.r,self.x,self.y=false,8,.25,_eu.x+16,_eu.y+4
if(_bl==self) _bl=nil
if self.capacity and _eu.id==6 then
_eu._ey=true
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
if tonum(_dk)<_a0 then
_c1(2,self)
elseif self._aq==1 then
_f5"sPICE LOST. bUILD sILO" end
end
yield()
end
self.capacity,_eu._ey,self._cm=0,false,0
if(self.sx) _fd(self, self.sx, self.sy, 0, true)
else
self._ae,self._cv,_eu.col_cycle_src,_eu._b8=2,0,8,_gm"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _ez(_cr)
local ux,uy=_e5(_cr,(_cr.x+8)\8, (_cr.y+8)\8, _fc, nil, true)
return ux*8,uy*8
end
function _e0(x,y,r)
if(rnd"5" <1) _gw(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gm"2,4,9,15", 0xa5a5.8)
end
function _e1(_cp, _cr)
if _cp.id!=19 then
local _e2=_cp.range*5
_cp._cm,_cp._cr,_cp._cn=3,_cr, cocreate(function(self)
while _cr._be>0 do
if _gs(_cp.x,_cp.y,_cr.x,_cr.y) > _e2
and _cp._bt>0 then
_fd(_cp,_cr.x\8,_cr.y\8,_e2)
if _cp._e3==600 then
_cp._be=0
for i=1,_cp.id/3 do
_c3(_cp.x+rnd"32" -16,_cp.y+rnd"32" -16, 2)
end
_cr._be-=(400+rnd"200")
_cr._cs=_cp
return
end
end
if not _cp.norotate then
local a=atan2(_cp.x-_cr.x, _cp.y-_cr.y)
while (_cp.r !=a) do
_gt(_cp, a)
end
end
if _gs(_cp.x,_cp.y,_cr.x,_cr.y)<=_e2 then
if(_cp._cw<=0 and not _cp._ct and _cr._be>0) _cp._bq(_cp) _cp._cw=_cp.fire_rate
elseif _cp._bt==0 then
_er(_cp)
end
yield()
if(_cp.id==40 or _cp.id==34 or _cr._e4==_cp._e4 or _cr.link) break
end
_er(_cp)
end)
else
_e1(_a9(_ai[({24,25,38,38.5})[_cp._e4]], _cp.x,_cp.y, _cp._aq, _cp), _cr)
_cp._cw=1750
end
end
function _e5(_cp,x,y,_e6,_e7,_e8)
for t=0,_e7 or 4,.04 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_e6(_cp,xx,yy)) return xx,yy
if(not _e8) yield()
end
end
function _e9(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _fa(mx,my,_fb)
if(my>31)mx+=64 my-=32
mset(mx,my,_fb)
end
function _fc(_cp,x,y)
return not fget(_e9(x,y),0)
and not _k[x.."," ..y]
end
function _fd(_cp,x,y,_fe,_ff,_es)
local _fg=_cp.z>1
if _ff then
local _fh=_o and _gr(_o[_cp.created_by][33])
if _fh and not _fh.link and _fh._e4==_cp._e4 then
_fh.link,_cp.link,_cp._cm, _fh._cn=_cp,_fh,2, cocreate(function(unit_c)
_fd(unit_c,_cp.x\8,_cp.y\8)
if(_bl==_cp) _bl=nil
if _cp._be>0 then
_fh._av=149
del(_j,_cp)
_fd(_fh,x,y)
_cp:_cy(_fh.x,_fh.y)
add(_j, _cp)
_er(_cp,_es)
end
_fh._av=73
_er(_fh)
end)
return
end
end
::restart_move_unit::
if not _fg and not _fc(nil,x,y) then
x,y=_e5(_cp,x,y,_fc)
end
_cp.tx,_cp.ty,_cp.prev_state,_cp._cm,_cp._fi=x*8,y*8,_cp._cm,1,nil
local start, goal, _fk={ x=_cp.x\8, y=_cp.y\8}, {x=x, y=y}, function (_fj) return (_fj.y<<8) + _fj.x end
local _fs,_fl={
_fm=start,_fn=0,_fo=_gv(start, goal)
}, {}
_fl[_fk(start)]=_fs
local frontier, frontier_len, goal_id, max_number, count={_fs}, 1, _fk(goal), 32767.99, 0
while frontier_len > 0 do
local _fr, _fp=max_number
for i=1, frontier_len do
local _fq=frontier[i]._fn + frontier[i]._fo
if(_fq <=_fr) _fp,_fr=i,_fq
end
_fs=frontier[_fp]
frontier[_fp], _fs._ft=frontier[frontier_len], true
frontier_len -=1
local p=_fs._fm
if _fk(p)==goal_id then
p={goal}
while _fs._fy do
_fs=_fl[_fk(_fs._fy)]
add(p, _fs._fm)
end
_cp._fi=p
goto end_pathfinding
end
local _fu={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx=p.x+xx
local ny=p.y+yy
if(xx!=0 or yy!=0)
and _fg or not fget(_e9(nx,ny),0)
and not fget(_e9(nx,ny),7)
and not _k[nx.."," ..ny]
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_fu, {x=nx, y=ny})
end
end
end
for n in all(_fu) do
local id=_fk(n)
local _fv=not _fg and fget(_e9(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _fv+=.2
local _fx, _fw=
_fl[id],_fs._fn + _fv
if not _fx then
_fx={
_fm=n,_fn=max_number,_fo=_gv(n, goal)
}
frontier_len +=1
frontier[frontier_len], _fl[id]=_fx, _fx
end
if not _fx._ft and _fx._fn > _fw then
_fx._fn, _fx._fy=_fw, p
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
_cp.prev_state,_cp._cm=_cp._cm,2
if _cp._fi!=nil then
for i=#_cp._fi-1,1,-1 do
local _fj=_cp._fi[i]
if not _cp.norotate then
local a=atan2(
_cp.x-(_fj.x*8),
_cp.y-(_fj.y*8) )
while (_cp.r !=a) do
_gt(_cp, a)
end
end
if(not _fg and not _fc(nil,_fj.x,_fj.y)) goto restart_move_unit
local _fz,_f0=_cp._bt or .5, sqrt((_fj.x*8-_cp.x)^2+(_fj.y*8-_cp.y)^2)
local _f1,_f2=_fz * (_fj.x*8 - _cp.x) / _f0, _fz * (_fj.y*8 - _cp.y) / _f0
for i=0, _f0/_fz-1 do
_k[_fj.x.."," .._fj.y]=_cp
_cp.x+=_f1
_cp.y+=_f2
if _cp.id==33 then
if _cp.link then
local d=_gs(_cp.x,_cp.y,_cp.tx,_cp.ty)
if(d<32) _cp.z=d/4
end
_cp.z=mid(2,_cp.z+0.1,8)
_cp._bt=_cp.z/12
end
yield()
end
_cp.x,_cp.y,_k[_fj.x.."," .._fj.y]=_fj.x*8, _fj.y*8,_cp
_c5(_cp)
if(_gs(_cp.x,_cp.y,_cp.tx,_cp.ty) <=(_fe or 0)) break
end
else
_cp._cm=0
return false
end
_cp._cm=0
return true
end
function _f3(x,_f4,_bm,_w)
add(_3,{
x=x,y=83,w=_w or 22,h=8,_f4=_f4,_an=function(self)
return self
end,_ao=function(self)
local c=self._gb and 7 or 6
if(#_f4>1)rectfill(self.x,83,self.x+self.w,91, c)
?self._f4,self.x+2,85,#_f4>1 and 0 or c
end,_bm=_bm
})
end
function _f5(_f6)
_v,_w=_f6,500
end
function _f7(_b0)
_b0._be,_b0._ae,_b0.spent,_b0._cu=0,0,0,false
if(_b0._bx) _b0._bx._ag=false
end
function _f8(_b0)
if(not _b0) return
local _f9,_ga=cursor:_an(),_b0:_an()
_b0._gb=_f9.x <=_ga.x + _ga.w and
_f9.x + _f9.w >=_ga.x and
_f9.y <=_ga.y + _ga.h and
_f9.y + _f9.h >=_ga.y
if _dd and _b0._gb then
if _7 then
_2=_b0
else
if(_b0.type<=2 and _x[(cursor.x+_at)\8][(cursor.y+_au)\8]!=16 or _b0._cm==8) return
if _bl
and _d4
and (_b0.id==6 and _d4.id==32
or _b0.id==14 and _d4.id>26)
and _b0._aq==1 and _d4._aq==1
then
_gc(_d4,_b0)
return
else
_bl=_b0
end
end
_dy=true
end
end
function _gc(_cp,_d7)
_d7=_d7 or _gr(_o[_cp.created_by][1]) or _cp
_cp._cm,_d7._ag,_cp._ev=7,true,_d7
if(_cp.id!=32 or _d7.id==6) _cp._eu=_d7
_cp._cn=cocreate(function(_cp)
local _gd=_d7.id!=1 and 9 or 0
_fd(_cp, (_d7.x+16)/8, _d7.y/8, 0, true, _gd)
if(not _cp.link) _er(_cp, _gd)
end)
end
_dv=0
function _ge(_b0)
repeat
_gf=(rnd"4" <1) and rnd(_j) or rnd(_i)
until _gf.created_by!=_b0.created_by
if(_gf and _gg(_gf)) _e1(_b0, _gf)
end
function _gg(_b0)
local x,y=_b0:_c0()
return _x[x][y]==16
end
function _gh(_gi)
sfx(_gi,3)
end
function _gj(_gk)
local _al=peek(0x3115)
if(_al & 128 > 0 !=_gk) _al=_al^^128
poke(0x3115, _al)
end
function _gl(_al)
local s,v="",abs(_al)
repeat
s=(v % 0x0.000a / 0x.0001)..s
v /=10
until v==0
return s
end
function _gm(_gn,d,dd)
d=d or","
if(dd) _gn=split(_gn,dd)
if type(_gn)=="table" then
local t={}
while #_gn>0 do
local s=_gn[1]
add(t,split(s,d))
del(_gn,s)
end
return t
else
return split(_gn,d)
end
end
function _go(_gp,_gq,_c6)
if(not _gp[_gq]) _gp[_gq]={}
add(_gp[_gq],_c6)
end
function _gr(_gp)
if(_gp) return rnd(_gp)
end
function _gs(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gt(_cp, _gu)
local _c2=_gu-_cp.r
if(_cp.z>1) _cp.r=_gu
if _c2 > 0.5 then
_c2 -=1
elseif _c2 < -0.5 then
_c2 +=1
end
if _c2 > 0.0087 then
_cp.r +=0.0087
elseif _c2 < -0.0087 then
_cp.r -=0.0087
else
_cp.r=_gu
end
yield()
end
function _gv(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _gw(x, y, r, dx, dy, dr, _gx, _be, _gy, _gz)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_be=0,_gx=_gx,_gy=_gy, _gz=_gz,_g0=y, _g1=_be }, 1)
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
666dddd5555555554456699999666ddd4900944c5f659999d82d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336d8d2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446b600244ff999455d44444444549
996666666669699944467777777666dd777666666353655dd8dffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355b332494fff9444444449999999
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
0d14000000000509090909060000130d0d0d0d0d0d0e0405050909060c0d0d0f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000a000a0509090505000000130d0d0d0d14040505050508080c0d0d0d2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000000000a08050800000000000000000000000000000000110d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000030000000000000000000000030000000000000000c0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000130d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000110d120000000000000000000004050a070b00000000000000130d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001114000000000000000000000004050905050b0b000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f140000000000003100110d1200310a0509060b0b0b0b00000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0000000000000000110d0d0d120005050508000b0b0b0b000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d00000000000000000c010d0d34120a050800000b0b0b0b0b0000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e00000000000011340d0d0d0d0d0d0d120000000b0b300b0b0000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0f000000110f0d0d0d0d0d0d0d0d0d0d0000000b0b0b0b0b0000003000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d300e0000000c0d0d0d0d0d10100d0d0d14000000000b0b0b000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0e000000130d0d0d0d0e3100130d140000000000000000000000100000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0e000000000c0d0d0d0e00000000000000000000003000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0000000000130d0d0d0d120000000000000000111200110d1400000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e000000003000130d0d0d0d12000000000000110d0d0f0d140000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0000000000000013100d0d0e0000003000110d0d0d0d14000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0a00000705050707000c0d0d12000000110d0d0d101400000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d140007050505090905000d0d0d0d0f0f0f0d0d0d0e000000000000110f0f0f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1404050505050505050800130d0d0d100d0d10100d0e0000000000110d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
050505050509050a00003000000a0505050505060c0d12000000110d0d0d0d102f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05090905090909050000000000050909090505080c0d0d0f0f0f0d0d0d0d14002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090505050505050a00000000000a0505050905110d0d0d0d0d0d0d0d0d0e00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
050508110f0f120000000000000004050505080c0d0d0d0d0d0d0d0d0d0e00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00110d0d0d0d0d0d12000000003000000000110d0d0d0d0d0d0d0d0d0d0d12002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0d0d0d0d0d0d0d0d1200000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d12000000000000110d0d0d0d0d0d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d140405070d0d0d0d0d0e000000000f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d1400050905130d0d0d140700000000130d0d0d0d0d0d0d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000050505050505050505060000000000131010100d0d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000a050505090909090505060000000000000000130d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

