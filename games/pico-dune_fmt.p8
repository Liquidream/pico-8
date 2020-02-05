pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
b=false
cartdata("pn_undune2")
c=dget"0"
d=dget"1"
e=dget"2"
f=dget"3"
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
n=dget"20"
o=dget"21"
p=dget"22"
q=dget"23"
r,s=0,0
u,v=0,0
x=nil
y=0
z=false
ba=z
bb=0
bc={}
bd=0
count=0
be={}
bf={}
bg={}
bh={}
bi={}
bj=0
bk={}
bk.factory_click=function(self)
bl=1
bm=self.bn.bo[1]
bp(6,89,"⬆️",function(self)
bq=mid(1,bq-1,#x.br)
bm=x.br[bq]
if(bq<bl) bl-=1
end,10)
bp(17,89,"⬇️",function(self)
bq=mid(1,bq+1,#x.br)
bm=x.br[bq]
if(bq>bl+2) bl=min(bl+1,#bs.bn.br-2)
end,10)
bp(32,88,"build",function(self)
bs=nil
bh={}
x.bt=bu
bu:func_onclick()
end)
bp(96,88,"close",function(self)
bs=nil
end)
bs=self
end
bk.init_windtrap=function(self)
self.bv={
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
self.bw=1
end
bk.init_refinery=function(self)
self.bv={11,10,8,8,8,8}
self.bw=1
end
bk.draw_refinery=function(self)
pal()
palt(0,false)
pal(11,self.bx)
pal(10,self.bx)
pal(8,self.bx)
if self.by then
pal(self.bv[self.bw],self.bz)
else
pal(11,self.bz)
self.bw=1
end
spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
bk.draw_repair=function(self)
pal()
palt(0,false)
palt(11,true)
if(cc()) pal(7,x.ce==2 and 11 or 8)
spr(self.obj_spr,self.ca,self.cb)
pal()
end
bk.repair_click=function(self)
cf(cg,2)
end
function cf(self,ch)
self.ci=0
self.cj=self.ce
if(self.ck>0 and self.cj>0) self.cl=not self.cl
self.ce=ch
end
cm=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|170||2|2|2|nil|nil|nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162||2|2|2|nil|1|1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160||2|1|1|nil|1|1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164||2|1|1|nil|1|7|4||50|0|0|200|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|172||2|2|2|nil|1|1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174||2|3|2|nil|1|2|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136||2|2|2|nil|1|2|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134||2|2|2|nil|1|6|2||150|5|0|600|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|108|168||2|2|2|nil|1|7|2||300|10|0|1200|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138||2|2|2|nil|1|7|2||400|10|0|1600|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20|0|1400|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20|0|800|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35|0|1600|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230||2|3|2|nil|1|12|5|99|700|20|0|800|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|77|232||1|1|1|11|1|7|5||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|93|234||1|1|1|11|1|7|6||250|20|112|1200|0|9|2||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT|58|228||2|3|3|nil|1|6|6||500|50|0|2000|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224||2|2|2|nil|1|12|5||500|40|0|1600|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE|55|226||2|3|3|nil|1|17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|62|236||1|1|1|11|9|9|2|-3|60||4|200|0.05|2|1|1|63|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|62|194||1|1|1|11|10|9|3|-1|100||8|440|0.1|3|1|1|63|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD|48|206||1|1|1|11|11||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL|61|238||1|1|1|11|13|13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
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
39|sANDWORM|94|||9|1|1|11|nil|nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|11|nil|nil|||||||||||||||draw_repair||repair_click]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cn()
co=cp(cm[80],109,-20,5,{},nil,bk.draw_repair,bk.repair_click)
cq=1
cr()
cs=0
cursor={
ca=0,
cb=0,
w=8,
h=8,
spr=0,
ct=function(self)
return{
ca=self.ca+(not cu and cv or 0)+2,
cb=self.cb+(not cu and cw or 0)+1,
w=1,
h=1
}
end,
cx=function(self)
spr((x and(x.type==1 and x.cy==1)) and 1 or self.obj_spr,
self.ca,self.cb,self.w/8,self.h/8)
end
}
cz()
music"7"
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
cv=dg-56
cw=dh-56
dd=cm[1]
elseif da==2
and de!=16 then
for di in all(
cm) do
if(di.obj_spr!=nil and di.obj_spr==de) dd=di break
end
end
if dd!=nil then
local dj,dk=dc,db
if(dj>63) dk+=31 dj-=64
dl(dd,dj*8,dk*8)
if dd.type==1
and dd.speed>0 then
mset(dc,db,0)
end
end
end
end
end
end
function dl(dd,ca,cb,cy,dm)
local dn=cp(dd,ca,cb,dd.type,nil,bk[dd.func_init],bk[dd.func_draw],bk[dd.func_update],nil)
dn.dp=cp(dd,109,0,3,dn,nil,nil,bk[dd.func_onclick])
dn.ck=dq and dd.hitpoint/2 or dd.hitpoint
dn.bo={}
for di in all(cm) do
if(di.parent_id!=nil and di.parent_id==dn.id)
and(di.req_faction==nil
or(di.req_faction>0 and di.req_faction==d)
or(di.req_faction<0 and-d!=di.req_faction))
then
local bt=cp(di,109,0,4,dn,nil,nil,function(self)
if bs then
x=self
else
cf(self,1)
end
end)
add(dn.bo,bt)
dn.bt=dn.bo[1]
end
end
dn.cy=cy or(dr(ca,cb,dg,dh)<75 and 1 or 2)
if dn.cy==1 then
dn.ds=d
dn.bz=e
dn.bx=f
j[dn.id]=true
else
dn.ds=n
dn.bz=o
dn.bx=p
dn.dp.func_onclick=nil
end
local dt=flr(ca/8)
local du=flr(cb/8)
if dd.type==2 then
dn.dv=53
local dw=(dd.id==2 or dd.id==3)
for dx=0,dd.w-1 do
for dy=0,dd.h-1 do
dz(dt+dx,du+dy,dw and 16 or 149)
end
end
if(not dw) add(bg,dn)
if dn.id==6 and dn.bn==nil then
i[dn.cy]=dn
local ea,eb=ec(dn,(dn.ca+32)/8,(dn.cb+8)/8,ed)
local ee=dl(cm[27],ea*8,eb*8,nil,dn)
end
end
if dd.type==1 then
dn.dv=54
if(dn.norotate!=1) dn.ef=flr(rnd"8")*.125
if dn.arms>0 then
dn.eg=function(self)
self.eh=4
self.ei=self.ca+4
self.ej=self.cb+4
self.ek=self.el.ca+self.el.w/2
self.em=self.el.cb+self.el.h/2
local en=self.ek-self.ei
local eo=self.em-self.ej
local ep=sqrt(en*en+eo*eo)
self.eq=(en/ep)*2
self.er=(eo/ep)*2
sfx(self.arms<100 and 60 or 58,3)
es(self)
end
if dn.id==15 or dn.id==16 then
dz(dt,du,149)
end
else
if(dn.id==27) dn.et=0 dn.eu=i[dn.cy]
end
add(be,dn)
ev(dn)
end
es(dn)
return dn
end
function cp(ew,ca,cb,ex,bn,func_init,func_draw,func_onclick)
local ey=(ew.w or 1)*8
local ez=(ew.h or 1)*8
local fa={
fb=ew,
ca=ca,
cb=cb,
fc=1,
type=ex,
bn=bn,
func_onclick=func_onclick,
w=ey,
h=ez,
fd=ew.obj_spr,
fe=ew.w or 1,
ff=ew.h or 1,
ck=0,
fg=0,
ce=0,
fh=0,
fi=0,
fj=0,
fk=1,
ct=function(self)
return{
ca=self.ca,
cb=self.cb,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cx=func_draw or function(self)
if self.type<=2
and(self.ca+self.w<cv
or self.ca>cv+127
or self.cb+self.h<cw
or self.cb>cw+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.ds and self.id!=18) pal(12,self.bz) pal(14,self.bx)
if self.bv then
pal(self.bv[self.bw][1],
self.bv[self.bw][2])
end
if self.ef then
if not self.fl or self.fl>.025 then
if(self.speed>0) fm(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb+1,.25-self.ef,1,self.trans_col,5)
fm(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb,.25-self.ef,1,self.trans_col,flr(self.fk)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.ca-1,self.cb-1,self.ca+16,self.cb+19,0)
local fn=self.type==4 and self or self.bn
local fo=fn.fb.hitpoint
local fp=self.ce==1 and 12 or(fn.ck<fo*.33 and 8 or fn.ck<fo*.66 and 10 or 11)
local fq=self.ce==1 and(15*fn.ck/100) or(15*fn.ck/fo)
if(fn.ck>0 and not bs) rectfill(self.ca,self.cb+17,self.ca+fq,self.cb+18,fp)
end
if self.type>2 then
spr(self.ico_spr,self.ca,self.cb,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
end
if self.ei then
if(self.fire_type==1) then
circfill(self.ei,self.ej,0,rnd"2"<1 and 8 or 9)
else
fr(self.ei,self.ej,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.ck<self.fb.hitpoint*.33 then
if(rnd"10"<1) fr(self.ca+3.5,self.cb+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fj=0
if(b) fs(self)
end,
ft=function(self)
self.fk=max(self.fk-.4,1)
if self.fj>0 then
fu(5,true)
if(bd==0 or stat(24)>5) bd=1 music"0"
if(self.arms>0 and self.eh!=4) fv(self,self.fw)
end
if(self.type<=2 and self.ck<=0 and self.fl==nil) self.eh=5 self.fx=nil self.fl=(self.type==2 and 1 or .5) sfx(self.dv,3)
if self.fl then
self.fl-=.025
if self.fl<=0 then
if self.type==2 then
for dx=0,self.fb.w-1 do
for dy=0,self.fb.h-1 do
dz(self.ca/8+dx,self.cb/8+dy,15)
end
end
del(bg,self)
printh("self.hitby="..tostr(self.fw))
l[self.fw.cy]+=1
else
local fy,fz=flr(self.ca/8),flr(self.cb/8)
if(fz>31) fy+=64 fz-=32
if(ga(fy,fz)<9) dz(fy,fz,20)
if(self.speed==0) dz(fy,fz,15)
del(be,self)
m[self.fw.cy]+=1
end
if(x==self) x=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gb(self.ca+rnd(self.w),self.cb+rnd(self.h))
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
if self.bv then
self.bw+=1
if(self.bw>#self.bv) self.bw=1
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
self.el.ca+self.el.w/2,
self.el.cb+self.el.h/2)<4
then
self.el.ck-=self.arms
self.el.fj=self.fire_type
self.el.fw=self
end
self.ei=nil
end
end
if self.ce>0
and not self.cl
and not self.gc then
if self.ce==1 and self.fh>self.cost then
self.gc=true
sfx"56"
if self.fb.type==1
and self.fb.id!=15
and self.fb.id!=16 then
local ea,eb=ec(self,(self.bn.ca+8)/8,(self.bn.cb+16)/8,ed)
dl(self.fb,ea*8,eb*8,nil,self.bn)
gd(self)
end
elseif self.ce==2 and self.ck>self.fb.hitpoint then
self.ce=0
else
self.ci+=1
self.ck=(self.ce==1 and(self.fh/self.cost)*100 or self.ck+.5)
if(self.ci>(self.ce==1 and 3 or 100) and ge(-1,self.ce==1 and self.bn or self)) self.ci=0 self.fh+=1
end
end
end,
gf=function(self,ca,cb)
self.ca=ca
self.cb=cb
end,
gg=function(self)
return flr(self.ca/8)..","..flr(self.cb/8)
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
if(fa.cy==1) sfx"63"
return true
end
function gb(ca,cb,gl)
fr(ca,cb,2,
0,0,.1,0,gl==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function es(gm)
if(gm.cy!=1 and gm.eh!=4) return
local gn=gm.type==2 and 3 or 2
for dx=-gn,gn do
for dy=-gn,gn do
local go=flr(gm.ca/8)+dx
local gp=flr(gm.cb/8)+dy
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
y+=1
end
function _draw()
gw()
gx()
if(a) gy("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cr()
gq={}
for da=-2,66 do
gq[da]={}
for gz=-2,66 do
gq[da][gz]=0
end
end
end
function ha()
local hb=flr(cv/8)
local hc=flr(cw/8)
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
function gr(ca,cb)
if(ca<0 or ca>#gq or cb<0 or cb>#gq) return
local hd=0
if gq[ca][cb]!=0 then
if(gq[ca][cb-1]>0) hd+=1
if(gq[ca-1][cb]>0) hd+=2
if(gq[ca+1][cb]>0) hd+=4
if(gq[ca][cb+1]>0) hd+=8
gq[ca][cb]=1+hd
end
end
function gv()
bc={}
if z then
for da=0,124,4 do
for gz=0,124,4 do
local dc=da/2
local db=gz/2
if(db>=32) dc+=64 db-=32
local he=mget(dc,db)
local hf=(he*8)%128
local hg=(he*8)/16
local fp=sget(hf+4,hg)
if(gq[da/2][gz/2]==16) bc[((da/2)/2)..","..((gz/2)/2)]=fp!=11 and fp or 15
end
end
end
bj=0
hh=0
hi=false
hj={0,0}
for hk,hl in pairs(bg) do
local go=flr(hl.ca/8)
local gp=flr(hl.cb/8)
if hl.cy==1 or(z and gq[go][gp]==16) then
bc[flr(hl.ca/2/8)..","..flr(hl.cb/2/8)]=hl.bz
end
if(hl.cy==1) then
bj-=hl.fb.power
if(hl.id==7) hi=true
if(sub(hl.name,1,5)=="sPICE") hh+=1000
end
hj[hl.cy]+=1
end
if z then
for hk,hm in pairs(be) do
local go=flr(hm.ca/8)
local gp=flr(hm.cb/8)
if hm.cy==1 or gq[go][gp]==16 then
bc[flr(hm.ca/2/8)..","..flr(hm.cb/2/8)]=hm.bz
end
end
end
z=(hi and bj>0)
fu(5,false)
bd=2
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
bf={}
for gh,hm in pairs(be) do
bf[flr(hm.ca/8)..","..flr(hm.cb/8)]=gh
end
end
function gs()
ho=stat"32"
hp=stat"33"
hq=stat"34"
hr=(hq==1 and hs!=hq) or btnp"4"
ht=(hq>0) or btn"4"
hu=(hq==2 and hs!=hq) or btnp"5"
for gh=0,1 do
if(btn(gh)) u+=gh*2-1
if(btn(gh+2)) v+=gh*2-1
end
r=mid(0,ho+u,127)
s=mid(0,hp+v,127)
cursor.ca=r
cursor.cb=s
if not bs then
if(r<4) cv-=2
if(r>123) cv+=2
if(s<4) cw-=2
if(s>123) cw+=2
cv=mid(cv,384)
cw=mid(cw,384)
for hk,hm in pairs(be) do
if hm then
if hm.fx and costatus(hm.fx)!='dead'then
assert(coresume(hm.fx,hm))
else
hm.fx=nil
end
end
end
hv()
cs+=1
end
hw()
hs=hq
cg=x
bu=bm
end
function hx(ca,cb)
local fq=ga(ca,cb)
return fq>=2 and fq<=8
end
function ev(hm,hy)
hm.eh=hy or 0
hm.fx=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) ec(self,flr(self.ca/8),flr(self.cb/8),hz,self.range)
if self.id==27 then
if self.eh==0 or self.eh==7 or self.eh==9 then
if self.et<=1500
and self.eh!=7 and self.eh!=9 then
local hf,hg
local ia,ib=flr(self.ca/8),flr(self.cb/8)
if hx(ia,ib) and not self.ic then
hf,hg=ia,ib
else
ec(self,ia,ib,
function(hm,ca,cb)
if hx(ca,cb) and rnd"10"<1 then
hf,hg=ca,cb
return true
end
end,
10)
end
if hf and hg then
ie(hm,hf,hg)
if(hx(flr(hm.ca/8),flr(hm.cb/8))) hm.eh=6
end
elseif self.eh==9 then
if not self.eu.ig then
self.eu.by=false
self.eu.ig=true
while self.et>0 do
self.eh=8
self.ef=.25
self.ca=self.eu.ca+16
self.cb=self.eu.cb+4
self.et-=1
if(x==self) x=nil
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
self.eu.by=true
ie(self,(self.eu.ca+16)/8,self.eu.cb/8)
self.eh=9
elseif self.eh==6 then
self.ic=false
local ef=hm.ef+.75+rnd".2"-.1
local ii,ij=sin(ef)*5.5,-cos(ef)*5.5
if(rnd"5"<1) fr(hm.ca+ii+3.5,hm.cb+ij+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bi[hm:gg()]=(bi[hm:gg()] or 10000)-1
self.et=(self.et or 0)+.5
if bi[hm:gg()]<=0 then
local dt=flr(self.ca/8)
local du=flr(self.cb/8)
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
while el.ck>0 do
local ik=dr(hm.ca,hm.cb,el.ca,el.cb)
if ik>hm.range*5
and hm.speed>0 then
ie(hm,flr(el.ca/8),flr(el.cb/8),hm.range*5)
end
if not hm.norotate then
local il=atan2(hm.ca-el.ca,hm.cb-el.cb)
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
function ec(hm,ca,cb,io,ip)
for dr=1,ip or 64 do
for dx=ca-dr,ca+dr do
for dy=cb-dr,cb+dr do
if((dx==ca-dr or dx==ca+dr or dy==cb-dr or dy==cb+dr) and(io(hm,dx,dy))) return dx,dy
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
function ed(hm,ca,cb)
return not fget(ga(ca,cb),0)
and bf[ca..","..cb]==nil
end
function hz(hm,ca,cb)
local el=be[bf[ca..","..cb]]
if(el!=ir and el.cy!=hm.cy and gq[ca][cb]==16) fv(hm,el) return true
end
function ie(hm,ca,cb,is)
::restart_move_unit::
hm.it="init"
if not ed(nil,ca,cb) then
ca,cb=ec(hm,ca,cb,ed)
end
hm.ia=ca
hm.ib=cb
hm.iu=hm.eh
hm.eh=1
hm.it=iv(
{ca=flr(hm.ca/8),cb=flr(hm.cb/8)},
{ca=hm.ia,cb=hm.ib},
iw,
ix,
iy,
function(iz) return shl(iz.cb,8)+iz.ca end,
nil)
hm.iu=hm.eh
hm.eh=2
hm.eh=2
if hm.it!=nil then
for da=#hm.it-1,1,-1 do
local iz=hm.it[da]
if not hm.norotate then
local en=hm.ca-(iz.ca*8)
local eo=hm.cb-(iz.cb*8)
local il=atan2(en,eo)
while(hm.ef!=il) do
im(hm,il)
end
end
if(not ed(nil,iz.ca,iz.cb)) goto restart_move_unit
local ja=hm.speed or .5
local jb=sqrt((iz.ca*8-hm.ca)^2+(iz.cb*8-hm.cb)^2)
local jc=ja*(iz.ca*8-hm.ca)/jb
local jd=ja*(iz.cb*8-hm.cb)/jb
for da=0,jb/ja-1 do
bf[iz.ca..","..iz.cb]=hm
hm.ca+=jc
hm.cb+=jd
yield()
end
hm.ca,hm.cb=iz.ca*8,iz.cb*8
bf[iz.ca..","..iz.cb]=hm
es(hm)
if(dr(hm.ca,hm.cb,hm.ia*8,hm.ib*8)<=(is or 0)) break
end
end
hm.eh=0
end
function gt()
if(t()>q and t()%q*2==0) then
local je=be[flr(rnd(#be))+1]
if je.cy==2 and je.arms>0 and je.eh==0 then
local jf=(rnd(2)<1) and be[flr(rnd(#be))+1] or bg[flr(rnd(#bg))+1]
if jf and jf.cy==1 then
printh(">>> attack!")
fv(je,jf)
end
end
end
end
function gw()
cls"15"
camera(cv,cw)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hk,hl in pairs(bg) do
if not bs then
hl:ft()
if(hl.bt) hl.bt:ft()
end
hl:cx()
if(hl==x) then
rect(x.ca,x.cb,
x.ca+x.w-1,x.cb+x.h-1,
7)
end
end
palt(11,true)
for hk,hm in pairs(be) do
if(not bs) hm:ft()
hm:cx()
if(hm==x) then
palt(11,true)
spr(17,x.ca,x.cb)
end
end
jg()
ha()
end
function jh()
local gn=31
local ca,cb=93,93
rectfill(ca-1,cb-1,ca+gn+1,cb+gn+1,f)
rectfill(ca,cb,ca+gn,cb+gn,0)
if z!=ba then
bb=z and 1 or 59
ji=z and 1 or-1
sfx(55)
gv()
end
ba=z
if bb>0 and bb<60 then
bb+=ji
clip(
max(ca+(gn/2)-bb,ca),
max(cb+(gn/2)-(bb>20 and bb-20 or 0),cb),
min(bb*2,gn),
min((bb>20 and bb-20 or 1)*2,gn))
for da=1,300 do
pset(ca+rnd(gn),cb+rnd(gn),5+rnd"3")
end
clip()
return
end
for dx=0,gn do
for dy=0,gn do
if(bc[dx..","..dy]) pset(ca+dx,cb+dy,bc[dx..","..dy])
end
end
local ii=ca+cv/16
local ij=cb+cw/16
rect(ii,ij,ii+7,ij+7,7)
end
function gx()
camera(0,0)
pal()
palt(0,false)
if x and x.dp then
x.dp:gf(109,20)
x.dp:cx()
if x.bt and x.cy==1 then
x.bt:gf(109,44)
x.bt:cx()
end
if x.ck<x.fb.hitpoint
and x.cy==1
and x.id!=4
and(x.type==2
or x.id==15
or x.id==16) then
co:gf(117,28)
co:cx()
end
end
ih=gk(g[1])
gy(sub("000000",#ih+1)..ih,103,2,7)
if x
and x.bt
and(x.bt.fb.type==2
or x.bt.fb.id==15
or x.bt.fb.id==16)
and x.bt.ck>=100 then
local jj=flr((cursor.ca+cv)/8)
local jk=flr((cursor.cb+cw)/8)
local jl=jj*8-cv
local jm=jk*8-cw
jn=false
jo=false
dq=false
local w=x.bt.fb.w
local h=x.bt.fb.h
for dx=-1,w do
for dy=-1,h do
if dx==-1 or dx==w or dy==-1 or dy==h then
if(ga(jj+dx,jk+dy)==16 or ga(jj+dx,jk+dy)>=63) jn=true
else
local fq=ga(jj+dx,jk+dy)
if(fq>=9 and fq<=15) dq=true
if(bf[jj+dx..","..jk+dy] or fq==0 or fq<8 or fq>16) jo=true
end
end
end
if(jo) jn=false
fillp("0b1110110110110111.1")
rectfill(jl,jm,
jl+x.bt.w,jm+x.bt.h,jn and 11 or 8)
fillp()
end
jh()
if bs then
jp(121,73,f,e)
if x.bo then
x.br={}
rectfill(6,30,27,97,0)
local jq=1
for da=1,#x.bo do
local jr=x.bo[da]
if jr.req_id==nil
or j[jr.req_id] then
x.br[jq]=jr
if jq>=bl and jq<=bl+2 then
jr:gf(9,32+((jq-bl)*19))
jr:cx()
else
jr:gf(-16,16)
end
if(bm==jr) then
bq=jq
rect(jr.ca-2,jr.cb-2,
jr.ca+17,jr.cb+17,
7)
print(bm.name,30,31,7)
print("cOST:"..bm.cost,85,38,9)
js=0
local jt=ju(bm.description,23)
for gz in all(jt) do
print(gz,30,44+js,6)
js+=6
end
end
jq+=1
end
end
end
for hk,jv in pairs(bh) do
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
function bp(ca,cb,jy,func_onclick,ey)
local fa={
ca=ca,
cb=cb,
w=ey or#jy*4+2,
h=8,
jy=jy,
ct=function(self)
return{
ca=self.ca,
cb=self.cb,
w=self.w,
h=self.h
}
end,
cx=function(self)
if(#jy>1) rectfill(self.ca,self.cb,self.ca+self.w,self.cb+self.h,7)
if(#jy>1) rectfill(self.ca+1,self.cb+1,self.ca+self.w-1,self.cb+self.h-1,self.jz and 12 or 6)
print(self.jy,self.ca+2,self.cb+2,(#jy>1) and 0 or(self.jz and 12 or 7))
if(b) fs(self)
end,
func_onclick=func_onclick
}
add(bh,fa)
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
if x then
cu=true
if(cg.ck and cg.ck<cg.fb.hitpoint) kj(co)
if(x.dp and not bs and not ki) kj(x.dp)
foreach(x.bo,kj)
foreach(bh,kj)
cu=false
end
if not bs
and not ki then
foreach(be,kj)
foreach(bg,kj)
end
if ht
and not bs
and r>89 and r<122
and s>90 and s<123 then
cv=mid(0,(r-94)*16,400)
cw=mid(0,(s-94)*16,400)
elseif hr then
if ki then
if(not bs and x.func_onclick and x.bn!=nil) x:func_onclick() x=cg return
if(bs and bm.jy and bm.func_onclick) bm:func_onclick()
if(x.cy==1 and x.type==1 and x!=cg and x.speed>0) sfx(62)
if(x.cy==2 and cg and cg.type==1 and cg.cy==1) x.fk=10 fv(cg,x) x=nil
else
if x
and x.type==1
and x.cy==1
and x.speed>0
and(x.id!=27 or x.eh!=7) then
x.fx=cocreate(function(hm)
ie(hm,flr((cv+r)/8),flr((cw+s)/8))
ev(hm)
end)
end
if x
and x.bt
and x.bt.ck>=100
and jn then
local dt=flr((cursor.ca+cv)/8)
local du=flr((cursor.cb+cw)/8)
local dd=x.bt.fb
dl(dd,dt*8,du*8,1)
gd(x.bt)
sfx"61"
end
if(not bs) x=nil
end
elseif hu then
if(not bs) x=nil
end
end
function gd(fa)
fa.ck=0
fa.ce=0
fa.fh=0
fa.gc=false
end
function kj(fa)
fa.jz=kk(cursor,fa)
if hr and fa.jz then
if bs then
bm=fa
else
local dt=flr((cursor.ca+cv)/8)
local du=flr((cursor.cb+cw)/8)
if(fa.type<=2 and gq[dt][du]!=16) return
if(fa.id==27 and fa.eh==8) return
if fa.id==6 and x and x.id==27 and x.cy==1 then
x.eh=7
x.eu=fa
x.eu.by=true
x.fx=cocreate(function(hm)
ie(hm,(fa.ca+16)/8,du)
ev(hm,9)
end)
return
else
x=fa
end
end
ki=true
end
end
function kl(self,km)
if(km==self.kn) return
local il=self.ko[km]
self.kp=il.cs
self.kn=km
self.kq=1
self.spr=il.kr[self.kq]
end
function ks(self)
self.kp-=1
if self.kp<=0 then
self.kq+=1
local il=self.ko[self.kn]
self.kp=il.cs
if self.kq>#il.kr then
self.kq=1
end
self.obj_spr=il.kr[self.kq]
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
local ld=lb:ct()
local le=lc:ct()
if ld.ca<le.ca+le.w and
ld.ca+ld.w>le.ca and
ld.cb<le.cb+le.h and
ld.cb+ld.h>le.cb
then
return true
else
return false
end
end
function fs(fa)
local lf=fa:ct()
rect(lf.ca,lf.cb,lf.ca+lf.w,lf.cb+lf.h,fa.jz and 11 or 8)
end
function cc()
return flr(t())%2==0
end
function cn()
lg=lh(cm,"|","\n")
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
cm=li
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
function fm(hf,hg,ca,cb,il,w,lq,lr)
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
if(ln!=lq) pset(ca+mc,cb+md,lr or ln)
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
local mn=fget(ga(iz.ca,iz.cb),1) and 4 or 1
if(ml.ca!=iz.ca and ml.cb!=iz.cb) return mn+1
return mn
end
function iy(iz,mm)
local mo={}
for dx=-1,1 do
for dy=-1,1 do
if(dx!=0 or dy!=0) mp(iz.ca+dx,iz.cb+dy,mo)
end
end return mo
end
function mp(mq,mr,ms)
if(
not fget(ga(mq,mr),0)
and bf[mq..","..mr]==nil
and mq>=0
and mr>=0
and mq<=63
and mr<=63
)
then
add(ms,{ca=mq,cb=mr})
end
end
function iw(il,mt)
return abs(il.ca-mt.ca)+abs(il.cb-mt.cb)
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
function fr(ca,cb,ef,en,eo,nr,ns,ck,nt,kt)
local nl={
ca=ca,cb=cb,ef=ef,en=en,eo=eo,nr=nr,
ck=0,ns=ns or 0.0625,
nt=nt or{7,6,5},kt=kt or 0,
nu=cb,nv=ck or 8
}
add(nq,nl)
end
function hv()
for gh,nl in pairs(nq) do
nl.eo+=nl.ns
nl.ca+=nl.en
nl.cb+=nl.eo
nl.ef+=nl.nr
nl.ck+=1
if(nl.ck>=nl.nv) del(nq,nl)
end
end
function jg()
for gh,nl in pairs(nq) do
local fp=flr((#nl.nt/nl.nv)*nl.ck)+1
if(nl.kt) fillp(nl.kt)
circfill(nl.ca,nl.cb,nl.ef,nl.nt[fp])
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
ddddddddb7bbbb7bffffffffbbbbbbbbfff9ffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
d555555577bbbb77fff77fffbbbbbbbbff66669ffffffffff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
d5555555bbbbbbbbff79ff7f0000b000f66dd66ffd5ff5ffffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
d5555555bbbbbbbbf79f779f07700077f6d55d6ff5dfffffffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
d5555555bbbbbbbbfff799ff00777770f6d55d6fffff555fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
d5555555bbbbbbbbff799fff07700077f66dd66fffff5d5ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
d555555577bbbb77ff79ffff0000b000ff6666ffffff555fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
d5555555b7bbbb7bf7ffffffbbbbbbbbf9ffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb0000000000000000
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000b00000000
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
bbbbbbbbbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbdddddddddddddddddddddddddfffc0ffddddd999dddddddd05e77e50b7bbb7bbb7bbb7bb
b0eee0bbb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbd555555555555544c4555555df4ee04ff55999999955576500c77c00bcbbbcbbbcbbbcbb
b0d6d0bbb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbd5555555555554a904455555dfff4044f54499999445f66f00077000bebbbebbbebbbebb
bbc7cbbbbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbd4c455444445549904499c95df444444f52449494425dffdc767767cb0bbb0bb0b0b0b0b
b0c7c0bbbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbb4a042499999452424297a094dffffffff5424444424556d5c767767cbbb7bbbbbbb7bbbb
b0ccc0bbb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbb49029999c0994922229aa094d4444444452242424425542500077000bbbcbbbbbbbcbbbb
bb6b6bbbb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbb242499aee099942dd1499942d4044004455422422455542500577500bbbebbbbbbbebbbb
bbbbbbbbbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbd2499a77a0a94942d1542425d44400004555224225ff222500655600bbb0bbbbbb0b0bbb
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddd1499a77aaa99424d15242f5d22222222555555555f44225bbbbbbbb0000000000000000
76665555551ffff1d576db65d5577655d5555555d5766665d5555555d1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445bbbbbbbb0000000000000000
76665c05555f4441d76dbbb5d576db65d5556555d5766665d5bbbbb5d52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445bbbddbbb0000000000000000
177dee055d5ffff1d66d11b5d76dbbb5d5576655d5677725d5555555d5424999994942425551424fd55bbddadad5bb5d5fff4765bbd66dbb0000000000000000
d1d55505555f1011d66d01b5d66d11b5d55d7d55d566dd25d55aaa55d5542494949424255555114fd5bbd5aadaaddbb55444f66fbbd66dbb0000000000000000
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d55f42424242421599c9554fdbbddaa5ddaad5bb5404dffdbbbddbbb0000000000000000
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d5558555d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4bbb67bbb0000000000000000
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5588855d5599c9212121119aa09954fd5daa5d888ddaadd52222425bbb67bbb0000000000000000
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd597a099fffffff49949454fdddddd88888ddddd55555425bbbbbbbb00000000bbbbbbbb
d555555515555155d55576db65555555d5766665d5555555d5588855d59aa094dddddddf242425ffdddaadd888d5aadd5fff2225bbbbbbbb00000000bb5555bb
d555555a5d55d555d5576dbbb555c055d5766665d5556555d5558555df249492dd929ddf00004ff1dbddaa5d8d5aaddb5ffff225b1b11b1b00000000b507665b
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555dff2424fd99299df22fff411dbbd5aadd5aad5bb54444445bdd66ddb00000000b560700b
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55aaa55d1fffff1d99299dfff141241d5bbddaadaad5bb55ffffff5b651156b00000000b567075b
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d441414155555554144442144d5bb5dadad5bb5d5ffffff5b7b55b7b00000000b570765b
d544445a15555515d5556dd5d5555555d556dd55d555d555d5bbbbb5d54404455555555444444255d4d5bbdd5ddbbddd54444445bbb67bbb00000000bb5055bb
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d55555555555555444455555dd4ddbbdddbbdddd52222225bbb67bbb00000000bbbbbbbb
dddd666666ddddddddd777c666666dddddddddddddddddddddddd66666666666ddd6666dddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667deeddddd657667555555d557755555555ddddd4dddddd566777655555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7dd0dd6666dddddd56765d566969666655ddddd4ddd5dd767666d65555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd7660dd6dd611111ddddd5d5ddadadddd55ddd5ddd5dddd767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5ddd766ddd665555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd44d676666625555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5dddd667ddd225666655d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5dd66d11d2266c0765d544ff7fff7ff445d55544445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4d5dddd56d11d276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c0777767767767d4dddddd55d11d5767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5555555766d0d66d542222222222245d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d555555567666662d52c02c020200225d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d5555555667dd722d5ee0ee022200225d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d555555566d11d22d551011011111115d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d555555556d11d25d555011011111155d555444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555555d11d55d555511111111555d555222255555555d555555555594425
ddddddddddddddd6766dddddddddddddd6666ddd555555559ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
d55555555c0555d6766dd555d76555556c67c676577777d59999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
d5d6d555ee055dd6766dd155d615555dcd76dcd1576666d5ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
d576dddd550516d6766d6105d556555dccddccd5576666d599999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
d50015055505ddd6766ddd05d5c7c5cd6cccc6dc576666d5777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
d55555555d101dd6766dd105d1dcd1c1d6666d1c576666d566dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
d455555550001dd6766dd105d1cdc166665dd1c65dddddd56666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
d15ddddddddd1dd6d16dd105d51116c67c651ccd55555555dddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
d55776d7777716d6116d6105d555dcd76dcd5dd1dddddddddddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd5115d5ddddd5dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0000000105d55cd6cccc6dc555d55ddd55dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555d555d555dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111000000000005d556c1dddd1c6555d5551555dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd555d55111555555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1555d511111555555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d61511dddd115555d111111155555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
ffffffffffffffffffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
ffffffffffffffffffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
ffffffffffffffffffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
ffffffffffffffffffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
ff77777777ffffffff77757777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
ff766666666fffffff766657666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
ff7666666666ffffff5555565555ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
f766666666666ffff777777577777fff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
f7666666666666fff7666665766666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
f76666666666666ff76666665766666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
f55555555555555ff55555555555555f6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
ffffffffffffffffffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
fffffffffffffffffffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
fffffffffffffffffffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
fffffffffffffffffffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
ffffffffffffffffffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
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
9fffff99999999ff9999999f99999ff999ffccccccccccc99f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
bbbbbbbbbbb7bbbb445d44999fcfcccccccccccccccccccccdcccdcccd1cccccccccccccccccc60ccc06cccccccccccccccccccccccccccccccccccccccccccc
bbbbbbbbbbcccbbb44d499999949fcccccccccccccccc6ccccdcccdccc1ccccccccc77cccccc515cc8115cccccc8787ccccccccccccccccc6ccccccccccccccc
bbbbb6bbbdddddbb44dd66666699fcccccccc6cccccc6f6cd77ddddddd1dddddcc77577cccc51cccc00015cccc755567cccccccccccccccc76cccccccccccccc
bbbbb7bccccccccc445d5555555ddcddcccc6f6cccccfffcc66dcccdc1c1cccccc5775d60051ccccc808d15006d85866cccccccccccccccc765cc77775cccccc
bbbcdcd5dd6d6d6d44dd96969696ddddccccfffcccccc5ccccccdccf1fff167cccc5566dd106ccccc000d601dd6555ddccc5f7cccccccccc7756777780777ccc
bbcccccc5ddddddb444666666666ddd5ccccc5cccccccfccddddddf1fffff1ddccc7666666666cccc8086666666858dd9cc65c6f6ccccccc765d656520dd777c
bbbd6d65dccccccb4446f66666f6d5ddf6cccf9999999fcc55555dd505050fddccc0000000000ccccccc00000000001149cffcf80ccccccc775cdd5d1ccc775d
bbcccccc5c5c5c5c4446664446666dddfff6cf9ccccc9fccdddd5ddd505050ddccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0f6cd0ccccccc5ccc505ccd667
bbdddddd5ddddddd4445649994666dddf9999fcccf6ccfccddd65dddddddddddccdd66ddddddd5ccccc5ddddddd66ddc4443ff005c01cccccc5ccccdcdccdddc
99955555ddddddd94545699999666d5d49119fccf6f6cfffdd22205d5ddd5dddccddd66dd555d5ccccc5d555dd66dddc22450f605d0ffff9c5ccccccccccc5cc
666dddd5555555554456699999666ddd4900944c5f659999d82d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336d8d2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446f600244ff999455d44444444549
996666666669699944467777777666dd777666666353655dd8dffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355f332494fff9444444449999999
9999996999999999444fffffffff942f666666666353d33dfffffffff5f6667d999dd6677766d5999995d6677766dd9924335203504449f9999999999999f999
44449999449444944444ffffffff560f6666ddddddddddddfff4f4f4f56ddddd99ddd66dd566d5999995d665dd66ddd9446f2446f09999ff9999999999998999
44444444444444444444ffffffffffffddddddddddddddddffffffffffffffff99dd666dd5666d59995d6665dd666dd9443324430044499f9999999999999999

__gff__
0000000000000000000202020202000000000200000002010101010101010101010101010000000000000101010000000101010101010101010101010101010101010101010102010101020201010000010101010101020101010202010100010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120032165d85850a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212123710100c830a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001010100a0a0d4d440e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212090d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016004d010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001200161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a0b000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000003600003500005d4d4d5d00000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000030000000000a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000360036000009171818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003500350000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a6e0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
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

