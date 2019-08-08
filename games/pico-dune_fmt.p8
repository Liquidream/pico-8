pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
b=false
c=3
d=8
e=2
f=2335
g=1
h=12
i=1
j=1000
k,l=0,0
m,n=0,0
o,p=0,0
q=nil
r=0
s=false
u=s
v=false
w=0
x={}
y=0
count=0
z={}
ba={}
bb={}
bc={}
bd={}
be={}
be.bf=function(self)
bg=1
bh=self.bi.bj[1]
bk(6,89,"⬆️",function(self)
bl=mid(1,bl-1,#q.bj)
bh=q.bj[bl]
if(bl<bg) bg-=1
end,10)
bk(17,89,"⬇️",function(self)
bl=mid(1,bl+1,#q.bj)
bh=q.bj[bl]
if(bl>bg+2) bg=min(bg+1,#bm.bi.bj-2)
end,10)
bk(32,88,"build",function(self)
bm=nil
bc={}
q.bn=bo
bo:bp()
end)
bk(96,88,"close",function(self)
bm=nil
end)
bm=self
end
be.bq=function(self)
self.br={
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
self.bs=1
end
be.bt=function(self)
self.br={
{11,d},
{10,d},
{9,d},
{9,d},
{9,d},
{9,d},
}
self.bs=1
end
be.bu=function(self)
pal()
palt(0,false)
pal(11,e)
pal(10,e)
pal(9,e)
if self.bv then
if self.br then
pal(self.br[self.bs][1],
self.br[self.bs][2])
end
else
pal(11,d)
self.bs=1
end
spr(self.bw,self.bx,self.by,self.bz/8,self.ca/8)
end
cb=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|nil||400|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|nil||0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|nil||0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|nil||50|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|100||200||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30||450||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30||500|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5||150|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10||300|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10||400|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20||350|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20||200|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35||400|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20||200|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||2|1|1|nil|1|7|5||125|10||200|||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||2|1|1|nil|1|7|6||250|20||200|||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50||500|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40||400|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80||1000|||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|AO|60||4|50|0.05|2|1|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|HO|100||8|110|0.1|3|1|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|100|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD||||1|1|1|11|11||3||200||10|130|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|200|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|300|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|100|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|150|0.3|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|100|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|AO|600||75|5|1.5|5|2||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4||900||0|150|0|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|A|600||90|110|0.3|8|11||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|A|0||8|220|0.1|3|1||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|H|800||60|400|0.1|7|1||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|H|0||150|70|2.5|nil|20||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER||||1|1|1|11|11||2|O|150||8|80|0.75|3|1||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|O|750||0|120|0.3|7|11||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|O|0||150|40|0.4|2|||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|110|0.1|1|||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||1|1|1|11|nil|nil|3||0||300|1000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
cartdata("pn_picodune")
cc()
ce=1
cf()
cg=0
cursor={
bx=0,
by=0,
bz=8,
ca=8,
spr=0,
ch=function(self)
return{
bx=self.bx+(not ci and k or 0)+2,
by=self.by+(not ci and l or 0)+1,
bz=1,
ca=1
}
end,
cj=function(self)
spr((q and(q.type==1)) and 1 or self.bw,
self.bx,self.by,self.bz/8,self.ca/8)
end
}
ck()
k=44
l=8
music(9)
end
function ck()
for cl=1,2 do
for cm=0,31 do
for cn=0,127 do
local co=nil
local cp=mget(cn,cm)
local cq=fget(cp)
if cl==1 and cp==1 then
cr=cn*8
cs=cm*8
co=cb[1]
elseif cl==2
and cp!=63 then
for ct in all(
cb) do
if(ct.bw!=nil and ct.bw==cp) co=ct break
end
end
if co!=nil then
cu(co,cn*8,cm*8)
if co.type==1 then
mset(cn,cm,17)
end
end
end
end
end
end
function cu(co,bx,by,cv,cw)
printh("name=.."..co.cx)
local cy=cz(co,bx,by,co.type,nil,be[co.da],be[co.db],be[co.dc],nil)
cy.dd=cz(co,109,0,3,cy,nil,nil,be[co.bp])
cy.de=df and co.dg/2 or co.dg
cy.bj={}
for ct in all(cb) do
if(ct.dh!=nil and ct.dh==cy.di) then
local bn=cz(ct,109,0,4,cy,nil,nil,function(self)
if bm then
q=self
else
self.dj=5/self.dk
self.dl=cocreate(function(self)
self.dm=0
self.dn=0
while self.dn<self.dk do
self.dm+=1
if(self.dm>3) self.dm=0 f-=1 sfx(63) self.dn+=1
self.de=(self.dn/self.dk)*100
yield()
end
sfx(56)
if self.dp.type==1 then
local dq,dr=ds(self,(self.bi.bx+8)/8,(self.bi.by+16)/8,dt)
cu(self.dp,dq*8,dr*8,self)
self.de=0
end
end)
end
end)
add(cy.bj,bn)
cy.bn=cy.bj[1]
end
end
cy.cw=cw or(du(bx,by,cr,cs)<75 and 1 or 2)
cy.cv=cv
if cy.cw==1 then
cy.dv=c
cy.dw=d
cy.dx=e
else
cy.dv=g
cy.dw=h
cy.dx=i
cy.dd.bp=nil
end
if co.type==2 then
cy.dy=53
local dz=flr(bx/8)
local ea=flr(by/8)
local eb=(co.di==2 or co.di==3)
for ec=0,co.bz-1 do
for ed=0,co.ca-1 do
mset(dz+ec,ea+ed,eb and 63 or 95)
end
end
if(not eb) add(bb,cy)
if(cy.di==7 and cy.cw==1) v=true
if cy.di==6 and cy.bi==nil then
local dq,dr=ds(cy,(cy.bx+32)/8,(cy.by+8)/8,dt)
local ee=cu(cb[27],dq*8,dr*8,cy)
ee.ef=0
end
end
if co.type==1 then
cy.dy=54
if(cy.eg!=1) cy.eh=flr(rnd(8))*.125
if cy.ei then
cy.ej=function(self)
self.ek=4
printh("fire...")
self.el=self.bx+4
self.em=self.by+4
local en=self.eo.bx+4-self.el
local ep=self.eo.by+4-self.em
local eq=sqrt(en*en+ep*ep)
self.er=en/eq
self.es=ep/eq
sfx(self.ei<100 and 60 or 58,3)
et(self)
end
else
end
add(z,cy)
eu(cy)
end
et(cy)
return cy
end
function cz(ev,bx,by,ew,bi,da,db,bp)
local ex=(ev.bz or 1)*8
local ey=(ev.ca or 1)*8
local ez={
dp=ev,
bx=bx,
by=by,
fa=1,
type=ew,
bi=bi,
bp=bp,
bz=ex,
ca=ey,
fb=ev.bw,
fc=ev.bz or 1,
fd=ev.ca or 1,
de=0,
fe=0,
ff=0,
fg=0,
fh=1,
ch=function(self)
return{
bx=self.bx,
by=self.by,
bz=(self.type>2 and 16 or self.bz)-1,
ca=(self.type>2 and 16 or self.ca)-1
}
end,
cj=db or function(self)
pal()
palt(0,false)
if(self.fi) palt(self.fi,true)
if(self.dv) pal(12,self.dw) pal(14,self.dx)
if self.br then
pal(self.br[self.bs][1],
self.br[self.bs][2])
end
if self.eh then
fj(self.bw%16*8,flr(self.bw/16)*8,self.bx,self.by+1,.25-self.eh,1,self.fi,5)
fj(self.bw%16*8,flr(self.bw/16)*8,self.bx,self.by,.25-self.eh,1,self.fi,flr(self.fh)%2==0 and 7 or nil)
else
if self.type>2 then
rectfill(self.bx-1,self.by-1,self.bx+16,self.by+19,0)
local fk=self.type==4 and self or self.bi
local fl=fk.dp.dg
local fm=fk.dj and 12 or(fk.de<fl*.33 and 8 or fk.de<fl*.66 and 10 or 11)
local fn=fk.dj and(15*fk.de/100) or(15*fk.de/fl)
if(fk.de>0) rectfill(self.bx,self.by+17,self.bx+fn,self.by+18,fm)
end
if self.type>2 then
spr(self.fo,self.bx,self.by,2,2)
else
spr(self.bw,self.bx,self.by,self.bz/8,self.ca/8)
end
end
if self.el then
circfill(self.el,self.em,0,self.fp==1 and 8 or 7)
end
if self.type<=2 and self.de<self.dp.dg*.33 then
if(rnd(10)<1) fq(self.bx+3.5,self.by+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
palt(11,true)
if self.fg>0 then
printh("draw HIT!!!! - id="..self.dp.di)
spr(19,self.bx+rnd(self.bz)-4,self.by+rnd(self.ca)-4)
end
if self.ek==5 then
spr(19,self.bx+rnd(self.bz)-4,self.by+rnd(self.ca)-4)
end
self.fg-=0.5
if(b) fr(self)
end,
fs=function(self)
self.fh=max(self.fh-.4,1)
if(self.de<=0 and self.ft==nil) self.ek=5 self.dl=nil self.ft=t()+1 sfx(self.dy,3)
if self.ft and t()>self.ft then
if self.type==2 then
for ec=0,self.dp.bz-1 do
for ed=0,self.dp.ca-1 do
mset(self.bx/8+ec,self.by/8+ed,15)
end
end
del(bb,self)
else
del(z,self)
end
if(q==self) q=nil
end
if self.fu!=nil then
self.fe+=1
if(self.fe>self.fu) then
self.fe=0
if self.fv
and self.ek==2 then
self.bw=self.fb+(self.fv-self.bw)
end
if self.br then
self.bs+=1
if(self.bs>#self.br) self.bs=1
end
end
end
if self.el then
self.el+=self.er
self.em+=self.es
if du(
self.el,self.em,
self.eo.bx,self.eo.by)<10 then
self.el=nil
printh("life b4="..self.eo.de)
self.eo.de-=self.ei
printh("life after="..self.eo.de)
self.eo.fg=1
self.eo.fw=self
end
end
end,
fx=function(self,bx,by)
self.bx=bx
self.by=by
end,
fy=function(self)
return flr(self.bx/8)..","..flr(self.by/8)
end
}
for fz,ga in pairs(ev) do
if ez[fz]==nil and ga!=""then
ez[fz]=ga
end
end
if(da) da(ez)
return ez
end
function et(gb)
printh("---reveal_fow()...")
printh("object.owner="..gb.cw)
if(gb.cw!=1 and gb.ek!=4) return
local gc=gb.type==2 and 3 or 2
for ec=-gc,gc do
for ed=-gc,gc do
local gd=flr(gb.bx/8)+ec
local ge=flr(gb.by/8)+ed
gf[gd][ge]=16
gg(gd,ge)
for ep=-1,1 do
for en=-1,1 do
gg(gd+en,ge+ep)
end
end
end
end
end
function _update60()
gh()
gi()
if(t()%1==0 and t()%2!=0) gj()
if(t()%1==0 and t()%2==0) gk()
r+=1
end
function _draw()
gl()
gm()
if(a) gn("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cf()
gf={}
for cl=-2,66 do
gf[cl]={}
for go=-2,66 do
gf[cl][go]=0
end
end
end
function gp()
local gq=flr(k/8)
local gr=flr(l/8)
for ec=gq-1,gq+16 do
for ed=gr-1,gr+16 do
if gf[ec][ed]!=0 and gf[ec][ed]!=16 then
palt(11,true)
spr(gf[ec][ed]+31,ec*8,ed*8)
elseif gf[ec][ed]<16 then
rectfill(ec*8,ed*8,ec*8+7,ed*8+7,0)
end
end
end
end
function gg(bx,by)
printh("in test_tile "..bx..","..by)
if(bx<0 or bx>#gf or by<0 or by>#gf) return
local gs=0
if gf[bx][by]!=0 then
if(gf[bx][by-1]>0) gs+=1
if(gf[bx-1][by]>0) gs+=2
if(gf[bx+1][by]>0) gs+=4
if(gf[bx][by+1]>0) gs+=8
gf[bx][by]=1+gs
end
end
function gk()
x={}
if s then
for cl=0,124,4 do
for go=0,124,4 do
local cn=cl/2
local cm=go/2
if(cm>=32) cn+=64 cm-=32
local gt=mget(cn,cm)
local gu=(gt*8)%128
local gv=(gt*8)/16
local fm=sget(gu+4,gv)
if(gf[cl/2][go/2]==16) x[((cl/2)/2)..","..((go/2)/2)]=fm!=11 and fm or 15
end
end
end
for gw,gx in pairs(bb) do
local gd=flr(gx.bx/8)
local ge=flr(gx.by/8)
if gx.cw==1 or(s and gf[gd][ge]==16) then
x[flr(gx.bx/2/8)..","..flr(gx.by/2/8)]=gx.dw
end
end
if s then
for gw,gy in pairs(z) do
local gd=flr(gy.bx/8)
local ge=flr(gy.by/8)
if gy.cw==1 or gf[gd][ge]==16 then
x[flr(gy.bx/2/8)..","..flr(gy.by/2/8)]=gy.dw
end
end
end
end
function gj()
ba={}
for fz,gy in pairs(z) do
ba[flr(gy.bx/8)..","..flr(gy.by/8)]=fz
end
end
function gh()
gz=stat(32)
ha=stat(33)
hb=stat(34)
hc=(hb>0 and hd!=hb) or btnp(4)
he=(hb>0) or btn(4)
hf=btnp(5)
for fz=0,1 do
if(btn(fz)) o+=fz*2-1
if(btn(fz+2)) p+=fz*2-1
end
m=mid(0,gz+o,127)
n=mid(0,ha+p,127)
cursor.bx=m
cursor.by=n
if not bm then
if(m<4) k-=2
if(m>123) k+=2
if(n<4) l-=2
if(n>123) l+=2
k=mid(k,384)
l=mid(l,384)
end
hg()
hh()
hi()
cg+=1
hd=hb
hj=q
bo=bh
end
function hk(bx,by)
local fn=mget(bx,by)
return fn>=2 and fn<=8
end
function eu(gy,hl)
printh("do_guard()!! - start_state="..tostr(hl))
gy.ek=hl or 0
gy.dl=cocreate(function(self)
while true do
if(rnd(500)<1 and self.ei>0) ds(self,flr(self.bx/8),flr(self.by/8),hm,self.hn)
if self.fg>0 and self.ek==0 then
printh("do_guard() > HIT!!")
ho(5,true)
if(y==0 or stat(24)>5) y=1 music(0)
if(self.ei>0) hp(self,self.fw)
end
if self.di==27 then
if self.ek==0 or self.ek==7 or self.ek==9 then
if self.ef<=700
and self.ek!=7 and self.ek!=9 then
local gu,gv
local hq,hr=flr(self.bx/8),flr(self.by/8)
if hk(hq,hr) and not self.hs then
gu,gv=hq,hr
else
ds(self,hq,hr,
function(gy,bx,by)
if hk(bx,by) then
gu,gv=bx,by
return true
end
end,
10)
end
if gu and gv then
ht(gy,gu,gv)
if(hk(flr(gy.bx/8),flr(gy.by/8))) gy.ek=6
end
elseif self.ek==9 then
if not self.cv.hu then
self.cv.bv=false
self.cv.hu=true
while self.ef>0 do
self.ek=8
self.eh=.25
self.bx=self.cv.bx+16
self.by=self.cv.by+4
self.ef-=1
if(q==self) q=nil
if(self.cw==1) f+=1 sfx(63)
yield()
end
self.ef=0
self.cv.hu=false
self.ek=0
end
end
elseif self.ef>=700
and self.ek!=7 then
self.ek=7
self.cv.bv=true
ht(self,(self.cv.bx+16)/8,self.cv.by/8)
self.ek=9
elseif self.ek==6 then
self.hs=false
local eh=gy.eh+.75+rnd(.2)-.1
local hv,hw=sin(eh)*5.5,-cos(eh)*5.5
if(rnd(5)<1) fq(gy.bx+hv+3.5,gy.by+hw+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bd[gy:fy()]=(bd[gy:fy()] or 1400)-1
self.ef=(self.ef or 0)+1
if bd[gy:fy()]<=0 then
local dz=flr(self.bx/8)
local ea=flr(self.by/8)
for ed=-1,1 do
for ec=-1,1 do
fn=mget(dz+ec,ea+ed)
mset(dz+ec,ea+ed,
(ec==0 and ed==0) and 0 or((fn>1 and fn<8) and 8 or fn)
)
end
end
self.ek=0
end
if self.ef%300==0 then
self.hs=true
self.ek=0
end
end
end
yield()
end
end)
end
function hp(gy,eo)
printh("do_attack()...")
gy.ek=3
gy.eo=eo
gy.dl=cocreate(function(self)
while eo.de>0 do
if du(gy.bx,gy.by,eo.bx,eo.by)>gy.hn*5 then
ht(gy,flr(eo.bx/8),flr(eo.by/8),gy.hn*5)
end
if not gy.eg then
local hx=atan2(gy.bx-eo.bx,gy.by-eo.by)
while(gy.eh!=hx) do
hy(gy,hx)
end
end
gy.ff-=1
if(gy.ff<=0 and not gy.el) gy.ej(gy) gy.ff=gy.ei*2
yield()
end
ho(5,false)
y=2
eu(self)
end)
end
function ds(gy,bx,by,hz,ia)
for du=1,ia or 64 do
for ec=bx-du,bx+du do
for ed=by-du,by+du do
if((ec==bx-du or ec==bx+du or ed==by-du or ed==by+du) and(hz(gy,ec,ed))) return ec,ed
end
end
yield()
end
end
function dt(gy,bx,by)
printh("is_free_tile("..bx..","..by..")")
return not fget(mget(bx,by),0)
and ba[bx..","..by]==nil
end
function hm(gy,bx,by)
local eo=z[ba[bx..","..by]]
if(eo!=ib and eo.cw!=gy.cw) hp(gy,eo) return true
end
function ht(gy,bx,by,ic)
::restart_move_unit::
printh("move_unit_pos("..bx..","..by..","..(ic or"nil")..")")
gy.id="init"
if not dt(nil,bx,by) then
bx,by=ds(gy,bx,by,dt)
end
gy.hq=bx
gy.hr=by
gy.ie=gy.ek
gy.ek=1
gy.id=ig(
{bx=flr(gy.bx/8),by=flr(gy.by/8)},
{bx=gy.hq,by=gy.hr},
ih,
ii,
ij,
function(ik) return shl(ik.by,8)+ik.bx end,
nil)
gy.ie=gy.ek
gy.ek=2
gy.ek=2
if gy.id!=nil then
for cl=#gy.id-1,1,-1 do
local ik=gy.id[cl]
if not gy.eg then
local en=gy.bx-(ik.bx*8)
local ep=gy.by-(ik.by*8)
local hx=atan2(en,ep)
while(gy.eh!=hx) do
hy(gy,hx)
end
end
if(not dt(nil,bx,by)) goto il
local im=gy.io or .5
local ip=sqrt((ik.bx*8-gy.bx)^2+(ik.by*8-gy.by)^2)
local iq=im*(ik.bx*8-gy.bx)/ip
local ir=im*(ik.by*8-gy.by)/ip
for cl=0,ip/im-1 do
gy.bx+=iq
gy.by+=ir
yield()
end
gy.bx,gy.by=ik.bx*8,ik.by*8
et(gy)
local eq=du(gy.bx,gy.by,gy.hq*8,gy.hr*8)
if eq<=(ic or 0) then
break
end
end
end
gy.ek=0
printh("arrived!!")
end
function hg()
for gw,gy in pairs(z) do
is(gy)
end
for gw,gx in pairs(bb) do
is(gx)
is(gx.bn)
end
end
function is(ez)
if ez then
if ez.dl and costatus(ez.dl)!='dead'then
it(coresume(ez.dl,ez))
else
ez.dl=nil
end
end
end
function gi()
end
function gl()
cls"15"
camera(k,l)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for gw,gx in pairs(bb) do
gx:fs()
gx:cj()
if(gx==q) then
rect(q.bx,q.by,
q.bx+q.bz-1,q.by+q.ca-1,
7)
end
end
palt(11,true)
for gw,gy in pairs(z) do
gy:fs()
gy:cj()
if(gy==q) then
palt(11,true)
spr(16,q.bx,q.by)
end
end
iu()
gp()
end
function iv()
local gc=31
local bx,by=93,93
rectfill(bx-1,by-1,bx+gc+1,by+gc+1,e)
if(v) s=true
rectfill(bx,by,bx+gc,by+gc,0)
if s!=u then
w=1
iw=1
sfx(55)
end
u=s
if w>0 and w<60 then
w+=iw
clip(
max(bx+(gc/2)-w,bx),
max(by+(gc/2)-(w>20 and w-20 or 0),by),
min(w*2,gc),
min((w>20 and w-20 or 1)*2,gc))
for cl=1,300 do
pset(bx+rnd(gc),by+rnd(gc),5+rnd(3))
end
return
end
for ec=0,gc do
for ed=0,gc do
if(x[ec..","..ed]) pset(bx+ec,by+ed,x[ec..","..ed])
end
end
local hv=bx+k/16
local hw=by+l/16
rect(hv,hw,hv+7,hw+7,7)
end
function gm()
camera(0,0)
pal()
palt(0,false)
if q and q.dd then
q.dd:fx(109,20)
q.dd:cj()
if q.bn and q.cw==1 then
q.bn:fx(109,44)
q.bn:cj()
end
end
gn("00"..flr(f),103,2,7)
if q
and q.bn
and q.bn.dp.type==2
and q.bn.de>=100 then
local ix=flr((cursor.bx+k)/8)
local iy=flr((cursor.by+l)/8)
local iz=ix*8-k
local ja=iy*8-l
jb=false
jc=false
df=false
local bz=q.bn.dp.bz
local ca=q.bn.dp.ca
for ec=-1,bz do
for ed=-1,ca do
if ec==-1 or ec==bz or ed==-1 or ed==ca then
if(mget(ix+ec,iy+ed)>=63) jb=true
else
local fn=mget(ix+ec,iy+ed)
if(fn>=9 and fn<=15) df=true
if(ba[ix+ec..","..iy+ed] or fn==0 or fn<8 or fn>15) jc=true
end
end
end
if(jc) jb=false
fillp("0b1110110110110111.1")
rectfill(iz,ja,
iz+q.bn.bz,ja+q.bn.ca,jb and 11 or 8)
fillp()
end
iv()
if bm then
jd(121,73,e,d)
if q.bj then
rectfill(6,30,27,97,0)
for cl=1,#q.bj do
local je=q.bj[cl]
if cl>=bg and cl<=bg+2 then
je:fx(9,32+((cl-bg)*19))
je:cj()
else
je:fx(-16,16)
end
if(bh==je) then
bl=cl
rect(je.bx-2,je.by-2,
je.bx+17,je.by+17,
7)
print(bh.cx,30,31,7)
print("cOST:"..bh.dk,85,38,9)
jf=0
local jg=jh(bh.ji,23)
for go in all(jg) do
print(go,30,44+jf,6)
jf+=6
end
end
end
end
for gw,jj in pairs(bc) do
jj:cj()
end
end
palt(11,true)
cursor:cj()
end
function jd(bz,ca,jk,jl)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-bz/2,64-ca/2,64+bz/2,64+ca/2,jk)
rect(64-bz/2+1,64-ca/2+1,64+bz/2-1,64+ca/2-1,jl)
end
function bk(bx,by,jm,bp,ex)
local ez={
bx=bx,
by=by,
bz=ex or#jm*4+2,
ca=8,
jm=jm,
ch=function(self)
return{
bx=self.bx,
by=self.by,
bz=self.bz,
ca=self.ca
}
end,
cj=function(self)
if(#jm>1) rectfill(self.bx,self.by,self.bx+self.bz,self.by+self.ca,7)
if(#jm>1) rectfill(self.bx+1,self.by+1,self.bx+self.bz-1,self.by+self.ca-1,self.jn and 12 or 6)
print(self.jm,self.bx+2,self.by+2,(#jm>1) and 0 or(self.jn and 12 or 7))
if(b) fr(self)
end,
bp=bp
}
add(bc,ez)
end
function jh(jo,jp)
local jq={}
local jr=""
local js=""
local jt=""
local ju=function(jv)
if#js+#jr>jv then
add(jq,jr)
jr=""
end
jr=jr..js
js=""
end
for cl=1,#jo do
jt=sub(jo,cl,cl)
js=js..jt
if jt==" "
or#js>jp-1 then
ju(jp)
elseif#js>jp-1 then
js=js.."-"
ju(jp)
elseif jt==";"then
jr=jr..sub(js,1,#js-1)
js=""
ju(0)
end
end
ju(jp)
if jr!=""then
add(jq,jr)
end
return jq
end
function hh()
jw=false
if not bm then
foreach(z,jx)
foreach(bb,jx)
end
if q then
ci=true
if(q.dd and not bm) jx(q.dd)
foreach(q.bj,jx)
foreach(bc,jx)
ci=false
end
if he
and not bm
and m>93 and m<120
and n>93 and n<120 then
k=min((m-94)*16,400)
l=min((n-94)*16,400)
elseif hc then
if jw then
if(not bm and q.bp and q.bi!=nil) q:bp() q=hj return
if(bm and bh.jm and bh.bp) bh:bp()
if(q.cw==1 and q.type==1 and q!=hj) sfx(62)
if(q.cw==2 and hj and hj.type==1 and hj.cw==1) q.fh=10 hp(hj,q) q=nil
else
if q
and q.type==1
and q.cw==1
and(q.di!=27 or q.ek!=7) then
q.dl=cocreate(function(gy)
ht(gy,flr((k+m)/8),flr((l+n)/8))
eu(gy)
end)
end
if q
and q.bn
and q.bn.de>=100
and jb then
local dz=flr((cursor.bx+k)/8)
local ea=flr((cursor.by+l)/8)
local co=q.bn.dp
cu(co,dz*8,ea*8,nil,1)
q.bn.de=0
sfx(61)
end
if(not bm) q=nil
end
end
end
function jx(ez)
ez.jn=jy(cursor,ez)
if hc and ez.jn then
if bm then
bh=ez
else
local dz=flr((cursor.bx+k)/8)
local ea=flr((cursor.by+l)/8)
printh("fow[xpos][ypos])="..tostr(gf[dz][ea]))
if(ez.type<=2 and gf[dz][ea]!=16) return
if(ez.di==27 and ez.ek==8) return
if ez.di==6 and q and q.di==27 and q.cw==1 then
q.ek=7
q.cv.bv=true
q.dl=cocreate(function(gy)
gy.cv=ez
ht(gy,(ez.bx+16)/8,ea)
eu(gy,9)
end)
printh("register NO CLICK!")
return
else
q=ez
end
end
jw=true
end
end
function jz(self,ka)
if(ka==self.kb) return
local hx=self.kc[ka]
self.kd=hx.cg
self.kb=ka
self.ke=1
end
function kf(self)
self.kd-=1
if self.kd<=0 then
self.ke+=1
local hx=self.kc[self.kb]
self.kd=hx.cg
if self.ke>#hx.kg then
self.ke=1
end
self.bw=hx.kg[self.ke]
end
end
function ho(kh,ki)
local kj=0x3100
local kk=1
kh*=4
local fn=peek(kj+kh+kk)
if((band(fn,128)>0)!=ki) fn=bxor(fn,128)
poke(kj+kh+kk,fn)
end
function gn(kl,km,
kn,fm,
ko)
for ec=-1,1 do
for ed=-1,1 do
print(kl,km+ec,kn+ed,ko)
end
end
print(kl,km,kn,fm)
end
function jy(kp,kq)
local kr=kp:ch()
local ks=kq:ch()
if kr.bx<ks.bx+ks.bz and
kr.bx+kr.bz>ks.bx and
kr.by<ks.by+ks.ca and
kr.by+kr.ca>ks.by
then
return true
else
return false
end
end
function fr(ez)
local kt=ez:ch()
rect(kt.bx,kt.by,kt.bx+kt.bz,kt.by+kt.ca,ez.jn and 11 or 8)
end
function ku()
return flr(t())%2==0
end
function cc()
kv=kw(cb,"|","\n")
kx={}
for cl=2,#kv-1 do
ky={}
for kz=1,#kv[cl] do
local fn=kv[cl][kz]
if(kz!=2 and kz<24) fn=tonum(fn)
ky[kv[1][kz]]=fn
end
kx[tonum(kv[cl][1])]=ky
end
cb=kx
end
function kw(kl,eq,la)
local hx={}
local lb=0
local lc=''
local ld=''
if la~=nil then kl=kw(kl,la) end
while#kl>0 do
if type(kl)=='table'then
lc=kl[1]
add(hx,kw(lc,eq))
del(kl,lc)
else
lc=sub(kl,1,1)
kl=sub(kl,2)
if lc==eq then
add(hx,ld)
ld=''
else
ld=ld..lc
end
end
end
add(hx,ld)
return hx
end
local le=0
function fj(gu,gv,bx,by,hx,bz,lf,lg)
local lh,li=cos(hx),sin(hx)
local lj,lk,kj,ll
local lm,ln=lh,li
local gs=shl(0xfff8,(bz-1))
bz*=4
lh*=bz-0.5
li*=bz-0.5
local lo,lp=li-lh+bz,-lh-li+bz
bz=2*bz-1
for lq=0,bz do
lj,lk=lo,lp
for lr=0,bz do
if band(bor(lj,lk),gs)==0 then
local lb=sget(gu+lj,gv+lk)
if(lb!=lf) pset(bx+lq,by+lr,lg or lb)
end
lj-=ln
lk+=lm
end
lo+=lm
lp+=ln
end
end
function du(lt,lu,lv,lw)
return abs(sqrt(((lt-lv)/1000)^2+((lu-lw)/1000)^2)*1000)
end
lx=3.14159
ly=.5*(lx/180)
function hy(gy,lz)
ma=lz-gy.eh
if ma>0.5 then
ma-=1
elseif ma<-0.5 then
ma+=1
end
if ma>ly then
gy.eh+=ly
elseif ma<-ly then
gy.eh-=ly
else
gy.eh=lz
end
if(gy.eh>lx) gy.eh-=2*lx
if(gy.eh<-lx) gy.eh+=2*lx
yield()
end
function ii(mb,ik,mc)
local md=fget(mget(ik.bx,ik.by),1) and 4 or 1
if(mb.bx!=ik.bx and mb.by!=ik.by) return md+1
return md
end
function ij(ik,mc)
local me={}
for ec=-1,1 do
for ed=-1,1 do
if(ec!=0 or ed!=0) mf(ik.bx+ec,ik.by+ed,me)
end
end return me
end
function mf(mg,mh,mi)
if(
not fget(mget(mg,mh),0)
and ba[mg..","..mh]==nil
and mg>=0
and mh>=0
and mg<=63
and mh<=63
)
then
add(mi,{bx=mg,by=mh})
end
end
function ih(hx,mj)
return abs(hx.bx-mj.bx)+abs(hx.by-mj.by)
end
function ig
(mk,
ml,
mm,
mn,
me,
mo,
mc)
local mp,
mq={
mr=mk,
ms=0,
mt=mm(mk,ml,mc)
},{}
mq[mo(mk,mc)]=mp
local mu,mv,mw,mx={mp},1,mo(ml,mc),32767.99
while mv>0 do
local dk,my=mx
for cl=1,mv do
local mz=mu[cl].ms+mu[cl].mt
if(mz<=dk) my,dk=cl,mz
end
mp=mu[my]
mu[my],mp.na=mu[mv],true
mv-=1
local nb=mp.mr
if mo(nb,mc)==mw then
nb={ml}
while mp.nc do
mp=mq[mo(mp.nc,mc)]
add(nb,mp.mr)
end
return nb
end
for nd in all(me(nb,mc)) do
local di=mo(nd,mc)
local ne,nf=
mq[di],
mp.ms+mn(nb,nd,mc)
if not ne then
ne={
mr=nd,
ms=mx,
mt=mm(nd,ml,mc)
}
mv+=1
mu[mv],mq[di]=ne,ne
end
if not ne.na and ne.ms>nf then
ne.ms,ne.nc=nf,nb
end
end
count+=1
if count>10 then
count=1
yield()
end
end
end
ng={}
function fq(bx,by,eh,en,ep,nh,ni,de,nj,kh)
local nb={
bx=bx,by=by,eh=eh,en=en,ep=ep,nh=nh,
de=0,ni=ni or 0.0625,
nj=nj or{7,6,5},kh=kh or 0,
nk=by,nl=de or 8
}
add(ng,nb)
end
function hi()
for fz,nb in pairs(ng) do
nb.ep+=nb.ni
nb.bx+=nb.en
nb.by+=nb.ep
nb.eh+=nb.nh
nb.de+=1
if(nb.de>=nb.nl) del(ng,nb)
end
end
function iu()
for fz,nb in pairs(ng) do
local fm=flr((#nb.nj/nb.nl)*nb.de)+1
if(nb.kh) fillp(nb.kh)
circfill(nb.bx,nb.by,nb.eh,nb.nj[fm])
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
b7bbbb7bffffffffffffffffbb888b8bffffffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
77bbbb77fffffffffff77fffb8899898fffffffff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
bbbbbbbbffffffffff79ff7f8999998bfffffffff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
bbbbbbbbfffffffff79f779f889aa988fffffffff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
bbbbbbbbfffffffffff799ffb89aa998fffffffff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
bbbbbbbbffffffffff799fff899aa98bfffffffff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
77bbbb77ffffffffff79ffff88999988fffffffff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffb88898bbffffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb6bbb6bbb6bbb6bbdddddddd
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb8bbb8bbb8bbb8bbd5555555
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbffffffffffffffffffffffffffffffffbbbddbbbb7b55b7bb2bbb2bbb2bbb2bbd5555555
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbffffffffffffffffffffffffffffffffbbd66dbbb651156bb0bbb0bb0b0b0b0bd5555555
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbffffffffffffffffffffffffffffffffbbd66dbbbdd66ddbbbb6bbbbbbb6bbbbd5555555
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbffffffffffffffffffffffffffffffffbbbddbbbb1b11b1bbbb8bbbbbbb8bbbbd5555555
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbbd5555555
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbd5555555
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddddd6666dddddddddddddddddddddddddddddddddddddddddd19999999999999977777777
76665555551ffff1d576db65d5577655d5555555d5766665d5555555d566777655555555d555555555555555d766777755555555d49495594999924976666665
76665c05555f4441d76dbbb5d576db65d5556555d5766665d5bbbbb5d767666d65555555d554777777777455d7ddfff755555555d19425599922999976666665
177dee055d5ffff1d66d11b5d76dbbb5d5576655d5677725d5555555d767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f412141976666665
d1d55505555f1011d66d01b5d66d11b5d55d7d55d566dd25d55aaa55d766ddd665555555d504777778617405d4447ff7265557f6d19565656599995976666665
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d676666625555555d544ff7ff6d1f445d4047777655777fdd49995555594495976666665
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d5559555d667ddd225666655d504777771177405d44444442657ffffd19495c05594495976666665
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
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffc7cccccccccccccccccccccceeeeeeeeeeeeeeee
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff54ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660ccccc2888887660cccc4ff54cccccccccccccc7ffc455550ceeeeeeeeeeeeeeee
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cccc288888887ccccccc54cccccff5ccccccc44ffff4ccccceeeeeeeeeeeeeeee
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444ccccc5225222222287ccc45555cc4ffffcccc50005444544ccceeeeeeeeeeeeeeee
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cc55588888888855cc54fffffffffff5cc5000005ffff505ceeeeeeeeeeeeeeee
916666d001110009cccc00df00cccccc95060000000006599504000000000459950600000000065995040000000004599500000599940009eeeeeeeeeeeeeeee
f90500000444000999999900ff99999999555555555555999955555555555599995555555555559999555555555555999950005222225059eeeeeeeeeeeeeeee
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999feeeeeeeeeeeeeeee
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f999999eeeeeeeeeeeeeeee
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff9eeeeeeeeeeeeeeee
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999eeeeeeeeeeeeeeee
9fffff99999999ff9999999f99999ff999fffff9999f99999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99eeeeeeeeeeeeeeee
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
0000000000000000000202020202020000000200000000010101010101010101010101010000000000000101010000000001010101010100000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
0000000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d4b14000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616001414001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d144214000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121600000000000014141414000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001200000000001b140a0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016000014140a0e000012123665141400000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000d01140000121b090c1414140000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001634000014140c0012000a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016160060140d62140e000d0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000120000160014140014140a00000917191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000000000000000490a0000091d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000035161600000d0a0000000d0d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212120000000000161600000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000003000000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000a0a0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0a0047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012121212000035000a0a0a0a0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000a171818190a0a0a490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000032000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000360000004d0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16161600000000000000000a0a650a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
011000000c0430c04305155051550515511975051551197506155061550615511975031550315503155039750c0430c0430515505155051551810005155181000d1550d1550d155181000c1550c1550c15518100
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
00 21232263
00 21226263
00 08092262
01 0b090a08
00 0b0c0a08
00 0b0c0a08
00 0b0e0f0d
00 0b0e0f0d
00 13111210
00 13111210
00 13141210
00 13151210
00 19171816
00 131a1b10
00 131c1b10
00 130c0a10
00 130f0e1e
00 19171816
00 130c0a1f
00 19171816
02 0b090a08

