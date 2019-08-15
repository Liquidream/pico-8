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
local cx=cy(co,bx,by,co.type,nil,be[co.cz],be[co.da],be[co.db],nil)
cx.dc=cy(co,109,0,3,cx,nil,nil,be[co.bp])
cx.dd=de and co.df/2 or co.df
cx.bj={}
for ct in all(cb) do
if(ct.dg!=nil and ct.dg==cx.dh) then
local bn=cy(ct,109,0,4,cx,nil,nil,function(self)
if bm then
q=self
else
self.di=5/self.dj
self.dk=cocreate(function(self)
self.dl=0
self.dm=0
while self.dm<self.dj do
self.dl+=1
if(self.dl>3) self.dl=0 f-=1 sfx(63) self.dm+=1
self.dd=(self.dm/self.dj)*100
yield()
end
sfx(56)
if self.dn.type==1 then
local dp,dq=dr(self,(self.bi.bx+8)/8,(self.bi.by+16)/8,ds)
cu(self.dn,dp*8,dq*8,self)
self.dd=0
end
end)
end
end)
add(cx.bj,bn)
cx.bn=cx.bj[1]
end
end
cx.cw=cw or(dt(bx,by,cr,cs)<75 and 1 or 2)
cx.cv=cv
if cx.cw==1 then
cx.du=c
cx.dv=d
cx.dw=e
else
cx.du=g
cx.dv=h
cx.dw=i
cx.dc.bp=nil
end
if co.type==2 then
cx.dx=53
local dy=flr(bx/8)
local dz=flr(by/8)
local ea=(co.dh==2 or co.dh==3)
for eb=0,co.bz-1 do
for ec=0,co.ca-1 do
mset(dy+eb,dz+ec,ea and 63 or 95)
end
end
if(not ea) add(bb,cx)
if(cx.dh==7 and cx.cw==1) v=true
if cx.dh==6 and cx.bi==nil then
local dp,dq=dr(cx,(cx.bx+32)/8,(cx.by+8)/8,ds)
local ed=cu(cb[27],dp*8,dq*8,cx)
ed.ee=0
end
end
if co.type==1 then
cx.dx=54
if(cx.ef!=1) cx.eg=flr(rnd(8))*.125
if cx.eh then
cx.ei=function(self)
self.ej=4
self.ek=self.bx+4
self.el=self.by+4
self.em=self.en.bx+self.en.bz/2
self.eo=self.en.by+self.en.ca/2
local ep=self.em-self.ek
local eq=self.eo-self.el
local er=sqrt(ep*ep+eq*eq)
self.es=(ep/er)*2
self.et=(eq/er)*2
sfx(self.eh<100 and 60 or 58,3)
eu(self)
end
else
end
add(z,cx)
ev(cx)
end
eu(cx)
return cx
end
function cy(ew,bx,by,ex,bi,cz,da,bp)
local ey=(ew.bz or 1)*8
local ez=(ew.ca or 1)*8
local fa={
dn=ew,
bx=bx,
by=by,
fb=1,
type=ex,
bi=bi,
bp=bp,
bz=ey,
ca=ez,
fc=ew.bw,
fd=ew.bz or 1,
fe=ew.ca or 1,
dd=0,
ff=0,
fg=0,
fh=0,
fi=1,
ch=function(self)
return{
bx=self.bx,
by=self.by,
bz=(self.type>2 and 16 or self.bz)-1,
ca=(self.type>2 and 16 or self.ca)-1
}
end,
cj=da or function(self)
pal()
palt(0,false)
if(self.fj) palt(self.fj,true)
if(self.du) pal(12,self.dv) pal(14,self.dw)
if self.br then
pal(self.br[self.bs][1],
self.br[self.bs][2])
end
if self.eg then
fk(self.bw%16*8,flr(self.bw/16)*8,self.bx,self.by+1,.25-self.eg,1,self.fj,5)
fk(self.bw%16*8,flr(self.bw/16)*8,self.bx,self.by,.25-self.eg,1,self.fj,flr(self.fi)%2==0 and 7 or nil)
else
if self.type>2 then
rectfill(self.bx-1,self.by-1,self.bx+16,self.by+19,0)
local fl=self.type==4 and self or self.bi
local fm=fl.dn.df
local fn=fl.di and 12 or(fl.dd<fm*.33 and 8 or fl.dd<fm*.66 and 10 or 11)
local fo=fl.di and(15*fl.dd/100) or(15*fl.dd/fm)
if(fl.dd>0) rectfill(self.bx,self.by+17,self.bx+fo,self.by+18,fn)
end
if self.type>2 then
spr(self.fp,self.bx,self.by,2,2)
else
spr(self.bw,self.bx,self.by,self.bz/8,self.ca/8)
end
end
if self.ek then
if(self.fq==1) then
circfill(self.ek,self.el,0,rnd(2)<1 and 8 or 9)
else
fr(self.ek,self.el,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.dd<self.dn.df*.33 then
if(rnd(10)<1) fr(self.bx+3.5,self.by+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fh=0
if(b) fs(self)
end,
ft=function(self)
self.fi=max(self.fi-.4,1)
if(self.dd<=0 and self.fu==nil) self.ej=5 self.dk=nil self.fu=t()+1 sfx(self.dx,3)
if self.fu then
if t()>self.fu then
if self.type==2 then
for eb=0,self.dn.bz-1 do
for ec=0,self.dn.ca-1 do
mset(self.bx/8+eb,self.by/8+ec,15)
end
end
del(bb,self)
else
del(z,self)
end
if(q==self) q=nil
else
if(rnd(2)<1) fv(self.bx+rnd(self.bz),self.by+rnd(self.ca))
end
end
if self.fw!=nil then
self.ff+=1
if(self.ff>self.fw) then
self.ff=0
if self.fx
and self.ej==2 then
self.bw=self.fc+(self.fx-self.bw)
end
if self.br then
self.bs+=1
if(self.bs>#self.br) self.bs=1
end
end
end
if self.ek then
self.ek+=self.es
self.el+=self.et
if dt(
self.ek,self.el,
self.em,self.eo)<2 then
fv(self.ek,self.el)
self.ek=nil
self.en.dd-=self.eh
self.en.fh=self.fq
self.en.fy=self
end
end
end,
fz=function(self,bx,by)
self.bx=bx
self.by=by
end,
ga=function(self)
return flr(self.bx/8)..","..flr(self.by/8)
end
}
for gb,gc in pairs(ew) do
if fa[gb]==nil and gc!=""then
fa[gb]=gc
end
end
if(cz) cz(fa)
return fa
end
function fv(bx,by)
fr(bx,by,2,
0,0,.1,0,20,{7,8,9,10,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
function eu(gd)
if(gd.cw!=1 and gd.ej!=4) return
local ge=gd.type==2 and 3 or 2
for eb=-ge,ge do
for ec=-ge,ge do
local gf=flr(gd.bx/8)+eb
local gg=flr(gd.by/8)+ec
gh[gf][gg]=16
gi(gf,gg)
for eq=-1,1 do
for ep=-1,1 do
gi(gf+ep,gg+eq)
end
end
end
end
end
function _update60()
gj()
gk()
if(t()%1==0) gl()
if(t()%1==0 and t()%2==0) gm()
r+=1
end
function _draw()
gn()
go()
if(a) gp("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cf()
gh={}
for cl=-2,66 do
gh[cl]={}
for gq=-2,66 do
gh[cl][gq]=0
end
end
end
function gr()
local gs=flr(k/8)
local gt=flr(l/8)
for eb=gs-1,gs+16 do
for ec=gt-1,gt+16 do
if gh[eb][ec]!=0 and gh[eb][ec]!=16 then
palt(11,true)
spr(gh[eb][ec]+31,eb*8,ec*8)
elseif gh[eb][ec]<16 then
rectfill(eb*8,ec*8,eb*8+7,ec*8+7,0)
end
end
end
end
function gi(bx,by)
if(bx<0 or bx>#gh or by<0 or by>#gh) return
local gu=0
if gh[bx][by]!=0 then
if(gh[bx][by-1]>0) gu+=1
if(gh[bx-1][by]>0) gu+=2
if(gh[bx+1][by]>0) gu+=4
if(gh[bx][by+1]>0) gu+=8
gh[bx][by]=1+gu
end
end
function gm()
x={}
if s then
for cl=0,124,4 do
for gq=0,124,4 do
local cn=cl/2
local cm=gq/2
if(cm>=32) cn+=64 cm-=32
local gv=mget(cn,cm)
local gw=(gv*8)%128
local gx=(gv*8)/16
local fn=sget(gw+4,gx)
if(gh[cl/2][gq/2]==16) x[((cl/2)/2)..","..((gq/2)/2)]=fn!=11 and fn or 15
end
end
end
for gy,gz in pairs(bb) do
local gf=flr(gz.bx/8)
local gg=flr(gz.by/8)
if gz.cw==1 or(s and gh[gf][gg]==16) then
x[flr(gz.bx/2/8)..","..flr(gz.by/2/8)]=gz.dv
end
end
if s then
for gy,ha in pairs(z) do
local gf=flr(ha.bx/8)
local gg=flr(ha.by/8)
if ha.cw==1 or gh[gf][gg]==16 then
x[flr(ha.bx/2/8)..","..flr(ha.by/2/8)]=ha.dv
end
end
end
end
function gl()
ba={}
for gb,ha in pairs(z) do
ba[flr(ha.bx/8)..","..flr(ha.by/8)]=gb
end
end
function gj()
hb=stat(32)
hc=stat(33)
hd=stat(34)
he=(hd>0 and hf!=hd) or btnp(4)
hg=(hd>0) or btn(4)
hh=btnp(5)
for gb=0,1 do
if(btn(gb)) o+=gb*2-1
if(btn(gb+2)) p+=gb*2-1
end
m=mid(0,hb+o,127)
n=mid(0,hc+p,127)
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
hi()
hj()
hk()
cg+=1
hf=hd
hl=q
bo=bh
end
function hm(bx,by)
local fo=mget(bx,by)
return fo>=2 and fo<=8
end
function ev(ha,hn)
ha.ej=hn or 0
ha.dk=cocreate(function(self)
while true do
if(rnd(500)<1 and self.eh>0) dr(self,flr(self.bx/8),flr(self.by/8),ho,self.hp)
if self.fh>0 and self.ej==0 then
hq(5,true)
if(y==0 or stat(24)>5) y=1 music(0)
if(self.eh>0) hr(self,self.fy)
end
if self.dh==27 then
if self.ej==0 or self.ej==7 or self.ej==9 then
if self.ee<=700
and self.ej!=7 and self.ej!=9 then
local gw,gx
local hs,ht=flr(self.bx/8),flr(self.by/8)
if hm(hs,ht) and not self.hu then
gw,gx=hs,ht
else
dr(self,hs,ht,
function(ha,bx,by)
if hm(bx,by) then
gw,gx=bx,by
return true
end
end,
10)
end
if gw and gx then
hv(ha,gw,gx)
if(hm(flr(ha.bx/8),flr(ha.by/8))) ha.ej=6
end
elseif self.ej==9 then
if not self.cv.hw then
self.cv.bv=false
self.cv.hw=true
while self.ee>0 do
self.ej=8
self.eg=.25
self.bx=self.cv.bx+16
self.by=self.cv.by+4
self.ee-=1
if(q==self) q=nil
if(self.cw==1) f+=1 sfx(63)
yield()
end
self.ee=0
self.cv.hw=false
self.ej=0
end
end
elseif self.ee>=700
and self.ej!=7 then
self.ej=7
self.cv.bv=true
hv(self,(self.cv.bx+16)/8,self.cv.by/8)
self.ej=9
elseif self.ej==6 then
self.hu=false
local eg=ha.eg+.75+rnd(.2)-.1
local hx,hy=sin(eg)*5.5,-cos(eg)*5.5
if(rnd(5)<1) fr(ha.bx+hx+3.5,ha.by+hy+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bd[ha:ga()]=(bd[ha:ga()] or 1400)-1
self.ee=(self.ee or 0)+1
if bd[ha:ga()]<=0 then
local dy=flr(self.bx/8)
local dz=flr(self.by/8)
for ec=-1,1 do
for eb=-1,1 do
fo=mget(dy+eb,dz+ec)
mset(dy+eb,dz+ec,
(eb==0 and ec==0) and 0 or((fo>1 and fo<8) and 8 or fo)
)
end
end
self.ej=0
end
if self.ee%300==0 then
self.hu=true
self.ej=0
end
end
end
yield()
end
end)
end
function hr(ha,en)
ha.ej=3
ha.en=en
ha.dk=cocreate(function(self)
while en.dd>0 do
if dt(ha.bx,ha.by,en.bx,en.by)>ha.hp*5 then
hv(ha,flr(en.bx/8),flr(en.by/8),ha.hp*5)
end
if not ha.ef then
local hz=atan2(ha.bx-en.bx,ha.by-en.by)
while(ha.eg!=hz) do
ia(ha,hz)
end
end
ha.fg-=1
if(ha.fg<=0 and not ha.ek) ha.ei(ha) ha.fg=ha.eh*2
yield()
end
hq(5,false)
y=2
ev(self)
end)
end
function dr(ha,bx,by,ib,ic)
for dt=1,ic or 64 do
for eb=bx-dt,bx+dt do
for ec=by-dt,by+dt do
if((eb==bx-dt or eb==bx+dt or ec==by-dt or ec==by+dt) and(ib(ha,eb,ec))) return eb,ec
end
end
yield()
end
end
function ds(ha,bx,by)
return not fget(mget(bx,by),0)
and ba[bx..","..by]==nil
end
function ho(ha,bx,by)
local en=z[ba[bx..","..by]]
if(en!=id and en.cw!=ha.cw) hr(ha,en) return true
end
function hv(ha,bx,by,ie)
::restart_move_unit::
ha.ig="init"
if not ds(nil,bx,by) then
bx,by=dr(ha,bx,by,ds)
end
ha.hs=bx
ha.ht=by
ha.ih=ha.ej
ha.ej=1
ha.ig=ii(
{bx=flr(ha.bx/8),by=flr(ha.by/8)},
{bx=ha.hs,by=ha.ht},
ij,
ik,
il,
function(im) return shl(im.by,8)+im.bx end,
nil)
ha.ih=ha.ej
ha.ej=2
ha.ej=2
if ha.ig!=nil then
for cl=#ha.ig-1,1,-1 do
local im=ha.ig[cl]
if not ha.ef then
local ep=ha.bx-(im.bx*8)
local eq=ha.by-(im.by*8)
local hz=atan2(ep,eq)
while(ha.eg!=hz) do
ia(ha,hz)
end
end
if(not ds(nil,bx,by)) goto io
local ip=ha.iq or .5
local ir=sqrt((im.bx*8-ha.bx)^2+(im.by*8-ha.by)^2)
local is=ip*(im.bx*8-ha.bx)/ir
local it=ip*(im.by*8-ha.by)/ir
for cl=0,ir/ip-1 do
ha.bx+=is
ha.by+=it
yield()
end
ha.bx,ha.by=im.bx*8,im.by*8
eu(ha)
local er=dt(ha.bx,ha.by,ha.hs*8,ha.ht*8)
if er<=(ie or 0) then
break
end
end
end
ha.ej=0
end
function hi()
for gy,ha in pairs(z) do
iu(ha)
end
for gy,gz in pairs(bb) do
iu(gz)
iu(gz.bn)
end
end
function iu(fa)
if fa then
if fa.dk and costatus(fa.dk)!='dead'then
iv(coresume(fa.dk,fa))
else
fa.dk=nil
end
end
end
function gk()
end
function gn()
cls"15"
camera(k,l)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for gy,gz in pairs(bb) do
gz:ft()
gz:cj()
if(gz==q) then
rect(q.bx,q.by,
q.bx+q.bz-1,q.by+q.ca-1,
7)
end
end
palt(11,true)
for gy,ha in pairs(z) do
ha:ft()
ha:cj()
if(ha==q) then
palt(11,true)
spr(16,q.bx,q.by)
end
end
iw()
gr()
end
function ix()
local ge=31
local bx,by=93,93
rectfill(bx-1,by-1,bx+ge+1,by+ge+1,e)
if(v) s=true
rectfill(bx,by,bx+ge,by+ge,0)
if s!=u then
w=1
iy=1
sfx(55)
end
u=s
if w>0 and w<60 then
w+=iy
clip(
max(bx+(ge/2)-w,bx),
max(by+(ge/2)-(w>20 and w-20 or 0),by),
min(w*2,ge),
min((w>20 and w-20 or 1)*2,ge))
for cl=1,300 do
pset(bx+rnd(ge),by+rnd(ge),5+rnd(3))
end
return
end
for eb=0,ge do
for ec=0,ge do
if(x[eb..","..ec]) pset(bx+eb,by+ec,x[eb..","..ec])
end
end
local hx=bx+k/16
local hy=by+l/16
rect(hx,hy,hx+7,hy+7,7)
end
function go()
camera(0,0)
pal()
palt(0,false)
if q and q.dc then
q.dc:fz(109,20)
q.dc:cj()
if q.bn and q.cw==1 then
q.bn:fz(109,44)
q.bn:cj()
end
end
gp("00"..flr(f),103,2,7)
if q
and q.bn
and q.bn.dn.type==2
and q.bn.dd>=100 then
local iz=flr((cursor.bx+k)/8)
local ja=flr((cursor.by+l)/8)
local jb=iz*8-k
local jc=ja*8-l
jd=false
je=false
de=false
local bz=q.bn.dn.bz
local ca=q.bn.dn.ca
for eb=-1,bz do
for ec=-1,ca do
if eb==-1 or eb==bz or ec==-1 or ec==ca then
if(mget(iz+eb,ja+ec)>=63) jd=true
else
local fo=mget(iz+eb,ja+ec)
if(fo>=9 and fo<=15) de=true
if(ba[iz+eb..","..ja+ec] or fo==0 or fo<8 or fo>15) je=true
end
end
end
if(je) jd=false
fillp("0b1110110110110111.1")
rectfill(jb,jc,
jb+q.bn.bz,jc+q.bn.ca,jd and 11 or 8)
fillp()
end
ix()
if bm then
jf(121,73,e,d)
if q.bj then
rectfill(6,30,27,97,0)
for cl=1,#q.bj do
local jg=q.bj[cl]
if cl>=bg and cl<=bg+2 then
jg:fz(9,32+((cl-bg)*19))
jg:cj()
else
jg:fz(-16,16)
end
if(bh==jg) then
bl=cl
rect(jg.bx-2,jg.by-2,
jg.bx+17,jg.by+17,
7)
print(bh.jh,30,31,7)
print("cOST:"..bh.dj,85,38,9)
ji=0
local jj=jk(bh.jl,23)
for gq in all(jj) do
print(gq,30,44+ji,6)
ji+=6
end
end
end
end
for gy,jm in pairs(bc) do
jm:cj()
end
end
palt(11,true)
cursor:cj()
end
function jf(bz,ca,jn,jo)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-bz/2,64-ca/2,64+bz/2,64+ca/2,jn)
rect(64-bz/2+1,64-ca/2+1,64+bz/2-1,64+ca/2-1,jo)
end
function bk(bx,by,jp,bp,ey)
local fa={
bx=bx,
by=by,
bz=ey or#jp*4+2,
ca=8,
jp=jp,
ch=function(self)
return{
bx=self.bx,
by=self.by,
bz=self.bz,
ca=self.ca
}
end,
cj=function(self)
if(#jp>1) rectfill(self.bx,self.by,self.bx+self.bz,self.by+self.ca,7)
if(#jp>1) rectfill(self.bx+1,self.by+1,self.bx+self.bz-1,self.by+self.ca-1,self.jq and 12 or 6)
print(self.jp,self.bx+2,self.by+2,(#jp>1) and 0 or(self.jq and 12 or 7))
if(b) fs(self)
end,
bp=bp
}
add(bc,fa)
end
function jk(jr,js)
local jt={}
local ju=""
local jv=""
local jw=""
local jx=function(jy)
if#jv+#ju>jy then
add(jt,ju)
ju=""
end
ju=ju..jv
jv=""
end
for cl=1,#jr do
jw=sub(jr,cl,cl)
jv=jv..jw
if jw==" "
or#jv>js-1 then
jx(js)
elseif#jv>js-1 then
jv=jv.."-"
jx(js)
elseif jw==";"then
ju=ju..sub(jv,1,#jv-1)
jv=""
jx(0)
end
end
jx(js)
if ju!=""then
add(jt,ju)
end
return jt
end
function hj()
jz=false
if not bm then
foreach(z,ka)
foreach(bb,ka)
end
if q then
ci=true
if(q.dc and not bm) ka(q.dc)
foreach(q.bj,ka)
foreach(bc,ka)
ci=false
end
if hg
and not bm
and m>93 and m<120
and n>93 and n<120 then
k=min((m-94)*16,400)
l=min((n-94)*16,400)
elseif he then
if jz then
if(not bm and q.bp and q.bi!=nil) q:bp() q=hl return
if(bm and bh.jp and bh.bp) bh:bp()
if(q.cw==1 and q.type==1 and q!=hl) sfx(62)
if(q.cw==2 and hl and hl.type==1 and hl.cw==1) q.fi=10 hr(hl,q) q=nil
else
if q
and q.type==1
and q.cw==1
and(q.dh!=27 or q.ej!=7) then
q.dk=cocreate(function(ha)
hv(ha,flr((k+m)/8),flr((l+n)/8))
ev(ha)
end)
end
if q
and q.bn
and q.bn.dd>=100
and jd then
local dy=flr((cursor.bx+k)/8)
local dz=flr((cursor.by+l)/8)
local co=q.bn.dn
cu(co,dy*8,dz*8,nil,1)
q.bn.dd=0
sfx(61)
end
if(not bm) q=nil
end
end
end
function ka(fa)
fa.jq=kb(cursor,fa)
if he and fa.jq then
if bm then
bh=fa
else
local dy=flr((cursor.bx+k)/8)
local dz=flr((cursor.by+l)/8)
if(fa.type<=2 and gh[dy][dz]!=16) return
if(fa.dh==27 and fa.ej==8) return
if fa.dh==6 and q and q.dh==27 and q.cw==1 then
q.ej=7
q.cv.bv=true
q.dk=cocreate(function(ha)
ha.cv=fa
hv(ha,(fa.bx+16)/8,dz)
ev(ha,9)
end)
return
else
q=fa
end
end
jz=true
end
end
function kc(self,kd)
if(kd==self.ke) return
local hz=self.kf[kd]
self.kg=hz.cg
self.ke=kd
self.kh=1
end
function ki(self)
self.kg-=1
if self.kg<=0 then
self.kh+=1
local hz=self.kf[self.ke]
self.kg=hz.cg
if self.kh>#hz.kj then
self.kh=1
end
self.bw=hz.kj[self.kh]
end
end
function hq(kk,kl)
local km=0x3100
local kn=1
kk*=4
local fo=peek(km+kk+kn)
if((band(fo,128)>0)!=kl) fo=bxor(fo,128)
poke(km+kk+kn,fo)
end
function gp(ko,kp,
kq,fn,
kr)
for eb=-1,1 do
for ec=-1,1 do
print(ko,kp+eb,kq+ec,kr)
end
end
print(ko,kp,kq,fn)
end
function kb(ks,kt)
local ku=ks:ch()
local kv=kt:ch()
if ku.bx<kv.bx+kv.bz and
ku.bx+ku.bz>kv.bx and
ku.by<kv.by+kv.ca and
ku.by+ku.ca>kv.by
then
return true
else
return false
end
end
function fs(fa)
local kw=fa:ch()
rect(kw.bx,kw.by,kw.bx+kw.bz,kw.by+kw.ca,fa.jq and 11 or 8)
end
function kx()
return flr(t())%2==0
end
function cc()
ky=kz(cb,"|","\n")
la={}
for cl=2,#ky-1 do
lb={}
for lc=1,#ky[cl] do
local fo=ky[cl][lc]
if(lc!=2 and lc<24) fo=tonum(fo)
lb[ky[1][lc]]=fo
end
la[tonum(ky[cl][1])]=lb
end
cb=la
end
function kz(ko,er,ld)
local hz={}
local le=0
local lf=''
local lg=''
if ld~=nil then ko=kz(ko,ld) end
while#ko>0 do
if type(ko)=='table'then
lf=ko[1]
add(hz,kz(lf,er))
del(ko,lf)
else
lf=sub(ko,1,1)
ko=sub(ko,2)
if lf==er then
add(hz,lg)
lg=''
else
lg=lg..lf
end
end
end
add(hz,lg)
return hz
end
local lh=0
function fk(gw,gx,bx,by,hz,bz,li,lj)
local lk,ll=cos(hz),sin(hz)
local lm,ln,km,lo
local lp,lq=lk,ll
local gu=shl(0xfff8,(bz-1))
bz*=4
lk*=bz-0.5
ll*=bz-0.5
local lr,lt=ll-lk+bz,-lk-ll+bz
bz=2*bz-1
for lu=0,bz do
lm,ln=lr,lt
for lv=0,bz do
if band(bor(lm,ln),gu)==0 then
local le=sget(gw+lm,gx+ln)
if(le!=li) pset(bx+lu,by+lv,lj or le)
end
lm-=lq
ln+=lp
end
lr+=lp
lt+=lq
end
end
function dt(lw,lx,ly,lz)
return abs(sqrt(((lw-ly)/1000)^2+((lx-lz)/1000)^2)*1000)
end
ma=3.14159
mb=.5*(ma/180)
function ia(ha,mc)
md=mc-ha.eg
if md>0.5 then
md-=1
elseif md<-0.5 then
md+=1
end
if md>mb then
ha.eg+=mb
elseif md<-mb then
ha.eg-=mb
else
ha.eg=mc
end
if(ha.eg>ma) ha.eg-=2*ma
if(ha.eg<-ma) ha.eg+=2*ma
yield()
end
function ik(me,im,mf)
local mg=fget(mget(im.bx,im.by),1) and 4 or 1
if(me.bx!=im.bx and me.by!=im.by) return mg+1
return mg
end
function il(im,mf)
local mh={}
for eb=-1,1 do
for ec=-1,1 do
if(eb!=0 or ec!=0) mi(im.bx+eb,im.by+ec,mh)
end
end return mh
end
function mi(mj,mk,ml)
if(
not fget(mget(mj,mk),0)
and ba[mj..","..mk]==nil
and mj>=0
and mk>=0
and mj<=63
and mk<=63
)
then
add(ml,{bx=mj,by=mk})
end
end
function ij(hz,mm)
return abs(hz.bx-mm.bx)+abs(hz.by-mm.by)
end
function ii
(mn,
mo,
mp,
mq,
mh,
mr,
mf)
local ms,
mt={
mu=mn,
mv=0,
mw=mp(mn,mo,mf)
},{}
mt[mr(mn,mf)]=ms
local mx,my,mz,na={ms},1,mr(mo,mf),32767.99
while my>0 do
local dj,nb=na
for cl=1,my do
local nc=mx[cl].mv+mx[cl].mw
if(nc<=dj) nb,dj=cl,nc
end
ms=mx[nb]
mx[nb],ms.nd=mx[my],true
my-=1
local ne=ms.mu
if mr(ne,mf)==mz then
ne={mo}
while ms.nf do
ms=mt[mr(ms.nf,mf)]
add(ne,ms.mu)
end
return ne
end
for ng in all(mh(ne,mf)) do
local dh=mr(ng,mf)
local nh,ni=
mt[dh],
ms.mv+mq(ne,ng,mf)
if not nh then
nh={
mu=ng,
mv=na,
mw=mp(ng,mo,mf)
}
my+=1
mx[my],mt[dh]=nh,nh
end
if not nh.nd and nh.mv>ni then
nh.mv,nh.nf=ni,ne
end
end
count+=1
if count>10 then
count=1
yield()
end
end
end
nj={}
function fr(bx,by,eg,ep,eq,nk,nl,dd,nm,kk)
local ne={
bx=bx,by=by,eg=eg,ep=ep,eq=eq,nk=nk,
dd=0,nl=nl or 0.0625,
nm=nm or{7,6,5},kk=kk or 0,
nn=by,no=dd or 8
}
add(nj,ne)
end
function hk()
for gb,ne in pairs(nj) do
ne.eq+=ne.nl
ne.bx+=ne.ep
ne.by+=ne.eq
ne.eg+=ne.nk
ne.dd+=1
if(ne.dd>=ne.no) del(nj,ne)
end
end
function iw()
for gb,ne in pairs(nj) do
local fn=flr((#ne.nm/ne.no)*ne.dd)+1
if(ne.kk) fillp(ne.kk)
circfill(ne.bx,ne.by,ne.eg,ne.nm[fn])
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
12121200000000161616163d4b0a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616000a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d0a420a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000440a0a0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012121200001600000a0a0a0e0000121200650a0a00000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000d010a00001244090c0a0a0a0000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200163400000a0a0c0012000a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001200161600600a0d620a0e000d0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016000a0a000a0a0a00000917191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000000000000000490a0000091d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000d0a0000000d0d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000003235363535353635333536353200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212003235363535353635333536353200000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000003000000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0e0047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200003500000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000000000009171818190a0a0a490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000032000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000036000d0a4d0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1616160000000000000000090a650a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

