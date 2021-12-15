pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)
cartdata"pn_undune2"
_a,_b,_c,_d=dget"0",dget"1",dget"7",dget"8" _e,_f={},{
dget"35" >>16,
500>>16,
dget"36" >>16
}
for i=1,dget"5" do
local _g={}
for j=1,5 do
_g[j]=dget(i*5+j)
end
add(_e,_g)
end
g_,_h,_i,_j,_k,_l,_m,_n,_o,t_,_p,_q,_r,_s,hq,_t,_u,_v,_w={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,"",0,{}
_x=hq
g_._1=function(self)
_y,_z,_0=1,nil,{}
_fi(6,"⬆️",function()
_2=mid(1,_2-1,#_bi._fh)
_z=_bi._fh[_2]
if(_2<_y) _y-=1
end, 10)
_fi(17,"⬇️",function()
local _3=#_bi._fh
if(_2<_3) _2=mid(1,_2+1,_3)
_z=_bi._fh[_2]
if(_2>_y+2) _y=min(_y+1,_3-2)
end, 10)
_fi(32,"build",function()
_4=nil
_de:_bj()
end)
_fi(96,"close",function()
_4=nil
end)
_4=self
end
g_._9=function(self)
local _5=self._5
pal{
[8]=_5,[10]=_5,[11]=_5,[12]=self.col1,[14]=self._5
}
if self._aj then
pal(self._b7[self._aa], self.col1)
else
pal(11,self.col1)
self._aa=1
end
end
_6=function(self)
pal(7,8)
if(self.id==80 and _bi._ab==2 and not _bi._ai) pal(7,11)
end
_7=function()
_af(_ah, 2)
end
_8=function(self)
if _ah.id!=35 then
_ey"pick target" _ac=true
else
local mx,my=_ah:_cs()
local _ad=_d4(mx,my)
if _ad>=12 and _ad<=22 then
_ah._ae=0
_a7(_al[1],mx*8,my*8,1)
_ga"61" end
_ah=nil
end
end
function _af(self, _ag)
self._co,self.last_process,self._ab=0,self._ab,_ag
if(self._ae>0 and self.last_process>0) self._ai=not self._ai
if(_ag==1) self._bw._aj=true self._bw._ak=self
end
_al=[[id|_cp|_ax|ico_spr|type|w|h|z|trans_col|_bg|_bh|_as|col1|_5|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_em|power|arms|_b1|_bq|range|_b9|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|_ae|_ci|_ab|spent|_dy|_cb|_cd|_aa|col_cycle_src|storage|_b7|description|_bx|_by|func_update|_bj
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||_1
2|lARGE cONCRETE sLAB|22|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|22|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|0|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|1000|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||_9||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1||0||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||_1
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||_1
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||_1
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||_1
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||_1
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1||0||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1||0||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|0|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||_9||_1
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1||0||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1||0||tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1||0||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1||0||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||224|400|0.3|9|2|56|58|54||||0|0|0|0|0|0|1|1||0||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||150|20|1|9|2|20||54||41|5|0|0|0|0|0|0|1|1||0||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1||0||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1||0||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||50|480|0.3|7|2|500|59|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1||0||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|32||1|1|1|1|11|||2|||||1|1|||||||0|4|0|||||53|1|||0|0|0|0|0|0|1|1||0||||||
80|rEPAIR|3|3|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||_6||action_click
81|lAUNCH|1|1|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||_6||action_click]]
function _init()
poke(0x5f2d, 0x5)
menuitem(1,"! win level !",function()
_am=2
end)
local _an=_gf(_al,"|","\n")
_al={}
for i=2,45 do
local _ao={}
for j=1,51 do
local _ad=_an[i][j]
if(j!=2 and j<46)_ad=tonum(_ad)
if j==47 then
_ap,_ad=_gf(_ad,"~"),"" for line in all(_ap) do
_ad..="\n" ..line
end
end
_ao[_an[1][j]]=_ad
end
_al[tonum(_an[i][1])]=_ao
end
for i=-2,66 do
_w[i]={}
for l=-2,66 do
_w[i][l]=0
end
end
cursor={
w=8,h=8,_aq=function(self)
return {
x=self.x+(not _fn and _av or 0)+2,y=self.y+(not _fn and _aw or 0)+1,w=1,h=1
}
end,_ar=function(self)
spr((_bi and _bi.type==1 and _bi._as==1 or _ac) and 1,self.x, self.y)
end
}
for my=0,31 do
for mx=0,127 do
local _at=nil
local _au=mget(mx,my)
if(_au==1) _av,_aw,_at=_e[1][4]-56,_e[1][5]-56,_al[1]
for o in all(_al) do
if(o._ax!=nil and o._ax==_au) _at=o break
end
if _at!=nil and (_au==1 or _au>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_d4(mx,my+1))
_a7(_at, ox*8, oy*8)
end
end
end
_ay=cocreate(function()
while true do
if t_%30==0 then
_gc"false"
_j={}
for _ch in all(_i) do
_j[_ch:_cr()]=_ch
end
_az={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _a0=_d4(i,l)*8
if(_w[i][l]==16) _az[(i/2).."," ..(l/2)]=_a0>0 and sget(_a0%128+3, _a0\8\16*8+3) or 15
end
yield()
end
end
_a1,_a2,_a3,_a4,_n=0,0,false,{0,0},{{},{}}
for building in all(_h) do
if building._as==1 or (hq and _f9(building)) then
_az[(building.x\2\8).."," ..building.y\2\8]=building.col1
end
if building._as==1 then
_a1 -=building.power
if(building.id==7) _a3=true
_a2+=building.storage
end
_a4[building._as]+=1
_gh(_n[building.created_by], building.id, building)
end
for _ch in all(_i) do
if hq and (_ch._as==1 or _f9(_ch) and _ch.z==1) then
_az[(_ch.x\2\8).."," .._ch.y\2\8]=_ch.col1
end
if(_ch.created_by>0) _gh(_n[_ch.created_by], _ch.id, _ch)
end
hq,_a5,_k=(_a3 and _a1>0),2,_az
if(_f[3]>0 and _f[1]>_f[3]) _am=1
if(_a4[2]==0 and _a>1) _am=2
if(_a4[1]==0) _am=3
if _am then
local _a6=40
for data in all{_am,t()-_o,_e3,_ge(_f[2]),_q[1],_q[2],_p[1],_p[2]} do
dset(_a6, data)
_a6+=1
end
rectfill(30,54,104,70,0)
?"mission " ..(_am<3 and"complete" or"failed"),36,60,_c
flip()
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _a9=0
end
function _a7(_at, x,y, _as, _a8)
local _ba=_bt(_at, x,y, _at.type, nil, g_[_at._bx], g_[_at._by], g_[_at.func_update], nil)
_ba.ico_obj,_ba._ae=_bt(_at, 109,0, 3, _ba, nil, nil, g_[_at._bj]), _fe and _at._b1/2 or _at._b1
_ba._as=_ba._as or _as
if not _a8 then
if not _ba._as then
local _bb=9999
for i=1,#_e do
local _bc=_gv(x,y,_e[i][4],_e[i][5])
if(_bc<_bb) _ba._be,_ba._as,_bb=i,min(i,2),_bc
end
else
_ba._be,_g=1,_e[1]
end
else
_ba._be=_a8._be
end
_ba.created_by,_ba.build_objs,_g=_as or _ba._as,{},_e[_ba._be or _a8._be]
_bd=_g[1]
_ba._dz,_ba.col1,_ba._5=_bd,_g[2],_g[3]
for o in all(_al) do
local _bf=o.req_faction
if(o._bg!=nil and (o._bg==_ba.id or o._bh==_ba.id))
and (not _bf
or (_bf>0 and _bf==_bd)
or (_bf<0 and -_bd!=_bf))
then
add(_ba.build_objs,_bt(o, 109,0, 4, _ba, nil, nil, function(self)
if _4 then
_bi=self
else
_af(self, 1)
end
end)
)
end
end
if _ba._as>1 then
_ba.ico_obj._bj=nil
end
if _at.col1 then
_ba.col1,_ba._5=_at.col1,_at._5
end
if(_ba.z>1) _ba._as=0
local _bk,_bl=x\8,y\8
if _at.type==2 then
local _bm=_at._ax==22
for xx=0,_at.w-1 do
for yy=0,_at.h-1 do
_d5(_bk+xx, _bl+yy, _bm and 22 or _ba._as==1 and 81 or 103)
end
end
if(not _bm) add(_h,_ba)
if _ba.id==6 and not _ba._bw then
_df(_ba)
end
else
_ba.r=_ba.norotate!=1 and (_bk%8)*.125
if _ba.arms>0 then
_ba._bn=function(self)
self._ce,self._cm,self.bullet_y,self.bullet_tx,self._bo=4,self.x+4,self.y+4,self._cj.x+self._cj.w/2,self._cj.y+self._cj.h/2
local dx,dy=self.bullet_tx-self._cm,self._bo-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._bp=(dx/d)*2,(dy/d)*2
_ga(self.fire_sfx)
_cx(self)
end
if(_ba._bq==0) _d5(_bk,_bl,21)
else
if(_ba.id==32) _ba._br=0
_ba._bs=_a8
end
add(_i,_ba)
_dm(_ba)
end
_cx(_ba)
return _ba
end
function _bt(_bu, x,y, _bv, _bw, _bx, _by, _bj)
local _bz={
_b0=_bu,id=_bu.id,_b1=_bu._b1,x=x,y=y,z=_bu.z,
_b2=x/8,_b3=y/8,type=_bv,_bw=_bw,_bj=_bj,w=_bu.w*8,
h=_bu.h*8,_b4=_bu._ax,_b5=_bu.w,
_b6=_bu.h,
_b7=_gf(_bu._b7),_aq=function(self)
return {
x=self.x,y=self.y,w=(self.type>2 and self.type<5 and 16 or self.w)-1,h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,_ar=function(self)
local x=self.x
local y=self.y
local ty=self.type
if ty>2
or (x+self.w>=_av
and x<=_av+127
and y+self.h>=_aw
and y<_aw+127+self.z)
then
pal()
palt(0,false)
if(self.trans_col and ty<=2 or ty>=5) palt(self.trans_col,true)
if(self._dz and self.id!=18) pal(12,self.col1) pal(14,self._5)
if ty>2 and ty<5 then
local _b8=ty==4 and self or self._bw
rectfill(x-1,y-1,x+16,y+19, 0)
local hp=_b8._b1
local _ad=self._ab==1 and 15*(_b8._ae/100) or 15*(_b8._ae/hp)
if(_b8._ae>0 and not _4) rectfill(x,y+17,x+_ad,y+18, self._ab==1 and 12 or _b8._ae<hp*.33 and 8 or _b8._ae<hp*.66 and 10 or 11)
pal(11,_b8.icol1) pal(3,_b8.icol2)
end
if self._b7 then
pal(self.col_cycle_src, self._b7[self._aa])
end
if(_by) _by(self)
if self.r then
if not self._cg or self._cg>.025  then
_gl(self._ax%16*8,self._ax\16*8, x, y, .25-self.r, 1, self.trans_col, self.z, flr(self._cd)%2==0 and 7 or nil)
end
else
if ty>2 then
spr(self.ico_spr, x, y, self.ico_w, self.ico_h)
else
_fk(self)
end
end
if self._cm then
if self._b9==1 then
pset(self._cm,self.bullet_y, rnd"2" <1 and 8 or 9)
else
local _ca=self._b9==2
_g3(self._cm, self.bullet_y, 0,0, 0,_ca and .15 or 2,-.01,_ca and 20 or 2.5,self.id==40 and {11} or _ca and _gf"7,7,10,9,8,2,13,6,7" or {15},rnd"2" <1 and 0xa5a5.8 or 0)
end
end
if(self._ae<self._b1*.33 and not self.altframe and rnd"10" <1 and ty<=2) _g3(self.x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,_gf"10,8,9,6", rnd"2" <1 and 0xa5a5.8 or 0)
self._cb=0
end
end,_cc=function(self)
local _ae=self._ae
local ty=self.type
self._cd=max(self._cd-.4,1)
if self._cb>0 and self.created_by>0 then
_gc"true"
if(_a5==0 or stat(24)>5) _a5=1 music"0"
if(self.arms>0 and self._ce==0) _dv(self, self._ck)
if(self._ax<=49 and _ae<100) self._b5,self._b6=0.5,0.5
if(_ae<50 and self._ce!=7) _ft(self,_gk(_n[self.created_by][14]) or self._bs)
end
if(ty<=2 and _ae<=0 and not self._cg) self._ce=5 self._cf=nil self._cg=(ty==2 and 1 or .5) _ga(self.death_sfx) _a9+=((ty==2 or self.id==38) and 0.25 or 0)
if self._cg then
self._cg-=.025
if self._cg<=0 then
if ty==2 then
for xx=0,self._b5-1 do
for yy=0,self._b6-1 do
_d5(self.x/8+xx, self.y/8+yy, 21)
end
end
del(_h,self)
_p[self._ck.created_by]+=1
else
local gx,gy=self:_cs()
if(_d4(gx,gy)<9) _d5(gx,gy,33)
if(self.id<=16) _d5(gx,gy,21)
if(self._bs) self._bs._aj=false
_dc(self)
if self.id==42 then
_d0(self,gx,gy,function (_ch,x,y)
if(_d4(x,y)==0) _d5(x,y,10)
end,4, true)
end
if(self._ck) _q[self._ck.created_by]+=1
end
if(_bi==self) _bi=nil
else
if(rnd(ty==2 and 2 or 8)<1) _cv(self.x+rnd(self.w),self.y+rnd(self.h))
end
end
if self.framecount!=nil then
self._ci+=1
if self._ci > self.framecount then
self._ci=0
if self.altframe
and self._ce==2 then
self._ax=self._b4+(self.altframe-self._ax)
end
if self._b7 then
self._aa+=1
if(self._aa>#self._b7) self._aa=1
end
end
end
if self._cm then
self._cm+=self.bullet_dx
self.bullet_y+=self._bp
if _gv(
self._cm,self.bullet_y,self.bullet_tx,self._bo) < 2
then
_cv(self._cm, self.bullet_y, self._b9)
local _cj=self._cj
if _gv(
self._cm,self.bullet_y,_cj.x+_cj.w/2,_cj.y+_cj.h/2) < 4
then
_cj._ae-=self.arms
_cj._cb,_cj._ck=self._b9,self
if self.id==40 and _cj._bq!=nil then
_cj._as,_cj._dz,_cj.col1,_cj._5=self._as,self._dz,self.col1,self._5
_dm(self)
elseif _cj._cl then
_cj._dz,_cj.col1,_cj._5,_cj._cl=_cj._cl,_cj.old_col1,_cj.old_col2,nil
_dm(_cj)
end
end
self._cm=nil
end
end
if self._ab>0
and not self._ai
and not self._cn then
if self._ab==1 and self.spent>self._em then
self._cn=true
if(self._bw._as==1) _ga"56" _ey("cONSTRUCTION cOMPLETE")
if self._b0.type==1
and self._bg !=1 then
local ux,uy=_dt(self._bw)
_a7(self._b0,ux,uy,self._bw._as,self._bw)
_fo(self)
end
elseif self._ab==2 and _ae>self._b1 then
self._ab=0
if ty==1 and self._bq>0 then
self._dp._b7={0}
self._ce=0
self.x,self.y=_dt(self)
end
else
if self._co>(self._ab==1 and 3 or 100) then
if(_ct(-1,self._ab==1 and self._bw or self)) self._co=0 self.spent+=1
else
self._co+=1
self._ae=(self._ab==1 and (self.spent/self._em)*100 or _ae+.5)
end
end
end
if self._dy>0 then
self._dy-=.1
end
if(self.id==5) self._cp="wINDTRAP (pOWER:" .._a1..")" 
end,_cq=function(self,x,y)
self.x,self.y=x,y
end,_cr=function(self)
local x,y=self:_cs()
return x.."," ..y
end,_cs=function(self)
return self.x\8,self.y\8
end
}
for k,v in pairs(_bu) do
if not _bz[k] and v!="" then
_bz[k]=v
end
end
if(_bx) _bx(_bz)
return _bz
end
function _ct(_cu, _bz)
if(_ge(_f[_bz._as])+_cu<0) return false
_f[_bz._as]+=sgn(_cu)*(abs(_cu)>>16)
if(_bz._as==1) sfx"63" return true
end
function _cv(x,y,_cw)
_g3(x, y, 2,0,0,.1,0, _cw==1 and 5 or 30, _gf"5,7,10,8,9,2", rnd"2" <1 and 0xa5a5.8 or 0)
end
function _cx(_cy)
if(_cy._as!=1 and _cy._ce!=4) return
local _cz=_cy.type==2 and 3 or 2
for xx=-_cz,_cz do
for yy=-_cz,_cz do
local _c0,_c1=_cy.x\8+xx,_cy.y\8+yy
_w[_c0][_c1]=16
_dj(_c0,_c1)
for dy=-1,1 do
for dx=-1,1 do
_dj(_c0+dx,_c1+dy)
end
end
end
end
end
function _update60()
_c2,_c3,_c4=stat"32",stat"33",stat"34" _c5,_c6,_c7=(_c4==1 and _dd !=_c4) or btnp"4", (_c4>0) or btn"4", (_c4==2 and _dd !=_c4) or btnp"5"
for k=0,1 do
if(btn(k)) _r+=k*2-1
if(btn(k+2)) _s+=k*2-1
end
_c8,_c9=mid(0,_c2+_r,127),mid(0,_c3+_s,127)
cursor.x,cursor.y=_c8,_c9
if not _4 then
if(_c8<4) _av-=2
if(_c8>123) _av+=2
if(_c9<4) _aw-=2
if(_c9>123) _aw+=2
_av,_aw=mid(_av,368),mid(-8,_aw,368)
for _ch in all(_i) do
if _ch then
if(_ch._cf) _da,ex=coresume(_ch._cf, _ch)
if(not _da) _ch._cf=nil
if _f0
and fget(_d4(_ch:_cs()),2)
and _gv(_f5,_f6,_ch.x,_ch.y) < 1
and _ch.z==1
then
_dc(_ch)
_db=.01
_ga"50" end
end
end
for p in all(_m) do
p.dy +=p._g4
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._ae +=1
if(p._ae>=p._g8) del(_m,p)
end
_fw()
assert(coresume(_ay))
end
_fl()
_dd,_ah,_de=_c4,_bi,_z
t_+=1
end
function _dc(_ch)
del(_i,_ch)
if _ch.id==32 and #_n[_ch.created_by][32]<=1 then
_dh=_gk(_n[_ch.created_by][6])
if(_dh) _df(_dh)
end
end
function _df(_dg)
local ux,uy=_dt(_dg)
local _di=_a7(_al[32],ux,uy,_dg._as,_dg)
end
function _draw()
_ex()
_e0()
end
function _dj(x,y)
if(x<0 or x>#_w or y<0 or y>#_w) return
local _dk=0
if _w[x][y]!=0 then
if(_w[x][y-1]>0) _dk+=1
if(_w[x-1][y]>0) _dk+=2
if(_w[x+1][y]>0) _dk+=4
if(_w[x][y+1]>0) _dk+=8
_w[x][y]=1 + _dk
end
end
function _dl(x,y)
local _ad=_d4(x,y)
return _ad>=4 and _ad<=10
end
function _dm(_ch, _dn)
_ch._ce,_ch._do=_dn or 0,nil
_ch._cf=cocreate(function(self)
while true do
if self.z>1 then
_d8(self,mid(flr(self._b2+rnd"32")-16,64),mid(flr(self._b3+rnd"32")-16,64))
end
if rnd(250)<1 and self.arms>0 and self._ce!=8 then
local gx,gy=self:_cs()
_d0(self,gx,gy,function (_ch,x,y)
local _cj=_j[x.."," ..y]
if _cj!=null and _cj.created_by!=_ch.created_by and _w[x][y]==16 and _cj.z==1 then
_dv(_ch,_cj)
return true
end
end,max(4,self.range))
elseif self.id==34 then
_f7(self)
end
local _bs=self._dp or self._bs
if self.id==32 then
if self._ce==0 or self._ce==9 then
if self._br<=1500
and self._ce!=7 and self._ce!=9 then
self._dp=nil
local sx,sy
local tx,ty=self:_cs()
if _dl(tx,ty) and not self._dq then
sx,sy=tx,ty
else
_d0(self,tx,ty,function(_ch,x,y)
if _dl(x,y) and rnd"10" <1 then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_d8(_ch,sx,sy)
if(_dl(_ch:_cs())) _ch._ce=6
end
end
elseif self._br >=1500
and self._ce!=7 then
self.sx,self.sy=self:_cs()
_ft(self,_bs or _gk(_n[_ch.created_by][6]))
elseif self._ce==6 then
self._dq=false
_du(_ch.x, _ch.y, _ch.r+.75+rnd".2" -.1)
local _dr=_ch:_cr()
self._br+=.5
_l[_dr],self._cp=(_l[_dr] or 1000)-1,"hARVESTER (" ..flr(self._br/1500*100).."% fULL)"
if _l[_dr] <=0 then
local _bk,_bl=self:_cs()
for yy=-1,1 do
for xx=-1,1 do
_ad=_d4(_bk+xx,_bl+yy)
_d5(_bk+xx,_bl+yy,(xx==0 and yy==0) and 0 or ((_ad>1 and _ad<8) and 10 or _ad)
)
end
end
self._ce=0
end
if(self._br%300==0) self._dq=true self._ce=0
end
end
if self.id>26 then
if self._ce==9 then
if _bs._ae>0 and not _bs._ds and self._ae>0 then
_bs._aj,self._ce,self.r,self.x,self.y=false,8,.25,_bs.x+16,_bs.y+4
if(_bi==self) _bi=nil
if self._br and _bs.id==6 then
_bs._ds=true
while self._br>0 do
self._br-=1
if flr(self._br)%4==0 then
if tonum(_e3)<_a2 then
_ct(2,self)
elseif self._as==1 then
_ey"sPICE LOST. bUILD sILO" end
end
yield()
end
self._br,_bs._ds,self._ce=0,false,0
if(self.sx) _d8(self, self.sx, self.sy, 0, true)
else
self._ab,self._co,_bs.col_cycle_src,_bs._b7=2,0,8,_gf"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _dt(_cj)
local ux,uy=_d0(_cj,(_cj.x+8)\8, (_cj.y+8)\8, _d7, nil, true)
return ux*8,uy*8
end
function _du(x,y,r)
if(rnd"5" <1) _g3(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gf"2,4,9,15", 0xa5a5.8)
end
function _dv(_ch, _cj)
_dw=_cj.id!=42
if _ch.id!=19 then
local _dx=_ch.range*5
_ch._ce,_ch._cj,_ch._cf=3,_cj, cocreate(function(self)
while _cj._ae>0 do
if _gv(_ch.x,_ch.y,_cj.x,_cj.y) > _dx
and _ch._bq>0 then
_d8(_ch,_cj.x\8,_cj.y\8,_dx)
if _ch.id==25 or _ch.id==38 then
_ch._ae=0
for i=1,_ch.id/3 do
_cv(_ch.x+rnd"32" -16,_ch.y+rnd"32" -16, 2)
end
_cj._ae-=(400+rnd"200")
_cj._ck=_ch
return
end
end
if not _ch.norotate then
local a=atan2(_ch.x-_cj.x, _ch.y-_cj.y)
while (_ch.r !=a) do
_gw(_ch, a)
end
end
if _gv(_ch.x,_ch.y,_cj.x,_cj.y)<=_dx then
if(_ch._dy<=0 and not _ch._cm) _ch._bn(_ch) _ch._dy=_ch.fire_rate
elseif _ch._bq==0 then
_dm(_ch)
end
yield()
if(_ch.id==40 or _ch.id==34 or _cj._dz==_ch._dz or _cj._do) break
end
_dm(_ch)
end)
else
_dv(_a7(_al[({24,25,38,38})[_ch._dz]], _ch.x,_ch.y, _ch._as), _cj)
_ch._dy=1750
end
end
function _d0(_ch,x,y,_d1,_d2,_d3)
for t=0,_d2 or 4,.04 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_d1(_ch,xx,yy)) return xx,yy
if(not _d3) yield()
end
end
function _d4(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _d5(mx,my,_d6)
if(my>31)mx+=64 my-=32
mset(mx,my,_d6)
end
function _d7(_ch,x,y)
return not fget(_d4(x,y),0)
and not _j[x.."," ..y]
end
function _d8(_ch,x,y,_d9,_ea,_dn)
::retry_hail::
local _eb=_ch.z>1
if _ea then
local _ec=_n and _gk(_n[_ch.created_by][33])
if _ec and not _ec._do and _ec._dz==_ch._dz then
_ec._do,_ch._do,_ch._ce, _ec._cf=_ch,_ec,2, cocreate(function(unit_c)
_d8(unit_c,_ch.x\8,_ch.y\8)
if(_bi==_ch) _bi=nil
if _ch._ae>0 then
_ec._ax=149
del(_i,_ch)
_d8(_ec,x,y)
_ch:_cq(_ec.x,_ec.y)
add(_i, _ch)
_dm(_ch,_dn)
end
_ec._ax=73
_dm(_ec)
end)
return
end
end
::restart_move_unit::
if not _eb and not _d7(nil,x,y) then
x,y=_d0(_ch,x,y,_d7)
end
_ch.tx,_ch.ty,_ch.prev_state,_ch._ce,_ch._ed=x*8,y*8,_ch._ce,1,nil
local start, goal, _ef={ x=_ch.x\8, y=_ch.y\8}, {x=x, y=y}, function (_ee) return (_ee.y<<8) + _ee.x end
local _en,_eg={
_eh=start,_ei=0,_ej=_g2(start, goal)
}, {}
_eg[_ef(start)]=_en
local frontier, frontier_len, goal_id, max_number, count={_en}, 1, _ef(goal), 32767.99, 0
while frontier_len > 0 do
local _em, _ek=max_number
for i=1, frontier_len do
local _el=frontier[i]._ei + frontier[i]._ej
if(_el <=_em) _ek,_em=i,_el
end
_en=frontier[_ek]
frontier[_ek], _en._er=frontier[frontier_len], true
frontier_len -=1
local p=_en._eh
if _ef(p)==goal_id then
p={goal}
while _en._es do
_en=_eg[_ef(_en._es)]
add(p, _en._eh)
end
_ch._ed=p
goto end_pathfinding
end
for n in all(_gy(p,_eb)) do
local id=_ef(n)
local _eo=not _eb and fget(_d4(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _eo+=.2
local _eq, _ep=
_eg[id],_en._ei + _eo
if not _eq then
_eq={
_eh=n,_ei=max_number,_ej=_g2(n, goal)
}
frontier_len +=1
frontier[frontier_len], _eg[id]=_eq, _eq
end
if not _eq._er and _eq._ei > _ep then
_eq._ei, _eq._es=_ep, p
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
_ch.prev_state,_ch._ce=_ch._ce,2
if _ch._ed!=nil then
for i=#_ch._ed-1,1,-1 do
local _ee=_ch._ed[i]
if not _ch.norotate then
local a=atan2(
_ch.x-(_ee.x*8),
_ch.y-(_ee.y*8) )
while (_ch.r !=a) do
_gw(_ch, a)
end
end
if(not _eb and not _d7(nil,_ee.x,_ee.y)) goto restart_move_unit
local _et,_eu=_ch._bq or .5, sqrt((_ee.x*8-_ch.x)^2+(_ee.y*8-_ch.y)^2)
local _ev,_ew=_et * (_ee.x*8 - _ch.x) / _eu, _et * (_ee.y*8 - _ch.y) / _eu
for i=0, _eu/_et-1 do
_j[_ee.x.."," .._ee.y]=_ch
_ch.x+=_ev
_ch.y+=_ew
if _ch.id==33 then
if _ch._do then
local d=_gv(_ch.x,_ch.y,_ch.tx,_ch.ty)
if(d<32) _ch.z=d/4
end
_ch.z=mid(2,_ch.z+0.1,8)
_ch._bq=_ch.z/12
end
yield()
end
_ch.x,_ch.y,_j[_ee.x.."," .._ee.y]=_ee.x*8, _ee.y*8,_ch
_cx(_ch)
if(_gv(_ch.x,_ch.y,_ch.tx,_ch.ty) <=(_d9 or 0)) break
end
elseif _ea then
goto retry_hail
end
_ch._ce=0
end
function _ex()
cls"15"
camera(_av+(16-rnd"32")*_a9, _aw+(16-rnd"32")*_a9)
_a9=(_a9>0.05) and _a9*0.95 or 0
if _f0 then
for i=1,#_f0 do
if(i%2==1) fillp(0xa5a5.8)
circfill(
_f0[i][1]+4,_f0[i][2]+4,4,_f3[i%#_f3+1])
fillp()
end
if(_db>0) spr(88+_db, _f5, _f6)
end
palt(11,true)
palt(0,false)
map(0,0,  0,0,   64,32, 0x8)
map(64,0, 0,256, 64,32, 0x8)
for building in all(_h) do
if not _4 then
building:_cc()
if(building._ak) building._ak:_cc()
end
building:_ar()
if(building==_bi) rect(_bi.x, _bi.y, _bi.x+_bi.w-1, _bi.y+_bi.h-1, 7)
end
pal()
for p=1,2 do
for _ch in all(_i) do
if(p==1 and _ch.z==1) or (p==2 and _ch.z>1) then
if(not _4) _ch:_cc()
if(_ch._ab!=2 or _ch._bq==0) _ch:_ar()
if(_ch==_bi) spr(2, _bi.x, _bi.y)
end
end
end
for p in all(_m) do
if(p._g6) fillp(p._g6)
circfill(p.x,p.y,p.r,p._g5[ flr((#p._g5/p._g8)*p._ae)+1 ])
fillp()
end
local _e1,_e2=_av\8,_aw\8
palt(0,false)
palt(11,true)
for xx=_e1-1,_e1+16 do
for yy=_e2-1,_e2+16 do
local gx,gy=xx*8,yy*8
if _w[xx][yy]!=0 and _w[xx][yy]!=16 then
spr(_w[xx][yy]+31,gx,gy)
elseif _w[xx][yy]<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
end
function _ey(_ez)
_u,_v=_ez,500
end
function _e0()
camera()
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,124,124,_c)
rect(91,91,123,123,_d)
rectfill(92,92,122,122,0)
if(_v>0) _v-=1 ?_u,2,2
_e3=_ge(_f[1])
?sub("000000", #_e3+1).._e3, 103,2, _d
if hq!=_x then
_t,_e4=hq and 1 or 59, hq and 1 or -1
if(_e4<1) _ey("pOWER LOW.bUILD wINDTRAP")
_ga"55" end
_x=hq
if _t>0 and _t<60 then
_t+=_e4
clip(
max(109-_t,91),max(109-(_t>20 and _t-20 or 0),92),min(_t*2,32),min((_t>20 and _t-20 or 1)*2,32))
for i=1,300 do
pset(92+rnd"32",91+rnd"32",5+rnd"3")
end
clip()
return
end
for xx=0,30 do
for yy=0,30 do
local k=xx.."," ..yy
if(_k[k]) pset(92+xx,92+yy,_k[k])
end
end
local cx,cy=92+_av/16,93+_aw/16
rect(cx,cy, cx+7,cy+6, 7)
local _e5=_bi and _bi._ak
if _bi and _bi.ico_spr then
_bi.ico_obj:_cq(109,20)
_bi.ico_obj:_ar()
_e6,_e7=nil,nil
if _bi._as==1 then
if _e5 then
_e5:_cq(109,44)
_e5:_ar()
end
if _bi._ae<_bi._b1
and _bi.id!=4
and (_bi.type==2
or _bi._bq==0) then
_e6=_bt(_al[80], 117,28, 5, {}, nil,_6, _7)
_e6:_ar()
end
if(_bi.id==19
and _bi._dy<=0)
or _bi.id==35
then
_e7=_bt(_al[81], 109,29, 5, {}, nil,_6, _8)
_e7:_ar()
end
end
end
pal()
if _e5
and (_e5.type==4
and _e5._bq==0)
and _e5._ae>=100 then
local _e8,_e9=(cursor.x+_av)\8, (cursor.y+_aw)\8
local _fa,_fb,w,h=_e8*8-_av,_e9*8-_aw,_e5._b5,_e5._b6
_fc,_fd,_fe=false,false,false
for xx=-1,w do
for yy=-1,h do
local _ad=_d4(_e8+xx, _e9+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(_ad==22 or _ad>=58 and _ad<=81) _fc=true
else
if(_ad>=12 and _ad<=21) _fe=true
if(_j[_e8+xx.."," .._e9+yy] or _ad==0 or _ad<=12 or _ad>=23) _fd=true
end
end
end
if(_fd)_fc=false
fillp("0b1110110110110111.1")
rectfill(_fa, _fb,_fa+_e5.w, _fb+_e5.h, _fc and 11 or 8)
fillp()
end
if _4 then
fillp(▒)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,_d)
rect(4,23,123,94,_c)
if _bi.build_objs then
_bi._fh={}
rectfill(6,25,27,92,0)
local _ff=1
for i=1,#_bi.build_objs do
local _fg=_bi.build_objs[i]
if not _fg.req_id
or _n[_bi.created_by][_fg.req_id]
and _fg.req_level<=_a
then
_bi._fh[_ff]=_fg
if _ff>=_y and _ff<=_y+2 then
_fg:_cq(9,28+(_ff-_y)*19)
_fg:_ar()
else
_fg:_cq(-16,16)
end
_z=_z or _bi._fh[1]
if _z==_fg then
_2=_ff
rect(_fg.x-2, _fg.y-2,_fg.x+17, _fg.y+17,7)
?_z._cp,30,26,7
?"cOST:" .._z._em,85,33,9
?_z.description,30,34,6
end
_ff+=1
end
end
end
for controls in all(_0) do
controls:_ar()
end
end
palt(11,true)
cursor:_ar()
end
function _fi(x,_fj,_bj,_w)
add(_0,{
x=x,y=83,w=_w or 22,h=8,_fj=_fj,_aq=function(self)
return self
end,_ar=function(self)
local c=self._fs and _c or 6
if(#_fj>1)rectfill(self.x,83,self.x+self.w,91, c)
?self._fj,self.x+2,85,(#_fj>1) and 0 or c
end,_bj=_bj
})
end
function _fk(_bz)
spr(_bz._ax, _bz.x, _bz.y, _bz._b5, _bz._b6)
end
function _fl()
_fm=false
if _bi then
_fn=true
_fp(_e6)
_fp(_e7)
if(_bi.ico_obj and not _4 and not _fm) _fp(_bi.ico_obj) _fp(_bi._ak)
if(_4) foreach(_bi.build_objs, _fp) foreach(_0, _fp)
_fn=false
end
if not _4
and not _fm then
foreach(_i, _fp)
foreach(_h, _fp)
end
if _c6
and not _4
and _c8>89 and _c8<122
and _c9>90 and _c9<123 then
_av,_aw=mid(0,(_c8-94)*16, 368),mid(-8,(_c9-94)*16, 368)
_bi=_ah
elseif _c5 then
if(_bi and _bi.type<=2) _ey(_bi._cp)
if _fm then
if not _4 and _bi._bw!=nil then
if(_bi._bj) _bi:_bj()
_bi=_ah
return
end
if(_4 and _z._fj and _z._bj) _z:_bj()
if(_bi._as==1 and _bi.type==1 and _bi!=_ah and _bi._bq>0) _ga"62"
if(_bi.created_by!=1 and _ah and (_ah.type==1 or (_ah.id==19 and _ac)) and _ah._as==1) _bi._cd=10 _dv(_ah, _bi) _bi=nil
else
if _bi
and _bi._as==1
and _bi._bq>0
and _bi._ce!=7 then
_bi._cf=cocreate(function(_ch)
_d8(_ch, (_av+_c8)\8, (_aw+_c9)\8)
_dm(_ch)
end)
end
local _e5=_bi and _bi._ak
if _e5
and _e5._ae>=100
and _fc then
_a7(_e5._b0,(cursor.x+_av)\8 *8,(cursor.y+_aw)\8 *8, 1)
_fo(_e5)
_ga"61" end
end
_ac=false
elseif _c7 and not _4 then
_bi,_ac=nil,false
end
end
function _fo(_bz)
_bz._ae,_bz._ab,_bz.spent,_bz._cn=0,0,0,false
if(_bz._bw) _bz._bw._aj=false
end
function _fp(_bz)
if(not _bz) return
local _fq,_fr=cursor:_aq(),_bz:_aq()
_bz._fs=_fq.x < _fr.x + _fr.w and
_fq.x + _fq.w > _fr.x and
_fq.y < _fr.y + _fr.h and
_fq.y + _fq.h >_fr.y
if _c5 and _bz._fs then
if _4 then
_z=_bz
else
if(_bz.type<=2 and _w[(cursor.x+_av)\8][(cursor.y+_aw)\8]!=16 or _bz._ce==8) return
if _bi
and _ah
and (_bz.id==6 and _ah.id==32
or _bz.id==14 and _ah.id>26)
and _bz._as==1 and _ah._as==1
then
_ft(_ah,_bz)
return
else
_bi=_bz
end
end
_fm=true
end
end
function _ft(_ch,_dg)
_dg=_dg or _gk(_n[_ch.created_by][1]) or _ch
_ch._ce,_dg._aj,_ch._dp=7,true,_dg
if(_ch.id!=32 or _dg.id==6) _ch._bs=_dg
_ch._cf=cocreate(function(_ch)
local _fu=_dg.id!=1 and 9 or 0
_d8(_ch, (_dg.x+16)/8, _dg.y/8, 0, true, _fu)
if(not _ch._do) _dm(_ch, _fu)
end)
end
_fv=0
function _fw()
if _dw and t()%_b==0 then
local _fx=rnd(_i)
if _fx._as==2 and _fx.arms>0 and _fx._ce==0 then
_f7(_fx)
end
local _fy=rnd(_h)
if _fy._as==2 and
(not _fy._ak or _fy._ak._ab!=1) then
local u=rnd(_fy.build_objs)
if u and u._bq>0 then
u:_bj()
end
if _fy._ae<_fy._b1 and _fy._ab!=2 then
_af(_fy, 2)
end
end
local _fz=_gk(_n[2][19])
if _fz and _fz._dy<=0
and _f8 and _f8.type==2 then
_dv(_fz, _f8)
end
end
_fv-=1
if _fv<0 then
if _f0 then
_f0=nil
else
_f0,_f1,_f2,_f3,_db={{rnd"500",rnd"500" }},rnd"1",0,_gf"15,9,4",0
end
_f4=rnd"5000" _fv=_f4
end
if _f0 then
if(t_%6<1 or #_f0<30) and _db==0 then
while #_f0<31 do
if(rnd"9" <.5) _f2=rnd".04" -.02
_f5,_f6=_f0[#_f0][1],_f0[#_f0][2]
add(_f0,{_f5+sin(_f1),_f6-cos(_f1)})
_f1+=_f2
end
end
if(#_f0>30) del(_f0,_f0[1])
if(_db>0) _db+=.01 _du(_f5,_f6,rnd"1")
if(_db>2) _db=0
end
end
function _f7(_bz)
repeat
_f8=(rnd"4" <1) and rnd(_i) or rnd(_h)
until _f8.created_by!=_bz.created_by
if(_f8 and _f9(_f8)) _dv(_bz, _f8)
end
function _f9(_bz)
local x,y=_bz:_cs()
return _w[x][y]==16
end
function _ga(_gb)
sfx(_gb,3)
end
function _gc(_gd)
local _ad=peek(0x3115)
if(_ad & 128 > 0 !=_gd) _ad=_ad^^128
poke(0x3115, _ad)
end
function _ge(_ad)
local s,v="",abs(_ad)
repeat
s=(v % 0x0.000a / 0x.0001)..s
v /=10
until v==0
return s
end
function _gf(_gg,d,dd)
d=d or","
if(dd) _gg=split(_gg,dd)
if type(_gg)=="table" then
local t={}
while #_gg>0 do
local s=_gg[1]
add(t,split(s,d))
del(_gg,s)
end
return t
else
return split(_gg,d)
end
end
function _gh(_gi,_gj,_cy)
if(not _gi[_gj]) _gi[_gj]={}
add(_gi[_gj],_cy)
end
function _gk(_gi)
if(_gi) return rnd(_gi)
end
function _gl(sx,sy,x,y,a,w,_gm,_gn,_go)
local ca,sa=cos(a),sin(a)
local _gp,_gq,_dk=ca,sa,0xfff8<<w-1
w*=4
ca*=w-0.5
sa*=w-0.5
local _gr,_gs,w=sa-ca+w,-ca-sa+w,2*w-1
for ix=0,w do
local _gt,_gu=_gr,_gs
for iy=0,w do
if((_gt|_gu) & _dk)==0 then
local c=sget(sx+_gt,sy+_gu)
if c!=_gm then
if(_gn) pset(x+ix,y+iy, 1)
pset(x+ix,y+iy-_gn, _go or c)
end
end
_gt-=_gq
_gu+=_gp
end
_gr+=_gp
_gs+=_gq
end
end
function _gv(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gw(_ch, _gx)
local _cu=_gx-_ch.r
if(_ch.z>1) _ch.r=_gx
if _cu > 0.5 then
_cu -=1
elseif _cu < -0.5 then
_cu +=1
end
if _cu > 0.0087 then
_ch.r +=0.0087
elseif _cu < -0.0087 then
_ch.r -=0.0087
else
_ch.r=_gx
end
yield()
end
function _gy(_ee,_eb)
local _g1={}
for xx=-1, 1 do
for yy=-1, 1 do
if(xx!=0 or yy!=0) _gz(_ee.x+xx, _ee.y+yy, _g1, _eb)
end
end
return _g1
end
function _gz(nx, ny, _g0, _eb)
if(_eb or not fget(_d4(nx,ny),0) and not fget(_d4(nx,ny),7) and not _j[nx.."," ..ny] and nx>=0 and ny>=0 and nx<=63 and ny<=63) add(_g0, {x=nx, y=ny})
end
function _g2(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _g3(x, y, r, dx, dy, dr, _g4, _ae, _g5, _g6)
add(_m, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_ae=0,_g4=_g4,_g5=_g5, _g6=_g6,_g7=y, _g8=_ae }, 1)
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
040080000c0c0c0c0c0c0c0e0808080808080808080a08090909090909090909060e0e000800000000000000000000010000000000000000000001010101010101010001000102010000010101020201010101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0d0d0d000000000000000000130d14000a000a000000000000000000000004052f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
0d0d140000000000000000000000000000000000000000000000000000000a052f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000000000a0000000000000000000000002000000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001112000a00000000000000000000000a000000000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000110d0d0e05050506000000000000300000000000000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00110d0d140405090905000000000000000000003300000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0005090905060000442424244224240f0000001112000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d140405050508003024242424242424246c24240f0d0d0d12000000110d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d04050505080000002442240d18181c24242424340d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d140509050800330011242424241d1e6a242424240d0d0d0d0d0d0d0d0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0405090906000011340d0d0d300d0d24240d0d0d0d300d0d0d000000130d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d14050909090600110d0d0d0d0d0d0d0d1407063400130d0d0d14000000000c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14040509090506110d0d140000000c340e070506000a000c0d1400000000000c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000505050800130d0d000000000c0d0e0a050830000013140000000000000c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000300000000013140000110d0d0d0d12000000000000000000000000000c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000110d0d0d0d0d0d120000000000200000000000110d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070600000000000000000c0d0d0d0d0d0d0e00000000000000000705070c0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090600000000000000000c0d0d0d0d0d0d0e0000000000070505050505130d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05090600000000000000000c0d0d0d0d0d0d0d1200110f0f0f120a050505060c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05050600000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05060000000000000000000c0d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1200000000002000000000130d0d0d0d0d0d0d0d0d0d0d0d0d0e05050505050c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d12000000000000000000000d0d0d1718190d0d0d0d0d0d0d0e05050505080c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e00000000000000000000130d0d1d1b1b19310d0d0d0d0d0e0a050508110d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d140000000000000000000000130d0d1d1e1f0d0d0d0d0d0d100f0f0f0f0d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1400000000070505070000000000130d340d010d0d0d0d143100130d0d0d14002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000050909050700000000000c0d0d0d0d0d0d0e340000000c0d0e00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000005050905050000000000130d0d0d0d0d0d0e000000000c0d0e00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000405090905000000000031130d0d0d0d340e000000000c0d0e00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000011120505050a000000000000341310100d0d1400000000130d0d12002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000110d0d0f0f120000070507000000000000000000000705070000130d0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000c0d0d0d0d0d0d12050505000000000000000000000a0505050507130d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

