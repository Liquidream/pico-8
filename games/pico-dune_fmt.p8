pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
cartdata("pn_undune2")
a,b,c,d=dget"0",dget"1",dget"2",dget"3"
e,f,g,i=dget"20",dget"21",dget"22",dget"23"
j={
shr(dget(6),16),
shr(500,16),
shr(dget(7),16),
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
bn=mid(1,bn+1,bq)
bi=bo.bp[bn]
bh=mid(bh+1,bq-2)
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
self.bu=8
self.bv={0}
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
cf=function()
cg"pick target"
ch=true
end
function cd(self,ci)
self.cj,self.ck=0,self.cb
if(self.cl>0 and self.ck>0) self.cc=not self.cc
self.cb=ci
end
cm=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1|nil|nil|||||||nil|1|||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1|nil|1|||||7|5|1|4|||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1|nil|1|||||6|6|1|1|||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1|nil|1|||||||7|4|||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1|nil|1|||||||1|1|||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174|2|3|2|1|nil|1|||||||1|1|||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1|nil|1|||||||1|2|||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1|nil|1|||||||6|2|||150|5|0|600|||||||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1|nil|1|||||11|3|7|2|||300|10|0|1200|||||||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1|nil|1|||||||7|2|||400|10|0|1600|||||||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1|nil|1|||||||6|2|||400|20|0|1400|||||||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1|nil|1|||||||6|3|||600|20|0|800|||||||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1|nil|1|||||||12|5|||500|35|0|1600|||||||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1|nil|1|||||||12|5|||700|20|0|800||||||4|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||7|5|||125|10|38|1200|0|4|1||||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||7|6|||250|20|112|1200|0|9|2||||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1|nil|1|||||11|3|6|6||1|500|50|0|2000|||||||tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1|nil|1|||||||12|5|||500|40|0|1600|||||||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1|nil|1|||||||17|8||1|999|80|0|4000|||||||tHIS IS YOUR pALACE.||||
20|lIGHT iNFANTRY (X3)|55|236|1|1|1|1|11|9|||||15|3|9|2|-3||60||4|200|0.05|2|1|1|56|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|55|194|1|1|1|1|11|10|||||||9|3|-1||100||8|440|0.1|3|1|1|56|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
22|fREMEN|55|236|1|1|1|1|11|||0|9|4|9|1||8|1||0||8|880|0.1|3|1|1|56|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
23|sABOTEUR|55|236|1|0.5|0.5|1|11|||0|1|0|13|1||8|2||0||150|160|0.4|0|1|1|56|10|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
24|sARDAUKAR|55|236|1|1|1|1|11|||0|14|2|14|2||4|||0||5|440|0.1|1|||||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
25|tRIKE|54|204|1|1|1|1|11|11|17||||15|4||2|||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
26|qUAD|48|206|1|1|1|1|11|11|17|||||||3|||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
27|cOMBAT tANK|51|196|1|1|1|1|11|12|17||||||7|4|||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
28|sIEGE tANK|50|198|1|1|1|1|11|12|17||||15|4|7|6|||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
29|rOCKET lAUNCHER|53|202|1|1|1|1|11|12|17||||15|4|7|5|||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
30|hARVESTER|49|192|1|1|1|1|11|12|17|||||||2|||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
31|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|13|5|||800||0|400|1|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|7|7|1||600||90|440|0.3|8|3||||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
35|dEVASTATOR|52|200|1|1|1|1|11|12|||||||13|8|3||800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
36|dEATH hAND|72||1|1|1|8|11|||0|||||13|8|3||0||150|280|0.5|0|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
37|rAIDER|54|204|1|1|1|1|11|11|||||12|1||2|2||150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
38|dEVIATOR|53|202|1|1|1|1|11|12|||||11|3|13|7|2||750||50|480|0.3|7|2||||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
39|sANDWORM|88||9|1|1|1|11|nil|||||||nil|3|||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19||5|1|1|1|11|nil|||||||nil||||||||||||||||draw_action||action_click
81|pICK TARGET|1||5|1|1|1|11|nil|||||||nil||||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
cn=bw(cm,"|","\n")
cm={}
for co=2,#cn-1 do
cp={}
for cq=1,#cn[co] do
local cr=cn[co][cq]
if(cq!=2 and cq<31) cr=tonum(cr)
if cq==31 then
cs,cr=bw(cr,"~"),""
for co=1,#cs do
cr=cr.."\n"..cs[co]
end
end
cp[cn[1][cq]]=cr
end
cm[tonum(cn[co][1])]=cp
end
for co=-2,66 do
bg[co]={}
for ct=-2,66 do
bg[co][ct]=0
end
end
cursor={
w=8,
h=8,
cu=function(self)
return{
cv=self.cv+(not cw and cx or 0)+2,
cy=self.cy+(not cw and cz or 0)+1,
w=1,
h=1
}
end,
da=function(self)
spr((bo and(bo.type==1 and bo.owner==1) or ch) and 1,
self.cv,self.cy,self.w/8,self.h/8)
end
}
for co=1,2 do
for db=0,31 do
for dc=0,127 do
local dd=nil
local de=mget(dc,db)
if co==1 and de==1 then
df,dg=dc*8,db*8
cx,cz,dd=df-56,dg-56,cm[1]
elseif co==2
and de>=48 then
for dh,di in pairs(cm) do
if(di.obj_spr!=nil and di.obj_spr==de) dd=di break
end
end
if dd!=nil then
local dj,dk=dc,db
if(dj>63) dk+=31 dj-=64
dl(dd,dj*8,dk*8)
if(dd.type==1 and dd.speed>0) mset(dc,db,0)
end
end
end
end
music"7"
dm=0
end
function dl(dd,cv,cy,owner,dn)
local dp=dq(dd,cv,cy,dd.type,nil,k[dd.func_init],k[dd.func_draw],k[dd.func_update],nil)
dp.dr,dp.cl=dq(dd,109,0,3,dp,nil,nil,k[dd.func_onclick]),ds and dd.hitpoint/2 or dd.hitpoint
dp.owner=dp.owner or owner or dt(cv,cy,df,dg)<75 and 1 or 2
dp.du,dp.bl=owner or dp.owner,{}
for di in all(cm) do
local dv=di.req_faction
if(di.parent_id!=nil and(di.parent_id==dp.id or di.dw==dp.id))
and(dv==nil
or(dv>0 and di.req_faction==b)
or(dv<0 and-b!=dv))
then
add(dp.bl,
dq(di,109,0,4,dp,nil,nil,function(self)
if br then
bo=self
else
cd(self,1)
end
end)
)
dp.bs=dp.bl[1]
end
end
if dp.owner==1 then
dp.dx,dp.col1,dp.col2=b,c,d
else
dp.dx,dp.col1,dp.col2,dp.dr.func_onclick=e,f,g,nil
if(dp.id==19) dy=dp
end
if dd.col1 then
dp.col1,dp.col2=dd.col1,dd.col2
end
if(dp.id==31) dp.owner=0
local dz,ea=flr(cv/8),flr(cy/8)
if dd.type==2 then
dp.eb=0
local ec=(dd.id==2 or dd.id==3)
for ed=0,dd.w-1 do
for ee=0,dd.h-1 do
ef(dz+ed,ea+ee,ec and 16 or dp.owner==1 and 149 or 27)
end
end
if(not ec) add(l,dp)
if dp.id==6 and dp.bk==nil then
local eg,eh=ei(dp,(dp.cv+32)/8,(dp.cy+8)/8,ej)
dl(cm[30],eg*8,eh*8,nil,dp)
end
end
if dd.type==1 then
if(dp.norotate!=1) dp.ek=flr(rnd"8")*.125
if dp.arms>0 then
dp.el=function(self)
self.em,self.en,self.eo,self.ep,self.eq=4,self.cv+4,self.cy+4,self.er.cv+self.er.w/2,self.er.cy+self.er.h/2
local es,et=self.ep-self.en,self.eq-self.eo
local eu=sqrt(es*es+et*et)
self.ev,self.ew=(es/eu)*2,(et/eu)*2
sfx(self.arms<50 and 60 or 58,3)
ex(self)
end
if(dp.id==15 or dp.id==16) ef(dz,ea,149)
else
dp.ey=dn
if(dp.id==30) dp.ez=0
end
add(m,dp)
fa(dp)
end
ex(dp)
return dp
end
function dq(fb,cv,cy,fc,bk,func_init,func_draw,func_onclick)
local fd={
fe=fb,
id=fb.id,
hitpoint=fb.hitpoint,
cv=cv,
cy=cy,
z=fb.z,
type=fc,
bk=bk,
func_onclick=func_onclick,
w=(fb.w or 1)*8,
h=(fb.h or 1)*8,
ff=fb.obj_spr,
fg=fb.w,
fh=fb.h,
cl=0,
fi=0,
cb=0,
fj=0,
eb=0,
fk=0,
fl=1,
by=1,
cu=function(self)
return{
cv=self.cv,
cy=self.cy,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
da=func_draw or function(self)
if self.type<=2
and(self.cv+self.w<cx
or self.cv>cx+127
or self.cy+self.h<cz
or self.cy>cz+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col and self.type<=2) palt(self.trans_col,true)
if(self.dx and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.ek then
if not self.fm or self.fm>.025 then
for co=1,2 do
if(co==2 or self.speed>0) fn(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cv,self.cy-(co==2 and self.z or 0),.25-self.ek,1,self.trans_col,co==1 and 5 or flr(self.fl)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
rectfill(self.cv-1,self.cy-1,self.cv+16,self.cy+19,0)
local fo=self.type==4 and self or self.bk
local fp=fo.hitpoint
local fq=self.cb==1 and 12 or fo.cl<fp*.33 and 8 or fo.cl<fp*.66 and 10 or 11
local cr=self.cb==1 and 15*(fo.cl/100) or 15*(fo.cl/fp)
if(fo.cl>0 and not br) rectfill(self.cv,self.cy+17,self.cv+cr,self.cy+18,fq)
pal(11,fo.fr) pal(3,fo.fs)
end
if self.type>2 then
spr(self.ico_spr,self.cv,self.cy,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
bz(self)
end
end
if self.en then
if self.fire_type==1 then
pset(self.en,self.eo,rnd"2"<1 and 8 or 9)
else
local ft=self.fire_type==2
fu(self.en,self.eo,0,
0,0,
ft and .15 or 2,
-.01,
ft and 20 or 2.5,
self.id==38 and{11} or ft and bw("7,7,10,9,8,2,13,6,7",",") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>24 and self.cl<self.hitpoint*.33 and rnd"10"<1) fu(self.cv+3.5,self.cy+3.5,1,.1,-.02,.05,-.002,80,bw("10,9,6,5",","),rnd"2"<1 and 0xa5a5.8 or 0)
self.fk=0
end,
fv=function(self)
local cl=self.cl
self.fl=max(self.fl-.4,1)
if self.fk>0 then
fw(true)
if(fx==0 or stat(24)>5) fx=1 music"0"
if(self.arms>0 and self.em==0) fy(self,self.fz)
if(self.obj_spr==55 and cl<100) self.fg,self.fh=0.5,0.5
if(cl<50 and self.em!=7) ga(self,r[self.du][14] or self.ey)
end
if(self.type<=2 and cl<=0 and self.fm==nil) self.em=5 self.gb=nil self.fm=(self.type==2 and 1 or .5) sfx(self.type==2 and 53 or 54,3) dm+=((self.type==2 or self.id==36) and 0.25 or 0)
if self.fm then
self.fm-=.025
if self.fm<=0 then
if self.type==2 then
for ed=0,self.fg-1 do
for ee=0,self.fh-1 do
ef(self.cv/8+ed,self.cy/8+ee,15)
end
end
del(l,self)
v[self.fz.du]+=1
else
local gc,gd=self:ge()
if(gd>31) gc+=64 gd-=32
if(gf(gc,gd)<9) ef(gc,gd,20)
if(self.speed==0) ef(gc,gd,15)
del(m,self)
if(self.fz) x[self.fz.du]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gg(self.cv+rnd(self.w),self.cy+rnd(self.h))
end
end
if self.framecount!=nil then
self.fi+=1
if self.fi>self.framecount then
self.fi=0
if self.altframe
and self.em==2 then
self.obj_spr=self.ff+(self.altframe-self.obj_spr)
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
if dt(
self.en,self.eo,
self.ep,self.eq)<2
then
gg(self.en,self.eo,self.fire_type)
local er=self.er
if dt(
self.en,self.eo,
er.cv+er.w/2,
er.cy+er.h/2)<4
then
er.cl-=self.arms
er.fk,er.fz=self.fire_type,self
if self.id==38 and er.speed!=nil then
er.owner,er.dx,er.col1,er.col2=self.owner,self.dx,self.col1,self.col2
fa(self)
elseif er.gh then
er.dx,er.col1,er.col2,er.gh=er.gh,er.gi,er.gj,nil
fa(er)
end
end
self.en=nil
end
end
if self.cb>0
and not self.cc
and not self.gk then
if self.cb==1 and self.fj>self.cost then
self.gk=true
if(self.owner==1) sfx"56"
if self.fe.type==1
and self.parent_id!=1 then
local eg,eh=gl(self,self.bk)
dl(self.fe,eg,eh,nil,self.bk)
gm(self)
end
elseif self.cb==2 and cl>self.hitpoint then
self.cb=0
if self.type==1 and self.speed>0 then
k.init_repairfact(self.gn)
self.em=0
self.cv,self.cy=gl(self,self.ey)
end
else
if self.cj>(self.cb==1 and 3 or 100) then
if(go(-1,self.cb==1 and self.bk or self)) self.cj=0 self.fj+=1
else
self.cj+=1
self.cl=(self.cb==1 and(self.fj/self.cost)*100 or cl+.5)
end
end
end
if self.eb>0 then
self.eb-=.1
end
end,
gp=function(self,cv,cy)
self.cv,self.cy=cv,cy
end,
gq=function(self)
local cv,cy=self:ge()
return cv..","..cy
end,
ge=function(self)
return flr(self.cv/8),flr(self.cy/8)
end
}
for gr,gs in pairs(fb) do
if fd[gr]==nil and gs!=""then
fd[gr]=gs
end
end
if(func_init) func_init(fd)
return fd
end
function go(gt,fd)
if(gu(j[fd.owner])+gt<0) return false
j[fd.owner]+=sgn(gt)*shr(abs(gt),16)
if(fd.owner==1) sfx"63"
return true
end
function gg(cv,cy,gv)
fu(cv,cy,2,
0,0,.1,0,gv==1 and 5 or 30,bw("5,7,10,8,9,2",","),rnd"2"<1 and 0xa5a5.8 or 0)
end
function ex(gw)
if(gw.owner!=1 and gw.em!=4) return
local gx=gw.type==2 and 3 or 2
for ed=-gx,gx do
for ee=-gx,gx do
local gy,gz=flr(gw.cv/8)+ed,flr(gw.cy/8)+ee
bg[gy][gz]=16
ha(gy,gz)
for et=-1,1 do
for es=-1,1 do
ha(gy+es,gz+et)
end
end
end
end
end
function _update60()
hb()
if(not br) hc()
if u%60==0 then
o={}
if bb then
for co=0,124,4 do
for ct=0,124,4 do
local dc,db=co/2,ct/2
if(db>=32) dc+=64 db-=32
local hd=mget(dc,db)
local fq=sget((hd*8)%128+4,(hd*8)/16)
if(bg[co/2][ct/2]==16) o[(co/2/2)..","..(ct/2/2)]=fq!=11 and fq or 15
end
end
end
he,hf,hg,hh=0,0,false,{0,0}
for dh,hi in pairs(l) do
local gy,gz=hi:ge()
if hi.owner==1 or(bb and bg[gy][gz]==16) then
o[flr(hi.cv/2/8)..","..flr(hi.cy/2/8)]=hi.col1
end
if hi.owner==1 then
he-=hi.power
if(hi.id==7) hg=true
if(sub(hi.name,1,5)=="sPICE") hf+=1000
end
hh[hi.owner]+=1
r[hi.du][hi.id]=hi
end
if bb then
for dh,hj in pairs(m) do
if hj.owner==1 or bg[flr(hj.cv/8)][flr(hj.cy/8)]==16 then
o[flr(hj.cv/2/8)..","..flr(hj.cy/2/8)]=hj.col1
end
r[hj.du][hj.id]=hj
end
end
bb,fx=(hg and he>0),2
fw(false)
if(j[3]>0 and j[1]>j[3]) hk=1
if(hh[2]==0 and a>1) hk=2
if(hh[1]==0) hk=3
if hk then
dset(14,hk)
dset(13,t()-s)
dset(10,hl)
dset(24,gu(j[2]))
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
for gr,hj in pairs(m) do
n[hj:gq()]=gr
end
end
u+=1
end
function _draw()
hm()
hn()
end
function ha(cv,cy)
if(cv<0 or cv>#bg or cy<0 or cy>#bg) return
local ho=0
if bg[cv][cy]!=0 then
if(bg[cv][cy-1]>0) ho+=1
if(bg[cv-1][cy]>0) ho+=2
if(bg[cv+1][cy]>0) ho+=4
if(bg[cv][cy+1]>0) ho+=8
bg[cv][cy]=1+ho
end
end
function hb()
hp,hq,hr=stat"32",stat"33",stat"34"
hs,ht,hu=(hr==1 and hv!=hr) or btnp"4",(hr>0) or btn"4",(hr==2 and hv!=hr) or btnp"5"
for gr=0,1 do
if(btn(gr)) y+=gr*2-1
if(btn(gr+2)) ba+=gr*2-1
if(btn(4,1)) stop("paused")
end
hw,hx=mid(0,hp+y,127),mid(0,hq+ba,127)
cursor.cv,cursor.cy=hw,hx
if not br then
if(hw<4) cx-=2
if(hw>123) cx+=2
if(hx<4) cz-=2
if(hx>123) cz+=2
cx,cz=mid(cx,384),mid(-8,cz,384)
for dh,hj in pairs(m) do
if hj then
if hj.gb and costatus(hj.gb)!="dead"then
assert(coresume(hj.gb,hj))
else
hj.gb=nil
end
if hy
and fget(gf(hj:ge()),2)
and dt(hz,ia,hj.cv,hj.cy)<1
and hj.z==1
then
del(m,hj)
ib=.01
end
end
end
for gr,ic in pairs(q) do
ic.et+=ic.ie
ic.cv+=ic.es
ic.cy+=ic.et
ic.ek+=ic.ig
ic.cl+=1
if(ic.cl>=ic.ih) del(q,ic)
end
end
ii()
hv,ce,bt=hr,bo,bi
end
function ij(cv,cy)
local cr=gf(cv,cy)
return cr>=2 and cr<=8
end
function fa(hj,ik)
hj.em,hj.il=ik or 0,nil
hj.gb=cocreate(function(self)
while true do
if rnd"500"<1 and self.arms>0 and self.em!=8 then
ei(self,flr(self.cv/8),flr(self.cy/8),
function(hj,cv,cy)
local er=m[n[cv..","..cy]]
if(er!=im and er.du!=hj.du and bg[cv][cy]==16 and er.z==1) fy(hj,er) return true
end,
self.range)
end
local ey=self.gn or self.ey
if self.id==31 then
io(self,flr(rnd"64"),flr(rnd"64"))
end
if self.id==30 then
if self.em==0 or self.em==9 then
if self.ez<=1500
and self.em!=7 and self.em!=9 then
self.gn=nil
local ip,iq
local ir,is=self:ge()
if ij(ir,is) and not self.it then
ip,iq=ir,is
else
ei(self,ir,is,
function(hj,cv,cy)
if ij(cv,cy) and rnd"10"<1 then
ip,iq=cv,cy
return true
end
end,
10)
end
if ip and iq then
io(hj,ip,iq)
if(ij(hj:ge())) hj.em=6
end
end
elseif self.ez>=15
and self.em!=7 then
self.ip,self.iq=self:ge()
ga(self,ey or r[hj.du][6])
elseif self.em==6 then
self.it=false
iu(hj.cv,hj.cy,hj.ek+.75+rnd".2"-.1)
local iv=hj:gq()
p[iv],self.ez=(p[iv] or 1000)-1,(self.ez or 0)+.5
if p[iv]<=0 then
local dz,ea=self:ge()
for ee=-1,1 do
for ed=-1,1 do
cr=gf(dz+ed,ea+ee)
ef(dz+ed,ea+ee,
(ed==0 and ee==0) and 0 or((cr>1 and cr<8) and 8 or cr)
)
end
end
self.em=0
end
if(self.ez%300==0) self.it=true self.em=0
end
end
if self.id>24 then
if self.em==9 then
if ey.cl>0 and not ey.iw and self.cl>0 then
ey.bx,self.em,self.ek,self.cv,self.cy=false,8,.25,ey.cv+16,ey.cy+4
if(bo==self) bo=nil
if self.ez and ey.id==6 then
ey.iw=true
while self.ez>0 do
self.ez-=1
if(flr(self.ez)%4==0 and tonum(hl)<hf) go(2,self)
yield()
end
self.ez,ey.iw,self.em=0,false,0
if(self.ip) io(self,self.ip,self.iq,0,true)
else
self.cb,self.cj,ey.bu,ey.bv=2,0,8,bw("7,10,0,0,7,0,0",",")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function gl(fd,er)
local eg,eh=ei(fd,(er.cv+8)/8,(er.cy+16)/8,ej)
return eg*8,eh*8
end
function iu(cv,cy,ek)
local ix,iy=sin(ek)*5.5,-cos(ek)*5.5
if(rnd"5"<1) fu(cv+ix+3.5,cy+iy+3.5,rnd"2",.15,0,.1,-.01,25,bw("2,4,9,15",","),0xa5a5.8)
end
function fy(hj,er)
if hj.id!=19 then
hj.em,hj.er=3,er
hj.gb=cocreate(function(self)
while er.cl>0 do
local iz=dt(hj.cv,hj.cy,er.cv,er.cy)
if iz>hj.range*5
and hj.speed>0 then
io(hj,flr(er.cv/8),flr(er.cy/8),hj.range*5)
if hj.id==23 or hj.id==36 then
hj.cl=0
for co=1,hj.id/3 do
gg(hj.cv+rnd"32"-16,hj.cy+rnd"32"-16,2)
end
er.cl-=(100+rnd"50")
er.fz=hj
return
end
end
if not hj.norotate then
local ja=atan2(hj.cv-er.cv,hj.cy-er.cy)
while(hj.ek!=ja) do
jb(hj,ja)
end
end
if iz<=hj.range*5 then
if(hj.eb<=0 and not hj.en) hj.el(hj) hj.eb=hj.arms/4
elseif hj.speed==0 then
fa(hj)
end
yield()
if(hj.id==38 or er.dx==hj.dx) break
end
fa(self)
end)
else
local jc={22,23,36,36}
fy(dl(cm[jc[hj.dx]],hj.cv,hj.cy,hj.owner),er)
hj.eb=1750
end
end
function ei(hj,cv,cy,jd,je)
for dt=1,je or 64 do
for ed=cv-dt,cv+dt do
for ee=cy-dt,cy+dt do
if((ed==cv-dt or ed==cv+dt or ee==cy-dt or ee==cy+dt) and(jd(hj,ed,ee))) return ed,ee
end
end
yield()
end
end
function gf(dc,db)
if(db>31) dc+=64 db-=32
return mget(dc,db)
end
function ef(dc,db,jf)
if(db>31) dc+=64 db-=32
mset(dc,db,jf)
end
function ej(hj,cv,cy)
return not fget(gf(cv,cy),0)
and n[cv..","..cy]==nil
end
function io(hj,cv,cy,jg,jh,ik)
local ji=hj.z>1
if jh then
local jj=r and r[hj.du][31] or false
if jj and not jj.il then
jj.il,hj.il=hj,jj
jj.gb=cocreate(function(jk)
io(jk,flr(hj.cv/8),flr(hj.cy/8))
del(m,hj)
io(jj,cv,cy)
hj:gp(jj.cv,jj.cy)
add(m,hj)
fa(jj)
fa(hj,ik)
end)
return
end
end
::restart_move_unit::
if not ji and not ej(nil,cv,cy) then
cv,cy=ei(hj,cv,cy,ej)
end
hj.ir,hj.is,hj.jl,hj.em=cv,cy,hj.em,1
hj.jm=nil
local jn,jo,jp={cv=flr(hj.cv/8),cy=flr(hj.cy/8)},{cv=hj.ir,cy=hj.is},function(jq) return shl(jq.cy,8)+jq.cv end
local jr,
js={
jt=jn,
ju=0,
jv=jw(jn,jo)
},{}
js[jp(jn)]=jr
local jx,jy,jz,ka,count={jr},1,jp(jo),32767.99,0
while jy>0 do
local cost,kb=ka
for co=1,jy do
local kc=jx[co].ju+jx[co].jv
if(kc<=cost) kb,cost=co,kc
end
jr=jx[kb]
jx[kb],jr.kd=jx[jy],true
jy-=1
local ic=jr.jt
if jp(ic)==jz then
ic={jo}
while jr.ke do
jr=js[jp(jr.ke)]
add(ic,jr.jt)
end
hj.jm=ic
goto end_pathfinding
end
for kf in all(kg(ic,ji)) do
local id=jp(kf)
local kh=not ji and fget(gf(kf.cv,kf.cy),1) and 4 or 1
if(ic.cv!=kf.cv and ic.cy!=kf.cy) kh+=.2
local ki,kj=
js[id],
jr.ju+kh
if not ki then
ki={
jt=kf,
ju=ka,
jv=jw(kf,jo)
}
jy+=1
jx[jy],js[id]=ki,ki
end
if not ki.kd and ki.ju>kj then
ki.ju,ki.ke=kj,ic
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
hj.jl,hj.em=hj.em,2
if hj.jm!=nil then
for co=#hj.jm-1,1,-1 do
local jq=hj.jm[co]
if not hj.norotate then
local ja=atan2(
hj.cv-(jq.cv*8),
hj.cy-(jq.cy*8))
while(hj.ek!=ja) do
jb(hj,ja)
end
end
if(not ji and not ej(nil,jq.cv,jq.cy)) goto restart_move_unit
local kk,kl=hj.speed or .5,sqrt((jq.cv*8-hj.cv)^2+(jq.cy*8-hj.cy)^2)
local km,kn=kk*(jq.cv*8-hj.cv)/kl,kk*(jq.cy*8-hj.cy)/kl
for co=0,kl/kk-1 do
n[jq.cv..","..jq.cy]=hj
hj.cv+=km
hj.cy+=kn
yield()
end
hj.cv,hj.cy,n[jq.cv..","..jq.cy]=jq.cv*8,jq.cy*8,hj
ex(hj)
if(dt(hj.cv,hj.cy,hj.ir*8,hj.is*8)<=(jg or 0)) break
end
end
hj.em=0
end
function hm()
cls"15"
camera(cx+(16-rnd"32")*dm,cz+(16-rnd"32")*dm)
dm=(dm>0.05) and dm*0.95 or 0
if hy then
for co=1,#hy do
if(co%2==1) fillp(0xa5a5.8)
circfill(
hy[co][1]+4,
hy[co][2]+4,4,
ko[co%#ko+1])
fillp()
end
if(ib>0) spr(88+ib,hz,ia)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for dh,hi in pairs(l) do
if not br then
hi:fv()
if(hi.bs) hi.bs:fv()
end
hi:da()
if(hi==bo) rect(bo.cv,bo.cy,bo.cv+bo.w-1,bo.cy+bo.h-1,7)
end
pal()
for ic=1,2 do
for dh,hj in pairs(m) do
if(ic==1 and hj.z==1) or(ic==2 and hj.z>1) then
if(not br) hj:fv()
if(hj.cb!=2 or hj.speed==0) hj:da()
if(hj==bo) spr(17,bo.cv,bo.cy)
end
end
end
for gr,ic in pairs(q) do
if(ic.kp) fillp(ic.kp)
circfill(ic.cv,ic.cy,ic.ek,ic.kq[flr((#ic.kq/ic.ih)*ic.cl)+1])
fillp()
end
local kr,ks=flr(cx/8),flr(cz/8)
palt(0,false)
palt(11,true)
for ed=kr-1,kr+16 do
for ee=ks-1,ks+16 do
if bg[ed][ee]!=0 and bg[ed][ee]!=16 then
spr(bg[ed][ee]+31,ed*8,ee*8)
elseif bg[ed][ee]<16 then
rectfill(ed*8,ee*8,ed*8+7,ee*8+7,0)
end
end
end
end
function cg(kt)
be,bf=kt,500
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
hl=gu(j[1])
? sub("000000",#hl+1)..hl,103,2,d
if bb!=bd then
bc,ku=bb and 1 or 59,bb and 1 or-1
sfx"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=ku
clip(
max(108-bc,91),
max(108-(bc>20 and bc-20 or 0),91),
min(bc*2,33),
min((bc>20 and bc-20 or 1)*2,33))
for co=1,300 do
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
local ix,iy=92+cx/16,92+cz/16
rect(ix,iy,ix+7,iy+7,7)
if bo and bo.dr then
bo.dr:gp(109,20)
bo.dr:da()
if bo.bs and bo.owner==1 then
bo.bs:gp(109,44)
bo.bs:da()
end
kv=nil
if bo.cl<bo.hitpoint
and bo.owner==1
and bo.id!=4
and(bo.type==2
or bo.speed==0) then
kv=dq(cm[80],117,28,5,{},nil,ca,repair_click)
kv:da()
end
kw=nil
if bo.id==19
and bo.eb<=0 then
kw=dq(cm[81],109,29,5,{},nil,ca,cf)
kw:da()
end
end
pal()
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.speed==0)
and bo.bs.cl>=100 then
local kx,ky=flr((cursor.cv+cx)/8),flr((cursor.cy+cz)/8)
local kz,la,w,h=kx*8-cx,ky*8-cz,bo.bs.fg,bo.bs.fh
lb,lc,ds=false,false,false
for ed=-1,w do
for ee=-1,h do
if ed==-1 or ed==w or ee==-1 or ee==h then
if(gf(kx+ed,ky+ee)==16 or gf(kx+ed,ky+ee)>=58) lb=true
else
local cr=gf(kx+ed,ky+ee)
if(cr>=9 and cr<=15) ds=true
if(n[kx+ed..","..ky+ee] or cr==0 or cr<8 or cr>16) lc=true
end
end
end
if(lc) lb=false
fillp("0b1110110110110111.1")
rectfill(kz,la,
kz+bo.bs.w,la+bo.bs.h,lb and 11 or 8)
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
local ld=1
for co=1,#bo.bl do
local le=bo.bl[co]
if le.req_id==nil
or r[bo.du][le.req_id]
then
bo.bp[ld]=le
if ld>=bh and ld<=bh+2 then
le:gp(9,28+(ld-bh)*19)
le:da()
else
le:gp(-16,16)
end
if bi==le then
bn=ld
rect(le.cv-2,le.cy-2,
le.cv+17,le.cy+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,39,6
end
ld+=1
end
end
end
for dh,lf in pairs(bj) do
lf:da()
end
end
palt(11,true)
cursor:da()
end
function bm(cv,cy,lg,func_onclick,lh)
add(bj,{
cv=cv,
cy=cy,
w=lh or#lg*4+2,
h=8,
lg=lg,
cu=function(self)
return self
end,
da=function(self)
if(#lg>1) rectfill(self.cv,self.cy,self.cv+self.w,self.cy+self.h,self.li and 12 or 6)
? self.lg,self.cv+2,self.cy+2,(#lg>1) and 0 or(self.li and 12 or 6)
end,
func_onclick=func_onclick
})
end
function bz(fd)
spr(fd.obj_spr,fd.cv,fd.cy,fd.fg,fd.fh)
end
function ii()
lj=false
if bo then
cw=true
lk(kv)
lk(kw)
if(bo.dr and not br and not lj) lk(bo.dr)
foreach(bo.bl,lk)
if(br) foreach(bj,lk)
cw=false
end
if not br
and not lj then
foreach(m,lk)
foreach(l,lk)
end
if ht
and not br
and hw>89 and hw<122
and hx>90 and hx<123 then
cx,cz=mid(0,(hw-94)*16,400),mid(-8,(hx-94)*16,400)
bo=ce
elseif hs then
ch=false
if(bo) cg(bo.name)
if lj then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=ce return
if(br and bi.lg and bi.func_onclick) bi:func_onclick()
if(bo.owner==1 and bo.type==1 and bo!=ce and bo.speed>0) sfx"62"
if(bo.owner==2 and ce and(ce.type==1 or ce.id==19) and ce.owner==1) bo.fl=10 fy(ce,bo) bo=nil r={{},{}}
else
if bo
and bo.type==1
and bo.owner==1
and bo.speed>0
and bo.em!=7 then
bo.gb=cocreate(function(hj)
io(hj,flr((cx+hw)/8),flr((cz+hx)/8))
fa(hj)
end)
end
if bo
and bo.bs
and bo.bs.cl>=100
and lb then
local dd=bo.bs.fe
dl(dd,
flr((cursor.cv+cx)/8)*8,
flr((cursor.cy+cz)/8)*8,1)
gm(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
elseif hu and not br then
bo,ch=nil,false
end
end
function gm(fd)
fd.cl,fd.cb,fd.fj,fd.gk=0,0,0,false
end
function lk(fd)
if(fd==nil) return
local ll,lm=cursor:cu(),fd:cu()
fd.li=ll.cv<lm.cv+lm.w and
ll.cv+ll.w>lm.cv and
ll.cy<lm.cy+lm.h and
ll.cy+ll.h>lm.cy
if hs and fd.li then
if br then
bi=fd
else
if(fd.type<=2 and bg[flr((cursor.cv+cx)/8)][flr((cursor.cy+cz)/8)]!=16 or fd.em==8) return
if bo
and(fd.id==6 and bo.id==30
or fd.id==14 and bo.id>24)
and fd.owner==1
then
ga(bo,fd)
return
else
bo=fd
end
end
lj=true
end
end
function ga(hj,ln)
ln=ln or r[hj.du][1]
hj.em,ln.bx,hj.gn=7,true,ln
if(hj.id!=30 or ln.id==6) hj.ey=ln
hj.gb=cocreate(function(hj)
io(hj,(ln.cv+16)/8,ln.cy/8,0,true,9)
if(hj.il==nil) fa(hj,9)
end)
end
lo=0
function hc()
if t()>i and t()%i*2==0 then
local lp=rnd(m)
if lp.owner==2 and lp.arms>0 and lp.em==0 then
lq=(rnd"2"<1) and rnd(m) or rnd(l)
if(lq and lq.owner==1 or lq.du==1) fy(lp,lq)
end
local lr=rnd(l)
if lr.owner==2 then
if lr.bs and lr.bs.fe.type==1 and lr.bs.cb!=1 then
local lt=rnd(lr.bl)
lr.bs=lt
lt:func_onclick()
end
if lr.cl<lr.hitpoint and lr.cb!=2 then
cd(lr,2)
end
end
if lq and lq.owner==1 and lq.type==2
and dy and dy.eb<=0 then
fy(dy,lq)
end
end
lo-=1
if lo<0 then
if hy then
hy=nil
else
hy,lu,lv,ko,ib={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lw=rnd"5000"
lo=lw
end
if hy then
if(u%6<1 or#hy<30) and ib==0 then
while#hy<31 do
if(rnd"9"<.5) lv=rnd".04"-.02
hz,ia=hy[#hy][1],hy[#hy][2]
add(hy,{hz+sin(lu),ia-cos(lu)})
lu+=lv
end
end
if(#hy>30) del(hy,hy[1])
if(ib>0) ib+=.01 iu(hz,ia,rnd"1")
if(ib>2) ib=0
end
end
function fw(lx)
local cr=peek(0x3115)
if((band(cr,128)>0)!=lx) cr=bxor(cr,128)
poke(0x3115,cr)
end
function gu(cr)
local ly,gs="",abs(cr)
repeat
ly=(gs%0x0.000a/0x.0001)..ly
gs/=10
until gs==0
if(cr<0) ly="-"..ly
return ly
end
function bw(lz,eu,ma)
local ja,ly,mb={},"",""
if(ma~=nil) lz=bw(lz,ma)
while#lz>0 do
if type(lz)=="table"then
ly=lz[1]
add(ja,bw(ly,eu))
del(lz,ly)
else
ly,lz=sub(lz,1,1),sub(lz,2)
if ly==eu then
add(ja,mb)
mb=""
else
mb=mb..ly
end
end
end
add(ja,mb)
return ja
end
function fn(ip,iq,cv,cy,ja,w,mc,md)
local me,mf=cos(ja),sin(ja)
local mg,mh,ho=me,mf,shl(0xfff8,(w-1))
w*=4
me*=w-0.5
mf*=w-0.5
local mi,mj,w=mf-me+w,-me-mf+w,2*w-1
for mk=0,w do
local ml,mm=mi,mj
for mn=0,w do
if band(bor(ml,mm),ho)==0 then
local mo=sget(ip+ml,iq+mm)
if(mo!=mc) pset(cv+mk,cy+mn,md or mo)
end
ml-=mh
mm+=mg
end
mi+=mg
mj+=mh
end
end
function dt(mp,mq,mr,ms)
return abs(sqrt(((mp-mr)/1000)^2+((mq-ms)/1000)^2)*1000)
end
function jb(hj,mt)
local gt=mt-hj.ek
if(hj.z>1) hj.ek=mt
if gt>0.5 then
gt-=1
elseif gt<-0.5 then
gt+=1
end
if gt>0.0087 then
hj.ek+=0.0087
elseif gt<-0.0087 then
hj.ek-=0.0087
else
hj.ek=mt
end
yield()
end
function kg(jq,ji)
local mu={}
for ed=-1,1 do
for ee=-1,1 do
if(ed!=0 or ee!=0) mv(jq.cv+ed,jq.cy+ee,mu,ji)
end
end
return mu
end
function mv(mw,mx,my,ji)
if(ji or not fget(gf(mw,mx),0) and n[mw..","..mx]==nil and mw>=0 and mx>=0 and mw<=63 and mx<=63) add(my,{cv=mw,cy=mx})
end
function jw(ja,mz)
return abs(ja.cv-mz.cv)+abs(ja.cy-mz.cy)
end
function fu(cv,cy,ek,es,et,ig,ie,cl,kq,kp)
local ic={
cv=cv,cy=cy,ek=ek,es=es,et=et,ig=ig,
cl=0,ie=ie,
kq=kq,kp=kp,
na=cy,ih=cl
}
add(q,ic)
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
ddddddddddddddddffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
d5ddddd5d5ddddd5ffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
d55ddd55d55ddd55ffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
d555d555d555d555ffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
d5551555d5551555ff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
d5511155d5511155ff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
d5111115d5111115ff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
d1111111d1111111f7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
ddddddddddddddddf7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
d5ddddd5d5ddddd5f76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
d55ddd55d55ddd55fddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
d555d555d555d555ffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
d5551555d5551555fffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
d5511155d5511155fffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
d5111115d5111115fffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
d1111111d1111111ffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
ccccccccccccccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccccccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccddddddddddddddddccccccccccccccccddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550ccdddddddd7773330dcccc2888887660ccdd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccddddd4bbbb75550dccc288888887ccccddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7cdd45444444444dddcc5225222222287cdd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cd54bbbbbbbbbbb5dc55588888888855cd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
916666d001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950360000000635995000005999300095061052995061059
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999ffccccccccccc99f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
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
0101010101010000000001010000000001010101010100000000010100000000010100000000000001010000000000000101000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
0000000000000000001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
121212000000001616161600420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000160085850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212003a10100c830a85420a6c0a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212001010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d0a800e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120000160009010a0000440a090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200160047850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000121200000057850d850a6a0a0a85001d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850d0d850e000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000004900000000000000000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120035360000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000303030000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000303030000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000c090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121200008000000000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000040090a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a0a1e1b1b1b1c0a0a00000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000003600000d0a0a0a0a1a1b1c1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a0a0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000000000000000090a0a0a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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

