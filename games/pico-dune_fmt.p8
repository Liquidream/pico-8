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
if(self.type<=2 and self.ch<self.hitpoint*.33 and rnd"10"<1) fo(self.by+3.5,self.bz+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
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
local dy,dz=ea(self,(self.bi.by+8)/8,(self.bi.bz+16)/8,eb)
dh(self.ey,dy*8,dz*8,nil,self.bi)
ga(self)
end
elseif self.ca==2 and self.ch>self.hitpoint then
self.ca=0
else
self.cf+=1
self.ch=(self.ca==1 and(self.fe/self.cost)*100 or self.ch+.5)
if(self.cf>(self.ca==1 and 3 or 100) and gb(-1,self.ca==1 and self.bi or self)) self.cf=0 self.fe+=1
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
for ge,gf in pairs(et) do
if ex[ge]==nil and gf!=""then
ex[ge]=gf
end
end
if(func_init) func_init(ex)
return ex
end
function gb(gg,ex)
if(gh(f[ex.ct])+gg<0) return false
f[ex.ct]+=sgn(gg)*shr(abs(gg),16)
if(ex.ct==1) sfx"63"
return true
end
function fy(by,bz,gi)
fo(by,bz,2,
0,0,.1,0,gi==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function ep(gj)
if(gj.ct!=1 and gj.ee!=4) return
local gk=gj.type==2 and 3 or 2
for dv=-gk,gk do
for dw=-gk,gk do
local gl=flr(gj.by/8)+dv
local gm=flr(gj.bz/8)+dw
gn[gl][gm]=16
go(gl,gm)
for el=-1,1 do
for ek=-1,1 do
go(gl+ek,gm+el)
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
if(a) gv("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cn()
gn={}
for cw=-2,66 do
gn[cw]={}
for gw=-2,66 do
gn[cw][gw]=0
end
end
end
function gx()
local gy=flr(cq/8)
local gz=flr(cr/8)
palt(11,true)
for dv=gy-1,gy+16 do
for dw=gz-1,gz+16 do
if gn[dv][dw]!=0 and gn[dv][dw]!=16 then
spr(gn[dv][dw]+31,dv*8,dw*8)
elseif gn[dv][dw]<16 then
rectfill(dv*8,dw*8,dv*8+7,dw*8+7,0)
end
end
end
end
function go(by,bz)
if(by<0 or by>#gn or bz<0 or bz>#gn) return
local ha=0
if gn[by][bz]!=0 then
if(gn[by][bz-1]>0) ha+=1
if(gn[by-1][bz]>0) ha+=2
if(gn[by+1][bz]>0) ha+=4
if(gn[by][bz+1]>0) ha+=8
gn[by][bz]=1+ha
end
end
function gs()
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
if(gn[cw/2][gw/2]==16) r[((cw/2)/2)..","..((gw/2)/2)]=fm!=11 and fm or 15
end
end
end
he=0
hf=0
hg=false
hh={0,0}
for hi,hj in pairs(m) do
local gl=flr(hj.by/8)
local gm=flr(hj.bz/8)
if hj.ct==1 or(bc and gn[gl][gm]==16) then
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
if hk.ct==1 or gn[flr(hk.by/8)][flr(hk.bz/8)]==16 then
r[flr(hk.by/2/8)..","..flr(hk.bz/2/8)]=hk.bx
end
end
if(hl and gn[mid(0,flr(hm/8),31)][mid(0,flr(hn/8),31)]==16) r[flr(hm/2/8)..","..flr(hn/2/8)]=7
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
dset(24,gh(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
gv("mission "..(ho<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gr()
o={}
for ge,hk in pairs(n) do
o[flr(hk.by/8)..","..flr(hk.bz/8)]=ge
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
if(hx<4) cq-=2
if(hx>123) cq+=2
if(hy<4) cr-=2
if(hy>123) cr+=2
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
local fn=fx(by,bz)
return fn>=2 and fn<=8
end
function es(hk,ie)
hk.ee=ie or 0
hk.fu=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) ea(self,flr(self.by/8),flr(self.bz/8),ig,self.range)
local er=self.er
if self.id==27 then
if self.ee==0 or self.ee==7 or self.ee==9 then
if self.eq<=1500
and self.ee!=7 and self.ee!=9 then
local hc,hd
local ih,ii=flr(self.by/8),flr(self.bz/8)
if ic(ih,ii) and not self.ij then
hc,hd=ih,ii
else
ea(self,ih,ii,
function(hk,by,bz)
if ic(by,bz) and rnd"10"<1 then
hc,hd=by,bz
return true
end
end,
10)
end
if hc and hd then
ik(hk,hc,hd)
if(ic(flr(hk.by/8),flr(hk.bz/8))) hk.ee=6
end
elseif self.ee==9 then
if not er.il then
er.bv=false
er.il=true
while self.eq>0 do
self.ee=8
self.ec=.25
self.by=er.by+16
self.bz=er.bz+4
self.eq-=1
if(bm==self) bm=nil
if(flr(self.eq)%4==0 and tonum(hp)<hf) gb(2,self)
yield()
end
self.eq=0
er.il=false
self.ee=0
end
end
elseif self.eq>=1500
and self.ee!=7 then
self.ee=7
er.bv=true
ik(self,(er.by+16)/8,er.bz/8)
self.ee=9
elseif self.ee==6 then
self.ij=false
local ec=hk.ec+.75
im(hk.by,hk.bz,hk.ec+.75+rnd".2"-.1)
local io=hk:gd()
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
if(self.eq%300==0) self.ij=true self.ee=0
end
end
yield()
end
end)
end
function im(by,bz,ec)
local ip,iq=sin(ec)*5.5,-cos(ec)*5.5
if(rnd"5"<1) fo(by+ip+3.5,bz+iq+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fs(hk,ei)
hk.ee=3
hk.ei=ei
hk.fu=cocreate(function(self)
while ei.ch>0 do
local ir=dp(hk.by,hk.bz,ei.by,ei.bz)
if ir>hk.range*5
and hk.speed>0 then
ik(hk,flr(ei.by/8),flr(ei.bz/8),hk.range*5)
end
if not hk.norotate then
local is=atan2(hk.by-ei.by,hk.bz-ei.bz)
while(hk.ec!=is) do
it(hk,is)
end
end
if(ir<=hk.range*5) then
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
function ea(hk,by,bz,iu,iv)
for dp=1,iv or 64 do
for dv=by-dp,by+dp do
for dw=bz-dp,bz+dp do
if((dv==by-dp or dv==by+dp or dw==bz-dp or dw==bz+dp) and(iu(hk,dv,dw))) return dv,dw
end
end
yield()
end
end
function fx(cy,cx)
if(cx>31) cy+=64 cx-=32
return mget(cy,cx)
end
function dx(cy,cx,iw)
if(cx>31) cy+=64 cx-=32
mset(cy,cx,iw)
end
function eb(hk,by,bz)
return not fget(fx(by,bz),0)
and o[by..","..bz]==nil
end
function ig(hk,by,bz)
local ei=n[o[by..","..bz]]
if(ei!=ix and ei.ct!=hk.ct and gn[by][bz]==16) fs(hk,ei) return true
end
function ik(hk,by,bz,iy)
::restart_move_unit::
hk.iz="init"
if not eb(nil,by,bz) then
by,bz=ea(hk,by,bz,eb)
end
hk.ih=by
hk.ii=bz
hk.ja=hk.ee
hk.ee=1
hk.iz=jb(
{by=flr(hk.by/8),bz=flr(hk.bz/8)},
{by=hk.ih,bz=hk.ii},
jc,
jd,
je,
function(jf) return shl(jf.bz,8)+jf.by end,
nil)
hk.ja=hk.ee
hk.ee=2
hk.ee=2
if hk.iz!=nil then
for cw=#hk.iz-1,1,-1 do
local jf=hk.iz[cw]
if not hk.norotate then
local is=atan2(
hk.by-(jf.by*8),
hk.bz-(jf.bz*8))
while(hk.ec!=is) do
it(hk,is)
end
end
if(not eb(nil,jf.by,jf.bz)) goto restart_move_unit
local jg=hk.speed or .5
local jh=sqrt((jf.by*8-hk.by)^2+(jf.bz*8-hk.bz)^2)
local ji=jg*(jf.by*8-hk.by)/jh
local jj=jg*(jf.bz*8-hk.bz)/jh
for cw=0,jh/jg-1 do
o[jf.by..","..jf.bz]=hk
hk.by+=ji
hk.bz+=jj
yield()
end
hk.by,hk.bz=jf.by*8,jf.bz*8
o[jf.by..","..jf.bz]=hk
ep(hk)
if(dp(hk.by,hk.bz,hk.ih*8,hk.ii*8)<=(iy or 0)) break
end
end
hk.ee=0
end
jk=0
function gq()
if(t()>k and t()%k*2==0) then
local jl=n[flr(rnd(#n))+1]
if jl.ct==2 and jl.arms>0 and jl.ee==0 then
local jm=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if jm and jm.ct==1 then
printh(">>> attack!")
fs(jl,jm)
end
end
end
jk-=1
if(jk<0) then
if hl then
hl=nil
else
hl,jn,jo,jp,hz={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
jk=rnd(5000)
end
if hl then
if(x%6<1 or#hl<30) and hz==0 then
while#hl<31 do
if(rnd(9)<.5) jo=rnd(.04)-.02
hm,hn=hl[#hl][1],hl[#hl][2]
add(hl,{hm+sin(jn),hn-cos(jn)})
jn+=jo
end
end
if(#hl>30) del(hl,hl[1])
if(hz>0) hz+=.01 im(hm,hn,rnd"1")
if(hz>2) hz=0
end
end
function gt()
cls"15"
camera(cq+(16-rnd(32))*cv,cr+(16-rnd(32))*cv)
cv=(cv>0.05) and cv*0.95 or 0
if hl then
for cw=1,#hl do
if(cw%2==1) fillp(0xa5a5.8)
circfill(
hl[cw][1]+4,
hl[cw][2]+4,4,
jp[cw%#jp+1])
fillp()
end
if(hz>0) spr(94+hz,hm,hn)
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
hk:cs()
if(hk==bm) then
palt(11,true)
spr(17,bm.by,bm.bz)
end
end
jq()
gx()
end
function jr()
local gk=31
rect(92,92,125,125,e)
rectfill(93,93,124,124,0)
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
local ip=93+cq/16
local iq=93+cr/16
rect(ip,iq,ip+7,iq+7,7)
end
function gu()
camera(0,0)
pal()
palt(0,false)
if bm and bm.dk then
bm.dk:gc(109,20)
bm.dk:cs()
if bm.bq and bm.ct==1 then
bm.bq:gc(109,44)
bm.bq:cs()
end
if bm.ch<bm.hitpoint
and bm.ct==1
and bm.id!=4
and(bm.type==2
or bm.id==15
or bm.id==16) then
cl:gc(117,28)
cl:cs()
end
end
hp=gh(f[1])
gv(sub("000000",#hp+1)..hp,103,2,7)
if bm
and bm.bq
and(bm.bq.type==4
or bm.bq.id==15
or bm.bq.id==16)
and bm.bq.ch>=100 then
local jt=flr((cursor.by+cq)/8)
local ju=flr((cursor.bz+cr)/8)
local jv=jt*8-cq
local jw=ju*8-cr
jx=false
jy=false
dl=false
local w=bm.bq.fb
local h=bm.bq.fc
for dv=-1,w do
for dw=-1,h do
if dv==-1 or dv==w or dw==-1 or dw==h then
if(fx(jt+dv,ju+dw)==16 or fx(jt+dv,ju+dw)>=63) jx=true
else
local fn=fx(jt+dv,ju+dw)
if(fn>=9 and fn<=15) dl=true
if(o[jt+dv..","..ju+dw] or fn==0 or fn<8 or fn>16) jy=true
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
for cw=1,#bm.bj do
local ka=bm.bj[cw]
if ka.req_id==nil
or q[ka.req_id] then
bm.bn[jz]=ka
if jz>=bf and jz<=bf+2 then
ka:gc(9,28+((jz-bf)*19))
ka:cs()
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
for gw in all(kc(bg.description,23)) do
print(gw,30,39+kb,6)
kb+=6
end
end
jz+=1
end
end
end
for hi,kd in pairs(bh) do
kd:cs()
end
end
palt(11,true)
cursor:cs()
end
function bk(by,bz,ke,func_onclick,ev)
add(bh,{
by=by,
bz=bz,
w=ev or#ke*4+2,
h=8,
ke=ke,
co=function(self)
return{
by=self.by,
bz=self.bz,
w=self.w,
h=self.h
}
end,
cs=function(self)
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
for cw=1,#kg do
kl=sub(kg,cw,cw)
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
cp=true
if(cc.ch and cc.ch<cc.hitpoint) kp(cl)
if(bm.dk and not bp and not ko) kp(bm.dk)
foreach(bm.bj,kp)
if(bp) foreach(bh,kp)
cp=false
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
cq=mid(0,(hx-94)*16,400)
cr=mid(0,(hy-94)*16,400)
elseif ht then
if ko then
if(not bp and bm.func_onclick and bm.bi!=nil) bm:func_onclick() bm=cc return
if(bp and bg.ke and bg.func_onclick) bg:func_onclick()
if(bm.ct==1 and bm.type==1 and bm!=cc and bm.speed>0) sfx(62)
if(bm.ct==2 and cc and cc.type==1 and cc.ct==1) bm.fh=10 fs(cc,bm) bm=nil
else
if bm
and bm.type==1
and bm.ct==1
and bm.speed>0
and(bm.id!=27 or bm.ee!=7) then
bm.fu=cocreate(function(hk)
ik(hk,flr((cq+hx)/8),flr((cr+hy)/8))
es(hk)
end)
end
if bm
and bm.bq
and bm.bq.ch>=100
and jx then
local dr=flr((cursor.by+cq)/8)
local ds=flr((cursor.bz+cr)/8)
local cz=bm.bq.ey
dh(cz,dr*8,ds*8,1)
ga(bm.bq)
sfx"61"
end
if(not bp) bm=nil
end
elseif hw and not bp then
bm=nil
end
end
function ga(ex)
ex.ch=0
ex.ca=0
ex.fe=0
ex.fz=false
end
function kp(ex)
ex.kf=kq(cursor,ex)
if ht and ex.kf then
if bp then
bg=ex
else
if(ex.type<=2 and gn[flr((cursor.by+cq)/8)][flr((cursor.bz+cr)/8)]!=16) return
if(ex.id==27 and ex.ee==8) return
if ex.id==6 and bm and bm.id==27 and bm.ct==1 then
bm.ee=7
bm.er=ex
bm.er.bv=true
bm.fu=cocreate(function(hk)
ik(hk,(ex.by+16)/8,ds)
es(hk,9)
end)
return
else
bm=ex
end
end
ko=true
end
end
function fq(kr,ks)
kr*=4
local fn=peek(0x3100+kr+1)
if((band(fn,128)>0)!=ks) fn=bxor(fn,128)
poke(0x3100+kr+1,fn)
end
function gv(kt,ku,
kv,fm,
kw)
for dv=-1,1 do
for dw=-1,1 do
print(kt,ku+dv,kv+dw,kw)
end
end
print(kt,ku,kv,fm)
end
function kq(kx,ky)
local kz=kx:co()
local la=ky:co()
return kz.by<la.by+la.w and
kz.by+kz.w>la.by and
kz.bz<la.bz+la.h and
kz.bz+kz.h>la.bz
end
function ck()
lb=lc(cj,"|","\n")
cj={}
for cw=2,#lb-1 do
ld={}
for le=1,#lb[cw] do
local fn=lb[cw][le]
if(le!=2 and le<25) fn=tonum(fn)
ld[lb[1][le]]=fn
end
cj[tonum(lb[cw][1])]=ld
end
end
function gh(fn)
local lf=""
local gf=abs(fn)
repeat
lf=(gf%0x0.000a/0x.0001)..lf
gf/=10
until gf==0
if(fn<0) lf="-"..lf
return lf
end
function lc(kt,em,lg)
local is={}
local lh=0
local lf=''
local li=''
if lg~=nil then kt=lc(kt,lg) end
while#kt>0 do
if type(kt)=='table'then
lf=kt[1]
add(is,lc(lf,em))
del(kt,lf)
else
lf=sub(kt,1,1)
kt=sub(kt,2)
if lf==em then
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
function fj(hc,hd,by,bz,is,w,lk,ll)
local lm,ln=cos(is),sin(is)
local lo,lp,lq,lr
local lt,lu=lm,ln
local ha=shl(0xfff8,(w-1))
w*=4
lm*=w-0.5
ln*=w-0.5
local lv,lw=ln-lm+w,-lm-ln+w
w=2*w-1
for lx=0,w do
lo,lp=lv,lw
for ly=0,w do
if band(bor(lo,lp),ha)==0 then
local lh=sget(hc+lo,hd+lp)
if(lh!=lk) pset(by+lx,bz+ly,ll or lh)
end
lo-=lu
lp+=lt
end
lv+=lt
lw+=lu
end
end
function dp(lz,ma,mb,mc)
return abs(sqrt(((lz-mb)/1000)^2+((ma-mc)/1000)^2)*1000)
end
function it(hk,md)
local me=3.14159
local mf=0.0087
local gg=md-hk.ec
if gg>0.5 then
gg-=1
elseif gg<-0.5 then
gg+=1
end
if gg>mf then
hk.ec+=mf
elseif gg<-mf then
hk.ec-=mf
else
hk.ec=md
end
if(hk.ec>me) hk.ec-=2*me
if(hk.ec<-me) hk.ec+=2*me
yield()
end
function jd(mg,jf,mh)
local mi=fget(fx(jf.by,jf.bz),1) and 4 or 1
if(mg.by!=jf.by and mg.bz!=jf.bz) return mi+1
return mi
end
function je(jf,mh)
local mj={}
for dv=-1,1 do
for dw=-1,1 do
if(dv!=0 or dw!=0) mk(jf.by+dv,jf.bz+dw,mj)
end
end
return mj
end
function mk(ml,mm,mn)
if(
not fget(fx(ml,mm),0)
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
for cw=1,na do
local ne=mz[cw].mx+mz[cw].my
if(ne<=cost) nd,cost=cw,ne
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
function fo(by,bz,ec,ek,el,nl,nm,ch,nn,kr)
local ng={
by=by,bz=bz,ec=ec,ek=ek,el=el,nl=nl,
ch=0,nm=nm or 0.0625,
nn=nn or{7,6,5},kr=kr or 0,
no=bz,np=ch or 8
}
add(u,ng)
end
function ia()
for ge,ng in pairs(u) do
ng.el+=ng.nm
ng.by+=ng.ek
ng.bz+=ng.el
ng.ec+=ng.nl
ng.ch+=1
if(ng.ch>=ng.np) del(u,ng)
end
end
function jq()
for ge,ng in pairs(u) do
local fm=flr((#ng.nn/ng.np)*ng.ch)+1
if(ng.kr) fillp(ng.kr)
circfill(ng.by,ng.bz,ng.ec,ng.nn[fm])
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
0400040404040404040202020202000000000600040406010101010101010101010101010000000000000101010000000101010101010101010101010101010101010101010102010101020201010000010101010101020101010202010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212090c0c0b0032165d85850a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120980101010100a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120d101010100a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000010101010100d4d440e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212101010100e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121209100a0a0b16004d010a0000120a090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212090a0a0a0d005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00120a0a0a0a161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000d0a0a0e0016850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120036005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a0b000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000003500005d4d4d5d00000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
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

