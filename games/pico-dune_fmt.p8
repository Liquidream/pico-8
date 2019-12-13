pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
a=true
b=false
cartdata("pn_undune2")
c=dget(0)
d=dget(1)
e=dget(2)
f=dget(3)
g={
shr(dget(6),16),
shr(500,16),
shr(dget(7),16),
}
i={}
j={}
k=t()
l={0,0}
m={0,0}
n=dget(20)
o=dget(21)
p=dget(22)
q=dget(23)
r,s=0,0
u,v=0,0
x,y=0,0
z=nil
ba=0
bb=false
bc=bb
bd=0
be={}
bf=0
count=0
bg={}
bh={}
bi={}
bj={}
bk={}
bl=0
bm={}
bm.factory_click=function(self)
bn=1
bo=self.bp.bq[1]
br(6,89,"⬆️",function(self)
bs=mid(1,bs-1,#z.bt)
bo=z.bt[bs]
if(bs<bn) bn-=1
end,10)
br(17,89,"⬇️",function(self)
bs=mid(1,bs+1,#z.bt)
bo=z.bt[bs]
if(bs>bn+2) bn=min(bn+1,#bu.bp.bt-2)
end,10)
br(32,88,"build",function(self)
bu=nil
bj={}
z.bv=bw
bw:func_onclick()
end)
br(96,88,"close",function(self)
bu=nil
end)
bu=self
end
bm.init_windtrap=function(self)
self.bx={
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
self.by=1
end
bm.init_refinery=function(self)
self.bx={11,10,9,9,9,9}
self.by=1
end
bm.draw_refinery=function(self)
pal()
palt(0,false)
pal(11,self.bz)
pal(10,self.bz)
pal(9,self.bz)
if self.ca then
pal(self.bx[self.by],self.cb)
else
pal(11,self.cb)
self.by=1
end
spr(self.obj_spr,self.cc,self.ce,self.w/8,self.h/8)
end
bm.draw_repair=function(self)
pal()
palt(0,false)
palt(11,true)
if(cf()) pal(7,z.cg==2 and 11 or 8)
spr(self.obj_spr,self.cc,self.ce)
pal()
end
bm.repair_click=function(self)
ch(ci,2)
end
function ch(self,cj)
self.ck=0
self.cl=self.cg
if(self.cm>0 and self.cl>0) self.cn=not self.cn
self.cg=cj
end
co=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
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
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cp()
cq=cr(co[80],109,-20,5,{},nil,bm.draw_repair,bm.repair_click)
cs=1
ct()
cu=0
cursor={
cc=0,
ce=0,
w=8,
h=8,
spr=0,
cv=function(self)
return{
cc=self.cc+(not cw and r or 0)+2,
ce=self.ce+(not cw and s or 0)+1,
w=1,
h=1
}
end,
cx=function(self)
spr((z and(z.type==1 and z.cy==1)) and 1 or self.obj_spr,
self.cc,self.ce,self.w/8,self.h/8)
end
}
cz()
r=44
s=20
music(7)
end
function cz()
for da=1,2 do
for db=0,31 do
for dc=0,127 do
local dd=nil
local de=mget(dc,db)
local df=fget(de)
if da==1 and de==1 then
dg=dc*8
dh=db*8
dd=co[1]
elseif da==2
and de!=16 then
for di in all(
co) do
if(di.obj_spr!=nil and di.obj_spr==de) dd=di break
end
end
if dd!=nil then
local dj,dk=dc,db
if(dj>63) dk+=31 dj-=64
dl(dd,dj*8,dk*8)
if dd.type==1
and dd.speed>0 then
mset(dc,db,48)
end
end
end
end
end
end
function dl(dd,cc,ce,cy,dm)
local dn=cr(dd,cc,ce,dd.type,nil,bm[dd.func_init],bm[dd.func_draw],bm[dd.func_update],nil)
dn.dp=cr(dd,109,0,3,dn,nil,nil,bm[dd.func_onclick])
dn.cm=dq and dd.hitpoint/2 or dd.hitpoint
dn.bq={}
for di in all(co) do
if(di.parent_id!=nil and di.parent_id==dn.id)
and(di.req_faction==nil
or(di.req_faction>0 and di.req_faction==d)
or(di.req_faction<0 and-d!=di.req_faction))
then
local bv=cr(di,109,0,4,dn,nil,nil,function(self)
if bu then
z=self
else
ch(self,1)
end
end)
add(dn.bq,bv)
dn.bv=dn.bq[1]
end
end
dn.cy=cy or(dr(cc,ce,dg,dh)<75 and 1 or 2)
if dn.cy==1 then
dn.ds=d
dn.cb=e
dn.bz=f
j[dn.id]=true
else
dn.ds=n
dn.cb=o
dn.bz=p
dn.dp.func_onclick=nil
end
local dt=flr(cc/8)
local du=flr(ce/8)
if dd.type==2 then
dn.dv=53
local dw=(dd.id==2 or dd.id==3)
for dx=0,dd.w-1 do
for dy=0,dd.h-1 do
dz(dt+dx,du+dy,dw and 16 or 95)
end
end
if(not dw) add(bi,dn)
if dn.id==6 and dn.bp==nil then
i[dn.cy]=dn
local ea,eb=ec(dn,(dn.cc+32)/8,(dn.ce+8)/8,ed)
local ee=dl(co[27],ea*8,eb*8,nil,dn)
end
end
if dd.type==1 then
dn.dv=54
if(dn.norotate!=1) dn.ef=flr(rnd(8))*.125
if dn.arms>0 then
dn.eg=function(self)
self.eh=4
self.ei=self.cc+4
self.ej=self.ce+4
self.ek=self.el.cc+self.el.w/2
self.em=self.el.ce+self.el.h/2
local en=self.ek-self.ei
local eo=self.em-self.ej
local ep=sqrt(en*en+eo*eo)
self.eq=(en/ep)*2
self.er=(eo/ep)*2
sfx(self.arms<100 and 60 or 58,3)
es(self)
end
if dn.id==15 or dn.id==16 then
dz(dt,du,95)
end
else
if(dn.id==27) dn.et=0 dn.eu=i[dn.cy]
end
add(bg,dn)
ev(dn)
end
es(dn)
return dn
end
function cr(ew,cc,ce,ex,bp,func_init,func_draw,func_onclick)
local ey=(ew.w or 1)*8
local ez=(ew.h or 1)*8
local fa={
fb=ew,
cc=cc,
ce=ce,
fc=1,
type=ex,
bp=bp,
func_onclick=func_onclick,
w=ey,
h=ez,
fd=ew.obj_spr,
fe=ew.w or 1,
ff=ew.h or 1,
cm=0,
fg=0,
cg=0,
fh=0,
fi=0,
fj=0,
fk=1,
cv=function(self)
return{
cc=self.cc,
ce=self.ce,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cx=func_draw or function(self)
if self.type<=2
and(self.cc+self.w<r
or self.cc>r+127
or self.ce+self.h<s
or self.ce>s+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.ds) pal(12,self.cb) pal(14,self.bz)
if self.bx then
pal(self.bx[self.by][1],
self.bx[self.by][2])
end
if self.ef then
if not self.fl or self.fl>.025 then
if(self.speed>0) fm(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cc,self.ce+1,.25-self.ef,1,self.trans_col,5)
fm(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cc,self.ce,.25-self.ef,1,self.trans_col,flr(self.fk)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.cc-1,self.ce-1,self.cc+16,self.ce+19,0)
local fn=self.type==4 and self or self.bp
local fo=fn.fb.hitpoint
local fp=self.cg==1 and 12 or(fn.cm<fo*.33 and 8 or fn.cm<fo*.66 and 10 or 11)
local fq=self.cg==1 and(15*fn.cm/100) or(15*fn.cm/fo)
if(fn.cm>0 and not bu) rectfill(self.cc,self.ce+17,self.cc+fq,self.ce+18,fp)
end
if self.type>2 then
spr(self.ico_spr,self.cc,self.ce,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.cc,self.ce,self.w/8,self.h/8)
end
end
if self.ei then
if(self.fire_type==1) then
circfill(self.ei,self.ej,0,rnd(2)<1 and 8 or 9)
else
fr(self.ei,self.ej,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.cm<self.fb.hitpoint*.33 then
if(rnd(10)<1) fr(self.cc+3.5,self.ce+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fj=0
if(b) fs(self)
end,
ft=function(self)
self.fk=max(self.fk-.4,1)
if self.fj>0 then
fu(5,true)
if(bf==0 or stat(24)>5) bf=1 music(0)
if(self.arms>0 and self.eh!=4) fv(self,self.fw)
end
if(self.type<=2 and self.cm<=0 and self.fl==nil) self.eh=5 self.fx=nil self.fl=(self.type==2 and 1 or .5) sfx(self.dv,3)
if self.fl then
self.fl-=.025
if self.fl<=0 then
if self.type==2 then
for dx=0,self.fb.w-1 do
for dy=0,self.fb.h-1 do
dz(self.cc/8+dx,self.ce/8+dy,15)
end
end
del(bi,self)
printh("self.hitby="..tostr(self.fw))
l[self.fw.cy]+=1
else
local fy,fz=flr(self.cc/8),flr(self.ce/8)
if(fz>31) fy+=64 fz-=32
if(ga(fy,fz)<9) dz(fy,fz,20)
if(self.speed==0) dz(fy,fz,15)
del(bg,self)
m[self.fw.cy]+=1
end
if(z==self) z=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gb(self.cc+rnd(self.w),self.ce+rnd(self.h))
end
end
if self.framecount!=nil then
self.fg+=1
if(self.fg>self.framecount) then
self.fg=0
if self.altframe
and self.eh==2 then
self.obj_spr=self.fd+(self.altframe-self.obj_spr)
end
if self.bx then
self.by+=1
if(self.by>#self.bx) self.by=1
end
end
end
if self.ei then
self.ei+=self.eq
self.ej+=self.er
if dr(
self.ei,self.ej,
self.ek,self.em)<2
then
gb(self.ei,self.ej,self.fire_type)
if dr(
self.ei,self.ej,
self.el.cc+self.el.w/2,
self.el.ce+self.el.h/2)<4
then
self.el.cm-=self.arms
self.el.fj=self.fire_type
self.el.fw=self
end
self.ei=nil
end
end
if self.cg>0
and not self.cn
and not self.gc then
if self.cg==1 and self.fh>self.cost then
self.gc=true
sfx(56)
if self.fb.type==1
and self.fb.id!=15
and self.fb.id!=16 then
local ea,eb=ec(self,(self.bp.cc+8)/8,(self.bp.ce+16)/8,ed)
dl(self.fb,ea*8,eb*8,nil,self.bp)
gd(self)
end
elseif self.cg==2 and self.cm>self.fb.hitpoint then
self.cg=0
else
self.ck+=1
self.cm=(self.cg==1 and(self.fh/self.cost)*100 or self.cm+.5)
if(self.ck>(self.cg==1 and 3 or 100) and ge(-1,self.cg==1 and self.bp or self)) self.ck=0 self.fh+=1
end
end
end,
gf=function(self,cc,ce)
self.cc=cc
self.ce=ce
end,
gg=function(self)
return flr(self.cc/8)..","..flr(self.ce/8)
end
}
for gh,gi in pairs(ew) do
if fa[gh]==nil and gi!=""then
fa[gh]=gi
end
end
if(func_init) func_init(fa)
return fa
end
function ge(gj,fa)
if(gk(g[fa.cy])+gj<0) return false
g[fa.cy]+=sgn(gj)*shr(abs(gj),16)
if(fa.cy==1) sfx(63)
return true
end
function gb(cc,ce,gl)
fr(cc,ce,2,
0,0,.1,0,gl==1 and 5 or 30,{5,7,10,8,9,2},rnd(2)<1 and 0xa5a5.8 or 0)
end
function es(gm)
if(gm.cy!=1 and gm.eh!=4) return
local gn=gm.type==2 and 3 or 2
for dx=-gn,gn do
for dy=-gn,gn do
local go=flr(gm.cc/8)+dx
local gp=flr(gm.ce/8)+dy
gq[go][gp]=16
gr(go,gp)
for eo=-1,1 do
for en=-1,1 do
gr(go+en,gp+eo)
end
end
end
end
end
function _update60()
gs()
gt()
if(t()%1==0) gu()
if(t()%1==0 and t()%2==0) gv()
ba+=1
end
function _draw()
gw()
gx()
if(a) gy("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function ct()
gq={}
for da=-2,66 do
gq[da]={}
for gz=-2,66 do
gq[da][gz]=0
end
end
end
function ha()
local hb=flr(r/8)
local hc=flr(s/8)
for dx=hb-1,hb+16 do
for dy=hc-1,hc+16 do
if gq[dx][dy]!=0 and gq[dx][dy]!=16 then
palt(11,true)
spr(gq[dx][dy]+31,dx*8,dy*8)
elseif gq[dx][dy]<16 then
rectfill(dx*8,dy*8,dx*8+7,dy*8+7,0)
end
end
end
end
function gr(cc,ce)
if(cc<0 or cc>#gq or ce<0 or ce>#gq) return
local hd=0
if gq[cc][ce]!=0 then
if(gq[cc][ce-1]>0) hd+=1
if(gq[cc-1][ce]>0) hd+=2
if(gq[cc+1][ce]>0) hd+=4
if(gq[cc][ce+1]>0) hd+=8
gq[cc][ce]=1+hd
end
end
function gv()
be={}
if bb then
for da=0,124,4 do
for gz=0,124,4 do
local dc=da/2
local db=gz/2
if(db>=32) dc+=64 db-=32
local he=mget(dc,db)
local hf=(he*8)%128
local hg=(he*8)/16
local fp=sget(hf+4,hg)
if(gq[da/2][gz/2]==16) be[((da/2)/2)..","..((gz/2)/2)]=fp!=11 and fp or 15
end
end
end
bl=0
hh=0
hi=false
hj={0,0}
for hk,hl in pairs(bi) do
local go=flr(hl.cc/8)
local gp=flr(hl.ce/8)
if hl.cy==1 or(bb and gq[go][gp]==16) then
be[flr(hl.cc/2/8)..","..flr(hl.ce/2/8)]=hl.cb
end
if(hl.cy==1) then
bl-=hl.fb.power
if(hl.id==7) hi=true
if(sub(hl.name,1,5)=="sPICE") hh+=1000
end
hj[hl.cy]+=1
end
if bb then
for hk,hm in pairs(bg) do
local go=flr(hm.cc/8)
local gp=flr(hm.ce/8)
if hm.cy==1 or gq[go][gp]==16 then
be[flr(hm.cc/2/8)..","..flr(hm.ce/2/8)]=hm.cb
end
end
end
bb=(hi and bl>0)
fu(5,false)
bf=2
if(g[3]>0 and g[1]>g[3]) hn=1
if(hj[2]==0 and c>1) hn=2
if(hj[1]==0) hn=3
if hn then
dset(14,hn)
dset(13,t()-k)
dset(10,gk(g[1]))
dset(24,gk(g[2]))
dset(11,m[1])
dset(25,m[2])
dset(12,l[1])
dset(26,l[2])
gy("mission "..(hn<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gu()
bh={}
for gh,hm in pairs(bg) do
bh[flr(hm.cc/8)..","..flr(hm.ce/8)]=gh
end
end
function gs()
ho=stat(32)
hp=stat(33)
hq=stat(34)
hr=(hq==1 and hs!=hq) or btnp(4)
ht=(hq>0) or btn(4)
hu=(hq==2 and hs!=hq) or btnp(5)
for gh=0,1 do
if(btn(gh)) x+=gh*2-1
if(btn(gh+2)) y+=gh*2-1
end
u=mid(0,ho+x,127)
v=mid(0,hp+y,127)
cursor.cc=u
cursor.ce=v
if not bu then
if(u<4) r-=2
if(u>123) r+=2
if(v<4) s-=2
if(v>123) s+=2
r=mid(r,384)
s=mid(s,384)
for hk,hm in pairs(bg) do
if hm then
if hm.fx and costatus(hm.fx)!='dead'then
assert(coresume(hm.fx,hm))
else
hm.fx=nil
end
end
end
hv()
cu+=1
end
hw()
hs=hq
ci=z
bw=bo
end
function hx(cc,ce)
local fq=ga(cc,ce)
return fq>=2 and fq<=8
end
function ev(hm,hy)
hm.eh=hy or 0
hm.fx=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) ec(self,flr(self.cc/8),flr(self.ce/8),hz,self.range)
if self.id==27 then
if self.eh==0 or self.eh==7 or self.eh==9 then
if self.et<=1500
and self.eh!=7 and self.eh!=9 then
local hf,hg
local ia,ib=flr(self.cc/8),flr(self.ce/8)
if hx(ia,ib) and not self.ic then
hf,hg=ia,ib
else
ec(self,ia,ib,
function(hm,cc,ce)
if hx(cc,ce) and rnd(10)<1 then
hf,hg=cc,ce
return true
end
end,
10)
end
if hf and hg then
ie(hm,hf,hg)
if(hx(flr(hm.cc/8),flr(hm.ce/8))) hm.eh=6
end
elseif self.eh==9 then
if not self.eu.ig then
self.eu.ca=false
self.eu.ig=true
while self.et>0 do
self.eh=8
self.ef=.25
self.cc=self.eu.cc+16
self.ce=self.eu.ce+4
self.et-=1
if(z==self) z=nil
if(flr(self.et)%4==0 and tonum(ih)<hh) ge(2,self)
yield()
end
self.et=0
self.eu.ig=false
self.eh=0
end
end
elseif self.et>=1500
and self.eh!=7 then
self.eh=7
self.eu.ca=true
ie(self,(self.eu.cc+16)/8,self.eu.ce/8)
self.eh=9
elseif self.eh==6 then
self.ic=false
local ef=hm.ef+.75+rnd(.2)-.1
local ii,ij=sin(ef)*5.5,-cos(ef)*5.5
if(rnd(5)<1) fr(hm.cc+ii+3.5,hm.ce+ij+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bk[hm:gg()]=(bk[hm:gg()] or 10000)-1
self.et=(self.et or 0)+.5
if bk[hm:gg()]<=0 then
local dt=flr(self.cc/8)
local du=flr(self.ce/8)
for dy=-1,1 do
for dx=-1,1 do
fq=ga(dt+dx,du+dy)
dz(dt+dx,du+dy,
(dx==0 and dy==0) and 0 or((fq>1 and fq<8) and 8 or fq)
)
end
end
self.eh=0
end
if self.et%300==0 then
self.ic=true
self.eh=0
end
end
end
yield()
end
end)
end
function fv(hm,el)
hm.eh=3
hm.el=el
hm.fx=cocreate(function(self)
while el.cm>0 do
local ik=dr(hm.cc,hm.ce,el.cc,el.ce)
if ik>hm.range*5
and hm.speed>0 then
ie(hm,flr(el.cc/8),flr(el.ce/8),hm.range*5)
end
if not hm.norotate then
local il=atan2(hm.cc-el.cc,hm.ce-el.ce)
while(hm.ef!=il) do
im(hm,il)
end
end
if(ik<=hm.range*5) then
hm.fi-=1
if(hm.fi<=0 and not hm.ei) hm.eg(hm) hm.fi=hm.arms*2
elseif hm.speed==0 then
ev(hm)
end
yield()
end
ev(self)
end)
end
function ec(hm,cc,ce,io,ip)
for dr=1,ip or 64 do
for dx=cc-dr,cc+dr do
for dy=ce-dr,ce+dr do
if((dx==cc-dr or dx==cc+dr or dy==ce-dr or dy==ce+dr) and(io(hm,dx,dy))) return dx,dy
end
end
yield()
end
end
function ga(dc,db)
if(db>31) dc+=64 db-=32
return mget(dc,db)
end
function dz(dc,db,iq)
if(db>31) dc+=64 db-=32
mset(dc,db,iq)
end
function ed(hm,cc,ce)
return not fget(ga(cc,ce),0)
and bh[cc..","..ce]==nil
end
function hz(hm,cc,ce)
local el=bg[bh[cc..","..ce]]
if(el!=ir and el.cy!=hm.cy and gq[cc][ce]==16) fv(hm,el) return true
end
function ie(hm,cc,ce,is)
::restart_move_unit::
hm.it="init"
if not ed(nil,cc,ce) then
cc,ce=ec(hm,cc,ce,ed)
end
hm.ia=cc
hm.ib=ce
hm.iu=hm.eh
hm.eh=1
hm.it=iv(
{cc=flr(hm.cc/8),ce=flr(hm.ce/8)},
{cc=hm.ia,ce=hm.ib},
iw,
ix,
iy,
function(iz) return shl(iz.ce,8)+iz.cc end,
nil)
hm.iu=hm.eh
hm.eh=2
hm.eh=2
if hm.it!=nil then
for da=#hm.it-1,1,-1 do
local iz=hm.it[da]
if not hm.norotate then
local en=hm.cc-(iz.cc*8)
local eo=hm.ce-(iz.ce*8)
local il=atan2(en,eo)
while(hm.ef!=il) do
im(hm,il)
end
end
if(not ed(nil,iz.cc,iz.ce)) goto restart_move_unit
local ja=hm.speed or .5
local jb=sqrt((iz.cc*8-hm.cc)^2+(iz.ce*8-hm.ce)^2)
local jc=ja*(iz.cc*8-hm.cc)/jb
local jd=ja*(iz.ce*8-hm.ce)/jb
for da=0,jb/ja-1 do
bh[iz.cc..","..iz.ce]=hm
hm.cc+=jc
hm.ce+=jd
yield()
end
hm.cc,hm.ce=iz.cc*8,iz.ce*8
bh[iz.cc..","..iz.ce]=hm
es(hm)
if(dr(hm.cc,hm.ce,hm.ia*8,hm.ib*8)<=(is or 0)) break
end
end
hm.eh=0
end
function gt()
if(t()>q and t()%q*2==0) then
local je=bg[flr(rnd(#bg))+1]
if je.cy==2 and je.arms>0 and je.eh==0 then
local jf=(rnd(2)<1) and bg[flr(rnd(#bg))+1] or bi[flr(rnd(#bi))+1]
if jf and jf.cy==1 then
printh(">>> attack!")
fv(je,jf)
end
end
end
end
function gw()
cls"15"
camera(r,s)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hk,hl in pairs(bi) do
if not bu then
hl:ft()
if(hl.bv) hl.bv:ft()
end
hl:cx()
if(hl==z) then
rect(z.cc,z.ce,
z.cc+z.w-1,z.ce+z.h-1,
7)
end
end
palt(11,true)
for hk,hm in pairs(bg) do
if(not bu) hm:ft()
hm:cx()
if(hm==z) then
palt(11,true)
spr(17,z.cc,z.ce)
end
end
jg()
ha()
end
function jh()
local gn=31
local cc,ce=93,93
rectfill(cc-1,ce-1,cc+gn+1,ce+gn+1,f)
rectfill(cc,ce,cc+gn,ce+gn,0)
if bb!=bc then
bd=bb and 1 or 59
ji=bb and 1 or-1
sfx(55)
gv()
end
bc=bb
if bd>0 and bd<60 then
bd+=ji
clip(
max(cc+(gn/2)-bd,cc),
max(ce+(gn/2)-(bd>20 and bd-20 or 0),ce),
min(bd*2,gn),
min((bd>20 and bd-20 or 1)*2,gn))
for da=1,300 do
pset(cc+rnd(gn),ce+rnd(gn),5+rnd(3))
end
clip()
return
end
for dx=0,gn do
for dy=0,gn do
if(be[dx..","..dy]) pset(cc+dx,ce+dy,be[dx..","..dy])
end
end
local ii=cc+r/16
local ij=ce+s/16
rect(ii,ij,ii+7,ij+7,7)
end
function gx()
camera(0,0)
pal()
palt(0,false)
if z and z.dp then
z.dp:gf(109,20)
z.dp:cx()
if z.bv and z.cy==1 then
z.bv:gf(109,44)
z.bv:cx()
end
if z.cm<z.fb.hitpoint
and z.cy==1
and z.id!=4
and(z.type==2
or z.id==15
or z.id==16) then
cq:gf(117,28)
cq:cx()
end
end
ih=gk(g[1])
gy(sub("000000",#ih+1)..ih,103,2,7)
if z
and z.bv
and(z.bv.fb.type==2
or z.bv.fb.id==15
or z.bv.fb.id==16)
and z.bv.cm>=100 then
local jj=flr((cursor.cc+r)/8)
local jk=flr((cursor.ce+s)/8)
local jl=jj*8-r
local jm=jk*8-s
jn=false
jo=false
dq=false
local w=z.bv.fb.w
local h=z.bv.fb.h
for dx=-1,w do
for dy=-1,h do
if dx==-1 or dx==w or dy==-1 or dy==h then
if(ga(jj+dx,jk+dy)==16 or ga(jj+dx,jk+dy)>=63) jn=true
else
local fq=ga(jj+dx,jk+dy)
if(fq>=9 and fq<=15) dq=true
if(bh[jj+dx..","..jk+dy] or fq==0 or fq<8 or fq>16) jo=true
end
end
end
if(jo) jn=false
fillp("0b1110110110110111.1")
rectfill(jl,jm,
jl+z.bv.w,jm+z.bv.h,jn and 11 or 8)
fillp()
end
jh()
if bu then
jp(121,73,f,e)
if z.bq then
z.bt={}
rectfill(6,30,27,97,0)
local jq=1
for da=1,#z.bq do
local jr=z.bq[da]
if jr.req_id==nil
or j[jr.req_id] then
z.bt[jq]=jr
if jq>=bn and jq<=bn+2 then
jr:gf(9,32+((jq-bn)*19))
jr:cx()
else
jr:gf(-16,16)
end
if(bo==jr) then
bs=jq
rect(jr.cc-2,jr.ce-2,
jr.cc+17,jr.ce+17,
7)
print(bo.name,30,31,7)
print("cOST:"..bo.cost,85,38,9)
js=0
local jt=ju(bo.description,23)
for gz in all(jt) do
print(gz,30,44+js,6)
js+=6
end
end
jq+=1
end
end
end
for hk,jv in pairs(bj) do
jv:cx()
end
end
palt(11,true)
cursor:cx()
end
function jp(w,h,jw,jx)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-w/2,64-h/2,64+w/2,64+h/2,jw)
rect(64-w/2+1,64-h/2+1,64+w/2-1,64+h/2-1,jx)
end
function br(cc,ce,jy,func_onclick,ey)
local fa={
cc=cc,
ce=ce,
w=ey or#jy*4+2,
h=8,
jy=jy,
cv=function(self)
return{
cc=self.cc,
ce=self.ce,
w=self.w,
h=self.h
}
end,
cx=function(self)
if(#jy>1) rectfill(self.cc,self.ce,self.cc+self.w,self.ce+self.h,7)
if(#jy>1) rectfill(self.cc+1,self.ce+1,self.cc+self.w-1,self.ce+self.h-1,self.jz and 12 or 6)
print(self.jy,self.cc+2,self.ce+2,(#jy>1) and 0 or(self.jz and 12 or 7))
if(b) fs(self)
end,
func_onclick=func_onclick
}
add(bj,fa)
end
function ju(ka,kb)
local kc={}
local kd=""
local ke=""
local kf=""
local kg=function(kh)
if#ke+#kd>kh then
add(kc,kd)
kd=""
end
kd=kd..ke
ke=""
end
for da=1,#ka do
kf=sub(ka,da,da)
ke=ke..kf
if kf==" "
or#ke>kb-1 then
kg(kb)
elseif#ke>kb-1 then
ke=ke.."-"
kg(kb)
elseif kf==";"then
kd=kd..sub(ke,1,#ke-1)
ke=""
kg(0)
end
end
kg(kb)
if kd!=""then
add(kc,kd)
end
return kc
end
function hw()
ki=false
if z then
cw=true
if(ci.cm and ci.cm<ci.fb.hitpoint) kj(cq)
if(z.dp and not bu and not ki) kj(z.dp)
foreach(z.bq,kj)
foreach(bj,kj)
cw=false
end
if not bu
and not ki then
foreach(bg,kj)
foreach(bi,kj)
end
if ht
and not bu
and u>89 and u<122
and v>90 and v<123 then
r=mid(0,(u-94)*16,400)
s=mid(0,(v-94)*16,400)
elseif hr then
if ki then
if(not bu and z.func_onclick and z.bp!=nil) z:func_onclick() z=ci return
if(bu and bo.jy and bo.func_onclick) bo:func_onclick()
if(z.cy==1 and z.type==1 and z!=ci and z.speed>0) sfx(62)
if(z.cy==2 and ci and ci.type==1 and ci.cy==1) z.fk=10 fv(ci,z) z=nil
else
if z
and z.type==1
and z.cy==1
and z.speed>0
and(z.id!=27 or z.eh!=7) then
z.fx=cocreate(function(hm)
ie(hm,flr((r+u)/8),flr((s+v)/8))
ev(hm)
end)
end
if z
and z.bv
and z.bv.cm>=100
and jn then
local dt=flr((cursor.cc+r)/8)
local du=flr((cursor.ce+s)/8)
local dd=z.bv.fb
dl(dd,dt*8,du*8,1)
gd(z.bv)
sfx(61)
end
if(not bu) z=nil
end
elseif hu then
if(not bu) z=nil
end
end
function gd(fa)
fa.cm=0
fa.cg=0
fa.fh=0
fa.gc=false
end
function kj(fa)
fa.jz=kk(cursor,fa)
if hr and fa.jz then
if bu then
bo=fa
else
local dt=flr((cursor.cc+r)/8)
local du=flr((cursor.ce+s)/8)
if(fa.type<=2 and gq[dt][du]!=16) return
if(fa.id==27 and fa.eh==8) return
if fa.id==6 and z and z.id==27 and z.cy==1 then
z.eh=7
z.eu=fa
z.eu.ca=true
z.fx=cocreate(function(hm)
ie(hm,(fa.cc+16)/8,du)
ev(hm,9)
end)
return
else
z=fa
end
end
ki=true
end
end
function kl(self,km)
if(km==self.kn) return
local il=self.ko[km]
self.kp=il.cu
self.kn=km
self.kq=1
end
function kr(self)
self.kp-=1
if self.kp<=0 then
self.kq+=1
local il=self.ko[self.kn]
self.kp=il.cu
if self.kq>#il.ks then
self.kq=1
end
self.obj_spr=il.ks[self.kq]
end
end
function fu(kt,ku)
local kv=0x3100
local kw=1
kt*=4
local fq=peek(kv+kt+kw)
if((band(fq,128)>0)!=ku) fq=bxor(fq,128)
poke(kv+kt+kw,fq)
end
function gy(kx,ky,
kz,fp,
la)
for dx=-1,1 do
for dy=-1,1 do
print(kx,ky+dx,kz+dy,la)
end
end
print(kx,ky,kz,fp)
end
function kk(lb,lc)
local ld=lb:cv()
local le=lc:cv()
if ld.cc<le.cc+le.w and
ld.cc+ld.w>le.cc and
ld.ce<le.ce+le.h and
ld.ce+ld.h>le.ce
then
return true
else
return false
end
end
function fs(fa)
local lf=fa:cv()
rect(lf.cc,lf.ce,lf.cc+lf.w,lf.ce+lf.h,fa.jz and 11 or 8)
end
function cf()
return flr(t())%2==0
end
function cp()
lg=lh(co,"|","\n")
li={}
for da=2,#lg-1 do
lj={}
for lk=1,#lg[da] do
local fq=lg[da][lk]
if(lk!=2 and lk<24) fq=tonum(fq)
lj[lg[1][lk]]=fq
end
li[tonum(lg[da][1])]=lj
end
co=li
end
function gk(fq)
local ll=""
local gi=abs(fq)
repeat
ll=(gi%0x0.000a/0x.0001)..ll
gi/=10
until gi==0
if(fq<0) ll="-"..ll
return ll
end
function lh(kx,ep,lm)
local il={}
local ln=0
local ll=''
local lo=''
if lm~=nil then kx=lh(kx,lm) end
while#kx>0 do
if type(kx)=='table'then
ll=kx[1]
add(il,lh(ll,ep))
del(kx,ll)
else
ll=sub(kx,1,1)
kx=sub(kx,2)
if ll==ep then
add(il,lo)
lo=''
else
lo=lo..ll
end
end
end
add(il,lo)
return il
end
local lp=0
function fm(hf,hg,cc,ce,il,w,lq,lr)
local lt,lu=cos(il),sin(il)
local lv,lw,kv,lx
local ly,lz=lt,lu
local hd=shl(0xfff8,(w-1))
w*=4
lt*=w-0.5
lu*=w-0.5
local ma,mb=lu-lt+w,-lt-lu+w
w=2*w-1
for mc=0,w do
lv,lw=ma,mb
for md=0,w do
if band(bor(lv,lw),hd)==0 then
local ln=sget(hf+lv,hg+lw)
if(ln!=lq) pset(cc+mc,ce+md,lr or ln)
end
lv-=lz
lw+=ly
end
ma+=ly
mb+=lz
end
end
function dr(me,mf,mg,mh)
return abs(sqrt(((me-mg)/1000)^2+((mf-mh)/1000)^2)*1000)
end
mi=3.14159
mj=.5*(mi/180)
function im(hm,mk)
gj=mk-hm.ef
if gj>0.5 then
gj-=1
elseif gj<-0.5 then
gj+=1
end
if gj>mj then
hm.ef+=mj
elseif gj<-mj then
hm.ef-=mj
else
hm.ef=mk
end
if(hm.ef>mi) hm.ef-=2*mi
if(hm.ef<-mi) hm.ef+=2*mi
yield()
end
function ix(ml,iz,mm)
local mn=fget(ga(iz.cc,iz.ce),1) and 4 or 1
if(ml.cc!=iz.cc and ml.ce!=iz.ce) return mn+1
return mn
end
function iy(iz,mm)
local mo={}
for dx=-1,1 do
for dy=-1,1 do
if(dx!=0 or dy!=0) mp(iz.cc+dx,iz.ce+dy,mo)
end
end return mo
end
function mp(mq,mr,ms)
if(
not fget(ga(mq,mr),0)
and bh[mq..","..mr]==nil
and mq>=0
and mr>=0
and mq<=63
and mr<=63
)
then
add(ms,{cc=mq,ce=mr})
end
end
function iw(il,mt)
return abs(il.cc-mt.cc)+abs(il.ce-mt.ce)
end
function iv
(mu,
mv,
mw,
mx,
mo,
my,
mm)
local mz,
na={
nb=mu,
nc=0,
nd=mw(mu,mv,mm)
},{}
na[my(mu,mm)]=mz
local ne,nf,ng,nh={mz},1,my(mv,mm),32767.99
local count=0
while nf>0 do
local cost,ni=nh
for da=1,nf do
local nj=ne[da].nc+ne[da].nd
if(nj<=cost) ni,cost=da,nj
end
mz=ne[ni]
ne[ni],mz.nk=ne[nf],true
nf-=1
local nl=mz.nb
if my(nl,mm)==ng then
nl={mv}
while mz.nm do
mz=na[my(mz.nm,mm)]
add(nl,mz.nb)
end
return nl
end
for nn in all(mo(nl,mm)) do
local id=my(nn,mm)
local no,np=
na[id],
mz.nc+mx(nl,nn,mm)
if not no then
no={
nb=nn,
nc=nh,
nd=mw(nn,mv,mm)
}
nf+=1
ne[nf],na[id]=no,no
end
if not no.nk and no.nc>np then
no.nc,no.nm=np,nl
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
nq={}
function fr(cc,ce,ef,en,eo,nr,ns,cm,nt,kt)
local nl={
cc=cc,ce=ce,ef=ef,en=en,eo=eo,nr=nr,
cm=0,ns=ns or 0.0625,
nt=nt or{7,6,5},kt=kt or 0,
nu=ce,nv=cm or 8
}
add(nq,nl)
end
function hv()
for gh,nl in pairs(nq) do
nl.eo+=nl.ns
nl.cc+=nl.en
nl.ce+=nl.eo
nl.ef+=nl.nr
nl.cm+=1
if(nl.cm>=nl.nv) del(nq,nl)
end
end
function jg()
for gh,nl in pairs(nq) do
local fp=flr((#nl.nt/nl.nv)*nl.cm)+1
if(nl.kt) fillp(nl.kt)
circfill(nl.cc,nl.ce,nl.ef,nl.nt[fp])
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
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffbbbbbbbbbbbbbbbbbbbbbbbbb7bbb7bbb7bbb7bbffffffff
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbb0eee0bbffffffffffffffffbbbbbbbbbbbbbbbbbbbbbbbbbcbbbcbbbcbbbcbbffffffff
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbb0d6d0bbfd5ff5ffffffffffbbbbbbbbbbbddbbbb1b11b1bbebbbebbbebbbebbffffffff
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbbbc7cbbbf5dfffffffffffffbbbbbbbbbbd66dbbbdd66ddbb0bbb0bb0b0b0b0bffffffff
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbb0c7c0bbffff555fffffffff77bbb77bbbd66dbbb651156bbbb7bbbbbbb7bbbbffffffff
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbb0ccc0bbffff5d5fffffffffb7777711bbbddbbbb7b55b7bbbbcbbbbbbbcbbbbffffffff
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbb6b6bbbffff555fffffffff7711177bbbb67bbbbbb67bbbbbbebbbbbbbebbbbffffffff
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
0000000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212120000000016161616090a0c000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000160c0a0a0a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000000016090a0a0a0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121216000000003d090a0a0a0d3d0203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000090a0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212120000160000090a0a0e37001212000a0a0a00000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212003716000a010a00001209090c0a0a0a0000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001600090a0a0a0c00120a0a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120012001616090a0a0a0a0c0c0a0a0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016090a0a0a0a0a0a0a0a0a17191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000000d0a0a0d0a0a0a0a0d0a1d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000003d090a0a0e0000090d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0a0a0d00000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000009090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000000000000000a0a0e0000000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0a0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000000000009171818190a0a0a0a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000090a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a1d1e1b1b1b1c0a0a00000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a0a0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000000000000000090a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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

