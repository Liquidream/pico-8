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
bf,bg="",0
l.factory_click=function(self)
bh,bi,bj=1,self.bk.bl[1],{}
bm(6,84,"⬆️",function(self)
bn=mid(1,bn-1,#bo.bp)
bi=bo.bp[bn]
if(bn<bh) bh-=1
end,10)
bm(17,84,"⬇️",function(self)
local bq=#bo.bp
bn=mid(1,bn+1,bq)
bi=bo.bp[bn]
bh=mid(bh+1,bq-2)
if(bn>bh+2) bh=min(bh+1,bq-2)
end,10)
bm(32,83,"build",function(self)
br=nil
bo.bs=bt
bt:func_onclick()
end)
bm(96,83,"close",function(self)
br=nil
end)
br=self
end
l.init_windtrap=function(self)
self.bu=11
self.bv={12,12,12,12,13,1,1,1,1,13}
end
l.init_refinery=function(self)
self.bv={11,10,8}
end
l.draw_refinery=function(self)
pal(11,self.bw)
pal(10,self.bw)
pal(8,self.bw)
if self.bx then
pal(self.bv[self.by],self.bz)
else
pal(11,self.bz)
self.by=1
end
spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
l.draw_repair=function(self)
if(flr(t())%2==0) pal(7,bo.cc==2 and 11 or 8)
spr(self.obj_spr,self.ca,self.cb)
pal()
end
l.repair_click=function(self)
cd(ce,2)
end
l.init_repairfact=function(self)
self.bu=8
self.bv={0}
end
function cd(self,cf)
self.cg=0
self.ch=self.cc
if(self.ci>0 and self.ch>0) self.cj=not self.cj
self.cc=cf
end
ck=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|parent2_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170||2|2|2|nil|nil||nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162||2|2|2|nil|1||1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160||2|1|1|nil|1||1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164||2|1|1|nil|1||7|4||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172||2|2|2|nil|1||1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174||2|3|2|nil|1||2|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136||2|2|2|nil|1||2|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134||2|2|2|nil|1||6|2||150|5|0|600|||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168||2|2|2|nil|1||7|2||300|10|0|1200|||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138||2|2|2|nil|1||7|2||400|10|0|1600|||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1||6|2||400|20|0|1400|||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1||6|3||600|20|0|800|||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1||12|5||500|35|0|1600|||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230||2|3|2|nil|1||12|5|99|700|20|0|800||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|77|232||1|1|1|11|1||7|5||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|93|234||1|1|1|11|1||7|6||250|20|112|1200|0|9|2||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|58|228||2|3|3|nil|1||6|6||500|50|0|2000|||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224||2|2|2|nil|1||12|5||500|40|0|1600|||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|55|226||2|3|3|nil|1||17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||factory_click
20|lIGHT iNFANTRY (X3)|62|236||1|1|1|11|9||9|2|-3|60||4|200|0.05|2|1|1|63|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|62|194||1|1|1|11|10||9|3|-1|100||8|440|0.1|3|1|1|63|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11|17||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
23|qUAD|48|206||1|1|1|11|11|17||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|17|7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|17|7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|17|7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12|17||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
28|cARRYALL|61|238||1|1|1|11|13||13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13||13|7|-3|600||75|20|1.5|5|2||||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY MANOUVERABLE~+ FASTEST AIRCRAFT ON~dUNE.||||
30|mcv||||1|2|1|11|12||7|4|99|900||0|600|0.1|0|||||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12||7|7|1|600||90|440|0.3|8|11||||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19|||8|1|0||8|880|0.1|3|1||||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12||13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||13|8|3|0||150|280|2.5|nil|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
35|rAIDER|54|204||1|1|1|11|11|||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
36|dEVIATOR||||1|1|1|11|12||13|7|2|750||0|480|0.3|7|11||||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19|||8|2|0||150|160|0.4|2|||||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
38|sARDAUKAR||||1|1|1|11|nil||nil|4||0||5|440|0.1|1|||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
39|sANDWORM|94|||9|1|1|11|nil||nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|11|nil||nil|||||||||||||||draw_repair||repair_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cl()
cm=cn(ck[80],109,-20,5,{},nil,l.draw_repair,l.repair_click)
co()
cursor={
w=8,
h=8,
cp=function(self)
return{
ca=self.ca+(not cq and cr or 0)+2,
cb=self.cb+(not cq and cs or 0)+1,
w=1,
h=1
}
end,
ct=function(self)
spr((bo and(bo.type==1 and bo.cu==1)) and 1 or self.obj_spr,
self.ca,self.cb,self.w/8,self.h/8)
end
}
cv()
music"7"
cw=0
end
function cv()
for cx=1,2 do
for cy=0,31 do
for cz=0,127 do
local da=nil
local db=mget(cz,cy)
local dc=fget(db)
if cx==1 and db==1 then
dd,de=cz*8,cy*8
cr,cs=dd-56,de-56
da=ck[1]
elseif cx==2
and db>=48 then
for df in all(
ck) do
if(df.obj_spr!=nil and df.obj_spr==db) da=df break
end
end
if da!=nil then
local dg,dh=cz,cy
if(dg>63) dh+=31 dg-=64
di(da,dg*8,dh*8)
if(da.type==1 and da.speed>0) mset(cz,cy,0)
end
end
end
end
end
function di(da,ca,cb,cu,dj)
local dk=cn(da,ca,cb,da.type,nil,l[da.func_init],l[da.func_draw],l[da.func_update],nil)
dk.dl=cn(da,109,0,3,dk,nil,nil,l[da.func_onclick])
dk.ci=dm and da.hitpoint/2 or da.hitpoint
dk.bl={}
for df in all(ck) do
local dn=df.req_faction
if(df.parent_id!=nil and(df.parent_id==dk.id or df.dp==dk.id))
and(dn==nil
or(dn>0 and df.req_faction==c)
or(dn<0 and-c!=dn))
then
add(dk.bl,
cn(df,109,0,4,dk,nil,nil,function(self)
if br then
bo=self
else
cd(self,1)
end
end)
)
dk.bs=dk.bl[1]
end
end
dk.cu=cu or(dq(ca,cb,dd,de)<75 and 1 or 2)
if dk.cu==1 then
dk.dr=c
dk.bz=d
dk.bw=e
q[dk.id]=true
else
dk.dr=g
dk.bz=i
dk.bw=j
dk.dl.func_onclick=nil
end
local ds=flr(ca/8)
local dt=flr(cb/8)
if da.type==2 then
dk.du=53
local dv=(da.id==2 or da.id==3)
for dw=0,da.w-1 do
for dx=0,da.h-1 do
dy(ds+dw,dt+dx,dv and 16 or 149)
end
end
if(not dv) add(m,dk)
if dk.id==6 and dk.bk==nil then
p[dk.cu]=dk
local dz,ea=eb(dk,(dk.ca+32)/8,(dk.cb+8)/8,ec)
di(ck[27],dz*8,ea*8,nil,dk)
end
end
if da.type==1 then
dk.du=54
if(dk.norotate!=1) dk.ed=flr(rnd"8")*.125
if dk.arms>0 then
dk.ee=function(self)
self.ef=4
self.eg=self.ca+4
self.eh=self.cb+4
self.ei=self.ej.ca+self.ej.w/2
self.ek=self.ej.cb+self.ej.h/2
local el=self.ei-self.eg
local em=self.ek-self.eh
local en=sqrt(el*el+em*em)
self.eo=(el/en)*2
self.ep=(em/en)*2
sfx(self.arms<100 and 60 or 58,3)
eq(self)
end
if dk.id==15 or dk.id==16 then
dy(ds,dt,149)
end
else
if(dk.id==27) dk.er=0 dk.es=p[dk.cu]
end
add(n,dk)
et(dk)
end
eq(dk)
return dk
end
function cn(eu,ca,cb,ev,bk,func_init,func_draw,func_onclick)
local ew=(eu.w or 1)*8
local ex=(eu.h or 1)*8
local ey={
ez=eu,
id=eu.id,
hitpoint=eu.hitpoint,
ca=ca,
cb=cb,
fa=1,
type=ev,
bk=bk,
func_onclick=func_onclick,
w=ew,
h=ex,
fb=eu.obj_spr,
fc=eu.w or 1,
fd=eu.h or 1,
ci=0,
fe=0,
cc=0,
ff=0,
fg=0,
fh=0,
fi=1,
by=1,
cp=function(self)
return{
ca=self.ca,
cb=self.cb,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
ct=func_draw or function(self)
if self.type<=2
and(self.ca+self.w<cr
or self.ca>cr+127
or self.cb+self.h<cs
or self.cb>cs+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dr and self.id!=18) pal(12,self.bz) pal(14,self.bw)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.ed then
if not self.fj or self.fj>.025 then
if(self.speed>0) fk(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb+1,.25-self.ed,1,self.trans_col,5)
fk(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb,.25-self.ed,1,self.trans_col,flr(self.fi)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.ca-1,self.cb-1,self.ca+16,self.cb+19,0)
local fl=self.type==4 and self or self.bk
local fm=fl.hitpoint
local fn=self.cc==1 and 12 or(fl.ci<fm*.33 and 8 or fl.ci<fm*.66 and 10 or 11)
local fo=self.cc==1 and(15*(fl.ci/100)) or(15*(fl.ci/fm))
if(fl.ci>0 and not br) rectfill(self.ca,self.cb+17,self.ca+fo,self.cb+18,fn)
end
if self.type>2 then
spr(self.ico_spr,self.ca,self.cb,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
end
if self.eg then
if(self.fire_type==1) then
circfill(self.eg,self.eh,0,rnd"2"<1 and 8 or 9)
else
fp(self.eg,self.eh,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.ci<self.hitpoint*.33 and rnd"10"<1) fp(self.ca+3.5,self.cb+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fh=0
end,
fq=function(self)
self.fi=max(self.fi-.4,1)
if self.fh>0 then
fr(5,true)
if(fs==0 or stat(24)>5) fs=1 music"0"
if(self.arms>0 and self.ef==0) ft(self,self.fu)
end
if(self.type<=2 and self.ci<=0 and self.fj==nil) self.ef=5 self.fv=nil self.fj=(self.type==2 and 1 or .5) sfx(self.du,3) cw+=(self.type==2 and 0.25 or 0)
if self.fj then
self.fj-=.025
if self.fj<=0 then
if self.type==2 then
for dw=0,self.fc-1 do
for dx=0,self.fd-1 do
dy(self.ca/8+dw,self.cb/8+dx,15)
end
end
del(m,self)
y[self.fu.cu]+=1
else
local fw,fx=flr(self.ca/8),flr(self.cb/8)
if(fx>31) fw+=64 fx-=32
if(fy(fw,fx)<9) dy(fw,fx,20)
if(self.speed==0) dy(fw,fx,15)
del(n,self)
z[self.fu.cu]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fz(self.ca+rnd(self.w),self.cb+rnd(self.h))
end
end
if self.framecount!=nil then
self.fe+=1
if(self.fe>self.framecount) then
self.fe=0
if self.altframe
and self.ef==2 then
self.obj_spr=self.fb+(self.altframe-self.obj_spr)
end
if self.bv then
self.by+=1
if(self.by>#self.bv) self.by=1
end
end
end
if self.eg then
self.eg+=self.eo
self.eh+=self.ep
if dq(
self.eg,self.eh,
self.ei,self.ek)<2
then
fz(self.eg,self.eh,self.fire_type)
local ej=self.ej
if dq(
self.eg,self.eh,
ej.ca+ej.w/2,
ej.cb+ej.h/2)<4
then
ej.ci-=self.arms
ej.fh=self.fire_type
ej.fu=self
end
self.eg=nil
end
end
if self.cc>0
and not self.cj
and not self.ga then
if self.cc==1 and self.ff>self.cost then
self.ga=true
sfx"56"
if self.ez.type==1
and self.id!=15
and self.id!=16 then
local dz,ea=gb(self,self.bk)
di(self.ez,dz,ea,nil,self.bk)
gc(self)
end
elseif self.cc==2 and self.ci>self.hitpoint then
self.cc=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.es)
self.ef=0
local dz,ea=gb(self,self.es)
self.ca,self.cb=dz,ea
end
else
self.cg+=1
self.ci=(self.cc==1 and(self.ff/self.cost)*100 or self.ci+.5)
if(self.cg>(self.cc==1 and 3 or 100) and gd(-1,self.cc==1 and self.bk or self)) self.cg=0 self.ff+=1
end
end
end,
ge=function(self,ca,cb)
self.ca=ca
self.cb=cb
end,
gf=function(self)
return flr(self.ca/8)..","..flr(self.cb/8)
end
}
for gg,gh in pairs(eu) do
if ey[gg]==nil and gh!=""then
ey[gg]=gh
end
end
if(func_init) func_init(ey)
return ey
end
function gd(gi,ey)
if(gj(f[ey.cu])+gi<0) return false
f[ey.cu]+=sgn(gi)*shr(abs(gi),16)
if(ey.cu==1) sfx"63"
return true
end
function fz(ca,cb,gk)
fp(ca,cb,2,
0,0,.1,0,gk==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function eq(gl)
if(gl.cu!=1 and gl.ef!=4) return
local gm=gl.type==2 and 3 or 2
for dw=-gm,gm do
for dx=-gm,gm do
local gn=flr(gl.ca/8)+dw
local go=flr(gl.cb/8)+dx
gp[gn][go]=16
gq(gn,go)
for em=-1,1 do
for el=-1,1 do
gq(gn+el,go+em)
end
end
end
end
end
function _update60()
gr()
gs()
if(t()%1==0) gt()
if(t()%1==0 and t()%2==0) gu()
x+=1
end
function _draw()
gv()
gw()
end
function co()
gp={}
for cx=-2,66 do
gp[cx]={}
for gx=-2,66 do
gp[cx][gx]=0
end
end
end
function gy()
local gz=flr(cr/8)
local ha=flr(cs/8)
palt(11,true)
for dw=gz-1,gz+16 do
for dx=ha-1,ha+16 do
if gp[dw][dx]!=0 and gp[dw][dx]!=16 then
spr(gp[dw][dx]+31,dw*8,dx*8)
elseif gp[dw][dx]<16 then
rectfill(dw*8,dx*8,dw*8+7,dx*8+7,0)
end
end
end
end
function gq(ca,cb)
if(ca<0 or ca>#gp or cb<0 or cb>#gp) return
local hb=0
if gp[ca][cb]!=0 then
if(gp[ca][cb-1]>0) hb+=1
if(gp[ca-1][cb]>0) hb+=2
if(gp[ca+1][cb]>0) hb+=4
if(gp[ca][cb+1]>0) hb+=8
gp[ca][cb]=1+hb
end
end
function gu()
r={}
if bc then
for cx=0,124,4 do
for gx=0,124,4 do
local cz=cx/2
local cy=gx/2
if(cy>=32) cz+=64 cy-=32
local hc=mget(cz,cy)
local hd=(hc*8)%128
local he=(hc*8)/16
local fn=sget(hd+4,he)
if(gp[cx/2][gx/2]==16) r[((cx/2)/2)..","..((gx/2)/2)]=fn!=11 and fn or 15
end
end
end
hf=0
hg=0
hh=false
hi={0,0}
for hj,hk in pairs(m) do
local gn=flr(hk.ca/8)
local go=flr(hk.cb/8)
if hk.cu==1 or(bc and gp[gn][go]==16) then
r[flr(hk.ca/2/8)..","..flr(hk.cb/2/8)]=hk.bz
end
if(hk.cu==1) then
hf-=hk.ez.power
if(hk.id==7) hh=true
if(sub(hk.name,1,5)=="sPICE") hg+=1000
end
hi[hk.cu]+=1
end
if bc then
for hj,hl in pairs(n) do
if hl.cu==1 or gp[flr(hl.ca/8)][flr(hl.cb/8)]==16 then
r[flr(hl.ca/2/8)..","..flr(hl.cb/2/8)]=hl.bz
end
end
if(hm and gp[mid(0,flr(hn/8),31)][mid(0,flr(ho/8),31)]==16) r[flr(hn/2/8)..","..flr(ho/2/8)]=7
end
bc=(hh and hf>0)
fr(5,false)
fs=2
if(f[3]>0 and f[1]>f[3]) hp=1
if(hi[2]==0 and b>1) hp=2
if(hi[1]==0) hp=3
if hp then
dset(14,hp)
dset(13,t()-v)
dset(10,hq)
dset(24,gj(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
hr("mission "..(hp<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gt()
o={}
for gg,hl in pairs(n) do
o[flr(hl.ca/8)..","..flr(hl.cb/8)]=gg
end
end
function gr()
hs,ht,hu=stat"32",stat"33",stat"34"
hv=(hu==1 and hw!=hu) or btnp"4"
hx=(hu>0) or btn"4"
hy=(hu==2 and hw!=hu) or btnp"5"
for gg=0,1 do
if(btn(gg)) ba+=gg*2-1
if(btn(gg+2)) bb+=gg*2-1
end
hz=mid(0,hs+ba,127)
ia=mid(0,ht+bb,127)
cursor.ca=hz
cursor.cb=ia
if not br then
if(hz<4) cr-=2
if(hz>123) cr+=2
if(ia<4) cs-=2
if(ia>123) cs+=2
cr=mid(cr,384)
cs=mid(cs,384)
for hj,hl in pairs(n) do
if hl then
if hl.fv and costatus(hl.fv)!='dead'then
assert(coresume(hl.fv,hl))
else
hl.fv=nil
end
if hm
and fget(fy(flr(hl.ca/8),flr(hl.cb/8)),2)
and dq(hn,ho,hl.ca,hl.cb)<1
then
del(n,hl)
ib=.01
end
end
end
ic()
end
ie()
hw,ce,bt=hu,bo,bi
end
function ig(ca,cb)
local fo=fy(ca,cb)
return fo>=2 and fo<=8
end
function et(hl,ih)
hl.ef=ih or 0
hl.fv=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0 and self.ef!=8) eb(self,flr(self.ca/8),flr(self.cb/8),ii,self.range)
local es=self.es
if self.id==27 then
if self.ef==0 or self.ef==7 or self.ef==9 then
if self.er<=1500
and self.ef!=7 and self.ef!=9 then
local hd,he
local ij,ik=flr(self.ca/8),flr(self.cb/8)
if ig(ij,ik) and not self.il then
hd,he=ij,ik
else
eb(self,ij,ik,
function(hl,ca,cb)
if ig(ca,cb) and rnd"10"<1 then
hd,he=ca,cb
return true
end
end,
10)
end
if hd and he then
im(hl,hd,he)
if(ig(flr(hl.ca/8),flr(hl.cb/8))) hl.ef=6
end
end
elseif self.er>=1500
and self.ef!=7 then
self.ef=7
es.bx=true
im(self,(es.ca+16)/8,es.cb/8)
self.ef=9
elseif self.ef==6 then
self.il=false
local ed=hl.ed+.75
io(hl.ca,hl.cb,hl.ed+.75+rnd".2"-.1)
local ip=hl:gf()
s[ip]=(s[ip] or 10000)-1
self.er=(self.er or 0)+.5
if s[ip]<=0 then
local ds=flr(self.ca/8)
local dt=flr(self.cb/8)
for dx=-1,1 do
for dw=-1,1 do
fo=fy(ds+dw,dt+dx)
dy(ds+dw,dt+dx,
(dw==0 and dx==0) and 0 or((fo>1 and fo<8) and 8 or fo)
)
end
end
self.ef=0
end
if(self.er%300==0) self.il=true self.ef=0
end
end
if self.id>21 then
if self.ef==9 then
if not es.iq then
es.bx=false
self.ef=8
self.ed=.25
self.ca=es.ca+16
self.cb=es.cb+4
if(bo==self) bo=nil
if self.er then
es.iq=true
while self.er>0 do
self.er-=1
if(flr(self.er)%4==0 and tonum(hq)<hg) gd(2,self)
yield()
end
self.er=0
es.iq=false
self.ef=0
else
self.cc=2
self.cg=0
es.bu=8
es.bv={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function gb(ey,ej)
local dz,ea=eb(ey,(ej.ca+8)/8,(ej.cb+16)/8,ec)
return dz*8,ea*8
end
function io(ca,cb,ed)
local ir,is=sin(ed)*5.5,-cos(ed)*5.5
if(rnd"5"<1) fp(ca+ir+3.5,cb+is+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function ft(hl,ej)
hl.ef=3
hl.ej=ej
hl.fv=cocreate(function(self)
while ej.ci>0 do
local it=dq(hl.ca,hl.cb,ej.ca,ej.cb)
if it>hl.range*5
and hl.speed>0 then
im(hl,flr(ej.ca/8),flr(ej.cb/8),hl.range*5)
end
if not hl.norotate then
local iu=atan2(hl.ca-ej.ca,hl.cb-ej.cb)
while(hl.ed!=iu) do
iv(hl,iu)
end
end
if(it<=hl.range*5) then
hl.fg-=1
if(hl.fg<=0 and not hl.eg) hl.ee(hl) hl.fg=hl.arms*4
elseif hl.speed==0 then
et(hl)
end
yield()
end
et(self)
end)
end
function eb(hl,ca,cb,iw,ix)
for dq=1,ix or 64 do
for dw=ca-dq,ca+dq do
for dx=cb-dq,cb+dq do
if((dw==ca-dq or dw==ca+dq or dx==cb-dq or dx==cb+dq) and(iw(hl,dw,dx))) return dw,dx
end
end
yield()
end
end
function fy(cz,cy)
if(cy>31) cz+=64 cy-=32
return mget(cz,cy)
end
function dy(cz,cy,iy)
if(cy>31) cz+=64 cy-=32
mset(cz,cy,iy)
end
function ec(hl,ca,cb)
return not fget(fy(ca,cb),0)
and o[ca..","..cb]==nil
end
function ii(hl,ca,cb)
local ej=n[o[ca..","..cb]]
if(ej!=iz and ej.cu!=hl.cu and gp[ca][cb]==16) ft(hl,ej) return true
end
function im(hl,ca,cb,ja)
::restart_move_unit::
hl.jb="init"
if not ec(nil,ca,cb) then
ca,cb=eb(hl,ca,cb,ec)
end
hl.ij=ca
hl.ik=cb
hl.jc=hl.ef
hl.ef=1
hl.jb=jd(
{ca=flr(hl.ca/8),cb=flr(hl.cb/8)},
{ca=hl.ij,cb=hl.ik},
je,
jf,
jg,
function(jh) return shl(jh.cb,8)+jh.ca end,
nil)
hl.jc=hl.ef
hl.ef=2
hl.ef=2
if hl.jb!=nil then
for cx=#hl.jb-1,1,-1 do
local jh=hl.jb[cx]
if not hl.norotate then
local iu=atan2(
hl.ca-(jh.ca*8),
hl.cb-(jh.cb*8))
while(hl.ed!=iu) do
iv(hl,iu)
end
end
if(not ec(nil,jh.ca,jh.cb)) goto restart_move_unit
local ji=hl.speed or .5
local jj=sqrt((jh.ca*8-hl.ca)^2+(jh.cb*8-hl.cb)^2)
local jk=ji*(jh.ca*8-hl.ca)/jj
local jl=ji*(jh.cb*8-hl.cb)/jj
for cx=0,jj/ji-1 do
o[jh.ca..","..jh.cb]=hl
hl.ca+=jk
hl.cb+=jl
yield()
end
hl.ca,hl.cb=jh.ca*8,jh.cb*8
o[jh.ca..","..jh.cb]=hl
eq(hl)
if(dq(hl.ca,hl.cb,hl.ij*8,hl.ik*8)<=(ja or 0)) break
end
end
hl.ef=0
end
jm=0
function gs()
if(t()>k and t()%k*2==0) then
local jn=n[flr(rnd(#n))+1]
if jn.cu==2 and jn.arms>0 and jn.ef==0 then
local jo=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if jo and jo.cu==1 then
ft(jn,jo)
end
end
end
jm-=1
if(jm<0) then
if hm then
hm=nil
else
hm,jp,jq,jr,ib={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
jm=rnd(5000)
end
if hm then
if(x%6<1 or#hm<30) and ib==0 then
while#hm<31 do
if(rnd(9)<.5) jq=rnd(.04)-.02
hn,ho=hm[#hm][1],hm[#hm][2]
add(hm,{hn+sin(jp),ho-cos(jp)})
jp+=jq
end
end
if(#hm>30) del(hm,hm[1])
if(ib>0) ib+=.01 io(hn,ho,rnd"1")
if(ib>2) ib=0
end
end
function gv()
cls"15"
camera(cr+(16-rnd(32))*cw,cs+(16-rnd(32))*cw)
cw=(cw>0.05) and cw*0.95 or 0
if hm then
for cx=1,#hm do
if(cx%2==1) fillp(0xa5a5.8)
circfill(
hm[cx][1]+4,
hm[cx][2]+4,4,
jr[cx%#jr+1])
fillp()
end
if(ib>0) spr(94+ib,hn,ho)
end
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hj,hk in pairs(m) do
if not br then
hk:fq()
if(hk.bs) hk.bs:fq()
end
hk:ct()
if(hk==bo) then
rect(bo.ca,bo.cb,
bo.ca+bo.w-1,bo.cb+bo.h-1,
7)
end
end
for hj,hl in pairs(n) do
if(not br) hl:fq()
if(hl.cc!=2 or hl.speed==0) hl:ct()
if(hl==bo) then
palt(11,true)
spr(17,bo.ca,bo.cb)
end
end
js()
gy()
end
function jt()
local gm=31
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bc!=be then
bd=bc and 1 or 59
ju=bc and 1 or-1
sfx(55)
gu()
end
be=bc
if bd>0 and bd<60 then
bd+=ju
clip(
max(108-bd,91),
max(108-(bd>20 and bd-20 or 0),91),
min(bd*2,33),
min((bd>20 and bd-20 or 1)*2,33))
for cx=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for dw=0,31 do
for dx=0,31 do
if(r[dw..","..dx]) pset(92+dw,92+dx,r[dw..","..dx])
end
end
local ir=92+cr/16
local is=92+cs/16
rect(ir,is,ir+7,is+7,7)
end
function jv(jw)
bf=jw
bg=500
end
function gw()
camera(0,0)
pal()
palt(0,false)
if bo and bo.dl then
bo.dl:ge(109,20)
bo.dl:ct()
if bo.bs and bo.cu==1 then
bo.bs:ge(109,44)
bo.bs:ct()
end
if bo.ci<bo.hitpoint
and bo.cu==1
and bo.id!=4
and(bo.type==2
or bo.id==15
or bo.id==16) then
cm:ge(117,28)
cm:ct()
end
end
rectfill(0,0,127,8,9)
if(bg>0) bg-=1 print(bf,2,2,0)
hq=gj(f[1])
? sub("000000",#hq+1)..hq,103,2,e
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.id==15
or bo.bs.id==16)
and bo.bs.ci>=100 then
local jx=flr((cursor.ca+cr)/8)
local jy=flr((cursor.cb+cs)/8)
local jz=jx*8-cr
local ka=jy*8-cs
kb=false
kc=false
dm=false
local w=bo.bs.fc
local h=bo.bs.fd
for dw=-1,w do
for dx=-1,h do
if dw==-1 or dw==w or dx==-1 or dx==h then
if(fy(jx+dw,jy+dx)==16 or fy(jx+dw,jy+dx)>=63) kb=true
else
local fo=fy(jx+dw,jy+dx)
if(fo>=9 and fo<=15) dm=true
if(o[jx+dw..","..jy+dx] or fo==0 or fo<8 or fo>16) kc=true
end
end
end
if(kc) kb=false
fillp("0b1110110110110111.1")
rectfill(jz,ka,
jz+bo.bs.w,ka+bo.bs.h,kb and 11 or 8)
fillp()
end
jt()
if br then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bo.bl then
bo.bp={}
rectfill(6,25,27,92,0)
local kd=1
for cx=1,#bo.bl do
local ke=bo.bl[cx]
if ke.req_id==nil
or q[ke.req_id] then
bo.bp[kd]=ke
if kd>=bh and kd<=bh+2 then
ke:ge(9,28+((kd-bh)*19))
ke:ct()
else
ke:ge(-16,16)
end
if(bi==ke) then
bn=kd
rect(ke.ca-2,ke.cb-2,
ke.ca+17,ke.cb+17,
7)
print(bi.name,30,26,7)
print("cOST:"..bi.cost,85,33,9)
print(bi.description,30,39,6)
end
kd+=1
end
end
end
for hj,kf in pairs(bj) do
kf:ct()
end
end
palt(11,true)
cursor:ct()
end
function bm(ca,cb,kg,func_onclick,ew)
add(bj,{
ca=ca,
cb=cb,
w=ew or#kg*4+2,
h=8,
kg=kg,
cp=function(self)
return{
ca=self.ca,
cb=self.cb,
w=self.w,
h=self.h
}
end,
ct=function(self)
if(#kg>1) rectfill(self.ca,self.cb,self.ca+self.w,self.cb+self.h,7)
if(#kg>1) rectfill(self.ca+1,self.cb+1,self.ca+self.w-1,self.cb+self.h-1,self.kh and 12 or 6)
print(self.kg,self.ca+2,self.cb+2,(#kg>1) and 0 or(self.kh and 12 or 7))
end,
func_onclick=func_onclick
})
end
function ie()
ki=false
if bo then
cq=true
if(ce.ci and ce.ci<ce.hitpoint) kj(cm)
if(bo.dl and not br and not ki) kj(bo.dl)
foreach(bo.bl,kj)
if(br) foreach(bj,kj)
cq=false
end
if not br
and not ki then
foreach(n,kj)
foreach(m,kj)
end
if hx
and not br
and hz>89 and hz<122
and ia>90 and ia<123 then
cr=mid(0,(hz-94)*16,400)
cs=mid(0,(ia-94)*16,400)
elseif hv then
if(bo) jv(bo.name)
if ki then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=ce return
if(br and bi.kg and bi.func_onclick) bi:func_onclick()
if(bo.cu==1 and bo.type==1 and bo!=ce and bo.speed>0) sfx(62)
if(bo.cu==2 and ce and ce.type==1 and ce.cu==1) bo.fi=10 ft(ce,bo) bo=nil
else
if bo
and bo.type==1
and bo.cu==1
and bo.speed>0
and bo.ef!=7 then
bo.fv=cocreate(function(hl)
im(hl,flr((cr+hz)/8),flr((cs+ia)/8))
et(hl)
end)
end
if bo
and bo.bs
and bo.bs.ci>=100
and kb then
local ds=flr((cursor.ca+cr)/8)
local dt=flr((cursor.cb+cs)/8)
local da=bo.bs.ez
di(da,ds*8,dt*8,1)
gc(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
elseif hy and not br then
bo=nil
end
end
function gc(ey)
ey.ci=0
ey.cc=0
ey.ff=0
ey.ga=false
end
function kj(ey)
ey.kh=kk(cursor,ey)
if hv and ey.kh then
if br then
bi=ey
else
if(ey.type<=2 and gp[flr((cursor.ca+cr)/8)][flr((cursor.cb+cs)/8)]!=16) return
if(ey.ef==8) return
if bo
and(ey.id==6 and bo.id==27
or ey.id==14 and bo.id>21)
and bo.cu==1 then
bo.ef=7
bo.es=ey
ey.bx=true
bo.fv=cocreate(function(hl)
im(hl,(ey.ca+16)/8,(ey.cb+16)/8)
et(hl,9)
end)
return
else
bo=ey
end
end
ki=true
end
end
function fr(kl,km)
kl*=4
local fo=peek(0x3100+kl+1)
if((band(fo,128)>0)!=km) fo=bxor(fo,128)
poke(0x3100+kl+1,fo)
end
function hr(kn,ko,
kp,fn,
kq)
for dw=-1,1 do
for dx=-1,1 do
print(kn,ko+dw,kp+dx,kq)
end
end
print(kn,ko,kp,fn)
end
function kk(kr,ks)
local kt=kr:cp()
local ku=ks:cp()
return kt.ca<ku.ca+ku.w and
kt.ca+kt.w>ku.ca and
kt.cb<ku.cb+ku.h and
kt.cb+kt.h>ku.cb
end
function cl()
kv=kw(ck,"|","\n")
ck={}
for cx=2,#kv-1 do
kx={}
for ky=1,#kv[cx] do
local fo=kv[cx][ky]
if(ky!=2 and ky<25) fo=tonum(fo)
if(ky==25) then
kz=kw(fo,"~")
fo=""
for cx=1,#kz do
fo=fo.."\n"..kz[cx]
end
end
kx[kv[1][ky]]=fo
end
ck[tonum(kv[cx][1])]=kx
end
end
function gj(fo)
local la=""
local gh=abs(fo)
repeat
la=(gh%0x0.000a/0x.0001)..la
gh/=10
until gh==0
if(fo<0) la="-"..la
return la
end
function kw(kn,en,lb)
local iu={}
local la=''
local lc=''
if(lb~=nil) kn=kw(kn,lb)
while#kn>0 do
if type(kn)=='table'then
la=kn[1]
add(iu,kw(la,en))
del(kn,la)
else
la=sub(kn,1,1)
kn=sub(kn,2)
if la==en then
add(iu,lc)
lc=''
else
lc=lc..la
end
end
end
add(iu,lc)
return iu
end
function fk(hd,he,ca,cb,iu,w,ld,le)
local lf,lg=cos(iu),sin(iu)
local lh,li,lj,lk
local ll,lm=lf,lg
local hb=shl(0xfff8,(w-1))
w*=4
lf*=w-0.5
lg*=w-0.5
local ln,lo=lg-lf+w,-lf-lg+w
w=2*w-1
for lp=0,w do
lh,li=ln,lo
for lq=0,w do
if band(bor(lh,li),hb)==0 then
local lr=sget(hd+lh,he+li)
if(lr!=ld) pset(ca+lp,cb+lq,le or lr)
end
lh-=lm
li+=ll
end
ln+=ll
lo+=lm
end
end
function dq(lt,lu,lv,lw)
return abs(sqrt(((lt-lv)/1000)^2+((lu-lw)/1000)^2)*1000)
end
function iv(hl,lx)
local ly=3.14159
local lz=0.0087
local gi=lx-hl.ed
if gi>0.5 then
gi-=1
elseif gi<-0.5 then
gi+=1
end
if gi>lz then
hl.ed+=lz
elseif gi<-lz then
hl.ed-=lz
else
hl.ed=lx
end
if(hl.ed>ly) hl.ed-=2*ly
if(hl.ed<-ly) hl.ed+=2*ly
yield()
end
function jf(ma,jh,mb)
local mc=fget(fy(jh.ca,jh.cb),1) and 4 or 1
if(ma.ca!=jh.ca and ma.cb!=jh.cb) return mc+1
return mc
end
function jg(jh,mb)
local md={}
for dw=-1,1 do
for dx=-1,1 do
if(dw!=0 or dx!=0) me(jh.ca+dw,jh.cb+dx,md)
end
end
return md
end
function me(mf,mg,mh)
if(not fget(fy(mf,mg),0) and o[mf..","..mg]==nil and mf>=0 and mg>=0 and mf<=63 and mg<=63) add(mh,{ca=mf,cb=mg})
end
function je(iu,mi)
return abs(iu.ca-mi.ca)+abs(iu.cb-mi.cb)
end
function jd
(mj,
mk,
ml,
mm,
md,
mn,
mb)
local mo,
mp={
mq=mj,
mr=0,
ms=ml(mj,mk,mb)
},{}
mp[mn(mj,mb)]=mo
local mt,mu,mv,mw={mo},1,mn(mk,mb),32767.99
local count=0
while mu>0 do
local cost,mx=mw
for cx=1,mu do
local my=mt[cx].mr+mt[cx].ms
if(my<=cost) mx,cost=cx,my
end
mo=mt[mx]
mt[mx],mo.mz=mt[mu],true
mu-=1
local na=mo.mq
if mn(na,mb)==mv then
na={mk}
while mo.nb do
mo=mp[mn(mo.nb,mb)]
add(na,mo.mq)
end
return na
end
for nc in all(md(na,mb)) do
local id=mn(nc,mb)
local nd,ne=
mp[id],
mo.mr+mm(na,nc,mb)
if not nd then
nd={
mq=nc,
mr=mw,
ms=ml(nc,mk,mb)
}
mu+=1
mt[mu],mp[id]=nd,nd
end
if not nd.mz and nd.mr>ne then
nd.mr,nd.nb=ne,na
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
function fp(ca,cb,ed,el,em,nf,ng,ci,nh,kl)
local na={
ca=ca,cb=cb,ed=ed,el=el,em=em,nf=nf,
ci=0,ng=ng or 0.0625,
nh=nh or{7,6,5},kl=kl or 0,
ni=cb,nj=ci or 8
}
add(u,na)
end
function ic()
for gg,na in pairs(u) do
na.em+=na.ng
na.ca+=na.el
na.cb+=na.em
na.ed+=na.nf
na.ci+=1
if(na.ci>=na.nj) del(u,na)
end
end
function js()
for gg,na in pairs(u) do
local fn=flr((#na.nh/na.nj)*na.ci)+1
if(na.kl) fillp(na.kl)
circfill(na.ca,na.cb,na.ed,na.nh[fn])
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

