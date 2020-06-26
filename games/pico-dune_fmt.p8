pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
cartdata("pn_undune2")
b,c,d,e=dget"0",dget"1",dget"2",dget"3"
f,g,i,j=dget"20",dget"21",dget"22",dget"23"
k={
shr(dget(6),16),
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
bz(self)
end
l.init_repairfact=function(self)
self.bv=8
self.bw={0}
end
ca=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bp.cb==2 and not bp.cc) pal(7,11)
bz(self)
pal()
end
repair_click=function()
cd(ce,2)
end
cf=function()
cg"pick target"
ch=true
end
function cd(self,ci)
self.cj,self.ck=0,self.cb
if(self.cl>0 and self.ck>0) self.cc=not self.cc
self.cb=ci
end
cm=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1|nil|nil|||||nil|1|||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1|nil|1|||||1|4|||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160|2|1|1|1|nil|1|||||1|1|||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1|nil|1|||||7|4|||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1|nil|1|||||1|1|||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174|2|3|2|1|nil|1|||||1|1|||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1|nil|1|||||1|2|||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1|nil|1|||||6|2|||150|5|0|600|||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1|nil|1|||||7|2|||300|10|0|1200|||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1|nil|1|||||7|2|||400|10|0|1600|||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1|nil|1|||||6|2|||400|20|0|1400|||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1|nil|1|||||6|3|||600|20|0|800|||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1|nil|1|||||12|5|||500|35|0|1600|||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1|nil|1|||||12|5|||700|20|0|800||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||7|5|||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||7|6|||250|20|112|1200|0|9|2||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1|nil|1|||||6|6||1|500|50|0|2000|||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1|nil|1|||||12|5|||500|40|0|1600|||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1|nil|1|||||17|8||1|999|80|0|4000|||||||tHIS IS YOUR pALACE.||||
20|lIGHT iNFANTRY (X3)|55|236|1|1|1|1|11|9|||||9|2|-3||60||4|200|0.05|2|1|1|56|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|55|194|1|1|1|1|11|10|||||9|3|-1||100||8|440|0.1|3|1|1|56|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
22|fREMEN|55|236|1|1|1|1|11|||0|9|4||8|1||0||8|880|0.1|3|1|1|56|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
23|sABOTEUR|55|236|1|0.5|0.5|1|11|||0|1|0||8|2||0||150|160|0.4|0|1|1|56|10|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
24|sARDAUKAR|55|236|1|1|1|1|11|||0|14|2||4|||0||5|440|0.1|1|||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
25|tRIKE|54|204|1|1|1|1|11|11|17|||||2|||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
26|qUAD|48|206|1|1|1|1|11|11|17|||||3|||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
27|cOMBAT tANK|51|196|1|1|1|1|11|12|17||||7|4|||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
28|sIEGE tANK|50|198|1|1|1|1|11|12|17||||7|6|||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
29|rOCKET lAUNCHER|53|202|1|1|1|1|11|12|17||||7|5|||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
30|hARVESTER|49|192|1|1|1|1|11|12|17|||||2|||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
31|cARRYALL|73|238|1|1|1|8|11|13|||||13|5|||800||0|400|1|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|sONIC tANK|57|198|1|1|1|1|11|12|||||7|7|1||600||90|440|0.3|8|3||||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
35|dEVASTATOR|52|200|1|1|1|1|11|12|||||13|8|3||800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
36|dEATH hAND|72||1|1|1|8|11|||0|||13|8|3||0||150|280|0.5|0|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
37|rAIDER|54|204|1|1|1|1|11|11||||||2|2||150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
38|dEVIATOR|53|202|1|1|1|1|11|12|||||13|7|2||750||30|480|0.3|7|2||||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
39|sANDWORM|88||9|1|1|1|11|nil|||||nil|3|||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19||5|1|1|1|11|nil|||||nil||||||||||||||||draw_action||action_click
81|pICK TARGET|1||5|1|1|1|11|nil|||||nil||||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cn()
co()
cursor={
w=8,
h=8,
cp=function(self)
return{
cq=self.cq+(not cr and cs or 0)+2,
ct=self.ct+(not cr and cu or 0)+1,
w=1,
h=1
}
end,
cv=function(self)
spr((bp and(bp.type==1 and bp.owner==1) or ch) and 1 or 0,
self.cq,self.ct,self.w/8,self.h/8)
end
}
cw()
music"7"
cx=0
end
function cw()
for cy=1,2 do
for cz=0,31 do
for da=0,127 do
local db=nil
local dc=mget(da,cz)
if cy==1 and dc==1 then
dd,de=da*8,cz*8
cs,cu=dd-56,de-56
db=cm[1]
elseif cy==2
and dc>=48 then
for df,dg in pairs(cm) do
if(dg.obj_spr!=nil and dg.obj_spr==dc) db=dg break
end
end
if db!=nil then
local dh,di=da,cz
if(dh>63) di+=31 dh-=64
dj(db,dh*8,di*8)
if(db.type==1 and db.speed>0) mset(da,cz,0)
end
end
end
end
end
function dj(db,cq,ct,owner,dk)
local dl=dm(db,cq,ct,db.type,nil,l[db.func_init],l[db.func_draw],l[db.func_update],nil)
dl.dn,dl.cl=dm(db,109,0,3,dl,nil,nil,l[db.func_onclick]),dp and db.hitpoint/2 or db.hitpoint
dl.owner=dl.owner or owner or(dq(cq,ct,dd,de)<75 and 1 or 2)
dl.dr,dl.bm=owner or dl.owner,{}
for dg in all(cm) do
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
cd(self,1)
end
end)
)
dl.bt=dl.bm[1]
end
end
if dl.owner==1 then
dl.du,dl.col1,dl.col2=c,d,e
else
dl.du,dl.col1,dl.col2,dl.dn.func_onclick=f,g,i,nil
if(dl.id==19) dv=dl
end
if db.col1 then
dl.col1,dl.col2=db.col1,db.col2
end
if(dl.id==31) dl.owner=0
local dw,dx=flr(cq/8),flr(ct/8)
if db.type==2 then
dl.dy,dl.dz=53,0
local ea=(db.id==2 or db.id==3)
for eb=0,db.w-1 do
for ec=0,db.h-1 do
ed(dw+eb,dx+ec,ea and 16 or dl.owner==1 and 149 or 27)
end
end
if(not ea) add(m,dl)
if dl.id==6 and dl.bl==nil then
p[dl.owner]=dl
local ee,ef=eg(dl,(dl.cq+32)/8,(dl.ct+8)/8,eh)
dj(cm[30],ee*8,ef*8,nil,dl)
end
end
if db.type==1 then
dl.dy=54
if(dl.norotate!=1) dl.ei=flr(rnd"8")*.125
if dl.arms>0 then
dl.ej=function(self)
self.ek,self.el,self.em,self.en,self.eo=4,self.cq+4,self.ct+4,self.ep.cq+self.ep.w/2,self.ep.ct+self.ep.h/2
local eq,er=self.en-self.el,self.eo-self.em
local es=sqrt(eq*eq+er*er)
self.et,self.eu=(eq/es)*2,(er/es)*2
sfx(self.arms<100 and 60 or 58,3)
ev(self)
end
if(dl.id==15 or dl.id==16) ed(dw,dx,149)
else
if(dl.id==30) dl.ew=0 dl.ex=p[dl.owner]
end
add(n,dl)
ey(dl)
end
ev(dl)
return dl
end
function dm(ez,cq,ct,fa,bl,func_init,func_draw,func_onclick)
local fb={
fc=ez,
id=ez.id,
hitpoint=ez.hitpoint,
cq=cq,
ct=ct,
z=ez.z,
type=fa,
bl=bl,
func_onclick=func_onclick,
w=(ez.w or 1)*8,
h=(ez.h or 1)*8,
fd=ez.obj_spr,
fe=ez.w,
ff=ez.h,
cl=0,
fg=0,
cb=0,
fh=0,
dz=0,
fi=0,
fj=1,
by=1,
cp=function(self)
return{
cq=self.cq,
ct=self.ct,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cv=func_draw or function(self)
if self.type<=2
and(self.cq+self.w<cs
or self.cq>cs+127
or self.ct+self.h<cu
or self.ct>cu+127)
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
if self.ei then
if not self.fk or self.fk>.025 then
if(self.speed>0) fl(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cq,self.ct,.25-self.ei,1,self.trans_col,5)
fl(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cq,self.ct-self.z,.25-self.ei,1,self.trans_col,flr(self.fj)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.cq-1,self.ct-1,self.cq+16,self.ct+19,0)
local fm=self.type==4 and self or self.bl
local fn=fm.hitpoint
local fo=self.cb==1 and 12 or fm.cl<fn*.33 and 8 or fm.cl<fn*.66 and 10 or 11
local fp=self.cb==1 and(15*(fm.cl/100)) or(15*(fm.cl/fn))
if(fm.cl>0 and not bs) rectfill(self.cq,self.ct+17,self.cq+fp,self.ct+18,fo)
end
if self.type>2 then
spr(self.ico_spr,self.cq,self.ct,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
bz(self)
end
end
if self.el then
if self.fire_type==1 then
pset(self.el,self.em,rnd"2"<1 and 8 or 9)
else
local fq=self.fire_type==2
fr(self.el,self.em,0,
0,0,
fq and .15 or 2,
-.01,
fq and 20 or 2.5,
fq and{7,7,10,9,8,2,13,6,7} or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>24 and self.cl<self.hitpoint*.33 and rnd"10"<1) fr(self.cq+3.5,self.ct+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd"2"<1 and 0xa5a5.8 or 0)
self.fi=0
end,
fs=function(self)
local cl=self.cl
self.fj=max(self.fj-.4,1)
if self.fi>0 then
ft(true)
if(fu==0 or stat(24)>5) fu=1 music"0"
if(self.arms>0 and self.ek==0) fv(self,self.fw)
if(self.obj_spr==55 and cl<100) self.fe=0.5 self.ff=0.5
end
if(self.type<=2 and cl<=0 and self.fk==nil) self.ek=5 self.fx=nil self.fk=(self.type==2 and 1 or .5) sfx(self.dy,3) cx+=((self.type==2 or self.id==36) and 0.25 or 0)
if self.fk then
self.fk-=.025
if self.fk<=0 then
if self.type==2 then
for eb=0,self.fe-1 do
for ec=0,self.ff-1 do
ed(self.cq/8+eb,self.ct/8+ec,15)
end
end
del(m,self)
y[self.fw.dr]+=1
else
local fy,fz=self:ga()
if(fz>31) fy+=64 fz-=32
if(gb(fy,fz)<9) ed(fy,fz,20)
if(self.speed==0) ed(fy,fz,15)
del(n,self)
if(self.fw) ba[self.fw.dr]+=1
end
if(bp==self) bp=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gc(self.cq+rnd(self.w),self.ct+rnd(self.h))
end
end
if self.framecount!=nil then
self.fg+=1
if self.fg>self.framecount then
self.fg=0
if self.altframe
and self.ek==2 then
self.obj_spr=self.fd+(self.altframe-self.obj_spr)
end
if self.bw then
self.by+=1
if(self.by>#self.bw) self.by=1
end
end
end
if self.el then
self.el+=self.et
self.em+=self.eu
if dq(
self.el,self.em,
self.en,self.eo)<2
then
gc(self.el,self.em,self.fire_type)
local ep=self.ep
if dq(
self.el,self.em,
ep.cq+ep.w/2,
ep.ct+ep.h/2)<4
then
ep.cl-=self.arms
ep.fi,ep.fw=self.fire_type,self
if self.id==38 and ep.speed>0 then
ep.owner,ep.du,ep.col1,ep.col2=self.owner,self.du,self.col1,self.col2
ey(self)
elseif ep.gd then
ep.du,ep.col1,ep.col2,ep.gd=ep.gd,ep.ge,ep.gf,nil
ey(ep)
end
end
self.el=nil
end
end
if self.cb>0
and not self.cc
and not self.gg then
if self.cb==1 and self.fh>self.cost then
self.gg=true
if(self.owner==1) sfx"56"
if self.fc.type==1
and self.parent_id!=1 then
local ee,ef=gh(self,self.bl)
dj(self.fc,ee,ef,nil,self.bl)
gi(self)
end
elseif self.cb==2 and cl>self.hitpoint then
self.cb=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.ex)
self.ek=0
self.cq,self.ct=gh(self,self.ex)
end
else
if self.cj>(self.cb==1 and 3 or 100) then
if(gj(-1,self.cb==1 and self.bl or self)) self.cj=0 self.fh+=1
else
self.cj+=1
self.cl=(self.cb==1 and(self.fh/self.cost)*100 or cl+.5)
end
end
end
if self.dz>0 then
self.dz-=.1
end
end,
gk=function(self,cq,ct)
self.cq,self.ct=cq,ct
end,
gl=function(self)
local cq,ct=self:ga()
return cq..","..ct
end,
ga=function(self)
return flr(self.cq/8),flr(self.ct/8)
end
}
for gm,gn in pairs(ez) do
if fb[gm]==nil and gn!=""then
fb[gm]=gn
end
end
if(func_init) func_init(fb)
return fb
end
function gj(go,fb)
if(gp(k[fb.owner])+go<0) return false
k[fb.owner]+=sgn(go)*shr(abs(go),16)
if(fb.owner==1) sfx"63"
return true
end
function gc(cq,ct,gq)
fr(cq,ct,2,
0,0,.1,0,gq==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function ev(gr)
if(gr.owner!=1 and gr.ek!=4) return
local gs=gr.type==2 and 3 or 2
for eb=-gs,gs do
for ec=-gs,gs do
local gt,gu=flr(gr.cq/8)+eb,flr(gr.ct/8)+ec
gv[gt][gu]=16
gw(gt,gu)
for er=-1,1 do
for eq=-1,1 do
gw(gt+eq,gu+er)
end
end
end
end
end
function _update60()
gx()
if(not bs) gy()
if t()%1==0 then
if t()%2==0 then
gz()
else
ha()
end
end
x+=1
end
function _draw()
hb()
hc()
end
function co()
gv={}
for cy=-2,66 do
gv[cy]={}
for hd=-2,66 do
gv[cy][hd]=0
end
end
end
function he()
local hf,hg=flr(cs/8),flr(cu/8)
palt(0,false)
palt(11,true)
for eb=hf-1,hf+16 do
for ec=hg-1,hg+16 do
if gv[eb][ec]!=0 and gv[eb][ec]!=16 then
spr(gv[eb][ec]+31,eb*8,ec*8)
elseif gv[eb][ec]<16 then
rectfill(eb*8,ec*8,eb*8+7,ec*8+7,0)
end
end
end
end
function gw(cq,ct)
if(cq<0 or cq>#gv or ct<0 or ct>#gv) return
local hh=0
if gv[cq][ct]!=0 then
if(gv[cq][ct-1]>0) hh+=1
if(gv[cq-1][ct]>0) hh+=2
if(gv[cq+1][ct]>0) hh+=4
if(gv[cq][ct+1]>0) hh+=8
gv[cq][ct]=1+hh
end
end
function ha()
q={}
if bd then
for cy=0,124,4 do
for hd=0,124,4 do
local da,cz=cy/2,hd/2
if(cz>=32) da+=64 cz-=32
local hi=mget(da,cz)
local fo=sget((hi*8)%128+4,(hi*8)/16)
if(gv[cy/2][hd/2]==16) q[(cy/2/2)..","..(hd/2/2)]=fo!=11 and fo or 15
end
end
end
hj,hk,hl,hm=0,0,false,{0,0}
for df,hn in pairs(m) do
local gt,gu=hn:ga()
if hn.owner==1 or(bd and gv[gt][gu]==16) then
q[flr(hn.cq/2/8)..","..flr(hn.ct/2/8)]=hn.col1
end
if hn.owner==1 then
u[hn.id]=hn
hj-=hn.power
if(hn.id==7) hl=true
if(sub(hn.name,1,5)=="sPICE") hk+=1000
end
hm[hn.owner]+=1
end
if bd then
for df,ho in pairs(n) do
if ho.owner==1 or gv[flr(ho.cq/8)][flr(ho.ct/8)]==16 then
u[ho.id]=ho
q[flr(ho.cq/2/8)..","..flr(ho.ct/2/8)]=ho.col1
end
end
end
bd,fu=(hl and hj>0),2
ft(false)
if(k[3]>0 and k[1]>k[3]) hp=1
if(hm[2]==0 and b>1) hp=2
if(hm[1]==0) hp=3
if hp then
dset(14,hp)
dset(13,t()-v)
dset(10,hq)
dset(24,gp(k[2]))
dset(11,ba[1])
dset(25,ba[2])
dset(12,y[1])
dset(26,y[2])
rectfill(30,54,104,70,0)
?"mission "..(hp<3 and"complete"or"failed"),36,60,d
flip()
load("pico-dune-main")
end
end
function gz()
o={}
for gm,ho in pairs(n) do
o[ho:gl()]=gm
end
end
function gx()
hr,hs,ht=stat"32",stat"33",stat"34"
hu,hv,hw=(ht==1 and hx!=ht) or btnp"4",(ht>0) or btn"4",(ht==2 and hx!=ht) or btnp"5"
for gm=0,1 do
if(btn(gm)) bb+=gm*2-1
if(btn(gm+2)) bc+=gm*2-1
if(btnp(4,1)) stop("paused")
end
hy,hz=mid(0,hr+bb,127),mid(0,hs+bc,127)
cursor.cq,cursor.ct=hy,hz
if not bs then
if(hy<4) cs-=2
if(hy>123) cs+=2
if(hz<4) cu-=2
if(hz>123) cu+=2
cs,cu=mid(cs,384),mid(-8,cu,384)
for df,ho in pairs(n) do
if ho then
if ho.fx and costatus(ho.fx)!="dead"then
assert(coresume(ho.fx,ho))
else
ho.fx=nil
end
if ia
and fget(gb(ho:ga()),2)
and dq(ib,ic,ho.cq,ho.ct)<1
and ho.z==1
then
del(n,ho)
ie=.01
end
end
end
for gm,ig in pairs(s) do
ig.er+=ig.ih
ig.cq+=ig.eq
ig.ct+=ig.er
ig.ei+=ig.ii
ig.cl+=1
if(ig.cl>=ig.ij) del(s,ig)
end
end
ik()
hx,ce,bu=ht,bp,bj
end
function il(cq,ct)
local fp=gb(cq,ct)
return fp>=2 and fp<=8
end
function ey(ho,im)
ho.ek,ho.io=im or 0,nil
ho.fx=cocreate(function(self)
while true do
if rnd"500"<1 and self.arms>0 and self.ek!=8 then
eg(self,flr(self.cq/8),flr(self.ct/8),ip,self.range)
end
local ex=self.ex
if self.id==31 then
iq(self,flr(rnd"26"),flr(rnd"26"))
end
if self.id==30 then
if self.ek==0 or self.ek==9 then
if self.ew<=1500
and self.ek!=7 and self.ek!=9 then
local ir,is
local it,iu=self:ga()
if il(it,iu) and not self.iv then
ir,is=it,iu
else
eg(self,it,iu,
function(ho,cq,ct)
if il(cq,ct) and rnd"10"<1 then
ir,is=cq,ct
return true
end
end,
10)
end
if ir and is then
iq(ho,ir,is)
if(il(ho:ga())) ho.ek=6
end
end
elseif self.ew>=100
and self.ek!=7 then
self.ir,self.is=self:ga()
printh(ex)
iw(self,ex)
elseif self.ek==6 then
self.iv=false
ix(ho.cq,ho.ct,ho.ei+.75+rnd".2"-.1)
local iy=ho:gl()
r[iy],self.ew=(r[iy] or 1000)-1,(self.ew or 0)+.5
if r[iy]<=0 then
local dw,dx=self:ga()
for ec=-1,1 do
for eb=-1,1 do
fp=gb(dw+eb,dx+ec)
ed(dw+eb,dx+ec,
(eb==0 and ec==0) and 0 or((fp>1 and fp<8) and 8 or fp)
)
end
end
self.ek=0
end
if(self.ew%300==0) self.iv=true self.ek=0
end
end
if self.id>24 then
if self.ek==9 then
if ex.cl>0 and not ex.iz then
ex.bx,self.ek,self.ei,self.cq,self.ct=false,8,.25,ex.cq+16,ex.ct+4
if(bp==self) bp=nil
if self.ew then
ex.iz=true
while self.ew>0 do
self.ew-=1
if(flr(self.ew)%4==0 and tonum(hq)<hk) gj(2,self)
yield()
end
self.ew,ex.iz,self.ek=0,false,0
if(self.ir) iq(self,self.ir,self.is,0,true)
else
self.cb,self.cj,ex.bv,ex.bw=2,0,8,{7,10,0,0,7,0,0}
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function gh(fb,ep)
local ee,ef=eg(fb,(ep.cq+8)/8,(ep.ct+16)/8,eh)
return ee*8,ef*8
end
function ix(cq,ct,ei)
local ja,jb=sin(ei)*5.5,-cos(ei)*5.5
if(rnd"5"<1) fr(cq+ja+3.5,ct+jb+3.5,rnd"2",.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fv(ho,ep)
if ho.id!=19 then
ho.ek,ho.ep=3,ep
ho.fx=cocreate(function(self)
while ep.cl>0 do
local jc=dq(ho.cq,ho.ct,ep.cq,ep.ct)
if jc>ho.range*5
and ho.speed>0 then
iq(ho,flr(ep.cq/8),flr(ep.ct/8),ho.range*5)
if ho.id==23 or ho.id==36 then
ho.cl=0
for cy=1,ho.id/3 do
gc(ho.cq+rnd"32"-16,ho.ct+rnd"32"-16,2)
end
ep.cl-=(100+rnd"50")
ep.fw=ho
return
end
end
if not ho.norotate then
local jd=atan2(ho.cq-ep.cq,ho.ct-ep.ct)
while(ho.ei!=jd) do
je(ho,jd)
end
end
if jc<=ho.range*5 then
if(ho.dz<=0 and not ho.el) ho.ej(ho) ho.dz=ho.arms/4
elseif ho.speed==0 then
ey(ho)
end
yield()
if(ho.id==38 or ep.du==ho.du) break
end
ey(self)
end)
else
local jf={22,23,36,36}
fv(dj(cm[jf[ho.du]],ho.cq,ho.ct,ho.owner),ep)
ho.dz=1750
end
end
function eg(ho,cq,ct,jg,jh)
for dq=1,jh or 64 do
for eb=cq-dq,cq+dq do
for ec=ct-dq,ct+dq do
if((eb==cq-dq or eb==cq+dq or ec==ct-dq or ec==ct+dq) and(jg(ho,eb,ec))) return eb,ec
end
end
yield()
end
end
function gb(da,cz)
if(cz>31) da+=64 cz-=32
return mget(da,cz)
end
function ed(da,cz,ji)
if(cz>31) da+=64 cz-=32
mset(da,cz,ji)
end
function eh(ho,cq,ct)
return not fget(gb(cq,ct),0)
and o[cq..","..ct]==nil
end
function ip(ho,cq,ct)
local ep=n[o[cq..","..ct]]
if(ep!=jj and ep.owner!=ho.owner and ep.dr!=ho.dr and gv[cq][ct]==16) fv(ho,ep) return true
end
function iq(ho,cq,ct,jk,jl,im)
local jm=ho.z>1
local jn=u and u[31] or false
if jl and jn and not jn.io then
jn.io,jn.jo,jn.jp=ho,cq,ct
ho.io=jn
jn.fx=cocreate(function(jq)
local jr=jq.io
iq(jq,flr(jr.cq/8),flr(jr.ct/8))
del(n,jr)
iq(jn,jn.jo,jn.jp)
jr:gk(jn.cq,jn.ct)
add(n,jr)
ey(jn)
ey(jr,im)
end)
return
end
::restart_move_unit::
if not jm and not eh(nil,cq,ct) then
cq,ct=eg(ho,cq,ct,eh)
end
ho.it,ho.iu,ho.js,ho.ek=cq,ct,ho.ek,1
ho.jt=nil
local ju,jv,jw={cq=flr(ho.cq/8),ct=flr(ho.ct/8)},{cq=ho.it,ct=ho.iu},function(jx) return shl(jx.ct,8)+jx.cq end
local jy,
jz={
ka=ju,
kb=0,
kc=kd(ju,jv)
},{}
jz[jw(ju)]=jy
local ke,kf,kg,kh,count={jy},1,jw(jv),32767.99,0
while kf>0 do
local cost,ki=kh
for cy=1,kf do
local kj=ke[cy].kb+ke[cy].kc
if(kj<=cost) ki,cost=cy,kj
end
jy=ke[ki]
ke[ki],jy.kk=ke[kf],true
kf-=1
local ig=jy.ka
if jw(ig)==kg then
ig={jv}
while jy.kl do
jy=jz[jw(jy.kl)]
add(ig,jy.ka)
end
ho.jt=ig
goto end_pathfinding
end
for km in all(kn(ig,jm)) do
local id=jw(km)
local ko=not jm and fget(gb(km.cq,km.ct),1) and 4 or 1
if(ig.cq!=km.cq and ig.ct!=km.ct) ko+=.2
local kp,kq=
jz[id],
jy.kb+ko
if not kp then
kp={
ka=km,
kb=kh,
kc=kd(km,jv)
}
kf+=1
ke[kf],jz[id]=kp,kp
end
if not kp.kk and kp.kb>kq then
kp.kb,kp.kl=kq,ig
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
ho.js,ho.ek=ho.ek,2
if ho.jt!=nil then
for cy=#ho.jt-1,1,-1 do
local jx=ho.jt[cy]
if not ho.norotate then
local jd=atan2(
ho.cq-(jx.cq*8),
ho.ct-(jx.ct*8))
while(ho.ei!=jd) do
je(ho,jd)
end
end
if(not jm and not eh(nil,jx.cq,jx.ct)) goto restart_move_unit
local kr,ks=ho.speed or .5,sqrt((jx.cq*8-ho.cq)^2+(jx.ct*8-ho.ct)^2)
local kt,ku=kr*(jx.cq*8-ho.cq)/ks,kr*(jx.ct*8-ho.ct)/ks
for cy=0,ks/kr-1 do
o[jx.cq..","..jx.ct]=ho
ho.cq+=kt
ho.ct+=ku
yield()
end
ho.cq,ho.ct,o[jx.cq..","..jx.ct]=jx.cq*8,jx.ct*8,ho
ev(ho)
if(dq(ho.cq,ho.ct,ho.it*8,ho.iu*8)<=(jk or 0)) break
end
end
ho.ek=0
end
function hb()
cls"15"
camera(cs+(16-rnd"32")*cx,cu+(16-rnd"32")*cx)
cx=(cx>0.05) and cx*0.95 or 0
if ia then
for cy=1,#ia do
if(cy%2==1) fillp(0xa5a5.8)
circfill(
ia[cy][1]+4,
ia[cy][2]+4,4,
kv[cy%#kv+1])
fillp()
end
if(ie>0) spr(88+ie,ib,ic)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for df,hn in pairs(m) do
if not bs then
hn:fs()
if(hn.bt) hn.bt:fs()
end
hn:cv()
if(hn==bp) rect(bp.cq,bp.ct,bp.cq+bp.w-1,bp.ct+bp.h-1,7)
end
pal()
for ig=1,2 do
for df,ho in pairs(n) do
if(ig==1 and ho.z==1) or(ig==2 and ho.z>1) then
if(not bs) ho:fs()
if(ho.cb!=2 or ho.speed==0) ho:cv()
if(ho==bp) spr(17,bp.cq,bp.ct)
end
end
end
for gm,ig in pairs(s) do
if(ig.kw) fillp(ig.kw)
circfill(ig.cq,ig.ct,ig.ei,ig.kx[flr((#ig.kx/ig.ij)*ig.cl)+1])
fillp()
end
he()
end
function ky()
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bd!=bf then
be,kz=bd and 1 or 59,bd and 1 or-1
sfx"55"
ha()
end
bf=bd
if be>0 and be<60 then
be+=kz
clip(
max(108-be,91),
max(108-(be>20 and be-20 or 0),91),
min(be*2,33),
min((be>20 and be-20 or 1)*2,33))
for cy=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for eb=0,31 do
for ec=0,31 do
if(q[eb..","..ec]) pset(92+eb,92+ec,q[eb..","..ec])
end
end
local ja,jb=92+cs/16,92+cu/16
rect(ja,jb,ja+7,jb+7,7)
end
function cg(la)
bg,bh=la,500
end
function hc()
camera(0,0)
pal()
palt(0,false)
if bp and bp.dn then
bp.dn:gk(109,20)
bp.dn:cv()
if bp.bt and bp.owner==1 then
bp.bt:gk(109,44)
bp.bt:cv()
end
lb=nil
if bp.cl<bp.hitpoint
and bp.owner==1
and bp.id!=4
and(bp.type==2
or bp.speed==0) then
lb=dm(cm[80],117,28,5,{},nil,ca,repair_click)
lb:cv()
end
lc=nil
if bp.id==19
and bp.dz<=0 then
lc=dm(cm[81],109,29,5,{},nil,ca,cf)
lc:cv()
end
end
rectfill(0,0,127,8,9)
hq=gp(k[1])
? sub("000000",#hq+1)..hq,103,2,e
if bp
and bp.bt
and(bp.bt.type==4
or bp.bt.speed==0)
and bp.bt.cl>=100 then
local ld,le=flr((cursor.cq+cs)/8),flr((cursor.ct+cu)/8)
local lf,lg,w,h=ld*8-cs,le*8-cu,bp.bt.fe,bp.bt.ff
lh,li,dp=false,false,false
for eb=-1,w do
for ec=-1,h do
if eb==-1 or eb==w or ec==-1 or ec==h then
if(gb(ld+eb,le+ec)==16 or gb(ld+eb,le+ec)>=58) lh=true
else
local fp=gb(ld+eb,le+ec)
if(fp>=9 and fp<=15) dp=true
if(o[ld+eb..","..le+ec] or fp==0 or fp<8 or fp>16) li=true
end
end
end
if(li) lh=false
fillp("0b1110110110110111.1")
rectfill(lf,lg,
lf+bp.bt.w,lg+bp.bt.h,lh and 11 or 8)
fillp()
end
ky()
if bs then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bp.bm then
bp.bq={}
rectfill(6,25,27,92,0)
local lj=1
for cy=1,#bp.bm do
local lk=bp.bm[cy]
if lk.req_id==nil
or u[lk.req_id]
then
bp.bq[lj]=lk
if lj>=bi and lj<=bi+2 then
lk:gk(9,28+(lj-bi)*19)
lk:cv()
else
lk:gk(-16,16)
end
if bj==lk then
bo=lj
rect(lk.cq-2,lk.ct-2,
lk.cq+17,lk.ct+17,
7)
? bj.name,30,26,7
?"cOST:"..bj.cost,85,33,9
? bj.description,30,39,6
end
lj+=1
end
end
end
for df,ll in pairs(bk) do
ll:cv()
end
end
palt(11,true)
cursor:cv()
end
function bn(cq,ct,lm,func_onclick,ln)
add(bk,{
cq=cq,
ct=ct,
w=ln or#lm*4+2,
h=8,
lm=lm,
cp=function(self)
return self
end,
cv=function(self)
if(#lm>1) rectfill(self.cq,self.ct,self.cq+self.w,self.ct+self.h,7)
if(#lm>1) rectfill(self.cq+1,self.ct+1,self.cq+self.w-1,self.ct+self.h-1,self.lo and 12 or 6)
? self.lm,self.cq+2,self.ct+2,(#lm>1) and 0 or(self.lo and 12 or 7)
end,
func_onclick=func_onclick
})
end
function bz(fb)
spr(fb.obj_spr,fb.cq,fb.ct,fb.fe,fb.ff)
end
function ik()
lp=false
if bp then
cr=true
lq(lb)
lq(lc)
if(bp.dn and not bs and not lp) lq(bp.dn)
foreach(bp.bm,lq)
if(bs) foreach(bk,lq)
cr=false
end
if not bs
and not lp then
foreach(n,lq)
foreach(m,lq)
end
if hv
and not bs
and hy>89 and hy<122
and hz>90 and hz<123 then
cs,cu=mid(0,(hy-94)*16,400),mid(-8,(hz-94)*16,400)
bp=ce
elseif hu then
ch=false
if(bp) cg(bp.name)
if lp then
if(not bs and bp.func_onclick and bp.bl!=nil) bp:func_onclick() bp=ce return
if(bs and bj.lm and bj.func_onclick) bj:func_onclick()
if(bp.owner==1 and bp.type==1 and bp!=ce and bp.speed>0) sfx"62"
if(bp.owner==2 and ce and(ce.type==1 or ce.id==19) and ce.owner==1) bp.fj=10 fv(ce,bp) bp=nil u={}
else
if bp
and bp.type==1
and bp.owner==1
and bp.speed>0
and bp.ek!=7 then
bp.fx=cocreate(function(ho)
iq(ho,flr((cs+hy)/8),flr((cu+hz)/8))
ey(ho)
end)
end
if bp
and bp.bt
and bp.bt.cl>=100
and lh then
local db=bp.bt.fc
dj(db,
flr((cursor.cq+cs)/8)*8,
flr((cursor.ct+cu)/8)*8,1)
gi(bp.bt)
sfx"61"
end
if(not bs) bp=nil
end
elseif hw and not bs then
bp,ch=nil,false
end
end
function gi(fb)
fb.cl,fb.cb,fb.fh,fb.gg=0,0,0,false
end
function lq(fb)
if(fb==nil) return
fb.lo=lr(cursor,fb)
if hu and fb.lo then
if bs then
bj=fb
else
if(fb.type<=2 and gv[flr((cursor.cq+cs)/8)][flr((cursor.ct+cu)/8)]!=16 or fb.ek==8) return
if bp
and(fb.id==6 and bp.id==30
or fb.id==14 and bp.id>24)
and fb.owner==1
then
iw(bp,fb)
return
else
bp=fb
end
end
lp=true
end
end
function iw(ho,lt)
ho.ek,ho.ex,lt.bx=7,lt,true
ho.fx=cocreate(function(ho)
iq(ho,(lt.cq+16)/8,(lt.ct+16)/8,0,true,9)
if(ho.io==nil) ey(ho,9)
end)
end
lu=0
function gy()
if t()>j and t()%j*2==0 then
local lv=rnd(n)
if lv.owner==2 and lv.arms>0 and lv.ek==0 then
lw=(rnd"2"<1) and rnd(n) or rnd(m)
if(lw and lw.owner==1 or lw.dr==1) fv(lv,lw)
end
local lx=rnd(m)
if lx.owner==2 then
if lx.bt and lx.bt.fc.type==1 and lx.bt.cb!=1 then
local ly=rnd(lx.bm)
lx.bt=ly
ly:func_onclick()
end
if lx.cl<lx.hitpoint and lx.cb!=2 then
cd(lx,2)
end
end
if lw and lw.owner==1 and lw.type==2
and dv and dv.dz<=0 then
fv(dv,lw)
end
end
lu-=1
if lu<0 then
if ia then
ia=nil
else
ia,lz,ma,kv,ie={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
mb=rnd"5000"
lu=mb
end
if ia then
if(x%6<1 or#ia<30) and ie==0 then
while#ia<31 do
if(rnd"9"<.5) ma=rnd".04"-.02
ib,ic=ia[#ia][1],ia[#ia][2]
add(ia,{ib+sin(lz),ic-cos(lz)})
lz+=ma
end
end
if(#ia>30) del(ia,ia[1])
if(ie>2) ie=0
end
end
function ft(mc)
local fp=peek(0x3115)
if((band(fp,128)>0)!=mc) fp=bxor(fp,128)
poke(0x3115,fp)
end
function lr(md,me)
local mf,mg=md:cp(),me:cp()
return mf.cq<mg.cq+mg.w and
mf.cq+mf.w>mg.cq and
mf.ct<mg.ct+mg.h and
mf.ct+mf.h>mg.ct
end
function cn()
mh=mi(cm,"|","\n")
cm={}
for cy=2,#mh-1 do
mj={}
for mk=1,#mh[cy] do
local fp=mh[cy][mk]
if(mk!=2 and mk<29) fp=tonum(fp)
if mk==29 then
ml=mi(fp,"~")
fp=""
for cy=1,#ml do
fp=fp.."\n"..ml[cy]
end
end
mj[mh[1][mk]]=fp
end
cm[tonum(mh[cy][1])]=mj
end
end
function gp(fp)
local mm,gn="",abs(fp)
repeat
mm=(gn%0x0.000a/0x.0001)..mm
gn/=10
until gn==0
if(fp<0) mm="-"..mm
return mm
end
function mi(mn,es,mo)
local jd,mm,mp={},"",""
if(mo~=nil) mn=mi(mn,mo)
while#mn>0 do
if type(mn)=="table"then
mm=mn[1]
add(jd,mi(mm,es))
del(mn,mm)
else
mm,mn=sub(mn,1,1),sub(mn,2)
if mm==es then
add(jd,mp)
mp=""
else
mp=mp..mm
end
end
end
add(jd,mp)
return jd
end
function fl(ir,is,cq,ct,jd,w,mq,mr)
local ms,mt=cos(jd),sin(jd)
local mu,mv,hh=ms,mt,shl(0xfff8,(w-1))
w*=4
ms*=w-0.5
mt*=w-0.5
local mw,mx,w=mt-ms+w,-ms-mt+w,2*w-1
for my=0,w do
local mz,na=mw,mx
for nb=0,w do
if band(bor(mz,na),hh)==0 then
local nc=sget(ir+mz,is+na)
if(nc!=mq) pset(cq+my,ct+nb,mr or nc)
end
mz-=mv
na+=mu
end
mw+=mu
mx+=mv
end
end
function dq(nd,ne,nf,ng)
return abs(sqrt(((nd-nf)/1000)^2+((ne-ng)/1000)^2)*1000)
end
function je(ho,nh)
local go=nh-ho.ei
if(ho.z>1) ho.ei=nh
if go>0.5 then
go-=1
elseif go<-0.5 then
go+=1
end
if go>0.0087 then
ho.ei+=0.0087
elseif go<-0.0087 then
ho.ei-=0.0087
else
ho.ei=nh
end
yield()
end
function kn(jx,jm)
local ni={}
for eb=-1,1 do
for ec=-1,1 do
if(eb!=0 or ec!=0) nj(jx.cq+eb,jx.ct+ec,ni,jm)
end
end
return ni
end
function nj(nk,nl,nm,jm)
if(jm or not fget(gb(nk,nl),0) and o[nk..","..nl]==nil and nk>=0 and nl>=0 and nk<=63 and nl<=63) add(nm,{cq=nk,ct=nl})
end
function kd(jd,nn)
return abs(jd.cq-nn.cq)+abs(jd.ct-nn.ct)
end
function fr(cq,ct,ei,eq,er,ii,ih,cl,kx,kw)
local ig={
cq=cq,ct=ct,ei=ei,eq=eq,er=er,ii=ii,
cl=0,ih=ih,
kx=kx,kw=kw,
no=ct,ij=cl
}
add(s,ig)
end
__gfx__
bbbbbbbbbb171bbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbb9b5d555d555d555d55d555d5bbbbbbbbb1d5155555d555d5bdddddddd
bb11bbbbb17771bbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb991555515d15555155d51555515dbbbd5b5155d55dd5155551d5555555
bb171bbb1711171bbbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b5d55d5515d55d555155d55d5d5155551555d5155155d55d5d5015515
bb1771bb7717177bbbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbb55515d5555515d5d55d51555155d55d5d5555d5555d51555d5105555
bb17771b1711171bbbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99bd55d5555d55555555555d55d55d5155555d155d55555d55dd5555111
bb177771b17771bbbbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbb55d551d555d515555d155d555555d55d155555555d155d55d1555101
bb17711bbb171bbbbbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb1555555555555515555555515d155d55b51bbd5b55555551d5555111
bbb11bbbbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbb55d5515555d55555155d55b55555551bbbbbbbb5155d55bd5515555
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
bbbbbbbbbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbb7bbb7bbb7bbb7bbbbbbbbbbdddddddddddddddddddddddddfffb1ffddddd999dddddddd
b0eee0bbb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbbcbbbcbbbcbbbcbbbdeeedbbd555555555555544c4555555df4aa14ff559999999555765
b0d6d0bbb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbbebbbebbbebbbebbb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
bbc7cbbbbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbb0bbb0bb0b0b0b0bb6d7d6bbd4c455444445549904499c95df444444f52449494425dffd
b0c7c0bbbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbbbb7bbbbbbb7bbbbb6d4d6bb4a042499999452424297a094dffffffff5424444424556d5
b0ccc0bbb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbbbbcbbbbbbbcbbbbb69996bb49029999c0994922229aa094d44444444522424244255425
bb6b6bbbb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbbbebbbbbbbebbbbbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbbbbbbbbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbbbbbbbbbd2499a77a0a94942d1542425d44411114555224225ff2225
d77dd77d67d6fffdddd776ddddddddddddddddddddd777ddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99424d15242f5d55555555555555555f44225
76667666561ffff1d576db65d5577655d5555555d5766665d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d76dbbb5d576db65d5557555d5766665d5bbbbb5bbbddbbbbbdadbbbbbb77bbbd52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d66d11b5d76dbbb5d5576655d5d66625d5555555bbd66dbbbb666bbbc767767cd5424999994942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d66d01b0d66d11b5d55d6255d5dd2225d55aaa55bbd66dbbbbb6bbbbc767767cd5542494949424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d66d0b01d66d01b0d55d2215d5dd2221d5555555bbbddbbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
6115511151551005d56dd015d66d0b01d5551155d5512211d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5511155d56dd015d5555555d5551115d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5ddddd776ddd111ddddd777ddddddddddddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc055d55576db65555555d5766665d5555555d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d5576dbbb555c055d5766665d5557555d5558555b1b11b1bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd5566d11b55ee055d5d66625d5576655d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad5555055d5566d01b0555055d5dd2225d55d6255d55aaa55b651156b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d5566d0b01555055d5dd2221d55d2215d5555555b7b55b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5556dd015555555d5512211d5551155d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d5555111d5555555d5551115d5555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666dddddddddddddddddddddddd66666666666ddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4dddddd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddddd4ddd5dd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddd5ddd5dddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
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
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
0000000000000000001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
121212000000001616161600420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0000160085850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a3a10100c830a85420a6c0a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a1010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d00800e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120000160000010a0000440a090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200160000850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000121200000000850085006a0a0085001d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000003d00000000490000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000c090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121200000000000000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a0a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a0a1e1b1b1b1c0a6000000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

