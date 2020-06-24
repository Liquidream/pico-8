pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
a=true
cartdata("pn_undune2")
b,c,d,e=dget"0",dget"1",dget"2",dget"3"
f,g,i,j=dget"20",dget"21",dget"22",dget"23"
k={
0.001,
shr(500,16),
shr(dget(7),16),
}
l,m,n,o,p,q,r,s,u={},{},{},{},{},{},{},{},{}
v,x,y,ba,bb,bc,bd,be=t(),0,{0,0},{0,0},0,0,false,0
bf=bd
bg,bh="",0
l.factory_click=function(self)
bi,bj,bk=1,self.bl.bm[1],{}
bn(6,84,"⬆️",function()
bo=mid(1,bo-1,#bp.bq)
bj=bp.bq[bo]
if(bo<bi) bi-=1
end,10)
bn(17,84,"⬇️",function()
local br=#bp.bq
bo=mid(1,bo+1,br)
bj=bp.bq[bo]
bi=mid(bi+1,br-2)
if(bo>bi+2) bi=min(bi+1,br-2)
end,10)
bn(32,83,"build",function()
bs,bp.bt=nil,bu
bu:func_onclick()
end)
bn(96,83,"close",function()
bs=nil
end)
bs=self
end
l.init_windtrap=function(self)
self.bv=11
self.bw={12,12,12,12,13,1,1,1,1,13}
end
l.init_refinery=function(self)
self.bw={11,10,8}
end
l.draw_refinery=function(self)
pal()
pal(11,self.col2)
pal(10,self.col2)
pal(8,self.col2)
if self.bx then
pal(self.bw[self.by],self.col1)
else
pal(11,self.col1)
self.by=1
end
spr(self.obj_spr,self.bz,self.ca,self.cb,self.cc)
end
l.init_repairfact=function(self)
self.bv=8
self.bw={0}
end
cd=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bp.ce==2 and not bp.cf) pal(7,11)
spr(self.obj_spr,self.bz,self.ca)
pal()
end
repair_click=function()
cg(ch,2)
end
ci=function()
cj"pick target"
ck=true
end
function cg(self,cl)
self.cm=0
self.cn=self.ce
if(self.co>0 and self.cn>0) self.cf=not self.cf
self.ce=cl
end
cp=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170||2|2|2|1|nil|nil|||||nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162||2|2|2|1|nil|1|||||1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160||2|1|1|1|nil|1|||||1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164||2|1|1|1|nil|1|||||7|4||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172||2|2|2|1|nil|1|||||1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174||2|3|2|1|nil|1|||||1|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136||2|2|2|1|nil|1|||||1|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134||2|2|2|1|nil|1|||||6|2||150|5|0|600|||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168||2|2|2|1|nil|1|||||7|2||300|10|0|1200|||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138||2|2|2|1|nil|1|||||7|2||400|10|0|1600|||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|1|nil|1|||||6|2||400|20|0|1400|||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|1|nil|1|||||6|3||600|20|0|800|||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|1|nil|1|||||12|5||500|35|0|1600|||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230||2|3|2|1|nil|1|||||12|5|99|700|20|0|800||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232||1|1|1|1|11|1|||||7|5||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234||1|1|1|1|11|1|||||7|6||250|20|112|1200|0|9|2||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228||2|3|3|1|nil|1|||||6|6||500|50|0|2000|||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224||2|2|2|1|nil|1|||||12|5||500|40|0|1600|||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226||2|3|3|1|nil|1|||||17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||
20|lIGHT iNFANTRY (X3)|55|236||1|1|1|1|11|9|||||9|2|-3|60||4|200|0.05|2|1|1|56|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|55|194||1|1|1|1|11|10|||||9|3|-1|100||8|440|0.1|3|1|1|56|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
25|tRIKE|54|204||1|1|1|1|11|11|17|||||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
26|qUAD|48|206||1|1|1|1|11|11|17|||||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
27|cOMBAT tANK|51|196||1|1|1|1|11|12|17||||7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
28|sIEGE tANK|50|198||1|1|1|1|11|12|17||||7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
29|rOCKET lAUNCHER|53|202||1|1|1|1|11|12|17||||7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
30|hARVESTER|49|192||1|1|1|1|11|12|17|||||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
31|cARRYALL|73|238||1|1|1|8|11|13|||||13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
22|fREMEN|55|236||1|1|1|1|11|||0|9|4||8|1|0||8|880|0.1|3|1|1|56|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
35|dEVASTATOR|52|200||1|1|1|1|11|12|||||13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
36|dEATH hAND|72|||1|1|1|8|11|||0|||13|8|3|0||150|280|0.5|0|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
37|rAIDER|54|204||1|1|1|1|11|11||||||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
23|sABOTEUR|55|236||1|0.5|0.5|1|11|||0|1|0||8|2|0||150|160|0.4|0|1|1|56|10|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
24|sARDAUKAR|62|236||1|1|1|1|11|||0|14|2||4||0||5|440|0.1|1|||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
39|sANDWORM|88|||9|1|1|1|11|nil|||||nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|1|11|nil|||||nil|||||||||||||||draw_action||action_click
81|pICK TARGET|1|||5|1|1|1|11|nil|||||nil|||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cq()
cr()
cursor={
w=8,
h=8,
cs=function(self)
return{
bz=self.bz+(not ct and cu or 0)+2,
ca=self.ca+(not ct and cv or 0)+1,
w=1,
h=1
}
end,
cw=function(self)
spr((bp and(bp.type==1 and bp.owner==1) or ck) and 1 or 0,
self.bz,self.ca,self.w/8,self.h/8)
end
}
cx()
music"7"
cy=0
end
function cx()
for cz=1,2 do
for da=0,31 do
for db=0,127 do
local dc=nil
local dd=mget(db,da)
if cz==1 and dd==1 then
de,df=db*8,da*8
cu,cv=de-56,df-56
dc=cp[1]
elseif cz==2
and dd>=48 then
for dg in all(
cp) do
if(dg.obj_spr!=nil and dg.obj_spr==dd) dc=dg break
end
end
if dc!=nil then
local dh,di=db,da
if(dh>63) di+=31 dh-=64
dj(dc,dh*8,di*8)
if(dc.type==1 and dc.speed>0) mset(db,da,0)
end
end
end
end
end
function dj(dc,bz,ca,owner,dk)
local dl=dm(dc,bz,ca,dc.type,nil,l[dc.func_init],l[dc.func_draw],l[dc.func_update],nil)
dl.dn=dm(dc,109,0,3,dl,nil,nil,l[dc.func_onclick])
dl.co=dp and dc.hitpoint/2 or dc.hitpoint
dl.owner=dl.owner or owner or(dq(bz,ca,de,df)<75 and 1 or 2)
dl.dr=owner or dl.owner
dl.bm={}
for dg in all(cp) do
local ds=dg.req_faction
if(dg.parent_id!=nil and(dg.parent_id==dl.id or dg.dt==dl.id))
and(ds==nil
or(ds>0 and dg.req_faction==c)
or(ds<0 and-c!=ds))
then
add(dl.bm,
dm(dg,109,0,4,dl,nil,nil,function(self)
if bs then
bp=self
else
cg(self,1)
end
end)
)
dl.bt=dl.bm[1]
end
end
if dl.owner==1 then
dl.du=c
dl.col1=d
dl.col2=e
q[dl.id]=true
else
dl.du=f
dl.col1=g
dl.col2=i
dl.dn.func_onclick=nil
end
if dc.col1 then
dl.col1=dc.col1
dl.col2=dc.col2
end
local dv=flr(bz/8)
local dw=flr(ca/8)
if dc.type==2 then
dl.dx=53
dl.dy=0
local dz=(dc.id==2 or dc.id==3)
for ea=0,dc.w-1 do
for eb=0,dc.h-1 do
ec(dv+ea,dw+eb,dz and 16 or dl.owner==1 and 149 or 27)
end
end
if(not dz) add(m,dl)
if dl.id==6 and dl.bl==nil then
p[dl.owner]=dl
local ed,ee=ef(dl,(dl.bz+32)/8,(dl.ca+8)/8,eg)
dj(cp[30],ed*8,ee*8,nil,dl)
end
end
if dc.type==1 then
dl.dx=54
if(dl.norotate!=1) dl.eh=flr(rnd"8")*.125
if dl.arms>0 then
dl.ei=function(self)
self.ej=4
self.ek=self.bz+4
self.el=self.ca+4
self.em=self.en.bz+self.en.w/2
self.eo=self.en.ca+self.en.h/2
local ep=self.em-self.ek
local eq=self.eo-self.el
local er=sqrt(ep*ep+eq*eq)
self.es=(ep/er)*2
self.et=(eq/er)*2
sfx(self.arms<100 and 60 or 58,3)
eu(self)
end
if(dl.id==15 or dl.id==16) ec(dv,dw,149)
else
if(dl.id==30) dl.ev=0 dl.ew=p[dl.owner]
end
add(n,dl)
ex(dl)
end
eu(dl)
return dl
end
function dm(ey,bz,ca,ez,bl,func_init,func_draw,func_onclick)
local fa=(ey.w or 1)*8
local fb=(ey.h or 1)*8
local fc={
fd=ey,
id=ey.id,
hitpoint=ey.hitpoint,
bz=bz,
ca=ca,
z=ey.z,
type=ez,
bl=bl,
func_onclick=func_onclick,
w=fa,
h=fb,
fe=ey.obj_spr,
cb=ey.w,
cc=ey.h,
co=0,
ff=0,
ce=0,
fg=0,
dy=0,
fh=0,
fi=1,
by=1,
cs=function(self)
return{
bz=self.bz,
ca=self.ca,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cw=func_draw or function(self)
if self.type<=2
and(self.bz+self.w<cu
or self.bz>cu+127
or self.ca+self.h<cv
or self.ca>cv+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.du and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.bw then
pal(self.bv,self.bw[self.by])
end
if self.eh then
if not self.fj or self.fj>.025 then
if(self.speed>0) fk(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bz,self.ca,.25-self.eh,1,self.trans_col,5)
fk(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bz,self.ca-self.z,.25-self.eh,1,self.trans_col,flr(self.fi)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.bz-1,self.ca-1,self.bz+16,self.ca+19,0)
local fl=self.type==4 and self or self.bl
local fm=fl.hitpoint
local fn=self.ce==1 and 12 or fl.co<fm*.33 and 8 or fl.co<fm*.66 and 10 or 11
local fo=self.ce==1 and(15*(fl.co/100)) or(15*(fl.co/fm))
if(fl.co>0 and not bs) rectfill(self.bz,self.ca+17,self.bz+fo,self.ca+18,fn)
end
if self.type>2 then
spr(self.ico_spr,self.bz,self.ca,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.bz,self.ca,self.cb,self.cc)
end
end
if self.ek then
if self.fire_type==1 then
circfill(self.ek,self.el,0,rnd"2"<1 and 8 or 9)
else
fp(self.ek,self.el,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>24 and self.co<self.hitpoint*.33 and rnd"10"<1) fp(self.bz+3.5,self.ca+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd"2"<1 and 0xa5a5.8 or 0)
self.fh=0
end,
fq=function(self)
self.fi=max(self.fi-.4,1)
if self.fh>0 then
fr(true)
if(fs==0 or stat(24)>5) fs=1 music"0"
if(self.arms>0 and self.ej==0) ft(self,self.fu)
end
if(self.type<=2 and self.co<=0 and self.fj==nil) self.ej=5 self.fv=nil self.fj=(self.type==2 and 1 or .5) sfx(self.dx,3) cy+=((self.type==2 or self.id==36) and 0.25 or 0)
if self.fj then
self.fj-=.025
if self.fj<=0 then
if self.type==2 then
for ea=0,self.cb-1 do
for eb=0,self.cc-1 do
ec(self.bz/8+ea,self.ca/8+eb,15)
end
end
del(m,self)
y[self.fu.dr]+=1
else
local fw,fx=flr(self.bz/8),flr(self.ca/8)
if(fx>31) fw+=64 fx-=32
if(fy(fw,fx)<9) ec(fw,fx,20)
if(self.speed==0) ec(fw,fx,15)
del(n,self)
if(self.fu) ba[self.fu.dr]+=1
end
if(bp==self) bp=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fz(self.bz+rnd(self.w),self.ca+rnd(self.h))
end
end
if self.framecount!=nil then
self.ff+=1
if self.ff>self.framecount then
self.ff=0
if self.altframe
and self.ej==2 then
self.obj_spr=self.fe+(self.altframe-self.obj_spr)
end
if self.bw then
self.by+=1
if(self.by>#self.bw) self.by=1
end
end
end
if self.ek then
self.ek+=self.es
self.el+=self.et
if dq(
self.ek,self.el,
self.em,self.eo)<2
then
fz(self.ek,self.el,self.fire_type)
local en=self.en
if dq(
self.ek,self.el,
en.bz+en.w/2,
en.ca+en.h/2)<4
then
en.co-=self.arms
en.fh=self.fire_type
en.fu=self
end
self.ek=nil
end
end
if self.ce>0
and not self.cf
and not self.ga then
if self.ce==1 and self.fg>self.cost then
self.ga=true
if(self.owner==1) sfx"56"
if self.fd.type==1
and self.parent_id!=1 then
local ed,ee=gb(self,self.bl)
dj(self.fd,ed,ee,nil,self.bl)
gc(self)
end
elseif self.ce==2 and self.co>self.hitpoint then
self.ce=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.ew)
self.ej=0
self.bz,self.ca=gb(self,self.ew)
end
else
if self.cm>(self.ce==1 and 3 or 100) then
if(gd(-1,self.ce==1 and self.bl or self)) self.cm=0 self.fg+=1
else
self.cm+=1
self.co=(self.ce==1 and(self.fg/self.cost)*100 or self.co+.5)
end
end
end
if self.dy>0 then
self.dy-=.1
end
end,
ge=function(self,bz,ca)
self.bz=bz
self.ca=ca
end,
gf=function(self)
return flr(self.bz/8)..","..flr(self.ca/8)
end
}
for gg,gh in pairs(ey) do
if fc[gg]==nil and gh!=""then
fc[gg]=gh
end
end
if(func_init) func_init(fc)
return fc
end
function gd(gi,fc)
if(gj(k[fc.owner])+gi<0) return false
k[fc.owner]+=sgn(gi)*shr(abs(gi),16)
if(fc.owner==1) sfx"63"
return true
end
function fz(bz,ca,gk)
fp(bz,ca,2,
0,0,.1,0,gk==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function eu(gl)
if(gl.owner!=1 and gl.ej!=4) return
local gm=gl.type==2 and 3 or 2
for ea=-gm,gm do
for eb=-gm,gm do
local gn=flr(gl.bz/8)+ea
local go=flr(gl.ca/8)+eb
gp[gn][go]=16
gq(gn,go)
for eq=-1,1 do
for ep=-1,1 do
gq(gn+ep,go+eq)
end
end
end
end
end
function _update60()
gr()
if(not bs) gs()
if t()%1==0 then
if t()%2==0 then
gt()
else
gu()
end
end
x+=1
end
function _draw()
gv()
gw()
end
function cr()
gp={}
for cz=-2,66 do
gp[cz]={}
for gx=-2,66 do
gp[cz][gx]=0
end
end
end
function gy()
local gz=flr(cu/8)
local ha=flr(cv/8)
palt(0,false)
palt(11,true)
for ea=gz-1,gz+16 do
for eb=ha-1,ha+16 do
if gp[ea][eb]!=0 and gp[ea][eb]!=16 then
spr(gp[ea][eb]+31,ea*8,eb*8)
elseif gp[ea][eb]<16 then
rectfill(ea*8,eb*8,ea*8+7,eb*8+7,0)
end
end
end
end
function gq(bz,ca)
if(bz<0 or bz>#gp or ca<0 or ca>#gp) return
local hb=0
if gp[bz][ca]!=0 then
if(gp[bz][ca-1]>0) hb+=1
if(gp[bz-1][ca]>0) hb+=2
if(gp[bz+1][ca]>0) hb+=4
if(gp[bz][ca+1]>0) hb+=8
gp[bz][ca]=1+hb
end
end
function gu()
r={}
if bd then
for cz=0,124,4 do
for gx=0,124,4 do
local db=cz/2
local da=gx/2
if(da>=32) db+=64 da-=32
local hc=mget(db,da)
local fn=sget((hc*8)%128+4,(hc*8)/16)
if(gp[cz/2][gx/2]==16) r[(cz/2/2)..","..(gx/2/2)]=fn!=11 and fn or 15
end
end
end
hd=0
he=0
hf=false
hg={0,0}
for hh,hi in pairs(m) do
local gn=flr(hi.bz/8)
local go=flr(hi.ca/8)
if hi.owner==1 or(bd and gp[gn][go]==16) then
r[flr(hi.bz/2/8)..","..flr(hi.ca/2/8)]=hi.col1
end
if hi.owner==1 then
hd-=hi.power
if(hi.id==7) hf=true
if(sub(hi.name,1,5)=="sPICE") he+=1000
end
hg[hi.owner]+=1
end
if bd then
for hh,hj in pairs(n) do
if hj.owner==1 or gp[flr(hj.bz/8)][flr(hj.ca/8)]==16 then
r[flr(hj.bz/2/8)..","..flr(hj.ca/2/8)]=hj.col1
end
end
if(hk and gp[mid(0,flr(hl/8),31)][mid(0,flr(hm/8),31)]==16) r[flr(hl/2/8)..","..flr(hm/2/8)]=7
end
bd=(hf and hd>0)
fr(false)
fs=2
if(k[3]>0 and k[1]>k[3]) hn=1
if(hg[2]==0 and b>1) hn=2
if(hg[1]==0) hn=3
if hn then
dset(14,hn)
dset(13,t()-v)
dset(10,ho)
dset(24,gj(k[2]))
dset(11,ba[1])
dset(25,ba[2])
dset(12,y[1])
dset(26,y[2])
rectfill(30,54,104,70,0)
?"mission "..(hn<3 and"complete"or"failed"),36,60,d
flip()
load("pico-dune-main")
end
end
function gt()
o={}
for gg,hj in pairs(n) do
o[hj:gf()]=gg
end
end
function gr()
hp,hq,hr=stat"32",stat"33",stat"34"
hs=(hr==1 and ht!=hr) or btnp"4"
hu=(hr>0) or btn"4"
hv=(hr==2 and ht!=hr) or btnp"5"
for gg=0,1 do
if(btn(gg)) bb+=gg*2-1
if(btn(gg+2)) bc+=gg*2-1
if(btnp(4,1)) stop("paused")
end
hw=mid(0,hp+bb,127)
hx=mid(0,hq+bc,127)
cursor.bz=hw
cursor.ca=hx
if not bs then
if(hw<4) cu-=2
if(hw>123) cu+=2
if(hx<4) cv-=2
if(hx>123) cv+=2
cu=mid(cu,384)
cv=mid(-8,cv,384)
for hh,hj in pairs(n) do
if hj then
if hj.fv and costatus(hj.fv)!="dead"then
assert(coresume(hj.fv,hj))
else
hj.fv=nil
end
if hk
and fget(fy(flr(hj.bz/8),flr(hj.ca/8)),2)
and dq(hl,hm,hj.bz,hj.ca)<1
and hj.z==1
then
del(n,hj)
hy=.01
end
end
end
for gg,hz in pairs(u) do
hz.eq+=hz.ia
hz.bz+=hz.ep
hz.ca+=hz.eq
hz.eh+=hz.ib
hz.co+=1
if(hz.co>=hz.ic) del(u,hz)
end
end
ie()
ht,ch,bu=hr,bp,bj
end
function ig(bz,ca)
local fo=fy(bz,ca)
return fo>=2 and fo<=8
end
function ex(hj,ih)
hj.ej=ih or 0
hj.fv=cocreate(function(self)
while true do
if rnd"500"<1 and self.arms>0 and self.ej!=8 then
ef(self,flr(self.bz/8),flr(self.ca/8),ii,self.range)
end
local ew=self.ew
if self.id==30 then
if self.ej==0 or self.ej==7 or self.ej==9 then
if self.ev<=1500
and self.ej!=7 and self.ej!=9 then
local ij,ik
local il,im=flr(self.bz/8),flr(self.ca/8)
if ig(il,im) and not self.io then
ij,ik=il,im
else
ef(self,il,im,
function(hj,bz,ca)
if ig(bz,ca) and rnd"10"<1 then
ij,ik=bz,ca
return true
end
end,
10)
end
if ij and ik then
ip(hj,ij,ik)
if(ig(flr(hj.bz/8),flr(hj.ca/8))) hj.ej=6
end
end
elseif self.ev>=1500
and self.ej!=7 then
self.ej=7
ew.bx=true
ip(self,(ew.bz+16)/8,ew.ca/8)
self.ej=9
elseif self.ej==6 then
self.io=false
local eh=hj.eh+.75
iq(hj.bz,hj.ca,hj.eh+.75+rnd".2"-.1)
local ir=hj:gf()
s[ir]=(s[ir] or 10000)-1
self.ev=(self.ev or 0)+.5
if s[ir]<=0 then
local dv=flr(self.bz/8)
local dw=flr(self.ca/8)
for eb=-1,1 do
for ea=-1,1 do
fo=fy(dv+ea,dw+eb)
ec(dv+ea,dw+eb,
(ea==0 and eb==0) and 0 or((fo>1 and fo<8) and 8 or fo)
)
end
end
self.ej=0
end
if(self.ev%300==0) self.io=true self.ej=0
end
end
if self.id>24 then
if self.ej==9 then
if ew.co>0 and not ew.is then
ew.bx=false
self.ej=8
self.eh=.25
self.bz=ew.bz+16
self.ca=ew.ca+4
if(bp==self) bp=nil
if self.ev then
ew.is=true
while self.ev>0 do
self.ev-=1
if(flr(self.ev)%4==0 and tonum(ho)<he) gd(2,self)
yield()
end
self.ev=0
ew.is=false
self.ej=0
else
self.ce=2
self.cm=0
ew.bv=8
ew.bw={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function gb(fc,en)
local ed,ee=ef(fc,(en.bz+8)/8,(en.ca+16)/8,eg)
return ed*8,ee*8
end
function iq(bz,ca,eh)
local it,iu=sin(eh)*5.5,-cos(eh)*5.5
if(rnd"5"<1) fp(bz+it+3.5,ca+iu+3.5,rnd"2",.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function ft(hj,en)
if hj.id!=19 then
hj.ej=3
hj.en=en
hj.fv=cocreate(function(self)
while en.co>0 do
local iv=dq(hj.bz,hj.ca,en.bz,en.ca)
if iv>hj.range*5
and hj.speed>0 then
ip(hj,flr(en.bz/8),flr(en.ca/8),hj.range*5)
if hj.id==23 or hj.id==36 then
hj.co=0
for cz=1,hj.id/3 do
fz(hj.bz+rnd"32"-16,hj.ca+rnd"32"-16,2)
end
en.co-=(100+rnd"50")
en.fu=hj
return
end
end
if not hj.norotate then
local iw=atan2(hj.bz-en.bz,hj.ca-en.ca)
while(hj.eh!=iw) do
ix(hj,iw)
end
end
if iv<=hj.range*5 then
if(hj.dy<=0 and not hj.ek) hj.ei(hj) hj.dy=hj.arms/4
elseif hj.speed==0 then
ex(hj)
end
yield()
end
ex(self)
end)
else
if c==1 then
ft(dj(cp[22],hj.bz,hj.ca,hj.owner),en)
elseif c==2 then
ft(dj(cp[23],hj.bz,hj.ca,hj.owner),en)
elseif c==3 then
ft(dj(cp[36],hj.bz,hj.ca,hj.owner),en)
else
end
ch.dy=1750
end
end
function ef(hj,bz,ca,iy,iz)
for dq=1,iz or 64 do
for ea=bz-dq,bz+dq do
for eb=ca-dq,ca+dq do
if((ea==bz-dq or ea==bz+dq or eb==ca-dq or eb==ca+dq) and(iy(hj,ea,eb))) return ea,eb
end
end
yield()
end
end
function fy(db,da)
if(da>31) db+=64 da-=32
return mget(db,da)
end
function ec(db,da,ja)
if(da>31) db+=64 da-=32
mset(db,da,ja)
end
function eg(hj,bz,ca)
return not fget(fy(bz,ca),0)
and o[bz..","..ca]==nil
end
function ii(hj,bz,ca)
local en=n[o[bz..","..ca]]
if(en!=jb and en.owner!=hj.owner and en.dr!=hj.dr and gp[bz][ca]==16) ft(hj,en) return true
end
function ip(hj,bz,ca,jc)
local jd=hj.z>1
::restart_move_unit::
if not jd and not eg(nil,bz,ca) then
bz,ca=ef(hj,bz,ca,eg)
end
hj.il=bz
hj.im=ca
hj.je=hj.ej
hj.ej=1
hj.jf=nil
local jg,jh,ji={bz=flr(hj.bz/8),ca=flr(hj.ca/8)},{bz=hj.il,ca=hj.im},function(jj) return shl(jj.ca,8)+jj.bz end
local jk,
jl={
jm=jg,
jn=0,
jo=jp(jg,jh)
},{}
jl[ji(jg)]=jk
local jq,jr,js,jt,count={jk},1,ji(jh),32767.99,0
while jr>0 do
local cost,ju=jt
for cz=1,jr do
local jv=jq[cz].jn+jq[cz].jo
if(jv<=cost) ju,cost=cz,jv
end
jk=jq[ju]
jq[ju],jk.jw=jq[jr],true
jr-=1
local hz=jk.jm
if ji(hz)==js then
hz={jh}
while jk.jx do
jk=jl[ji(jk.jx)]
add(hz,jk.jm)
end
hj.jf=hz
goto end_pathfinding
end
for jy in all(jz(hz,jd)) do
local id=ji(jy)
local ka=not jd and fget(fy(jy.bz,jy.ca),1) and 4 or 1
if(hz.bz!=jy.bz and hz.ca!=jy.ca) ka+=.2
local kb,kc=
jl[id],
jk.jn+ka
if not kb then
kb={
jm=jy,
jn=jt,
jo=jp(jy,jh)
}
jr+=1
jq[jr],jl[id]=kb,kb
end
if not kb.jw and kb.jn>kc then
kb.jn,kb.jx=kc,hz
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
hj.je=hj.ej
hj.ej=2
if hj.jf!=nil then
for cz=#hj.jf-1,1,-1 do
local jj=hj.jf[cz]
if not hj.norotate then
local iw=atan2(
hj.bz-(jj.bz*8),
hj.ca-(jj.ca*8))
while(hj.eh!=iw) do
ix(hj,iw)
end
end
if(not jd and not eg(nil,jj.bz,jj.ca)) goto restart_move_unit
local kd,ke=hj.speed or .5,sqrt((jj.bz*8-hj.bz)^2+(jj.ca*8-hj.ca)^2)
local kf=kd*(jj.bz*8-hj.bz)/ke
local kg=kd*(jj.ca*8-hj.ca)/ke
for cz=0,ke/kd-1 do
o[jj.bz..","..jj.ca]=hj
hj.bz+=kf
hj.ca+=kg
yield()
end
hj.bz,hj.ca=jj.bz*8,jj.ca*8
o[jj.bz..","..jj.ca]=hj
eu(hj)
if(dq(hj.bz,hj.ca,hj.il*8,hj.im*8)<=(jc or 0)) break
end
end
hj.ej=0
end
function gv()
cls"15"
camera(cu+(16-rnd"32")*cy,cv+(16-rnd"32")*cy)
cy=(cy>0.05) and cy*0.95 or 0
if hk then
for cz=1,#hk do
if(cz%2==1) fillp(0xa5a5.8)
circfill(
hk[cz][1]+4,
hk[cz][2]+4,4,
kh[cz%#kh+1])
fillp()
end
if(hy>0) spr(88+hy,hl,hm)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hh,hi in pairs(m) do
if not bs then
hi:fq()
if(hi.bt) hi.bt:fq()
end
hi:cw()
if(hi==bp) rect(bp.bz,bp.ca,bp.bz+bp.w-1,bp.ca+bp.h-1,7)
end
pal()
for hh,hj in pairs(n) do
if(not bs) hj:fq()
if(hj.ce!=2 or hj.speed==0) hj:cw()
if(hj==bp) spr(17,bp.bz,bp.ca)
end
for gg,hz in pairs(u) do
if(hz.ki) fillp(hz.ki)
circfill(hz.bz,hz.ca,hz.eh,hz.kj[flr((#hz.kj/hz.ic)*hz.co)+1])
fillp()
end
gy()
end
function kk()
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bd!=bf then
be=bd and 1 or 59
kl=bd and 1 or-1
sfx"55"
gu()
end
bf=bd
if be>0 and be<60 then
be+=kl
clip(
max(108-be,91),
max(108-(be>20 and be-20 or 0),91),
min(be*2,33),
min((be>20 and be-20 or 1)*2,33))
for cz=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for ea=0,31 do
for eb=0,31 do
if(r[ea..","..eb]) pset(92+ea,92+eb,r[ea..","..eb])
end
end
local it=92+cu/16
local iu=92+cv/16
rect(it,iu,it+7,iu+7,7)
end
function cj(km)
bg=km
bh=500
end
function gw()
camera(0,0)
pal()
palt(0,false)
if bp and bp.dn then
bp.dn:ge(109,20)
bp.dn:cw()
if bp.bt and bp.owner==1 then
bp.bt:ge(109,44)
bp.bt:cw()
end
kn=nil
if bp.co<bp.hitpoint
and bp.owner==1
and bp.id!=4
and(bp.type==2
or bp.speed==0) then
kn=dm(cp[80],117,28,5,{},nil,cd,repair_click)
kn:cw()
end
ko=nil
if bp.id==19
and bp.dy<=0 then
ko=dm(cp[81],109,29,5,{},nil,cd,ci)
ko:cw()
end
end
rectfill(0,0,127,8,9)
if(bh>0) bh-=1 print(bg,2,2,0)
ho=gj(k[1])
? sub("000000",#ho+1)..ho,103,2,e
if bp
and bp.bt
and(bp.bt.type==4
or bp.bt.speed==0)
and bp.bt.co>=100 then
local kp=flr((cursor.bz+cu)/8)
local kq=flr((cursor.ca+cv)/8)
local kr=kp*8-cu
local ks=kq*8-cv
kt=false
ku=false
dp=false
local w=bp.bt.cb
local h=bp.bt.cc
for ea=-1,w do
for eb=-1,h do
if ea==-1 or ea==w or eb==-1 or eb==h then
if(fy(kp+ea,kq+eb)==16 or fy(kp+ea,kq+eb)>=58) kt=true
else
local fo=fy(kp+ea,kq+eb)
if(fo>=9 and fo<=15) dp=true
if(o[kp+ea..","..kq+eb] or fo==0 or fo<8 or fo>16) ku=true
end
end
end
if(ku) kt=false
fillp("0b1110110110110111.1")
rectfill(kr,ks,
kr+bp.bt.w,ks+bp.bt.h,kt and 11 or 8)
fillp()
end
kk()
if bs then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bp.bm then
bp.bq={}
rectfill(6,25,27,92,0)
local kv=1
for cz=1,#bp.bm do
local kw=bp.bm[cz]
if kw.req_id==nil
or q[kw.req_id] then
bp.bq[kv]=kw
if kv>=bi and kv<=bi+2 then
kw:ge(9,28+(kv-bi)*19)
kw:cw()
else
kw:ge(-16,16)
end
if bj==kw then
bo=kv
rect(kw.bz-2,kw.ca-2,
kw.bz+17,kw.ca+17,
7)
? bj.name,30,26,7
?"cOST:"..bj.cost,85,33,9
? bj.description,30,39,6
end
kv+=1
end
end
end
for hh,kx in pairs(bk) do
kx:cw()
end
end
palt(11,true)
cursor:cw()
end
function bn(bz,ca,ky,func_onclick,fa)
add(bk,{
bz=bz,
ca=ca,
w=fa or#ky*4+2,
h=8,
ky=ky,
cs=function(self)
return self
end,
cw=function(self)
if(#ky>1) rectfill(self.bz,self.ca,self.bz+self.w,self.ca+self.h,7)
if(#ky>1) rectfill(self.bz+1,self.ca+1,self.bz+self.w-1,self.ca+self.h-1,self.kz and 12 or 6)
? self.ky,self.bz+2,self.ca+2,(#ky>1) and 0 or(self.kz and 12 or 7)
end,
func_onclick=func_onclick
})
end
function ie()
la=false
if bp then
ct=true
lb(kn)
lb(ko)
if(bp.dn and not bs and not la) lb(bp.dn)
foreach(bp.bm,lb)
if(bs) foreach(bk,lb)
ct=false
end
if not bs
and not la then
foreach(n,lb)
foreach(m,lb)
end
if hu
and not bs
and hw>89 and hw<122
and hx>90 and hx<123 then
cu=mid(0,(hw-94)*16,400)
cv=mid(-8,(hx-94)*16,400)
elseif hs then
ck=false
if(bp) cj(bp.name)
if la then
if(not bs and bp.func_onclick and bp.bl!=nil) bp:func_onclick() bp=ch return
if(bs and bj.ky and bj.func_onclick) bj:func_onclick()
if(bp.owner==1 and bp.type==1 and bp!=ch and bp.speed>0) sfx"62"
if(bp.owner==2 and ch and(ch.type==1 or ch.id==19) and ch.owner==1) bp.fi=10 ft(ch,bp) bp=nil
else
if bp
and bp.type==1
and bp.owner==1
and bp.speed>0
and bp.ej!=7 then
bp.fv=cocreate(function(hj)
ip(hj,flr((cu+hw)/8),flr((cv+hx)/8))
ex(hj)
end)
end
if bp
and bp.bt
and bp.bt.co>=100
and kt then
local dc=bp.bt.fd
dj(dc,
flr((cursor.bz+cu)/8)*8,
flr((cursor.ca+cv)/8)*8,1)
gc(bp.bt)
sfx"61"
end
if(not bs) bp=nil
end
elseif hv and not bs then
bp=nil
ck=false
end
end
function gc(fc)
fc.co=0
fc.ce=0
fc.fg=0
fc.ga=false
end
function lb(fc)
if(fc==nil) return
fc.kz=lc(cursor,fc)
if hs and fc.kz then
if bs then
bj=fc
else
if(fc.type<=2 and gp[flr((cursor.bz+cu)/8)][flr((cursor.ca+cv)/8)]!=16 or fc.ej==8) return
if bp
and(fc.id==6 and bp.id==30
or fc.id==14 and bp.id>24)
and fc.owner==1 then
bp.ej=7
bp.ew=fc
fc.bx=true
bp.fv=cocreate(function(hj)
ip(hj,(fc.bz+16)/8,(fc.ca+16)/8)
ex(hj,9)
end)
return
else
bp=fc
end
end
la=true
end
end
ld=0
function gs()
if t()>j and t()%j*2==0 then
local le=n[flr(rnd(#n))+1]
if le.owner==2 and le.arms>0 and le.ej==0 then
local lf=(rnd"2"<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if(lf and lf.owner==1 or lf.dr==1) ft(le,lf)
end
local lg=m[flr(rnd(#m))+1]
if lg.owner==2 then
if lg.bt and lg.bt.fd.type==1 and lg.bt.ce!=1 then
local lh=lg.bm[flr(rnd(#lg.bm))+1]
lg.bt=lh
lh:func_onclick()
end
if lg.co<lg.hitpoint and lg.ce!=2 then
cg(lg,2)
end
end
end
ld-=1
if ld<0 then
if hk then
hk=nil
else
hk,li,lj,kh,hy={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lk=rnd"5000"
ld=lk
end
if hk then
if(x%6<1 or#hk<30) and hy==0 then
while#hk<31 do
if(rnd"9"<.5) lj=rnd".04"-.02
hl,hm=hk[#hk][1],hk[#hk][2]
add(hk,{hl+sin(li),hm-cos(li)})
li+=lj
end
end
if(#hk>30) del(hk,hk[1])
if(hy>0) hy+=.01 iq(hl,hm,rnd"1")
if(hy>2) hy=0
if(ld>lk-128 or ld<128) iq(hl,hm,rnd"1")
end
end
function fr(ll)
local fo=peek(0x3115)
if((band(fo,128)>0)!=ll) fo=bxor(fo,128)
poke(0x3115,fo)
end
function lc(lm,ln)
local lo=lm:cs()
local lp=ln:cs()
return lo.bz<lp.bz+lp.w and
lo.bz+lo.w>lp.bz and
lo.ca<lp.ca+lp.h and
lo.ca+lo.h>lp.ca
end
function cq()
lq=lr(cp,"|","\n")
cp={}
for cz=2,#lq-1 do
lt={}
for lu=1,#lq[cz] do
local fo=lq[cz][lu]
if(lu!=2 and lu<29) fo=tonum(fo)
if lu==29 then
lv=lr(fo,"~")
fo=""
for cz=1,#lv do
fo=fo.."\n"..lv[cz]
end
end
lt[lq[1][lu]]=fo
end
cp[tonum(lq[cz][1])]=lt
end
end
function gj(fo)
local lw=""
local gh=abs(fo)
repeat
lw=(gh%0x0.000a/0x.0001)..lw
gh/=10
until gh==0
if(fo<0) lw="-"..lw
return lw
end
function lr(lx,er,ly)
local iw={}
local lw=""
local lz=""
if(ly~=nil) lx=lr(lx,ly)
while#lx>0 do
if type(lx)=="table"then
lw=lx[1]
add(iw,lr(lw,er))
del(lx,lw)
else
lw=sub(lx,1,1)
lx=sub(lx,2)
if lw==er then
add(iw,lz)
lz=""
else
lz=lz..lw
end
end
end
add(iw,lz)
return iw
end
function fk(ij,ik,bz,ca,iw,w,ma,mb)
local mc,md=cos(iw),sin(iw)
local me,mf,mg,mh
local mi,mj=mc,md
local hb=shl(0xfff8,(w-1))
w*=4
mc*=w-0.5
md*=w-0.5
local mk,ml=md-mc+w,-mc-md+w
w=2*w-1
for mm=0,w do
me,mf=mk,ml
for mn=0,w do
if band(bor(me,mf),hb)==0 then
local mo=sget(ij+me,ik+mf)
if(mo!=ma) pset(bz+mm,ca+mn,mb or mo)
end
me-=mj
mf+=mi
end
mk+=mi
ml+=mj
end
end
function dq(mp,mq,mr,ms)
return abs(sqrt(((mp-mr)/1000)^2+((mq-ms)/1000)^2)*1000)
end
function ix(hj,mt)
local mu=3.14159
local gi=mt-hj.eh
if gi>0.5 then
gi-=1
elseif gi<-0.5 then
gi+=1
end
if gi>0.0087 then
hj.eh+=0.0087
elseif gi<-0.0087 then
hj.eh-=0.0087
else
hj.eh=mt
end
if(hj.eh>mu) hj.eh-=2*mu
if(hj.eh<-mu) hj.eh+=2*mu
yield()
end
function jz(jj,jd)
local mv={}
for ea=-1,1 do
for eb=-1,1 do
if(ea!=0 or eb!=0) mw(jj.bz+ea,jj.ca+eb,mv,jd)
end
end
return mv
end
function mw(mx,my,mz,jd)
if(jd or not fget(fy(mx,my),0) and o[mx..","..my]==nil and mx>=0 and my>=0 and mx<=63 and my<=63) add(mz,{bz=mx,ca=my})
end
function jp(iw,na)
return abs(iw.bz-na.bz)+abs(iw.ca-na.ca)
end
function fp(bz,ca,eh,ep,eq,ib,ia,co,kj,ki)
local hz={
bz=bz,ca=ca,eh=eh,ep=ep,eq=eq,ib=ib,
co=0,ia=ia,
kj=kj,ki=ki,
nb=ca,ic=co
}
add(u,hz)
end
__gfx__
bbbbbbbbbb171bbbbbbbbbbb99b99999bbbbbbbbbbbbbbbb9b99b9b9bb9b9999bb9bbbbbb5d555d555d555d55d555d5bbbbbbbbb1d5155555d555d5bdddddddd
bb11bbbbb17771bbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb99b99b999b99899bbbb9bbb1555515d15555155d51555515dbbbd5b5155d55dd5155551d5555555
bb171bbb1711171bbbbb999999bb99999999bbbbbbbbbbbb9b99b99b9b9989b99bb9bb9b5d55d5515d55d555155d55d5d5155551555d5155155d55d5d5015515
bb1771bb7717177bbbb99b9b99999b99b9b99bbbb9bbbb9b999b999999b88899bb999bbb55515d5555515d5d55d51555155d55d5d5555d5555d51555d5105555
bb17771b1711171bbbbbb9b9bbb999999b9bbbbbbb99b999b9bbbb9b99998b99bb999bbbd55d5555d55555555555d55d55d5155555d155d55555d55dd5555111
bb177771b17771bbbbbb999999999b999999bbbb999b99b9bbbbbbbbbbb89999b9b9bbb955d551d555d515555d155d555555d55d155555555d155d55d1555101
bb17711bbb171bbbbbb99b9b99bbb9b9b9b99bbb9b99b99bbbbbbbbb99999b99bb9bbbbb1555555555555515555555515d155d55b51bbd5b55555551d5555111
bbb11bbbbbbbbbbbbbbb99b9bb9b99999b99bbbbb99b99b9bbbbbbbb99bbb9b9bbbb9bbbb55d5515555d55555155d55b55555551bbbbbbbb5155d55bd5515555
ddddddddb7bbbb7bbbbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d555555577bbbb77bb77bbb7bbbbbbbbbb66669bbbbbbbbbb6bbbbbb1555515d4444444444555155544444444444444444444444544224222242224442422442
d5555555bbbbbbbbb79bb77b0000b000b66dd66bbd5bb5bbbbbbbb6b5d55d444444444444445d555444444444444444444444444524442444424442224444221
d5555555bbbbbbbb79b779bb07700077b6d55d6bb5dbbbbbbbbbbbbb55544444444444444444445d444444444444444444444442522222212222222242222110
d5555555bbbbbbbbbb799bbb00777770b6d55d6bbbbb555bbbbbbbbb555444444444444444444445444444444444444444444422502112121121122121121200
d5555555bbbbbbbbb799bbbb07700077b66dd66bbbbb5d5bbbb6bbbb55d444444444444444444445444444444444444444444242550221200012210012100005
d555555577bbbb77b79bbbbb0000b000bb6666bbbbbb555bbbbbbbbb154444444444444444444444444444444444444444444240555000055000000500055555
d5555555b7bbbb7b7bbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb55444444444444444444444444444444444444444444442155555555555555555555d555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb0000000000000000
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000b00000000
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
bbbbbbbbbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbb7bbb7bbb7bbb7bb00000000dddddddddddddddddddddddddfffc0ffddddd999dddddddd
b0eee0bbb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbbcbbbcbbbcbbbcbb00000000d555555555555544c4555555df4ee04ff559999999555765
b0d6d0bbb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbbebbbebbbebbbebb00000000d5555555555554a904455555dfff4044f54499999445f66f
bbc7cbbbbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbb0bbb0bb0b0b0b0b00000000d4c455444445549904499c95df444444f52449494425dffd
b0c7c0bbbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbbbb7bbbbbbb7bbbb000000004a042499999452424297a094dffffffff5424444424556d5
b0ccc0bbb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbbbbcbbbbbbbcbbbb0000000049029999c0994922229aa094d44444444522424244255425
bb6b6bbbb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbbbebbbbbbbebbbb00000000242499aee099942dd1499942d40440044554224224555425
bbbbbbbbbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbb00000000d2499a77a0a94942d1542425d44400004555224225ff2225
d77dd77d67d6fffdddd776ddddddddddddddddddddd777ddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99424d15242f5d22222222555555555f44225
76667666561ffff1d576db65d5577655d5555555d5766665d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d76dbbb5d576db65d5557555d5766665d5bbbbb5bbbddbbbbbdadbbbbbb77bbbd52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d66d11b5d76dbbb5d5576655d5d66625d5555555bbd66dbbbb666bbbc767767cd5424999994942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d66d01b0d66d11b5d55d6255d5dd2225d55aaa55bbd66dbbbbb6bbbbc767767cd5542494949424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d66d0b01d66d01b0d55d2215d5dd2221d5555555bbbddbbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5404dffd
6115511151551005d56dd015d66d0b01d5551155d5512211d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5511155d56dd015d5555555d5551115d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd52222425
6d6d65d555d555d5ddddd776ddd111ddddd777ddddddddddddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc055d55576db65555555d5766665d5555555d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d5576dbbb555c055d5766665d5557555d5558555b1b11b1bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd5566d11b55ee055d5d66625d5576655d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad5555055d5566d01b0555055d5dd2225d55d6255d55aaa55b651156b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d5566d0b01555055d5dd2221d55d2215d5555555b7b55b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5556dd015555555d5512211d5551155d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d5555111d5555555d5551115d5555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd52222225
dddd666666ddddddddd777c666666dddddddddddddddddddddddd66666666666ddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667deeddddd657667555555d557755555555ddddd4dddddd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7dd0dd6666dddddd56765d566969666655ddddd4ddd5dd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd7660dd6dd611111ddddd5d5ddadadddd55ddd5ddd5dddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5ddd766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd44d6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5dddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5dd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4d5dddd5dd0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c0777767767767d4dddddd51d0001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5511111766d0d66d542222222222245d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d55555556d666662d52c02c020200225d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5ee0ee022200225d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d55555556dd00022d551011011111115d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d55555555dd0d021d555011011111155d222444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555555100011d555555555555555d555222255555555d111111111194421
ddddddddddddddd6766dddddddddddddd7766ddd577777d59ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
d55555555c0555d6766dd555d76555557c67c676576666d59999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
d5d6d555ee055dd6766dd155d6d5555dcd76dc6d576666d0ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
d576dddd550516d6766d6105d556555dccddccd5576666d099999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
d50015055505ddd6766ddd05d5c7c5cd6cccc6dc56dddd10777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
d55555555d101dd6766dd105d1dcd1c1d6666d1c56dddd1066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
d455555550001dd6766dd105d1cdc177660dd1c656dddd106666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
d15ddddddddd1dd6d16dd105d51117c67c601ccd5d111110dddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
d55776d7777716d6116d6105d500dcd76dcd0dd1dddddddddddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110d5ddddd5dddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005d55ddd55dddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555d555d555dddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c6055d5551555dddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055d55111555555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076d511111555555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dd111111155555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
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
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000101010101010101010001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
121212360000001616161637420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0000165785850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a3a10100c830a85420a6c0a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a1010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d470e0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120000160047010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200160057850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000121200000057854785576a0a5785571d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000032000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000005747475700360000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120036000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
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
00003500350000090a0a0a0a1e1b1b1b1c0a6000000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d620a0a0a1a1b1c1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a0a0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
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

