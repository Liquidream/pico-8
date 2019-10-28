pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
b=false
c=3
d=8
e=2
f={0,0}
f[1]+=shr(3990,16)
g={}
i=1
j=12
k=1
l=5
f[2]+=shr(1000,16)
m={}
n,o=0,0
p,q=0,0
r,s=0,0
u=nil
v=0
x=false
y=x
z=0
ba={}
bb=0
count=0
bc={}
bd={}
be={}
bf={}
bg={}
bh=0
bi={}
bi.factory_click=function(self)
bj=1
bk=self.bl.bm[1]
bn(6,89,"⬆️",function(self)
bo=mid(1,bo-1,#u.bp)
bk=u.bp[bo]
if(bo<bj) bj-=1
end,10)
bn(17,89,"⬇️",function(self)
bo=mid(1,bo+1,#u.bp)
bk=u.bp[bo]
if(bo>bj+2) bj=min(bj+1,#bq.bl.bp-2)
end,10)
bn(32,88,"build",function(self)
bq=nil
bf={}
u.br=bs
bs:func_onclick()
end)
bn(96,88,"close",function(self)
bq=nil
end)
bq=self
end
bi.init_windtrap=function(self)
self.bt={
{11,12},
{11,12},
{11,12},
{11,12},
{11,13},
{11,1},
{11,1},
{11,1},
{11,1},
{11,13},
}
self.bu=1
end
bi.init_refinery=function(self)
self.bt={11,10,9,9,9,9}
self.bu=1
end
bi.draw_refinery=function(self)
pal()
palt(0,false)
pal(11,self.bv)
pal(10,self.bv)
pal(9,self.bv)
if self.bw then
pal(self.bt[self.bu],self.bx)
else
pal(11,self.bx)
self.bu=1
end
spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
bi.draw_repair=function(self)
pal()
palt(0,false)
palt(11,true)
if(ca()) pal(7,u.cb==2 and 11 or 8)
spr(self.obj_spr,self.by,self.bz)
pal()
end
bi.repair_click=function(self)
cc(cd,2)
end
function cc(self,ce)
self.cf=0
self.cg=self.cb
if(self.ch>0 and self.cg>0) self.ci=not self.ci
self.cb=ce
end
cj=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|0|0|200|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5|0|600|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10|0|1200|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10|0|1600|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20|0|1400|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20|0|800|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35|0|1600|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5|99|700|20|0|800|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||1|1|1|11|1|7|5||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||1|1|1|11|1|7|6||250|20|112|1200|0|9|2||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50|0|2000|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40|0|1600|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|-3|60||4|200|0.05|2|1|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|-1|100||8|440|0.1|3|1|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD|55|206||1|1|1|11|11||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|-3|600||75|20|1.5|5|2||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4|99|900||0|600|0|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|1|600||90|440|0.3|8|11||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|1|0||8|880|0.1|3|1||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|3|0||150|280|2.5|nil|20||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER|54|204||1|1|1|11|11||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|2|750||0|480|0.3|7|11||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|2|0||150|160|0.4|2|||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|440|0.1|1|||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||9|1|1|11|nil|nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||
80|rEPAIR|47|47||5|1|1|11|nil|nil|||||||||||||||draw_repair||repair_click]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
cartdata("pn_picodune")
ck()
cl=cm(cj[80],109,-20,5,{},nil,bi.draw_repair,bi.repair_click)
cn=1
co()
cp=0
cursor={
by=0,
bz=0,
w=8,
h=8,
spr=0,
cq=function(self)
return{
by=self.by+(not cr and n or 0)+2,
bz=self.bz+(not cr and o or 0)+1,
w=1,
h=1
}
end,
cs=function(self)
spr((u and(u.type==1 and u.ct==1)) and 1 or self.obj_spr,
self.by,self.bz,self.w/8,self.h/8)
end
}
cu()
n=44
o=20
music(7)
end
function cu()
for cv=1,2 do
for cw=0,31 do
for cx=0,127 do
local cy=nil
local cz=mget(cx,cw)
local da=fget(cz)
if cv==1 and cz==1 then
db=cx*8
dc=cw*8
cy=cj[1]
elseif cv==2
and cz!=16 then
for dd in all(
cj) do
if(dd.obj_spr!=nil and dd.obj_spr==cz) cy=dd break
end
end
if cy!=nil then
local de,df=cx,cw
if(de>63) df+=31 de-=64
dg(cy,de*8,df*8)
if cy.type==1
and cy.speed>0 then
mset(cx,cw,48)
end
end
end
end
end
end
function dg(cy,by,bz,ct,dh)
local di=cm(cy,by,bz,cy.type,nil,bi[cy.func_init],bi[cy.func_draw],bi[cy.func_update],nil)
di.dj=cm(cy,109,0,3,di,nil,nil,bi[cy.func_onclick])
di.ch=dk and cy.hitpoint/2 or cy.hitpoint
di.bm={}
for dd in all(cj) do
if(dd.parent_id!=nil and dd.parent_id==di.id)
and(dd.req_faction==nil
or(dd.req_faction>0 and dd.req_faction==c)
or(dd.req_faction<0 and-c!=dd.req_faction))
then
local br=cm(dd,109,0,4,di,nil,nil,function(self)
if bq then
u=self
else
cc(self,1)
end
end)
add(di.bm,br)
di.br=di.bm[1]
end
end
di.ct=ct or(dl(by,bz,db,dc)<75 and 1 or 2)
if di.ct==1 then
di.dm=c
di.bx=d
di.bv=e
m[di.id]=true
else
di.dm=i
di.bx=j
di.bv=k
di.dj.func_onclick=nil
end
local dn=flr(by/8)
local dp=flr(bz/8)
if cy.type==2 then
di.dq=53
local dr=(cy.id==2 or cy.id==3)
for ds=0,cy.w-1 do
for dt=0,cy.h-1 do
du(dn+ds,dp+dt,dr and 16 or 95)
end
end
if(not dr) add(be,di)
if di.id==6 and di.bl==nil then
g[di.ct]=di
local dv,dw=dx(di,(di.by+32)/8,(di.bz+8)/8,dy)
local dz=dg(cj[27],dv*8,dw*8,nil,di)
end
end
if cy.type==1 then
di.dq=54
if(di.norotate!=1) di.ea=flr(rnd(8))*.125
if di.arms>0 then
di.eb=function(self)
self.ec=4
self.ed=self.by+4
self.ee=self.bz+4
self.ef=self.eg.by+self.eg.w/2
self.eh=self.eg.bz+self.eg.h/2
local ei=self.ef-self.ed
local ej=self.eh-self.ee
local ek=sqrt(ei*ei+ej*ej)
self.el=(ei/ek)*2
self.em=(ej/ek)*2
sfx(self.arms<100 and 60 or 58,3)
en(self)
end
if di.id==15 or di.id==16 then
du(dn,dp,95)
end
else
if(di.id==27) di.eo=0 di.ep=g[di.ct]
end
add(bc,di)
eq(di)
end
en(di)
return di
end
function cm(er,by,bz,es,bl,func_init,func_draw,func_onclick)
local et=(er.w or 1)*8
local eu=(er.h or 1)*8
local ev={
ew=er,
by=by,
bz=bz,
ex=1,
type=es,
bl=bl,
func_onclick=func_onclick,
w=et,
h=eu,
ey=er.obj_spr,
ez=er.w or 1,
fa=er.h or 1,
ch=0,
fb=0,
cb=0,
fc=0,
fd=0,
fe=0,
ff=1,
cq=function(self)
return{
by=self.by,
bz=self.bz,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cs=func_draw or function(self)
if self.type<=2
and(self.by+self.w<n
or self.by>n+127
or self.bz+self.h<o
or self.bz>o+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dm) pal(12,self.bx) pal(14,self.bv)
if self.bt then
pal(self.bt[self.bu][1],
self.bt[self.bu][2])
end
if self.ea then
if not self.fg or self.fg>.025 then
if(self.speed>0) fh(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz+1,.25-self.ea,1,self.trans_col,5)
fh(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz,.25-self.ea,1,self.trans_col,flr(self.ff)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.by-1,self.bz-1,self.by+16,self.bz+19,0)
local fi=self.type==4 and self or self.bl
local fj=fi.ew.hitpoint
local fk=self.cb==1 and 12 or(fi.ch<fj*.33 and 8 or fi.ch<fj*.66 and 10 or 11)
local fl=self.cb==1 and(15*fi.ch/100) or(15*fi.ch/fj)
if(fi.ch>0 and not bq) rectfill(self.by,self.bz+17,self.by+fl,self.bz+18,fk)
end
if self.type>2 then
spr(self.ico_spr,self.by,self.bz,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
end
if self.ed then
if(self.fm==1) then
circfill(self.ed,self.ee,0,rnd(2)<1 and 8 or 9)
else
fn(self.ed,self.ee,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.ch<self.ew.hitpoint*.33 then
if(rnd(10)<1) fn(self.by+3.5,self.bz+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fe=0
if(b) fo(self)
end,
fp=function(self)
self.ff=max(self.ff-.4,1)
if self.fe>0 then
fq(5,true)
if(bb==0 or stat(24)>5) bb=1 music(0)
if(self.arms>0 and self.ec!=4) fr(self,self.fs)
end
if(self.type<=2 and self.ch<=0 and self.fg==nil) self.ec=5 self.ft=nil self.fg=(self.type==2 and 1 or .5) sfx(self.dq,3)
if self.fg then
self.fg-=.025
if self.fg<=0 then
if self.type==2 then
for ds=0,self.ew.w-1 do
for dt=0,self.ew.h-1 do
du(self.by/8+ds,self.bz/8+dt,15)
end
end
del(be,self)
else
local fu,fv=flr(self.by/8),flr(self.bz/8)
if(fv>31) fu+=64 fv-=32
if(fw(fu,fv)<9) du(fu,fv,20)
if(self.speed==0) du(fu,fv,15)
del(bc,self)
end
if(u==self) u=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fx(self.by+rnd(self.w),self.bz+rnd(self.h))
end
end
if self.framecount!=nil then
self.fb+=1
if(self.fb>self.framecount) then
self.fb=0
if self.altframe
and self.ec==2 then
self.obj_spr=self.ey+(self.altframe-self.obj_spr)
end
if self.bt then
self.bu+=1
if(self.bu>#self.bt) self.bu=1
end
end
end
if self.ed then
self.ed+=self.el
self.ee+=self.em
if dl(
self.ed,self.ee,
self.ef,self.eh)<2
then
fx(self.ed,self.ee,self.fm)
if dl(
self.ed,self.ee,
self.eg.by+self.eg.w/2,
self.eg.bz+self.eg.h/2)<4
then
self.eg.ch-=self.arms
self.eg.fe=self.fm
self.eg.fs=self
end
self.ed=nil
end
end
if self.cb>0
and not self.ci
and not self.fy then
if self.cb==1 and self.fc>self.cost then
self.fy=true
sfx(56)
if self.ew.type==1
and self.ew.id!=15
and self.ew.id!=16 then
local dv,dw=dx(self,(self.bl.by+8)/8,(self.bl.bz+16)/8,dy)
dg(self.ew,dv*8,dw*8,nil,self.bl)
fz(self)
end
elseif self.cb==2 and self.ch>self.ew.hitpoint then
self.cb=0
else
self.cf+=1
self.ch=(self.cb==1 and(self.fc/self.cost)*100 or self.ch+.5)
if(self.cf>(self.cb==1 and 3 or 100) and ga(-1,self.cb==1 and self.bl or self)) self.cf=0 self.fc+=1
end
end
end,
gb=function(self,by,bz)
self.by=by
self.bz=bz
end,
gc=function(self)
return flr(self.by/8)..","..flr(self.bz/8)
end
}
for gd,ge in pairs(er) do
if ev[gd]==nil and ge!=""then
ev[gd]=ge
end
end
if(func_init) func_init(ev)
return ev
end
function ga(gf,ev)
if(gg(f[ev.ct])+gf<0) return false
f[ev.ct]+=sgn(gf)*shr(abs(gf),16)
if(ev.ct==1) sfx(63)
return true
end
function fx(by,bz,gh)
fn(by,bz,2,
0,0,.1,0,gh==1 and 5 or 30,{5,7,10,8,9,2},rnd(2)<1 and 0xa5a5.8 or 0)
end
function en(gi)
if(gi.ct!=1 and gi.ec!=4) return
local gj=gi.type==2 and 3 or 2
for ds=-gj,gj do
for dt=-gj,gj do
local gk=flr(gi.by/8)+ds
local gl=flr(gi.bz/8)+dt
gm[gk][gl]=16
gn(gk,gl)
for ej=-1,1 do
for ei=-1,1 do
gn(gk+ei,gl+ej)
end
end
end
end
end
function _update60()
go()
gp()
if(t()%1==0) gq()
if(t()%1==0 and t()%2==0) gr()
v+=1
end
function _draw()
gs()
gt()
if(a) gu("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function co()
gm={}
for cv=-2,66 do
gm[cv]={}
for gv=-2,66 do
gm[cv][gv]=0
end
end
end
function gw()
local gx=flr(n/8)
local gy=flr(o/8)
for ds=gx-1,gx+16 do
for dt=gy-1,gy+16 do
if gm[ds][dt]!=0 and gm[ds][dt]!=16 then
palt(11,true)
spr(gm[ds][dt]+31,ds*8,dt*8)
elseif gm[ds][dt]<16 then
rectfill(ds*8,dt*8,ds*8+7,dt*8+7,0)
end
end
end
end
function gn(by,bz)
if(by<0 or by>#gm or bz<0 or bz>#gm) return
local gz=0
if gm[by][bz]!=0 then
if(gm[by][bz-1]>0) gz+=1
if(gm[by-1][bz]>0) gz+=2
if(gm[by+1][bz]>0) gz+=4
if(gm[by][bz+1]>0) gz+=8
gm[by][bz]=1+gz
end
end
function gr()
ba={}
if x then
for cv=0,124,4 do
for gv=0,124,4 do
local cx=cv/2
local cw=gv/2
if(cw>=32) cx+=64 cw-=32
local ha=mget(cx,cw)
local hb=(ha*8)%128
local hc=(ha*8)/16
local fk=sget(hb+4,hc)
if(gm[cv/2][gv/2]==16) ba[((cv/2)/2)..","..((gv/2)/2)]=fk!=11 and fk or 15
end
end
end
bh=0
hd=0
he=false
for hf,hg in pairs(be) do
local gk=flr(hg.by/8)
local gl=flr(hg.bz/8)
if hg.ct==1 or(x and gm[gk][gl]==16) then
ba[flr(hg.by/2/8)..","..flr(hg.bz/2/8)]=hg.bx
end
if(hg.ct==1) then
bh-=hg.ew.power
if(hg.id==7) he=true
if(sub(hg.name,1,5)=="sPICE") hd+=1000
end
end
if x then
for hf,hh in pairs(bc) do
local gk=flr(hh.by/8)
local gl=flr(hh.bz/8)
if hh.ct==1 or gm[gk][gl]==16 then
ba[flr(hh.by/2/8)..","..flr(hh.bz/2/8)]=hh.bx
end
end
end
printh("total_storage = "..hd)
x=(he and bh>0)
fq(5,false)
bb=2
end
function gq()
bd={}
for gd,hh in pairs(bc) do
bd[flr(hh.by/8)..","..flr(hh.bz/8)]=gd
end
end
function go()
hi=stat(32)
hj=stat(33)
hk=stat(34)
hl=(hk>0 and hm!=hk) or btnp(4)
hn=(hk>0) or btn(4)
ho=btnp(5)
for gd=0,1 do
if(btn(gd)) r+=gd*2-1
if(btn(gd+2)) s+=gd*2-1
end
p=mid(0,hi+r,127)
q=mid(0,hj+s,127)
cursor.by=p
cursor.bz=q
if not bq then
if(p<4) n-=2
if(p>123) n+=2
if(q<4) o-=2
if(q>123) o+=2
n=mid(n,384)
o=mid(o,384)
for hf,hh in pairs(bc) do
if hh then
if hh.ft and costatus(hh.ft)!='dead'then
assert(coresume(hh.ft,hh))
else
hh.ft=nil
end
end
end
hp()
cp+=1
end
hq()
hm=hk
cd=u
bs=bk
end
function hr(by,bz)
local fl=fw(by,bz)
return fl>=2 and fl<=8
end
function eq(hh,hs)
hh.ec=hs or 0
hh.ft=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) dx(self,flr(self.by/8),flr(self.bz/8),ht,self.range)
if self.id==27 then
if self.ec==0 or self.ec==7 or self.ec==9 then
if self.eo<=1500
and self.ec!=7 and self.ec!=9 then
local hb,hc
local hu,hv=flr(self.by/8),flr(self.bz/8)
if hr(hu,hv) and not self.hw then
hb,hc=hu,hv
else
dx(self,hu,hv,
function(hh,by,bz)
if hr(by,bz) and rnd(10)<1 then
hb,hc=by,bz
return true
end
end,
10)
end
if hb and hc then
hx(hh,hb,hc)
if(hr(flr(hh.by/8),flr(hh.bz/8))) hh.ec=6
end
elseif self.ec==9 then
if not self.ep.hy then
self.ep.bw=false
self.ep.hy=true
while self.eo>0 do
self.ec=8
self.ea=.25
self.by=self.ep.by+16
self.bz=self.ep.bz+4
self.eo-=1
if(u==self) u=nil
if(flr(self.eo)%4==0 and tonum(hz)<hd) ga(2,self)
yield()
end
self.eo=0
self.ep.hy=false
self.ec=0
end
end
elseif self.eo>=1500
and self.ec!=7 then
self.ec=7
self.ep.bw=true
hx(self,(self.ep.by+16)/8,self.ep.bz/8)
self.ec=9
elseif self.ec==6 then
self.hw=false
local ea=hh.ea+.75+rnd(.2)-.1
local ia,ib=sin(ea)*5.5,-cos(ea)*5.5
if(rnd(5)<1) fn(hh.by+ia+3.5,hh.bz+ib+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bg[hh:gc()]=(bg[hh:gc()] or 10000)-1
self.eo=(self.eo or 0)+.5
if bg[hh:gc()]<=0 then
local dn=flr(self.by/8)
local dp=flr(self.bz/8)
for dt=-1,1 do
for ds=-1,1 do
fl=fw(dn+ds,dp+dt)
du(dn+ds,dp+dt,
(ds==0 and dt==0) and 0 or((fl>1 and fl<8) and 8 or fl)
)
end
end
self.ec=0
end
if self.eo%300==0 then
self.hw=true
self.ec=0
end
end
end
yield()
end
end)
end
function fr(hh,eg)
hh.ec=3
hh.eg=eg
hh.ft=cocreate(function(self)
while eg.ch>0 do
local ic=dl(hh.by,hh.bz,eg.by,eg.bz)
if ic>hh.range*5
and hh.speed>0 then
hx(hh,flr(eg.by/8),flr(eg.bz/8),hh.range*5)
end
if not hh.norotate then
local ie=atan2(hh.by-eg.by,hh.bz-eg.bz)
while(hh.ea!=ie) do
ig(hh,ie)
end
end
if(ic<=hh.range*5) then
hh.fd-=1
if(hh.fd<=0 and not hh.ed) hh.eb(hh) hh.fd=hh.arms*2
elseif hh.speed==0 then
eq(hh)
end
yield()
end
eq(self)
end)
end
function dx(hh,by,bz,ih,ii)
for dl=1,ii or 64 do
for ds=by-dl,by+dl do
for dt=bz-dl,bz+dl do
if((ds==by-dl or ds==by+dl or dt==bz-dl or dt==bz+dl) and(ih(hh,ds,dt))) return ds,dt
end
end
yield()
end
end
function fw(cx,cw)
if(cw>31) cx+=64 cw-=32
return mget(cx,cw)
end
function du(cx,cw,ij)
if(cw>31) cx+=64 cw-=32
mset(cx,cw,ij)
end
function dy(hh,by,bz)
return not fget(fw(by,bz),0)
and bd[by..","..bz]==nil
end
function ht(hh,by,bz)
local eg=bc[bd[by..","..bz]]
if(eg!=ik and eg.ct!=hh.ct and gm[by][bz]==16) fr(hh,eg) return true
end
function hx(hh,by,bz,il)
::restart_move_unit::
hh.im="init"
if not dy(nil,by,bz) then
by,bz=dx(hh,by,bz,dy)
end
hh.hu=by
hh.hv=bz
hh.io=hh.ec
hh.ec=1
hh.im=ip(
{by=flr(hh.by/8),bz=flr(hh.bz/8)},
{by=hh.hu,bz=hh.hv},
iq,
ir,
is,
function(it) return shl(it.bz,8)+it.by end,
nil)
hh.io=hh.ec
hh.ec=2
hh.ec=2
if hh.im!=nil then
for cv=#hh.im-1,1,-1 do
local it=hh.im[cv]
if not hh.norotate then
local ei=hh.by-(it.by*8)
local ej=hh.bz-(it.bz*8)
local ie=atan2(ei,ej)
while(hh.ea!=ie) do
ig(hh,ie)
end
end
if(not dy(nil,it.by,it.bz)) goto restart_move_unit
local iu=hh.speed or .5
local iv=sqrt((it.by*8-hh.by)^2+(it.bz*8-hh.bz)^2)
local iw=iu*(it.by*8-hh.by)/iv
local ix=iu*(it.bz*8-hh.bz)/iv
for cv=0,iv/iu-1 do
bd[it.by..","..it.bz]=hh
hh.by+=iw
hh.bz+=ix
yield()
end
hh.by,hh.bz=it.by*8,it.bz*8
bd[it.by..","..it.bz]=hh
en(hh)
if(dl(hh.by,hh.bz,hh.hu*8,hh.hv*8)<=(il or 0)) break
end
end
hh.ec=0
end
function gp()
if(t()>l and t()%l*2==0) then
local iy=bc[flr(rnd(#bc))+1]
if iy.ct==2 and iy.arms>0 and iy.ec==0 then
local iz=(rnd(2)<1) and bc[flr(rnd(#bc))+1] or be[flr(rnd(#be))+1]
if iz and iz.ct==1 then
printh(">>> attack!")
fr(iy,iz)
end
end
end
end
function gs()
cls"15"
camera(n,o)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hf,hg in pairs(be) do
if not bq then
hg:fp()
if(hg.br) hg.br:fp()
end
hg:cs()
if(hg==u) then
rect(u.by,u.bz,
u.by+u.w-1,u.bz+u.h-1,
7)
end
end
palt(11,true)
for hf,hh in pairs(bc) do
if(not bq) hh:fp()
hh:cs()
if(hh==u) then
palt(11,true)
spr(17,u.by,u.bz)
end
end
ja()
gw()
end
function jb()
local gj=31
local by,bz=93,93
rectfill(by-1,bz-1,by+gj+1,bz+gj+1,e)
rectfill(by,bz,by+gj,bz+gj,0)
if x!=y then
z=x and 1 or 59
jc=x and 1 or-1
sfx(55)
gr()
end
y=x
if z>0 and z<60 then
z+=jc
clip(
max(by+(gj/2)-z,by),
max(bz+(gj/2)-(z>20 and z-20 or 0),bz),
min(z*2,gj),
min((z>20 and z-20 or 1)*2,gj))
for cv=1,300 do
pset(by+rnd(gj),bz+rnd(gj),5+rnd(3))
end
clip()
return
end
for ds=0,gj do
for dt=0,gj do
if(ba[ds..","..dt]) pset(by+ds,bz+dt,ba[ds..","..dt])
end
end
local ia=by+n/16
local ib=bz+o/16
rect(ia,ib,ia+7,ib+7,7)
end
function gt()
camera(0,0)
pal()
palt(0,false)
if u and u.dj then
u.dj:gb(109,20)
u.dj:cs()
if u.br and u.ct==1 then
u.br:gb(109,44)
u.br:cs()
end
if u.ch<u.ew.hitpoint
and u.ct==1
and u.id!=4
and(u.type==2
or u.id==15
or u.id==16) then
cl:gb(117,28)
cl:cs()
end
end
hz=gg(f[1])
gu(sub("000000",#hz+1)..hz,103,2,7)
if u
and u.br
and(u.br.ew.type==2
or u.br.ew.id==15
or u.br.ew.id==16)
and u.br.ch>=100 then
local jd=flr((cursor.by+n)/8)
local je=flr((cursor.bz+o)/8)
local jf=jd*8-n
local jg=je*8-o
jh=false
ji=false
dk=false
local w=u.br.ew.w
local h=u.br.ew.h
for ds=-1,w do
for dt=-1,h do
if ds==-1 or ds==w or dt==-1 or dt==h then
if(fw(jd+ds,je+dt)==16 or fw(jd+ds,je+dt)>=63) jh=true
else
local fl=fw(jd+ds,je+dt)
if(fl>=9 and fl<=15) dk=true
if(bd[jd+ds..","..je+dt] or fl==0 or fl<8 or fl>16) ji=true
end
end
end
if(ji) jh=false
fillp("0b1110110110110111.1")
rectfill(jf,jg,
jf+u.br.w,jg+u.br.h,jh and 11 or 8)
fillp()
end
jb()
if bq then
jj(121,73,e,d)
if u.bm then
u.bp={}
rectfill(6,30,27,97,0)
local jk=1
for cv=1,#u.bm do
local jl=u.bm[cv]
if jl.req_id==nil
or m[jl.req_id] then
u.bp[jk]=jl
if jk>=bj and jk<=bj+2 then
jl:gb(9,32+((jk-bj)*19))
jl:cs()
else
jl:gb(-16,16)
end
if(bk==jl) then
bo=jk
rect(jl.by-2,jl.bz-2,
jl.by+17,jl.bz+17,
7)
print(bk.name,30,31,7)
print("cOST:"..bk.cost,85,38,9)
jm=0
local jn=jo(bk.description,23)
for gv in all(jn) do
print(gv,30,44+jm,6)
jm+=6
end
end
jk+=1
end
end
end
for hf,jp in pairs(bf) do
jp:cs()
end
end
palt(11,true)
cursor:cs()
end
function jj(w,h,jq,jr)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-w/2,64-h/2,64+w/2,64+h/2,jq)
rect(64-w/2+1,64-h/2+1,64+w/2-1,64+h/2-1,jr)
end
function bn(by,bz,js,func_onclick,et)
local ev={
by=by,
bz=bz,
w=et or#js*4+2,
h=8,
js=js,
cq=function(self)
return{
by=self.by,
bz=self.bz,
w=self.w,
h=self.h
}
end,
cs=function(self)
if(#js>1) rectfill(self.by,self.bz,self.by+self.w,self.bz+self.h,7)
if(#js>1) rectfill(self.by+1,self.bz+1,self.by+self.w-1,self.bz+self.h-1,self.jt and 12 or 6)
print(self.js,self.by+2,self.bz+2,(#js>1) and 0 or(self.jt and 12 or 7))
if(b) fo(self)
end,
func_onclick=func_onclick
}
add(bf,ev)
end
function jo(ju,jv)
local jw={}
local jx=""
local jy=""
local jz=""
local ka=function(kb)
if#jy+#jx>kb then
add(jw,jx)
jx=""
end
jx=jx..jy
jy=""
end
for cv=1,#ju do
jz=sub(ju,cv,cv)
jy=jy..jz
if jz==" "
or#jy>jv-1 then
ka(jv)
elseif#jy>jv-1 then
jy=jy.."-"
ka(jv)
elseif jz==";"then
jx=jx..sub(jy,1,#jy-1)
jy=""
ka(0)
end
end
ka(jv)
if jx!=""then
add(jw,jx)
end
return jw
end
function hq()
kc=false
if u then
cr=true
if(cd.ch and cd.ch<cd.ew.hitpoint) kd(cl)
if(u.dj and not bq and not kc) kd(u.dj)
foreach(u.bm,kd)
foreach(bf,kd)
cr=false
end
if not bq
and not kc then
foreach(bc,kd)
foreach(be,kd)
end
if hn
and not bq
and p>89 and p<122
and q>90 and q<123 then
n=mid(0,(p-94)*16,400)
o=mid(0,(q-94)*16,400)
elseif hl then
if kc then
if(not bq and u.func_onclick and u.bl!=nil) u:func_onclick() u=cd return
if(bq and bk.js and bk.func_onclick) bk:func_onclick()
if(u.ct==1 and u.type==1 and u!=cd and u.speed>0) sfx(62)
if(u.ct==2 and cd and cd.type==1 and cd.ct==1) u.ff=10 fr(cd,u) u=nil
else
if u
and u.type==1
and u.ct==1
and u.speed>0
and(u.id!=27 or u.ec!=7) then
u.ft=cocreate(function(hh)
hx(hh,flr((n+p)/8),flr((o+q)/8))
eq(hh)
end)
end
if u
and u.br
and u.br.ch>=100
and jh then
local dn=flr((cursor.by+n)/8)
local dp=flr((cursor.bz+o)/8)
local cy=u.br.ew
dg(cy,dn*8,dp*8,1)
fz(u.br)
sfx(61)
end
if(not bq) u=nil
end
end
end
function fz(ev)
ev.ch=0
ev.cb=0
ev.fc=0
ev.fy=false
end
function kd(ev)
ev.jt=ke(cursor,ev)
if hl and ev.jt then
if bq then
bk=ev
else
local dn=flr((cursor.by+n)/8)
local dp=flr((cursor.bz+o)/8)
if(ev.type<=2 and gm[dn][dp]!=16) return
if(ev.id==27 and ev.ec==8) return
if ev.id==6 and u and u.id==27 and u.ct==1 then
u.ec=7
u.ep=ev
u.ep.bw=true
u.ft=cocreate(function(hh)
hx(hh,(ev.by+16)/8,dp)
eq(hh,9)
end)
return
else
u=ev
end
end
kc=true
end
end
function kf(self,kg)
if(kg==self.kh) return
local ie=self.ki[kg]
self.kj=ie.cp
self.kh=kg
self.kk=1
end
function kl(self)
self.kj-=1
if self.kj<=0 then
self.kk+=1
local ie=self.ki[self.kh]
self.kj=ie.cp
if self.kk>#ie.km then
self.kk=1
end
self.obj_spr=ie.km[self.kk]
end
end
function fq(kn,ko)
local kp=0x3100
local kq=1
kn*=4
local fl=peek(kp+kn+kq)
if((band(fl,128)>0)!=ko) fl=bxor(fl,128)
poke(kp+kn+kq,fl)
end
function gu(kr,ks,
kt,fk,
ku)
for ds=-1,1 do
for dt=-1,1 do
print(kr,ks+ds,kt+dt,ku)
end
end
print(kr,ks,kt,fk)
end
function ke(kv,kw)
local kx=kv:cq()
local ky=kw:cq()
if kx.by<ky.by+ky.w and
kx.by+kx.w>ky.by and
kx.bz<ky.bz+ky.h and
kx.bz+kx.h>ky.bz
then
return true
else
return false
end
end
function fo(ev)
local kz=ev:cq()
rect(kz.by,kz.bz,kz.by+kz.w,kz.bz+kz.h,ev.jt and 11 or 8)
end
function ca()
return flr(t())%2==0
end
function ck()
la=lb(cj,"|","\n")
lc={}
for cv=2,#la-1 do
ld={}
for le=1,#la[cv] do
local fl=la[cv][le]
if(le!=2 and le<24) fl=tonum(fl)
ld[la[1][le]]=fl
end
lc[tonum(la[cv][1])]=ld
end
cj=lc
end
function gg(fl)
local lf=""
local ge=abs(fl)
repeat
lf=(ge%0x0.000a/0x.0001)..lf
ge/=10
until ge==0
if(fl<0) lf="-"..lf
return lf
end
function lb(kr,ek,lg)
local ie={}
local lh=0
local lf=''
local li=''
if lg~=nil then kr=lb(kr,lg) end
while#kr>0 do
if type(kr)=='table'then
lf=kr[1]
add(ie,lb(lf,ek))
del(kr,lf)
else
lf=sub(kr,1,1)
kr=sub(kr,2)
if lf==ek then
add(ie,li)
li=''
else
li=li..lf
end
end
end
add(ie,li)
return ie
end
local lj=0
function fh(hb,hc,by,bz,ie,w,lk,ll)
local lm,ln=cos(ie),sin(ie)
local lo,lp,kp,lq
local lr,lt=lm,ln
local gz=shl(0xfff8,(w-1))
w*=4
lm*=w-0.5
ln*=w-0.5
local lu,lv=ln-lm+w,-lm-ln+w
w=2*w-1
for lw=0,w do
lo,lp=lu,lv
for lx=0,w do
if band(bor(lo,lp),gz)==0 then
local lh=sget(hb+lo,hc+lp)
if(lh!=lk) pset(by+lw,bz+lx,ll or lh)
end
lo-=lt
lp+=lr
end
lu+=lr
lv+=lt
end
end
function dl(ly,lz,ma,mb)
return abs(sqrt(((ly-ma)/1000)^2+((lz-mb)/1000)^2)*1000)
end
mc=3.14159
md=.5*(mc/180)
function ig(hh,me)
gf=me-hh.ea
if gf>0.5 then
gf-=1
elseif gf<-0.5 then
gf+=1
end
if gf>md then
hh.ea+=md
elseif gf<-md then
hh.ea-=md
else
hh.ea=me
end
if(hh.ea>mc) hh.ea-=2*mc
if(hh.ea<-mc) hh.ea+=2*mc
yield()
end
function ir(mf,it,mg)
local mh=fget(fw(it.by,it.bz),1) and 4 or 1
if(mf.by!=it.by and mf.bz!=it.bz) return mh+1
return mh
end
function is(it,mg)
local mi={}
for ds=-1,1 do
for dt=-1,1 do
if(ds!=0 or dt!=0) mj(it.by+ds,it.bz+dt,mi)
end
end return mi
end
function mj(mk,ml,mm)
if(
not fget(fw(mk,ml),0)
and bd[mk..","..ml]==nil
and mk>=0
and ml>=0
and mk<=63
and ml<=63
)
then
add(mm,{by=mk,bz=ml})
end
end
function iq(ie,mn)
return abs(ie.by-mn.by)+abs(ie.bz-mn.bz)
end
function ip
(mo,
mp,
mq,
mr,
mi,
ms,
mg)
local mt,
mu={
mv=mo,
mw=0,
mx=mq(mo,mp,mg)
},{}
mu[ms(mo,mg)]=mt
local my,mz,na,nb={mt},1,ms(mp,mg),32767.99
local count=0
while mz>0 do
local cost,nc=nb
for cv=1,mz do
local nd=my[cv].mw+my[cv].mx
if(nd<=cost) nc,cost=cv,nd
end
mt=my[nc]
my[nc],mt.ne=my[mz],true
mz-=1
local nf=mt.mv
if ms(nf,mg)==na then
nf={mp}
while mt.ng do
mt=mu[ms(mt.ng,mg)]
add(nf,mt.mv)
end
return nf
end
for nh in all(mi(nf,mg)) do
local id=ms(nh,mg)
local ni,nj=
mu[id],
mt.mw+mr(nf,nh,mg)
if not ni then
ni={
mv=nh,
mw=nb,
mx=mq(nh,mp,mg)
}
mz+=1
my[mz],mu[id]=ni,ni
end
if not ni.ne and ni.mw>nj then
ni.mw,ni.ng=nj,nf
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
nk={}
function fn(by,bz,ea,ei,ej,nl,nm,ch,nn,kn)
local nf={
by=by,bz=bz,ea=ea,ei=ei,ej=ej,nl=nl,
ch=0,nm=nm or 0.0625,
nn=nn or{7,6,5},kn=kn or 0,
no=bz,np=ch or 8
}
add(nk,nf)
end
function hp()
for gd,nf in pairs(nk) do
nf.ej+=nf.nm
nf.by+=nf.ei
nf.bz+=nf.ej
nf.ea+=nf.nl
nf.ch+=1
if(nf.ch>=nf.np) del(nk,nf)
end
end
function ja()
for gd,nf in pairs(nk) do
local fk=flr((#nf.nn/nf.np)*nf.ch)+1
if(nf.kn) fillp(nf.kn)
circfill(nf.by,nf.bz,nf.ea,nf.nn[fk])
fillp()
end
end
__gfx__
bbbbbbbbbbb1bbbbffffffff99f99999ffffffffffffffff9f99f9f9ff9f9999ff9ffffff5d555d555d555d55d555d5fffffffff1d5155555d555d5fdddddddd
bb11bbbbbb171bbbffff9fff9f9999f9fff9fffffffffffff99f99f999f99899ffff9fff1555515d15555155d51555515dfffd5f5155d55dd5155551d5555555
bb171bbbb1bbb1bbffff999999ff99999999ffffffffffff9f99f99f9f9989f99ff9ff9f5d55d5515d55d555155d55d5d5155551555d5155155d55d5d5015515
bb1771bb17b1b71bfff99f9f99999f99f9f99ffff9ffff9f999f999999f88899ff999fff55515d5555515d5d55d51555155d55d5d5555d5555d51555d5105555
bb17771bb1bbb1bbfffff9f9fff999999f9fffffff99f999f9ffff9f99998f99ff999fffd55d5555d55555555555d55d55d5155555d155d55555d55dd5555111
bb177771bb171bbbffff999999999f999999ffff999f99f9fffffffffff89999f9f9fff955d551d555d515555d155d555555d55d155555555d155d55d1555101
bb17711bbbb1bbbbfff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99ff9fffff1555555515555515555555515d155d55f51ffd5f55555551d5555111
bbb11bbbbbbbbbbbffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9ffff9ffff55d5515555d55555155d55f55555551ffffffff5155d55fd5515555
ddddddddb7bbbb7bffffffffbb888b8bfff9ffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
d555555577bbbb77fff77fffb8899898ff66669ff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
d5555555bbbbbbbbff79ff7f8999998bf66dd66ff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
d5555555bbbbbbbbf79f779f889aa988f6d55d6ff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
d5555555bbbbbbbbfff799ffb89aa998f6d55d6ff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
d5555555bbbbbbbbff799fff899aa98bf66dd66ff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
d555555577bbbb77ff79ffff88999988ff6666fff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
d5555555b7bbbb7bf7ffffffb88898bbf9ffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000bbbbbbbb
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bbbbbbbbb
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbbbbbbbbb
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb0000b000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb07700077
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00777770
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb07700077
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb0000b000
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffbbbbbbbbbbbbbbbbbbbbbbbbb6bbb6bbb6bbb6bbffffffff
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbb0eee0bbffffffffffffffffbbbbbbbbbbbbbbbbbbbbbbbbb8bbb8bbb8bbb8bbffffffff
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbb0d6d0bbfd5ff5ffffffffffbbbbbbbbbbbddbbbb1b11b1bb2bbb2bbb2bbb2bbffffffff
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbbbc7cbbbf5dfffffffffffffbbbbbbbbbbd66dbbbdd66ddbb0bbb0bb0b0b0b0bffffffff
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbb0c7c0bbffff555fffffffff77bbb77bbbd66dbbb651156bbbb6bbbbbbb6bbbbffffffff
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbb0ccc0bbffff5d5fffffffffb7777711bbbddbbbb7b55b7bbbb8bbbbbbb8bbbbffffffff
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbb6b6bbbffff555fffffffff7711177bbbb67bbbbbb67bbbbbb2bbbbbbb2bbbbffffffff
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffb11bbb11bbb67bbbbbb67bbbbbb0bbbbbb0b0bbbffffffff
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddddd6666dddddddddddddddddddddddddddddddddddddddddd19999999999999955555555
76665555551ffff1d576db65d5577655d5555555d5766665d5555555d566777655555555d555555555555555d766777755555555d494955949999249577777d5
76665c05555f4441d76dbbb5d576db65d5556555d5766665d5bbbbb5d767666d65555555d554777777777455d7ddfff755555555d194255999229999576666d5
177dee055d5ffff1d66d11b5d76dbbb5d5576655d5677725d5555555d767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419576666d5
d1d55505555f1011d66d01b5d66d11b5d55d7d55d566dd25d55aaa55d766ddd665555555d504777778617405d4447ff7265557f6d195656565999959576666d5
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d676666625555555d544ff7ff6d1f445d4047777655777fdd499955555944959576666d5
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d5559555d667ddd225666655d504777771177405d44444442657ffffd19495c0559449595dddddd5
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5599955d66d11d2266c0765d544ff7fff7ff445d55544445557ff7fd4999ee05594495955555555
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd56d11d276ee06d6d504777777777405d76677775557ff7fd195594095999959dddddddd
d555555515555155d55576db65555555d5766665d5555555d5599955d55d11d5767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779d5ddddd5
d555555a5d55d555d5576dbbb555c055d5766665d5556555d5559555d5555555766d0d66d542222222222245d7777f77655444449999529925777777d55ddd55
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555d555555567666662d52c02c020200225d4447ff7265c04c09429444444776666d555d555
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55aaa55d5555555667dd722d5ee0ee022200225d404777765ee0ee09999242424766666d5551555
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d555555566d11d22d551011011111115d444444426550550944242424296666dd5511155
d544445a15555515d5556dd5d5555555d556dd55d555d555d5bbbbb5d555555556d11d25d555011011111155d555444455550550944242424294ddd2d5111115
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d555555555d11d55d555511111111555d555222255555555d555555555594425d1111111
dddd666666ddddddddd777c666666dddddddddddddddddddddddd666666666660000000000000000000000000000000000000000000000000000000000000000
d566ddddd61111106667deeddddd657667555555d557755555555ddddd4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5dddd000066dd666dd7dd0dd6666dddddd56765d566969666655ddddd4ddd5d0000000000000000000000000000000000000000000000000000000000000000
d5dd0000001111dd6dd7660dd6dd611111ddddd5d5ddadadddd55ddd5ddd5ddd0000000000000000000000000000000000000000000000000000000000000000
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5dd0000000000000000000000000000000000000000000000000000000000000000
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd440000000000000000000000000000000000000000000000000000000000000000
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5ddd0000000000000000000000000000000000000000000000000000000000000000
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5d0000000000000000000000000000000000000000000000000000000000000000
d555f655551d6d106d777777711110455542542575777777766767667d4d5ddd0000000000000000000000000000000000000000000000000000000000000000
d5516615551d6d106d7011111ddd6445555555557d7c0777767767767d4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d755555550000000000000000000000000000000000000000000000000000000000000000
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd765555550000000000000000000000000000000000000000000000000000000000000000
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d6755550000000000000000000000000000000000000000000000000000000000000000
d555550f050aaa000001d1111111105555555555ddddddd07777777776d755550000000000000000000000000000000000000000000000000000000000000000
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd77755550000000000000000000000000000000000000000000000000000000000000000
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd55550000000000000000000000000000000000000000000000000000000000000000
ccccccccccccc0cccccccccccccccccccccccccccccccccc9ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc79999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
ccccccccccccccdccccc67111dcccccc11116666dc0157d799999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
9accc5acccccc55cccc6660dd1dccccc6d1d111166665757777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
575c544aaaccccccccd6650001dccc7776d76d1c1111111066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
5d75144444aaaccc9dddd055d1d996666d1dd11cc56505556666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
9511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6ddddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
9001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7ddddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
50d019999999151501755000001d55556d1d4d9949945499dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
501015aaaaaaa44450155ddddddd66996d19999999666666dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
4500545aa744444566666666666666669999999966776767dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
544454444444544466666666555555554999996777777776dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
4554444544544454555555559999f99999446776677676985555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
54445544554545449f9999f9999999f9997777777767988755555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
455454554555544599fffffff9f99999477777667798897755555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
ffffffffffffffffffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc60ccc06cccccccccccccccccccccccccccc
ffffffffffffffffffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999cccc77cccccc515cc8115cccccc8787ccccccccccccccccc
ffffffffffffffffffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cc77577cccc51cccc00015cccc755567cccccccccccccccc
ffffffffffffffffffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fcc5775d60051ccccc808d15006d85866cccccccccccccccc
ff77777777ffffffff77757777ffffffccc7776666766666c77d677cccc76777977ff55555555447ccc5566dd106ccccc000d601dd6555ddccc5f7cccccccccc
ff766666666fffffff766657666fffff7776666666766666c77d6c7cc66677777ff2211757575444ccc7666666666cccc8086666666858dd9cc65c6f6ccccccc
ff7666666666ffffff5555565555ffff6676666666766666c77d6c7cccc77766ff22115353535554ccc0000000000ccccccc00000000001149cffcf80ccccccc
f766666666666ffff777777577777fff6676666666766666c7d66c7ccc777655ff77555555555555ccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0f6cd0cccc
f7666666666666fff7666665766666ff6676666666766666c7c651cc777765007722115555555577ccdd66ddddddd5ccccc5ddddddd66ddc4443ff005c01cccc
f76666666666666ff76666665766666f6676666666766666fd87151fffffffff422215577755576fccddd66dd555d5ccccc5d555dd66dddc22450f605d0ffff9
f55555555555555ff55555555555555f6676666666766666f668777fffffffff4221557fff7776ff9ccdd665555555c999c555555566ddcc42444665501ff9ff
ffffffffffffffffffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd999dd6666666d5999995d6666666dd9944446f600244ff99
fffffffffffffffffffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d999dd6666666d5999995d6666666dd99244355f332494fff
fffffffffffffffffffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff6999dd6677766d5999995d6677766dd9924335203504449f9
fffffffffffffffffffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f99ddd66dd566d5999995d665dd66ddd9446f2446f09999ff
ffffffffffffffffffffffffffffffffffffffffffffffddfffffffff666d222999995554444444799dd666dd5666d59995d6665dd666dd9443324430044499f
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffc7cccccccccccccccccccccccccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff54ccccccccccccccccccccccccccccc006ccccccc
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660ccccc2888887660cccc4ff54cccccccccccccc7ffc455550cccc7f000005550cc
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cccc288888887ccccccc54cccccff5ccccccc44ffff4ccccc4fffffffff4ccccc
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444ccccc5225222222287ccc45555cc4ffffcccc50005444544ccc45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cc55588888888855cc54fffffffffff5cc5000005ffff505c5016054ff501605c
916666d001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950400000000045995000005999400095061052995061059
f90500000444000999999900ff999999995555555555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999fffff9999f99999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeecccccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee6ccccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee76cccccccccccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee765cc77775cccccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee7756777780777ccc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee765d656520dd777c
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee775cdd5d1ccc775d
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeccc5ccc505ccd667
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeecc5ccccdcdccdddc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeec5ccccccccccc5cc
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee99dd999999999599
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9455d44444444549
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9444444449999999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee999999999999f999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9999999999998999
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee9999999999999999
__label__
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
000000000000000000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000000000000000000000000000000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007770777077707770777077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707000700070007070000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007070707077700770077077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707070000070007000700
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000007770777077707770777077700
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
0000000000000000000100000000fffffffffffffffffffffffffffffffffffffffffffffffffff66ffffffffffffffffff00000000000000000000000000000
0000000000000000000ff000000ff6fffffff6fffffff6ffffffffffffffffffffffffffffffff2277fffffffffffffff1000000000000000000000000000000
000000000000000000f1f1f1f1ffffffff6fffffff6fffffff6ffffffffffffffffffffffffff220877fffffffffffff1f000000000000000000000000000000
000000000000000001ffff1f1ffffffffffffffffffffffffffffffffffffffffffffffffffff6886d76fffffffffffff1000000000000000000000000000000
00000000000000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff578d786ffffffffffff1f000000000000000000000000000000
0000000000000001f1fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffff57d8d5fffffffffffff1000000000000000000000000000000
00000000000000ff1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5685fffffffffffffff000000000000000000000000000000
0000000000001f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55fffffffffffffffff00000000000000000000000000000
000100000000fffffffffffffffffffffffffffffffff6fff6ffddddddddddddddddfffffffffffffffffffffffffffffff00000000000000000000000000000
000ff000000ff6fffffff6fffffff6fffffff6fffffff8fff8ffd766777755555555fffffffffffffffffffffffffffff1000000000000000000000000000000
00f1f1f1f1ffffffff6fffffff6fffffff6fffffff6ff2fff2ffd7ddfff755555555ffffffffffffffffffffffffffff1f000000000000000000000000000000
01ffff1f1fffffffffffffffffffffffffffffffffff0f0f0f0fd7777f7765555777fffffffffffffffffffffffffffff1000000000000000000000000000000
0f1ffffffffffffffffffffffffffffffffffffffffffff6ffffd4447ff7265557f6ffffffffffffffffffffffffffff1f000000000000000000000000000000
f1fffffffffffff6fffffff6fffffff6fffffff6fffffff8ffffd4047777655777fdfffffffffffffffffffffffffffff1000000000000000000000000000000
1ffffffffffffffffffffffffffffffffffffffffffffff2ffffd44444442657ffffffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffff0f0fffd55544445557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd76677775557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
7ffffffffffffffffffff6fffffff6fffffff6ffffffffffffffd7ddfff755577777fffffffffffffffffffffffffffff1000000000000000000000000000000
ff7fffffffffffffffffffffff6fffffff6fffffff6fffffffffd7777f7765544444ffffffffffffffffffffffffffff1f000000000000000000000000000000
779fffffffffffffffffffffffffffffffffffffffffffffffffd4447ff726580480fffffffffffffffffffffffffffff1000000000000000000000000000000
99ffffffffffffffffffffffffffffffffffffffffffffffffffd404777765220220ffffffffffffffffffffffffffff1f000000000000000000000000000000
9ffffffffffffffffffffff6fffffff6fffffff6ffffffffffffd444444426550550fffffffffffffffffffffffffffff1000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555444455550550ffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555222255555555fffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffd199999999999999ddd776ddddddddddffffffffffffffffffffffffffffffff0000000000000000000000001000
ffffffffffff0288220ff6ffffffffffffffd494955949999249d576d165d5577655ffffffffffffffffffffffffffff9ffff000000f90000009900000099000
ffffffffffff8d66d82fffffff6fffffffffd194255999229999d76d1115d576d165ffffffffffffffffffffffffffff9999f1f1f1ff91f1919991f191991900
ffffffffffffd7776660ffffffffffffffffd495f5f4f4121419d66d1115d76d1115fffffffffffffffffffffffffff99f9ff91f1f9f99191f9999191f999900
ffffffffffffd7776660ffffffffffffffffd195656565999959d66d0115d66d1115fffffffffffffffffffffffffffff9f9ff99f999fff99999fff99999f1f0
ffffffffffff8d66d825fff6ffffffffffffd499955555944959d66d0155d66d0115ffffffffffffffffffffffffffff9999999f99f999999f9999999f999919
ffffffffffff0288220fffffffffffffffffd194958055944959d56dd555d66d0155fffffffffffffffffffffffffff99f9f9f99f99f99fff9f999fff9f999f1
ffffffffffff5555555fffffffffffffffffd499922055944959d5555555d56dd555ffffffffffffffffffffffffffff99f9f99f99f9ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffffffffffd195594095999959ddddd776ddddddddffffffffffffffffffffffff99f9999999f99999ff9f999999f9999999f9
ffffffffffffffffffffffffffffffffffffd495594495977779d55576d165555555ffffffffffff9fffffffffff9f9999f99f9999f999f998999f9999f99f99
ffffffffffffffffffffffffffffffffffff9999529925777777d5576d1115558055ffffffffffff9999ffffffff99ff999999ff99999f9989f999ff999999ff
ffffffffffffffffffffffffffffffffffff9429444444776666d5566d1115522055fffffffffff99f9ff9ffff9f99999f9999999f9999f8889999999f999999
ffffffffffffffffffffffffffffffffffff9999242424766666d5566d0115555055fffffffffffff9f9ff99f999fff99999fff9999999998f99fff99999fff9
ffffffffffffffffffffffffffffffffffff944242424296666dd5566d01d5555055ffffffffffff9999999f99f999999f9999999f99fff8999999999f999999
ffffffffffffffffffffffffffffffffffff944242424294ddd2d5556dd5d5555555fffffffffff99f9f9f99f99f99fff9f999fff9f999999f9999fff9f999ff
ffffffffffffffffffffffffffffffffffffd555555555594425d5555555d5555555ffffffffffff99f9f99f99f9ff9f9999ff9f999999fff9f9ff9f9999ff9f
ffffffffffffffffffffffffffffddddddddddd666dddddddddd5d555d5fffffffffffffffffffffffff9f99f9f999f9999999f9999999f9999999f9999999f9
ffffffffffffffffffffffffffffd5555555d5766665d5555555d5155551fffffffffffffffffffffffff99f99f99f9999f99f9999f99f9999f99f9999f99f99
ffffffffffffffffffffffffffffd5556555d5766665d5888885155d55d5ffffffffffffffffffffffff9f99f99f99ff999999ff999999ff999999ff999999ff
ffffffffffffffffffffffffffffd5576655d5677725d555555555d51555ffffffffffffffffffffffff999f999999999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd55d7d55d566dd25d55222555555d55dfffffffffffffffffffffffff9ffff9ffff99999fff99999fff99999fff99999fff9
ffffffffffffffffffffffffffffd55ddd55d566dd25d55555555d155d55ffffffffffffffffffffffffffffffff99999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd555d555d556dd55d555255555555551ffffffffffffffffffffffffffffffff99fff9f999fff9f999fff9f999fff9f999ff
ffffffffffffffffffffffffffffd5555555d5555555d55222555155d55fffffffffffffffffffffffffffffffffff9f9999ff9f9999ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffddd666ddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddd66666666666ffff
fffff6ffffffffffffffffffffffd5766665d5555555d5522255fffffffff002200fffffffffffffffffffffffffffffffffd557755555555ddddd4dddddffff
ffffffffff6fffffffffffffffffd5766665d5556555d5552555ffffffff288882d2ffffffffffffffffffffffffffff6f0fd566969666655ddddd4ddd5dffff
ffffffffffffffffffffffffffffd5677725d5576655d5555555ffffffff28888828fffffffffffffffffffffffffff8805fd5ddadadddd55ddd5ddd5dddffff
ffffffffffffffffffffffffffffd566dd25d55d7d55d5522255ffffffff28888828fffffffffffffffffffffffff0d888ff7777a7a711555ddddd55d5ddffff
fffffff6ffffffffffffffffffffd566dd25d55ddd55d5555555ffffffff288882d2fffffffffffffffffffffffff22685ff7d9d9d971155544d5555dd44ffff
ffffffffffffffffffffffffffffd556dd55d555d555d5888885ffffffff50022005fffffffffffffffffffffffff5820fff7da76767115767dddd5d5dddffff
ffffffffffffffffffffffffffffd5555555d5555555d5555555fffffffff555555fffffffffffffffffffffffffff500fff75776d675576667d5ddddd5dffff
ffffffffffffffffffffffffffff1d515555d66dddddddd6fffdfffffffffffffffffffffffffffffffff5d555d5fff55fff75777777766767667d4d5dddffff
fffffffffffff6ffffffffffffff5155d55d76665555551ffff1ffffffffffffffffffffffffffffffff1555515d5dfffd5f7d780777767767767d4dddddffff
ffffffffffffffffff6fffffffff555d515576665805555f4441ffffffffffffffffffffffffffffffff5d55d551d51555517d220dddd666d66d75555555ffff
ffffffffffffffffffffffffffffd5555d55177d22055d5ffff1ffffffffffffffffffffffffffffffff55515d55155d55d57ddd0d777d66d6dd76555555ffff
ffffffffffffffffffffffffffff55d155d5d1d55505555f1011ffffffffffffffffffffffffffffffffd55d555555d51555777757707dddddd77d675555ffff
fffffffffffffff6ffffffffffff155555556555550515df1001ffffffffffffffffffffffffffffffff55d551d55555d55dddddddd07777777776d75555ffff
fffffffffffffffffffffffffffff51ffd5fd6d6d55555551005ffffffffffffffffffffffffffffffff155555555d155d55d111d1d5ddddddddd7775555ffff
ffffffffffffffffffffffffffffffffffffd6d6d555d55d5555fffffffffffffffffffffffffffffffff55d551555555551d5555555d1d1d1d1dddd5555ffff
ffffffffffffffffffffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffffffffffff55d555d555d555d555d555d555d555d555d555d555d5
fffff6fffffff0088800ffffffffffffffffd5555555155551555dfffd5fffffffffffffffffffffffff15555155155551551555515515555155155551551555
ffffffffff6ff2808082ffffffffffffffffd555555a5d55d555d5155551ffffffffffffffffffffffff5d55d5555d55d5555d55d555555555555555d5555d55
fffffffffffff2262622ffffffffffffffffd5aaa99a55515d5d155d55d5ffffffffffffffffffffffff55515d5d55515d5d555155555555555551555d5d5551
fffffffffffff2868682ffffffffffffffffd5aaa55ad555555555d51555ffffffffffffffffffffffffd5555555d5555555d55555555544444444455555d555
fffffff6fffff0828280ffffffffffffffffd5a1199a55d515555555d55dffffffffffffffffffffffff55d5155555d5155555d55544444444444444455555d5
fffffffffffff0888880ffffffffffffffffd544445a155555155d155d55ffffffffffffffffffffffff15555515155555151555544444444444444445151555
fffffffffffff5288825ffffffffffffffffd5151515555d555555555551ffffffffffffffffffffffff555d5555555d5555555524444444444444444455555d
ffffffffffffff55555fffffffffdddd666666ddddddddddddddddd7778666666dddddddddddffffffff1d51555555d555d555dd2444444444444444444455d5
fffff6fffffff6ffffffffffffffd566ddddd6111110d55555556667d22ddddd657667555555ffffffff5155d55d155551551550244444444444444444441551
ffffffffff6fffffff6fffffffffd5dddd000066dd66d55555556dd7dd0dd6666dddddd56765ffffffff555d51555d55d5555d51044444444444444444445515
ffffffffffffffffffffffffffffd5dd0000001111ddd55555556dd7660dd6dd611111ddddd5ffffffffd5555d5555515d5d5551124444444444444444445150
ffffffffffffffffffffffffffffd50000000066dd10d55555556dd11666666d705501111115ffffffff55d151d5d5515155d551110222414142444141444400
fffffff6fffffff6ffffffffffffd555555555111110d55555556d7661111117705055421425ffffffff15151515551515155515151000121210441414141400
ffffffffffffffffffffffffffffd551f6155566dd66d55555556d55d5dd6661100555425425fffffffff000000f100000051000000510000001400000044000
ffffffffffffffffffffffffffffd550f605551111ddd55555556ddd6ddd7111102555425425ffffffff00000000000000000000000000000000000000001000
ffffffffffffffffffffffffffffd555f655551d6d10ffffffff6d7777777111104555425425fffffff000000000000000000000000000000000000000000000
1ffffffffffff6ffffffffffffffd5516615551d6d10ffffffff6d7011111ddd644555555555fffff10000000000000000000000000000000000000000000000
f1ffffffffffffffff6fffffffffd5505505551d6d10ffffffff6770d1d11ddd705555555555ffff1f0000000000000000000000000000000000000000000000
0f1fffffffffffffffffffffffffd5555555551d6d10ffffffffddd0d1d11677705555555555fffff10000000000000000000000000000000000000000000000
01ffffffffffffffffffffffffffd55555555510d010ffffffffddd0d1dd111115dddddd5555ffff1f0000000000222222222222222222222222222222222200
00f1fffffffffff6ffffffffffffd555550f050aaa00ffffffff0001d1111111105555555555fffff10000000000200777777770000000000000000000000200
000fffffffffffffffffffffffffd55f0f5555555555ffffffff00111ddd111115dddddd5555ffffff0000000000200700080070000000000000000000000200
0001ffffffffffffffffffffffffd555555555555555ffffffff011111111111105555555555fffffff000000000200700880070000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d555d555d5fffffff000000000200708000070000000000000000000000200
000000ffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d15555155fffff10000000000200700800070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d5515d55d555ffff1f0000000000200708080070000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55515d5555515d5dfffff10000000000200700000070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffffd55d5555d5555555ffff1f0000000000200777777770000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d555d51555fffff10000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff1555555515555515ffffff0000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515555d5555fffffff000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffffffffffffffffffff1d5155555d555d5ffffff1f100000000200000000000000000000000000000000200
000000fffffffffffffff688886ff6fffffff6ffffffffffffffffffffff5155d55dd5155551fff1ff0000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8fffffff6fffffff6fffffffffffffffff555d5155155d55d5ff1f000000000000200000000000000000000000000000000200
000000f1fffffffffffff2888d8fffffffffffffffffffffffffffffffffd5555d5555d51555f1f0000000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8ffffffffffffffffffff1f1fffff1f1ff55d151d55551d15dff00000000000000200000000000000000000000000000000200
000000f1fffffffffffff688886ffff6fffffff6ffffff1f1f1fff1f1f1f151515155d151d151f00000000000000200000000000000000000000000000000200
0000001ffffffffffffff555555ffffffffffffffffff000000ff000000ff000000f50000001f000000000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffff000000000000000000000000000000001000000000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000fffffffffffffffffffffffffffffff6fff100000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000f1fffffffffffffffffffffffffffffffff100000000000000000000000000000000000000000000000000200000000000000000000000110000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000171000000200
000000f1fffffffffffffffffffffffffffffff6f100000000000000000000000000000000000000000000000000200000000000000000000000177100000200
0000001fffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000200000000000000000000000177710000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000177771000200
00001f1ffffffffffffffffffffffffffffffffff1f1000000000000000000000000000000000000000000000000200000000000000000000000177110000200
000000ff1ffffffffffffffffffffffffffffff1ff00000000000000000000000000000000000000000000000000200000000000000000000000011000000200
00000001f1ffffffffffffffffffffffffffff1f0000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000000f1ffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000001fffff1f1fffff1f1fffff1f1ffff000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000000f1ff1f1f1fff1f1f1fff1f1f1f1f000000000000000000000000000000000000000000000000000000222222222222222222222222222222222200
00000000000ff000000ff000000ff000000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000202020202020000000200000000010101010101010101010101010000000000000101010000000001010101010101000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000163c4f4f0a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121200000032164f420a4b0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121600000000004f0a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001200000000003b440e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012121200001600004f0a0a0e0000121200650a0a00000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016003b010a00001244090c0a0a0a0000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016003c4f0a0a0c00120a0a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016164f470a10620c0c470a0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000120000164f0a0a100a0a0a0a0a0a17191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000003c4f3b4f3c490a3c4f3c1d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000004f0a0a4f00000d0d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000003600003500003c3b3b3c00000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000037000000000a0e0047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000360036000009171818190a0a0a490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003500350000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a4d0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000000000000000090a650a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400000647307b710a6730cb711093313631159331ab510145302b510565307b310b9330e6211092315b410044300b410064302b4106923096210b92310b210041300b110061300b110191304611069130bb11
01020000104230db53306532db532b953276532495323b53206531f4531c9531b6531895316b531564313b4312943104430f9430db330b63309b3308923066230492303b230162300b2300933002150094300615
00040000049132ff13069132cf13039132af23049230592327f230693326f330493325f430694325f430494328f430794329f430a94326f530595324f530795329f2321f432cf632ff7330610306103061030615
010400002b72418765187641876518764187551875418755187541874518744187451873418735187341872518724187251870418705187041870518704187051870418705187041870518704187051870418705
010800002e1402e1222e115181002e1402e1203314033120331103311233115181001810018100181001810000100001000010000100001000010000100001000010000100001000010000100001000010000100
010200002cd732cd732cd732cd732cd632cd632cd632cd632bd132bd532ad532ad1329d5329d4328d4327d4326d132594324d432293320d331e9031cd331a93319d0317d231592313d131191300d0300d0300d03
000200000fd130452011d33107301ad43157501fd531b76326d601d76332d70157732ed600b7632ad600975323d50057431cd400673316d200a72310d10027130ad15007030dd0009d0006d0003d0001d0001d00
0101000030e71189753fe000000000000000000d97118e75000000000000000000003097118e7500e0018e0116e0100e0113e0111e0100e010de010ce0100e0109e0107e0100e0105e0104e0100e0101e0100e01
0102000033b6131863006102f86316b61006101eb531c851006101885116b430061013b4311841006100d8410cb430061009b3307831006100582104b230061001b1100811006140061507b0007b0006b0105b01
010100003063030620306303c6203c6303c6100060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
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

