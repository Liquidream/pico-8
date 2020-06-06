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
l.init_repairfact=function(self)
self.bs=8
self.bt={0}
end
function cb(self,cd)
self.ce=0
self.cf=self.ca
if(self.cg>0 and self.cf>0) self.ch=not self.ch
self.ca=cd
end
ci=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|parent2_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
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
14|rEPAIR fACILITY|128|230||2|3|2|nil|1||12|5|99|700|20|0|800||||||4|tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.|init_repairfact|||
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
30|mcv||||1|2|1|11|12||7|4|99|900||0|600|0.1|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
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
cj()
ck=cl(ci[80],109,-20,5,{},nil,l.draw_repair,l.repair_click)
cm()
cursor={
w=8,
h=8,
cn=function(self)
return{
by=self.by+(not co and cp or 0)+2,
bz=self.bz+(not co and cq or 0)+1,
w=1,
h=1
}
end,
cr=function(self)
spr((bm and(bm.type==1 and bm.cs==1)) and 1 or self.obj_spr,
self.by,self.bz,self.w/8,self.h/8)
end
}
ct()
music"7"
cu=0
end
function ct()
for cv=1,2 do
for cw=0,31 do
for cx=0,127 do
local cy=nil
local cz=mget(cx,cw)
local da=fget(cz)
if cv==1 and cz==1 then
db,dc=cx*8,cw*8
cp,cq=db-56,dc-56
cy=ci[1]
elseif cv==2
and cz>=48 then
for dd in all(
ci) do
if(dd.obj_spr!=nil and dd.obj_spr==cz) cy=dd break
end
end
if cy!=nil then
local de,df=cx,cw
if(de>63) df+=31 de-=64
dg(cy,de*8,df*8)
if(cy.type==1 and cy.speed>0) mset(cx,cw,0)
end
end
end
end
end
function dg(cy,by,bz,cs,dh)
local di=cl(cy,by,bz,cy.type,nil,l[cy.func_init],l[cy.func_draw],l[cy.func_update],nil)
di.dj=cl(cy,109,0,3,di,nil,nil,l[cy.func_onclick])
di.cg=dk and cy.hitpoint/2 or cy.hitpoint
di.bj={}
for dd in all(ci) do
local dl=dd.req_faction
if(dd.parent_id!=nil and(dd.parent_id==di.id or dd.dm==di.id))
and(dl==nil
or(dl>0 and dd.req_faction==c)
or(dl<0 and-c!=dl))
then
add(di.bj,
cl(dd,109,0,4,di,nil,nil,function(self)
if bp then
bm=self
else
cb(self,1)
end
end)
)
di.bq=di.bj[1]
end
end
di.cs=cs or(dn(by,bz,db,dc)<75 and 1 or 2)
if di.cs==1 then
di.dp=c
di.bx=d
di.bu=e
q[di.id]=true
else
di.dp=g
di.bx=i
di.bu=j
di.dj.func_onclick=nil
end
local dq=flr(by/8)
local dr=flr(bz/8)
if cy.type==2 then
di.ds=53
local dt=(cy.id==2 or cy.id==3)
for du=0,cy.w-1 do
for dv=0,cy.h-1 do
dw(dq+du,dr+dv,dt and 16 or 149)
end
end
if(not dt) add(m,di)
if di.id==6 and di.bi==nil then
p[di.cs]=di
local dx,dy=dz(di,(di.by+32)/8,(di.bz+8)/8,ea)
dg(ci[27],dx*8,dy*8,nil,di)
end
end
if cy.type==1 then
di.ds=54
if(di.norotate!=1) di.eb=flr(rnd"8")*.125
if di.arms>0 then
di.ec=function(self)
self.ed=4
self.ee=self.by+4
self.ef=self.bz+4
self.eg=self.eh.by+self.eh.w/2
self.ei=self.eh.bz+self.eh.h/2
local ej=self.eg-self.ee
local ek=self.ei-self.ef
local el=sqrt(ej*ej+ek*ek)
self.em=(ej/el)*2
self.en=(ek/el)*2
sfx(self.arms<100 and 60 or 58,3)
eo(self)
end
if di.id==15 or di.id==16 then
dw(dq,dr,149)
end
else
if(di.id==27) di.ep=0 di.eq=p[di.cs]
end
add(n,di)
er(di)
end
eo(di)
return di
end
function cl(es,by,bz,et,bi,func_init,func_draw,func_onclick)
local eu=(es.w or 1)*8
local ev=(es.h or 1)*8
local ew={
ex=es,
id=es.id,
hitpoint=es.hitpoint,
by=by,
bz=bz,
ey=1,
type=et,
bi=bi,
func_onclick=func_onclick,
w=eu,
h=ev,
ez=es.obj_spr,
fa=es.w or 1,
fb=es.h or 1,
cg=0,
fc=0,
ca=0,
fd=0,
fe=0,
ff=0,
fg=1,
bw=1,
cn=function(self)
return{
by=self.by,
bz=self.bz,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cr=func_draw or function(self)
if self.type<=2
and(self.by+self.w<cp
or self.by>cp+127
or self.bz+self.h<cq
or self.bz>cq+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dp and self.id!=18) pal(12,self.bx) pal(14,self.bu)
if self.bt then
pal(self.bs,self.bt[self.bw])
end
if self.eb then
if not self.fh or self.fh>.025 then
if(self.speed>0) fi(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz+1,.25-self.eb,1,self.trans_col,5)
fi(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz,.25-self.eb,1,self.trans_col,flr(self.fg)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.by-1,self.bz-1,self.by+16,self.bz+19,0)
local fj=self.type==4 and self or self.bi
local fk=fj.hitpoint
local fl=self.ca==1 and 12 or(fj.cg<fk*.33 and 8 or fj.cg<fk*.66 and 10 or 11)
local fm=self.ca==1 and(15*(fj.cg/100)) or(15*(fj.cg/fk))
if(fj.cg>0 and not bp) rectfill(self.by,self.bz+17,self.by+fm,self.bz+18,fl)
end
if self.type>2 then
spr(self.ico_spr,self.by,self.bz,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
end
if self.ee then
if(self.fire_type==1) then
circfill(self.ee,self.ef,0,rnd"2"<1 and 8 or 9)
else
fn(self.ee,self.ef,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.cg<self.hitpoint*.33 and rnd"10"<1) fn(self.by+3.5,self.bz+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.ff=0
end,
fo=function(self)
self.fg=max(self.fg-.4,1)
if self.ff>0 then
fp(5,true)
if(fq==0 or stat(24)>5) fq=1 music"0"
if(self.arms>0 and self.ed==0) fr(self,self.fs)
end
if(self.type<=2 and self.cg<=0 and self.fh==nil) self.ed=5 self.ft=nil self.fh=(self.type==2 and 1 or .5) sfx(self.ds,3) cu+=(self.type==2 and 0.25 or 0)
if self.fh then
self.fh-=.025
if self.fh<=0 then
if self.type==2 then
for du=0,self.fa-1 do
for dv=0,self.fb-1 do
dw(self.by/8+du,self.bz/8+dv,15)
end
end
del(m,self)
y[self.fs.cs]+=1
else
local fu,fv=flr(self.by/8),flr(self.bz/8)
if(fv>31) fu+=64 fv-=32
if(fw(fu,fv)<9) dw(fu,fv,20)
if(self.speed==0) dw(fu,fv,15)
del(n,self)
z[self.fs.cs]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fx(self.by+rnd(self.w),self.bz+rnd(self.h))
end
end
if self.framecount!=nil then
self.fc+=1
if(self.fc>self.framecount) then
self.fc=0
if self.altframe
and self.ed==2 then
self.obj_spr=self.ez+(self.altframe-self.obj_spr)
end
if self.bt then
self.bw+=1
if(self.bw>#self.bt) self.bw=1
end
end
end
if self.ee then
self.ee+=self.em
self.ef+=self.en
if dn(
self.ee,self.ef,
self.eg,self.ei)<2
then
fx(self.ee,self.ef,self.fire_type)
local eh=self.eh
if dn(
self.ee,self.ef,
eh.by+eh.w/2,
eh.bz+eh.h/2)<4
then
eh.cg-=self.arms
eh.ff=self.fire_type
eh.fs=self
end
self.ee=nil
end
end
if self.ca>0
and not self.ch
and not self.fy then
if self.ca==1 and self.fd>self.cost then
self.fy=true
sfx"56"
if self.ex.type==1
and self.id!=15
and self.id!=16 then
local dx,dy=fz(self,self.bi)
dg(self.ex,dx,dy,nil,self.bi)
ga(self)
end
elseif self.ca==2 and self.cg>self.hitpoint then
self.ca=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.eq)
self.ed=0
local dx,dy=fz(self,self.eq)
self.by,self.bz=dx,dy
end
else
self.ce+=1
self.cg=(self.ca==1 and(self.fd/self.cost)*100 or self.cg+.5)
if(self.ce>(self.ca==1 and 3 or 100) and gb(-1,self.ca==1 and self.bi or self)) self.ce=0 self.fd+=1
end
end
end,
gc=function(self,by,bz)
self.by=by
self.bz=bz
end,
gd=function(self)
return flr(self.by/8)..","..flr(self.bz/8)
end
}
for ge,gf in pairs(es) do
if ew[ge]==nil and gf!=""then
ew[ge]=gf
end
end
if(func_init) func_init(ew)
return ew
end
function gb(gg,ew)
if(gh(f[ew.cs])+gg<0) return false
f[ew.cs]+=sgn(gg)*shr(abs(gg),16)
if(ew.cs==1) sfx"63"
return true
end
function fx(by,bz,gi)
fn(by,bz,2,
0,0,.1,0,gi==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function eo(gj)
if(gj.cs!=1 and gj.ed!=4) return
local gk=gj.type==2 and 3 or 2
for du=-gk,gk do
for dv=-gk,gk do
local gl=flr(gj.by/8)+du
local gm=flr(gj.bz/8)+dv
gn[gl][gm]=16
go(gl,gm)
for ek=-1,1 do
for ej=-1,1 do
go(gl+ej,gm+ek)
end
end
end
end
end
function _update60()
gp()
gq()
if(t()%1==0) gr()
if(t()%1==0 and t()%2==0) gs()
x+=1
end
function _draw()
gt()
gu()
end
function cm()
gn={}
for cv=-2,66 do
gn[cv]={}
for gv=-2,66 do
gn[cv][gv]=0
end
end
end
function gw()
local gx=flr(cp/8)
local gy=flr(cq/8)
palt(11,true)
for du=gx-1,gx+16 do
for dv=gy-1,gy+16 do
if gn[du][dv]!=0 and gn[du][dv]!=16 then
spr(gn[du][dv]+31,du*8,dv*8)
elseif gn[du][dv]<16 then
rectfill(du*8,dv*8,du*8+7,dv*8+7,0)
end
end
end
end
function go(by,bz)
if(by<0 or by>#gn or bz<0 or bz>#gn) return
local gz=0
if gn[by][bz]!=0 then
if(gn[by][bz-1]>0) gz+=1
if(gn[by-1][bz]>0) gz+=2
if(gn[by+1][bz]>0) gz+=4
if(gn[by][bz+1]>0) gz+=8
gn[by][bz]=1+gz
end
end
function gs()
r={}
if bc then
for cv=0,124,4 do
for gv=0,124,4 do
local cx=cv/2
local cw=gv/2
if(cw>=32) cx+=64 cw-=32
local ha=mget(cx,cw)
local hb=(ha*8)%128
local hc=(ha*8)/16
local fl=sget(hb+4,hc)
if(gn[cv/2][gv/2]==16) r[((cv/2)/2)..","..((gv/2)/2)]=fl!=11 and fl or 15
end
end
end
hd=0
he=0
hf=false
hg={0,0}
for hh,hi in pairs(m) do
local gl=flr(hi.by/8)
local gm=flr(hi.bz/8)
if hi.cs==1 or(bc and gn[gl][gm]==16) then
r[flr(hi.by/2/8)..","..flr(hi.bz/2/8)]=hi.bx
end
if(hi.cs==1) then
hd-=hi.ex.power
if(hi.id==7) hf=true
if(sub(hi.name,1,5)=="sPICE") he+=1000
end
hg[hi.cs]+=1
end
if bc then
for hh,hj in pairs(n) do
if hj.cs==1 or gn[flr(hj.by/8)][flr(hj.bz/8)]==16 then
r[flr(hj.by/2/8)..","..flr(hj.bz/2/8)]=hj.bx
end
end
if(hk and gn[mid(0,flr(hl/8),31)][mid(0,flr(hm/8),31)]==16) r[flr(hl/2/8)..","..flr(hm/2/8)]=7
end
bc=(hf and hd>0)
fp(5,false)
fq=2
if(f[3]>0 and f[1]>f[3]) hn=1
if(hg[2]==0 and b>1) hn=2
if(hg[1]==0) hn=3
if hn then
dset(14,hn)
dset(13,t()-v)
dset(10,ho)
dset(24,gh(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
hp("mission "..(hn<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gr()
o={}
for ge,hj in pairs(n) do
o[flr(hj.by/8)..","..flr(hj.bz/8)]=ge
end
end
function gp()
hq,hr,hs=stat"32",stat"33",stat"34"
ht=(hs==1 and hu!=hs) or btnp"4"
hv=(hs>0) or btn"4"
hw=(hs==2 and hu!=hs) or btnp"5"
for ge=0,1 do
if(btn(ge)) ba+=ge*2-1
if(btn(ge+2)) bb+=ge*2-1
end
hx=mid(0,hq+ba,127)
hy=mid(0,hr+bb,127)
cursor.by=hx
cursor.bz=hy
if not bp then
if(hx<4) cp-=2
if(hx>123) cp+=2
if(hy<4) cq-=2
if(hy>123) cq+=2
cp=mid(cp,384)
cq=mid(cq,384)
for hh,hj in pairs(n) do
if hj then
if hj.ft and costatus(hj.ft)!='dead'then
assert(coresume(hj.ft,hj))
else
hj.ft=nil
end
if hk
and fget(fw(flr(hj.by/8),flr(hj.bz/8)),2)
and dn(hl,hm,hj.by,hj.bz)<1
then
del(n,hj)
hz=.01
end
end
end
ia()
end
ib()
hu,cc,br=hs,bm,bg
end
function ic(by,bz)
local fm=fw(by,bz)
return fm>=2 and fm<=8
end
function er(hj,ie)
hj.ed=ie or 0
hj.ft=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0 and self.ed!=8) dz(self,flr(self.by/8),flr(self.bz/8),ig,self.range)
local eq=self.eq
if self.id==27 then
if self.ed==0 or self.ed==7 or self.ed==9 then
if self.ep<=1500
and self.ed!=7 and self.ed!=9 then
local hb,hc
local ih,ii=flr(self.by/8),flr(self.bz/8)
if ic(ih,ii) and not self.ij then
hb,hc=ih,ii
else
dz(self,ih,ii,
function(hj,by,bz)
if ic(by,bz) and rnd"10"<1 then
hb,hc=by,bz
return true
end
end,
10)
end
if hb and hc then
ik(hj,hb,hc)
if(ic(flr(hj.by/8),flr(hj.bz/8))) hj.ed=6
end
end
elseif self.ep>=1500
and self.ed!=7 then
self.ed=7
eq.bv=true
ik(self,(eq.by+16)/8,eq.bz/8)
self.ed=9
elseif self.ed==6 then
self.ij=false
local eb=hj.eb+.75
il(hj.by,hj.bz,hj.eb+.75+rnd".2"-.1)
local im=hj:gd()
s[im]=(s[im] or 10000)-1
self.ep=(self.ep or 0)+.5
if s[im]<=0 then
local dq=flr(self.by/8)
local dr=flr(self.bz/8)
for dv=-1,1 do
for du=-1,1 do
fm=fw(dq+du,dr+dv)
dw(dq+du,dr+dv,
(du==0 and dv==0) and 0 or((fm>1 and fm<8) and 8 or fm)
)
end
end
self.ed=0
end
if(self.ep%300==0) self.ij=true self.ed=0
end
end
if self.id>21 then
if self.ed==9 then
if not eq.io then
eq.bv=false
self.ed=8
self.eb=.25
self.by=eq.by+16
self.bz=eq.bz+4
if(bm==self) bm=nil
if self.ep then
eq.io=true
while self.ep>0 do
self.ep-=1
if(flr(self.ep)%4==0 and tonum(ho)<he) gb(2,self)
yield()
end
self.ep=0
eq.io=false
self.ed=0
else
self.ca=2
self.ce=0
eq.bs=8
eq.bt={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function fz(ew,eh)
local dx,dy=dz(ew,(eh.by+8)/8,(eh.bz+16)/8,ea)
return dx*8,dy*8
end
function il(by,bz,eb)
local ip,iq=sin(eb)*5.5,-cos(eb)*5.5
if(rnd"5"<1) fn(by+ip+3.5,bz+iq+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fr(hj,eh)
hj.ed=3
hj.eh=eh
hj.ft=cocreate(function(self)
while eh.cg>0 do
local ir=dn(hj.by,hj.bz,eh.by,eh.bz)
if ir>hj.range*5
and hj.speed>0 then
ik(hj,flr(eh.by/8),flr(eh.bz/8),hj.range*5)
end
if not hj.norotate then
local is=atan2(hj.by-eh.by,hj.bz-eh.bz)
while(hj.eb!=is) do
it(hj,is)
end
end
if(ir<=hj.range*5) then
hj.fe-=1
if(hj.fe<=0 and not hj.ee) hj.ec(hj) hj.fe=hj.arms*4
elseif hj.speed==0 then
er(hj)
end
yield()
end
er(self)
end)
end
function dz(hj,by,bz,iu,iv)
for dn=1,iv or 64 do
for du=by-dn,by+dn do
for dv=bz-dn,bz+dn do
if((du==by-dn or du==by+dn or dv==bz-dn or dv==bz+dn) and(iu(hj,du,dv))) return du,dv
end
end
yield()
end
end
function fw(cx,cw)
if(cw>31) cx+=64 cw-=32
return mget(cx,cw)
end
function dw(cx,cw,iw)
if(cw>31) cx+=64 cw-=32
mset(cx,cw,iw)
end
function ea(hj,by,bz)
return not fget(fw(by,bz),0)
and o[by..","..bz]==nil
end
function ig(hj,by,bz)
local eh=n[o[by..","..bz]]
if(eh!=ix and eh.cs!=hj.cs and gn[by][bz]==16) fr(hj,eh) return true
end
function ik(hj,by,bz,iy)
::restart_move_unit::
hj.iz="init"
if not ea(nil,by,bz) then
by,bz=dz(hj,by,bz,ea)
end
hj.ih=by
hj.ii=bz
hj.ja=hj.ed
hj.ed=1
hj.iz=jb(
{by=flr(hj.by/8),bz=flr(hj.bz/8)},
{by=hj.ih,bz=hj.ii},
jc,
jd,
je,
function(jf) return shl(jf.bz,8)+jf.by end,
nil)
hj.ja=hj.ed
hj.ed=2
hj.ed=2
if hj.iz!=nil then
for cv=#hj.iz-1,1,-1 do
local jf=hj.iz[cv]
if not hj.norotate then
local is=atan2(
hj.by-(jf.by*8),
hj.bz-(jf.bz*8))
while(hj.eb!=is) do
it(hj,is)
end
end
if(not ea(nil,jf.by,jf.bz)) goto restart_move_unit
local jg=hj.speed or .5
local jh=sqrt((jf.by*8-hj.by)^2+(jf.bz*8-hj.bz)^2)
local ji=jg*(jf.by*8-hj.by)/jh
local jj=jg*(jf.bz*8-hj.bz)/jh
for cv=0,jh/jg-1 do
o[jf.by..","..jf.bz]=hj
hj.by+=ji
hj.bz+=jj
yield()
end
hj.by,hj.bz=jf.by*8,jf.bz*8
o[jf.by..","..jf.bz]=hj
eo(hj)
if(dn(hj.by,hj.bz,hj.ih*8,hj.ii*8)<=(iy or 0)) break
end
end
hj.ed=0
end
jk=0
function gq()
if(t()>k and t()%k*2==0) then
local jl=n[flr(rnd(#n))+1]
if jl.cs==2 and jl.arms>0 and jl.ed==0 then
local jm=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if jm and jm.cs==1 then
fr(jl,jm)
end
end
end
jk-=1
if(jk<0) then
if hk then
hk=nil
else
hk,jn,jo,jp,hz={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
jk=rnd(5000)
end
if hk then
if(x%6<1 or#hk<30) and hz==0 then
while#hk<31 do
if(rnd(9)<.5) jo=rnd(.04)-.02
hl,hm=hk[#hk][1],hk[#hk][2]
add(hk,{hl+sin(jn),hm-cos(jn)})
jn+=jo
end
end
if(#hk>30) del(hk,hk[1])
if(hz>0) hz+=.01 il(hl,hm,rnd"1")
if(hz>2) hz=0
end
end
function gt()
cls"15"
camera(cp+(16-rnd(32))*cu,cq+(16-rnd(32))*cu)
cu=(cu>0.05) and cu*0.95 or 0
if hk then
for cv=1,#hk do
if(cv%2==1) fillp(0xa5a5.8)
circfill(
hk[cv][1]+4,
hk[cv][2]+4,4,
jp[cv%#jp+1])
fillp()
end
if(hz>0) spr(94+hz,hl,hm)
end
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hh,hi in pairs(m) do
if not bp then
hi:fo()
if(hi.bq) hi.bq:fo()
end
hi:cr()
if(hi==bm) then
rect(bm.by,bm.bz,
bm.by+bm.w-1,bm.bz+bm.h-1,
7)
end
end
for hh,hj in pairs(n) do
if(not bp) hj:fo()
if(hj.ca!=2 or hj.speed==0) hj:cr()
if(hj==bm) then
palt(11,true)
spr(17,bm.by,bm.bz)
end
end
jq()
gw()
end
function jr()
local gk=31
rectfill(89,89,126,126,e)
rect(90,90,125,125,d)
rectfill(92,92,123,123,0)
if bc!=be then
bd=bc and 1 or 59
js=bc and 1 or-1
sfx(55)
gs()
end
be=bc
if bd>0 and bd<60 then
bd+=js
clip(
max(108-bd,91),
max(108-(bd>20 and bd-20 or 0),91),
min(bd*2,33),
min((bd>20 and bd-20 or 1)*2,33))
for cv=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for du=0,31 do
for dv=0,31 do
if(r[du..","..dv]) pset(92+du,92+dv,r[du..","..dv])
end
end
local ip=92+cp/16
local iq=92+cq/16
rect(ip,iq,ip+7,iq+7,7)
end
function gu()
camera(0,0)
pal()
palt(0,false)
if bm and bm.dj then
bm.dj:gc(109,20)
bm.dj:cr()
if bm.bq and bm.cs==1 then
bm.bq:gc(109,44)
bm.bq:cr()
end
if bm.cg<bm.hitpoint
and bm.cs==1
and bm.id!=4
and(bm.type==2
or bm.id==15
or bm.id==16) then
ck:gc(117,28)
ck:cr()
end
end
ho=gh(f[1])
hp(sub("000000",#ho+1)..ho,103,2,7)
if bm
and bm.bq
and(bm.bq.type==4
or bm.bq.id==15
or bm.bq.id==16)
and bm.bq.cg>=100 then
local jt=flr((cursor.by+cp)/8)
local ju=flr((cursor.bz+cq)/8)
local jv=jt*8-cp
local jw=ju*8-cq
jx=false
jy=false
dk=false
local w=bm.bq.fa
local h=bm.bq.fb
for du=-1,w do
for dv=-1,h do
if du==-1 or du==w or dv==-1 or dv==h then
if(fw(jt+du,ju+dv)==16 or fw(jt+du,ju+dv)>=63) jx=true
else
local fm=fw(jt+du,ju+dv)
if(fm>=9 and fm<=15) dk=true
if(o[jt+du..","..ju+dv] or fm==0 or fm<8 or fm>16) jy=true
end
end
end
if(jy) jx=false
fillp("0b1110110110110111.1")
rectfill(jv,jw,
jv+bm.bq.w,jw+bm.bq.h,jx and 11 or 8)
fillp()
end
jr()
if bp then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bm.bj then
bm.bn={}
rectfill(6,25,27,92,0)
local jz=1
for cv=1,#bm.bj do
local ka=bm.bj[cv]
if ka.req_id==nil
or q[ka.req_id] then
bm.bn[jz]=ka
if jz>=bf and jz<=bf+2 then
ka:gc(9,28+((jz-bf)*19))
ka:cr()
else
ka:gc(-16,16)
end
if(bg==ka) then
bl=jz
rect(ka.by-2,ka.bz-2,
ka.by+17,ka.bz+17,
7)
print(bg.name,30,26,7)
print("cOST:"..bg.cost,85,33,9)
kb=0
for gv in all(kc(bg.description,23)) do
print(gv,30,39+kb,6)
kb+=6
end
end
jz+=1
end
end
end
for hh,kd in pairs(bh) do
kd:cr()
end
end
palt(11,true)
cursor:cr()
end
function bk(by,bz,ke,func_onclick,eu)
add(bh,{
by=by,
bz=bz,
w=eu or#ke*4+2,
h=8,
ke=ke,
cn=function(self)
return{
by=self.by,
bz=self.bz,
w=self.w,
h=self.h
}
end,
cr=function(self)
if(#ke>1) rectfill(self.by,self.bz,self.by+self.w,self.bz+self.h,7)
if(#ke>1) rectfill(self.by+1,self.bz+1,self.by+self.w-1,self.bz+self.h-1,self.kf and 12 or 6)
print(self.ke,self.by+2,self.bz+2,(#ke>1) and 0 or(self.kf and 12 or 7))
end,
func_onclick=func_onclick
})
end
function kc(kg,kh)
local ki={}
local kj=""
local kk=""
local kl=""
local km=function(kn)
if#kk+#kj>kn then
add(ki,kj)
kj=""
end
kj=kj..kk
kk=""
end
for cv=1,#kg do
kl=sub(kg,cv,cv)
kk=kk..kl
if kl==" "
or#kk>kh-1 then
km(kh)
elseif#kk>kh-1 then
kk=kk.."-"
km(kh)
elseif kl==";"then
kj=kj..sub(kk,1,#kk-1)
kk=""
km(0)
end
end
km(kh)
if kj!=""then
add(ki,kj)
end
return ki
end
function ib()
ko=false
if bm then
co=true
if(cc.cg and cc.cg<cc.hitpoint) kp(ck)
if(bm.dj and not bp and not ko) kp(bm.dj)
foreach(bm.bj,kp)
if(bp) foreach(bh,kp)
co=false
end
if not bp
and not ko then
foreach(n,kp)
foreach(m,kp)
end
if hv
and not bp
and hx>89 and hx<122
and hy>90 and hy<123 then
cp=mid(0,(hx-94)*16,400)
cq=mid(0,(hy-94)*16,400)
elseif ht then
if ko then
if(not bp and bm.func_onclick and bm.bi!=nil) bm:func_onclick() bm=cc return
if(bp and bg.ke and bg.func_onclick) bg:func_onclick()
if(bm.cs==1 and bm.type==1 and bm!=cc and bm.speed>0) sfx(62)
if(bm.cs==2 and cc and cc.type==1 and cc.cs==1) bm.fg=10 fr(cc,bm) bm=nil
else
if bm
and bm.type==1
and bm.cs==1
and bm.speed>0
and bm.ed!=7 then
bm.ft=cocreate(function(hj)
ik(hj,flr((cp+hx)/8),flr((cq+hy)/8))
er(hj)
end)
end
if bm
and bm.bq
and bm.bq.cg>=100
and jx then
local dq=flr((cursor.by+cp)/8)
local dr=flr((cursor.bz+cq)/8)
local cy=bm.bq.ex
dg(cy,dq*8,dr*8,1)
ga(bm.bq)
sfx"61"
end
if(not bp) bm=nil
end
elseif hw and not bp then
bm=nil
end
end
function ga(ew)
ew.cg=0
ew.ca=0
ew.fd=0
ew.fy=false
end
function kp(ew)
ew.kf=kq(cursor,ew)
if ht and ew.kf then
if bp then
bg=ew
else
if(ew.type<=2 and gn[flr((cursor.by+cp)/8)][flr((cursor.bz+cq)/8)]!=16) return
if(ew.ed==8) return
if bm
and(ew.id==6 and bm.id==27
or ew.id==14 and bm.id>21)
and bm.cs==1 then
bm.ed=7
bm.eq=ew
ew.bv=true
bm.ft=cocreate(function(hj)
ik(hj,(ew.by+16)/8,(ew.bz+16)/8)
er(hj,9)
end)
return
else
bm=ew
end
end
ko=true
end
end
function fp(kr,ks)
kr*=4
local fm=peek(0x3100+kr+1)
if((band(fm,128)>0)!=ks) fm=bxor(fm,128)
poke(0x3100+kr+1,fm)
end
function hp(kt,ku,
kv,fl,
kw)
for du=-1,1 do
for dv=-1,1 do
print(kt,ku+du,kv+dv,kw)
end
end
print(kt,ku,kv,fl)
end
function kq(kx,ky)
local kz=kx:cn()
local la=ky:cn()
return kz.by<la.by+la.w and
kz.by+kz.w>la.by and
kz.bz<la.bz+la.h and
kz.bz+kz.h>la.bz
end
function cj()
lb=lc(ci,"|","\n")
ci={}
for cv=2,#lb-1 do
ld={}
for le=1,#lb[cv] do
local fm=lb[cv][le]
if(le!=2 and le<25) fm=tonum(fm)
ld[lb[1][le]]=fm
end
ci[tonum(lb[cv][1])]=ld
end
end
function gh(fm)
local lf=""
local gf=abs(fm)
repeat
lf=(gf%0x0.000a/0x.0001)..lf
gf/=10
until gf==0
if(fm<0) lf="-"..lf
return lf
end
function lc(kt,el,lg)
local is={}
local lh=0
local lf=''
local li=''
if lg~=nil then kt=lc(kt,lg) end
while#kt>0 do
if type(kt)=='table'then
lf=kt[1]
add(is,lc(lf,el))
del(kt,lf)
else
lf=sub(kt,1,1)
kt=sub(kt,2)
if lf==el then
add(is,li)
li=''
else
li=li..lf
end
end
end
add(is,li)
return is
end
local lj=0
function fi(hb,hc,by,bz,is,w,lk,ll)
local lm,ln=cos(is),sin(is)
local lo,lp,lq,lr
local lt,lu=lm,ln
local gz=shl(0xfff8,(w-1))
w*=4
lm*=w-0.5
ln*=w-0.5
local lv,lw=ln-lm+w,-lm-ln+w
w=2*w-1
for lx=0,w do
lo,lp=lv,lw
for ly=0,w do
if band(bor(lo,lp),gz)==0 then
local lh=sget(hb+lo,hc+lp)
if(lh!=lk) pset(by+lx,bz+ly,ll or lh)
end
lo-=lu
lp+=lt
end
lv+=lt
lw+=lu
end
end
function dn(lz,ma,mb,mc)
return abs(sqrt(((lz-mb)/1000)^2+((ma-mc)/1000)^2)*1000)
end
function it(hj,md)
local me=3.14159
local mf=0.0087
local gg=md-hj.eb
if gg>0.5 then
gg-=1
elseif gg<-0.5 then
gg+=1
end
if gg>mf then
hj.eb+=mf
elseif gg<-mf then
hj.eb-=mf
else
hj.eb=md
end
if(hj.eb>me) hj.eb-=2*me
if(hj.eb<-me) hj.eb+=2*me
yield()
end
function jd(mg,jf,mh)
local mi=fget(fw(jf.by,jf.bz),1) and 4 or 1
if(mg.by!=jf.by and mg.bz!=jf.bz) return mi+1
return mi
end
function je(jf,mh)
local mj={}
for du=-1,1 do
for dv=-1,1 do
if(du!=0 or dv!=0) mk(jf.by+du,jf.bz+dv,mj)
end
end
return mj
end
function mk(ml,mm,mn)
if(
not fget(fw(ml,mm),0)
and o[ml..","..mm]==nil
and ml>=0
and mm>=0
and ml<=63
and mm<=63
)
then
add(mn,{by=ml,bz=mm})
end
end
function jc(is,mo)
return abs(is.by-mo.by)+abs(is.bz-mo.bz)
end
function jb
(mp,
mq,
mr,
ms,
mj,
mt,
mh)
local mu,
mv={
mw=mp,
mx=0,
my=mr(mp,mq,mh)
},{}
mv[mt(mp,mh)]=mu
local mz,na,nb,nc={mu},1,mt(mq,mh),32767.99
local count=0
while na>0 do
local cost,nd=nc
for cv=1,na do
local ne=mz[cv].mx+mz[cv].my
if(ne<=cost) nd,cost=cv,ne
end
mu=mz[nd]
mz[nd],mu.nf=mz[na],true
na-=1
local ng=mu.mw
if mt(ng,mh)==nb then
ng={mq}
while mu.nh do
mu=mv[mt(mu.nh,mh)]
add(ng,mu.mw)
end
return ng
end
for ni in all(mj(ng,mh)) do
local id=mt(ni,mh)
local nj,nk=
mv[id],
mu.mx+ms(ng,ni,mh)
if not nj then
nj={
mw=ni,
mx=nc,
my=mr(ni,mq,mh)
}
na+=1
mz[na],mv[id]=nj,nj
end
if not nj.nf and nj.mx>nk then
nj.mx,nj.nh=nk,ng
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
function fn(by,bz,eb,ej,ek,nl,nm,cg,nn,kr)
local ng={
by=by,bz=bz,eb=eb,ej=ej,ek=ek,nl=nl,
cg=0,nm=nm or 0.0625,
nn=nn or{7,6,5},kr=kr or 0,
no=bz,np=cg or 8
}
add(u,ng)
end
function ia()
for ge,ng in pairs(u) do
ng.ek+=ng.nm
ng.by+=ng.ej
ng.bz+=ng.ek
ng.eb+=ng.nl
ng.cg+=1
if(ng.cg>=ng.np) del(u,ng)
end
end
function jq()
for ge,ng in pairs(u) do
local fl=flr((#ng.nn/ng.np)*ng.cg)+1
if(ng.kr) fillp(ng.kr)
circfill(ng.by,ng.bz,ng.eb,ng.nn[fl])
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
ddddddddb7bbbb7bbb77bbb7bbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d555d555d555d555d555d44444444444444444445555d024244444444444442215
d555555577bbbb77b79bb77bbbbbbbbbbb66669bbbbbbbbbb6bbbbbb155551551555515515555155155444444444444444444445155022242444444444242015
d5555555bbbbbbbb79b779bb0000b000b66dd66bbd5bb5bbbbbbbb6b5d55d555555555555555d5555d44444444444444444444455d5102222244224224222015
d5555555bbbbbbbbbb799bbb07700077b6d55d6bb5dbbbbbbbbbbbbb555155555555555d44455d5d55444444444444444444444d55511002222222222222015d
d5555555bbbbbbbbb799bbbb00777770b6d55d6bbbbb555bbbbbbbbbd5555d44555d444444445555d52244444444444444444445d55510000022222220201155
d5555555bbbbbbbbb79bbbbb07700077b66dd66bbbbb5d5bbbb6bbbb55d5d444444444444444455555122444444444444444442555d511100000000000011155
d555555577bbbb777bbbbbbb0000b000bb6666bbbbbb555bbbbbbbbb155544444444444444444415155124444444444444444405155555111000000011115515
d5555555b7bbbb7bbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb555544444444444444444455555144444444444444444215555d555111111111115d5555
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
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd597a099fffffff49949454fdddddd88888ddddd55555425bbbbbbbbbbbb447bbbbbbbbb
d555555515555155d55576db65555555d5766665d5555555d5588855d59aa094dddddddf242425ffdddaadd888d5aadd5fff2225bbbbbbbbbbb2557bbb5555bb
d555555a5d55d555d5576dbbb555c055d5766665d5556555d5558555df249492dd929ddf00004ff1dbddaa5d8d5aaddb5ffff225b1b11b1bbb2555dbb507665b
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555dff2424fd99299df22fff211dbbd5aadd5aad5bb54444445bdd66ddbb775f55bb562720b
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55aaa55d1fffff1d99299dfff141211d5bbddaadaad5bb55ffffff5b651156b76dfff2bb567275b
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d441414155555554144442154d5bb5dadad5bb5d5ffffff5b7b55b7b76d5f564b572765b
d544445a15555515d5556dd5d5555555d556dd55d555d555d5bbbbb5d54404455555555444444555d4d5bbdd5ddbbddd54444445bbb67bbb4422d664bb5055bb
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d55555555555555444555555dd4ddbbdddbbdddd52222225bbb67bbbbbbbbd77bbbbbbbb
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
d56ddddddddd1d0888880105d55cd6cccc6dc555d55ddd55dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555d555d555dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c6555d5551555dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
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
0400040404040404040202020202000000000600040406010101010101010101010101010000000000000101010000000101010101010101010101010101010101010101010102010101020201010000010101010101020101010202010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121236000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000165d85850a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212008010100c830a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212001010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001010100a0a0d4d0e0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212090d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016004d010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001200161685680a10620c0c680a1b1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016850a0a100a0a0a0a0a1b17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a0b000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000032000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
121200003600360000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a0a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003500350000090a0a0a0a1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1c1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

