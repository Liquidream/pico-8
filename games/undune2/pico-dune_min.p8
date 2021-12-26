pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)
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
_ft(6,"⬆️",function()
_5=mid(1,_5-1,#_bk._fs)
_2=_bk._fs[_5]
if(_5<_1) _1-=1
end, 10)
_ft(17,"⬇️",function()
local _6=#_bk._fs
if(_5<_6) _5=mid(1,_5+1,_6)
_2=_bk._fs[_5]
if(_5>_1+2) _1=min(_1+1,_6-2)
end, 10)
_ft(32,"build",function()
_7=nil
_dp:_bl()
end)
_ft(96,"close",function()
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
if(self.id==80 and _bk._ae==2 and not _bk._af) pal(7,11)
end
function _8(self, _9)
self._cv,self.last_process,self._ae=0,self._ae,_9
if(self._bd>=0 and self.last_process>0) self._af=not self._af
if(_9==1) self._bx._ag=true self._bx._ah=self
end
_ai=[[id|_cx|_au|ico_spr|type|w|h|z|trans_col|_bi|_bj|_ap|col1|_aa|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|_ev|power|_d7|_b2|_bs|range|_ch|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|_bd|_cq|_ae|spent|_cw|_cj|_cl|_ad|col_cycle_src|storage|capacity|_b8|description|_bz|func_update|_bl
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.|||_4
2|lARGE cONCRETE sLAB|22|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.|||
3|sMALL cONCRETE sLAB|22|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0|nil||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.|||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0|nil||tHE wALL IS USED FOR~PASSIVE DEFENSE.|||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|0|nil|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|1000|nil|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|_ac||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.|||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000|nil||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.|||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.|||_4
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.|||_4
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.|||_4
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.|||_4
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.|||_4
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|nil|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1||0|nil||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.|||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1||0|nil||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.|||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|0|nil|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|_ac||_4
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0|nil||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.|||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1||0|nil||tHIS IS YOUR pALACE.|||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1||0|nil||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.|||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.|||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1||0|nil||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.|||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.|||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.|||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1||0|nil||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.|||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1||0|nil||tHE sARDUKAR ARE THE~eMPEROR' S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.|||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.|||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.|||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.|||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.|||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||224|400|0.3|9|2|56|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.|||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|0||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.|||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0|nil||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.|||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||150|20|1|9|2|20|58|54||41|5|0|0|0|0|0|0|1|1||0|nil||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.|||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0|nil||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.|||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1||0|nil||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.|||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.|||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.|||
38.5|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|4||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0|nil||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.|||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1||0|nil||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.|||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||1|480|0.3|7|1.9|90|58|54||||0|0|0|0|0|0|1|1||0|nil||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.|||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1||0|nil||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.|||
42|sPICE bLOOM|32||1|1|1|1|11|||2|||||1|1|||||||0|4|0|||||53|1|||0|0|0|0|0|0|1|1||0|nil|||||
80|rEPAIR|3|3|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|||_ab||action_click
81|lAUNCH|1|1|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0|nil|||_ab||action_click]]
function _init()
poke(0x5f2d, 0x5)
local _aj=_gp(_ai,"|","\n")
_ai={}
for i=2,46 do
local _ak={}
for j=1,51 do
local _al=_aj[i][j]
if(j!=2 and j<47)_al=tonum(_al)
if j==48 then
_am,_al=_gp(_al,"~"),"" for line in all(_am) do
_al..="\n" ..line
end
end
_ak[_aj[1][j]]=_al
end
_ai[tonum(_aj[i][1])]=_ak
end
for i=-2,66 do
_x[i]={}
for l=-2,66 do
_x[i][l]=0
end
end
cursor={
w=8,h=8,_an=function(self)
return {
x=self.x+(_fx and 0 or _as)+2,y=self.y+(_fx and 0 or _at)+1,w=1,h=1
}
end,_ao=function(self)
spr((_bk and _bk.type==1 and _bk._ap==1 or _fi) and 1,self.x, self.y)
end
}
for my=0,31 do
for mx=0,127 do
local _aq=nil
local _ar=mget(mx,my)
if(_ar==1) _as,_at,_aq=_f[1][4]-56,_f[1][5]-56,_ai[1]
for o in all(_ai) do
if(o._au!=nil and o._au==_ar) _aq=o break
end
if _aq!=nil and (_ar==1 or _ar>=32) then
local ox,oy=mx,my
if(ox>63) oy+=32 ox-=64
mset(mx,my,_ed(mx,my+1))
_a8(_aq, ox*8, oy*8)
end
end
end
_av=cocreate(function()
while true do
if t_%30==0 then
_gm"false"
_k={}
for _cp in all(_j) do
_k[_cp:_cz()]=_cp
end
_aw={}
if hq then
for i=0,62,2 do
for l=0,62,2 do
local _ax=_ed(i,l)*8
if(_x[i][l]==16) _aw[(i/2).."," ..(l/2)]=_ax>0 and sget(_ax%128+3, _ax\8\16*8+3) or 15
end
yield()
end
end
_ay,_az,_a0,_a1,_o=0,0,false,{0,0},{{},{}}
for building in all(_i) do
if building._ap==1 or (hq and _gj(building)) then
_aw[(building.x\2\8).."," ..building.y\2\8]=building.col1
end
if building._ap==1 then
_ay -=building.power
if(building.id==7) _a0=true
_az+=building.storage
end
_a1[building._ap]+=1
_gr(_o[building.created_by], building.id, building)
end
for _cp in all(_j) do
if hq and (_cp._ap==1 or _gj(_cp) and _cp.z==1) then
_aw[(_cp.x\2\8).."," .._cp.y\2\8]=_cp.col1
end
if(_cp.created_by>0) _gr(_o[_cp.created_by], _cp.id, _cp)
end
hq,_a2,_l=_a0 and _ay>0,2,_aw
if(_g[3]>0 and _g[1]>_g[3]) _a3=1
if(_a1[2]==0 and _a>1) _a3=2
if(_a1[1]==0) _a3=3
if _a3 then
local _a4=40
for data in all{_a3,t()-_p,_fd,_go(_g[2]),_r[1],_r[2],_q[1],_q[2]} do
dset(_a4, data)
_a4+=1
end
rectfill(30,54,104,70,0)
?"mission " ..(_a3<3 and"complete" or"failed"),36,60,_c
flip()
load"pico-dune-main_min" end
end
yield()
end
end)
music"7" _ba=0
end
function _a5(_a6,_a7)
local _bb=_a6.req_faction
return not _bb
or (_bb>0 and _bb==_a7)
or (_bb<0 and -_a7!=_bb)
end
function _a8(_aq, x,y, _ap, _a9)
local _bc=_bu(_aq, x,y, _aq.type, nil, g_[_aq._by], g_[_aq._bz], g_[_aq.func_update], nil)
_bc.ico_obj,_bc._bd=_bu(_aq, 109,0, 3, _bc, nil, nil, g_[_aq._bl]), _fp and _aq._b2/2 or _aq._b2
_bc._ap=_bc._ap or _ap
if _a9 then
_bc._be=_a9._be
else
if _bc._ap then
_bc._be,_h=1,_f[1]
else
local _bf=9999
for i=1,#_f do
local _bg=_gv(x,y,_f[i][4],_f[i][5])
if(_bg<_bf) _bc._be,_bc._ap,_bf=i,min(i,2),_bg
end
end
end
_bc.created_by,_bc.build_objs,_h=_ap or _bc._ap,{},_f[_bc._be or _a9._be]
_bh=_h[1]
_bc._d8,_bc.col1,_bc._aa=_bh,_h[2],_h[3]
if(not _a5(_bc,_bh)) return
for o in all(_ai) do
if o._bi!=nil
and (o._bi==_bc.id or o._bj==_bc.id)
and _a5(o,_bh)
then
add(_bc.build_objs,_bu(o, 109,0, 4, _bc, nil, nil, function(self)
if _7 then
_bk=self
else
_8(self, 1)
end
end)
)
end
end
if _bc._ap>1 then
_bc.ico_obj._bl=nil
end
if _aq.col1 then
_bc.col1,_bc._aa=_aq.col1,_aq._aa
end
if(_bc.z>1) _bc._ap=0
local _bm,_bn=x\8,y\8
if _aq.type==2 then
local _bo=_aq._au==22
for xx=0,_aq.w-1 do
for yy=0,_aq.h-1 do
_ee(_bm+xx, _bn+yy, _bo and 22 or _bc._ap==1 and 81 or 103)
end
end
if(not _bo) add(_i,_bc)
if _bc.id==6 and not _bc._bx then
_dq(_bc)
end
else
_bc.r=_bc.norotate!=1 and (_bm%8)*.125
if _bc._d7>0 then
_bc._bp=function(self)
self._cm,self._ct,self.bullet_y,self.bullet_tx,self._bq=4,self.x+4,self.y+4,self._cr.x+self._cr.w/2,self._cr.y+self._cr.h/2
local dx,dy=self.bullet_tx-self._ct,self._bq-self.bullet_y
local d=sqrt(dx*dx+dy*dy)
self.bullet_dx,self._br=(dx/d)*2,(dy/d)*2
_gk(self.fire_sfx)
_c5(self)
end
if(_bc._bs==0) _ee(_bm,_bn,21)
else
_bc._bt=_a9
end
add(_j,_bc)
_dw(_bc)
end
_c5(_bc)
return _bc
end
function _bu(_bv, x,y, _bw, _bx, _by, _bz, _bl)
local _b0={
_b1=_bv,id=_bv.id,_b2=_bv._b2,x=x,y=y,z=_bv.z,
_b3=x/8,_b4=y/8,type=_bw,_bx=_bx,_bl=_bl,w=_bv.w*8,
h=_bv.h*8,_b5=_bv._au,_b6=_bv.w,
_b7=_bv.h,
_b8=_gp(_bv._b8),_an=function(self)
return {
x=self.x,y=self.y,w=(self.type>2 and self.type<5 and 16 or self.w)-1,h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,_ao=function(self)
local x=self.x
local y=self.y
local ty=self.type
if ty>2
or (x+self.w>=_as
and x<=_as+127
and y+self.h>=_at
and y<_at+127+self.z)
then
pal()
palt(0,false)
if(self.trans_col and ty<=2 or ty>=5) palt(self.trans_col,true)
if(self._d8 and self.id!=18) pal(12,self.col1) pal(14,self._aa)
if ty>2 and ty<5 then
local _b9=ty==4 and self or self._bx
rectfill(x-1,y-1,x+16,y+19, 0)
local hp=_b9._b2
local _al=self._ae==1 and _b9._bd/6.666 or 15*(_b9._bd/hp)
if(_b9._bd>0 and not _7) rectfill(x,y+17,x+_al,y+18, self._ae==1 and 12 or (split"8,10,11,11")[_b9._bd\(hp/3)+1])
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
local c=sget(self._au%16*8+_cf,self._au\16*8+_cg)
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
spr(self._au, self.x, self.y, self._b6, self._b7)
end
end
if self._ct then
if self._ch==1 then
pset(self._ct,self.bullet_y, rnd"2" <1 and 8 or 9)
else
local _ci=self._ch<=2
_gz(
self._ct, self.bullet_y,_ci and 1.9 or 0,0, 0, _ci and -.3 or 1,0,_ci and 10 or 2.5,_ci and _gp"7,10,9,8,2" or {15},rnd"2" <1 and 0xa5a5.8 or 0)
end
end
if(self._bd<self._b2*.33 and not self.altframe and rnd"10" <1 and ty<=2) _gz(self.x+3.5,y+3.5, 1, .1,-.02,.05, -.002, 80,_gp"10,8,9,6", rnd"2" <1 and 0xa5a5.8 or 0)
self._cj=0
end
end,_ck=function(self)
local _bd=self._bd
local ty=self.type
local id=self.id
self._cl=max(self._cl-.4,1)
if self._cj>0 and self.created_by>0 then
_gm"true"
if(_a2==0 or stat(24)>5) _a2=1 music"0"
if(self._d7>0 and self._cm==0) _d5(self, self._cs)
if(self._au<=49 and _bd<100) self._b6,self._b7=0.5,0.5
if(_bd<50 and self._cm!=7) _f3(self,_gu(_o[self.created_by][14]) or self._bt)
end
if(ty<=2 and _bd<=0 and not self._co) self._cm=5 self._cn=nil self._co=(ty==2 and 1 or .5) _gk(self.death_sfx) _ba+=(ty==2 or self.id==38) and .25 or 0
if self._co then
self._co-=.025
if self._co<=0 then
if ty==2 then
for xx=0,self._b6-1 do
for yy=0,self._b7-1 do
_ee(self.x/8+xx, self.y/8+yy, 21)
end
end
del(_i,self)
_q[self._cs.created_by]+=1
else
local gx,gy=self:_c0()
if(_ed(gx,gy)<9) _ee(gx,gy,33)
if(id<=16) _ee(gx,gy,21)
if(self._bt) self._bt._ag=false
_dm(self)
if id==42 then
_d9(self,gx,gy,function (_cp,x,y)
if(_ed(x,y)==0) _ee(x,y,10)
end,4, true)
end
if(self._cs) _r[self._cs.created_by]+=1
end
if(_bk==self) _bk=nil
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
self._au=self._b5+(self.altframe-self._au)
end
if self._b8 then
self._ad+=1
if(self._ad>#self._b8) self._ad=1
end
end
end
if self._ct then
self._ct+=self.bullet_dx
self.bullet_y+=self._br
if _gv(
self._ct,self.bullet_y,self.bullet_tx,self._bq) < 2
then
_c3(self._ct, self.bullet_y, self._ch)
local _cr=self._cr
if _gv(
self._ct,self.bullet_y,_cr.x+_cr.w/2,_cr.y+_cr.h/2) < 4
then
_cr._bd-=self._d7
_cr._cj,_cr._cs=self._ch,self
_0[_cr._d8]=_cr.id!=42
if id==40 and _cr._bs!=nil then
_cr.old_fact_data,_cr._d8,_cr._ap,_cr.created_by,_cr.col1,_cr._aa
=
{_cr._d8,_cr._ap,_cr.created_by,_cr.col1,_cr._aa},self._d8,self._ap,self.created_by,self.col1,self._aa
_dw(self)
elseif _cr.old_fact_data then
_cr.old_fact_data,_cr._d8,_cr._ap,_cr.created_by,_cr.col1,_cr._aa
=
nil,unpack(_cr.old_fact_data)
_dw(_cr)
end
end
self._ct=nil
end
end
if self._ae>0
and not self._af
and not self._cu then
if self._ae==1 and self.spent>self._ev then
self._cu=true
if(self._bx._ap==1) _gk"56" _e8("cONSTRUCTION cOMPLETE")
if self._b1.type==1
and self._bi !=1 then
local ux,uy=_d3(self._bx)
_a8(self._b1,ux,uy,self._bx._ap,self._bx)
_fy(self)
end
elseif self._ae==2 and _bd>self._b2 then
self._ae=0
if ty==1 and self._bs>0 then
self._dz._b8,self._cm={0},0
self.x,self.y=_d3(self)
end
else
if self._cv>(self._ae==1 and 3 or 100) then
if(_c1(-1,self._ae==1 and self._bx or self)) self._cv=0 self.spent+=1
else
self._cv+=1
self._bd=(self._ae==1 and (self.spent/self._ev)*100 or _bd+.5)
end
end
end
self._cw=max(self._cw-.1)
if self._ap==1 then
if(id==5) self._cx="wINDTRAP (∧" .._ay..")"
if(self.storage>0) self._cx=self._b1._cx.." (" ..flr(_fd/_az*100).."%)" end
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
if(_go(_g[_b0._ap])+_c2<0) return false
_g[_b0._ap]+=sgn(_c2)*(abs(_c2)>>16)
if(_b0._ap==1) sfx"63" return true
end
function _c3(x,y,_c4)
_gz(x, y, 2,0, 0, .1, -.01, _c4==1 and 5 or 20, _c4==1.9 and _gp"3,11,3" or _gp"5,7,5,7,10,8,9,2", rnd"2" <1 and 0xa5a5.8)
end
function _c5(_c6)
if(_c6._ap!=1 and _c6._cm!=4) return
local _c7=_c6.type==2 and 3 or 2
for xx=-_c7,_c7 do
for yy=-_c7,_c7 do
local _c8,_c9=_c6.x\8+xx,_c6.y\8+yy
_x[_c8][_c9]=16
_du(_c8,_c9)
for dy=-1,1 do
for dx=-1,1 do
_du(_c8+dx,_c9+dy)
end
end
end
end
end
function _update60()
_da,_db,_dc=stat"32",stat"33",stat"34" _dd,_de,_df=(_dc==1 and _dn !=_dc) or btnp"4", (_dc>0) or btn"4", (_dc==2 and _dn !=_dc) or btnp"5"
if _da==_di and _db==_dj then
b=btn()
_dg+=b\2%2-b%2
_dh+=b\8%2-b\4%2
else
_dg,_dh=_da,_db
end
_dg,_dh=mid(_dg,127),mid(_dh,127)
cursor.x,cursor.y,_di,_dj=_dg,_dh,_da,_db
if not _7 then
if(_dg<4) _as-=2
if(_dg>123) _as+=2
if(_dh<4) _at-=2
if(_dh>123) _at+=2
_as,_at=mid(_as,_y),mid(-8,_at,_y)
for _cp in all(_j) do
if(_cp._cn) _dk,ex=coresume(_cp._cn, _cp)
if(not _dk) _cp._cn=nil
if _ga
and fget(_ed(_cp:_c0()),2)
and _gv(_gf,_gg,_cp.x,_cp.y) < 1
and _cp.z==1
then
_dm(_cp)
_dl=.01
_gk"50" end
end
for p in all(_n) do
p.dy +=p._g0
p.x +=p.dx
p.y +=p.dy
p.r +=p.dr
p._bd +=1
if(p._bd>=p._g4) del(_n,p)
end
_f6()
assert(coresume(_av))
end
_fv()
_dn,_do,_dp=_dc,_bk,_2
t_+=1
end
function _dm(_cp)
del(_j,_cp)
if _cp.id==32 and #_o[_cp.created_by][32]<=1 then
_ds=_gu(_o[_cp.created_by][6])
if(_ds) _dq(_ds)
end
end
function _dq(_dr)
local ux,uy=_d3(_dr)
local _dt=_a8(_ai[32],ux,uy,_dr._ap,_dr)
end
function _draw()
_e7()
_fa()
end
function _du(x,y)
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
function _dv(x,y)
local _al=_ed(x,y)
return _al>=4 and _al<=10
end
function _dw(_cp, _dx)
_cp._cm,_cp.link,_cp._dy=_dx or 0,nil,true
_cp._cn=cocreate(function(self)
while true do
if self.z>1 then
_eh(self,mid(flr(self._b3+rnd"32")-16,64),mid(flr(self._b4+rnd"32")-16,64))
end
if rnd(250)<1 and self._d7>0 and self._cm!=8 then
local gx,gy=self:_c0()
_d9(self,gx,gy,function (_cp,x,y)
local _cr=_k[x.."," ..y]
if _cr!=null and _cr.created_by!=_cp.created_by and _x[x][y]==16 and _cr.z==1 then
_d5(_cp,_cr)
return true
end
end,max(4,self.range))
elseif self.id==34 then
_gh(self)
end
local _bt=self._dz or self._bt
if self.id==32 then
if self._cm==0 or self._cm==9 then
if self.capacity<=1500
and self._cm!=7 and self._cm!=9 then
self._dz=nil
local sx,sy
local tx,ty=self:_c0()
if _dv(tx,ty) and not self._d0 then
sx,sy=tx,ty
else
_d9(self,tx,ty,function(_cp,x,y)
if _dv(x,y) and rnd"10" <1 then
sx,sy=x,y
return true
end
end,20)
end
if sx and sy then
_cp._dy=_eh(_cp,sx,sy,nil,not _cp._dy)
if(_dv(_cp:_c0())) _cp._cm=6
end
end
elseif self.capacity >=1500
and self._cm!=7 then
self.sx,self.sy=self:_c0()
_f3(self,_bt or _gu(_o[_cp.created_by][6]))
elseif self._cm==6 then
self._d0=false
_d4(_cp.x, _cp.y, _cp.r+.75+rnd".2" -.1)
local _d1=_cp:_cz()
self.capacity+=.5
_m[_d1],self._cx=(_m[_d1] or 1000)-1,"hARVESTER (" ..flr(self.capacity/1500*100).."%)"
if _m[_d1] <=0 then
local _bm,_bn=self:_c0()
for yy=-1,1 do
for xx=-1,1 do
_al=_ed(_bm+xx,_bn+yy)
_ee(_bm+xx,_bn+yy,(xx==0 and yy==0) and 0 or ((_al>1 and _al<8) and 10 or _al)
)
end
end
self._cm=0
end
if(self.capacity%300==0) self._d0=true self._cm=0
end
end
if self.id>26 then
if self._cm==9 then
if _bt._bd>0 and not _bt._d2 and self._bd>0 then
_bt._ag,self._cm,self.r,self.x,self.y=false,8,.25,_bt.x+16,_bt.y+4
if(_bk==self) _bk=nil
if self.capacity and _bt.id==6 then
_bt._d2=true
while self.capacity>0 do
self.capacity-=1
if flr(self.capacity)%4==0 then
if tonum(_fd)<_az then
_c1(2,self)
elseif self._ap==1 then
_e8"sPICE LOST. bUILD sILO" end
end
yield()
end
self.capacity,_bt._d2,self._cm=0,false,0
if(self.sx) _eh(self, self.sx, self.sy, 0, true)
else
self._ae,self._cv,_bt.col_cycle_src,_bt._b8=2,0,8,_gp"7,10,0,0,7,0,0" end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function _d3(_cr)
local ux,uy=_d9(_cr,(_cr.x+8)\8, (_cr.y+8)\8, _eg, nil, true)
return ux*8,uy*8
end
function _d4(x,y,r)
if(rnd"5" <1) _gz(x+ sin(r)*5.5 +3.5,y+ -cos(r)*5.5 +3.5, rnd"2", .15,0,.1, -.01, 25,_gp"2,4,9,15", 0xa5a5.8)
end
function _d5(_cp, _cr)
if _cp.id!=19 then
local _d6=_cp.range*5
_cp._cm,_cp._cr,_cp._cn=3,_cr, cocreate(function(self)
while _cr._bd>0 do
if _gv(_cp.x,_cp.y,_cr.x,_cr.y) > _d6
and _cp._bs>0 then
_eh(_cp,_cr.x\8,_cr.y\8,_d6)
if _cp._d7==600 then
_cp._bd=0
for i=1,_cp.id/3 do
_c3(_cp.x+rnd"32" -16,_cp.y+rnd"32" -16, 2)
end
_cr._bd-=(400+rnd"200")
_cr._cs=_cp
return
end
end
if not _cp.norotate then
local a=atan2(_cp.x-_cr.x, _cp.y-_cr.y)
while (_cp.r !=a) do
_gw(_cp, a)
end
end
if _gv(_cp.x,_cp.y,_cr.x,_cr.y)<=_d6 then
if(_cp._cw<=0 and not _cp._ct) _cp._bp(_cp) _cp._cw=_cp.fire_rate
elseif _cp._bs==0 then
_dw(_cp)
end
yield()
if(_cp.id==40 or _cp.id==34 or _cr._d8==_cp._d8 or _cr.link) printh("abort attack") break
end
_dw(_cp)
end)
else
_d5(_a8(_ai[({24,25,38,38.5})[_cp._d8]], _cp.x,_cp.y, _cp._ap, _cp), _cr)
_cp._cw=1750
end
end
function _d9(_cp,x,y,_ea,_eb,_ec)
for t=0,_eb or 4,.04 do
local xx,yy=mid(flr(x+t*cos(t)),61),mid(flr(y+t*sin(t)),61)
if(_ea(_cp,xx,yy)) return xx,yy
if(not _ec) yield()
end
end
function _ed(mx,my)
if(my>31)mx+=64 my-=32
return mget(mx,my)
end
function _ee(mx,my,_ef)
if(my>31)mx+=64 my-=32
mset(mx,my,_ef)
end
function _eg(_cp,x,y)
return not fget(_ed(x,y),0)
and not _k[x.."," ..y]
end
function _eh(_cp,x,y,_ei,_ej,_dx)
local _ek=_cp.z>1
if _ej then
local _el=_o and _gu(_o[_cp.created_by][33])
if _el and not _el.link and _el._d8==_cp._d8 then
_el.link,_cp.link,_cp._cm, _el._cn=_cp,_el,2, cocreate(function(unit_c)
_eh(unit_c,_cp.x\8,_cp.y\8)
if(_bk==_cp) _bk=nil
if _cp._bd>0 then
_el._au=149
del(_j,_cp)
_eh(_el,x,y)
_cp:_cy(_el.x,_el.y)
add(_j, _cp)
_dw(_cp,_dx)
end
_el._au=73
_dw(_el)
end)
return
end
end
::restart_move_unit::
if not _ek and not _eg(nil,x,y) then
x,y=_d9(_cp,x,y,_eg)
end
_cp.tx,_cp.ty,_cp.prev_state,_cp._cm,_cp._em=x*8,y*8,_cp._cm,1,nil
local start, goal, _eo={ x=_cp.x\8, y=_cp.y\8}, {x=x, y=y}, function (_en) return (_en.y<<8) + _en.x end
local _ew,_ep={
_eq=start,_er=0,_es=_gy(start, goal)
}, {}
_ep[_eo(start)]=_ew
local frontier, frontier_len, goal_id, max_number, count={_ew}, 1, _eo(goal), 32767.99, 0
while frontier_len > 0 do
local _ev, _et=max_number
for i=1, frontier_len do
local _eu=frontier[i]._er + frontier[i]._es
if(_eu <=_ev) _et,_ev=i,_eu
end
_ew=frontier[_et]
frontier[_et], _ew._ex=frontier[frontier_len], true
frontier_len -=1
local p=_ew._eq
if _eo(p)==goal_id then
p={goal}
while _ew._e2 do
_ew=_ep[_eo(_ew._e2)]
add(p, _ew._eq)
end
_cp._em=p
goto end_pathfinding
end
local _ey={}
for xx=-1, 1 do
for yy=-1, 1 do
local nx=p.x+xx
local ny=p.y+yy
if(xx!=0 or yy!=0)
and _ek or not fget(_ed(nx,ny),0)
and not fget(_ed(nx,ny),7)
and not _k[nx.."," ..ny]
and nx>=0 and ny>=0 and nx<=63 and ny<=63 then
add(_ey, {x=nx, y=ny})
end
end
end
for n in all(_ey) do
local id=_eo(n)
local _ez=not _ek and fget(_ed(n.x, n.y), 1) and 4 or 1
if(p.x !=n.x and p.y !=n.y) _ez+=.2
local _e1, _e0=
_ep[id],_ew._er + _ez
if not _e1 then
_e1={
_eq=n,_er=max_number,_es=_gy(n, goal)
}
frontier_len +=1
frontier[frontier_len], _ep[id]=_e1, _e1
end
if not _e1._ex and _e1._er > _e0 then
_e1._er, _e1._e2=_e0, p
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
if _cp._em!=nil then
for i=#_cp._em-1,1,-1 do
local _en=_cp._em[i]
if not _cp.norotate then
local a=atan2(
_cp.x-(_en.x*8),
_cp.y-(_en.y*8) )
while (_cp.r !=a) do
_gw(_cp, a)
end
end
if(not _ek and not _eg(nil,_en.x,_en.y)) goto restart_move_unit
local _e3,_e4=_cp._bs or .5, sqrt((_en.x*8-_cp.x)^2+(_en.y*8-_cp.y)^2)
local _e5,_e6=_e3 * (_en.x*8 - _cp.x) / _e4, _e3 * (_en.y*8 - _cp.y) / _e4
for i=0, _e4/_e3-1 do
_k[_en.x.."," .._en.y]=_cp
_cp.x+=_e5
_cp.y+=_e6
if _cp.id==33 then
if _cp.link then
local d=_gv(_cp.x,_cp.y,_cp.tx,_cp.ty)
if(d<32) _cp.z=d/4
end
_cp.z=mid(2,_cp.z+0.1,8)
_cp._bs=_cp.z/12
end
yield()
end
_cp.x,_cp.y,_k[_en.x.."," .._en.y]=_en.x*8, _en.y*8,_cp
_c5(_cp)
if(_gv(_cp.x,_cp.y,_cp.tx,_cp.ty) <=(_ei or 0)) break
end
else
_cp._cm=0
return false
end
_cp._cm=0
return true
end
function _e7()
cls"15"
camera(_as+(16-rnd"32")*_ba, _at+(16-rnd"32")*_ba)
_ba=(_ba>0.05) and _ba*0.95 or 0
if _ga then
for i=1,#_ga do
if(i%2==1) fillp(0xa5a5.8)
circfill(
_ga[i][1]+4,_ga[i][2]+4,4,_gd[i%#_gd+1])
fillp()
end
if(_dl>0) spr(88+_dl, _gf, _gg)
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
if(building==_bk) rect(_bk.x, _bk.y, _bk.x+_bk.w-1, _bk.y+_bk.h-1, 7)
end
pal()
for p=1,2 do
for _cp in all(_j) do
if(p==1 and _cp.z==1) or (p==2 and _cp.z>1) then
if(not _7) _cp:_ck()
if(_cp._ae!=2 or _cp._bs==0) _cp:_ao()
if(_cp==_bk) spr(2, _bk.x, _bk.y)
end
end
end
for p in all(_n) do
if(p._g2) fillp(p._g2)
circfill(p.x,p.y,p.r,p._g1[ flr((#p._g1/p._g4)*p._bd)+1 ])
fillp()
end
local _fb,_fc=_as\8,_at\8
palt(0,false)
palt(11,true)
for xx=_fb-1,_fb+16 do
for yy=_fc-1,_fc+16 do
local gx,gy=xx*8,yy*8
if _x[xx][yy]!=0 and _x[xx][yy]!=16 then
spr(_x[xx][yy]+31,gx,gy)
elseif _x[xx][yy]<16 then
rectfill(gx, gy, gx+7, gy+7, 0)
end
end
end
end
function _e8(_e9)
_v,_w=_e9,500
end
function _fa()
camera()
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,124,124,_c)
rect(91,91,123,123,_d)
rectfill(92,92,122,122,0)
if(_w>0) _w-=1 ?_v,2,2
_fd=_go(_g[1])
?sub("000000", #_fd+1).._fd, 103,2, _d
if hq!=_z then
_u,_fe=hq and 1 or 59, hq and 1 or -1
if(_fe<1) _e8("pOWER LOW.bUILD wINDTRAP")
_gk"55" end
_z=hq
if _u>0 and _u<60 then
_u+=_fe
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
local cx,cy=92+_as/16,93+_at/16
rect(cx,cy, cx+7,cy+6, 7)
local _ff=_bk and _bk._ah
if _bk and _bk.ico_spr then
_bk.ico_obj:_cy(109,20)
_bk.ico_obj:_ao()
_fg,_fh=nil,nil
if _bk._ap==1 then
if _ff then
_ff:_cy(109,44)
_ff:_ao()
end
if _bk._bd<_bk._b2
and _bk.id!=4
and (_bk.type==2
or _bk._bs==0) then
_fg=_bu(_ai[80], 117,28, 5, {}, nil,_ab, function()
_8(_do, 2)
end)
_fg:_ao()
end
if(_bk.id==19
and _bk._cw<=0)
or _bk.id==35
then
_fh=_bu(_ai[81], 109,29, 5, {}, nil,_ab, function()
if _do.id!=35 then
_e8"pick target" _fi=true
else
local mx,my=_do:_c0()
local _al=_ed(mx,my)
if _al>=12 and _al<=22 then
_do._bd=0
_a8(_ai[1],mx*8,my*8,1)
_gk"61" end
_do=nil
end
end)
_fh:_ao()
end
end
end
pal()
if _ff
and (_ff.type==4
and _ff._bs==0)
and _ff._bd>=100 then
local _fj,_fk=(cursor.x+_as)\8, (cursor.y+_at)\8
local _fl,_fm,w,h=_fj*8-_as,_fk*8-_at,_ff._b6,_ff._b7
_fn,_fo,_fp=false,false,false
for xx=-1,w do
for yy=-1,h do
local _al=_ed(_fj+xx, _fk+yy)
if xx==-1 or xx==w or yy==-1 or yy==h then
if(_al==22 or _al>=58 and _al<=81) _fn=true
else
if(_al>=12 and _al<=21) _fp=true
if(_k[_fj+xx.."," .._fk+yy] or _al==0 or _al<=12 or _al>=23) _fo=true
end
end
end
if(_fo)_fn=false
fillp("0b1110110110110111.1")
rectfill(_fl, _fm,_fl+_ff.w, _fm+_ff.h, _fn and 11 or 8)
fillp()
end
if _7 then
fillp(▒)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,_d)
rect(4,23,123,94,_c)
if _bk.build_objs then
_bk._fs={}
rectfill(6,25,27,92,0)
local _fq=1
for i=1,#_bk.build_objs do
local _fr=_bk.build_objs[i]
if not _fr.req_id
or _o[_bk.created_by][_fr.req_id]
and _fr.req_level<=_a
then
_bk._fs[_fq]=_fr
if _fq>=_1 and _fq<=_1+2 then
_fr:_cy(9,28+(_fq-_1)*19)
_fr:_ao()
else
_fr:_cy(-16,16)
end
_2=_2 or _bk._fs[1]
if _2==_fr then
_5=_fq
rect(_fr.x-2, _fr.y-2,_fr.x+17, _fr.y+17,7)
?_2._cx,30,26
?"cOST:" .._2._ev,85,33,9
?_2.description,30,34,6
end
_fq+=1
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
function _ft(x,_fu,_bl,_w)
add(_3,{
x=x,y=83,w=_w or 22,h=8,_fu=_fu,_an=function(self)
return self
end,_ao=function(self)
local c=self._f2 and 7 or 6
if(#_fu>1)rectfill(self.x,83,self.x+self.w,91, c)
?self._fu,self.x+2,85,#_fu>1 and 0 or c
end,_bl=_bl
})
end
function _fv()
_fw=false
if _bk then
_fx=true
_fz(_fg)
_fz(_fh)
if(_bk.ico_obj and not _7 and not _fw) _fz(_bk.ico_obj) _fz(_bk._ah)
if(_7) foreach(_bk.build_objs, _fz) foreach(_3, _fz)
_fx=false
end
if not _7
and not _fw then
foreach(_j, _fz)
foreach(_i, _fz)
end
if _de
and not _7
and _dg>89 and _dg<122
and _dh>90 and _dh<123 then
_as,_at=mid((_dg-94)*16, _y),mid(-8,(_dh-94)*16, _y)
_bk=_do
elseif _dd then
if(_bk and _bk.type<=2) _e8(_bk._cx)
if _fw then
if not _7 and _bk._bx!=nil then
if(_bk._bl) _bk:_bl()
_bk=_do
return
end
if(_7 and _2._fu and _2._bl) _2:_bl()
if(_bk._ap==1 and _bk.type==1 and _bk!=_do and _bk._bs>0) _gk"62"
if(_bk.created_by!=1 and _do and (_do.type==1 or (_do.id==19 and _fi)) and _do._ap==1) _bk._cl=10 _d5(_do, _bk) _bk=nil
else
if _bk
and _bk._ap==1
and _bk._bs>0
and _bk._cm!=7 then
_bk._cn=cocreate(function(_cp)
_eh(_cp, (_as+_dg)\8, (_at+_dh)\8)
_dw(_cp)
end)
end
local _ff=_bk and _bk._ah
if _ff
and _ff._bd>=100
and _fn then
_a8(_ff._b1,(cursor.x+_as)\8 *8,(cursor.y+_at)\8 *8, 1)
_fy(_ff)
_gk"61" end
end
_fi=false
elseif _df and not _7 then
_bk,_fi=nil,false
end
end
function _fy(_b0)
_b0._bd,_b0._ae,_b0.spent,_b0._cu=0,0,0,false
if(_b0._bx) _b0._bx._ag=false
end
function _fz(_b0)
if(not _b0) return
local _f0,_f1=cursor:_an(),_b0:_an()
_b0._f2=_f0.x < _f1.x + _f1.w and
_f0.x + _f0.w > _f1.x and
_f0.y < _f1.y + _f1.h and
_f0.y + _f0.h >_f1.y
if _dd and _b0._f2 then
if _7 then
_2=_b0
else
if(_b0.type<=2 and _x[(cursor.x+_as)\8][(cursor.y+_at)\8]!=16 or _b0._cm==8) return
if _bk
and _do
and (_b0.id==6 and _do.id==32
or _b0.id==14 and _do.id>26)
and _b0._ap==1 and _do._ap==1
then
_f3(_do,_b0)
return
else
_bk=_b0
end
end
_fw=true
end
end
function _f3(_cp,_dr)
_dr=_dr or _gu(_o[_cp.created_by][1]) or _cp
_cp._cm,_dr._ag,_cp._dz=7,true,_dr
if(_cp.id!=32 or _dr.id==6) _cp._bt=_dr
_cp._cn=cocreate(function(_cp)
local _f4=_dr.id!=1 and 9 or 0
_eh(_cp, (_dr.x+16)/8, _dr.y/8, 0, true, _f4)
if(not _cp.link) _dw(_cp, _f4)
end)
end
_f5=0
function _f6()
if t()%_b==0 then
local _f7=rnd(_j)
if _f7._ap==2 and _0[_f7._d8] and _f7._d7>0 and _f7._cm==0 then
_gh(_f7)
end
local _f8=rnd(_i)
if _f8._ap==2
and (not _f8._ah or _f8._ah._ae!=1) then
local u=rnd(_f8.build_objs)
if u and u._bs>0 then
u:_bl()
end
if _f8._bd<_f8._b2 and _f8._ae!=2 then
_8(_f8, 2)
end
end
local _f9=_gu(_o[2][19])
if _f9
and _0[_f9._d8]
and _f9._cw<=0
and _gi and _gi.type==2 then
_d5(_f9, _gi)
end
end
_f5-=1
if _f5<0 then
if _ga then
_ga=nil
else
_ga,_gb,_gc,_gd,_dl={{rnd"500",rnd"500" }},rnd"1",0,_gp"15,9,4",0
end
_ge=rnd"5000" _f5=_ge
end
if _ga then
if(t_%6<1 or #_ga<30) and _dl==0 then
while #_ga<31 do
if(rnd"9" <.5) _gc=rnd".04" -.02
_gf,_gg=_ga[#_ga][1],_ga[#_ga][2]
add(_ga,{_gf+sin(_gb),_gg-cos(_gb)})
_gb+=_gc
end
end
if(#_ga>30) del(_ga,_ga[1])
if(_dl>0) _dl+=.01 _d4(_gf,_gg,rnd"1")
if(_dl>2) _dl=0
end
end
function _gh(_b0)
repeat
_gi=(rnd"4" <1) and rnd(_j) or rnd(_i)
until _gi.created_by!=_b0.created_by
if(_gi and _gj(_gi)) _d5(_b0, _gi)
end
function _gj(_b0)
local x,y=_b0:_c0()
return _x[x][y]==16
end
function _gk(_gl)
sfx(_gl,3)
end
function _gm(_gn)
local _al=peek(0x3115)
if(_al & 128 > 0 !=_gn) _al=_al^^128
poke(0x3115, _al)
end
function _go(_al)
local s,v="",abs(_al)
repeat
s=(v % 0x0.000a / 0x.0001)..s
v /=10
until v==0
return s
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
function _gr(_gs,_gt,_c6)
if(not _gs[_gt]) _gs[_gt]={}
add(_gs[_gt],_c6)
end
function _gu(_gs)
if(_gs) return rnd(_gs)
end
function _gv(x1,y1,x2,y2)
return sqrt(((x1-x2)>>10)^2+((y1-y2)>>10)^2)<<10
end
function _gw(_cp, _gx)
local _c2=_gx-_cp.r
if(_cp.z>1) _cp.r=_gx
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
_cp.r=_gx
end
yield()
end
function _gy(a, b)
return abs(a.x-b.x) + abs(a.y-b.y)
end
function _gz(x, y, r, dx, dy, dr, _g0, _bd, _g1, _g2)
add(_n, {
x=x,y=y,r=r,dx=dx,dy=dy,dr=dr,_bd=0,_g0=_g0,_g1=_g1, _g2=_g2,_g3=y, _g4=_bd }, 1)
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

