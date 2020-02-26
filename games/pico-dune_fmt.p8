pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
cartdata("pn_undune2")
b,c,d,e=dget"0",dget"1",dget"2",dget"3"
f={
shr(dget(6),16),
shr(500,16),
shr(dget(7),16),
}
g,i,j,k=dget"20",dget"21",dget"22",dget"23"
l,m,n,o,p,q,r,s,u={},{},{},{},{},{},{},{},{}
v,x,y,z,ba,bb,bc,bd=t(),0,{0,0},{0,0},0,0,false,0
be=bc
l.factory_click=function(self)
bf,bg,bh=1,self.bi.bj[1],{}
bk(6,84,"⬆️",function(self)
bl=mid(1,bl-1,#bm.bn)
bg=bm.bn[bl]
if(bl<bf) bf-=1
end,10)
bk(17,84,"⬇️",function(self)
local bo=#bm.bn
bl=mid(1,bl+1,bo)
bg=bm.bn[bl]
bf=mid(bf+1,bo-2)
if(bl>bf+2) bf=min(bf+1,bo-2)
end,10)
bk(32,83,"build",function(self)
bp=nil
bm.bq=br
br:func_onclick()
end)
bk(96,83,"close",function(self)
bp=nil
end)
bp=self
end
l.init_windtrap=function(self)
self.bs=11
self.bt={12,12,12,12,13,1,1,1,1,13}
end
l.init_refinery=function(self)
self.bt={11,10,8}
end
l.draw_refinery=function(self)
pal(11,self.bu)
pal(10,self.bu)
pal(8,self.bu)
if self.bv then
pal(self.bt[self.bw],self.bx)
else
pal(11,self.bx)
self.bw=1
end
spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
l.draw_repair=function(self)
if(flr(t())%2==0) pal(7,bm.ca==2 and 11 or 8)
spr(self.obj_spr,self.by,self.bz)
pal()
end
l.repair_click=function(self)
cb(cc,2)
end
function cb(self,ce)
self.cf=0
self.cg=self.ca
if(self.ch>0 and self.cg>0) self.ci=not self.ci
self.ca=ce
end
cj=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|parent2_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170||2|2|2|nil|nil||nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162||2|2|2|nil|1||1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160||2|1|1|nil|1||1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164||2|1|1|nil|1||7|4||50|0|0|200|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|172||2|2|2|nil|1||1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174||2|3|2|nil|1||2|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136||2|2|2|nil|1||2|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134||2|2|2|nil|1||6|2||150|5|0|600|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|108|168||2|2|2|nil|1||7|2||300|10|0|1200|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138||2|2|2|nil|1||7|2||400|10|0|1600|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1||6|2||400|20|0|1400|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1||6|3||600|20|0|800|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1||12|5||500|35|0|1600|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230||2|3|2|nil|1||12|5|99|700|20|0|800|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|77|232||1|1|1|11|1||7|5||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|93|234||1|1|1|11|1||7|6||250|20|112|1200|0|9|2||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT|58|228||2|3|3|nil|1||6|6||500|50|0|2000|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224||2|2|2|nil|1||12|5||500|40|0|1600|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE|55|226||2|3|3|nil|1||17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||factory_click
20|lIGHT iNFANTRY (X3)|62|236||1|1|1|11|9||9|2|-3|60||4|200|0.05|2|1|1|63|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|62|194||1|1|1|11|10||9|3|-1|100||8|440|0.1|3|1|1|63|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11|17||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD|48|206||1|1|1|11|11|17||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|17|7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|17|7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|17|7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12|17||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL|61|238||1|1|1|11|13||13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13||13|7|-3|600||75|20|1.5|5|2||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12||7|4|99|900||0|600|0|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12||7|7|1|600||90|440|0.3|8|11||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19|||8|1|0||8|880|0.1|3|1||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12||13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||13|8|3|0||150|280|2.5|nil|20||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER|54|204||1|1|1|11|11|||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12||13|7|2|750||0|480|0.3|7|11||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19|||8|2|0||150|160|0.4|2|||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
38|sARDAUKAR||||1|1|1|11|nil||nil|4||0||5|440|0.1|1|||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM|94|||9|1|1|11|nil||nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|11|nil||nil|||||||||||||||draw_repair||repair_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
ck()
cl=cm(cj[80],109,-20,5,{},nil,l.draw_repair,l.repair_click)
cn()
cursor={
w=8,
h=8,
co=function(self)
return{
by=self.by+(not cp and cq or 0)+2,
bz=self.bz+(not cp and cr or 0)+1,
w=1,
h=1
}
end,
cs=function(self)
spr((bm and(bm.type==1 and bm.ct==1)) and 1 or self.obj_spr,
self.by,self.bz,self.w/8,self.h/8)
end
}
cu()
music"7"
cv=0
cw()
end
function cw()
cx={{64,127}}
cy=0
cz=0
da={15,9,4}
end
function cu()
for db=1,2 do
for dc=0,31 do
for dd=0,127 do
local de=nil
local df=mget(dd,dc)
local dg=fget(df)
if db==1 and df==1 then
dh,di=dd*8,dc*8
cq,cr=dh-56,di-56
de=cj[1]
elseif db==2
and df>=48 then
for dj in all(
cj) do
if(dj.obj_spr!=nil and dj.obj_spr==df) de=dj break
end
end
if de!=nil then
local dk,dl=dd,dc
if(dk>63) dl+=31 dk-=64
dm(de,dk*8,dl*8)
if(de.type==1 and de.speed>0) mset(dd,dc,0)
end
end
end
end
end
function dm(de,by,bz,ct,dn)
local dp=cm(de,by,bz,de.type,nil,l[de.func_init],l[de.func_draw],l[de.func_update],nil)
dp.dq=cm(de,109,0,3,dp,nil,nil,l[de.func_onclick])
dp.ch=dr and de.hitpoint/2 or de.hitpoint
dp.bj={}
for dj in all(cj) do
local ds=dj.req_faction
if(dj.parent_id!=nil and(dj.parent_id==dp.id or dj.dt==dp.id))
and(ds==nil
or(ds>0 and dj.req_faction==c)
or(ds<0 and-c!=ds))
then
add(dp.bj,
cm(dj,109,0,4,dp,nil,nil,function(self)
if bp then
bm=self
else
cb(self,1)
end
end)
)
dp.bq=dp.bj[1]
end
end
dp.ct=ct or(du(by,bz,dh,di)<75 and 1 or 2)
if dp.ct==1 then
dp.dv=c
dp.bx=d
dp.bu=e
q[dp.id]=true
else
dp.dv=g
dp.bx=i
dp.bu=j
dp.dq.func_onclick=nil
end
local dw=flr(by/8)
local dx=flr(bz/8)
if de.type==2 then
dp.dy=53
local dz=(de.id==2 or de.id==3)
for ea=0,de.w-1 do
for eb=0,de.h-1 do
ec(dw+ea,dx+eb,dz and 16 or 149)
end
end
if(not dz) add(m,dp)
if dp.id==6 and dp.bi==nil then
p[dp.ct]=dp
local ed,ee=ef(dp,(dp.by+32)/8,(dp.bz+8)/8,eg)
dm(cj[27],ed*8,ee*8,nil,dp)
end
end
if de.type==1 then
dp.dy=54
if(dp.norotate!=1) dp.eh=flr(rnd"8")*.125
if dp.arms>0 then
dp.ei=function(self)
self.ej=4
self.ek=self.by+4
self.el=self.bz+4
self.em=self.en.by+self.en.w/2
self.eo=self.en.bz+self.en.h/2
local ep=self.em-self.ek
local eq=self.eo-self.el
local er=sqrt(ep*ep+eq*eq)
self.es=(ep/er)*2
self.et=(eq/er)*2
sfx(self.arms<100 and 60 or 58,3)
eu(self)
end
if dp.id==15 or dp.id==16 then
ec(dw,dx,149)
end
else
if(dp.id==27) dp.ev=0 dp.ew=p[dp.ct]
end
add(n,dp)
ex(dp)
end
eu(dp)
return dp
end
function cm(ey,by,bz,ez,bi,func_init,func_draw,func_onclick)
local fa=(ey.w or 1)*8
local fb=(ey.h or 1)*8
local fc={
fd=ey,
id=ey.id,
hitpoint=ey.hitpoint,
by=by,
bz=bz,
fe=1,
type=ez,
bi=bi,
func_onclick=func_onclick,
w=fa,
h=fb,
ff=ey.obj_spr,
fg=ey.w or 1,
fh=ey.h or 1,
ch=0,
fi=0,
ca=0,
fj=0,
fk=0,
fl=0,
fm=1,
bw=1,
co=function(self)
return{
by=self.by,
bz=self.bz,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cs=func_draw or function(self)
if self.type<=2
and(self.by+self.w<cq
or self.by>cq+127
or self.bz+self.h<cr
or self.bz>cr+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dv and self.id!=18) pal(12,self.bx) pal(14,self.bu)
if self.bt then
pal(self.bs,self.bt[self.bw])
end
if self.eh then
if not self.fn or self.fn>.025 then
if(self.speed>0) fo(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz+1,.25-self.eh,1,self.trans_col,5)
fo(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz,.25-self.eh,1,self.trans_col,flr(self.fm)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.by-1,self.bz-1,self.by+16,self.bz+19,0)
local fp=self.type==4 and self or self.bi
local fq=fp.hitpoint
local fr=self.ca==1 and 12 or(fp.ch<fq*.33 and 8 or fp.ch<fq*.66 and 10 or 11)
local fs=self.ca==1 and(15*(fp.ch/100)) or(15*(fp.ch/fq))
if(fp.ch>0 and not bp) rectfill(self.by,self.bz+17,self.by+fs,self.bz+18,fr)
end
if self.type>2 then
spr(self.ico_spr,self.by,self.bz,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
end
if self.ek then
if(self.fire_type==1) then
circfill(self.ek,self.el,0,rnd"2"<1 and 8 or 9)
else
ft(self.ek,self.el,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.ch<self.hitpoint*.33 and rnd"10"<1) ft(self.by+3.5,self.bz+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fl=0
end,
fu=function(self)
self.fm=max(self.fm-.4,1)
if self.fl>0 then
fv(5,true)
if(fw==0 or stat(24)>5) fw=1 music"0"
if(self.arms>0 and self.ej==0) fx(self,self.fy)
end
if(self.type<=2 and self.ch<=0 and self.fn==nil) self.ej=5 self.fz=nil self.fn=(self.type==2 and 1 or .5) sfx(self.dy,3) cv+=(self.type==2 and 0.25 or 0)
if self.fn then
self.fn-=.025
if self.fn<=0 then
if self.type==2 then
for ea=0,self.fg-1 do
for eb=0,self.fh-1 do
ec(self.by/8+ea,self.bz/8+eb,15)
end
end
del(m,self)
y[self.fy.ct]+=1
else
local ga,gb=flr(self.by/8),flr(self.bz/8)
if(gb>31) ga+=64 gb-=32
if(gc(ga,gb)<9) ec(ga,gb,20)
if(self.speed==0) ec(ga,gb,15)
del(n,self)
z[self.fy.ct]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gd(self.by+rnd(self.w),self.bz+rnd(self.h))
end
end
if self.framecount!=nil then
self.fi+=1
if(self.fi>self.framecount) then
self.fi=0
if self.altframe
and self.ej==2 then
self.obj_spr=self.ff+(self.altframe-self.obj_spr)
end
if self.bt then
self.bw+=1
if(self.bw>#self.bt) self.bw=1
end
end
end
if self.ek then
self.ek+=self.es
self.el+=self.et
if du(
self.ek,self.el,
self.em,self.eo)<2
then
gd(self.ek,self.el,self.fire_type)
local en=self.en
if du(
self.ek,self.el,
en.by+en.w/2,
en.bz+en.h/2)<4
then
en.ch-=self.arms
en.fl=self.fire_type
en.fy=self
end
self.ek=nil
end
end
if self.ca>0
and not self.ci
and not self.ge then
if self.ca==1 and self.fj>self.cost then
self.ge=true
sfx"56"
if self.fd.type==1
and self.id!=15
and self.id!=16 then
local ed,ee=ef(self,(self.bi.by+8)/8,(self.bi.bz+16)/8,eg)
dm(self.fd,ed*8,ee*8,nil,self.bi)
gf(self)
end
elseif self.ca==2 and self.ch>self.hitpoint then
self.ca=0
else
self.cf+=1
self.ch=(self.ca==1 and(self.fj/self.cost)*100 or self.ch+.5)
if(self.cf>(self.ca==1 and 3 or 100) and gg(-1,self.ca==1 and self.bi or self)) self.cf=0 self.fj+=1
end
end
end,
gh=function(self,by,bz)
self.by=by
self.bz=bz
end,
gi=function(self)
return flr(self.by/8)..","..flr(self.bz/8)
end
}
for gj,gk in pairs(ey) do
if fc[gj]==nil and gk!=""then
fc[gj]=gk
end
end
if(func_init) func_init(fc)
return fc
end
function gg(gl,fc)
if(gm(f[fc.ct])+gl<0) return false
f[fc.ct]+=sgn(gl)*shr(abs(gl),16)
if(fc.ct==1) sfx"63"
return true
end
function gd(by,bz,gn)
ft(by,bz,2,
0,0,.1,0,gn==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function eu(go)
if(go.ct!=1 and go.ej!=4) return
local gp=go.type==2 and 3 or 2
for ea=-gp,gp do
for eb=-gp,gp do
local gq=flr(go.by/8)+ea
local gr=flr(go.bz/8)+eb
gs[gq][gr]=16
gt(gq,gr)
for eq=-1,1 do
for ep=-1,1 do
gt(gq+ep,gr+eq)
end
end
end
end
end
function _update60()
gu()
gv()
if(t()%1==0) gw()
if(t()%1==0 and t()%2==0) gx()
x+=1
end
function _draw()
gy()
gz()
if(a) ha("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cn()
gs={}
for db=-2,66 do
gs[db]={}
for hb=-2,66 do
gs[db][hb]=0
end
end
end
function hc()
local hd=flr(cq/8)
local he=flr(cr/8)
palt(11,true)
for ea=hd-1,hd+16 do
for eb=he-1,he+16 do
if gs[ea][eb]!=0 and gs[ea][eb]!=16 then
spr(gs[ea][eb]+31,ea*8,eb*8)
elseif gs[ea][eb]<16 then
rectfill(ea*8,eb*8,ea*8+7,eb*8+7,0)
end
end
end
end
function gt(by,bz)
if(by<0 or by>#gs or bz<0 or bz>#gs) return
local hf=0
if gs[by][bz]!=0 then
if(gs[by][bz-1]>0) hf+=1
if(gs[by-1][bz]>0) hf+=2
if(gs[by+1][bz]>0) hf+=4
if(gs[by][bz+1]>0) hf+=8
gs[by][bz]=1+hf
end
end
function gx()
r={}
if bc then
for db=0,124,4 do
for hb=0,124,4 do
local dd=db/2
local dc=hb/2
if(dc>=32) dd+=64 dc-=32
local hg=mget(dd,dc)
local hh=(hg*8)%128
local hi=(hg*8)/16
local fr=sget(hh+4,hi)
if(gs[db/2][hb/2]==16) r[((db/2)/2)..","..((hb/2)/2)]=fr!=11 and fr or 15
end
end
end
hj=0
hk=0
hl=false
hm={0,0}
for hn,ho in pairs(m) do
local gq=flr(ho.by/8)
local gr=flr(ho.bz/8)
if ho.ct==1 or(bc and gs[gq][gr]==16) then
r[flr(ho.by/2/8)..","..flr(ho.bz/2/8)]=ho.bx
end
if(ho.ct==1) then
hj-=ho.fd.power
if(ho.id==7) hl=true
if(sub(ho.name,1,5)=="sPICE") hk+=1000
end
hm[ho.ct]+=1
end
if bc then
for hn,hp in pairs(n) do
if hp.ct==1 or gs[flr(hp.by/8)][flr(hp.bz/8)]==16 then
r[flr(hp.by/2/8)..","..flr(hp.bz/2/8)]=hp.bx
end
end
end
bc=(hl and hj>0)
fv(5,false)
fw=2
if(f[3]>0 and f[1]>f[3]) hq=1
if(hm[2]==0 and b>1) hq=2
if(hm[1]==0) hq=3
if hq then
dset(14,hq)
dset(13,t()-v)
dset(10,hr)
dset(24,gm(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
ha("mission "..(hq<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gw()
o={}
for gj,hp in pairs(n) do
o[flr(hp.by/8)..","..flr(hp.bz/8)]=gj
end
end
function gu()
hs,ht,hu=stat"32",stat"33",stat"34"
hv=(hu==1 and hw!=hu) or btnp"4"
hx=(hu>0) or btn"4"
hy=(hu==2 and hw!=hu) or btnp"5"
for gj=0,1 do
if(btn(gj)) ba+=gj*2-1
if(btn(gj+2)) bb+=gj*2-1
end
hz=mid(0,hs+ba,127)
ia=mid(0,ht+bb,127)
cursor.by=hz
cursor.bz=ia
if not bp then
if(hz<4) cq-=2
if(hz>123) cq+=2
if(ia<4) cr-=2
if(ia>123) cr+=2
cq=mid(cq,384)
cr=mid(cr,384)
for hn,hp in pairs(n) do
if hp then
if hp.fz and costatus(hp.fz)!='dead'then
assert(coresume(hp.fz,hp))
else
hp.fz=nil
end
if#cx>0
and fget(gc(flr(hp.by/8),flr(hp.bz/8)),2)
and du(cx[#cx][1]-4,cx[#cx][2]-4,hp.by,hp.bz)<1
then
printh("yum yum!!!")
del(n,hp)
end
end
end
ib()
end
ic()
hw,cc,br=hu,bm,bg
end
function ie(by,bz)
local fs=gc(by,bz)
return fs>=2 and fs<=8
end
function ex(hp,ig)
hp.ej=ig or 0
hp.fz=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) ef(self,flr(self.by/8),flr(self.bz/8),ih,self.range)
local ew=self.ew
if self.id==27 then
if self.ej==0 or self.ej==7 or self.ej==9 then
if self.ev<=1500
and self.ej!=7 and self.ej!=9 then
local hh,hi
local ii,ij=flr(self.by/8),flr(self.bz/8)
if ie(ii,ij) and not self.ik then
hh,hi=ii,ij
else
ef(self,ii,ij,
function(hp,by,bz)
if ie(by,bz) and rnd"10"<1 then
hh,hi=by,bz
return true
end
end,
10)
end
if hh and hi then
il(hp,hh,hi)
if(ie(flr(hp.by/8),flr(hp.bz/8))) hp.ej=6
end
elseif self.ej==9 then
if not ew.im then
ew.bv=false
ew.im=true
while self.ev>0 do
self.ej=8
self.eh=.25
self.by=ew.by+16
self.bz=ew.bz+4
self.ev-=1
if(bm==self) bm=nil
if(flr(self.ev)%4==0 and tonum(hr)<hk) gg(2,self)
yield()
end
self.ev=0
ew.im=false
self.ej=0
end
end
elseif self.ev>=1500
and self.ej!=7 then
self.ej=7
ew.bv=true
il(self,(ew.by+16)/8,ew.bz/8)
self.ej=9
elseif self.ej==6 then
self.ik=false
local eh=hp.eh+.75+rnd".2"-.1
local io,ip=sin(eh)*5.5,-cos(eh)*5.5
if(rnd"5"<1) ft(hp.by+io+3.5,hp.bz+ip+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
local iq=hp:gi()
s[iq]=(s[iq] or 10000)-1
self.ev=(self.ev or 0)+.5
if s[iq]<=0 then
local dw=flr(self.by/8)
local dx=flr(self.bz/8)
for eb=-1,1 do
for ea=-1,1 do
fs=gc(dw+ea,dx+eb)
ec(dw+ea,dx+eb,
(ea==0 and eb==0) and 0 or((fs>1 and fs<8) and 8 or fs)
)
end
end
self.ej=0
end
if(self.ev%300==0) self.ik=true self.ej=0
end
end
yield()
end
end)
end
function fx(hp,en)
hp.ej=3
hp.en=en
hp.fz=cocreate(function(self)
while en.ch>0 do
local ir=du(hp.by,hp.bz,en.by,en.bz)
if ir>hp.range*5
and hp.speed>0 then
il(hp,flr(en.by/8),flr(en.bz/8),hp.range*5)
end
if not hp.norotate then
local is=atan2(hp.by-en.by,hp.bz-en.bz)
while(hp.eh!=is) do
it(hp,is)
end
end
if(ir<=hp.range*5) then
hp.fk-=1
if(hp.fk<=0 and not hp.ek) hp.ei(hp) hp.fk=hp.arms*4
elseif hp.speed==0 then
ex(hp)
end
yield()
end
ex(self)
end)
end
function ef(hp,by,bz,iu,iv)
for du=1,iv or 64 do
for ea=by-du,by+du do
for eb=bz-du,bz+du do
if((ea==by-du or ea==by+du or eb==bz-du or eb==bz+du) and(iu(hp,ea,eb))) return ea,eb
end
end
yield()
end
end
function gc(dd,dc)
if(dc>31) dd+=64 dc-=32
return mget(dd,dc)
end
function ec(dd,dc,iw)
if(dc>31) dd+=64 dc-=32
mset(dd,dc,iw)
end
function eg(hp,by,bz)
return not fget(gc(by,bz),0)
and o[by..","..bz]==nil
end
function ih(hp,by,bz)
local en=n[o[by..","..bz]]
if(en!=ix and en.ct!=hp.ct and gs[by][bz]==16) fx(hp,en) return true
end
function il(hp,by,bz,iy)
::restart_move_unit::
hp.iz="init"
if not eg(nil,by,bz) then
by,bz=ef(hp,by,bz,eg)
end
hp.ii=by
hp.ij=bz
hp.ja=hp.ej
hp.ej=1
hp.iz=jb(
{by=flr(hp.by/8),bz=flr(hp.bz/8)},
{by=hp.ii,bz=hp.ij},
jc,
jd,
je,
function(jf) return shl(jf.bz,8)+jf.by end,
nil)
hp.ja=hp.ej
hp.ej=2
hp.ej=2
if hp.iz!=nil then
for db=#hp.iz-1,1,-1 do
local jf=hp.iz[db]
if not hp.norotate then
local is=atan2(
hp.by-(jf.by*8),
hp.bz-(jf.bz*8))
while(hp.eh!=is) do
it(hp,is)
end
end
if(not eg(nil,jf.by,jf.bz)) goto restart_move_unit
local jg=hp.speed or .5
local jh=sqrt((jf.by*8-hp.by)^2+(jf.bz*8-hp.bz)^2)
local ji=jg*(jf.by*8-hp.by)/jh
local jj=jg*(jf.bz*8-hp.bz)/jh
for db=0,jh/jg-1 do
o[jf.by..","..jf.bz]=hp
hp.by+=ji
hp.bz+=jj
yield()
end
hp.by,hp.bz=jf.by*8,jf.bz*8
o[jf.by..","..jf.bz]=hp
eu(hp)
if(du(hp.by,hp.bz,hp.ii*8,hp.ij*8)<=(iy or 0)) break
end
end
hp.ej=0
end
function gv()
if(t()>k and t()%k*2==0) then
local jk=n[flr(rnd(#n))+1]
if jk.ct==2 and jk.arms>0 and jk.ej==0 then
local jl=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if jl and jl.ct==1 then
printh(">>> attack!")
fx(jk,jl)
end
end
end
if x%6<1 then
if(rnd(9)<.5) cz=rnd(.04)-.02
add(cx,{cx[#cx][1]+sin(cy),cx[#cx][2]-cos(cy)})
cy+=cz
end
if(#cx>33) del(cx,cx[1])
end
function gy()
cls"15"
camera(cq+(16-rnd(32))*cv,cr+(16-rnd(32))*cv)
cv=(cv>0.05) and cv*0.95 or 0
if(rnd()<.5) fillp(0xa5a5.8)
for db=1,#cx do
circfill(
cx[db][1],
cx[db][2],4,
da[db%#da+1])
end
fillp()
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hn,ho in pairs(m) do
if not bp then
ho:fu()
if(ho.bq) ho.bq:fu()
end
ho:cs()
if(ho==bm) then
rect(bm.by,bm.bz,
bm.by+bm.w-1,bm.bz+bm.h-1,
7)
end
end
for hn,hp in pairs(n) do
if(not bp) hp:fu()
hp:cs()
if(hp==bm) then
palt(11,true)
spr(17,bm.by,bm.bz)
end
end
jm()
hc()
end
function jn()
local gp=31
rect(92,92,125,125,e)
rectfill(93,93,124,124,0)
if bc!=be then
bd=bc and 1 or 59
jo=bc and 1 or-1
sfx(55)
gx()
end
be=bc
if bd>0 and bd<60 then
bd+=jo
clip(
max(108-bd,94),
max(108-(bd>20 and bd-20 or 0),94),
min(bd*2,31),
min((bd>20 and bd-20 or 1)*2,31))
for db=1,300 do
pset(93+rnd"31",93+rnd"31",5+rnd"3")
end
clip()
return
end
for ea=0,31 do
for eb=0,31 do
if(r[ea..","..eb]) pset(93+ea,93+eb,r[ea..","..eb])
end
end
local io=93+cq/16
local ip=93+cr/16
rect(io,ip,io+7,ip+7,7)
end
function gz()
camera(0,0)
pal()
palt(0,false)
if bm and bm.dq then
bm.dq:gh(109,20)
bm.dq:cs()
if bm.bq and bm.ct==1 then
bm.bq:gh(109,44)
bm.bq:cs()
end
if bm.ch<bm.hitpoint
and bm.ct==1
and bm.id!=4
and(bm.type==2
or bm.id==15
or bm.id==16) then
cl:gh(117,28)
cl:cs()
end
end
hr=gm(f[1])
ha(sub("000000",#hr+1)..hr,103,2,7)
if bm
and bm.bq
and(bm.bq.type==4
or bm.bq.id==15
or bm.bq.id==16)
and bm.bq.ch>=100 then
local jp=flr((cursor.by+cq)/8)
local jq=flr((cursor.bz+cr)/8)
local jr=jp*8-cq
local js=jq*8-cr
jt=false
ju=false
dr=false
local w=bm.bq.fg
local h=bm.bq.fh
for ea=-1,w do
for eb=-1,h do
if ea==-1 or ea==w or eb==-1 or eb==h then
if(gc(jp+ea,jq+eb)==16 or gc(jp+ea,jq+eb)>=63) jt=true
else
local fs=gc(jp+ea,jq+eb)
if(fs>=9 and fs<=15) dr=true
if(o[jp+ea..","..jq+eb] or fs==0 or fs<8 or fs>16) ju=true
end
end
end
if(ju) jt=false
fillp("0b1110110110110111.1")
rectfill(jr,js,
jr+bm.bq.w,js+bm.bq.h,jt and 11 or 8)
fillp()
end
jn()
if bp then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bm.bj then
bm.bn={}
rectfill(6,25,27,92,0)
local jv=1
for db=1,#bm.bj do
local jw=bm.bj[db]
if jw.req_id==nil
or q[jw.req_id] then
bm.bn[jv]=jw
if jv>=bf and jv<=bf+2 then
jw:gh(9,28+((jv-bf)*19))
jw:cs()
else
jw:gh(-16,16)
end
if(bg==jw) then
bl=jv
rect(jw.by-2,jw.bz-2,
jw.by+17,jw.bz+17,
7)
print(bg.name,30,26,7)
print("cOST:"..bg.cost,85,33,9)
jx=0
for hb in all(jy(bg.description,23)) do
print(hb,30,39+jx,6)
jx+=6
end
end
jv+=1
end
end
end
for hn,jz in pairs(bh) do
jz:cs()
end
end
palt(11,true)
cursor:cs()
end
function bk(by,bz,ka,func_onclick,fa)
add(bh,{
by=by,
bz=bz,
w=fa or#ka*4+2,
h=8,
ka=ka,
co=function(self)
return{
by=self.by,
bz=self.bz,
w=self.w,
h=self.h
}
end,
cs=function(self)
if(#ka>1) rectfill(self.by,self.bz,self.by+self.w,self.bz+self.h,7)
if(#ka>1) rectfill(self.by+1,self.bz+1,self.by+self.w-1,self.bz+self.h-1,self.kb and 12 or 6)
print(self.ka,self.by+2,self.bz+2,(#ka>1) and 0 or(self.kb and 12 or 7))
end,
func_onclick=func_onclick
})
end
function jy(kc,kd)
local ke={}
local kf=""
local kg=""
local kh=""
local ki=function(kj)
if#kg+#kf>kj then
add(ke,kf)
kf=""
end
kf=kf..kg
kg=""
end
for db=1,#kc do
kh=sub(kc,db,db)
kg=kg..kh
if kh==" "
or#kg>kd-1 then
ki(kd)
elseif#kg>kd-1 then
kg=kg.."-"
ki(kd)
elseif kh==";"then
kf=kf..sub(kg,1,#kg-1)
kg=""
ki(0)
end
end
ki(kd)
if kf!=""then
add(ke,kf)
end
return ke
end
function ic()
kk=false
if bm then
cp=true
if(cc.ch and cc.ch<cc.hitpoint) kl(cl)
if(bm.dq and not bp and not kk) kl(bm.dq)
foreach(bm.bj,kl)
if(bp) foreach(bh,kl)
cp=false
end
if not bp
and not kk then
foreach(n,kl)
foreach(m,kl)
end
if hx
and not bp
and hz>89 and hz<122
and ia>90 and ia<123 then
cq=mid(0,(hz-94)*16,400)
cr=mid(0,(ia-94)*16,400)
elseif hv then
if kk then
if(not bp and bm.func_onclick and bm.bi!=nil) bm:func_onclick() bm=cc return
if(bp and bg.ka and bg.func_onclick) bg:func_onclick()
if(bm.ct==1 and bm.type==1 and bm!=cc and bm.speed>0) sfx(62)
if(bm.ct==2 and cc and cc.type==1 and cc.ct==1) bm.fm=10 fx(cc,bm) bm=nil
else
if bm
and bm.type==1
and bm.ct==1
and bm.speed>0
and(bm.id!=27 or bm.ej!=7) then
bm.fz=cocreate(function(hp)
il(hp,flr((cq+hz)/8),flr((cr+ia)/8))
ex(hp)
end)
end
if bm
and bm.bq
and bm.bq.ch>=100
and jt then
local dw=flr((cursor.by+cq)/8)
local dx=flr((cursor.bz+cr)/8)
local de=bm.bq.fd
dm(de,dw*8,dx*8,1)
gf(bm.bq)
sfx"61"
end
if(not bp) bm=nil
end
elseif hy and not bp then
bm=nil
end
end
function gf(fc)
fc.ch=0
fc.ca=0
fc.fj=0
fc.ge=false
end
function kl(fc)
fc.kb=km(cursor,fc)
if hv and fc.kb then
if bp then
bg=fc
else
if(fc.type<=2 and gs[flr((cursor.by+cq)/8)][flr((cursor.bz+cr)/8)]!=16) return
if(fc.id==27 and fc.ej==8) return
if fc.id==6 and bm and bm.id==27 and bm.ct==1 then
bm.ej=7
bm.ew=fc
bm.ew.bv=true
bm.fz=cocreate(function(hp)
il(hp,(fc.by+16)/8,dx)
ex(hp,9)
end)
return
else
bm=fc
end
end
kk=true
end
end
function fv(kn,ko)
kn*=4
local fs=peek(0x3100+kn+1)
if((band(fs,128)>0)!=ko) fs=bxor(fs,128)
poke(0x3100+kn+1,fs)
end
function ha(kp,kq,
kr,fr,
ks)
for ea=-1,1 do
for eb=-1,1 do
print(kp,kq+ea,kr+eb,ks)
end
end
print(kp,kq,kr,fr)
end
function km(kt,ku)
local kv=kt:co()
local kw=ku:co()
return kv.by<kw.by+kw.w and
kv.by+kv.w>kw.by and
kv.bz<kw.bz+kw.h and
kv.bz+kv.h>kw.bz
end
function ck()
kx=ky(cj,"|","\n")
cj={}
for db=2,#kx-1 do
kz={}
for la=1,#kx[db] do
local fs=kx[db][la]
if(la!=2 and la<25) fs=tonum(fs)
kz[kx[1][la]]=fs
end
cj[tonum(kx[db][1])]=kz
end
end
function gm(fs)
local lb=""
local gk=abs(fs)
repeat
lb=(gk%0x0.000a/0x.0001)..lb
gk/=10
until gk==0
if(fs<0) lb="-"..lb
return lb
end
function ky(kp,er,lc)
local is={}
local ld=0
local lb=''
local le=''
if lc~=nil then kp=ky(kp,lc) end
while#kp>0 do
if type(kp)=='table'then
lb=kp[1]
add(is,ky(lb,er))
del(kp,lb)
else
lb=sub(kp,1,1)
kp=sub(kp,2)
if lb==er then
add(is,le)
le=''
else
le=le..lb
end
end
end
add(is,le)
return is
end
local lf=0
function fo(hh,hi,by,bz,is,w,lg,lh)
local li,lj=cos(is),sin(is)
local lk,ll,lm,ln
local lo,lp=li,lj
local hf=shl(0xfff8,(w-1))
w*=4
li*=w-0.5
lj*=w-0.5
local lq,lr=lj-li+w,-li-lj+w
w=2*w-1
for lt=0,w do
lk,ll=lq,lr
for lu=0,w do
if band(bor(lk,ll),hf)==0 then
local ld=sget(hh+lk,hi+ll)
if(ld!=lg) pset(by+lt,bz+lu,lh or ld)
end
lk-=lp
ll+=lo
end
lq+=lo
lr+=lp
end
end
function du(lv,lw,lx,ly)
return abs(sqrt(((lv-lx)/1000)^2+((lw-ly)/1000)^2)*1000)
end
function it(hp,lz)
local ma=3.14159
local mb=0.0087
local gl=lz-hp.eh
if gl>0.5 then
gl-=1
elseif gl<-0.5 then
gl+=1
end
if gl>mb then
hp.eh+=mb
elseif gl<-mb then
hp.eh-=mb
else
hp.eh=lz
end
if(hp.eh>ma) hp.eh-=2*ma
if(hp.eh<-ma) hp.eh+=2*ma
yield()
end
function jd(mc,jf,md)
local me=fget(gc(jf.by,jf.bz),1) and 4 or 1
if(mc.by!=jf.by and mc.bz!=jf.bz) return me+1
return me
end
function je(jf,md)
local mf={}
for ea=-1,1 do
for eb=-1,1 do
if(ea!=0 or eb!=0) mg(jf.by+ea,jf.bz+eb,mf)
end
end
return mf
end
function mg(mh,mi,mj)
if(
not fget(gc(mh,mi),0)
and o[mh..","..mi]==nil
and mh>=0
and mi>=0
and mh<=63
and mi<=63
)
then
add(mj,{by=mh,bz=mi})
end
end
function jc(is,mk)
return abs(is.by-mk.by)+abs(is.bz-mk.bz)
end
function jb
(ml,
mm,
mn,
mo,
mf,
mp,
md)
local mq,
mr={
ms=ml,
mt=0,
mu=mn(ml,mm,md)
},{}
mr[mp(ml,md)]=mq
local mv,mw,mx,my={mq},1,mp(mm,md),32767.99
local count=0
while mw>0 do
local cost,mz=my
for db=1,mw do
local na=mv[db].mt+mv[db].mu
if(na<=cost) mz,cost=db,na
end
mq=mv[mz]
mv[mz],mq.nb=mv[mw],true
mw-=1
local nc=mq.ms
if mp(nc,md)==mx then
nc={mm}
while mq.nd do
mq=mr[mp(mq.nd,md)]
add(nc,mq.ms)
end
return nc
end
for ne in all(mf(nc,md)) do
local id=mp(ne,md)
local nf,ng=
mr[id],
mq.mt+mo(nc,ne,md)
if not nf then
nf={
ms=ne,
mt=my,
mu=mn(ne,mm,md)
}
mw+=1
mv[mw],mr[id]=nf,nf
end
if not nf.nb and nf.mt>ng then
nf.mt,nf.nd=ng,nc
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
function ft(by,bz,eh,ep,eq,nh,ni,ch,nj,kn)
local nc={
by=by,bz=bz,eh=eh,ep=ep,eq=eq,nh=nh,
ch=0,ni=ni or 0.0625,
nj=nj or{7,6,5},kn=kn or 0,
nk=bz,nl=ch or 8
}
add(u,nc)
end
function ib()
for gj,nc in pairs(u) do
nc.eq+=nc.ni
nc.by+=nc.ep
nc.bz+=nc.eq
nc.eh+=nc.nh
nc.ch+=1
if(nc.ch>=nc.nl) del(u,nc)
end
end
function jm()
for gj,nc in pairs(u) do
local fr=flr((#nc.nj/nc.nl)*nc.ch)+1
if(nc.kn) fillp(nc.kn)
circfill(nc.by,nc.bz,nc.eh,nc.nj[fr])
fillp()
end
end
__gfx__
bbbbbbbbbbb1bbbbbbbbbbbb99b99999bbbbbbbbbbbbbbbb9b99b9b9bb9b9999bb9bbbbbb5d555d555d555d55d555d5bbbbbbbbb1d5155555d555d5bdddddddd
bb11bbbbbb171bbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb99b99b999b99899bbbb9bbb1555515d15555155d51555515dbbbd5b5155d55dd5155551d5555555
bb171bbbb1bbb1bbbbbb999999bb99999999bbbbbbbbbbbb9b99b99b9b9989b99bb9bb9b5d55d5515d55d555155d55d5d5155551555d5155155d55d5d5015515
bb1771bb17b1b71bbbb99b9b99999b99b9b99bbbb9bbbb9b999b999999b88899bb999bbb55515d5555515d5d55d51555155d55d5d5555d5555d51555d5105555
bb17771bb1bbb1bbbbbbb9b9bbb999999b9bbbbbbb99b999b9bbbb9b99998b99bb999bbbd55d5555d55555555555d55d55d5155555d155d55555d55dd5555111
bb177771bb171bbbbbbb999999999b999999bbbb999b99b9bbbbbbbbbbb89999b9b9bbb955d551d555d515555d155d555555d55d155555555d155d55d1555101
bb17711bbbb1bbbbbbb99b9b99bbb9b9b9b99bbb9b99b99bbbbbbbbb99999b99bb9bbbbb1555555515555515555555515d155d55b51bbd5b55555551d5555111
bbb11bbbbbbbbbbbbbbb99b9bb9b99999b99bbbbb99b99b9bbbbbbbb99bbb9b9bbbb9bbbb55d5515555d55555155d55b55555551bbbbbbbb5155d55bd5515555
ddddddddb7bbbb7bbbbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
d555555577bbbb77bbb77bbbbbbbbbbbbb66669bbbbbbbbbb6bbbbbb155551551555515515555155155244444444444444444455155024444444444444444055
d5555555bbbbbbbbbb79bb7b0000b000b66dd66bbd5bb5bbbbbbbb6b5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
d5555555bbbbbbbbb79b779b07700077b6d55d6bb5dbbbbbbbbbbbbb555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
d5555555bbbbbbbbbbb799bb00777770b6d55d6bbbbb555bbbbbbbbbd55555555544444444455555d52444444444444444444445d55510022244444222201555
d5555555bbbbbbbbbb799bbb07700077b66dd66bbbbb5d5bbbb6bbbb55d55544444444444444455555244444444444444444442555d515100022222000015555
d555555577bbbb77bb79bbbb0000b000bb6666bbbbbb555bbbbbbbbb155554444444444444444515155244444444444444444415155555151100000111155515
d5555555b7bbbb7bb7bbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb555524444444444444444455555244444444444444444255555d555555111115555d5555
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
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d55142424242421599c9554fdbbddaa5ddaad5bb5404dffdbbbddbbb0000000000000000
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d5558555d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4bbb67bbb0000000000000000
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5588855d5599c9212121119aa09954fd5daa5d888ddaadd52222425bbb67bbb0000000000000000
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd597a099fffffff49949454fdddddd88888ddddd55555425bbbbbbbb00000000bbbbbbbb
d555555515555155d55576db65555555d5766665d5555555d5588855d59aa094dddddddf242425ffdddaadd888d5aadd5fff2225bbbbbbbb00000000bb5555bb
d555555a5d55d555d5576dbbb555c055d5766665d5556555d5558555df249492dd929ddf00004ff1dbddaa5d8d5aaddb5ffff225b1b11b1b00000000b507665b
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555dff2424fd99299df22fff211dbbd5aadd5aad5bb54444445bdd66ddb00000000b560700b
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55aaa55d1fffff1d99299dfff141211d5bbddaadaad5bb55ffffff5b651156b00000000b567075b
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d441414155555554144442154d5bb5dadad5bb5d5ffffff5b7b55b7b00000000b570765b
d544445a15555515d5556dd5d5555555d556dd55d555d555d5bbbbb5d54404455555555444444555d4d5bbdd5ddbbddd54444445bbb67bbb00000000bb5055bb
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d55555555555555444555555dd4ddbbdddbbdddd52222225bbb67bbb00000000bbbbbbbb
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
0400040404040404040202020202000000000600040406010101010101010101010101010000000000000101010000000101010101010101010101010101010101010101010102010101020201010000010101010101020101010202010100010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212090c0c0b0032165d85850a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120910101010100a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120d101010100a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000010101010100d4d0a0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212101010100e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121209100a0a0b16004d010a0000120a090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212090a0a0a0d005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00120a0a0a0a161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0a0a0e0016850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

