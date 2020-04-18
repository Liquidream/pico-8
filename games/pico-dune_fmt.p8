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
l.cd=function(self)
self.bs=8
self.bt={0}
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
end
function cu()
for cw=1,2 do
for cx=0,31 do
for cy=0,127 do
local cz=nil
local da=mget(cy,cx)
local db=fget(da)
if cw==1 and da==1 then
dc,dd=cy*8,cx*8
cq,cr=dc-56,dd-56
cz=cj[1]
elseif cw==2
and da>=48 then
for de in all(
cj) do
if(de.obj_spr!=nil and de.obj_spr==da) cz=de break
end
end
if cz!=nil then
local df,dg=cy,cx
if(df>63) dg+=31 df-=64
dh(cz,df*8,dg*8)
if(cz.type==1 and cz.speed>0) mset(cy,cx,0)
end
end
end
end
end
function dh(cz,by,bz,ct,di)
local dj=cm(cz,by,bz,cz.type,nil,l[cz.func_init],l[cz.func_draw],l[cz.func_update],nil)
dj.dk=cm(cz,109,0,3,dj,nil,nil,l[cz.func_onclick])
dj.ch=dl and cz.hitpoint/2 or cz.hitpoint
dj.bj={}
for de in all(cj) do
local dm=de.req_faction
if(de.parent_id!=nil and(de.parent_id==dj.id or de.dn==dj.id))
and(dm==nil
or(dm>0 and de.req_faction==c)
or(dm<0 and-c!=dm))
then
add(dj.bj,
cm(de,109,0,4,dj,nil,nil,function(self)
if bp then
bm=self
else
cb(self,1)
end
end)
)
dj.bq=dj.bj[1]
end
end
dj.ct=ct or(dp(by,bz,dc,dd)<75 and 1 or 2)
if dj.ct==1 then
dj.dq=c
dj.bx=d
dj.bu=e
q[dj.id]=true
else
dj.dq=g
dj.bx=i
dj.bu=j
dj.dk.func_onclick=nil
end
local dr=flr(by/8)
local ds=flr(bz/8)
if cz.type==2 then
dj.dt=53
local du=(cz.id==2 or cz.id==3)
for dv=0,cz.w-1 do
for dw=0,cz.h-1 do
dx(dr+dv,ds+dw,du and 16 or 149)
end
end
if(not du) add(m,dj)
if dj.id==6 and dj.bi==nil then
p[dj.ct]=dj
local dy,dz=ea(dj,(dj.by+32)/8,(dj.bz+8)/8,eb)
dh(cj[27],dy*8,dz*8,nil,dj)
end
end
if cz.type==1 then
dj.dt=54
if(dj.norotate!=1) dj.ec=flr(rnd"8")*.125
if dj.arms>0 then
dj.ed=function(self)
self.ee=4
self.ef=self.by+4
self.eg=self.bz+4
self.eh=self.ei.by+self.ei.w/2
self.ej=self.ei.bz+self.ei.h/2
local ek=self.eh-self.ef
local el=self.ej-self.eg
local em=sqrt(ek*ek+el*el)
self.en=(ek/em)*2
self.eo=(el/em)*2
sfx(self.arms<100 and 60 or 58,3)
ep(self)
end
if dj.id==15 or dj.id==16 then
dx(dr,ds,149)
end
else
if(dj.id==27) dj.eq=0 dj.er=p[dj.ct]
end
add(n,dj)
es(dj)
end
ep(dj)
return dj
end
function cm(et,by,bz,eu,bi,func_init,func_draw,func_onclick)
local ev=(et.w or 1)*8
local ew=(et.h or 1)*8
local ex={
ey=et,
id=et.id,
hitpoint=et.hitpoint,
by=by,
bz=bz,
ez=1,
type=eu,
bi=bi,
func_onclick=func_onclick,
w=ev,
h=ew,
fa=et.obj_spr,
fb=et.w or 1,
fc=et.h or 1,
ch=0,
fd=0,
ca=0,
fe=0,
ff=0,
fg=0,
fh=1,
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
if(self.dq and self.id!=18) pal(12,self.bx) pal(14,self.bu)
if self.bt then
pal(self.bs,self.bt[self.bw])
end
if self.ec then
if not self.fi or self.fi>.025 then
if(self.speed>0) fj(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz+1,.25-self.ec,1,self.trans_col,5)
fj(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.by,self.bz,.25-self.ec,1,self.trans_col,flr(self.fh)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.by-1,self.bz-1,self.by+16,self.bz+19,0)
local fk=self.type==4 and self or self.bi
local fl=fk.hitpoint
local fm=self.ca==1 and 12 or(fk.ch<fl*.33 and 8 or fk.ch<fl*.66 and 10 or 11)
local fn=self.ca==1 and(15*(fk.ch/100)) or(15*(fk.ch/fl))
if(fk.ch>0 and not bp) rectfill(self.by,self.bz+17,self.by+fn,self.bz+18,fm)
end
if self.type>2 then
spr(self.ico_spr,self.by,self.bz,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.by,self.bz,self.w/8,self.h/8)
end
end
if self.ef then
if(self.fire_type==1) then
circfill(self.ef,self.eg,0,rnd"2"<1 and 8 or 9)
else
fo(self.ef,self.eg,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.ch<self.hitpoint*.33 and rnd"10"<1) fo(self.by+3.5,self.bz+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fg=0
end,
fp=function(self)
self.fh=max(self.fh-.4,1)
if self.fg>0 then
fq(5,true)
if(fr==0 or stat(24)>5) fr=1 music"0"
if(self.arms>0 and self.ee==0) fs(self,self.ft)
end
if(self.type<=2 and self.ch<=0 and self.fi==nil) self.ee=5 self.fu=nil self.fi=(self.type==2 and 1 or .5) sfx(self.dt,3) cv+=(self.type==2 and 0.25 or 0)
if self.fi then
self.fi-=.025
if self.fi<=0 then
if self.type==2 then
for dv=0,self.fb-1 do
for dw=0,self.fc-1 do
dx(self.by/8+dv,self.bz/8+dw,15)
end
end
del(m,self)
y[self.ft.ct]+=1
else
local fv,fw=flr(self.by/8),flr(self.bz/8)
if(fw>31) fv+=64 fw-=32
if(fx(fv,fw)<9) dx(fv,fw,20)
if(self.speed==0) dx(fv,fw,15)
del(n,self)
z[self.ft.ct]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fy(self.by+rnd(self.w),self.bz+rnd(self.h))
end
end
if self.framecount!=nil then
self.fd+=1
if(self.fd>self.framecount) then
self.fd=0
if self.altframe
and self.ee==2 then
self.obj_spr=self.fa+(self.altframe-self.obj_spr)
end
if self.bt then
self.bw+=1
if(self.bw>#self.bt) self.bw=1
end
end
end
if self.ef then
self.ef+=self.en
self.eg+=self.eo
if dp(
self.ef,self.eg,
self.eh,self.ej)<2
then
fy(self.ef,self.eg,self.fire_type)
local ei=self.ei
if dp(
self.ef,self.eg,
ei.by+ei.w/2,
ei.bz+ei.h/2)<4
then
ei.ch-=self.arms
ei.fg=self.fire_type
ei.ft=self
end
self.ef=nil
end
end
if self.ca>0
and not self.ci
and not self.fz then
if self.ca==1 and self.fe>self.cost then
self.fz=true
sfx"56"
if self.ey.type==1
and self.id!=15
and self.id!=16 then
local dy,dz=ga(self,self.bi)
dh(self.ey,dy,dz,nil,self.bi)
gb(self)
end
elseif self.ca==2 and self.ch>self.hitpoint then
self.ca=0
if self.type==1 and self.speed>0 then
l.cd(self.er)
self.ee=0
local dy,dz=ga(self,self.er)
self.by,self.bz=dy,dz
end
else
self.cf+=1
self.ch=(self.ca==1 and(self.fe/self.cost)*100 or self.ch+.5)
if(self.cf>(self.ca==1 and 3 or 100) and gc(-1,self.ca==1 and self.bi or self)) self.cf=0 self.fe+=1
end
end
end,
gd=function(self,by,bz)
self.by=by
self.bz=bz
end,
ge=function(self)
return flr(self.by/8)..","..flr(self.bz/8)
end
}
for gf,gg in pairs(et) do
if ex[gf]==nil and gg!=""then
ex[gf]=gg
end
end
if(func_init) func_init(ex)
return ex
end
function gc(gh,ex)
if(gi(f[ex.ct])+gh<0) return false
f[ex.ct]+=sgn(gh)*shr(abs(gh),16)
if(ex.ct==1) sfx"63"
return true
end
function fy(by,bz,gj)
fo(by,bz,2,
0,0,.1,0,gj==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function ep(gk)
if(gk.ct!=1 and gk.ee!=4) return
local gl=gk.type==2 and 3 or 2
for dv=-gl,gl do
for dw=-gl,gl do
local gm=flr(gk.by/8)+dv
local gn=flr(gk.bz/8)+dw
go[gm][gn]=16
gp(gm,gn)
for el=-1,1 do
for ek=-1,1 do
gp(gm+ek,gn+el)
end
end
end
end
end
function _update60()
gq()
gr()
if(t()%1==0) gs()
if(t()%1==0 and t()%2==0) gt()
x+=1
end
function _draw()
gu()
gv()
end
function cn()
go={}
for cw=-2,66 do
go[cw]={}
for gw=-2,66 do
go[cw][gw]=0
end
end
end
function gx()
local gy=flr(cq/8)
local gz=flr(cr/8)
palt(11,true)
for dv=gy-1,gy+16 do
for dw=gz-1,gz+16 do
if go[dv][dw]!=0 and go[dv][dw]!=16 then
spr(go[dv][dw]+31,dv*8,dw*8)
elseif go[dv][dw]<16 then
rectfill(dv*8,dw*8,dv*8+7,dw*8+7,0)
end
end
end
end
function gp(by,bz)
if(by<0 or by>#go or bz<0 or bz>#go) return
local ha=0
if go[by][bz]!=0 then
if(go[by][bz-1]>0) ha+=1
if(go[by-1][bz]>0) ha+=2
if(go[by+1][bz]>0) ha+=4
if(go[by][bz+1]>0) ha+=8
go[by][bz]=1+ha
end
end
function gt()
r={}
if bc then
for cw=0,124,4 do
for gw=0,124,4 do
local cy=cw/2
local cx=gw/2
if(cx>=32) cy+=64 cx-=32
local hb=mget(cy,cx)
local hc=(hb*8)%128
local hd=(hb*8)/16
local fm=sget(hc+4,hd)
if(go[cw/2][gw/2]==16) r[((cw/2)/2)..","..((gw/2)/2)]=fm!=11 and fm or 15
end
end
end
he=0
hf=0
hg=false
hh={0,0}
for hi,hj in pairs(m) do
local gm=flr(hj.by/8)
local gn=flr(hj.bz/8)
if hj.ct==1 or(bc and go[gm][gn]==16) then
r[flr(hj.by/2/8)..","..flr(hj.bz/2/8)]=hj.bx
end
if(hj.ct==1) then
he-=hj.ey.power
if(hj.id==7) hg=true
if(sub(hj.name,1,5)=="sPICE") hf+=1000
end
hh[hj.ct]+=1
end
if bc then
for hi,hk in pairs(n) do
if hk.ct==1 or go[flr(hk.by/8)][flr(hk.bz/8)]==16 then
r[flr(hk.by/2/8)..","..flr(hk.bz/2/8)]=hk.bx
end
end
if(hl and go[mid(0,flr(hm/8),31)][mid(0,flr(hn/8),31)]==16) r[flr(hm/2/8)..","..flr(hn/2/8)]=7
end
bc=(hg and he>0)
fq(5,false)
fr=2
if(f[3]>0 and f[1]>f[3]) ho=1
if(hh[2]==0 and b>1) ho=2
if(hh[1]==0) ho=3
if ho then
dset(14,ho)
dset(13,t()-v)
dset(10,hp)
dset(24,gi(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
hq("mission "..(ho<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gs()
o={}
for gf,hk in pairs(n) do
o[flr(hk.by/8)..","..flr(hk.bz/8)]=gf
end
end
function gq()
hr,hs,ht=stat"32",stat"33",stat"34"
hu=(ht==1 and hv!=ht) or btnp"4"
hw=(ht>0) or btn"4"
hx=(ht==2 and hv!=ht) or btnp"5"
for gf=0,1 do
if(btn(gf)) ba+=gf*2-1
if(btn(gf+2)) bb+=gf*2-1
end
hy=mid(0,hr+ba,127)
hz=mid(0,hs+bb,127)
cursor.by=hy
cursor.bz=hz
if not bp then
if(hy<4) cq-=2
if(hy>123) cq+=2
if(hz<4) cr-=2
if(hz>123) cr+=2
cq=mid(cq,384)
cr=mid(cr,384)
for hi,hk in pairs(n) do
if hk then
if hk.fu and costatus(hk.fu)!='dead'then
assert(coresume(hk.fu,hk))
else
hk.fu=nil
end
if hl
and fget(fx(flr(hk.by/8),flr(hk.bz/8)),2)
and dp(hm,hn,hk.by,hk.bz)<1
then
del(n,hk)
ia=.01
end
end
end
ib()
end
ic()
hv,cc,br=ht,bm,bg
end
function ie(by,bz)
local fn=fx(by,bz)
return fn>=2 and fn<=8
end
function es(hk,ig)
hk.ee=ig or 0
hk.fu=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0 and self.ee!=8) ea(self,flr(self.by/8),flr(self.bz/8),ih,self.range)
local er=self.er
if self.id==27 then
if self.ee==0 or self.ee==7 or self.ee==9 then
if self.eq<=1500
and self.ee!=7 and self.ee!=9 then
local hc,hd
local ii,ij=flr(self.by/8),flr(self.bz/8)
if ie(ii,ij) and not self.ik then
hc,hd=ii,ij
else
ea(self,ii,ij,
function(hk,by,bz)
if ie(by,bz) and rnd"10"<1 then
hc,hd=by,bz
return true
end
end,
10)
end
if hc and hd then
il(hk,hc,hd)
if(ie(flr(hk.by/8),flr(hk.bz/8))) hk.ee=6
end
end
elseif self.eq>=1500
and self.ee!=7 then
self.ee=7
er.bv=true
il(self,(er.by+16)/8,er.bz/8)
self.ee=9
elseif self.ee==6 then
self.ik=false
local ec=hk.ec+.75
im(hk.by,hk.bz,hk.ec+.75+rnd".2"-.1)
local io=hk:ge()
s[io]=(s[io] or 10000)-1
self.eq=(self.eq or 0)+.5
if s[io]<=0 then
local dr=flr(self.by/8)
local ds=flr(self.bz/8)
for dw=-1,1 do
for dv=-1,1 do
fn=fx(dr+dv,ds+dw)
dx(dr+dv,ds+dw,
(dv==0 and dw==0) and 0 or((fn>1 and fn<8) and 8 or fn)
)
end
end
self.ee=0
end
if(self.eq%300==0) self.ik=true self.ee=0
end
end
if self.id>21 then
if self.ee==9 then
if not er.ip then
er.bv=false
self.ee=8
self.ec=.25
self.by=er.by+16
self.bz=er.bz+4
if(bm==self) bm=nil
if self.eq then
er.ip=true
while self.eq>0 do
self.eq-=1
if(flr(self.eq)%4==0 and tonum(hp)<hf) gc(2,self)
yield()
end
self.eq=0
er.ip=false
self.ee=0
else
self.ca=2
self.cf=0
er.bs=8
er.bt={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function ga(ex,ei)
local dy,dz=ea(ex,(ei.by+8)/8,(ei.bz+16)/8,eb)
return dy*8,dz*8
end
function im(by,bz,ec)
local iq,ir=sin(ec)*5.5,-cos(ec)*5.5
if(rnd"5"<1) fo(by+iq+3.5,bz+ir+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fs(hk,ei)
hk.ee=3
hk.ei=ei
hk.fu=cocreate(function(self)
while ei.ch>0 do
local is=dp(hk.by,hk.bz,ei.by,ei.bz)
if is>hk.range*5
and hk.speed>0 then
il(hk,flr(ei.by/8),flr(ei.bz/8),hk.range*5)
end
if not hk.norotate then
local it=atan2(hk.by-ei.by,hk.bz-ei.bz)
while(hk.ec!=it) do
iu(hk,it)
end
end
if(is<=hk.range*5) then
hk.ff-=1
if(hk.ff<=0 and not hk.ef) hk.ed(hk) hk.ff=hk.arms*4
elseif hk.speed==0 then
es(hk)
end
yield()
end
es(self)
end)
end
function ea(hk,by,bz,iv,iw)
for dp=1,iw or 64 do
for dv=by-dp,by+dp do
for dw=bz-dp,bz+dp do
if((dv==by-dp or dv==by+dp or dw==bz-dp or dw==bz+dp) and(iv(hk,dv,dw))) return dv,dw
end
end
yield()
end
end
function fx(cy,cx)
if(cx>31) cy+=64 cx-=32
return mget(cy,cx)
end
function dx(cy,cx,ix)
if(cx>31) cy+=64 cx-=32
mset(cy,cx,ix)
end
function eb(hk,by,bz)
return not fget(fx(by,bz),0)
and o[by..","..bz]==nil
end
function ih(hk,by,bz)
local ei=n[o[by..","..bz]]
if(ei!=iy and ei.ct!=hk.ct and go[by][bz]==16) fs(hk,ei) return true
end
function il(hk,by,bz,iz)
::restart_move_unit::
hk.ja="init"
if not eb(nil,by,bz) then
by,bz=ea(hk,by,bz,eb)
end
hk.ii=by
hk.ij=bz
hk.jb=hk.ee
hk.ee=1
hk.ja=jc(
{by=flr(hk.by/8),bz=flr(hk.bz/8)},
{by=hk.ii,bz=hk.ij},
jd,
je,
jf,
function(jg) return shl(jg.bz,8)+jg.by end,
nil)
hk.jb=hk.ee
hk.ee=2
hk.ee=2
if hk.ja!=nil then
for cw=#hk.ja-1,1,-1 do
local jg=hk.ja[cw]
if not hk.norotate then
local it=atan2(
hk.by-(jg.by*8),
hk.bz-(jg.bz*8))
while(hk.ec!=it) do
iu(hk,it)
end
end
if(not eb(nil,jg.by,jg.bz)) goto restart_move_unit
local jh=hk.speed or .5
local ji=sqrt((jg.by*8-hk.by)^2+(jg.bz*8-hk.bz)^2)
local jj=jh*(jg.by*8-hk.by)/ji
local jk=jh*(jg.bz*8-hk.bz)/ji
for cw=0,ji/jh-1 do
o[jg.by..","..jg.bz]=hk
hk.by+=jj
hk.bz+=jk
yield()
end
hk.by,hk.bz=jg.by*8,jg.bz*8
o[jg.by..","..jg.bz]=hk
ep(hk)
if(dp(hk.by,hk.bz,hk.ii*8,hk.ij*8)<=(iz or 0)) break
end
end
hk.ee=0
end
jl=0
function gr()
if(t()>k and t()%k*2==0) then
local jm=n[flr(rnd(#n))+1]
if jm.ct==2 and jm.arms>0 and jm.ee==0 then
local jn=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if jn and jn.ct==1 then
fs(jm,jn)
end
end
end
jl-=1
if(jl<0) then
if hl then
hl=nil
else
hl,jo,jp,jq,ia={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
jl=rnd(5000)
end
if hl then
if(x%6<1 or#hl<30) and ia==0 then
while#hl<31 do
if(rnd(9)<.5) jp=rnd(.04)-.02
hm,hn=hl[#hl][1],hl[#hl][2]
add(hl,{hm+sin(jo),hn-cos(jo)})
jo+=jp
end
end
if(#hl>30) del(hl,hl[1])
if(ia>0) ia+=.01 im(hm,hn,rnd"1")
if(ia>2) ia=0
end
end
function gu()
cls"15"
camera(cq+(16-rnd(32))*cv,cr+(16-rnd(32))*cv)
cv=(cv>0.05) and cv*0.95 or 0
if hl then
for cw=1,#hl do
if(cw%2==1) fillp(0xa5a5.8)
circfill(
hl[cw][1]+4,
hl[cw][2]+4,4,
jq[cw%#jq+1])
fillp()
end
if(ia>0) spr(94+ia,hm,hn)
end
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hi,hj in pairs(m) do
if not bp then
hj:fp()
if(hj.bq) hj.bq:fp()
end
hj:cs()
if(hj==bm) then
rect(bm.by,bm.bz,
bm.by+bm.w-1,bm.bz+bm.h-1,
7)
end
end
for hi,hk in pairs(n) do
if(not bp) hk:fp()
if(hk.ca!=2 or hk.speed==0) hk:cs()
if(hk==bm) then
palt(11,true)
spr(17,bm.by,bm.bz)
end
end
jr()
gx()
end
function js()
local gl=31
rect(92,92,125,125,e)
rectfill(93,93,124,124,0)
if bc!=be then
bd=bc and 1 or 59
jt=bc and 1 or-1
sfx(55)
gt()
end
be=bc
if bd>0 and bd<60 then
bd+=jt
clip(
max(108-bd,94),
max(108-(bd>20 and bd-20 or 0),94),
min(bd*2,31),
min((bd>20 and bd-20 or 1)*2,31))
for cw=1,300 do
pset(93+rnd"31",93+rnd"31",5+rnd"3")
end
clip()
return
end
for dv=0,31 do
for dw=0,31 do
if(r[dv..","..dw]) pset(93+dv,93+dw,r[dv..","..dw])
end
end
local iq=93+cq/16
local ir=93+cr/16
rect(iq,ir,iq+7,ir+7,7)
end
function gv()
camera(0,0)
pal()
palt(0,false)
if bm and bm.dk then
bm.dk:gd(109,20)
bm.dk:cs()
if bm.bq and bm.ct==1 then
bm.bq:gd(109,44)
bm.bq:cs()
end
if bm.ch<bm.hitpoint
and bm.ct==1
and bm.id!=4
and(bm.type==2
or bm.id==15
or bm.id==16) then
cl:gd(117,28)
cl:cs()
end
end
hp=gi(f[1])
hq(sub("000000",#hp+1)..hp,103,2,7)
if bm
and bm.bq
and(bm.bq.type==4
or bm.bq.id==15
or bm.bq.id==16)
and bm.bq.ch>=100 then
local ju=flr((cursor.by+cq)/8)
local jv=flr((cursor.bz+cr)/8)
local jw=ju*8-cq
local jx=jv*8-cr
jy=false
jz=false
dl=false
local w=bm.bq.fb
local h=bm.bq.fc
for dv=-1,w do
for dw=-1,h do
if dv==-1 or dv==w or dw==-1 or dw==h then
if(fx(ju+dv,jv+dw)==16 or fx(ju+dv,jv+dw)>=63) jy=true
else
local fn=fx(ju+dv,jv+dw)
if(fn>=9 and fn<=15) dl=true
if(o[ju+dv..","..jv+dw] or fn==0 or fn<8 or fn>16) jz=true
end
end
end
if(jz) jy=false
fillp("0b1110110110110111.1")
rectfill(jw,jx,
jw+bm.bq.w,jx+bm.bq.h,jy and 11 or 8)
fillp()
end
js()
if bp then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bm.bj then
bm.bn={}
rectfill(6,25,27,92,0)
local ka=1
for cw=1,#bm.bj do
local kb=bm.bj[cw]
if kb.req_id==nil
or q[kb.req_id] then
bm.bn[ka]=kb
if ka>=bf and ka<=bf+2 then
kb:gd(9,28+((ka-bf)*19))
kb:cs()
else
kb:gd(-16,16)
end
if(bg==kb) then
bl=ka
rect(kb.by-2,kb.bz-2,
kb.by+17,kb.bz+17,
7)
print(bg.name,30,26,7)
print("cOST:"..bg.cost,85,33,9)
kc=0
for gw in all(kd(bg.description,23)) do
print(gw,30,39+kc,6)
kc+=6
end
end
ka+=1
end
end
end
for hi,ke in pairs(bh) do
ke:cs()
end
end
palt(11,true)
cursor:cs()
end
function bk(by,bz,kf,func_onclick,ev)
add(bh,{
by=by,
bz=bz,
w=ev or#kf*4+2,
h=8,
kf=kf,
co=function(self)
return{
by=self.by,
bz=self.bz,
w=self.w,
h=self.h
}
end,
cs=function(self)
if(#kf>1) rectfill(self.by,self.bz,self.by+self.w,self.bz+self.h,7)
if(#kf>1) rectfill(self.by+1,self.bz+1,self.by+self.w-1,self.bz+self.h-1,self.kg and 12 or 6)
print(self.kf,self.by+2,self.bz+2,(#kf>1) and 0 or(self.kg and 12 or 7))
end,
func_onclick=func_onclick
})
end
function kd(kh,ki)
local kj={}
local kk=""
local kl=""
local km=""
local kn=function(ko)
if#kl+#kk>ko then
add(kj,kk)
kk=""
end
kk=kk..kl
kl=""
end
for cw=1,#kh do
km=sub(kh,cw,cw)
kl=kl..km
if km==" "
or#kl>ki-1 then
kn(ki)
elseif#kl>ki-1 then
kl=kl.."-"
kn(ki)
elseif km==";"then
kk=kk..sub(kl,1,#kl-1)
kl=""
kn(0)
end
end
kn(ki)
if kk!=""then
add(kj,kk)
end
return kj
end
function ic()
kp=false
if bm then
cp=true
if(cc.ch and cc.ch<cc.hitpoint) kq(cl)
if(bm.dk and not bp and not kp) kq(bm.dk)
foreach(bm.bj,kq)
if(bp) foreach(bh,kq)
cp=false
end
if not bp
and not kp then
foreach(n,kq)
foreach(m,kq)
end
if hw
and not bp
and hy>89 and hy<122
and hz>90 and hz<123 then
cq=mid(0,(hy-94)*16,400)
cr=mid(0,(hz-94)*16,400)
elseif hu then
if kp then
if(not bp and bm.func_onclick and bm.bi!=nil) bm:func_onclick() bm=cc return
if(bp and bg.kf and bg.func_onclick) bg:func_onclick()
if(bm.ct==1 and bm.type==1 and bm!=cc and bm.speed>0) sfx(62)
if(bm.ct==2 and cc and cc.type==1 and cc.ct==1) bm.fh=10 fs(cc,bm) bm=nil
else
if bm
and bm.type==1
and bm.ct==1
and bm.speed>0
and bm.ee!=7 then
bm.fu=cocreate(function(hk)
il(hk,flr((cq+hy)/8),flr((cr+hz)/8))
es(hk)
end)
end
if bm
and bm.bq
and bm.bq.ch>=100
and jy then
local dr=flr((cursor.by+cq)/8)
local ds=flr((cursor.bz+cr)/8)
local cz=bm.bq.ey
dh(cz,dr*8,ds*8,1)
gb(bm.bq)
sfx"61"
end
if(not bp) bm=nil
end
elseif hx and not bp then
bm=nil
end
end
function gb(ex)
ex.ch=0
ex.ca=0
ex.fe=0
ex.fz=false
end
function kq(ex)
ex.kg=kr(cursor,ex)
if hu and ex.kg then
if bp then
bg=ex
else
if(ex.type<=2 and go[flr((cursor.by+cq)/8)][flr((cursor.bz+cr)/8)]!=16) return
if(ex.ee==8) return
if bm
and(ex.id==6 and bm.id==27
or ex.id==14 and bm.id>21)
and bm.ct==1 then
bm.ee=7
bm.er=ex
ex.bv=true
bm.fu=cocreate(function(hk)
il(hk,(ex.by+16)/8,(ex.bz+16)/8)
es(hk,9)
end)
return
else
bm=ex
end
end
kp=true
end
end
function fq(ks,kt)
ks*=4
local fn=peek(0x3100+ks+1)
if((band(fn,128)>0)!=kt) fn=bxor(fn,128)
poke(0x3100+ks+1,fn)
end
function hq(ku,kv,
kw,fm,
kx)
for dv=-1,1 do
for dw=-1,1 do
print(ku,kv+dv,kw+dw,kx)
end
end
print(ku,kv,kw,fm)
end
function kr(ky,kz)
local la=ky:co()
local lb=kz:co()
return la.by<lb.by+lb.w and
la.by+la.w>lb.by and
la.bz<lb.bz+lb.h and
la.bz+la.h>lb.bz
end
function ck()
lc=ld(cj,"|","\n")
cj={}
for cw=2,#lc-1 do
le={}
for lf=1,#lc[cw] do
local fn=lc[cw][lf]
if(lf!=2 and lf<25) fn=tonum(fn)
le[lc[1][lf]]=fn
end
cj[tonum(lc[cw][1])]=le
end
end
function gi(fn)
local lg=""
local gg=abs(fn)
repeat
lg=(gg%0x0.000a/0x.0001)..lg
gg/=10
until gg==0
if(fn<0) lg="-"..lg
return lg
end
function ld(ku,em,lh)
local it={}
local li=0
local lg=''
local lj=''
if lh~=nil then ku=ld(ku,lh) end
while#ku>0 do
if type(ku)=='table'then
lg=ku[1]
add(it,ld(lg,em))
del(ku,lg)
else
lg=sub(ku,1,1)
ku=sub(ku,2)
if lg==em then
add(it,lj)
lj=''
else
lj=lj..lg
end
end
end
add(it,lj)
return it
end
local lk=0
function fj(hc,hd,by,bz,it,w,ll,lm)
local ln,lo=cos(it),sin(it)
local lp,lq,lr,lt
local lu,lv=ln,lo
local ha=shl(0xfff8,(w-1))
w*=4
ln*=w-0.5
lo*=w-0.5
local lw,lx=lo-ln+w,-ln-lo+w
w=2*w-1
for ly=0,w do
lp,lq=lw,lx
for lz=0,w do
if band(bor(lp,lq),ha)==0 then
local li=sget(hc+lp,hd+lq)
if(li!=ll) pset(by+ly,bz+lz,lm or li)
end
lp-=lv
lq+=lu
end
lw+=lu
lx+=lv
end
end
function dp(ma,mb,mc,md)
return abs(sqrt(((ma-mc)/1000)^2+((mb-md)/1000)^2)*1000)
end
function iu(hk,me)
local mf=3.14159
local mg=0.0087
local gh=me-hk.ec
if gh>0.5 then
gh-=1
elseif gh<-0.5 then
gh+=1
end
if gh>mg then
hk.ec+=mg
elseif gh<-mg then
hk.ec-=mg
else
hk.ec=me
end
if(hk.ec>mf) hk.ec-=2*mf
if(hk.ec<-mf) hk.ec+=2*mf
yield()
end
function je(mh,jg,mi)
local mj=fget(fx(jg.by,jg.bz),1) and 4 or 1
if(mh.by!=jg.by and mh.bz!=jg.bz) return mj+1
return mj
end
function jf(jg,mi)
local mk={}
for dv=-1,1 do
for dw=-1,1 do
if(dv!=0 or dw!=0) ml(jg.by+dv,jg.bz+dw,mk)
end
end
return mk
end
function ml(mm,mn,mo)
if(
not fget(fx(mm,mn),0)
and o[mm..","..mn]==nil
and mm>=0
and mn>=0
and mm<=63
and mn<=63
)
then
add(mo,{by=mm,bz=mn})
end
end
function jd(it,mp)
return abs(it.by-mp.by)+abs(it.bz-mp.bz)
end
function jc
(mq,
mr,
ms,
mt,
mk,
mu,
mi)
local mv,
mw={
mx=mq,
my=0,
mz=ms(mq,mr,mi)
},{}
mw[mu(mq,mi)]=mv
local na,nb,nc,nd={mv},1,mu(mr,mi),32767.99
local count=0
while nb>0 do
local cost,ne=nd
for cw=1,nb do
local nf=na[cw].my+na[cw].mz
if(nf<=cost) ne,cost=cw,nf
end
mv=na[ne]
na[ne],mv.ng=na[nb],true
nb-=1
local nh=mv.mx
if mu(nh,mi)==nc then
nh={mr}
while mv.ni do
mv=mw[mu(mv.ni,mi)]
add(nh,mv.mx)
end
return nh
end
for nj in all(mk(nh,mi)) do
local id=mu(nj,mi)
local nk,nl=
mw[id],
mv.my+mt(nh,nj,mi)
if not nk then
nk={
mx=nj,
my=nd,
mz=ms(nj,mr,mi)
}
nb+=1
na[nb],mw[id]=nk,nk
end
if not nk.ng and nk.my>nl then
nk.my,nk.ni=nl,nh
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
function fo(by,bz,ec,ek,el,nm,nn,ch,no,ks)
local nh={
by=by,bz=bz,ec=ec,ek=ek,el=el,nm=nm,
ch=0,nn=nn or 0.0625,
no=no or{7,6,5},ks=ks or 0,
np=bz,nq=ch or 8
}
add(u,nh)
end
function ib()
for gf,nh in pairs(u) do
nh.el+=nh.nn
nh.by+=nh.ek
nh.bz+=nh.el
nh.ec+=nh.nm
nh.ch+=1
if(nh.ch>=nh.nq) del(u,nh)
end
end
function jr()
for gf,nh in pairs(u) do
local fm=flr((#nh.no/nh.nq)*nh.ch)+1
if(nh.ks) fillp(nh.ks)
circfill(nh.by,nh.bz,nh.ec,nh.no[fm])
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
d555555577bbbb77bb77bbbbbbbbbbbbbb66669bbbbbbbbbb6bbbbbb155551551555515515555155155244444444444444444455155024444444444444444055
d5555555bbbbbbbbb79bb7bb0000b000b66dd66bbd5bb5bbbbbbbb6b5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
d5555555bbbbbbbb79b779bb07700077b6d55d6bb5dbbbbbbbbbbbbb555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
d5555555bbbbbbbbbb799bbb00777770b6d55d6bbbbb555bbbbbbbbbd55555555544444444455555d52444444444444444444445d55510022244444222201555
d5555555bbbbbbbbb799bbbb07700077b66dd66bbbbb5d5bbbb6bbbb55d55544444444444444455555244444444444444444442555d515100022222000015555
d555555577bbbb77b79bbbbb0000b000bb6666bbbbbb555bbbbbbbbb155554444444444444444515155244444444444444444415155555151100000111155515
d5555555b7bbbb7b7bbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb555524444444444444444455555244444444444444444255555d555555111115555d5555
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

