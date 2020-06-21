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
br,bo.bs=nil,bt
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
pal()
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
l.init_repairfact=function(self)
self.bu=8
self.bv={0}
end
cc=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bo.cd==2 and not bo.ce) pal(7,11)
spr(self.obj_spr,self.ca,self.cb)
pal()
end
repair_click=function(self)
cf(cg,2)
end
ch=function(self)
ci("pick target")
cj=true
end
function cf(self,ck)
self.cl=0
self.cm=self.cd
if(self.cn>0 and self.cm>0) self.ce=not self.ce
self.cd=ck
end
co=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|parent2_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170||2|2|2|nil|nil||nil|1||100|0|0|1600|||||||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162||2|2|2|nil|1||1|4||20|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|160||2|1|1|nil|1||1|1||5|0|0|0|||||||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164||2|1|1|nil|1||7|4||50|0|0|200|||||||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172||2|2|2|nil|1||1|1||300|-100|0|800||||||10|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174||2|3|2|nil|1||1|1||400|30|0|1800||||||10|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136||2|2|2|nil|1||1|2||400|30|0|2000|||||||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
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
19|pALACE|55|226||2|3|3|nil|1||17|8||999|80|0|4000|||||||tHIS IS YOUR pALACE.||||
20|lIGHT iNFANTRY (X3)|62|236||1|1|1|11|9||9|2|-3|60||4|200|0.05|2|1|1|63|10|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|62|194||1|1|1|11|10||9|3|-1|100||8|440|0.1|3|1|1|63|10|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
22|tRIKE|54|204||1|1|1|11|11|17||2||150||8|400|0.6|3|1||||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
23|qUAD|48|206||1|1|1|11|11|17||3||200||10|520|0.5|3|1||||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|17|7|4||300||38|800|0.25|4|1||||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|17|7|6||600||45|1200|0.2|5|1||||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|17|7|5||450||112|400|0.3|9|2||||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12|17||2||300||0|600|0.1|0|||||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO THE~rEFINERY FOR PROCESSING.||||
28|cARRYALL|61|238||1|1|1|11|13||13|5||800||0|400|2|0|||||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
32|fREMEN (X3)|62|||1|1|1|11||||8|1|0||8|880|0.1|3|1|1|63|10|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12||13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
34|dEATH hAND|78|||1|1|1|11|||13|8|3|0||150|280|0.5|0|20||||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
35|rAIDER|54|204||1|1|1|11|11|||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
37|sABOTEUR|-1|||1|1|1|11||||8|2|0||150|160|0.4|2|||||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
39|sANDWORM|94|||9|1|1|11|nil||nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|11|nil||nil|||||||||||||||draw_action||action_click
81|pICK TARGET|1|||5|1|1|11|nil||nil|||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
cp()
cq=cr(co[80],109,-20,5,{},nil,cc,repair_click)
cs=cr(co[81],100,-20,5,{},nil,cc,ch)
ct()
cursor={
w=8,
h=8,
cu=function(self)
return{
ca=self.ca+(not cv and cw or 0)+2,
cb=self.cb+(not cv and cx or 0)+1,
w=1,
h=1
}
end,
cy=function(self)
spr((bo and(bo.type==1 and bo.cz==1) or cj) and 1 or 0,
self.ca,self.cb,self.w/8,self.h/8)
end
}
da()
music"7"
db=0
end
function da()
for dc=1,2 do
for dd=0,31 do
for de=0,127 do
local df=nil
local dg=mget(de,dd)
if dc==1 and dg==1 then
dh,di=de*8,dd*8
cw,cx=dh-56,di-56
df=co[1]
elseif dc==2
and dg>=48 then
for dj in all(
co) do
if(dj.obj_spr!=nil and dj.obj_spr==dg) df=dj break
end
end
if df!=nil then
local dk,dl=de,dd
if(dk>63) dl+=31 dk-=64
dm(df,dk*8,dl*8)
if(df.type==1 and df.speed>0) mset(de,dd,0)
end
end
end
end
end
function dm(df,ca,cb,cz,dn)
local dp=cr(df,ca,cb,df.type,nil,l[df.func_init],l[df.func_draw],l[df.func_update],nil)
dp.dq=cr(df,109,0,3,dp,nil,nil,l[df.func_onclick])
dp.cn=dr and df.hitpoint/2 or df.hitpoint
dp.bl={}
for dj in all(co) do
local ds=dj.req_faction
if(dj.parent_id!=nil and(dj.parent_id==dp.id or dj.dt==dp.id))
and(ds==nil
or(ds>0 and dj.req_faction==c)
or(ds<0 and-c!=ds))
then
add(dp.bl,
cr(dj,109,0,4,dp,nil,nil,function(self)
if br then
bo=self
else
cf(self,1)
end
end)
)
dp.bs=dp.bl[1]
end
end
dp.cz=cz or(du(ca,cb,dh,di)<75 and 1 or 2)
if dp.cz==1 then
dp.dv=c
dp.bz=d
dp.bw=e
q[dp.id]=true
else
dp.dv=g
dp.bz=i
dp.bw=j
dp.dq.func_onclick=nil
end
local dw=flr(ca/8)
local dx=flr(cb/8)
if df.type==2 then
dp.dy=53
dp.dz=0
local ea=(df.id==2 or df.id==3)
for eb=0,df.w-1 do
for ec=0,df.h-1 do
ed(dw+eb,dx+ec,ea and 16 or 149)
end
end
if(not ea) add(m,dp)
if dp.id==6 and dp.bk==nil then
p[dp.cz]=dp
local ee,ef=eg(dp,(dp.ca+32)/8,(dp.cb+8)/8,eh)
dm(co[27],ee*8,ef*8,nil,dp)
end
end
if df.type==1 then
dp.dy=54
if(dp.norotate!=1) dp.ei=flr(rnd"8")*.125
if dp.arms>0 then
dp.ej=function(self)
self.ek=4
self.el=self.ca+4
self.em=self.cb+4
self.en=self.eo.ca+self.eo.w/2
self.ep=self.eo.cb+self.eo.h/2
local eq=self.en-self.el
local er=self.ep-self.em
local es=sqrt(eq*eq+er*er)
self.et=(eq/es)*2
self.eu=(er/es)*2
sfx(self.arms<100 and 60 or 58,3)
ev(self)
end
if(dp.id==15 or dp.id==16) ed(dw,dx,149)
else
if(dp.id==27) dp.ew=0 dp.ex=p[dp.cz]
end
add(n,dp)
ey(dp)
end
ev(dp)
return dp
end
function cr(ez,ca,cb,fa,bk,func_init,func_draw,func_onclick)
local fb=(ez.w or 1)*8
local fc=(ez.h or 1)*8
local fd={
fe=ez,
id=ez.id,
hitpoint=ez.hitpoint,
ca=ca,
cb=cb,
ff=1,
type=fa,
bk=bk,
func_onclick=func_onclick,
w=fb,
h=fc,
fg=ez.obj_spr,
fh=ez.w or 1,
fi=ez.h or 1,
cn=0,
fj=0,
cd=0,
fk=0,
dz=0,
fl=0,
fm=1,
by=1,
cu=function(self)
return{
ca=self.ca,
cb=self.cb,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cy=func_draw or function(self)
if self.type<=2
and(self.ca+self.w<cw
or self.ca>cw+127
or self.cb+self.h<cx
or self.cb>cx+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dv and self.id!=18) pal(12,self.bz) pal(14,self.bw)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.ei then
if not self.fn or self.fn>.025 then
if(self.speed>0) fo(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb,.25-self.ei,1,self.trans_col,5)
fo(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb-self.ff,.25-self.ei,1,self.trans_col,flr(self.fm)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.ca-1,self.cb-1,self.ca+16,self.cb+19,0)
local fp=self.type==4 and self or self.bk
local fq=fp.hitpoint
local fr=self.cd==1 and 12 or(fp.cn<fq*.33 and 8 or fp.cn<fq*.66 and 10 or 11)
local fs=self.cd==1 and(15*(fp.cn/100)) or(15*(fp.cn/fq))
if(fp.cn>0 and not br) rectfill(self.ca,self.cb+17,self.ca+fs,self.cb+18,fr)
end
if self.type>2 then
spr(self.ico_spr,self.ca,self.cb,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
end
if self.el then
if self.fire_type==1 then
circfill(self.el,self.em,0,rnd"2"<1 and 8 or 9)
else
ft(self.el,self.em,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>21 and self.cn<self.hitpoint*.33 and rnd"10"<1) ft(self.ca+3.5,self.cb+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fl=0
end,
fu=function(self)
self.fm=max(self.fm-.4,1)
if self.fl>0 then
fv(true)
if(fw==0 or stat(24)>5) fw=1 music"0"
if(self.arms>0 and self.ek==0) fx(self,self.fy)
end
if(self.type<=2 and self.cn<=0 and self.fn==nil) self.ek=5 self.fz=nil self.fn=(self.type==2 and 1 or .5) sfx(self.dy,3) db+=((self.type==2 or self.id==34) and 0.25 or 0)
if self.fn then
self.fn-=.025
if self.fn<=0 then
if self.type==2 then
for eb=0,self.fh-1 do
for ec=0,self.fi-1 do
ed(self.ca/8+eb,self.cb/8+ec,15)
end
end
del(m,self)
y[self.fy.cz]+=1
else
local ga,gb=flr(self.ca/8),flr(self.cb/8)
if(gb>31) ga+=64 gb-=32
if(gc(ga,gb)<9) ed(ga,gb,20)
if(self.speed==0) ed(ga,gb,15)
del(n,self)
if(self.fy) z[self.fy.cz]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gd(self.ca+rnd(self.w),self.cb+rnd(self.h))
end
end
if self.framecount!=nil then
self.fj+=1
if self.fj>self.framecount then
self.fj=0
if self.altframe
and self.ek==2 then
self.obj_spr=self.fg+(self.altframe-self.obj_spr)
end
if self.bv then
self.by+=1
if(self.by>#self.bv) self.by=1
end
end
end
if self.el then
self.el+=self.et
self.em+=self.eu
if du(
self.el,self.em,
self.en,self.ep)<2
then
gd(self.el,self.em,self.fire_type)
local eo=self.eo
if du(
self.el,self.em,
eo.ca+eo.w/2,
eo.cb+eo.h/2)<4
then
eo.cn-=self.arms
eo.fl=self.fire_type
eo.fy=self
end
self.el=nil
end
end
if self.cd>0
and not self.ce
and not self.ge then
if self.cd==1 and self.fk>self.cost then
self.ge=true
if(self.cz==1) sfx"56"
if self.fe.type==1
and self.parent_id!=1 then
local ee,ef=gf(self,self.bk)
dm(self.fe,ee,ef,nil,self.bk)
gg(self)
end
elseif self.cd==2 and self.cn>self.hitpoint then
self.cd=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.ex)
self.ek=0
self.ca,self.cb=gf(self,self.ex)
end
else
self.cl+=1
self.cn=(self.cd==1 and(self.fk/self.cost)*100 or self.cn+.5)
if(self.cl>(self.cd==1 and 3 or 100) and gh(-1,self.cd==1 and self.bk or self)) self.cl=0 self.fk+=1
end
end
if self.dz>0 then
self.dz-=.1
end
end,
gi=function(self,ca,cb)
self.ca=ca
self.cb=cb
end,
gj=function(self)
return flr(self.ca/8)..","..flr(self.cb/8)
end
}
for gk,gl in pairs(ez) do
if fd[gk]==nil and gl!=""then
fd[gk]=gl
end
end
if(func_init) func_init(fd)
return fd
end
function gh(gm,fd)
if(gn(f[fd.cz])+gm<0) return false
f[fd.cz]+=sgn(gm)*shr(abs(gm),16)
if(fd.cz==1) sfx"63"
return true
end
function gd(ca,cb,go)
ft(ca,cb,2,
0,0,.1,0,go==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function ev(gp)
if(gp.cz!=1 and gp.ek!=4) return
local gq=gp.type==2 and 3 or 2
for eb=-gq,gq do
for ec=-gq,gq do
local gr=flr(gp.ca/8)+eb
local gs=flr(gp.cb/8)+ec
gt[gr][gs]=16
gu(gr,gs)
for er=-1,1 do
for eq=-1,1 do
gu(gr+eq,gs+er)
end
end
end
end
end
function _update60()
gv()
if(not br) gw()
if t()%1==0 then
if t()%2==0 then
gx()
else
gy()
end
end
x+=1
end
function _draw()
gz()
ha()
end
function ct()
gt={}
for dc=-2,66 do
gt[dc]={}
for hb=-2,66 do
gt[dc][hb]=0
end
end
end
function hc()
local hd=flr(cw/8)
local he=flr(cx/8)
palt(0,false)
palt(11,true)
for eb=hd-1,hd+16 do
for ec=he-1,he+16 do
if gt[eb][ec]!=0 and gt[eb][ec]!=16 then
spr(gt[eb][ec]+31,eb*8,ec*8)
elseif gt[eb][ec]<16 then
rectfill(eb*8,ec*8,eb*8+7,ec*8+7,0)
end
end
end
end
function gu(ca,cb)
if(ca<0 or ca>#gt or cb<0 or cb>#gt) return
local hf=0
if gt[ca][cb]!=0 then
if(gt[ca][cb-1]>0) hf+=1
if(gt[ca-1][cb]>0) hf+=2
if(gt[ca+1][cb]>0) hf+=4
if(gt[ca][cb+1]>0) hf+=8
gt[ca][cb]=1+hf
end
end
function gy()
r={}
if bc then
for dc=0,124,4 do
for hb=0,124,4 do
local de=dc/2
local dd=hb/2
if(dd>=32) de+=64 dd-=32
local hg=mget(de,dd)
local fr=sget((hg*8)%128+4,(hg*8)/16)
if(gt[dc/2][hb/2]==16) r[(dc/2/2)..","..(hb/2/2)]=fr!=11 and fr or 15
end
end
end
hh=0
hi=0
hj=false
hk={0,0}
for hl,hm in pairs(m) do
local gr=flr(hm.ca/8)
local gs=flr(hm.cb/8)
if hm.cz==1 or(bc and gt[gr][gs]==16) then
r[flr(hm.ca/2/8)..","..flr(hm.cb/2/8)]=hm.bz
end
if hm.cz==1 then
hh-=hm.power
if(hm.id==7) hj=true
if(sub(hm.name,1,5)=="sPICE") hi+=1000
end
hk[hm.cz]+=1
end
if bc then
for hl,hn in pairs(n) do
if hn.cz==1 or gt[flr(hn.ca/8)][flr(hn.cb/8)]==16 then
r[flr(hn.ca/2/8)..","..flr(hn.cb/2/8)]=hn.bz
end
end
if(ho and gt[mid(0,flr(hp/8),31)][mid(0,flr(hq/8),31)]==16) r[flr(hp/2/8)..","..flr(hq/2/8)]=7
end
bc=(hj and hh>0)
fv(false)
fw=2
if(f[3]>0 and f[1]>f[3]) hr=1
if(hk[2]==0 and b>1) hr=2
if(hk[1]==0) hr=3
if hr then
dset(14,hr)
dset(13,t()-v)
dset(10,hs)
dset(24,gn(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
rectfill(30,54,104,70,0)
?"mission "..(hr<3 and"complete"or"failed"),36,60,d
flip()
load("pico-dune-main")
end
end
function gx()
o={}
for gk,hn in pairs(n) do
o[hn:gj()]=gk
end
end
function gv()
ht,hu,hv=stat"32",stat"33",stat"34"
hw=(hv==1 and hx!=hv) or btnp"4"
hy=(hv>0) or btn"4"
hz=(hv==2 and hx!=hv) or btnp"5"
for gk=0,1 do
if(btn(gk)) ba+=gk*2-1
if(btn(gk+2)) bb+=gk*2-1
if(btnp(4,1)) stop("paused")
end
ia=mid(0,ht+ba,127)
ib=mid(0,hu+bb,127)
cursor.ca=ia
cursor.cb=ib
if not br then
if(ia<4) cw-=2
if(ia>123) cw+=2
if(ib<4) cx-=2
if(ib>123) cx+=2
cw=mid(cw,384)
cx=mid(-8,cx,384)
for hl,hn in pairs(n) do
if hn then
if hn.fz and costatus(hn.fz)!='dead'then
assert(coresume(hn.fz,hn))
else
hn.fz=nil
end
if ho
and fget(gc(flr(hn.ca/8),flr(hn.cb/8)),2)
and du(hp,hq,hn.ca,hn.cb)<1
and hn.ff==1
then
del(n,hn)
ic=.01
end
end
end
ie()
end
ig()
hx,cg,bt=hv,bo,bi
end
function ih(ca,cb)
local fs=gc(ca,cb)
return fs>=2 and fs<=8
end
function ey(hn,ii)
hn.ek=ii or 0
hn.fz=cocreate(function(self)
while true do
if rnd(500)<1 and self.arms>0 and self.ek!=8 then
eg(self,flr(self.ca/8),flr(self.cb/8),ij,self.range)
end
local ex=self.ex
if self.id==27 then
if self.ek==0 or self.ek==7 or self.ek==9 then
if self.ew<=1500
and self.ek!=7 and self.ek!=9 then
local ik,il
local im,io=flr(self.ca/8),flr(self.cb/8)
if ih(im,io) and not self.ip then
ik,il=im,io
else
eg(self,im,io,
function(hn,ca,cb)
if ih(ca,cb) and rnd"10"<1 then
ik,il=ca,cb
return true
end
end,
10)
end
if ik and il then
iq(hn,ik,il)
if(ih(flr(hn.ca/8),flr(hn.cb/8))) hn.ek=6
end
end
elseif self.ew>=1500
and self.ek!=7 then
self.ek=7
ex.bx=true
iq(self,(ex.ca+16)/8,ex.cb/8)
self.ek=9
elseif self.ek==6 then
self.ip=false
local ei=hn.ei+.75
ir(hn.ca,hn.cb,hn.ei+.75+rnd".2"-.1)
local is=hn:gj()
s[is]=(s[is] or 10000)-1
self.ew=(self.ew or 0)+.5
if s[is]<=0 then
local dw=flr(self.ca/8)
local dx=flr(self.cb/8)
for ec=-1,1 do
for eb=-1,1 do
fs=gc(dw+eb,dx+ec)
ed(dw+eb,dx+ec,
(eb==0 and ec==0) and 0 or((fs>1 and fs<8) and 8 or fs)
)
end
end
self.ek=0
end
if(self.ew%300==0) self.ip=true self.ek=0
end
end
if self.id>21 then
if self.ek==9 then
if ex.cn>0 and not ex.it then
ex.bx=false
self.ek=8
self.ei=.25
self.ca=ex.ca+16
self.cb=ex.cb+4
if(bo==self) bo=nil
if self.ew then
ex.it=true
while self.ew>0 do
self.ew-=1
if(flr(self.ew)%4==0 and tonum(hs)<hi) gh(2,self)
yield()
end
self.ew=0
ex.it=false
self.ek=0
else
self.cd=2
self.cl=0
ex.bu=8
ex.bv={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function gf(fd,eo)
local ee,ef=eg(fd,(eo.ca+8)/8,(eo.cb+16)/8,eh)
return ee*8,ef*8
end
function ir(ca,cb,ei)
local iu,iv=sin(ei)*5.5,-cos(ei)*5.5
if(rnd"5"<1) ft(ca+iu+3.5,cb+iv+3.5,rnd"2",.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fx(hn,eo)
if hn.id!=19 then
hn.ek=3
hn.eo=eo
hn.fz=cocreate(function(self)
while eo.cn>0 do
local iw=du(hn.ca,hn.cb,eo.ca,eo.cb)
if iw>hn.range*5
and hn.speed>0 then
iq(hn,flr(eo.ca/8),flr(eo.cb/8),hn.range*5)
if hn.id==34 then
hn.cn=0
for dc=1,10 do
gd(hn.ca+rnd(32)-16,hn.cb+rnd(32)-16,2)
eo.cn-=rnd(hn.arms)
eo.fy=hn
end
return
end
end
if not hn.norotate then
local ix=atan2(hn.ca-eo.ca,hn.cb-eo.cb)
while(hn.ei!=ix) do
iy(hn,ix)
end
end
if(iw<=hn.range*5) then
if(hn.dz<=0 and not hn.el) hn.ej(hn) hn.dz=hn.arms/4
elseif hn.speed==0 then
ey(hn)
end
yield()
end
ey(self)
end)
else
if c==1 then
elseif c==3 then
local iz=dm(co[34],hn.ca,hn.cb,hn.cz)
iz.ff=8
fx(iz,eo)
else
end
cg.dz=1750
end
end
function eg(hn,ca,cb,ja,jb)
for du=1,jb or 64 do
for eb=ca-du,ca+du do
for ec=cb-du,cb+du do
if((eb==ca-du or eb==ca+du or ec==cb-du or ec==cb+du) and(ja(hn,eb,ec))) return eb,ec
end
end
yield()
end
end
function gc(de,dd)
if(dd>31) de+=64 dd-=32
return mget(de,dd)
end
function ed(de,dd,jc)
if(dd>31) de+=64 dd-=32
mset(de,dd,jc)
end
function eh(hn,ca,cb)
return not fget(gc(ca,cb),0)
and o[ca..","..cb]==nil
end
function ij(hn,ca,cb)
local eo=n[o[ca..","..cb]]
if(eo!=jd and eo.cz!=hn.cz and gt[ca][cb]==16) fx(hn,eo) return true
end
function iq(hn,ca,cb,je)
local jf=hn.ff>1
::restart_move_unit::
hn.jg="init"
if not jf and not eh(nil,ca,cb) then
ca,cb=eg(hn,ca,cb,eh)
end
hn.im=ca
hn.io=cb
hn.jh=hn.ek
hn.ek=1
hn.jg=nil
local ji,jj,jk={ca=flr(hn.ca/8),cb=flr(hn.cb/8)},{ca=hn.im,cb=hn.io},function(jl) return shl(jl.cb,8)+jl.ca end
local jm,
jn={
jo=ji,
jp=0,
jq=jr(ji,jj)
},{}
jn[jk(ji)]=jm
local js,jt,ju,jv,count={jm},1,jk(jj),32767.99,0
while jt>0 do
local cost,jw=jv
for dc=1,jt do
local jx=js[dc].jp+js[dc].jq
if(jx<=cost) jw,cost=dc,jx
end
jm=js[jw]
js[jw],jm.jy=js[jt],true
jt-=1
local jz=jm.jo
if jk(jz)==ju then
jz={jj}
while jm.ka do
jm=jn[jk(jm.ka)]
add(jz,jm.jo)
end
hn.jg=jz
goto kb
end
for kc in all(kd(jz,jf)) do
local id=jk(kc)
local ke=not jf and fget(gc(kc.ca,kc.cb),1) and 4 or 1
if(jz.ca!=kc.ca and jz.cb!=kc.cb) ke+=.2
local kf,kg=
jn[id],
jm.jp+ke
if not kf then
kf={
jo=kc,
jp=jv,
jq=jr(kc,jj)
}
jt+=1
js[jt],jn[id]=kf,kf
end
if not kf.jy and kf.jp>kg then
kf.jp,kf.ka=kg,jz
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto kb
end
end
::end_pathfinding::
hn.jh=hn.ek
hn.ek=2
if hn.jg!=nil then
for dc=#hn.jg-1,1,-1 do
local jl=hn.jg[dc]
if not hn.norotate then
local ix=atan2(
hn.ca-(jl.ca*8),
hn.cb-(jl.cb*8))
while(hn.ei!=ix) do
iy(hn,ix)
end
end
if(not jf and not eh(nil,jl.ca,jl.cb)) goto restart_move_unit
local kh,ki=hn.speed or .5,sqrt((jl.ca*8-hn.ca)^2+(jl.cb*8-hn.cb)^2)
local kj=kh*(jl.ca*8-hn.ca)/ki
local kk=kh*(jl.cb*8-hn.cb)/ki
for dc=0,ki/kh-1 do
o[jl.ca..","..jl.cb]=hn
hn.ca+=kj
hn.cb+=kk
yield()
end
hn.ca,hn.cb=jl.ca*8,jl.cb*8
o[jl.ca..","..jl.cb]=hn
ev(hn)
if(du(hn.ca,hn.cb,hn.im*8,hn.io*8)<=(je or 0)) break
end
end
hn.ek=0
end
function gz()
cls"15"
camera(cw+(16-rnd(32))*db,cx+(16-rnd(32))*db)
db=(db>0.05) and db*0.95 or 0
if ho then
for dc=1,#ho do
if(dc%2==1) fillp(0xa5a5.8)
circfill(
ho[dc][1]+4,
ho[dc][2]+4,4,
kl[dc%#kl+1])
fillp()
end
if(ic>0) spr(94+ic,hp,hq)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hl,hm in pairs(m) do
if not br then
hm:fu()
if(hm.bs) hm.bs:fu()
end
hm:cy()
if(hm==bo) rect(bo.ca,bo.cb,bo.ca+bo.w-1,bo.cb+bo.h-1,7)
end
pal()
for hl,hn in pairs(n) do
if(not br) hn:fu()
if(hn.cd!=2 or hn.speed==0) hn:cy()
if(hn==bo) spr(17,bo.ca,bo.cb)
end
km()
hc()
end
function kn()
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bc!=be then
bd=bc and 1 or 59
ko=bc and 1 or-1
sfx"55"
gy()
end
be=bc
if bd>0 and bd<60 then
bd+=ko
clip(
max(108-bd,91),
max(108-(bd>20 and bd-20 or 0),91),
min(bd*2,33),
min((bd>20 and bd-20 or 1)*2,33))
for dc=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for eb=0,31 do
for ec=0,31 do
if(r[eb..","..ec]) pset(92+eb,92+ec,r[eb..","..ec])
end
end
local iu=92+cw/16
local iv=92+cx/16
rect(iu,iv,iu+7,iv+7,7)
end
function ci(kp)
bf=kp
bg=500
end
function ha()
camera(0,0)
pal()
palt(0,false)
if bo and bo.dq then
bo.dq:gi(109,20)
bo.dq:cy()
if bo.bs and bo.cz==1 then
bo.bs:gi(109,44)
bo.bs:cy()
end
if bo.cn<bo.hitpoint
and bo.cz==1
and bo.id!=4
and(bo.type==2
or bo.speed==0) then
cq:gi(117,28)
cq:cy()
end
if bo.id==19
and bo.dz<=0 then
cs:gi(109,29)
cs:cy()
end
end
rectfill(0,0,127,8,9)
if(bg>0) bg-=1 print(bf,2,2,0)
hs=gn(f[1])
? sub("000000",#hs+1)..hs,103,2,e
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.speed==0)
and bo.bs.cn>=100 then
local kq=flr((cursor.ca+cw)/8)
local kr=flr((cursor.cb+cx)/8)
local ks=kq*8-cw
local kt=kr*8-cx
ku=false
kv=false
dr=false
local w=bo.bs.fh
local h=bo.bs.fi
for eb=-1,w do
for ec=-1,h do
if eb==-1 or eb==w or ec==-1 or ec==h then
if(gc(kq+eb,kr+ec)==16 or gc(kq+eb,kr+ec)>=63) ku=true
else
local fs=gc(kq+eb,kr+ec)
if(fs>=9 and fs<=15) dr=true
if(o[kq+eb..","..kr+ec] or fs==0 or fs<8 or fs>16) kv=true
end
end
end
if(kv) ku=false
fillp("0b1110110110110111.1")
rectfill(ks,kt,
ks+bo.bs.w,kt+bo.bs.h,ku and 11 or 8)
fillp()
end
kn()
if br then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bo.bl then
bo.bp={}
rectfill(6,25,27,92,0)
local kw=1
for dc=1,#bo.bl do
local kx=bo.bl[dc]
if kx.req_id==nil
or q[kx.req_id] then
bo.bp[kw]=kx
if kw>=bh and kw<=bh+2 then
kx:gi(9,28+(kw-bh)*19)
kx:cy()
else
kx:gi(-16,16)
end
if(bi==kx) then
bn=kw
rect(kx.ca-2,kx.cb-2,
kx.ca+17,kx.cb+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,39,6
end
kw+=1
end
end
end
for hl,ky in pairs(bj) do
ky:cy()
end
end
palt(11,true)
cursor:cy()
end
function bm(ca,cb,kz,func_onclick,fb)
add(bj,{
ca=ca,
cb=cb,
w=fb or#kz*4+2,
h=8,
kz=kz,
cu=function(self)
return{
ca=self.ca,
cb=self.cb,
w=self.w,
h=self.h
}
end,
cy=function(self)
if(#kz>1) rectfill(self.ca,self.cb,self.ca+self.w,self.cb+self.h,7)
if(#kz>1) rectfill(self.ca+1,self.cb+1,self.ca+self.w-1,self.cb+self.h-1,self.la and 12 or 6)
? self.kz,self.ca+2,self.cb+2,(#kz>1) and 0 or(self.la and 12 or 7)
end,
func_onclick=func_onclick
})
end
function ig()
lb=false
if bo then
cv=true
lc(cq)
lc(cs)
if(bo.dq and not br and not lb) lc(bo.dq)
foreach(bo.bl,lc)
if(br) foreach(bj,lc)
cv=false
end
if not br
and not lb then
foreach(n,lc)
foreach(m,lc)
end
if hy
and not br
and ia>89 and ia<122
and ib>90 and ib<123 then
cw=mid(0,(ia-94)*16,400)
cx=mid(-8,(ib-94)*16,400)
elseif hw then
cj=false
if(bo) ci(bo.name)
if lb then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=cg return
if(br and bi.kz and bi.func_onclick) bi:func_onclick()
if(bo.cz==1 and bo.type==1 and bo!=cg and bo.speed>0) sfx"62"
if(bo.cz==2 and cg and(cg.type==1 or cg.id==19) and cg.cz==1) bo.fm=10 fx(cg,bo) bo=nil
else
if bo
and bo.type==1
and bo.cz==1
and bo.speed>0
and bo.ek!=7 then
bo.fz=cocreate(function(hn)
iq(hn,flr((cw+ia)/8),flr((cx+ib)/8))
ey(hn)
end)
end
if bo
and bo.bs
and bo.bs.cn>=100
and ku then
local df=bo.bs.fe
dm(df,
flr((cursor.ca+cw)/8)*8,
flr((cursor.cb+cx)/8)*8,1)
gg(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
elseif hz and not br then
bo=nil
cj=false
end
end
function gg(fd)
fd.cn=0
fd.cd=0
fd.fk=0
fd.ge=false
end
function lc(fd)
fd.la=ld(cursor,fd)
if hw and fd.la then
if br then
bi=fd
else
if(fd.type<=2 and gt[flr((cursor.ca+cw)/8)][flr((cursor.cb+cx)/8)]!=16) return
if(fd.ek==8) return
if bo
and(fd.id==6 and bo.id==27
or fd.id==14 and bo.id>21)
and fd.cz==1 then
bo.ek=7
bo.ex=fd
fd.bx=true
bo.fz=cocreate(function(hn)
iq(hn,(fd.ca+16)/8,(fd.cb+16)/8)
ey(hn,9)
end)
return
else
bo=fd
end
end
lb=true
end
end
le=0
function gw()
if(t()>k and t()%k*2==0) then
local lf=n[flr(rnd(#n))+1]
if lf.cz==2 and lf.arms>0 and lf.ek==0 then
local lg=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if(lg and lg.cz==1) fx(lf,lg)
end
local lh=m[flr(rnd(#m))+1]
if lh.cz==2 then
if lh.bs and lh.bs.fe.type==1 and lh.bs.cd!=1 then
local li=lh.bl[flr(rnd(#lh.bl))+1]
lh.bs=li
li:func_onclick()
end
if lh.cn<lh.hitpoint and lh.cd!=2 then
cf(lh,2)
end
end
end
le-=1
if(le<0) then
if ho then
ho=nil
else
ho,lj,lk,kl,ic={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
ll=rnd(5000)
le=ll
end
if ho then
if(x%6<1 or#ho<30) and ic==0 then
while#ho<31 do
if(rnd(9)<.5) lk=rnd(.04)-.02
hp,hq=ho[#ho][1],ho[#ho][2]
add(ho,{hp+sin(lj),hq-cos(lj)})
lj+=lk
end
end
if(#ho>30) del(ho,ho[1])
if(ic>0) ic+=.01 ir(hp,hq,rnd"1")
if(ic>2) ic=0
if(le>ll-128 or le<128) ir(hp,hq,rnd"1")
end
end
function fv(lm)
local fs=peek(0x3115)
if((band(fs,128)>0)!=lm) fs=bxor(fs,128)
poke(0x3115,fs)
end
function ld(ln,lo)
local lp=ln:cu()
local lq=lo:cu()
return lp.ca<lq.ca+lq.w and
lp.ca+lp.w>lq.ca and
lp.cb<lq.cb+lq.h and
lp.cb+lp.h>lq.cb
end
function cp()
lr=lt(co,"|","\n")
co={}
for dc=2,#lr-1 do
lu={}
for lv=1,#lr[dc] do
local fs=lr[dc][lv]
if(lv!=2 and lv<25) fs=tonum(fs)
if(lv==25) then
lw=lt(fs,"~")
fs=""
for dc=1,#lw do
fs=fs.."\n"..lw[dc]
end
end
lu[lr[1][lv]]=fs
end
co[tonum(lr[dc][1])]=lu
end
end
function gn(fs)
local lx=""
local gl=abs(fs)
repeat
lx=(gl%0x0.000a/0x.0001)..lx
gl/=10
until gl==0
if(fs<0) lx="-"..lx
return lx
end
function lt(ly,es,lz)
local ix={}
local lx=""
local ma=""
if(lz~=nil) ly=lt(ly,lz)
while#ly>0 do
if type(ly)=="table"then
lx=ly[1]
add(ix,lt(lx,es))
del(ly,lx)
else
lx=sub(ly,1,1)
ly=sub(ly,2)
if lx==es then
add(ix,ma)
ma=""
else
ma=ma..lx
end
end
end
add(ix,ma)
return ix
end
function fo(ik,il,ca,cb,ix,w,mb,mc)
local md,me=cos(ix),sin(ix)
local mf,mg,mh,mi
local mj,mk=md,me
local hf=shl(0xfff8,(w-1))
w*=4
md*=w-0.5
me*=w-0.5
local ml,mm=me-md+w,-md-me+w
w=2*w-1
for mn=0,w do
mf,mg=ml,mm
for mo=0,w do
if band(bor(mf,mg),hf)==0 then
local mp=sget(ik+mf,il+mg)
if(mp!=mb) pset(ca+mn,cb+mo,mc or mp)
end
mf-=mk
mg+=mj
end
ml+=mj
mm+=mk
end
end
function du(mq,mr,ms,mt)
return abs(sqrt(((mq-ms)/1000)^2+((mr-mt)/1000)^2)*1000)
end
function iy(hn,mu)
local mv=3.14159
local gm=mu-hn.ei
if gm>0.5 then
gm-=1
elseif gm<-0.5 then
gm+=1
end
if gm>0.0087 then
hn.ei+=0.0087
elseif gm<-0.0087 then
hn.ei-=0.0087
else
hn.ei=mu
end
if(hn.ei>mv) hn.ei-=2*mv
if(hn.ei<-mv) hn.ei+=2*mv
yield()
end
function kd(jl,jf)
local mw={}
for eb=-1,1 do
for ec=-1,1 do
if(eb!=0 or ec!=0) mx(jl.ca+eb,jl.cb+ec,mw,jf)
end
end
return mw
end
function mx(my,mz,na,jf)
if(jf or not fget(gc(my,mz),0) and o[my..","..mz]==nil and my>=0 and mz>=0 and my<=63 and mz<=63) add(na,{ca=my,cb=mz})
end
function jr(ix,nb)
return abs(ix.ca-nb.ca)+abs(ix.cb-nb.cb)
end
function ft(ca,cb,ei,eq,er,nc,nd,cn,ne,nf)
local jz={
ca=ca,cb=cb,ei=ei,eq=eq,er=er,nc=nc,
cn=0,nd=nd,
ne=ne,nf=nf,
ng=cb,nh=cn
}
add(u,jz)
end
function ie()
for gk,jz in pairs(u) do
jz.er+=jz.nd
jz.ca+=jz.eq
jz.cb+=jz.er
jz.ei+=jz.nc
jz.cn+=1
if(jz.cn>=jz.nh) del(u,jz)
end
end
function km()
for gk,jz in pairs(u) do
if(jz.nf) fillp(jz.nf)
circfill(jz.ca,jz.cb,jz.ei,jz.ne[flr((#jz.ne/jz.nh)*jz.cn)+1])
fillp()
end
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
bbbbbbbbbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbdddddddddddddddddddddddddfffc0ffddddd999dddddddd05e77e50b7bbb7bbb7bbb7bb
b0eee0bbb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbd555555555555544c4555555df4ee04ff55999999955576500c77c00bcbbbcbbbcbbbcbb
b0d6d0bbb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbd5555555555554a904455555dfff4044f54499999445f66f00077000bebbbebbbebbbebb
bbc7cbbbbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbd4c455444445549904499c95df444444f52449494425dffdc767767cb0bbb0bb0b0b0b0b
b0c7c0bbbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbb4a042499999452424297a094dffffffff5424444424556d5c767767cbbb7bbbbbbb7bbbb
b0ccc0bbb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbb49029999c0994922229aa094d4444444452242424425542500077000bbbcbbbbbbbcbbbb
bb6b6bbbb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbb242499aee099942dd1499942d4044004455422422455542500577500bbbebbbbbbbebbbb
bbbbbbbbbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbd2499a77a0a94942d1542425d44400004555224225ff222500655600bbb0bbbbbb0b0bbb
d77dd77d67d6fffdddd776ddddddddddddddddddddd777ddddddddddd1499a77aaa99424d15242f5d22222222555555555f44225bbbbbbbbbbb8bbbb00000000
76667666561ffff1d576db65d5577655d5555555d5766665d5555555d1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445bbbbbbbbbbb9bbbb00000000
76667666565f4441d76dbbb5d576db65d5557555d5766665d5bbbbb5d52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445bbbddbbbbbdadbbb00000000
d6621662165ffff1d66d11b5d76dbbb5d5576655d5d66625d5555555d5424999994942425551424fd55bbddadad5bb5d5fff4765bbd66dbbbb666bbb00000000
d2221222165f1011d66d01b0d66d11b5d55d6255d5dd2225d55aaa55d5542494949424255555114fd5bbd5aadaaddbb55444f66fbbd66dbbbbb6bbbb00000000
622112211ddf1001d66d0b01d66d01b0d55d2215d5dd2221d5555555d55142424242421599c9554fdbbddaa5ddaad5bb5404dffdbbbddbbbbbb6bbbb00000000
6115511151551005d56dd015d66d0b01d5551155d5512211d5558555d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4bbb67bbbbbb6bbbb00000000
66767555d55d5555d5511155d56dd015d5555555d5551115d5588855d5599c9212121119aa09954fd5daa5d888ddaadd52222425bbb67bbbbbb7bbbb00000000
6d6d65d555d555d5ddddd776ddd111ddddd777ddddddddddddddddddd597a099fffffff49949454fdddddd88888ddddd55555425bbbbbbbbbbbb447bbbbbbbbb
66d1d555155dc055d55576db65555555d5766665d5555555d5588855d59aa094dddddddf242425ffdddaadd888d5aadd5fff2225bbbbbbbbbbb2557bbb5555bb
d555555a5d5ee055d5576dbbb555c055d5766665d5557555d5558555df249492dd929ddf00004ff1dbddaa5d8d5aaddb5ffff225b1b11b1bbb2555dbb507665b
15aaa99a5555505dd5566d11b55ee055d5d66625d5576655d5555555dff2424fd9d2d9df22fff211dbbd5aadd5aad5bb54444445bdd66ddbb775f55bb562720b
55aaa55ad5555055d5566d01b0555055d5dd2225d55d6255d55aaa55d1fffff1d99299dfff141211d5bbddaadaad5bb55ffffff5b651156b76dfff2bb567275b
d5a1199a55d51555d5566d0b01555055d5dd2221d55d2215d5555555d441414111111114144442154d5bb5dadad5bb5d5ffffff5b7b55b7b76d5f564b572765b
5544445a15555515d5556dd015555555d5512211d5551155d5bbbbb5d14404455555555444444155d4d5bbdd5ddbbddd54444445bbb67bbb4422d664bb5055bb
d5151515555d5555d5555111d5555555d5551115d5555555d5555555d51111155555555444111555dd4ddbbdddbbdddd52222225bbb67bbbbbbbbd77bbbbbbbb
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
0400040404040404040202020202000000000600040406010101010101010101010101010000000000000101010000000101010101010101010101010101010101010101010102010101020201010000010101010101020101010202010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121236000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000165d85850a0a001200020508030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212003710100c830a85420a6c0a000205030303030303030642000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212001010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000101010420a0d4d0e0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120d0d090d0e00850a0a0e0000121236650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016004d010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001212161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000360012121216850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000032000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000005d4d4d5d00360000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
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

