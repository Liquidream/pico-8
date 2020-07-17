pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
cartdata("pn_undune2")
a,b,c,d=dget"0",dget"1",dget"2",dget"3"
e,f,g,i=dget"20",dget"21",dget"22",dget"23"
j={
shr(dget"6",16),
shr(500,16),
shr(dget"7",16),
}
k,l,m,n,o,p,q,r,s,u,v,x,y,ba,bb,bc={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0
bd,be,bf,bg=bb,"",0,{}
k.factory_click=function(self)
bh,bi,bj=1,self.bk.bl[1],{}
bm(6,84,"⬆️",function()
bn=mid(1,bn-1,#bo.bp)
bi=bo.bp[bn]
if(bn<bh) bh-=1
end,10)
bm(17,84,"⬇️",function()
local bq=#bo.bp
if(bn<bq) bn=mid(1,bn+1,bq)
bi=bo.bp[bn]
if(bn>bh+2) bh=min(bh+1,bq-2)
end,10)
bm(32,83,"build",function()
br,bo.bs=nil,bt
bt:func_onclick()
end)
bm(96,83,"close",function()
br=nil
end)
br=self
end
k.init_windtrap=function(self)
self.bu=11
self.bv=bw("12,12,12,12,13,1,1,1,1,13",",")
end
k.init_refinery=function(self)
self.bv=bw("11,10,8,8",",")
end
k.draw_refinery=function(self)
pal()
pal(11,self.col2)
pal(10,self.col2)
pal(8,self.col2)
if self.bx then
pal(self.bv[self.by],self.col1)
else
pal(11,self.col1)
self.by=1
end
bz(self)
end
k.init_repairfact=function(self)
self.bu,self.bv=8,{0}
end
ca=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bo.cb==2 and not bo.cc) pal(7,11)
bz(self)
pal()
end
repair_click=function()
cd(ce,2)
end
cf=function(self)
if ce.id!=35 then
cg"pick target"
ch=true
else
local ci,cj=ce:ck()
local cl=cm(ci,cj)
if cl>=9 and cl<=15 then
del(m,ce)
cn(co[1],ci*8,cj*8,1)
sfx"61"
end
ce=nil
end
end
function cd(self,cp)
self.cq,self.cr=0,self.cb
if(self.cs>0 and self.cr>0) self.cc=not self.cc
self.cb=cp
end
co=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1|nil|nil|||||||2|2|nil|1|||100|0|0|1600||||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1|nil|1|||||7|5|2|2|1|4|||20|0|0|0||||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1|nil|1|||||6|6|2|2|1|1|||5|0|0|0||||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1|nil|1|||||||2|2|7|4|||50|0|0|200||||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1|nil|1|||||||2|2|1|1|||300|-100|0|800|||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174|2|3|2|1|nil|1|||||||2|2|1|1|||400|30|0|1800|||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1|nil|1|||||||2|2|1|2|||400|30|0|2000||||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1|nil|1|||||||2|2|6|2|||150|5|0|600||||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1|nil|1|||||11|3|2|2|7|2|||300|10|0|1200||||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1|nil|1|||||||2|2|7|2|||400|10|0|1600||||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1|nil|1|||||||2|2|6|2|||400|20|0|1400||||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1|nil|1|||||||2|2|6|3|||600|20|0|800||||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1|nil|1|||||||2|2|12|5|||500|35|0|1600||||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1|nil|1|||||||2|2|12|5|||700|20|0|800|||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1|nil|1|||||11|3|2|2|6|6||1|500|50|0|2000||||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1|nil|1|||||||2|2|12|5|||500|40|0|1600||||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1|nil|1|||||||2|2|17|8||1|999|80|0|4000||||1750||||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|48|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||2|100|0.05|2|1|0.5|1|49|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||4|200|0.05|2|1|0.5|1|49|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|48|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||4|440|0.1|3|1|1|1|49|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||8|440|0.1|3|1|2|1|49|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||8|880|0.1|3|1|2|1|49|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||150|160|0.4|0|1|37.5|1|49|10|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||5|440|0.1|1||1.25||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||8|400|0.6|3|1|2||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||10|520|0.5|3|1|2.5||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||38|800|0.25|4|1|9.5||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||45|1200|0.2|5|1|11.25||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||112|400|0.3|9|2|28||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|160|166|1|1|1|4|11|13|||||||2|2|13|7|-3||600||75|20|1|9|2|20||161|5|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY MANOUVERABLE~+ FASTEST AIRCRAFT ON~dUNE.||||
35|mcv|176|192|1|2|1|1|11|12|||||0|5|2|2|7|4|||900||0|600|0.1|0||0||||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|7|7|1||600||90|440|0.3|8|3|22.5||||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|13|8|3||800||60|1600|0.1|7|1|15||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||150|280|0.5|0|20|37.5||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||8|320|0.75|3|1|2||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|13|7|2||750||50|480|0.3|7|2|500||||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11|nil|||||||2|2|nil|3|||0||300|4000|0.35|0|30|75||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19||5|1|1|1|11|nil|||||||1|1|nil|||||||||||||||||draw_action||action_click
81| |1||5|1|1|1|11|nil|||||||1|1|nil|||||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
local ct=bw(co,"|","\n")
co={}
for cu=2,#ct do
cv={}
for cw=1,#ct[cu] do
local cl=ct[cu][cw]
if(cw!=2 and cw<34) cl=tonum(cl)
if cw==34 then
cx,cl=bw(cl,"~"),""
for cu=1,#cx do
cl=cl.."\n"..cx[cu]
end
end
cv[ct[1][cw]]=cl
end
co[tonum(ct[cu][1])]=cv
end
for cu=-2,66 do
bg[cu]={}
for cy=-2,66 do
bg[cu][cy]=0
end
end
cursor={
w=8,
h=8,
cz=function(self)
return{
da=self.da+(not db and dc or 0)+2,
dd=self.dd+(not db and de or 0)+1,
w=1,
h=1
}
end,
df=function(self)
spr((bo and(bo.type==1 and bo.owner==1) or ch) and 1,
self.da,self.dd,self.w/8,self.h/8)
end
}
for cu=1,2 do
for cj=0,31 do
for ci=0,127 do
local dg=nil
local dh=mget(ci,cj)
if cu==1 and dh==1 then
di,dj=ci*8,cj*8
dc,de,dg=di-56,dj-56,co[1]
elseif cu==2
and dh>=48 then
for dk,dl in pairs(co) do
if(dl.obj_spr!=nil and dl.obj_spr==dh) dg=dl break
end
end
if dg!=nil then
local dm,dn=ci,cj
if(dm>63) dn+=31 dm-=64
cn(dg,dm*8,dn*8)
if(dg.type==1 and dg.speed>0) mset(ci,cj,0)
end
end
end
end
music"7"
dp=0
end
function cn(dg,da,dd,owner,dq)
local dr=ds(dg,da,dd,dg.type,nil,k[dg.func_init],k[dg.func_draw],k[dg.func_update],nil)
dr.dt,dr.cs=ds(dg,109,0,3,dr,nil,nil,k[dg.func_onclick]),du and dg.hitpoint/2 or dg.hitpoint
dr.owner=dr.owner or owner or dv(da,dd,di,dj)<75 and 1 or 2
dr.dw,dr.bl=owner or dr.owner,{}
for dl in all(co) do
if(dl.parent_id!=nil and(dl.parent_id==dr.id or dl.dx==dr.id))
and(dl.req_faction==nil
or(dl.req_faction>0 and dl.req_faction==b)
or(dl.req_faction<0 and-b!=dl.req_faction))
then
add(dr.bl,
ds(dl,109,0,4,dr,nil,nil,function(self)
if br then
bo=self
else
cd(self,1)
end
end)
)
dr.bs=dr.bl[1]
end
end
if dr.owner==1 then
dr.dy,dr.col1,dr.col2=b,c,d
else
dr.dy,dr.col1,dr.col2,dr.dt.func_onclick=e,f,g,nil
if(dr.id==19) dz=dr
end
if dg.col1 then
dr.col1,dr.col2=dg.col1,dg.col2
end
if(dr.z>1) dr.owner=0
local ea,eb=flr(da/8),flr(dd/8)
if dg.type==2 then
local ec=(dg.id==2 or dg.id==3)
for ed=0,dg.w-1 do
for ee=0,dg.h-1 do
ef(ea+ed,eb+ee,ec and 16 or dr.owner==1 and 149 or 27)
end
end
if(not ec) add(l,dr)
if dr.id==6 and dr.bk==nil then
local eg,eh=ei(dr,(dr.da+32)/8,(dr.dd+8)/8,ej)
cn(co[30],eg*8,eh*8,nil,dr)
end
end
if dg.type==1 then
if(dr.norotate!=1) dr.ek=flr(rnd"8")*.125
if dr.arms>0 then
dr.el=function(self)
self.em,self.en,self.eo,self.ep,self.eq=4,self.da+4,self.dd+4,self.er.da+self.er.w/2,self.er.dd+self.er.h/2
local es,et=self.ep-self.en,self.eq-self.eo
local eu=sqrt(es*es+et*et)
self.ev,self.ew=(es/eu)*2,(et/eu)*2
sfx(self.arms<50 and 60 or 58,3)
ex(self)
end
if(dr.id==15 or dr.id==16) ef(ea,eb,149)
else
dr.ey=dq
if(dr.id==32) dr.ez=0
end
add(m,dr)
fa(dr)
end
ex(dr)
return dr
end
function ds(fb,da,dd,fc,bk,func_init,func_draw,func_onclick)
local fd={
fe=fb,
id=fb.id,
hitpoint=fb.hitpoint,
da=da,
dd=dd,
z=fb.z,
ff=da/8,
fg=dd/8,
type=fc,
bk=bk,
func_onclick=func_onclick,
w=fb.w*8,
h=fb.h*8,
fh=fb.obj_spr,
fi=fb.w,
fj=fb.h,
cs=0,
fk=0,
cb=0,
fl=0,
fm=0,
fn=0,
fo=1,
by=1,
cz=function(self)
return{
da=self.da,
dd=self.dd,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
df=func_draw or function(self)
if self.type<=2
and(self.da+self.w<dc
or self.da>dc+127
or self.dd+self.h<de
or self.dd>de+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col and self.type<=2) palt(self.trans_col,true)
if(self.dy and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.ek then
if not self.fp or self.fp>.025 then
for cu=1,2 do
if(cu==2 or self.speed>0) fq(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.da,self.dd-(cu==2 and self.z or 0),.25-self.ek,1,self.trans_col,cu==1 and 5 or flr(self.fo)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
rectfill(self.da-1,self.dd-1,self.da+16,self.dd+19,0)
local fr=self.type==4 and self or self.bk
local fs=fr.hitpoint
local ft=self.cb==1 and 12 or fr.cs<fs*.33 and 8 or fr.cs<fs*.66 and 10 or 11
local cl=self.cb==1 and 15*(fr.cs/100) or 15*(fr.cs/fs)
if(fr.cs>0 and not br) rectfill(self.da,self.dd+17,self.da+cl,self.dd+18,ft)
pal(11,fr.icol1) pal(3,fr.icol2)
end
if self.type>2 then
spr(self.ico_spr,self.da,self.dd,self.ico_w,self.ico_h)
else
bz(self)
end
end
if self.en then
if self.fire_type==1 then
pset(self.en,self.eo,rnd"2"<1 and 8 or 9)
else
local fu=self.fire_type==2
fv(self.en,self.eo,0,
0,0,
fu and .15 or 2,
-.01,
fu and 20 or 2.5,
self.id==40 and{11} or fu and bw("7,7,10,9,8,2,13,6,7",",") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.id>=27 and self.cs<self.hitpoint*.33 and rnd"10"<1 and self.type<=2) fv(self.da+3.5,self.dd+3.5,1,.1,-.02,.05,-.002,80,bw("10,9,6,5",","),rnd"2"<1 and 0xa5a5.8 or 0)
self.fn=0
end,
fw=function(self)
local cs=self.cs
self.fo=max(self.fo-.4,1)
if self.fn>0 then
fx(true)
if(fy==0 or stat(24)>5) fy=1 music"0"
if(self.arms>0 and self.em==0) fz(self,self.ga)
if(self.obj_spr==48 and cs<100) self.fi,self.fj=0.5,0.5
if(cs<50 and self.em!=7) gb(self,r[self.dw][14] or self.ey)
end
if(self.type<=2 and cs<=0 and self.fp==nil) self.em=5 self.gc=nil self.fp=(self.type==2 and 1 or .5) sfx(self.type==2 and 53 or 54,3) dp+=((self.type==2 or self.id==38) and 0.25 or 0)
if self.fp then
self.fp-=.025
if self.fp<=0 then
if self.type==2 then
for ed=0,self.fi-1 do
for ee=0,self.fj-1 do
ef(self.da/8+ed,self.dd/8+ee,15)
end
end
del(l,self)
v[self.ga.dw]+=1
else
local gd,ge=self:ck()
if(ge>31) gd+=64 ge-=32
if(cm(gd,ge)<9) ef(gd,ge,20)
if(self.speed==0) ef(gd,ge,15)
del(m,self)
if(self.ga) x[self.ga.dw]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gf(self.da+rnd(self.w),self.dd+rnd(self.h))
end
end
if self.framecount!=nil then
self.fk+=1
if self.fk>self.framecount then
self.fk=0
if self.altframe
and self.em==2 then
self.obj_spr=self.fh+(self.altframe-self.obj_spr)
end
if self.bv then
self.by+=1
if(self.by>#self.bv) self.by=1
end
end
end
if self.en then
self.en+=self.ev
self.eo+=self.ew
if dv(
self.en,self.eo,
self.ep,self.eq)<2
then
gf(self.en,self.eo,self.fire_type)
local er=self.er
if dv(
self.en,self.eo,
er.da+er.w/2,
er.dd+er.h/2)<4
then
er.cs-=self.arms
er.fn,er.ga=self.fire_type,self
if self.id==40 and er.speed!=nil then
er.owner,er.dy,er.col1,er.col2=self.owner,self.dy,self.col1,self.col2
fa(self)
elseif er.gg then
er.dy,er.col1,er.col2,er.gg=er.gg,er.gh,er.gi,nil
fa(er)
end
end
self.en=nil
end
end
if self.cb>0
and not self.cc
and not self.gj then
if self.cb==1 and self.fl>self.cost then
self.gj=true
if(self.owner==1) sfx"56"
if self.fe.type==1
and self.parent_id!=1 then
local eg,eh=gk(self,self.bk)
cn(self.fe,eg,eh,nil,self.bk)
gl(self)
end
elseif self.cb==2 and cs>self.hitpoint then
self.cb=0
if self.type==1 and self.speed>0 then
k.init_repairfact(self.gm)
self.em=0
self.da,self.dd=gk(self,self.ey)
end
else
if self.cq>(self.cb==1 and 3 or 100) then
if(gn(-1,self.cb==1 and self.bk or self)) self.cq=0 self.fl+=1
else
self.cq+=1
self.cs=(self.cb==1 and(self.fl/self.cost)*100 or cs+.5)
end
end
end
if self.fm>0 then
self.fm-=.1
end
end,
go=function(self,da,dd)
self.da,self.dd=da,dd
end,
gp=function(self)
local da,dd=self:ck()
return da..","..dd
end,
ck=function(self)
return flr(self.da/8),flr(self.dd/8)
end
}
for gq,gr in pairs(fb) do
if fd[gq]==nil and gr!=""then
fd[gq]=gr
end
end
if(func_init) func_init(fd)
return fd
end
function gn(gs,fd)
if(gt(j[fd.owner])+gs<0) return false
j[fd.owner]+=sgn(gs)*shr(abs(gs),16)
if(fd.owner==1) sfx"63"
return true
end
function gf(da,dd,gu)
fv(da,dd,2,
0,0,.1,0,gu==1 and 5 or 30,bw("5,7,10,8,9,2",","),rnd"2"<1 and 0xa5a5.8 or 0)
end
function ex(gv)
if(gv.owner!=1 and gv.em!=4) return
local gw=gv.type==2 and 3 or 2
for ed=-gw,gw do
for ee=-gw,gw do
local gx,gy=flr(gv.da/8)+ed,flr(gv.dd/8)+ee
bg[gx][gy]=16
gz(gx,gy)
for et=-1,1 do
for es=-1,1 do
gz(gx+es,gy+et)
end
end
end
end
end
function _update60()
ha()
if(not br) hb()
if u%60==0 then
o={}
if bb then
for cu=0,124,4 do
for cy=0,124,4 do
local ci,cj=cu/2,cy/2
if(cj>=32) ci+=64 cj-=32
local hc=mget(ci,cj)
local ft=sget((hc*8)%128+4,(hc*8)/16)
if(bg[cu/2][cy/2]==16) o[(cu/2/2)..","..(cy/2/2)]=ft!=11 and ft or 15
end
end
end
hd,he,hf,hg=0,0,false,{0,0}
for dk,hh in pairs(l) do
local gx,gy=hh:ck()
if hh.owner==1 or(bb and bg[gx][gy]==16) then
o[flr(hh.da/2/8)..","..flr(hh.dd/2/8)]=hh.col1
end
if hh.owner==1 then
hd-=hh.power
if(hh.id==7) hf=true
if(sub(hh.name,1,5)=="sPICE") he+=1000
end
hg[hh.owner]+=1
r[hh.dw][hh.id]=hh
end
if bb then
for dk,hi in pairs(m) do
if hi.owner==1 or hj(hi) then
o[flr(hi.da/2/8)..","..flr(hi.dd/2/8)]=hi.col1
end
r[hi.dw][hi.id]=hi
end
end
bb,fy=(hf and hd>0),2
fx(false)
if(j[3]>0 and j[1]>j[3]) hk=1
if(hg[2]==0 and a>1) hk=2
if(hg[1]==0) hk=3
if hk then
dset(14,hk)
dset(13,t()-s)
dset(10,hl)
dset(24,gt(j[2]))
dset(11,x[1])
dset(25,x[2])
dset(12,v[1])
dset(26,v[2])
rectfill(30,54,104,70,0)
?"mission "..(hk<3 and"complete"or"failed"),36,60,c
flip()
load("pico-dune-main")
end
elseif u%60==30 then
n={}
for gq,hi in pairs(m) do
n[hi:gp()]=gq
end
end
u+=1
end
function _draw()
hm()
hn()
end
function gz(da,dd)
if(da<0 or da>#bg or dd<0 or dd>#bg) return
local ho=0
if bg[da][dd]!=0 then
if(bg[da][dd-1]>0) ho+=1
if(bg[da-1][dd]>0) ho+=2
if(bg[da+1][dd]>0) ho+=4
if(bg[da][dd+1]>0) ho+=8
bg[da][dd]=1+ho
end
end
function ha()
hp,hq,hr=stat"32",stat"33",stat"34"
hs,ht,hu=(hr==1 and hv!=hr) or btnp"4",(hr>0) or btn"4",(hr==2 and hv!=hr) or btnp"5"
for gq=0,1 do
if(btn(gq)) y+=gq*2-1
if(btn(gq+2)) ba+=gq*2-1
if(btn(4,1)) stop("paused")
end
hw,hx=mid(0,hp+y,127),mid(0,hq+ba,127)
cursor.da,cursor.dd=hw,hx
if not br then
if(hw<4) dc-=2
if(hw>123) dc+=2
if(hx<4) de-=2
if(hx>123) de+=2
dc,de=mid(dc,384),mid(-8,de,384)
for dk,hi in pairs(m) do
if hi then
if hi.gc and costatus(hi.gc)!="dead"then
assert(coresume(hi.gc,hi))
else
hi.gc=nil
end
if hy
and fget(cm(hi:ck()),2)
and dv(hz,ia,hi.da,hi.dd)<1
and hi.z==1
then
del(m,hi)
ib=.01
end
end
end
for gq,ic in pairs(q) do
ic.et+=ic.ie
ic.da+=ic.es
ic.dd+=ic.et
ic.ek+=ic.ig
ic.cs+=1
if(ic.cs>=ic.ih) del(q,ic)
end
end
ii()
hv,ce,bt=hr,bo,bi
end
function ij(da,dd)
local cl=cm(da,dd)
return cl>=2 and cl<=8
end
function fa(hi,ik)
hi.em,hi.il=ik or 0,nil
hi.gc=cocreate(function(self)
while true do
if self.z>1 then
im(self,
mid(flr(self.ff+rnd"32")-16,64),
mid(flr(self.fg+rnd"32")-16,64))
end
if rnd"500"<1 and self.arms>0 and self.em!=8 then
ei(self,flr(self.da/8),flr(self.dd/8),
function(hi,da,dd)
local er=m[n[da..","..dd]]
if(er!=io and er.dw!=hi.dw and bg[da][dd]==16 and er.z==1) fz(hi,er) return true
end,
self.range)
elseif self.id==34 then
ip(self)
end
local ey=self.gm or self.ey
if self.id==32 then
if self.em==0 or self.em==9 then
if self.ez<=1500
and self.em!=7 and self.em!=9 then
self.gm=nil
local iq,ir
local is,it=self:ck()
if ij(is,it) and not self.iu then
iq,ir=is,it
else
ei(self,is,it,
function(hi,da,dd)
if ij(da,dd) and rnd"10"<1 then
iq,ir=da,dd
return true
end
end,
10)
end
if iq and ir then
im(hi,iq,ir)
if(ij(hi:ck())) hi.em=6
end
end
elseif self.ez>=1500
and self.em!=7 then
self.iq,self.ir=self:ck()
gb(self,ey or r[hi.dw][6])
elseif self.em==6 then
self.iu=false
iv(hi.da,hi.dd,hi.ek+.75+rnd".2"-.1)
local iw=hi:gp()
p[iw],self.ez=(p[iw] or 1000)-1,(self.ez or 0)+.5
if p[iw]<=0 then
local ea,eb=self:ck()
for ee=-1,1 do
for ed=-1,1 do
cl=cm(ea+ed,eb+ee)
ef(ea+ed,eb+ee,
(ed==0 and ee==0) and 0 or((cl>1 and cl<8) and 8 or cl)
)
end
end
self.em=0
end
if(self.ez%300==0) self.iu=true self.em=0
end
end
if self.id>26 then
if self.em==9 then
if ey.cs>0 and not ey.ix and self.cs>0 then
ey.bx,self.em,self.ek,self.da,self.dd=false,8,.25,ey.da+16,ey.dd+4
if(bo==self) bo=nil
if self.ez and ey.id==6 then
ey.ix=true
while self.ez>0 do
self.ez-=1
if(flr(self.ez)%4==0 and tonum(hl)<he) gn(2,self)
yield()
end
self.ez,ey.ix,self.em=0,false,0
if(self.iq) im(self,self.iq,self.ir,0,true)
else
self.cb,self.cq,ey.bu,ey.bv=2,0,8,bw("7,10,0,0,7,0,0",",")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function gk(fd,er)
local eg,eh=ei(fd,(er.da+8)/8,(er.dd+16)/8,ej)
return eg*8,eh*8
end
function iv(da,dd,ek)
local iy,iz=sin(ek)*5.5,-cos(ek)*5.5
if(rnd"5"<1) fv(da+iy+3.5,dd+iz+3.5,rnd"2",.15,0,.1,-.01,25,bw("2,4,9,15",","),0xa5a5.8)
end
function fz(hi,er)
if hi.id!=19 then
hi.em,hi.er=3,er
hi.gc=cocreate(function(self)
while er.cs>0 do
local ja=dv(hi.da,hi.dd,er.da,er.dd)
if ja>hi.range*5
and hi.speed>0 then
im(hi,flr(er.da/8),flr(er.dd/8),hi.range*5)
if hi.id==25 or hi.id==38 then
hi.cs=0
for cu=1,hi.id/3 do
gf(hi.da+rnd"32"-16,hi.dd+rnd"32"-16,2)
end
er.cs-=(100+rnd"50")
er.ga=hi
return
end
end
if not hi.norotate then
local jb=atan2(hi.da-er.da,hi.dd-er.dd)
while(hi.ek!=jb) do
jc(hi,jb)
end
end
if ja<=hi.range*5 then
if(hi.fm<=0 and not hi.en) hi.el(hi) hi.fm=hi.fire_rate
elseif hi.speed==0 then
fa(hi)
end
yield()
if(hi.id==40 or hi.id==34 or er.dy==hi.dy) break
end
fa(self)
end)
else
local jd={24,25,38,38}
fz(cn(co[jd[hi.dy]],hi.da,hi.dd,hi.owner),er)
hi.fm=1750
end
end
function ei(hi,da,dd,je,jf)
for dv=1,jf or 64 do
for ed=da-dv,da+dv do
for ee=dd-dv,dd+dv do
if((ed==da-dv or ed==da+dv or ee==dd-dv or ee==dd+dv) and(je(hi,ed,ee))) return ed,ee
end
end
yield()
end
end
function cm(ci,cj)
if(cj>31) ci+=64 cj-=32
return mget(ci,cj)
end
function ef(ci,cj,jg)
if(cj>31) ci+=64 cj-=32
mset(ci,cj,jg)
end
function ej(hi,da,dd)
return not fget(cm(da,dd),0)
and n[da..","..dd]==nil
end
function im(hi,da,dd,jh,ji,ik)
local jj=hi.z>1
if ji then
local jk=r and r[hi.dw][31] or false
if jk and not jk.il then
jk.il,hi.il=hi,jk
jk.gc=cocreate(function(jl)
im(jl,flr(hi.da/8),flr(hi.dd/8))
del(m,hi)
im(jk,da,dd)
hi:go(jk.da,jk.dd)
add(m,hi)
fa(jk)
fa(hi,ik)
end)
return
end
end
::restart_move_unit::
if not jj and not ej(nil,da,dd) then
da,dd=ei(hi,da,dd,ej)
end
hi.is,hi.it,hi.jm,hi.em=da,dd,hi.em,1
hi.jn=nil
local jo,jp,jq={da=flr(hi.da/8),dd=flr(hi.dd/8)},{da=hi.is,dd=hi.it},function(jr) return shl(jr.dd,8)+jr.da end
local js,
jt={
ju=jo,
jv=0,
jw=jx(jo,jp)
},{}
jt[jq(jo)]=js
local jy,jz,ka,kb,count={js},1,jq(jp),32767.99,0
while jz>0 do
local cost,kc=kb
for cu=1,jz do
local kd=jy[cu].jv+jy[cu].jw
if(kd<=cost) kc,cost=cu,kd
end
js=jy[kc]
jy[kc],js.ke=jy[jz],true
jz-=1
local ic=js.ju
if jq(ic)==ka then
ic={jp}
while js.kf do
js=jt[jq(js.kf)]
add(ic,js.ju)
end
hi.jn=ic
goto end_pathfinding
end
for kg in all(kh(ic,jj)) do
local id=jq(kg)
local ki=not jj and fget(cm(kg.da,kg.dd),1) and 4 or 1
if(ic.da!=kg.da and ic.dd!=kg.dd) ki+=.2
local kj,kk=
jt[id],
js.jv+ki
if not kj then
kj={
ju=kg,
jv=kb,
jw=jx(kg,jp)
}
jz+=1
jy[jz],jt[id]=kj,kj
end
if not kj.ke and kj.jv>kk then
kj.jv,kj.kf=kk,ic
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
hi.jm,hi.em=hi.em,2
if hi.jn!=nil then
for cu=#hi.jn-1,1,-1 do
local jr=hi.jn[cu]
if not hi.norotate then
local jb=atan2(
hi.da-(jr.da*8),
hi.dd-(jr.dd*8))
while(hi.ek!=jb) do
jc(hi,jb)
end
end
if(not jj and not ej(nil,jr.da,jr.dd)) goto restart_move_unit
local kl,km=hi.speed or .5,sqrt((jr.da*8-hi.da)^2+(jr.dd*8-hi.dd)^2)
local kn,ko=kl*(jr.da*8-hi.da)/km,kl*(jr.dd*8-hi.dd)/km
for cu=0,km/kl-1 do
n[jr.da..","..jr.dd]=hi
hi.da+=kn
hi.dd+=ko
yield()
end
hi.da,hi.dd,n[jr.da..","..jr.dd]=jr.da*8,jr.dd*8,hi
ex(hi)
if(dv(hi.da,hi.dd,hi.is*8,hi.it*8)<=(jh or 0)) break
end
end
hi.em=0
end
function hm()
cls"15"
camera(dc+(16-rnd"32")*dp,de+(16-rnd"32")*dp)
dp=(dp>0.05) and dp*0.95 or 0
if hy then
for cu=1,#hy do
if(cu%2==1) fillp(0xa5a5.8)
circfill(
hy[cu][1]+4,
hy[cu][2]+4,4,
kp[cu%#kp+1])
fillp()
end
if(ib>0) spr(88+ib,hz,ia)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for dk,hh in pairs(l) do
if not br then
hh:fw()
if(hh.bs) hh.bs:fw()
end
hh:df()
if(hh==bo) rect(bo.da,bo.dd,bo.da+bo.w-1,bo.dd+bo.h-1,7)
end
pal()
for ic=1,2 do
for dk,hi in pairs(m) do
if(ic==1 and hi.z==1) or(ic==2 and hi.z>1) then
if(not br) hi:fw()
if(hi.cb!=2 or hi.speed==0) hi:df()
if(hi==bo) spr(17,bo.da,bo.dd)
end
end
end
for gq,ic in pairs(q) do
if(ic.kq) fillp(ic.kq)
circfill(ic.da,ic.dd,ic.ek,ic.kr[flr((#ic.kr/ic.ih)*ic.cs)+1])
fillp()
end
local ks,kt=flr(dc/8),flr(de/8)
palt(0,false)
palt(11,true)
for ed=ks-1,ks+16 do
for ee=kt-1,kt+16 do
if bg[ed][ee]!=0 and bg[ed][ee]!=16 then
spr(bg[ed][ee]+31,ed*8,ee*8)
elseif bg[ed][ee]<16 then
rectfill(ed*8,ee*8,ed*8+7,ee*8+7,0)
end
end
end
end
function cg(ku)
be,bf=ku,500
end
function hn()
camera(0,0)
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,125,125,c)
rect(91,91,124,124,d)
rectfill(92,92,123,123,0)
if(bf>0) bf-=1 print(be,2,2)
hl=gt(j[1])
if bb!=bd then
bc,kv=bb and 1 or 59,bb and 1 or-1
sfx"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=kv
clip(
max(108-bc,91),
max(108-(bc>20 and bc-20 or 0),91),
min(bc*2,33),
min((bc>20 and bc-20 or 1)*2,33))
for cu=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for ed=0,31 do
for ee=0,31 do
if(o[ed..","..ee]) pset(92+ed,92+ee,o[ed..","..ee])
end
end
local iy,iz=92+dc/16,92+de/16
rect(iy,iz,iy+7,iz+7,7)
if bo and bo.dt then
bo.dt:go(109,20)
bo.dt:df()
kw,kx=nil,nil
if bo.owner==1 then
if bo.bs then
bo.bs:go(109,44)
bo.bs:df()
end
if bo.cs<bo.hitpoint
and bo.id!=4
and(bo.type==2
or bo.speed==0) then
kw=ds(co[80],117,28,5,{},nil,ca,repair_click)
kw:df()
end
if(bo.id==19
and bo.fm<=0)
or bo.id==35
then
kx=ds(co[81],109,29,5,{},nil,ca,cf)
kx:df()
end
end
end
pal()
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.speed==0)
and bo.bs.cs>=100 then
local ky,kz=flr((cursor.da+dc)/8),flr((cursor.dd+de)/8)
local la,lb,w,h=ky*8-dc,kz*8-de,bo.bs.fi,bo.bs.fj
lc,ld,du=false,false,false
for ed=-1,w do
for ee=-1,h do
local cl=cm(ky+ed,kz+ee)
if ed==-1 or ed==w or ee==-1 or ee==h then
if(cl==16 or cl>=58) lc=true
else
if(cl>=9 and cl<=15) du=true
if(n[ky+ed..","..kz+ee] or cl==0 or cl<8 or cl>16) ld=true
end
end
end
if(ld) lc=false
fillp("0b1110110110110111.1")
rectfill(la,lb,
la+bo.bs.w,lb+bo.bs.h,lc and 11 or 8)
fillp()
end
if br then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,d)
rect(4,23,123,94,c)
if bo.bl then
bo.bp={}
rectfill(6,25,27,92,0)
local le=1
for cu=1,#bo.bl do
local lf=bo.bl[cu]
if lf.req_id==nil
or r[bo.dw][lf.req_id]
or lf.req_level<=a
then
bo.bp[le]=lf
if le>=bh and le<=bh+2 then
lf:go(9,28+(le-bh)*19)
lf:df()
else
lf:go(-16,16)
end
if bi==lf then
bn=le
rect(lf.da-2,lf.dd-2,
lf.da+17,lf.dd+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,34,6
end
le+=1
end
end
end
for dk,lg in pairs(bj) do
lg:df()
end
end
palt(11,true)
cursor:df()
end
function bm(da,dd,lh,func_onclick,li)
add(bj,{
da=da,
dd=dd,
w=li or#lh*4+2,
h=8,
lh=lh,
cz=function(self)
return self
end,
df=function(self)
if(#lh>1) rectfill(self.da,self.dd,self.da+self.w,self.dd+self.h,self.lj and 12 or 6)
? self.lh,self.da+2,self.dd+2,(#lh>1) and 0 or(self.lj and 12 or 6)
end,
func_onclick=func_onclick
})
end
function bz(fd)
spr(fd.obj_spr,fd.da,fd.dd,fd.fi,fd.fj)
end
function ii()
lk=false
if bo then
db=true
ll(kw)
ll(kx)
if(bo.dt and not br and not lk) ll(bo.dt)
foreach(bo.bl,ll)
if(br) foreach(bj,ll)
db=false
end
if not br
and not lk then
foreach(m,ll)
foreach(l,ll)
end
if ht
and not br
and hw>89 and hw<122
and hx>90 and hx<123 then
dc,de=mid(0,(hw-94)*16,400),mid(-8,(hx-94)*16,400)
bo=ce
elseif hs then
if(bo) cg(bo.name)
if lk then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=ce return
if(br and bi.lh and bi.func_onclick) bi:func_onclick()
if(bo.owner==1 and bo.type==1 and bo!=ce and bo.speed>0) sfx"62"
if(bo.dw==2 and ce and(ce.type==1 or(ce.id==19 and ch)) and ce.owner==1) bo.fo=10 fz(ce,bo) bo=nil r={{},{}}
else
if bo
and bo.type==1
and bo.owner==1
and bo.speed>0
and bo.em!=7 then
bo.gc=cocreate(function(hi)
im(hi,flr((dc+hw)/8),flr((de+hx)/8))
fa(hi)
end)
end
if bo
and bo.bs
and bo.bs.cs>=100
and lc then
local dg=bo.bs.fe
cn(dg,
flr((cursor.da+dc)/8)*8,
flr((cursor.dd+de)/8)*8,1)
gl(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
ch=false
elseif hu and not br then
bo,ch=nil,false
end
end
function gl(fd)
fd.cs,fd.cb,fd.fl,fd.gj=0,0,0,false
end
function ll(fd)
if(fd==nil) return
local lm,ln=cursor:cz(),fd:cz()
fd.lj=lm.da<ln.da+ln.w and
lm.da+lm.w>ln.da and
lm.dd<ln.dd+ln.h and
lm.dd+lm.h>ln.dd
if hs and fd.lj then
if br then
bi=fd
else
if(fd.type<=2 and bg[flr((cursor.da+dc)/8)][flr((cursor.dd+de)/8)]!=16 or fd.em==8) return
if bo
and(fd.id==6 and bo.id==32
or fd.id==14 and bo.id>26)
and fd.owner==1
then
gb(bo,fd)
return
else
bo=fd
end
end
lk=true
end
end
function gb(hi,lo)
lo=lo or r[hi.dw][1]
hi.em,lo.bx,hi.gm=7,true,lo
if(hi.id!=32 or lo.id==6) hi.ey=lo
hi.gc=cocreate(function(hi)
im(hi,(lo.da+16)/8,lo.dd/8,0,true,9)
if(hi.il==nil) fa(hi,9)
end)
end
lp=0
function hb()
if t()>i and t()%i*2==0 then
local lq=rnd(m)
if lq.owner==2 and lq.arms>0 and lq.em==0 then
ip(lq)
end
local lr=rnd(l)
if lr.owner==2 then
if lr.bs and lr.bs.fe.type==1 and lr.bs.cb!=1 then
local lt=rnd(lr.bl)
lr.bs=lt
lt:func_onclick()
end
if lr.cs<lr.hitpoint and lr.cb!=2 then
cd(lr,2)
end
end
if lu and lu.type==2
and dz and dz.fm<=0 then
fz(dz,lu)
end
end
lp-=1
if lp<0 then
if hy then
hy=nil
else
hy,lv,lw,kp,ib={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lx=rnd"5000"
lp=lx
end
if hy then
if(u%6<1 or#hy<30) and ib==0 then
while#hy<31 do
if(rnd"9"<.5) lw=rnd".04"-.02
hz,ia=hy[#hy][1],hy[#hy][2]
add(hy,{hz+sin(lv),ia-cos(lv)})
lv+=lw
end
end
if(#hy>30) del(hy,hy[1])
if(ib>0) ib+=.01 iv(hz,ia,rnd"1")
if(ib>2) ib=0
end
end
function ip(fd)
local lu=ly(fd)
if(lu and hj(lu)) fz(fd,lu)
end
function ly(fd)
local lz
repeat
lz=(rnd"4"<1) and rnd(m) or rnd(l)
until lz.dw!=fd.dw
return lz
end
function hj(fd)
local da,dd=fd:ck()
return bg[da][dd]==16
end
function fx(ma)
local cl=peek(0x3115)
if((band(cl,128)>0)!=ma) cl=bxor(cl,128)
poke(0x3115,cl)
end
function gt(cl)
local mb,gr="",abs(cl)
repeat
mb=(gr%0x0.000a/0x.0001)..mb
gr/=10
until gr==0
if(cl<0) mb="-"..mb
return mb
end
function bw(mc,eu,md)
if(md~=nil) mc=split(mc,md)
if type(mc)=="table"then
local t={}
while#mc>0 do
local mb=mc[1]
add(t,split(mb,eu))
del(mc,mb)
end
return t
else
return split(mc,eu)
end
end
function fq(iq,ir,da,dd,jb,w,me,mf)
local mg,mh=cos(jb),sin(jb)
local mi,mj,ho=mg,mh,shl(0xfff8,(w-1))
w*=4
mg*=w-0.5
mh*=w-0.5
local mk,ml,w=mh-mg+w,-mg-mh+w,2*w-1
for mm=0,w do
local mn,mo=mk,ml
for mp=0,w do
if band(bor(mn,mo),ho)==0 then
local mq=sget(iq+mn,ir+mo)
if(mq!=me) pset(da+mm,dd+mp,mf or mq)
end
mn-=mj
mo+=mi
end
mk+=mi
ml+=mj
end
end
function dv(mr,ms,mt,mu)
return abs(sqrt(((mr-mt)/1000)^2+((ms-mu)/1000)^2)*1000)
end
function jc(hi,mv)
local gs=mv-hi.ek
if(hi.z>1) hi.ek=mv
if gs>0.5 then
gs-=1
elseif gs<-0.5 then
gs+=1
end
if gs>0.0087 then
hi.ek+=0.0087
elseif gs<-0.0087 then
hi.ek-=0.0087
else
hi.ek=mv
end
yield()
end
function kh(jr,jj)
local mw={}
for ed=-1,1 do
for ee=-1,1 do
if(ed!=0 or ee!=0) mx(jr.da+ed,jr.dd+ee,mw,jj)
end
end
return mw
end
function mx(my,mz,na,jj)
if(jj or not fget(cm(my,mz),0) and n[my..","..mz]==nil and my>=0 and mz>=0 and my<=63 and mz<=63) add(na,{da=my,dd=mz})
end
function jx(jb,nb)
return abs(jb.da-nb.da)+abs(jb.dd-nb.dd)
end
function fv(da,dd,ek,es,et,ig,ie,cs,kr,kq)
local ic={
da=da,dd=dd,ek=ek,es=es,et=et,ig=ig,
cs=0,ie=ie,
kr=kr,kq=kq,
nc=dd,ih=cs
}
add(q,ic,1)
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
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfffb1ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df4aa14ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cb0cecec0bb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbec6c6cebb6d7d6bbd4c455444445549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debee6e6eebb6d4d6bb4a042499999452424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebec0c0cebb69996bb49029999c0994922229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0b00ccc00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a94942d1542425d44411114555224225ff2225
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
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd5dd0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d51d0001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
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
bbbbbbbbbbbbbbbbffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
bb676bbbbb676bbbffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
bbb7bbbbbbb7bbbbffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
bb676bbbb6e6e6bbffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
7e777e7bbb676bbbff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
bbb7bbbbbbb7bbbbff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
bbbcbbbbbbbcbbbbff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
bbbbbbbbbbbbbbbbf7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
bb0220bb00000000f7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
bb5865bb00000000f76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
bb0860bb00000000fddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
bb5875bb00000000ffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
bbb87bbb00000000fffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
bb0880bb00000000fffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
bb5dd5bb00000000fffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
bb0880bb00000000ffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
cccccccccbb3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccbbc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
cccccccbbcc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccbbccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccddddddddddddddddccccccccccccccccddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc76753355335cccccc055ffccccccccccccc4ff75550ccdddddddd7773330dcccc2888887660ccdd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc76667555dd555ccccc0f7557ccccccccccc4ffff7fccccddddd4bbbb75550dccc288888887ccccddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755dddd55ccccc0f7fff7ccccccc54454444444f7cdd45444444444dddcc5225222222287cdd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cd54bbbbbbbbbbb5dc55588888888855cd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
9166660001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950360000000635995000005999300095061052995061059
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999ff99fffffff9999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
fffffffffff7ffff445d44999fcfcccccccccccccccccccccdcccdcccd1cccccccccccccccccc60ccc06cccccccccccccccccccccccccccccccccccccccccccc
ffffffffffcccfff44d499999949fcccccccccccccccc6ccccdcccdccc1ccccccccc77cccccc515cc8115cccccc8787ccccccccccccccccc6ccccccccccccccc
fffff6fffdddddff44dd66666699fcccccccc6cccccc6f6cd77ddddddd1dddddcc77577cccc51cccc00015cccc755567cccccccccccccccc76cccccccccccccc
fffff7fccccccccc445d5555555ddcddcccc6f6cccccfffcc66dcccdc1c1cccccc5775d60051ccccc808d15006d85866cccccccccccccccc765cc77775cccccc
fffcdcd5dd6d6d6d44dd96969696ddddccccfffcccccc5ccccccdccf1fff167cccc5566dd106ccccc000d601dd6555ddccc5b7cccccccccc7756777780777ccc
ffcccccc5ddddddf444666666666ddd5ccccc5cccccccfccddddddf1fffff1ddccc7666666666cccc8086666666858dd9cc65c6b6ccccccc765d656520dd777c
fffd6d65dccccccf4446f66666f6d5ddf6cccf9999999fcc55555dd505050fddccc0000000000ccccccc00000000001149cbbcb20ccccccc775cdd5d1ccc775d
ffcccccc5c5c5c5c4446664446666dddfff6cf9ccccc9fccdddd5ddd505050ddccdd66d2d2d2d5ccccc5d2d2d2d66ddc44935c0b6cd0ccccccc5ccc505ccd667
ffdddddd5ddddddd4445649994666dddf9999fcccf6ccfccddd65dddddddddddccdd66ddddddd5ccccc5ddddddd66ddc4443bb005c01cccccc5ccccdcdccdddc
99955555ddddddd94545699999666d5d49119fccf6f6cfffdd22205d5ddd5dddccddd66dd555d5ccccc5d555dd66dddc22450b605d0ffff9c5ccccccccccc5cc
666dddd5555555554456699999666ddd4900944c5f659999d82d000d5ddd5ddd9ccdd665555555c999c555555566ddcc42444665501ff9ff99dd999999999599
666666666666666645466994996666dd7777777777666336d8d2505d7fdd5ddd999dd6666666d5999995d6666666dd9944446b600244ff999455d44444444549
996666666669699944467777777666dd777666666353655dd8dffffd5ffd5ddd999dd6666666d5999995d6666666dd99244355b332494fff9444444449999999
9999996999999999444fffffffff942f666666666353d33dfffffffff5f6667d999dd6677766d5999995d6677766dd9924335203504449f9999999999999f999
44449999449444944444ffffffff560f6666ddddddddddddfff4f4f4f56ddddd99ddd66dd566d5999995d665dd66ddd9446b2446b09999ff9999999999993999
44444444444444444444ffffffffffffddddddddddddddddffffffffffffffff99dd666dd5666d59995d6665dd666dd9443324430044499f9999999999999999

__gff__
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1616000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1600000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212120000000016161616006c0a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0000165785850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a3a10100c830a856e0a600a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a1010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d470a0a0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120000160047010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200160057850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000121200330057854785576a0a5785571d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000005747475700360000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
00121200121200b0000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
000012000000000a0a0a00000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
12120000000000090a0a00000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000000090a0a00000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012123400000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000009090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200a00000000000000a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a090a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

