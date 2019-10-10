pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- undune ii
-- by paul nicholas
a=true
b=false
c=3
d=8
e=2
f={0,0}
f[1]+=shr(400,16)
g=1
i=12
j=1
k=1
f[2]+=shr(1000,16)
l,m=0,0
n,o=0,0
p,q=0,0
r=nil
s=0
u=false
v=u
x=false
y=0
z={}
ba=0
count=0
bb={}
bc={}
bd={}
be={}
bf={}
bg=0
bh={}
bh.factory_click=function(self)
bi=1
bj=self.bk.bl[1]
bm(6,89,"⬆️",function(self)
bn=mid(1,bn-1,#r.bl)
bj=r.bl[bn]
if(bn<bi) bi-=1
end,10)
bm(17,89,"⬇️",function(self)
bn=mid(1,bn+1,#r.bl)
bj=r.bl[bn]
if(bn>bi+2) bi=min(bi+1,#bo.bk.bl-2)
end,10)
bm(32,88,"build",function(self)
bo=nil
be={}
r.bp=bq
bq:func_onclick()
end)
bm(96,88,"close",function(self)
bo=nil
end)
bo=self
end
bh.init_windtrap=function(self)
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
bh.init_refinery=function(self)
self.br={11,10,9,9,9,9}
self.bs=1
end
bh.draw_refinery=function(self)
pal()
palt(0,false)
pal(11,self.bt)
pal(10,self.bt)
pal(9,self.bt)
if self.bu then
pal(self.br[self.bs],self.bv)
else
pal(11,self.bv)
self.bs=1
end
spr(self.obj_spr,self.bw,self.bx,self.w/8,self.h/8)
end
bh.draw_repair=function(self)
pal()
palt(0,false)
palt(11,true)
if(by()) pal(7,r.bz==2 and 11 or 8)
spr(self.obj_spr,self.bw,self.bx)
pal()
end
bh.repair_click=function(self)
ca(cb,2)
end
function ca(self,cc)
self.ce=0
self.cf=self.bz
if(self.cg>0 and self.cf>0) self.ch=not self.ch
self.bz=cc
end
ci=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|0|0|400|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|0|0|50|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|-100|0|200||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30|0|450||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30|0|500|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5|0|150|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10|0|300|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10|0|400|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20|0|350|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20|0|200|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35|0|400|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20|0|200|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||2|1|1|nil|1|7|5||125|10|0|200|||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||2|1|1|nil|1|7|6||250|20|0|200|||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50|0|500|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40|0|400|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80|0|1000|||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|-3|60||4|50|0.05|2|1|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|-1|100||8|110|0.1|3|1|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|100|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD|55|206||1|1|1|11|11||3||200||10|130|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|200|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|300|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|100|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|150|0.1|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|100|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|-3|600||75|5|1.5|5|2||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4|99|900||0|150|0|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|1|600||90|110|0.3|8|11||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|1|0||8|220|0.1|3|1||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|3|800||60|400|0.1|7|1||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|3|0||150|70|2.5|nil|20||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER|54|204||1|1|1|11|11||2|2|150||8|80|0.75|3|1||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|2|750||0|120|0.3|7|11||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|2|0||150|40|0.4|2|||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|110|0.1|1|||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||9|1|1|11|nil|nil|3||0||300|1000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||
80|rEPAIR|47|47||5|1|1|11|nil|nil|||||||||||||||draw_repair||repair_click]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
cartdata("pn_picodune")
cj()
ck=cl(ci[80],109,-20,5,{},nil,bh.draw_repair,bh.repair_click)
cm=1
cn()
co=0
cursor={
bw=0,
bx=0,
w=8,
h=8,
spr=0,
cp=function(self)
return{
bw=self.bw+(not cq and l or 0)+2,
bx=self.bx+(not cq and m or 0)+1,
w=1,
h=1
}
end,
cr=function(self)
spr((r and(r.type==1)) and 1 or self.obj_spr,
self.bw,self.bx,self.w/8,self.h/8)
end
}
cs()
l=44
m=20
music(9)
end
function cs()
for ct=1,2 do
for cu=0,31 do
for cv=0,127 do
local cw=nil
local cx=mget(cv,cu)
local cy=fget(cx)
if ct==1 and cx==1 then
cz=cv*8
da=cu*8
cw=ci[1]
elseif ct==2
and cx!=16 then
for db in all(
ci) do
if(db.obj_spr!=nil and db.obj_spr==cx) cw=db break
end
end
if cw!=nil then
dc(cw,cv*8,cu*8)
if cw.type==1 then
mset(cv,cu,48)
end
end
end
end
end
end
function dc(cw,bw,bx,dd,de)
local df=cl(cw,bw,bx,cw.type,nil,bh[cw.func_init],bh[cw.func_draw],bh[cw.func_update],nil)
df.dg=cl(cw,109,0,3,df,nil,nil,bh[cw.func_onclick])
df.cg=dh and cw.hitpoint/2 or cw.hitpoint
df.bl={}
for db in all(ci) do
if(db.parent_id!=nil and db.parent_id==df.id)
and(db.req_faction==nil
or(db.req_faction>0 and db.req_faction==c)
or(db.req_faction<0 and-c!=db.req_faction))
then
local bp=cl(db,109,0,4,df,nil,nil,function(self)
if bo then
r=self
else
ca(self,1)
end
end)
add(df.bl,bp)
df.bp=df.bl[1]
end
end
df.dd=dd or(di(bw,bx,cz,da)<75 and 1 or 2)
if df.dd==1 then
df.dj=c
df.bv=d
df.bt=e
else
df.dj=g
df.bv=i
df.bt=j
df.dg.func_onclick=nil
end
if cw.type==2 then
df.dk=53
local dl=flr(bw/8)
local dm=flr(bx/8)
local dn=(cw.id==2 or cw.id==3)
for dp=0,cw.w-1 do
for dq=0,cw.h-1 do
dr(dl+dp,dm+dq,dn and 16 or 95)
end
end
if(not dn) add(bd,df)
if(df.id==7 and df.dd==1) x=true
if df.id==6 and df.bk==nil then
local ds,dt=du(df,(df.bw+32)/8,(df.bx+8)/8,dv)
local dw=dc(ci[27],ds*8,dt*8,nil,df)
end
end
if cw.type==1 then
df.dk=54
if(df.norotate!=1) df.dx=flr(rnd(8))*.125
if df.arms>0 then
df.dy=function(self)
self.dz=4
self.ea=self.bw+4
self.eb=self.bx+4
self.ec=self.ed.bw+self.ed.w/2
self.ee=self.ed.bx+self.ed.h/2
local ef=self.ec-self.ea
local eg=self.ee-self.eb
local eh=sqrt(ef*ef+eg*eg)
self.ei=(ef/eh)*2
self.ej=(eg/eh)*2
sfx(self.arms<100 and 60 or 58,3)
ek(self)
end
else
if(df.id==27) df.el=0 df.em=de printh("factory == "..tostr(de))
end
add(bb,df)
en(df)
end
ek(df)
return df
end
function cl(eo,bw,bx,ep,bk,func_init,func_draw,func_onclick)
local eq=(eo.w or 1)*8
local er=(eo.h or 1)*8
local es={
et=eo,
bw=bw,
bx=bx,
eu=1,
type=ep,
bk=bk,
func_onclick=func_onclick,
w=eq,
h=er,
ev=eo.obj_spr,
ew=eo.w or 1,
ex=eo.h or 1,
cg=0,
ey=0,
bz=0,
ez=0,
fa=0,
fb=0,
fc=1,
cp=function(self)
return{
bw=self.bw,
bx=self.bx,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cr=func_draw or function(self)
if self.type<=2
and(self.bw+self.w<l
or self.bw>l+127
or self.bx+self.h<m
or self.bx>m+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dj) pal(12,self.bv) pal(14,self.bt)
if self.br then
pal(self.br[self.bs][1],
self.br[self.bs][2])
end
if self.dx then
if not self.fd or self.fd>.025 then
fe(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bw,self.bx+1,.25-self.dx,1,self.trans_col,5)
fe(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bw,self.bx,.25-self.dx,1,self.trans_col,flr(self.fc)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.bw-1,self.bx-1,self.bw+16,self.bx+19,0)
local ff=self.type==4 and self or self.bk
local fg=ff.et.hitpoint
local fh=self.bz==1 and 12 or(ff.cg<fg*.33 and 8 or ff.cg<fg*.66 and 10 or 11)
local fi=self.bz==1 and(15*ff.cg/100) or(15*ff.cg/fg)
if(ff.cg>0 and not bo) rectfill(self.bw,self.bx+17,self.bw+fi,self.bx+18,fh)
end
if self.type>2 then
spr(self.ico_spr,self.bw,self.bx,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
spr(self.obj_spr,self.bw,self.bx,self.w/8,self.h/8)
end
end
if self.ea then
if(self.fire_type==1) then
circfill(self.ea,self.eb,0,rnd(2)<1 and 8 or 9)
else
fj(self.ea,self.eb,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.cg<self.et.hitpoint*.33 then
if(rnd(10)<1) fj(self.bw+3.5,self.bx+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fb=0
if(b) fk(self)
end,
fl=function(self)
self.fc=max(self.fc-.4,1)
if(self.type<=2 and self.cg<=0 and self.fd==nil) self.dz=5 self.fm=nil self.fd=(self.type==2 and 1 or .5) sfx(self.dk,3)
if self.fd then
self.fd-=.025
if self.fd<=0 then
if self.type==2 then
for dp=0,self.et.w-1 do
for dq=0,self.et.h-1 do
mset(self.bw/8+dp,self.bx/8+dq,15)
end
end
del(bd,self)
else
local fn,fo=flr(self.bw/8),flr(self.bx/8)
if(fo>31) fn+=64 fo-=32
if(fp(fn,fo)<9) mset(fn,fo,20)
del(bb,self)
end
if(r==self) r=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fq(self.bw+rnd(self.w),self.bx+rnd(self.h))
end
end
if self.framecount!=nil then
self.ey+=1
if(self.ey>self.framecount) then
self.ey=0
if self.altframe
and self.dz==2 then
self.obj_spr=self.ev+(self.altframe-self.obj_spr)
end
if self.br then
self.bs+=1
if(self.bs>#self.br) self.bs=1
end
end
end
if self.ea then
self.ea+=self.ei
self.eb+=self.ej
if di(
self.ea,self.eb,
self.ec,self.ee)<2
then
fq(self.ea,self.eb,self.fire_type)
if di(
self.ea,self.eb,
self.ed.bw+self.ed.w/2,
self.ed.bx+self.ed.h/2)<4
then
self.ed.cg-=self.arms
self.ed.fb=self.fire_type
self.ed.fr=self
end
self.ea=nil
end
end
if self.bz>0
and not self.ch
and not self.fs then
if self.bz==1 and self.ez>self.cost then
self.fs=true
sfx(56)
if self.et.type==1 then
local ds,dt=du(self,(self.bk.bw+8)/8,(self.bk.bx+16)/8,dv)
dc(self.et,ds*8,dt*8,nil,self.bk)
ft(self)
end
elseif self.bz==2 and self.cg>self.et.hitpoint then
self.bz=0
else
self.ce+=1
self.cg=(self.bz==1 and(self.ez/self.cost)*100 or self.cg+.1)
if(self.ce>(self.bz==1 and 3 or 100) and fu(-1,self.bz==1 and self.bk or self)) self.ce=0 self.ez+=1
end
end
end,
fv=function(self,bw,bx)
self.bw=bw
self.bx=bx
end,
fw=function(self)
return flr(self.bw/8)..","..flr(self.bx/8)
end
}
for fx,fy in pairs(eo) do
if es[fx]==nil and fy!=""then
es[fx]=fy
end
end
if(func_init) func_init(es)
return es
end
function fu(fz,es)
if(ga(f[es.dd])+fz<0) return false
f[es.dd]+=sgn(fz)*shr(abs(fz),16)
if(es.dd==1) sfx(63)
return true
end
function fq(bw,bx,gb)
fj(bw,bx,2,
0,0,.1,0,gb==1 and 5 or 30,{5,7,10,8,9,2},rnd(2)<1 and 0xa5a5.8 or 0)
end
function ek(gc)
if(gc.dd!=1 and gc.dz!=4) return
local gd=gc.type==2 and 3 or 2
for dp=-gd,gd do
for dq=-gd,gd do
local ge=flr(gc.bw/8)+dp
local gf=flr(gc.bx/8)+dq
gg[ge][gf]=16
gh(ge,gf)
for eg=-1,1 do
for ef=-1,1 do
gh(ge+ef,gf+eg)
end
end
end
end
end
function _update60()
gi()
gj()
if(t()%1==0) gk()
if(t()%1==0 and t()%2==0) gl()
s+=1
end
function _draw()
gm()
gn()
if(a) go("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function cn()
gg={}
for ct=-2,66 do
gg[ct]={}
for gp=-2,66 do
gg[ct][gp]=0
end
end
end
function gq()
local gr=flr(l/8)
local gs=flr(m/8)
for dp=gr-1,gr+16 do
for dq=gs-1,gs+16 do
if gg[dp][dq]!=0 and gg[dp][dq]!=16 then
palt(11,true)
spr(gg[dp][dq]+31,dp*8,dq*8)
elseif gg[dp][dq]<16 then
rectfill(dp*8,dq*8,dp*8+7,dq*8+7,0)
end
end
end
end
function gh(bw,bx)
if(bw<0 or bw>#gg or bx<0 or bx>#gg) return
local gt=0
if gg[bw][bx]!=0 then
if(gg[bw][bx-1]>0) gt+=1
if(gg[bw-1][bx]>0) gt+=2
if(gg[bw+1][bx]>0) gt+=4
if(gg[bw][bx+1]>0) gt+=8
gg[bw][bx]=1+gt
end
end
function gl()
z={}
if u then
for ct=0,124,4 do
for gp=0,124,4 do
local cv=ct/2
local cu=gp/2
if(cu>=32) cv+=64 cu-=32
local gu=mget(cv,cu)
local gv=(gu*8)%128
local gw=(gu*8)/16
local fh=sget(gv+4,gw)
if(gg[ct/2][gp/2]==16) z[((ct/2)/2)..","..((gp/2)/2)]=fh!=11 and fh or 15
end
end
end
bg=0
for gx,gy in pairs(bd) do
local ge=flr(gy.bw/8)
local gf=flr(gy.bx/8)
if gy.dd==1 or(u and gg[ge][gf]==16) then
z[flr(gy.bw/2/8)..","..flr(gy.bx/2/8)]=gy.bv
end
if(gy.dd==1) bg-=gy.et.power
end
if u then
for gx,gz in pairs(bb) do
local ge=flr(gz.bw/8)
local gf=flr(gz.bx/8)
if gz.dd==1 or gg[ge][gf]==16 then
z[flr(gz.bw/2/8)..","..flr(gz.bx/2/8)]=gz.bv
end
end
end
u=(x and bg>0)
end
function gk()
bc={}
for fx,gz in pairs(bb) do
bc[flr(gz.bw/8)..","..flr(gz.bx/8)]=fx
end
end
function gi()
ha=stat(32)
hb=stat(33)
hc=stat(34)
hd=(hc>0 and he!=hc) or btnp(4)
hf=(hc>0) or btn(4)
hg=btnp(5)
for fx=0,1 do
if(btn(fx)) p+=fx*2-1
if(btn(fx+2)) q+=fx*2-1
end
n=mid(0,ha+p,127)
o=mid(0,hb+q,127)
cursor.bw=n
cursor.bx=o
if not bo then
if(n<4) l-=2
if(n>123) l+=2
if(o<4) m-=2
if(o>123) m+=2
l=mid(l,384)
m=mid(m,384)
for gx,gz in pairs(bb) do
if gz then
if gz.fm and costatus(gz.fm)!='dead'then
assert(coresume(gz.fm,gz))
else
gz.fm=nil
end
end
end
hh()
co+=1
end
hi()
he=hc
cb=r
bq=bj
end
function hj(bw,bx)
local fi=fp(bw,bx)
return fi>=2 and fi<=8
end
function en(gz,hk)
gz.dz=hk or 0
gz.fm=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) du(self,flr(self.bw/8),flr(self.bx/8),hl,self.range)
if self.fb>0 and self.dz==0 then
hm(5,true)
if(ba==0 or stat(24)>5) ba=1 music(0)
if(self.arms>0) hn(self,self.fr)
end
if self.id==27 then
if self.dz==0 or self.dz==7 or self.dz==9 then
if self.el<=1500
and self.dz!=7 and self.dz!=9 then
local gv,gw
local ho,hp=flr(self.bw/8),flr(self.bx/8)
if hj(ho,hp) and not self.hq then
gv,gw=ho,hp
else
du(self,ho,hp,
function(gz,bw,bx)
if hj(bw,bx) and rnd(10)<1 then
gv,gw=bw,bx
return true
end
end,
10)
end
if gv and gw then
hr(gz,gv,gw)
if(hj(flr(gz.bw/8),flr(gz.bx/8))) gz.dz=6
end
elseif self.dz==9 then
if not self.em.hs then
self.em.bu=false
self.em.hs=true
while self.el>0 do
self.dz=8
self.dx=.25
self.bw=self.em.bw+16
self.bx=self.em.bx+4
self.el-=1
if(r==self) r=nil
if(flr(self.el)%4==0) fu(2,self)
yield()
end
self.el=0
self.em.hs=false
self.dz=0
end
end
elseif self.el>=1500
and self.dz!=7 then
self.dz=7
self.em.bu=true
hr(self,(self.em.bw+16)/8,self.em.bx/8)
self.dz=9
elseif self.dz==6 then
self.hq=false
local dx=gz.dx+.75+rnd(.2)-.1
local ht,hu=sin(dx)*5.5,-cos(dx)*5.5
if(rnd(5)<1) fj(gz.bw+ht+3.5,gz.bx+hu+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bf[gz:fw()]=(bf[gz:fw()] or 10000)-1
self.el=(self.el or 0)+.5
if bf[gz:fw()]<=0 then
local dl=flr(self.bw/8)
local dm=flr(self.bx/8)
for dq=-1,1 do
for dp=-1,1 do
fi=fp(dl+dp,dm+dq)
dr(dl+dp,dm+dq,
(dp==0 and dq==0) and 0 or((fi>1 and fi<8) and 8 or fi)
)
end
end
self.dz=0
end
if self.el%300==0 then
self.hq=true
self.dz=0
end
end
end
yield()
end
end)
end
function hn(gz,ed)
gz.dz=3
gz.ed=ed
gz.fm=cocreate(function(self)
while ed.cg>0 do
if di(gz.bw,gz.bx,ed.bw,ed.bx)>gz.range*5 then
hr(gz,flr(ed.bw/8),flr(ed.bx/8),gz.range*5)
end
if not gz.norotate then
local hv=atan2(gz.bw-ed.bw,gz.bx-ed.bx)
while(gz.dx!=hv) do
hw(gz,hv)
end
end
gz.fa-=1
if(gz.fa<=0 and not gz.ea) gz.dy(gz) gz.fa=gz.arms*2
yield()
end
hm(5,false)
ba=2
en(self)
end)
end
function du(gz,bw,bx,hx,hy)
for di=1,hy or 64 do
for dp=bw-di,bw+di do
for dq=bx-di,bx+di do
if((dp==bw-di or dp==bw+di or dq==bx-di or dq==bx+di) and(hx(gz,dp,dq))) return dp,dq
end
end
yield()
end
end
function fp(cv,cu)
if(cu>31) cv+=64 cu-=32
return mget(cv,cu)
end
function dr(cv,cu,hz)
if(cu>31) cv+=64 cu-=32
mset(cv,cu,hz)
end
function dv(gz,bw,bx)
return not fget(fp(bw,bx),0)
and bc[bw..","..bx]==nil
end
function hl(gz,bw,bx)
local ed=bb[bc[bw..","..bx]]
if(ed!=ia and ed.dd!=gz.dd and gg[bw][bx]==16) hn(gz,ed) return true
end
function hr(gz,bw,bx,ib)
::restart_move_unit::
gz.ic="init"
if not dv(nil,bw,bx) then
bw,bx=du(gz,bw,bx,dv)
end
gz.ho=bw
gz.hp=bx
gz.ie=gz.dz
gz.dz=1
gz.ic=ig(
{bw=flr(gz.bw/8),bx=flr(gz.bx/8)},
{bw=gz.ho,bx=gz.hp},
ih,
ii,
ij,
function(ik) return shl(ik.bx,8)+ik.bw end,
nil)
gz.ie=gz.dz
gz.dz=2
gz.dz=2
if gz.ic!=nil then
for ct=#gz.ic-1,1,-1 do
local ik=gz.ic[ct]
if not gz.norotate then
local ef=gz.bw-(ik.bw*8)
local eg=gz.bx-(ik.bx*8)
local hv=atan2(ef,eg)
while(gz.dx!=hv) do
hw(gz,hv)
end
end
if(not dv(nil,ik.bw,ik.bx)) goto restart_move_unit
local il=gz.speed or .5
local im=sqrt((ik.bw*8-gz.bw)^2+(ik.bx*8-gz.bx)^2)
local io=il*(ik.bw*8-gz.bw)/im
local ip=il*(ik.bx*8-gz.bx)/im
for ct=0,im/il-1 do
bc[ik.bw..","..ik.bx]=gz
gz.bw+=io
gz.bx+=ip
yield()
end
gz.bw,gz.bx=ik.bw*8,ik.bx*8
bc[ik.bw..","..ik.bx]=gz
ek(gz)
if(di(gz.bw,gz.bx,gz.ho*8,gz.hp*8)<=(ib or 0)) break
end
end
gz.dz=0
end
function gj()
if(t()%2==0) then
local iq=bb[flr(rnd(#bb))+1]
if iq.dd==2 and iq.arms>0 then
local ir=(rnd(2)<1) and bb[flr(rnd(#bb))+1] or bd[flr(rnd(#bd))+1]
if ir and ir.dd==1 then
printh(">>> attack!")
hn(iq,ir)
end
end
end
end
function gm()
cls"15"
camera(l,m)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for gx,gy in pairs(bd) do
if not bo then
gy:fl()
if(gy.bp) gy.bp:fl()
end
gy:cr()
if(gy==r) then
rect(r.bw,r.bx,
r.bw+r.w-1,r.bx+r.h-1,
7)
end
end
palt(11,true)
for gx,gz in pairs(bb) do
if(not bo) gz:fl()
gz:cr()
if(gz==r) then
palt(11,true)
spr(17,r.bw,r.bx)
end
end
is()
gq()
end
function it()
local gd=31
local bw,bx=93,93
rectfill(bw-1,bx-1,bw+gd+1,bx+gd+1,e)
rectfill(bw,bx,bw+gd,bx+gd,0)
if u!=v then
y=u and 1 or 59
iu=u and 1 or-1
sfx(55)
gl()
end
v=u
if y>0 and y<60 then
y+=iu
clip(
max(bw+(gd/2)-y,bw),
max(bx+(gd/2)-(y>20 and y-20 or 0),bx),
min(y*2,gd),
min((y>20 and y-20 or 1)*2,gd))
for ct=1,300 do
pset(bw+rnd(gd),bx+rnd(gd),5+rnd(3))
end
clip()
return
end
for dp=0,gd do
for dq=0,gd do
if(z[dp..","..dq]) pset(bw+dp,bx+dq,z[dp..","..dq])
end
end
local ht=bw+l/16
local hu=bx+m/16
rect(ht,hu,ht+7,hu+7,7)
end
function gn()
camera(0,0)
pal()
palt(0,false)
if r and r.dg then
r.dg:fv(109,20)
r.dg:cr()
if r.bp and r.dd==1 then
r.bp:fv(109,44)
r.bp:cr()
end
if r.cg<r.et.hitpoint
and r.dd==1
and r.type==2 then
ck:fv(117,28)
ck:cr()
end
end
iv=ga(f[1])
go(sub("000000",#iv+1)..iv,103,2,7)
if r
and r.bp
and r.bp.et.type==2
and r.bp.cg>=100 then
local iw=flr((cursor.bw+l)/8)
local ix=flr((cursor.bx+m)/8)
local iy=iw*8-l
local iz=ix*8-m
ja=false
jb=false
dh=false
local w=r.bp.et.w
local h=r.bp.et.h
for dp=-1,w do
for dq=-1,h do
if dp==-1 or dp==w or dq==-1 or dq==h then
if(fp(iw+dp,ix+dq)==16 or fp(iw+dp,ix+dq)>=63) ja=true
else
local fi=fp(iw+dp,ix+dq)
if(fi>=9 and fi<=15) dh=true
if(bc[iw+dp..","..ix+dq] or fi==0 or fi<8 or fi>16) jb=true
end
end
end
if(jb) ja=false
fillp("0b1110110110110111.1")
rectfill(iy,iz,
iy+r.bp.w,iz+r.bp.h,ja and 11 or 8)
fillp()
end
it()
if bo then
jc(121,73,e,d)
if r.bl then
rectfill(6,30,27,97,0)
for ct=1,#r.bl do
local jd=r.bl[ct]
if ct>=bi and ct<=bi+2 then
jd:fv(9,32+((ct-bi)*19))
jd:cr()
else
jd:fv(-16,16)
end
if(bj==jd) then
bn=ct
rect(jd.bw-2,jd.bx-2,
jd.bw+17,jd.bx+17,
7)
print(bj.name,30,31,7)
print("cOST:"..bj.cost,85,38,9)
je=0
local jf=jg(bj.description,23)
for gp in all(jf) do
print(gp,30,44+je,6)
je+=6
end
end
end
end
for gx,jh in pairs(be) do
jh:cr()
end
end
palt(11,true)
cursor:cr()
end
function jc(w,h,ji,jj)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-w/2,64-h/2,64+w/2,64+h/2,ji)
rect(64-w/2+1,64-h/2+1,64+w/2-1,64+h/2-1,jj)
end
function bm(bw,bx,jk,func_onclick,eq)
local es={
bw=bw,
bx=bx,
w=eq or#jk*4+2,
h=8,
jk=jk,
cp=function(self)
return{
bw=self.bw,
bx=self.bx,
w=self.w,
h=self.h
}
end,
cr=function(self)
if(#jk>1) rectfill(self.bw,self.bx,self.bw+self.w,self.bx+self.h,7)
if(#jk>1) rectfill(self.bw+1,self.bx+1,self.bw+self.w-1,self.bx+self.h-1,self.jl and 12 or 6)
print(self.jk,self.bw+2,self.bx+2,(#jk>1) and 0 or(self.jl and 12 or 7))
if(b) fk(self)
end,
func_onclick=func_onclick
}
add(be,es)
end
function jg(jm,jn)
local jo={}
local jp=""
local jq=""
local jr=""
local js=function(jt)
if#jq+#jp>jt then
add(jo,jp)
jp=""
end
jp=jp..jq
jq=""
end
for ct=1,#jm do
jr=sub(jm,ct,ct)
jq=jq..jr
if jr==" "
or#jq>jn-1 then
js(jn)
elseif#jq>jn-1 then
jq=jq.."-"
js(jn)
elseif jr==";"then
jp=jp..sub(jq,1,#jq-1)
jq=""
js(0)
end
end
js(jn)
if jp!=""then
add(jo,jp)
end
return jo
end
function hi()
ju=false
if r then
cq=true
if(cb.cg and cb.cg<cb.et.hitpoint) jv(ck)
if(r.dg and not bo and not ju) jv(r.dg)
foreach(r.bl,jv)
foreach(be,jv)
cq=false
end
if not bo
and not ju then
foreach(bb,jv)
foreach(bd,jv)
end
if hf
and not bo
and n>89 and n<122
and o>90 and o<123 then
l=mid(0,(n-94)*16,400)
m=mid(0,(o-94)*16,400)
elseif hd then
if ju then
if(not bo and r.func_onclick and r.bk!=nil) r:func_onclick() r=cb return
if(bo and bj.jk and bj.func_onclick) bj:func_onclick()
if(r.dd==1 and r.type==1 and r!=cb) sfx(62)
if(r.dd==2 and cb and cb.type==1 and cb.dd==1) r.fc=10 hn(cb,r) r=nil
else
if r
and r.type==1
and r.dd==1
and(r.id!=27 or r.dz!=7) then
r.fm=cocreate(function(gz)
hr(gz,flr((l+n)/8),flr((m+o)/8))
en(gz)
end)
end
if r
and r.bp
and r.bp.cg>=100
and ja then
local dl=flr((cursor.bw+l)/8)
local dm=flr((cursor.bx+m)/8)
local cw=r.bp.et
dc(cw,dl*8,dm*8,1)
ft(r.bp)
sfx(61)
end
if(not bo) r=nil
end
end
end
function ft(es)
es.cg=0
es.bz=0
es.ez=0
es.fs=false
end
function jv(es)
es.jl=jw(cursor,es)
if hd and es.jl then
if bo then
bj=es
else
local dl=flr((cursor.bw+l)/8)
local dm=flr((cursor.bx+m)/8)
if(es.type<=2 and gg[dl][dm]!=16) return
if(es.id==27 and es.dz==8) return
if es.id==6 and r and r.id==27 and r.dd==1 then
r.dz=7
r.em=es
r.em.bu=true
r.fm=cocreate(function(gz)
hr(gz,(es.bw+16)/8,dm)
en(gz,9)
end)
return
else
r=es
end
end
ju=true
end
end
function jx(self,jy)
if(jy==self.jz) return
local hv=self.ka[jy]
self.kb=hv.co
self.jz=jy
self.kc=1
end
function kd(self)
self.kb-=1
if self.kb<=0 then
self.kc+=1
local hv=self.ka[self.jz]
self.kb=hv.co
if self.kc>#hv.ke then
self.kc=1
end
self.obj_spr=hv.ke[self.kc]
end
end
function hm(kf,kg)
local kh=0x3100
local ki=1
kf*=4
local fi=peek(kh+kf+ki)
if((band(fi,128)>0)!=kg) fi=bxor(fi,128)
poke(kh+kf+ki,fi)
end
function go(kj,kk,
kl,fh,
km)
for dp=-1,1 do
for dq=-1,1 do
print(kj,kk+dp,kl+dq,km)
end
end
print(kj,kk,kl,fh)
end
function jw(kn,ko)
local kp=kn:cp()
local kq=ko:cp()
if kp.bw<kq.bw+kq.w and
kp.bw+kp.w>kq.bw and
kp.bx<kq.bx+kq.h and
kp.bx+kp.h>kq.bx
then
return true
else
return false
end
end
function fk(es)
local kr=es:cp()
rect(kr.bw,kr.bx,kr.bw+kr.w,kr.bx+kr.h,es.jl and 11 or 8)
end
function by()
return flr(t())%2==0
end
function cj()
ks=kt(ci,"|","\n")
ku={}
for ct=2,#ks-1 do
kv={}
for kw=1,#ks[ct] do
local fi=ks[ct][kw]
if(kw!=2 and kw<24) fi=tonum(fi)
kv[ks[1][kw]]=fi
end
ku[tonum(ks[ct][1])]=kv
end
ci=ku
end
function ga(fi)
local kx=""
local fy=abs(fi)
repeat
kx=(fy%0x0.000a/0x.0001)..kx
fy/=10
until fy==0
if(fi<0) kx="-"..kx
return kx
end
function kt(kj,eh,ky)
local hv={}
local kz=0
local kx=''
local la=''
if ky~=nil then kj=kt(kj,ky) end
while#kj>0 do
if type(kj)=='table'then
kx=kj[1]
add(hv,kt(kx,eh))
del(kj,kx)
else
kx=sub(kj,1,1)
kj=sub(kj,2)
if kx==eh then
add(hv,la)
la=''
else
la=la..kx
end
end
end
add(hv,la)
return hv
end
local lb=0
function fe(gv,gw,bw,bx,hv,w,lc,ld)
local le,lf=cos(hv),sin(hv)
local lg,lh,kh,li
local lj,lk=le,lf
local gt=shl(0xfff8,(w-1))
w*=4
le*=w-0.5
lf*=w-0.5
local ll,lm=lf-le+w,-le-lf+w
w=2*w-1
for ln=0,w do
lg,lh=ll,lm
for lo=0,w do
if band(bor(lg,lh),gt)==0 then
local kz=sget(gv+lg,gw+lh)
if(kz!=lc) pset(bw+ln,bx+lo,ld or kz)
end
lg-=lk
lh+=lj
end
ll+=lj
lm+=lk
end
end
function di(lp,lq,lr,lt)
return abs(sqrt(((lp-lr)/1000)^2+((lq-lt)/1000)^2)*1000)
end
lu=3.14159
lv=.5*(lu/180)
function hw(gz,lw)
fz=lw-gz.dx
if fz>0.5 then
fz-=1
elseif fz<-0.5 then
fz+=1
end
if fz>lv then
gz.dx+=lv
elseif fz<-lv then
gz.dx-=lv
else
gz.dx=lw
end
if(gz.dx>lu) gz.dx-=2*lu
if(gz.dx<-lu) gz.dx+=2*lu
yield()
end
function ii(lx,ik,ly)
local lz=fget(fp(ik.bw,ik.bx),1) and 4 or 1
if(lx.bw!=ik.bw and lx.bx!=ik.bx) return lz+1
return lz
end
function ij(ik,ly)
local ma={}
for dp=-1,1 do
for dq=-1,1 do
if(dp!=0 or dq!=0) mb(ik.bw+dp,ik.bx+dq,ma)
end
end return ma
end
function mb(mc,md,me)
if(
not fget(fp(mc,md),0)
and bc[mc..","..md]==nil
and mc>=0
and md>=0
and mc<=63
and md<=63
)
then
add(me,{bw=mc,bx=md})
end
end
function ih(hv,mf)
return abs(hv.bw-mf.bw)+abs(hv.bx-mf.bx)
end
function ig
(mg,
mh,
mi,
mj,
ma,
mk,
ly)
local ml,
mm={
mn=mg,
mo=0,
mp=mi(mg,mh,ly)
},{}
mm[mk(mg,ly)]=ml
local mq,mr,ms,mt={ml},1,mk(mh,ly),32767.99
local count=0
while mr>0 do
local cost,mu=mt
for ct=1,mr do
local mv=mq[ct].mo+mq[ct].mp
if(mv<=cost) mu,cost=ct,mv
end
ml=mq[mu]
mq[mu],ml.mw=mq[mr],true
mr-=1
local mx=ml.mn
if mk(mx,ly)==ms then
mx={mh}
while ml.my do
ml=mm[mk(ml.my,ly)]
add(mx,ml.mn)
end
return mx
end
for mz in all(ma(mx,ly)) do
local id=mk(mz,ly)
local na,nb=
mm[id],
ml.mo+mj(mx,mz,ly)
if not na then
na={
mn=mz,
mo=mt,
mp=mi(mz,mh,ly)
}
mr+=1
mq[mr],mm[id]=na,na
end
if not na.mw and na.mo>nb then
na.mo,na.my=nb,mx
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) printh(">> assume unreachable!") return nil
end
end
end
nc={}
function fj(bw,bx,dx,ef,eg,nd,ne,cg,nf,kf)
local mx={
bw=bw,bx=bx,dx=dx,ef=ef,eg=eg,nd=nd,
cg=0,ne=ne or 0.0625,
nf=nf or{7,6,5},kf=kf or 0,
ng=bx,nh=cg or 8
}
add(nc,mx)
end
function hh()
for fx,mx in pairs(nc) do
mx.eg+=mx.ne
mx.bw+=mx.ef
mx.bx+=mx.eg
mx.dx+=mx.nd
mx.cg+=1
if(mx.cg>=mx.nh) del(nc,mx)
end
end
function is()
for fx,mx in pairs(nc) do
local fh=flr((#mx.nf/mx.nh)*mx.cg)+1
if(mx.kf) fillp(mx.kf)
circfill(mx.bw,mx.bx,mx.dx,mx.nf[fh])
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
ddddddddb7bbbb7bffffffffbb888b8bfff9ffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
d555555577bbbb77fff77fffb8899898ff66669ff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
d5555555bbbbbbbbff79ff7f8999998bf66dd66ff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
d5555555bbbbbbbbf79f779f889aa988f6d55d6ff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
d5555555bbbbbbbbfff799ffb89aa998f6d55d6ff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
d5555555bbbbbbbbff799fff899aa98bf66dd66ff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
d555555577bbbb77ff79ffff88999988ff6666fff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
d5555555b7bbbb7bf7ffffffb88898bbf9ffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000bbbbbbbb
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bbbbbbbbb
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbbbbbbbbb
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb0000b000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb07700077
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00777770
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb07700077
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb0000b000
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffbbbbbbbbbbb76bbbbbb76bbbb6bbb6bbb6bbb6bbffffffff
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbb0eee0bbffffffffffffffffbbbbbbbbbbb76bbbbbb76bbbb8bbb8bbb8bbb8bbffffffff
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbb0d6d0bbfd5ff5ffffffffffbbbbbbbbbbbddbbbb7b55b7bb2bbb2bbb2bbb2bbffffffff
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbbbc7cbbbf5dfffffffffffffbbbbbbbbbbd66dbbb651156bb0bbb0bb0b0b0b0bffffffff
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbb0c7c0bbffff555fffffffff77bbb77bbbd66dbbbdd66ddbbbb6bbbbbbb6bbbbffffffff
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbb0ccc0bbffff5d5fffffffffb7777711bbbddbbbb1b11b1bbbb8bbbbbbb8bbbbffffffff
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbb6b6bbbffff555fffffffff7711177bbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbbffffffff
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffb11bbb11bbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbffffffff
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
9fffff99999999ff9999999f99999ff999fffff9999f99999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
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
00000000000000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000
000000000000000000000000000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000
00000000000000000000000000000100000000fffffffffffffffffffffffffffffffffffffffffffffffffff66fffffffffff07770777077707070777077700
00000000000000000000000000000ff000000ff6fffffff6fffffff6ffffffffffffffffffffffffffffffff2277ffffffffff07070707070707070707070700
0000000000000000000000000000f1f1f1f1ffffffff6fffffff6fffffff6ffffffffffffffffffffffffff220877fffffffff07070707070707770707070700
0000000000000000000000000001ffff1f1ffffffffffffffffffffffffffffffffffffffffffffffffffff6886d76ffffffff07070707070700070707070700
000000000000000000000000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff578d786ffffffff07770777077700070777077700
00000000000000000000000001f1fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffff57d8d5ffffffff00000000000000000000000000
000000000000000000000000ff1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5685fffffffffffffff00000000000000000000
00000000000000000000001f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55fffffffffffffffff0000000000000000000
0000000000000100000000fffffffffffffffffffffffffffffffff6fff6ffddd776ddddddddddfffffffffffffffffffffffffffffff0000000000000000000
0000000000000ff000000ff6fffffff6fffffff6fffffff6fffffff8fff8ffd576d165d5577655fffffffffffffffffff77ffffff77100000000000000000000
000000000000f1f1f1f1ffffffff6fffffff6fffffff6fffffff6ff2fff2ffd76d1115d576d165ffffffffffffffffff79ff7fff791f00000000000000000000
000000000001ffff1f1ffffffffffffffffffffffffffffffffffff0fff0ffd66d1115d76d1115fffffffffffffffff79f779ff79f7100000000000000000000
00000000000f1ffffffffffffffffffffffffffffffffffffffffffff6ffffd66d0115d66d1115fffffffffffffffffff799fffff71900000000000000000000
0000000001f1fffffffffffff6fffffff6fffffff6fffffff6fffffff8ffffd66d0155d66d0115ffffffffffffffffff799fffff799100000000000000000000
00000000ff1ffffffffffffffffffffffffffffffffffffffffffffff2ffffd56dd555d66d0155ffffffffffffffffff79ffffff79ff00000000000000000000
0000001f1ffffffffffffffffffffffffffffffffffffffffffffffff0ffffd5555555d56dd555fffffffffffffffff7fffffff7fffff0000000000000000000
0000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffddddd776ddddddddfffffffffffffffffffffffffffffff0000000000000000000
00000000f77ffffffffffffffffffff6fffffff6fffffff6ffffffffffffffd55576d165555555fffffffffff77fffffffffffffff9100000000000000000000
0000000019ff7fffffffffffffffffffffff6fffffff6fffffff6fffffffffd5576d1115558055ffffffffff79ff7fffffffffffff1900000000000000000000
0000000091779fffffffffffffffffffffffffffffffffffffffffffffffffd5566d1115522055fffffffff79f779ffffffffffff99100000000000000000000
000000001799ffffffffffffffffffffffffffffffffffffffffffffffffffd5566d0115555055fffffffffff799ffffffffffffff1900000000000000000000
00000000719ffffffffffffffffffffff6fffffff6fffffff6ffffffffffffd5566d01d5555055ffffffffff799fffffffffffffff9100000000000000000000
0000000019ffffffffffffffffffffffffffffffffffffffffffffffffffffd5556dd5d5555555ffffffffff79fffffffffffffff99f00000000000000000000
00000007ffffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d5555555fffffffff7ffffffffffffffffff99f0000000000000000000
0000000ffffffffffffffffff00fffffffffffffffffffd199999999999999ddd776ddddddddddffffffffffffffffffffffff99f99999000000000000000000
00000000ffffffffffffffff22260ff6ffffffffffffffd494955949999249d576d165d5577655ffffffffffff9fffffffffff9f9999f9900000099000000990
000000001ffffffffffffff82d666fffffff6fffffffffd194255999229999d76d1115d576d165ffffffffffff9999ffffffff99ff999991f1919991f1919991
00000000f1ffffffffffff28666620ffffffffffffffffd495f5f4f4121419d66d1115d76d1115fffffffffff99f9ff9ffff9f99999f9999191f9999191f9999
000000001fffffffffffff2d776d20ffffffffffffffffd195656565999959d66d0115d66d1115fffffffffffff9f9ff99f999fff99999fff99999fff99999ff
00000000f1ffffffffffff87776225fff6ffffffffffffd499955555944959d66d0155d66d0115ffffffffffff9999999f99f999999f9999999f9999999f9999
000000001fffffffffffff5d7d885fffffffffffffffffd194958055944959d56dd555d66d0155fffffffffff99f9f9f99f99f99fff9f999fff9f999fff9f999
0000000ffffffffffffffff58225ffffffffffffffffffd499922055944959d5555555d56dd555ffffffffffff99f9f99f99f9ff9f9999ff9f9999ff9f9999ff
0000000fffffffffffffffff555fffffffffffffffffffd195594095999959ddddd776ddddddddffffffffffffffff99f9999999f9999999f99999ff9f999999
00000000ffffffffffffffffffffffffffffffffffffffd495594495977779d55576d165555555ffffffffffff9fff9f9999f99f9999f99f9999f999f998999f
000000001fffffffffffffffffffffffffffffffffffff9999529925777777d5576d1115558055ffffffffffff999999ff999999ff999999ff99999f9989f999
00000000f1ffffffffffffffffffffffffffffffffffff9429444444776666d5566d1115522055fffffffffff99f9f99999f9999999f9999999f9999f8889999
000000001fffffffffffffffffffffffffffffffffffff9999242424766666d5566d0115555055fffffffffffff9f9fff99999fff99999fff9999999998f99ff
00000000f1ffffffffffffffffffffffffffffffffffff944242424296666dd5566d01d5555055ffffffffffff999999999f9999999f9999999f99fff8999999
000000001fffffffffffffffffffffffffffffffffffff944242424294ddd2d5556dd5d5555555fffffffffff99f9f99fff9f999fff9f999fff9f999999f9999
0000000fffffffffffffffffffffffffffffffffffffffd555555555594425d5555555d5555555ffffffffffff99f9ff9f9999ff9f9999ff9f999999fff9f9ff
0000000fffffffffffffffffffffffffffffff55d555d555d555d55d555d5f55d555d5ffffffffffffffffffffffff9f99f9f999f9999999f9999999f9999999
00000000ffffffffffffffffffffffffffffff1555515515555155d515555115555155fffffffffffffffff002fffff99f99f99f9999f99f9999f99f9999f99f
000000001fffffffffffffffffffffffffffff5d55d5555d55d555155d55d55d55d555ffffffffffffffff20d28fff9f99f99f99ff999999ff999999ff999999
00000000f1ffffffffffffffffffffffffffff55515d5d55515d5d55d5155555515d5dfffffffffffffff2288222ff999f999999999f9999999f9999999f9999
000000001fffffffffffffffffffffffffffffd5555555d55555555555d55dd5555555ffffffffffffff008888d0fff9ffff9ffff99999fff99999fff99999ff
00000000f1ffffffffffffffffffffffffffff55d5155555d515555d155d5555d51555ffffffffffffff08888800ffffffffff99999f9999999f9999999f9999
000000001fffffffffffffffffffffffffffff15555515155555155555555115555515ffffffffffffff28888225ffffffffff99fff9f999fff9f999fff9f999
0000000fffffffffffffffffffffffffffffff555d5555555d55555155d55f555d5555ffffffffffffff5288025fffffffffffff9f9999ff9f9999ff9f9999ff
0000000fffffffffffffffffffffffffffffff55d555d555d555d555d555d55d555d5ffffffffffffffff52005ffffffffffffffffffffddddddddddddd66666
00000000fffffff11fffffffffffffffffffff155551551555515515555155d5155551ffffffffffffffff55577ffffff77fffffffffffd557755555555ddddd
000000001ffffff171ff6fffffffffffffffff5d55d5555d55d5555d55d555155d55d5ffffffffffffffffff79ff7fff79ff7fffffffffd566969666655ddddd
00000000f1fffff1771fffffffffffffffffff55515d5d55515d5d55515d5d55d51555fffffffffffffffff79f779ff79f779fffffffffd5ddadadddd55ddd5d
000000001ffffff17771ffffffffffffffffffd5555555d5555555d55555555555d55dfffffffffffffffffff799fffff799ffffffffff7777a7a711555ddddd
00000000f1fffff177771fffffffffffffffff55d5155555d5155555d515555d155d55ffffffffffffffffff799fffff799fffffffffff7d9d9d971155544d55
000000001ffffff17711ffffffffffffffffff15555515155555151555551555555551ffffffffffffffffff79ffffff79ffffffffffff7da76767115767dddd
0000000fffffffff11ffffffffffffffffffff555d5555555d5555555d55555155d55ffffffffffffffffff7fffffff7ffffffffffffff75776d675576667d5d
000000ffffffffffffffffffffffffffffffff1d515555d66dddddddd6fffdffffffffffffffffffffffffddd7778666666ddddddddddd75777777766767667d
00000ffffffffffffffffff6ffffffffffffff5155d55d76665555551ffff1fffffffffffffffffff77fff6667d22ddddd6576675555557d780777767767767d
71f17fffffffffffffffffffffff6fffffffff555d515576665805555f4441ffffffffffffffffff79ff7f6dd7dd0dd6666dddddd567657d220dddd666d66d75
1f179fffffffffffffffffffffffffffffffffd5555d55177d22055d5ffff1fffffffffffffffff79f779f6dd7660dd6dd611111ddddd57ddd0d777d66d6dd76
f799ffffffffffffffffffffffffffffffffff55d155d5d1d55505555f1011fffffffffffffffffff799ff6dd11666666d705501111115777757707dddddd77d
799ffffffffffffffffffffff6ffffffffffff155555556555550515df1001ffffffffffffffffff799fff6d7661111117705055421425ddddddd07777777776
79fffffffffffffffffffffffffffffffffffff51ffd5fd6d6d55555551005ffffffffffffffffff79ffff6d55d5dd6661100555425425d111d1d5ddddddddd7
ffffffffffffffffffffffffffffffffffffffffffffffd6d6d555d55d5555fffffffffffffffff7ffffff6ddd6ddd7111102555425425d5555555d1d1d1d1dd
fffffffffffffffffffffff28882ffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffff6d777777711110455542542555d555d555d555d555
f77ffffffffffff6ffffff0888880fffffffffffffffffd5555555155551555dfffd5ffffffffffff77fff6d7011111ddd644555555555155551551555515515
79ff7fffffffffffffff6f0828280fffffffffffffffffd555555a5d55d555d5155551ffffffffff79ff7f6770d1d11ddd7055555555555d55d5555555555555
9f779fffffffffffffffff2868682fffffffffffffffffd5aaa99a55515d5d155d55d5fffffffff79f779fddd0d1d11677705555555555555155555555555551
f799ffffffffffffffffff2262622fffffffffffffffffd5aaa55ad555555555d51555fffffffffff799ffddd0d1dd111115dddddd5555d55555555544444444
799ffffffffffffff6ffff2808082fffffffffffffffffd5a1199a55d515555555d55dffffffffff799fff0001d111111110555555555555d555444444444444
79ffffffffffffffffffff0088800fffffffffffffffffd544445a155555155d155d55ffffffffff79ffff00111ddd111115dddddd5555155554444444444444
ffffffffffffffffffffff5555555fffffffffffffffffd5151515555d555555555551fffffffff7ffffff011111111111105555555555555524444444444444
fffffffff00fffffffffffffffffffffffffffdddd666666dddddd1d515555ddddddddddd666dddddddddd55d555d51d51555555d555d555dd24444444444444
f77ffff026620ff6fffffff6fffffffff600ffd566ddddd61111105155d55dd5555555d5766665d5555555155551555155d55d15555155155024444444444444
79ff7ff286682fffffff6fffffff6ff66880ffd5dddd000066dd66555d5155d5556555d5766665d58888855d55d555555d51555d55d5555d5104444444444444
9f779ff2d66d2ffffffffffffffffff5887800d5dd0000001111ddd5555d55d5576655d5677725d555555555515d5dd5555d5555515d5d555112444444444444
f799fff867768fffffffffffffffffff088620d50000000066dd1055d155d5d55d7d55d566dd25d5522255d555555555d155d5d5555555d55510022241414244
799ffff867768ffff6fffffff6ffffff55d225d55555555511111015555555d55ddd55d566dd25d555555555d515551555555555d5155555d515100012121044
79fffff2d77d2fffffffffffffffffffff025fd551f6155566dd66f51ffd5fd555d555d556dd55d555255515555515f51ffd5f15555515155555151000000140
fffffff08dd80fffffffffffffffffffff55ffd550f605551111ddffffffffd5555555d5555555d5522255555d5555ffffffff555d5555555d55550000000000
fffffff555555fffffffffffffffffffffffffd555f655551d6d10ffffffffddd666ddddddddddddddddddfffffffffffffffff5d555d555d551d10000000000
f77ffffffffffffffffffff6ffffffffffffffd5516615551d6d10ffffffffd5766665d5555555d5522255ffffffffffffffff1555515d155151000000000000
79ff7fffffffffffffffffffffff6fffffffffd5505505551d6d10ffffffffd5766665d5556555d5552555ffffffffffffffff5d55d5515d1500000000000000
9f779fffffffffffffffffffffffffffffffffd5555555551d6d10ffffffffd5677725d5576655d5555555ffffffffffffffff55515d55515000000000000000
f799ffffffffffffffffffffffffffffffffffd55555555510d010ffffffffd566dd25d55d7d55d5522255ffffffffffffffffd55d5555d50000000000000000
799ffffffffffffffffffffff6ffffffffffffd555550f050aaa00ffffffffd566dd25d55ddd55d5555555ffffffffffffffff55d551d5150000000000000000
79ffffffffffffffffffffffffffffffffffffd55f0f5555555555ffffffffd556dd55d555d555d5888885ffffffffffffffff15555555100000000000000000
ffffffffffffffffffffffffffffffffffffffd555555555555555ffffffffd5555555d5555555d5555555fffffffffffffffff55d5515100000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddddddfffffffffffffffff5d551d1000000000000000000
f77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd555555555555555ffffffffffffffff15515100000000000000000000
79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd554777777777455ffffff222222222222222222222222222222222200
9f779fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd544ff7fff7ff445ffffff200777777770000000000000000000000200
f799ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd504777778617405ffffff200700888f70000000000000000000000200
799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd544ff7ff6d1f445ffffff20078f88ff70000000000000000000000200
79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd504777771177405ffffff2007ff118979000000000000000000000200
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd544ff7fff7ff445ffffff2007ff8d8771000000000000000000000200
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd504777777777405ffffff200788187175000000000000000000000200
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd544ff7fff7ff445ffffff2007ff181f70000000000000000000000200
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd542222222222245ffffff208777777770000000000000000000000200
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd528028020200225ffffff2077f0000000000000000000000000000200
fffffffffffffffffffffffffffffffff1f1fffff1f1ffffffffffffffffffffffffffd522022022200225ffffff200000000000000000000000000000000200
ffffffffffffffffffffffffffffffff1f1f1fff1f1f1fffffffffffffffffffffffffd551011011111115ffffff200000000000000000000000000000000200
fffffffffffffffffffffffffffffff000000ff000000fffffffffffffffffffffffffd555011011111155ffffff200000000000000000000000000000000200
ffffffffffffffffffffffffffffff0000000000000000ffffffffffffffffffffffffd555511111111555ffffff200000000000000000000000000000000200
fffffffffffffffffffffffffffff000000000000000000fffffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
fffffffffffffffffffffffffff100000000000000000000ffffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
ff000000000000fffffff000f000000000000000000000001fffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0088088808080000ffff080f08880808000000000000000f1ffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0800080808080080ffff0800080800080000000000000001fffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f080f088808080000ffff088808880080000000000000000f1ffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0800080008080080ffff0808000808000000000000000001fffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0088080500880000ffff08880f08080800000000000000fffffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0000000000000fffffff00000000000000000000000001f1fffffffffffffffffffffffffffffffffffffffffff200000000000000000000000000000000200
f0888088808880000ffff088808880808000000000000000ff1ffffff77ffffff77ffffffffffffff77ffffff77f200000000000000000000000000000000200
70888080008880080ffff00080008000800000000000000001f1ffff79ff7fff79ff7fffffffffff79ff7fff79ff200000000000000000000000000000000200
90808088008080000ffff088800880080000000000000000000f1ff79f779ff79f779ffffffffff79f779ff79f77200000000000000000000000000000000200
f0808080008080080ffff0800000808000000000000000000001fffff191fffff191fffff1f1fffff191fffff191200000000000000000000000000000000200
70808088808080000ffff0888088808080000000000000000000f1ff191f1fff191f1fff1f1f1fff191f1fff191f200000000000000000000000000000000200
70000000000000fffffff00000000000000000000000000000000ff000000ff000000ff000000ff000000ff00000200000000000000000000000000000000200
f0888088800880000ffff080f0888000000000000000000000000100000000000000000000000000000000000000200000000000000000000000000000000200
f0800080808000080ffff08000808000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
f0880088808880000ffff08880808000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
70800080000080080ffff08080808000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
90809080908800000ffff08880888000000000000000000000000000000000000000000000000000000000000000222222222222222222222222222222222200
f000f000f0000ffff1f1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
191f1fff191f1fff1f1f1f1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000202020202020000000200000000010101010101010101010101010000000000000101010000000001010101010101000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616000a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d0a420a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001200000000000a0a0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012121200001600000a0a0a0e0000121200650a0a00000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000d010a00001262090c0a0a0a0000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200163400000a0a0c00120a0a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001232161637600a0d440a0e0a0d0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016000a0a000a0a0a00000917191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000000000000000490a0000091d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000d0a0000000d0d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000003500360000000000000000000000000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000037000000000a0e0047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000360036000009171818190a0a0a490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003500350000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a4d0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
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

