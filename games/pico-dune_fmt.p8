pico-8 cartridge // http://www.pico-8.com
version 27
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
ci=true
end
function cf(self,cj)
self.ck=0
self.cl=self.cd
if(self.cm>0 and self.cl>0) self.ce=not self.ce
self.cd=cj
end
cn=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|parent2_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
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
81|pICK TARGET|1|||5|1|1|11|nil||nil|||||||||||||||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
co()
cp=cq(cn[80],109,-20,5,{},nil,cc,repair_click)
cr=cq(cn[81],100,-20,5,{},nil,cc,ch)
cs()
cursor={
w=8,
h=8,
ct=function(self)
return{
ca=self.ca+(not cu and cv or 0)+2,
cb=self.cb+(not cu and cw or 0)+1,
w=1,
h=1
}
end,
cx=function(self)
spr((bo and(bo.type==1 and bo.cy==1) or ci) and 1 or 0,
self.ca,self.cb,self.w/8,self.h/8)
end
}
cz()
music"7"
da=0
end
function cz()
for db=1,2 do
for dc=0,31 do
for dd=0,127 do
local de=nil
local df=mget(dd,dc)
if db==1 and df==1 then
dg,dh=dd*8,dc*8
cv,cw=dg-56,dh-56
de=cn[1]
elseif db==2
and df>=48 then
for di in all(
cn) do
if(di.obj_spr!=nil and di.obj_spr==df) de=di break
end
end
if de!=nil then
local dj,dk=dd,dc
if(dj>63) dk+=31 dj-=64
dl(de,dj*8,dk*8)
if(de.type==1 and de.speed>0) mset(dd,dc,0)
end
end
end
end
end
function dl(de,ca,cb,cy,dm)
local dn=cq(de,ca,cb,de.type,nil,l[de.func_init],l[de.func_draw],l[de.func_update],nil)
dn.dp=cq(de,109,0,3,dn,nil,nil,l[de.func_onclick])
dn.cm=dq and de.hitpoint/2 or de.hitpoint
dn.bl={}
for di in all(cn) do
local dr=di.req_faction
if(di.parent_id!=nil and(di.parent_id==dn.id or di.ds==dn.id))
and(dr==nil
or(dr>0 and di.req_faction==c)
or(dr<0 and-c!=dr))
then
add(dn.bl,
cq(di,109,0,4,dn,nil,nil,function(self)
if br then
bo=self
else
cf(self,1)
end
end)
)
dn.bs=dn.bl[1]
end
end
dn.cy=cy or(dt(ca,cb,dg,dh)<75 and 1 or 2)
if dn.cy==1 then
dn.du=c
dn.bz=d
dn.bw=e
q[dn.id]=true
else
dn.du=g
dn.bz=i
dn.bw=j
dn.dp.func_onclick=nil
end
local dv=flr(ca/8)
local dw=flr(cb/8)
if de.type==2 then
dn.dx=53
dn.dy=0
local dz=(de.id==2 or de.id==3)
for ea=0,de.w-1 do
for eb=0,de.h-1 do
ec(dv+ea,dw+eb,dz and 16 or 149)
end
end
if(not dz) add(m,dn)
if dn.id==6 and dn.bk==nil then
p[dn.cy]=dn
local ed,ee=ef(dn,(dn.ca+32)/8,(dn.cb+8)/8,eg)
dl(cn[27],ed*8,ee*8,nil,dn)
end
end
if de.type==1 then
dn.dx=54
if(dn.norotate!=1) dn.eh=flr(rnd"8")*.125
if dn.arms>0 then
dn.ei=function(self)
self.ej=4
self.ek=self.ca+4
self.el=self.cb+4
self.em=self.en.ca+self.en.w/2
self.eo=self.en.cb+self.en.h/2
local ep=self.em-self.ek
local eq=self.eo-self.el
local er=sqrt(ep*ep+eq*eq)
self.es=(ep/er)*2
self.et=(eq/er)*2
sfx(self.arms<100 and 60 or 58,3)
eu(self)
end
if(dn.id==15 or dn.id==16) ec(dv,dw,149)
else
if(dn.id==27) dn.ev=0 dn.ew=p[dn.cy]
end
add(n,dn)
ex(dn)
end
eu(dn)
return dn
end
function cq(ey,ca,cb,ez,bk,func_init,func_draw,func_onclick)
local fa=(ey.w or 1)*8
local fb=(ey.h or 1)*8
local fc={
fd=ey,
id=ey.id,
hitpoint=ey.hitpoint,
ca=ca,
cb=cb,
fe=1,
type=ez,
bk=bk,
func_onclick=func_onclick,
w=fa,
h=fb,
ff=ey.obj_spr,
fg=ey.w or 1,
fh=ey.h or 1,
cm=0,
fi=0,
cd=0,
fj=0,
dy=0,
fk=0,
fl=1,
by=1,
ct=function(self)
return{
ca=self.ca,
cb=self.cb,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cx=func_draw or function(self)
if self.type<=2
and(self.ca+self.w<cv
or self.ca>cv+127
or self.cb+self.h<cw
or self.cb>cw+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.du and self.id!=18) pal(12,self.bz) pal(14,self.bw)
if self.bv then
pal(self.bu,self.bv[self.by])
end
if self.eh then
if not self.fm or self.fm>.025 then
if(self.speed>0) fn(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb+1,.25-self.eh,1,self.trans_col,5)
fn(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ca,self.cb,.25-self.eh,1,self.trans_col,flr(self.fl)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.ca-1,self.cb-1,self.ca+16,self.cb+19,0)
local fo=self.type==4 and self or self.bk
local fp=fo.hitpoint
local fq=self.cd==1 and 12 or(fo.cm<fp*.33 and 8 or fo.cm<fp*.66 and 10 or 11)
local fr=self.cd==1 and(15*(fo.cm/100)) or(15*(fo.cm/fp))
if(fo.cm>0 and not br) rectfill(self.ca,self.cb+17,self.ca+fr,self.cb+18,fq)
end
if self.type>2 then
spr(self.ico_spr,self.ca,self.cb,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
if(self.obj_spr) spr(self.obj_spr,self.ca,self.cb,self.w/8,self.h/8)
end
end
if self.ek then
if self.fire_type==1 then
circfill(self.ek,self.el,0,rnd"2"<1 and 8 or 9)
else
fs(self.ek,self.el,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.type<=2 and self.id>21 and self.cm<self.hitpoint*.33 and rnd"10"<1) fs(self.ca+3.5,self.cb+3.5,1,.1,-.02,.05,-.002,80,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
self.fk=0
end,
ft=function(self)
self.fl=max(self.fl-.4,1)
if self.fk>0 then
fu(5,true)
if(fv==0 or stat(24)>5) fv=1 music"0"
if(self.arms>0 and self.ej==0) fw(self,self.fx)
end
if(self.type<=2 and self.cm<=0 and self.fm==nil) self.ej=5 self.fy=nil self.fm=(self.type==2 and 1 or .5) sfx(self.dx,3) da+=(self.type==2 and 0.25 or 0)
if self.fm then
self.fm-=.025
if self.fm<=0 then
if self.type==2 then
for ea=0,self.fg-1 do
for eb=0,self.fh-1 do
ec(self.ca/8+ea,self.cb/8+eb,15)
end
end
del(m,self)
y[self.fx.cy]+=1
else
local fz,ga=flr(self.ca/8),flr(self.cb/8)
if(ga>31) fz+=64 ga-=32
if(gb(fz,ga)<9) ec(fz,ga,20)
if(self.speed==0) ec(fz,ga,15)
del(n,self)
z[self.fx.cy]+=1
end
if(bo==self) bo=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gc(self.ca+rnd(self.w),self.cb+rnd(self.h))
end
end
if self.framecount!=nil then
self.fi+=1
if self.fi>self.framecount then
self.fi=0
if self.altframe
and self.ej==2 then
self.obj_spr=self.ff+(self.altframe-self.obj_spr)
end
if self.bv then
self.by+=1
if(self.by>#self.bv) self.by=1
end
end
end
if self.ek then
self.ek+=self.es
self.el+=self.et
if dt(
self.ek,self.el,
self.em,self.eo)<2
then
gc(self.ek,self.el,self.fire_type)
local en=self.en
if dt(
self.ek,self.el,
en.ca+en.w/2,
en.cb+en.h/2)<4
then
en.cm-=self.arms
en.fk=self.fire_type
en.fx=self
end
self.ek=nil
end
end
if self.cd>0
and not self.ce
and not self.gd then
if self.cd==1 and self.fj>self.cost then
self.gd=true
if(self.cy==1) sfx"56"
if self.fd.type==1
and self.parent_id!=1 then
local ed,ee=ge(self,self.bk)
dl(self.fd,ed,ee,nil,self.bk)
gf(self)
end
elseif self.cd==2 and self.cm>self.hitpoint then
self.cd=0
if self.type==1 and self.speed>0 then
l.init_repairfact(self.ew)
self.ej=0
self.ca,self.cb=ge(self,self.ew)
end
else
self.ck+=1
self.cm=(self.cd==1 and(self.fj/self.cost)*100 or self.cm+.5)
if(self.ck>(self.cd==1 and 3 or 100) and gg(-1,self.cd==1 and self.bk or self)) self.ck=0 self.fj+=1
end
end
end,
gh=function(self,ca,cb)
self.ca=ca
self.cb=cb
end,
gi=function(self)
return flr(self.ca/8)..","..flr(self.cb/8)
end
}
for gj,gk in pairs(ey) do
if fc[gj]==nil and gk!=""then
fc[gj]=gk
end
end
if(func_init) func_init(fc)
return fc
end
function gg(gl,fc)
if(gm(f[fc.cy])+gl<0) return false
f[fc.cy]+=sgn(gl)*shr(abs(gl),16)
if(fc.cy==1) sfx"63"
return true
end
function gc(ca,cb,gn)
fs(ca,cb,2,
0,0,.1,0,gn==1 and 5 or 30,{5,7,10,8,9,2},rnd"2"<1 and 0xa5a5.8 or 0)
end
function eu(go)
if(go.cy!=1 and go.ej!=4) return
local gp=go.type==2 and 3 or 2
for ea=-gp,gp do
for eb=-gp,gp do
local gq=flr(go.ca/8)+ea
local gr=flr(go.cb/8)+eb
gs[gq][gr]=16
gt(gq,gr)
for eq=-1,1 do
for ep=-1,1 do
gt(gq+ep,gr+eq)
end
end
end
end
end
function _update60()
gu()
if(not br) gv()
if t()%1==0 then
if t()%2==0 then
gw()
else
gx()
end
end
x+=1
end
function _draw()
gy()
gz()
end
function cs()
gs={}
for db=-2,66 do
gs[db]={}
for ha=-2,66 do
gs[db][ha]=0
end
end
end
function hb()
local hc=flr(cv/8)
local hd=flr(cw/8)
palt(0,false)
palt(11,true)
for ea=hc-1,hc+16 do
for eb=hd-1,hd+16 do
if gs[ea][eb]!=0 and gs[ea][eb]!=16 then
spr(gs[ea][eb]+31,ea*8,eb*8)
elseif gs[ea][eb]<16 then
rectfill(ea*8,eb*8,ea*8+7,eb*8+7,0)
end
end
end
end
function gt(ca,cb)
if(ca<0 or ca>#gs or cb<0 or cb>#gs) return
local he=0
if gs[ca][cb]!=0 then
if(gs[ca][cb-1]>0) he+=1
if(gs[ca-1][cb]>0) he+=2
if(gs[ca+1][cb]>0) he+=4
if(gs[ca][cb+1]>0) he+=8
gs[ca][cb]=1+he
end
end
function gx()
r={}
if bc then
for db=0,124,4 do
for ha=0,124,4 do
local dd=db/2
local dc=ha/2
if(dc>=32) dd+=64 dc-=32
local hf=mget(dd,dc)
local fq=sget((hf*8)%128+4,(hf*8)/16)
if(gs[db/2][ha/2]==16) r[(db/2/2)..","..(ha/2/2)]=fq!=11 and fq or 15
end
end
end
hg=0
hh=0
hi=false
hj={0,0}
for hk,hl in pairs(m) do
local gq=flr(hl.ca/8)
local gr=flr(hl.cb/8)
if hl.cy==1 or(bc and gs[gq][gr]==16) then
r[flr(hl.ca/2/8)..","..flr(hl.cb/2/8)]=hl.bz
end
if hl.cy==1 then
hg-=hl.power
if(hl.id==7) hi=true
if(sub(hl.name,1,5)=="sPICE") hh+=1000
end
hj[hl.cy]+=1
end
if bc then
for hk,hm in pairs(n) do
if hm.cy==1 or gs[flr(hm.ca/8)][flr(hm.cb/8)]==16 then
r[flr(hm.ca/2/8)..","..flr(hm.cb/2/8)]=hm.bz
end
end
if(hn and gs[mid(0,flr(ho/8),31)][mid(0,flr(hp/8),31)]==16) r[flr(ho/2/8)..","..flr(hp/2/8)]=7
end
bc=(hi and hg>0)
fu(5,false)
fv=2
if(f[3]>0 and f[1]>f[3]) hq=1
if(hj[2]==0 and b>1) hq=2
if(hj[1]==0) hq=3
if hq then
dset(14,hq)
dset(13,t()-v)
dset(10,hr)
dset(24,gm(f[2]))
dset(11,z[1])
dset(25,z[2])
dset(12,y[1])
dset(26,y[2])
rectfill(30,54,104,70,0)
?"mission "..(hq<3 and"complete"or"failed"),36,60,8
flip()
load("pico-dune-main")
end
end
function gw()
o={}
for gj,hm in pairs(n) do
o[hm:gi()]=gj
end
end
function gu()
hs,ht,hu=stat"32",stat"33",stat"34"
hv=(hu==1 and hw!=hu) or btnp"4"
hx=(hu>0) or btn"4"
hy=(hu==2 and hw!=hu) or btnp"5"
for gj=0,1 do
if(btn(gj)) ba+=gj*2-1
if(btn(gj+2)) bb+=gj*2-1
if(btnp(4,1)) stop("paused")
end
hz=mid(0,hs+ba,127)
ia=mid(0,ht+bb,127)
cursor.ca=hz
cursor.cb=ia
if not br then
if(hz<4) cv-=2
if(hz>123) cv+=2
if(ia<4) cw-=2
if(ia>123) cw+=2
cv=mid(cv,384)
cw=mid(-8,cw,384)
for hk,hm in pairs(n) do
if hm then
if hm.fy and costatus(hm.fy)!='dead'then
assert(coresume(hm.fy,hm))
else
hm.fy=nil
end
if hn
and fget(gb(flr(hm.ca/8),flr(hm.cb/8)),2)
and dt(ho,hp,hm.ca,hm.cb)<1
then
del(n,hm)
ib=.01
end
end
end
ic()
end
ie()
hw,cg,bt=hu,bo,bi
end
function ig(ca,cb)
local fr=gb(ca,cb)
return fr>=2 and fr<=8
end
function ex(hm,ih)
hm.ej=ih or 0
hm.fy=cocreate(function(self)
while true do
if rnd(500)<1 and self.arms>0 and self.ej!=8 then
ef(self,flr(self.ca/8),flr(self.cb/8),ii,self.range)
end
local ew=self.ew
if self.id==27 then
if self.ej==0 or self.ej==7 or self.ej==9 then
if self.ev<=1500
and self.ej!=7 and self.ej!=9 then
local ij,ik
local il,im=flr(self.ca/8),flr(self.cb/8)
if ig(il,im) and not self.io then
ij,ik=il,im
else
ef(self,il,im,
function(hm,ca,cb)
if ig(ca,cb) and rnd"10"<1 then
ij,ik=ca,cb
return true
end
end,
10)
end
if ij and ik then
ip(hm,ij,ik)
if(ig(flr(hm.ca/8),flr(hm.cb/8))) hm.ej=6
end
end
elseif self.ev>=1500
and self.ej!=7 then
self.ej=7
ew.bx=true
ip(self,(ew.ca+16)/8,ew.cb/8)
self.ej=9
elseif self.ej==6 then
self.io=false
local eh=hm.eh+.75
iq(hm.ca,hm.cb,hm.eh+.75+rnd".2"-.1)
local ir=hm:gi()
s[ir]=(s[ir] or 10000)-1
self.ev=(self.ev or 0)+.5
if s[ir]<=0 then
local dv=flr(self.ca/8)
local dw=flr(self.cb/8)
for eb=-1,1 do
for ea=-1,1 do
fr=gb(dv+ea,dw+eb)
ec(dv+ea,dw+eb,
(ea==0 and eb==0) and 0 or((fr>1 and fr<8) and 8 or fr)
)
end
end
self.ej=0
end
if(self.ev%300==0) self.io=true self.ej=0
end
end
if self.id>21 then
if self.ej==9 then
if ew.cm>0 and not ew.is then
ew.bx=false
self.ej=8
self.eh=.25
self.ca=ew.ca+16
self.cb=ew.cb+4
if(bo==self) bo=nil
if self.ev then
ew.is=true
while self.ev>0 do
self.ev-=1
if(flr(self.ev)%4==0 and tonum(hr)<hh) gg(2,self)
yield()
end
self.ev=0
ew.is=false
self.ej=0
else
self.cd=2
self.ck=0
ew.bu=8
ew.bv={7,10,0,0,7,0,0}
end
end
end
end
yield()
end
end)
end
function ge(fc,en)
local ed,ee=ef(fc,(en.ca+8)/8,(en.cb+16)/8,eg)
return ed*8,ee*8
end
function iq(ca,cb,eh)
local it,iu=sin(eh)*5.5,-cos(eh)*5.5
if(rnd"5"<1) fs(ca+it+3.5,cb+iu+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
end
function fw(hm,en)
hm.ej=3
hm.en=en
hm.fy=cocreate(function(self)
while en.cm>0 do
local iv=dt(hm.ca,hm.cb,en.ca,en.cb)
if iv>hm.range*5
and hm.speed>0 then
ip(hm,flr(en.ca/8),flr(en.cb/8),hm.range*5)
end
if not hm.norotate then
local iw=atan2(hm.ca-en.ca,hm.cb-en.cb)
while(hm.eh!=iw) do
ix(hm,iw)
end
end
if(iv<=hm.range*5) then
hm.dy-=1
if(hm.dy<=0 and not hm.ek) hm.ei(hm) hm.dy=hm.arms*4
elseif hm.speed==0 then
ex(hm)
end
yield()
end
ex(self)
end)
end
function ef(hm,ca,cb,iy,iz)
for dt=1,iz or 64 do
for ea=ca-dt,ca+dt do
for eb=cb-dt,cb+dt do
if((ea==ca-dt or ea==ca+dt or eb==cb-dt or eb==cb+dt) and(iy(hm,ea,eb))) return ea,eb
end
end
yield()
end
end
function gb(dd,dc)
if(dc>31) dd+=64 dc-=32
return mget(dd,dc)
end
function ec(dd,dc,ja)
if(dc>31) dd+=64 dc-=32
mset(dd,dc,ja)
end
function eg(hm,ca,cb)
return not fget(gb(ca,cb),0)
and o[ca..","..cb]==nil
end
function ii(hm,ca,cb)
local en=n[o[ca..","..cb]]
if(en!=jb and en.cy!=hm.cy and gs[ca][cb]==16) fw(hm,en) return true
end
function ip(hm,ca,cb,jc)
::restart_move_unit::
hm.jd="init"
if not eg(nil,ca,cb) then
ca,cb=ef(hm,ca,cb,eg)
end
hm.il=ca
hm.im=cb
hm.je=hm.ej
hm.ej=1
hm.jd=jf(
{ca=flr(hm.ca/8),cb=flr(hm.cb/8)},
{ca=hm.il,cb=hm.im},
jg,
jh,
ji,
function(jj) return shl(jj.cb,8)+jj.ca end,
nil)
hm.je=hm.ej
hm.ej=2
hm.ej=2
if hm.jd!=nil then
for db=#hm.jd-1,1,-1 do
local jj=hm.jd[db]
if not hm.norotate then
local iw=atan2(
hm.ca-(jj.ca*8),
hm.cb-(jj.cb*8))
while(hm.eh!=iw) do
ix(hm,iw)
end
end
if(not eg(nil,jj.ca,jj.cb)) goto restart_move_unit
local jk=hm.speed or .5
local jl=sqrt((jj.ca*8-hm.ca)^2+(jj.cb*8-hm.cb)^2)
local jm=jk*(jj.ca*8-hm.ca)/jl
local jn=jk*(jj.cb*8-hm.cb)/jl
for db=0,jl/jk-1 do
o[jj.ca..","..jj.cb]=hm
hm.ca+=jm
hm.cb+=jn
yield()
end
hm.ca,hm.cb=jj.ca*8,jj.cb*8
o[jj.ca..","..jj.cb]=hm
eu(hm)
if(dt(hm.ca,hm.cb,hm.il*8,hm.im*8)<=(jc or 0)) break
end
end
hm.ej=0
end
function gy()
cls"15"
camera(cv+(16-rnd(32))*da,cw+(16-rnd(32))*da)
da=(da>0.05) and da*0.95 or 0
if hn then
for db=1,#hn do
if(db%2==1) fillp(0xa5a5.8)
circfill(
hn[db][1]+4,
hn[db][2]+4,4,
jo[db%#jo+1])
fillp()
end
if(ib>0) spr(94+ib,ho,hp)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for hk,hl in pairs(m) do
if not br then
hl:ft()
if(hl.bs) hl.bs:ft()
end
hl:cx()
if(hl==bo) rect(bo.ca,bo.cb,bo.ca+bo.w-1,bo.cb+bo.h-1,7)
end
pal()
for hk,hm in pairs(n) do
if(not br) hm:ft()
if(hm.cd!=2 or hm.speed==0) hm:cx()
if(hm==bo) spr(17,bo.ca,bo.cb)
end
jp()
hb()
end
function jq()
rect(90,90,125,125,d)
rect(91,91,124,124,e)
rectfill(92,92,123,123,0)
if bc!=be then
bd=bc and 1 or 59
jr=bc and 1 or-1
sfx"55"
gx()
end
be=bc
if bd>0 and bd<60 then
bd+=jr
clip(
max(108-bd,91),
max(108-(bd>20 and bd-20 or 0),91),
min(bd*2,33),
min((bd>20 and bd-20 or 1)*2,33))
for db=1,300 do
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
local it=92+cv/16
local iu=92+cw/16
rect(it,iu,it+7,iu+7,7)
end
function js(jt)
bf=jt
bg=500
end
function gz()
camera(0,0)
pal()
palt(0,false)
if bo and bo.dp then
bo.dp:gh(109,20)
bo.dp:cx()
if bo.bs and bo.cy==1 then
bo.bs:gh(109,44)
bo.bs:cx()
end
if bo.cm<bo.hitpoint
and bo.cy==1
and bo.id!=4
and(bo.type==2
or bo.speed==0) then
cp:gh(117,28)
cp:cx()
end
if bo.id==19
and bo.dy<=0 then
cr:gh(109,29)
cr:cx()
end
end
rectfill(0,0,127,8,9)
if(bg>0) bg-=1 print(bf,2,2,0)
hr=gm(f[1])
? sub("000000",#hr+1)..hr,103,2,e
if bo
and bo.bs
and(bo.bs.type==4
or bo.bs.speed==0)
and bo.bs.cm>=100 then
local ju=flr((cursor.ca+cv)/8)
local jv=flr((cursor.cb+cw)/8)
local jw=ju*8-cv
local jx=jv*8-cw
jy=false
jz=false
dq=false
local w=bo.bs.fg
local h=bo.bs.fh
for ea=-1,w do
for eb=-1,h do
if ea==-1 or ea==w or eb==-1 or eb==h then
if(gb(ju+ea,jv+eb)==16 or gb(ju+ea,jv+eb)>=63) jy=true
else
local fr=gb(ju+ea,jv+eb)
if(fr>=9 and fr<=15) dq=true
if(o[ju+ea..","..jv+eb] or fr==0 or fr<8 or fr>16) jz=true
end
end
end
if(jz) jy=false
fillp("0b1110110110110111.1")
rectfill(jw,jx,
jw+bo.bs.w,jx+bo.bs.h,jy and 11 or 8)
fillp()
end
jq()
if br then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,e)
rect(4,23,123,94,d)
if bo.bl then
bo.bp={}
rectfill(6,25,27,92,0)
local ka=1
for db=1,#bo.bl do
local kb=bo.bl[db]
if kb.req_id==nil
or q[kb.req_id] then
bo.bp[ka]=kb
if ka>=bh and ka<=bh+2 then
kb:gh(9,28+(ka-bh)*19)
kb:cx()
else
kb:gh(-16,16)
end
if(bi==kb) then
bn=ka
rect(kb.ca-2,kb.cb-2,
kb.ca+17,kb.cb+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,39,6
end
ka+=1
end
end
end
for hk,kc in pairs(bj) do
kc:cx()
end
end
palt(11,true)
cursor:cx()
end
function bm(ca,cb,kd,func_onclick,fa)
add(bj,{
ca=ca,
cb=cb,
w=fa or#kd*4+2,
h=8,
kd=kd,
ct=function(self)
return{
ca=self.ca,
cb=self.cb,
w=self.w,
h=self.h
}
end,
cx=function(self)
if(#kd>1) rectfill(self.ca,self.cb,self.ca+self.w,self.cb+self.h,7)
if(#kd>1) rectfill(self.ca+1,self.cb+1,self.ca+self.w-1,self.cb+self.h-1,self.ke and 12 or 6)
? self.kd,self.ca+2,self.cb+2,(#kd>1) and 0 or(self.ke and 12 or 7)
end,
func_onclick=func_onclick
})
end
function ie()
kf=false
if bo then
cu=true
kg(cp)
kg(cr)
if(bo.dp and not br and not kf) kg(bo.dp)
foreach(bo.bl,kg)
if(br) foreach(bj,kg)
cu=false
end
if not br
and not kf then
foreach(n,kg)
foreach(m,kg)
end
if hx
and not br
and hz>89 and hz<122
and ia>90 and ia<123 then
cv=mid(0,(hz-94)*16,400)
cw=mid(-8,(ia-94)*16,400)
elseif hv then
if(bo) js(bo.name)
if kf then
if(not br and bo.func_onclick and bo.bk!=nil) bo:func_onclick() bo=cg return
if(br and bi.kd and bi.func_onclick) bi:func_onclick()
if(bo.cy==1 and bo.type==1 and bo!=cg and bo.speed>0) sfx(62)
if(bo.cy==2 and cg and cg.type==1 and cg.cy==1) bo.fl=10 fw(cg,bo) bo=nil
else
if bo
and bo.type==1
and bo.cy==1
and bo.speed>0
and bo.ej!=7 then
bo.fy=cocreate(function(hm)
ip(hm,flr((cv+hz)/8),flr((cw+ia)/8))
ex(hm)
end)
end
if bo
and bo.bs
and bo.bs.cm>=100
and jy then
local dv=flr((cursor.ca+cv)/8)
local dw=flr((cursor.cb+cw)/8)
local de=bo.bs.fd
dl(de,dv*8,dw*8,1)
gf(bo.bs)
sfx"61"
end
if(not br) bo=nil
end
elseif hy and not br then
bo=nil
end
end
function gf(fc)
fc.cm=0
fc.cd=0
fc.fj=0
fc.gd=false
end
function kg(fc)
fc.ke=kh(cursor,fc)
if hv and fc.ke then
if br then
bi=fc
else
if(fc.type<=2 and gs[flr((cursor.ca+cv)/8)][flr((cursor.cb+cw)/8)]!=16) return
if(fc.ej==8) return
if bo
and(fc.id==6 and bo.id==27
or fc.id==14 and bo.id>21)
and fc.cy==1 then
bo.ej=7
bo.ew=fc
fc.bx=true
bo.fy=cocreate(function(hm)
ip(hm,(fc.ca+16)/8,(fc.cb+16)/8)
ex(hm,9)
end)
return
else
bo=fc
end
end
kf=true
end
end
ki=0
function gv()
if(t()>k and t()%k*2==0) then
local kj=n[flr(rnd(#n))+1]
if kj.cy==2 and kj.arms>0 and kj.ej==0 then
local kk=(rnd(2)<1) and n[flr(rnd(#n))+1] or m[flr(rnd(#m))+1]
if(kk and kk.cy==1) fw(kj,kk)
end
local kl=m[flr(rnd(#m))+1]
if kl.cy==2 then
if kl.bs and kl.bs.fd.type==1 and kl.bs.cd!=1 then
local km=kl.bl[flr(rnd(#kl.bl))+1]
kl.bs=km
km:func_onclick()
end
if kl.cm<kl.hitpoint and kl.cd!=2 then
cf(kl,2)
end
end
end
ki-=1
if(ki<0) then
if hn then
hn=nil
else
hn,kn,ko,jo,ib={{rnd(500),rnd(500)}},rnd(1),0,{15,9,4},0
end
ki=rnd(5000)
end
if hn then
if(x%6<1 or#hn<30) and ib==0 then
while#hn<31 do
if(rnd(9)<.5) ko=rnd(.04)-.02
ho,hp=hn[#hn][1],hn[#hn][2]
add(hn,{ho+sin(kn),hp-cos(kn)})
kn+=ko
end
end
if(#hn>30) del(hn,hn[1])
if(ib>0) ib+=.01 iq(ho,hp,rnd"1")
if(ib>2) ib=0
end
end
function fu(kp,kq)
kp*=4
local fr=peek(0x3100+kp+1)
if((band(fr,128)>0)!=kq) fr=bxor(fr,128)
poke(0x3100+kp+1,fr)
end
function kh(kr,ks)
local kt=kr:ct()
local ku=ks:ct()
return kt.ca<ku.ca+ku.w and
kt.ca+kt.w>ku.ca and
kt.cb<ku.cb+ku.h and
kt.cb+kt.h>ku.cb
end
function co()
kv=kw(cn,"|","\n")
cn={}
for db=2,#kv-1 do
kx={}
for ky=1,#kv[db] do
local fr=kv[db][ky]
if(ky!=2 and ky<25) fr=tonum(fr)
if(ky==25) then
kz=kw(fr,"~")
fr=""
for db=1,#kz do
fr=fr.."\n"..kz[db]
end
end
kx[kv[1][ky]]=fr
end
cn[tonum(kv[db][1])]=kx
end
end
function gm(fr)
local la=""
local gk=abs(fr)
repeat
la=(gk%0x0.000a/0x.0001)..la
gk/=10
until gk==0
if(fr<0) la="-"..la
return la
end
function kw(lb,er,lc)
local iw={}
local la=''
local ld=''
if(lc~=nil) lb=kw(lb,lc)
while#lb>0 do
if type(lb)=='table'then
la=lb[1]
add(iw,kw(la,er))
del(lb,la)
else
la=sub(lb,1,1)
lb=sub(lb,2)
if la==er then
add(iw,ld)
ld=''
else
ld=ld..la
end
end
end
add(iw,ld)
return iw
end
function fn(ij,ik,ca,cb,iw,w,le,lf)
local lg,lh=cos(iw),sin(iw)
local li,lj,lk,ll
local lm,ln=lg,lh
local he=shl(0xfff8,(w-1))
w*=4
lg*=w-0.5
lh*=w-0.5
local lo,lp=lh-lg+w,-lg-lh+w
w=2*w-1
for lq=0,w do
li,lj=lo,lp
for lr=0,w do
if band(bor(li,lj),he)==0 then
local lt=sget(ij+li,ik+lj)
if(lt!=le) pset(ca+lq,cb+lr,lf or lt)
end
li-=ln
lj+=lm
end
lo+=lm
lp+=ln
end
end
function dt(lu,lv,lw,lx)
return abs(sqrt(((lu-lw)/1000)^2+((lv-lx)/1000)^2)*1000)
end
function ix(hm,ly)
local lz=3.14159
local ma=0.0087
local gl=ly-hm.eh
if gl>0.5 then
gl-=1
elseif gl<-0.5 then
gl+=1
end
if gl>ma then
hm.eh+=ma
elseif gl<-ma then
hm.eh-=ma
else
hm.eh=ly
end
if(hm.eh>lz) hm.eh-=2*lz
if(hm.eh<-lz) hm.eh+=2*lz
yield()
end
function jh(mb,jj,mc)
local md=fget(gb(jj.ca,jj.cb),1) and 4 or 1
if(mb.ca!=jj.ca and mb.cb!=jj.cb) return md+1
return md
end
function ji(jj,mc)
local me={}
for ea=-1,1 do
for eb=-1,1 do
if(ea!=0 or eb!=0) mf(jj.ca+ea,jj.cb+eb,me)
end
end
return me
end
function mf(mg,mh,mi)
if(not fget(gb(mg,mh),0) and o[mg..","..mh]==nil and mg>=0 and mh>=0 and mg<=63 and mh<=63) add(mi,{ca=mg,cb=mh})
end
function jg(iw,mj)
return abs(iw.ca-mj.ca)+abs(iw.cb-mj.cb)
end
function jf
(mk,
ml,
mm,
mn,
me,
mo,
mc)
local mp,
mq={
mr=mk,
ms=0,
mt=mm(mk,ml,mc)
},{}
mq[mo(mk,mc)]=mp
local mu,mv,mw,mx={mp},1,mo(ml,mc),32767.99
local count=0
while mv>0 do
local cost,my=mx
for db=1,mv do
local mz=mu[db].ms+mu[db].mt
if(mz<=cost) my,cost=db,mz
end
mp=mu[my]
mu[my],mp.na=mu[mv],true
mv-=1
local nb=mp.mr
if mo(nb,mc)==mw then
nb={ml}
while mp.nc do
mp=mq[mo(mp.nc,mc)]
add(nb,mp.mr)
end
return nb
end
for nd in all(me(nb,mc)) do
local id=mo(nd,mc)
local ne,nf=
mq[id],
mp.ms+mn(nb,nd,mc)
if not ne then
ne={
mr=nd,
ms=mx,
mt=mm(nd,ml,mc)
}
mv+=1
mu[mv],mq[id]=ne,ne
end
if not ne.na and ne.ms>nf then
ne.ms,ne.nc=nf,nb
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) return nil
end
end
end
function fs(ca,cb,eh,ep,eq,ng,nh,cm,ni,kp)
local nb={
ca=ca,cb=cb,eh=eh,ep=ep,eq=eq,ng=ng,
cm=0,nh=nh or 0.0625,
ni=ni or{7,6,5},kp=kp or 0,
nj=cb,nk=cm or 8
}
add(u,nb)
end
function ic()
for gj,nb in pairs(u) do
nb.eq+=nb.nh
nb.ca+=nb.ep
nb.cb+=nb.eq
nb.eh+=nb.ng
nb.cm+=1
if(nb.cm>=nb.nk) del(u,nb)
end
end
function jp()
for gj,nb in pairs(u) do
local fq=flr((#nb.ni/nb.nk)*nb.cm)+1
if(nb.kp) fillp(nb.kp)
circfill(nb.ca,nb.cb,nb.eh,nb.ni[fq])
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
1515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000151516161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1500000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000001516030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163e420a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120032165d85850a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212123710100c830a85420a6c0a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001010100a0a0d4d440e0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212090d090d0e00850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016004d010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12121212120016005d850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001200161685680a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016850a0a100a0a0a0a0a0a17191b1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000005d854d855d6a0a5d855d1d1e1e1f0a0a0a0a0a0a0b000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
16000000000000000d0a6e0a0a1a1b1c1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

