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
printh("fire palace weapon")
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
33|dEVASTATOR|52|200||1|1|1|11|12||13|8|3|800||60|1600|0.1|7|1||||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
35|rAIDER|54|204||1|1|1|11|11|||2|2|150||8|320|0.75|3|1||||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
39|sANDWORM|94|||9|1|1|11|nil||nil|3||0||300|4000|0.35|0|30||||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19|||5|1|1|11|nil||nil|||||||||||||||draw_action||action_click
81|lAUNCH|1|||5|1|1|11|nil||nil|||||||||||||||draw_action||action_click]]
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
spr((bo and(bo.type==1 and bo.cz==1) or cj) and 1 or self.obj_spr,
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
local dh=fget(dg)
if dc==1 and dg==1 then
di,dj=de*8,dd*8
cw,cx=di-56,dj-56
df=co[1]
elseif dc==2
and dg>=48 then
for dk in all(
co) do
if(dk.obj_spr!=nil and dk.obj_spr==dg) df=dk break
end
end
if df!=nil then
local dl,dm=de,dd
if(dl>63) dm+=31 dl-=64
dn(df,dl*8,dm*8)
if(df.type==1 and df.speed>0) mset(de,dd,0)
end
end
end
end
end
function dn(df,ca,cb,cz,dp)
local dq=cr(df,ca,cb,df.type,nil,l[df.func_init],l[df.func_draw],l[df.func_update],nil)
dq.dr=cr(df,109,0,3,dq,nil,nil,l[df.func_onclick])
dq.cn=ds and df.hitpoint/2 or df.hitpoint
dq.bl={}
for dk in all(co) do
local dt=dk.req_faction
if(dk.parent_id!=nil and(dk.parent_id==dq.id or dk.du==dq.id))
and(dt==nil
or(dt>0 and dk.req_faction==c)
or(dt<0 and-c!=dt))
then
add(dq.bl,
cr(dk,109,0,4,dq,nil,nil,function(self)
if br then
bo=self
else
cf(self,1)
end
end)
)
dq.bs=dq.bl[1]
end
end
dq.cz=cz or(dv(ca,cb,di,dj)<75 and 1 or 2)
if dq.cz==1 then
dq.dw=c
dq.bz=d
dq.bw=e
q[dq.id]=true
else
dq.dw=g
dq.bz=i
dq.bw=j
dq.dr.func_onclick=nil
end
local dx=flr(ca/8)
local dy=flr(cb/8)
if df.type==2 then
dq.dz=53
dq.ea=0
local eb=(df.id==2 or df.id==3)
for ec=0,df.w-1 do
for ed=0,df.h-1 do
ee(dx+ec,dy+ed,eb and 16 or 149)
end
end
if(not eb) add(m,dq)
if dq.id==6 and dq.bk==nil then
p[dq.cz]=dq
local ef,eg=eh(dq,(dq.ca+32)/8,(dq.cb+8)/8,ei)
dn(co[27],ef*8,eg*8,nil,dq)
end
end
if df.type==1 then
dq.dz=54
if(dq.norotate!=1) dq.ej=flr(rnd"8")*.125
if dq.arms>0 then
dq.ek=function(self)
self.el=4
self.em=self.ca+4
self.en=self.cb+4
self.eo=self.ep.ca+self.ep.w/2
self.eq=self.ep.cb+self.ep.h/2
local er=self.eo-self.em
local es=self.eq-self.en
local et=sqrt(er*er+es*es)
self.eu=(er/et)*2
self.ev=(es/et)*2
sfx(self.arms<100 and 60 or 58,3)
ew(self)
end
if dq.id==15 or dq.id==16 then
ee(dx,dy,149)
end
else
if(dq.id==27) dq.ex=0 dq.ey=p[dq.cz]
end
add(n,dq)
ez(dq)
end
ew(dq)
return dq
end
function cr(fa,ca,cb,fb,bk,func_init,func_draw,func_onclick)
local fc=(fa.w or 1)*8
local fd=(fa.h or 1)*8
local fe={
ff=fa,
id=fa.id,
hitpoint=fa.hitpoint,
ca=ca,
cb=cb,
fg=1,
type=fb,
bk=bk,
func_onclick=func_onclick,
w=fc,
h=fd,
fh=fa.obj_spr,
fi=fa.w or 1,
fj=fa.h or 1,
cn=0,
fk=0,
cd=0,
fl=0,
ea=0,
fm=0,
fn=1,
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
if(self.dw and self.id!=18) pal(12,self.bz) pal(14,self.bw)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.ej then
if not self.fo or self.fo>.025 then
if(self.speed>0) fp(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb+1,.25-self.ej,1,self.trans_col,5)
fp(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb,.25-self.ej,1,self.trans_col,flr(self.fn)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.ca-1,self.cb-1,self.ca+16,self.cb+19,0)
local fq=self.type==4 and self or self.bk
local fr=fq.hitpoint
local fs=self.cd==1 and 12 or(fq.cn<fr*.33 and 8 or fq.cn<fr*.66 and 10 or 11)
local ft=self.cd==1 and(15*(fq.cn/100)) or(15*(fq.cn/fr))
if(fq.cn>0 and not br) rectfill(self.ca,self.cb+17,self.ca+ft,self.cb+18,fs)
end
if self.type>2 then
spr(self.ico_spr,self.ca,self.cb,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
end
if self.em then
if self.fire_type==1 then
circfill(self.em,self.en,0,rnd"2"<1 and 8 or 9)
else
fu(self.em,self.en,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>21 and self.cn<self.hitpoint*.33 and rnd"10"<1) fu(self.ca+3.5,self.cb+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fm=0
end,
fv=function(self)
self.fn=max(self.fn-.4,1)
if self.fm>0 then
fw(5,true)
if(fx==0 or stat(24)>5) fx=1 music"0"
if(self.arms>0 and self.el==0) fy(self,self.fz)
end
if(self.type<=2 and self.cn<=0 and self.fo==nil) self.el=5 self.ga=nil self.fo=(self.type==2 and 1 or .5) sfx(self.dz,3) db+=(self.type==2 and 0.25 or 0)
if self.fo then
self.fo-=.025
if self.fo<=0 then
if self.type==2 then
for ec=0,self.fi-1 do
for ed=0,self.fj-1 do
ee(self.ca/8+ec,self.cb/8+ed,15)
end
end
del(m,self)
y[self.fz.cz]+=1
else
local gb,gc=flr(self.ca/8),flr(self.cb/8)
if(gc>31) gb+=64 gc-=32
if(gd(gb,gc)<9) ee(gb,gc,20)
if(self.speed==0) ee(gb,gc,15)
del(n,self)
z[self.fz.cz]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) ge(self.ca+rnd(self.w),self.cb+rnd(self.h))
end
end
if self.framecount!=nil then
self.fk+=1
if self.fk>self.framecount then
self.fk=0
if self.altframe
and self.el==2 then
self.obj_spr=self.fh+(self.altframe-self.obj_spr)
end
if self.bv then
self.by+=1
if(self.by>#self.bv) self.by=1
end
end
end
if self.em then
self.em+=self.eu
self.en+=self.ev
if dv(
self.em,self.en,
self.eo,self.eq)<2
then
ge(self.em,self.en,self.fire_type)
local ep=self.ep
if dv(
self.em,self.en,
ep.ca+ep.w/2,
ep.cb+ep.h/2)<4
then
ep.cn-=self.arms
ep.fm=self.fire_type
ep.fz=self
end
self.em=nil
end
end
if self.cd>0
and not self.ce
and not self.gf then
if self.cd==1 and self.fl>self.cost then
self.gf=true
if(self.cz==1) sfx"56"
if self.ff.type==1
and self.id!=15
and self.id!=16 then
local ef,eg=gg(self,self.bk)
dn(self.ff,ef,eg,nil,self.bk)
gh(self)
end
elseif self.cd==2 and self.cn>self.hitpoint then
self.cd=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.ey)
self.el=0
local ef,eg=gg(self,self.ey)
self.ca,self.cb=ef,eg
end
else
self.cl+=1
self.cn=(self.cd==1 and(self.fl/self.cost)*100 or self.cn+.5)
if(self.cl>(self.cd==1 and 3 or 100) and gi(-1,self.cd==1 and self.bk or self)) self.cl=0 self.fl+=1
end
end
end,
gj=function(self,ca,cb)
self.ca=ca
self.cb=cb
end,
gk=function(self)
return flr(self.ca/8)..","..flr(self.cb/8)
end
}
for gl,gm in pairs(fa) do
if fe[gl]==nil and gm!=""then
fe[gl]=gm
end
end
if(func_init) func_init(fe)
return fe
end
function gi(gn,fe)
if(go(f[fe.cz])+gn<0) return false
f[fe.cz]+=sgn(gn)*shr(abs(gn),16)
if(fe.cz==1) sfx"63"
return true
end
function ge(ca,cb,gp)
fu(ca,cb,2,
0,0,.1,0,gp==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function ew(gq)
if(gq.cz!=1 and gq.el!=4) return
local gr=gq.type==2 and 3 or 2
for ec=-gr,gr do
for ed=-gr,gr do
local gs=flr(gq.ca/8)+ec
local gt=flr(gq.cb/8)+ed
gu[gs][gt]=16
gv(gs,gt)
for es=-1,1 do
for er=-1,1 do
gv(gs+er,gt+es)
end
end
end
end
end
function _update60()
gw()
gx()
if(t()%1==0) gy()
if(t()%1==0 and t()%2==0) gz()
x+=1
end
function _draw()
ha()
hb()
end
function ct()
gu={}
for dc=-2,66 do
gu[dc]={}
for hc=-2,66 do
gu[dc][hc]=0
end
end
end
function hd()
local he=flr(cw/8)
local hf=flr(cx/8)
for ec=he-1,he+16 do
for ed=hf-1,hf+16 do
if gu[ec][ed]!=0 and gu[ec][ed]!=16 then
spr(gu[ec][ed]+31,ec*8,ed*8)
elseif gu[ec][ed]<16 then
rectfill(ec*8,ed*8,ec*8+7,ed*8+7,0)
end
end
end
end
function gv(ca,cb)
if(ca<0 or ca>#gu or cb<0 or cb>#gu) return
local hg=0
if gu[ca][cb]!=0 then
if(gu[ca][cb-1]>0) hg+=1
if(gu[ca-1][cb]>0) hg+=2
if(gu[ca+1][cb]>0) hg+=4
if(gu[ca][cb+1]>0) hg+=8
gu[ca][cb]=1+hg
end
end
function gz()
r={}
if bc then
for dc=0,124,4 do
for hc=0,124,4 do
local de=dc/2
local dd=hc/2
if(dd>=32) de+=64 dd-=32
local hh=mget(de,dd)
local hi=(hh*8)%128
local hj=(hh*8)/16
local fs=sget(hi+4,hj)
if(gu[dc/2][hc/2]==16) r[((dc/2)/2)..","..((hc/2)/2)]=fs!=11 and fs or 15
end
end
end
hk=0
hl=0
hm=false
hn={0,0}
for ho,hp in pairs(m) do
local gs=flr(hp.ca/8)
local gt=flr(hp.cb/8)
if hp.cz==1 or(bc and gu[gs][gt]==16) then
r[flr(hp.ca/2/8)..","..flr(hp.cb/2/8)]=hp.bz
end
if hp.cz==1 then
hk-=hp.ff.power
if(hp.id==7) hm=true
if(sub(hp.name,1,5)=="sPICE") hl+=1000
end
hn[hp.cz]+=1
end
if bc then
for ho,hq in pairs(n) do
if hq.cz==1 or gu[flr(hq.ca/8)][flr(hq.cb/8)]==16 then
r[flr(hq.ca/2/8)..","..flr(hq.cb/2/8)]=hq.bz
end
end
if(hr and gu[mid(0,flr(hs/8),31)][mid(0,flr(ht/8),31)]==16) r[flr(hs/2/8)..","..flr(ht/2/8)]=7
end
bc=(hm and hk>0)
fw(5,false)
fx=2
if(f[3]>0 and f[1]>f[3]) hu=1
if(hn[2]==0 and b>1) hu=2
if(hn[1]==0) hu=3
if hu then
dset(14,hu)
dset(13,t()-v)
dset(10,hv)
dset(24,go(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
hw("mission "..(hu<3 and"complete"or"failed"),36,60,8)
flip()
load("pico-dune-main")
end
end
function gy()
o={}
for gl,hq in pairs(n) do
o[flr(hq.ca/8)..","..flr(hq.cb/8)]=gl
end
end
function gw()
hx,hy,hz=stat"32",stat"33",stat"34"
ia=(hz==1 and ib!=hz) or btnp"4"
ic=(hz>0) or btn"4"
ie=(hz==2 and ib!=hz) or btnp"5"
for gl=0,1 do
if(btn(gl)) ba+=gl*2-1
if(btn(gl+2)) bb+=gl*2-1
if(btnp(4,1)) stop("paused")
end
ig=mid(0,hx+ba,127)
ih=mid(0,hy+bb,127)
cursor.ca=ig
cursor.cb=ih
if not br then
if(ig<4) cw-=2
if(ig>123) cw+=2
if(ih<4) cx-=2
if(ih>123) cx+=2
cw=mid(cw,384)
cx=mid(-8,cx,384)
for ho,hq in pairs(n) do
if hq then
if hq.ga and costatus(hq.ga)!='dead'then
assert(coresume(hq.ga,hq))
else
hq.ga=nil
end
if hr
and fget(gd(flr(hq.ca/8),flr(hq.cb/8)),2)
and dv(hs,ht,hq.ca,hq.cb)<1
then
del(n,hq)
ii=.01
end
end
end
ij()
end
ik()
ib,cg,bt=hz,bo,bi
end
function il(ca,cb)
local ft=gd(ca,cb)
return ft>=2 and ft<=8
end
function ez(hq,im)
hq.el=im or 0
hq.ga=cocreate(function(self)
while true do
if rnd(500)<1 and self.arms>0 and self.el!=8 then
eh(self,flr(self.ca/8),flr(self.cb/8),io,self.range)
end
local ey=self.ey
if self.id==27 then
if self.el==0 or self.el==7 or self.el==9 then
if self.ex<=1500
and self.el!=7 and self.el!=9 then
local hi,hj
local ip,iq=flr(self.ca/8),flr(self.cb/8)
if il(ip,iq) and not self.ir then
hi,hj=ip,iq
else
eh(self,ip,iq,
function(hq,ca,cb)
if il(ca,cb) and rnd"10"<1 then
hi,hj=ca,cb
return true
end
end,
10)
end
if hi and hj then
is(hq,hi,hj)
if(il(flr(hq.ca/8),flr(hq.cb/8))) hq.el=6
end
end
elseif self.ex>=1500
and self.el!=7 then
self.el=7
ey.bx=true
is(self,(ey.ca+16)/8,ey.cb/8)
self.el=9
elseif self.el==6 then
self.ir=false
local ej=hq.ej+.75
it(hq.ca,hq.cb,hq.ej+.75+rnd".2"-.1)
local iu=hq:gk()
s[iu]=(s[iu] or 10000)-1
self.ex=(self.ex or 0)+.5
if s[iu]<=0 then
local dx=flr(self.ca/8)
local dy=flr(self.cb/8)
for ed=-1,1 do
for ec=-1,1 do
ft=gd(dx+ec,dy+ed)
ee(dx+ec,dy+ed,
(ec==0 and ed==0) and 0 or((ft>1 and ft<8) and 8 or ft)
)
end
end
self.el=0
end
if(self.ex%300==0) self.ir=true self.el=0
end
end
if self.id>21 then
if self.el==9 then
if ey.cn>0 and not ey.iv then
ey.bx=false
self.el=8
self.ej=.25
self.ca=ey.ca+16
self.cb=ey.cb+4
if(bo==self) bo=nil
if self.ex then
ey.iv=true
while self.ex>0 do
self.ex-=1
if(flr(self.ex)%4==0 and tonum(hv)<hl) gi(2,self)
yield()
end
self.ex=0
ey.iv=false
self.el=0
else
self.cd=2
self.cl=0
ey.bu=8
ey.bv={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function gg(fe,ep)
local ef,eg=eh(fe,(ep.ca+8)/8,(ep.cb+16)/8,ei)
return ef*8,eg*8
end
function it(ca,cb,ej)
local iw,ix=sin(ej)*5.5,-cos(ej)*5.5
if(rnd"5"<1) fu(ca+iw+3.5,cb+ix+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fy(hq,ep)
hq.el=3
hq.ep=ep
hq.ga=cocreate(function(self)
while ep.cn>0 do
local iy=dv(hq.ca,hq.cb,ep.ca,ep.cb)
if iy>hq.range*5
and hq.speed>0 then
is(hq,flr(ep.ca/8),flr(ep.cb/8),hq.range*5)
end
if not hq.norotate then
local iz=atan2(hq.ca-ep.ca,hq.cb-ep.cb)
while(hq.ej!=iz) do
ja(hq,iz)
end
end
if(iy<=hq.range*5) then
hq.ea-=1
if(hq.ea<=0 and not hq.em) hq.ek(hq) hq.ea=hq.arms*4
elseif hq.speed==0 then
ez(hq)
end
yield()
end
ez(self)
end)
end
function eh(hq,ca,cb,jb,jc)
for dv=1,jc or 64 do
for ec=ca-dv,ca+dv do
for ed=cb-dv,cb+dv do
if((ec==ca-dv or ec==ca+dv or ed==cb-dv or ed==cb+dv) and(jb(hq,ec,ed))) return ec,ed
end
end
yield()
end
end
function gd(de,dd)
if(dd>31) de+=64 dd-=32
return mget(de,dd)
end
function ee(de,dd,jd)
if(dd>31) de+=64 dd-=32
mset(de,dd,jd)
end
function ei(hq,ca,cb)
return not fget(gd(ca,cb),0)
and o[ca..","..cb]==nil
end
function io(hq,ca,cb)
local ep=n[o[ca..","..cb]]
if(ep!=je and ep.cz!=hq.cz and gu[ca][cb]==16) fy(hq,ep) return true
end
function is(hq,ca,cb,jf)
::restart_move_unit::
hq.jg="init"
if not ei(nil,ca,cb) then
ca,cb=eh(hq,ca,cb,ei)
end
hq.ip=ca
hq.iq=cb
hq.jh=hq.el
hq.el=1
hq.jg=ji(
{ca=flr(hq.ca/8),cb=flr(hq.cb/8)},
{ca=hq.ip,cb=hq.iq},
jj,
jk,
jl,
function(jm) return shl(jm.cb,8)+jm.ca end,
nil)
hq.jh=hq.el
hq.el=2
hq.el=2
if hq.jg!=nil then
for dc=#hq.jg-1,1,-1 do
local jm=hq.jg[dc]
if not hq.norotate then
local iz=atan2(
hq.ca-(jm.ca*8),
hq.cb-(jm.cb*8))
while(hq.ej!=iz) do
ja(hq,iz)
end
end
if(not ei(nil,jm.ca,jm.cb)) goto restart_move_unit
local jn=hq.speed or .5
local jo=sqrt((jm.ca*8-hq.ca)^2+(jm.cb*8-hq.cb)^2)
local jp=jn*(jm.ca*8-hq.ca)/jo
local jq=jn*(jm.cb*8-hq.cb)/jo
for dc=0,jo/jn-1 do
o[jm.ca..","..jm.cb]=hq
hq.ca+=jp
hq.cb+=jq
yield()
end
hq.ca,hq.cb=jm.ca*8,jm.cb*8
o[jm.ca..","..jm.cb]=hq
ew(hq)
if(dv(hq.ca,hq.cb,hq.ip*8,hq.iq*8)<=(jf or 0)) break
end
end
hq.el=0
end
jr=0
function gx()
if(t()>k and t()%k*2==0) then
local js=n[flr(rnd(#n))+1]
if js.cz==2 and js.arms>0 and js.el==0 then
local jt=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if(jt and jt.cz==1) fy(js,jt)
end
local ju=m[flr(rnd(#m))+1]
if ju.cz==2 then
if ju.bs and ju.bs.ff.type==1 and ju.bs.cd!=1 then
local jv=ju.bl[flr(rnd(#ju.bl))+1]
ju.bs=jv
jv:func_onclick()
end
if ju.cn<ju.hitpoint and ju.cd!=2 then
cf(ju,2)
end
end
end
jr-=1
if(jr<0) then
if hr then
hr=nil
else
hr,jw,jx,jy,ii={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
jr=rnd(5000)
end
if hr and not br then
if(x%6<1 or#hr<30) and ii==0 then
while#hr<31 do
if(rnd(9)<.5) jx=rnd(.04)-.02
hs,ht=hr[#hr][1],hr[#hr][2]
add(hr,{hs+sin(jw),ht-cos(jw)})
jw+=jx
end
end
if(#hr>30) del(hr,hr[1])
if(ii>0) ii+=.01 it(hs,ht,rnd"1")
if(ii>2) ii=0
end
end
function ha()
cls"15"
camera(cw+(16-rnd(32))*db,cx+(16-rnd(32))*db)
db=(db>0.05) and db*0.95 or 0
if hr then
for dc=1,#hr do
if(dc%2==1) fillp(0xa5a5.8)
circfill(
hr[dc][1]+4,
hr[dc][2]+4,4,
jy[dc%#jy+1])
fillp()
end
if(ii>0) spr(94+ii,hs,ht)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for ho,hp in pairs(m) do
if not br then
hp:fv()
if(hp.bs) hp.bs:fv()
end
hp:cy()
if(hp==bo) rect(bo.ca,bo.cb,bo.ca+bo.w-1,bo.cb+bo.h-1,7)
end
pal()
for ho,hq in pairs(n) do
if(not br) hq:fv()
if(hq.cd!=2 or hq.speed==0) hq:cy()
if(hq==bo) spr(17,bo.ca,bo.cb)
end
jz()
hd()
end
function ka()
local gr=31
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bc!=be then
bd=bc and 1 or 59
kb=bc and 1 or-1
sfx(55)
gz()
end
be=bc
if bd>0 and bd<60 then
bd+=kb
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
for ec=0,31 do
for ed=0,31 do
if(r[ec..","..ed]) pset(92+ec,92+ed,r[ec..","..ed])
end
end
local iw=92+cw/16
local ix=92+cx/16
rect(iw,ix,iw+7,ix+7,7)
end
function ci(kc)
bf=kc
bg=500
end
function hb()
camera(0,0)
pal()
palt(0,false)
if bo and bo.dr then
bo.dr:gj(109,20)
bo.dr:cy()
if bo.bs and bo.cz==1 then
bo.bs:gj(109,44)
bo.bs:cy()
end
if bo.cn<bo.hitpoint
and bo.cz==1
and bo.id!=4
and(bo.type==2
or bo.id==15
or bo.id==16) then
cq:gj(117,28)
cq:cy()
end
if bo.id==19
and bo.ea<=0 then
cs:gj(109,29)
cs:cy()
end
end
rectfill(0,0,127,8,9)
if(bg>0) bg-=1 print(bf,2,2,0)
hv=go(f[1])
? sub("000000",#hv+1)..hv,103,2,e
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.id==15
or bo.bs.id==16)
and bo.bs.cn>=100 then
local kd=flr((cursor.ca+cw)/8)
local ke=flr((cursor.cb+cx)/8)
local kf=kd*8-cw
local kg=ke*8-cx
kh=false
ki=false
ds=false
local w=bo.bs.fi
local h=bo.bs.fj
for ec=-1,w do
for ed=-1,h do
if ec==-1 or ec==w or ed==-1 or ed==h then
if(gd(kd+ec,ke+ed)==16 or gd(kd+ec,ke+ed)>=63) kh=true
else
local ft=gd(kd+ec,ke+ed)
if(ft>=9 and ft<=15) ds=true
if(o[kd+ec..","..ke+ed] or ft==0 or ft<8 or ft>16) ki=true
end
end
end
if(ki) kh=false
fillp("0b1110110110110111.1")
rectfill(kf,kg,
kf+bo.bs.w,kg+bo.bs.h,kh and 11 or 8)
fillp()
end
ka()
if br then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bo.bl then
bo.bp={}
rectfill(6,25,27,92,0)
local kj=1
for dc=1,#bo.bl do
local kk=bo.bl[dc]
if kk.req_id==nil
or q[kk.req_id] then
bo.bp[kj]=kk
if kj>=bh and kj<=bh+2 then
kk:gj(9,28+((kj-bh)*19))
kk:cy()
else
kk:gj(-16,16)
end
if(bi==kk) then
bn=kj
rect(kk.ca-2,kk.cb-2,
kk.ca+17,kk.cb+17,
7)
print(bi.name,30,26,7)
print("cOST:"..bi.cost,85,33,9)
print(bi.description,30,39,6)
end
kj+=1
end
end
end
for ho,kl in pairs(bj) do
kl:cy()
end
end
palt(11,true)
cursor:cy()
end
function bm(ca,cb,km,func_onclick,fc)
add(bj,{
ca=ca,
cb=cb,
w=fc or#km*4+2,
h=8,
km=km,
cu=function(self)
return{
ca=self.ca,
cb=self.cb,
w=self.w,
h=self.h
}
end,
cy=function(self)
if(#km>1) rectfill(self.ca,self.cb,self.ca+self.w,self.cb+self.h,7)
if(#km>1) rectfill(self.ca+1,self.cb+1,self.ca+self.w-1,self.cb+self.h-1,self.kn and 12 or 6)
print(self.km,self.ca+2,self.cb+2,(#km>1) and 0 or(self.kn and 12 or 7))
end,
func_onclick=func_onclick
})
end
function ik()
ko=false
if bo then
cv=true
kp(cq)
kp(cs)
if(bo.dr and not br and not ko) kp(bo.dr)
foreach(bo.bl,kp)
if(br) foreach(bj,kp)
cv=false
end
if not br
and not ko then
foreach(n,kp)
foreach(m,kp)
end
if ic
and not br
and ig>89 and ig<122
and ih>90 and ih<123 then
cw=mid(0,(ig-94)*16,400)
cx=mid(-8,(ih-94)*16,400)
elseif ia then
if(bo) ci(bo.name)
if ko then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=cg return
if(br and bi.km and bi.func_onclick) bi:func_onclick()
if(bo.cz==1 and bo.type==1 and bo!=cg and bo.speed>0) sfx(62)
if(bo.cz==2 and cg and cg.type==1 and cg.cz==1) bo.fn=10 fy(cg,bo) bo=nil
else
if bo
and bo.type==1
and bo.cz==1
and bo.speed>0
and bo.el!=7 then
bo.ga=cocreate(function(hq)
is(hq,flr((cw+ig)/8),flr((cx+ih)/8))
ez(hq)
end)
end
if bo
and bo.bs
and bo.bs.cn>=100
and kh then
local dx=flr((cursor.ca+cw)/8)
local dy=flr((cursor.cb+cx)/8)
local df=bo.bs.ff
dn(df,dx*8,dy*8,1)
gh(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
elseif ie and not br then
bo=nil
end
end
function gh(fe)
fe.cn=0
fe.cd=0
fe.fl=0
fe.gf=false
end
function kp(fe)
fe.kn=kq(cursor,fe)
if ia and fe.kn then
if br then
bi=fe
else
if(fe.type<=2 and gu[flr((cursor.ca+cw)/8)][flr((cursor.cb+cx)/8)]!=16) return
if(fe.el==8) return
if bo
and(fe.id==6 and bo.id==27
or fe.id==14 and bo.id>21)
and fe.cz==1 then
bo.el=7
bo.ey=fe
fe.bx=true
bo.ga=cocreate(function(hq)
is(hq,(fe.ca+16)/8,(fe.cb+16)/8)
ez(hq,9)
end)
return
else
bo=fe
end
end
ko=true
end
end
function fw(kr,ks)
kr*=4
local ft=peek(0x3100+kr+1)
if((band(ft,128)>0)!=ks) ft=bxor(ft,128)
poke(0x3100+kr+1,ft)
end
function hw(kt,ku,
kv,fs,
kw)
for ec=-1,1 do
for ed=-1,1 do
print(kt,ku+ec,kv+ed,kw)
end
end
print(kt,ku,kv,fs)
end
function kq(kx,ky)
local kz=kx:cu()
local la=ky:cu()
return kz.ca<la.ca+la.w and
kz.ca+kz.w>la.ca and
kz.cb<la.cb+la.h and
kz.cb+kz.h>la.cb
end
function cp()
lb=lc(co,"|","\n")
co={}
for dc=2,#lb-1 do
ld={}
for le=1,#lb[dc] do
local ft=lb[dc][le]
if(le!=2 and le<25) ft=tonum(ft)
if(le==25) then
lf=lc(ft,"~")
ft=""
for dc=1,#lf do
ft=ft.."\n"..lf[dc]
end
end
ld[lb[1][le]]=ft
end
co[tonum(lb[dc][1])]=ld
end
end
function go(ft)
local lg=""
local gm=abs(ft)
repeat
lg=(gm%0x0.000a/0x.0001)..lg
gm/=10
until gm==0
if(ft<0) lg="-"..lg
return lg
end
function lc(kt,et,lh)
local iz={}
local lg=''
local li=''
if(lh~=nil) kt=lc(kt,lh)
while#kt>0 do
if type(kt)=='table'then
lg=kt[1]
add(iz,lc(lg,et))
del(kt,lg)
else
lg=sub(kt,1,1)
kt=sub(kt,2)
if lg==et then
add(iz,li)
li=''
else
li=li..lg
end
end
end
add(iz,li)
return iz
end
function fp(hi,hj,ca,cb,iz,w,lj,lk)
local ll,lm=cos(iz),sin(iz)
local ln,lo,lp,lq
local lr,lt=ll,lm
local hg=shl(0xfff8,(w-1))
w*=4
ll*=w-0.5
lm*=w-0.5
local lu,lv=lm-ll+w,-ll-lm+w
w=2*w-1
for lw=0,w do
ln,lo=lu,lv
for lx=0,w do
if band(bor(ln,lo),hg)==0 then
local ly=sget(hi+ln,hj+lo)
if(ly!=lj) pset(ca+lw,cb+lx,lk or ly)
end
ln-=lt
lo+=lr
end
lu+=lr
lv+=lt
end
end
function dv(lz,ma,mb,mc)
return abs(sqrt(((lz-mb)/1000)^2+((ma-mc)/1000)^2)*1000)
end
function ja(hq,md)
local me=3.14159
local mf=0.0087
local gn=md-hq.ej
if gn>0.5 then
gn-=1
elseif gn<-0.5 then
gn+=1
end
if gn>mf then
hq.ej+=mf
elseif gn<-mf then
hq.ej-=mf
else
hq.ej=md
end
if(hq.ej>me) hq.ej-=2*me
if(hq.ej<-me) hq.ej+=2*me
yield()
end
function jk(mg,jm,mh)
local mi=fget(gd(jm.ca,jm.cb),1) and 4 or 1
if(mg.ca!=jm.ca and mg.cb!=jm.cb) return mi+1
return mi
end
function jl(jm,mh)
local mj={}
for ec=-1,1 do
for ed=-1,1 do
if(ec!=0 or ed!=0) mk(jm.ca+ec,jm.cb+ed,mj)
end
end
return mj
end
function mk(ml,mm,mn)
if(not fget(gd(ml,mm),0) and o[ml..","..mm]==nil and ml>=0 and mm>=0 and ml<=63 and mm<=63) add(mn,{ca=ml,cb=mm})
end
function jj(iz,mo)
return abs(iz.ca-mo.ca)+abs(iz.cb-mo.cb)
end
function ji
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
for dc=1,na do
local ne=mz[dc].mx+mz[dc].my
if(ne<=cost) nd,cost=dc,ne
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
function fu(ca,cb,ej,er,es,nl,nm,cn,nn,kr)
local ng={
ca=ca,cb=cb,ej=ej,er=er,es=es,nl=nl,
cn=0,nm=nm or 0.0625,
nn=nn or{7,6,5},kr=kr or 0,
no=cb,np=cn or 8
}
add(u,ng)
end
function ij()
for gl,ng in pairs(u) do
ng.es+=ng.nm
ng.ca+=ng.er
ng.cb+=ng.es
ng.ej+=ng.nl
ng.cn+=1
if(ng.cn>=ng.np) del(u,ng)
end
end
function jz()
for gl,ng in pairs(u) do
local fs=flr((#ng.nn/ng.np)*ng.cn)+1
if(ng.kr) fillp(ng.kr)
circfill(ng.ca,ng.cb,ng.ej,ng.nn[fs])
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
d77dd77d67d6fffdddd776ddddddddddddddddddddd777ddddddddddd1499a77aaa99424d15242f5d22222222555555555f44225bbbbbbbb0000000000000000
76667666561ffff1d576db65d5577655d5555555d5766665d5555555d1299aaaaaa94942d551414fdddddbbdddbbdd5d5fff4445bbbbbbbb0000000000000000
76667666565f4441d76dbbb5d576db65d5557555d5766665d5bbbbb5d52499aaaa9494245552424fdd55bb5ddddbb5dd5f444445bbbddbbb0000000000000000
d6621662165ffff1d66d11b5d76dbbb5d5576655d5d66625d5555555d5424999994942425551424fd55bbddadad5bb5d5fff4765bbd66dbb0000000000000000
d2221222165f1011d66d01b0d66d11b5d55d6255d5dd2225d55aaa55d5542494949424255555114fd5bbd5aadaaddbb55444f66fbbd66dbb0000000000000000
622112211ddf1001d66d0b01d66d01b0d55d2215d5dd2221d5555555d55142424242421599c9554fdbbddaa5ddaad5bb5404dffdbbbddbbb0000000000000000
6115511151551005d56dd015d66d0b01d5551155d5512211d5558555d55f1424242421197a09954fdbd5aadd8d5aaddb544446d4bbb67bbb0000000000000000
66767555d55d5555d5511155d56dd015d5555555d5551115d5588855d5599c9212121119aa09954fd5daa5d888ddaadd52222425bbb67bbb0000000000000000
6d6d65d555d555d5ddddd776ddd111ddddd777ddddddddddddddddddd597a099fffffff49949454fdddddd88888ddddd55555425bbbbbbbbbbbb447bbbbbbbbb
66d1d555155dc055d55576db65555555d5766665d5555555d5588855d59aa094dddddddf242425ffdddaadd888d5aadd5fff2225bbbbbbbbbbb2557bbb5555bb
d555555a5d5cc055d5576dbbb555c055d5766665d5557555d5558555df249492dd929ddf00004ff1dbddaa5d8d5aaddb5ffff225b1b11b1bbb2555dbb507665b
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
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5cc0cc022200225d404777765ee0ee09999242424766666
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
1212000000000000165d85850a0a001200020544030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212008010100c830a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212001010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001010100a0a0d4d0e0e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212370d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016004d010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001200161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a0b000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000032000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000003600003500005d4d4d5d00000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
001212001212003e000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
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

