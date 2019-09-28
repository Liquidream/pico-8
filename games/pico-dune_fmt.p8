pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
b=false
c=3
d=8
e=2
f=0
f+=shr(135,16)
g=1
i=12
j=1
k=1000
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
bg={}
bg.factory_click=function(self)
bh=1
bi=self.bj.bk[1]
bl(6,89,"⬆️",function(self)
bm=mid(1,bm-1,#r.bk)
bi=r.bk[bm]
if(bm<bh) bh-=1
end,10)
bl(17,89,"⬇️",function(self)
bm=mid(1,bm+1,#r.bk)
bi=r.bk[bm]
if(bm>bh+2) bh=min(bh+1,#bn.bj.bk-2)
end,10)
bl(32,88,"build",function(self)
bn=nil
be={}
r.bo=bp
bp:func_onclick()
end)
bl(96,88,"close",function(self)
bn=nil
end)
bn=self
end
bg.init_windtrap=function(self)
self.bq={
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
self.br=1
end
bg.bs=function(self)
self.bq={
{11,d},
{10,d},
{9,d},
{9,d},
{9,d},
{9,d},
}
self.br=1
end
bg.bt=function(self)
pal()
palt(0,false)
pal(11,e)
pal(10,e)
pal(9,e)
if self.bu then
if self.bq then
pal(self.bq[self.br][1],
self.bq[self.br][2])
end
else
pal(11,d)
self.br=1
end
spr(self.obj_spr,self.bv,self.bw,self.w/8,self.h/8)
end
bg.bx=function(self)
pal()
palt(0,false)
palt(11,true)
if(by()) pal(7,8)
spr(self.obj_spr,self.bv,self.bw)
pal()
end
bg.bz=function(self)
self.bj.ca=0
if(self.bj.cb<self.bj.cc.hitpoint) self.bj.cd=not self.bj.cd
end
ce=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|fire_type|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|nil||400|||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|nil||0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|nil||0|||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|nil||50|||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|100||200||||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30||450||||||10|tHE rEFINERY CONVERTS SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30||500|||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5||150|||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10||300|||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10||400|||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20||350|||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20||200|||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35||400|||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20||200|||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||2|1|1|nil|1|7|5||125|10||200|||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||2|1|1|nil|1|7|6||250|20||200|||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50||500|||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40||400|||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80||1000|||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|AO|60||4|50|0.05|2|1|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|HO|100||8|110|0.1|3|1|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|100|0.6|3|1||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD|55|206||1|1|1|11|11||3||200||10|130|0.5|3|1||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|200|0.25|4|1||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|300|0.2|5|1||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|100|0.3|9|2||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|150|0.1|0|||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|100|2|0|||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|AO|600||75|5|1.5|5|2||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4||900||0|150|0|0|||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|A|600||90|110|0.3|8|11||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|A|0||8|220|0.1|3|1||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|H|800||60|400|0.1|7|1||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|H|0||150|70|2.5|nil|20||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER||||1|1|1|11|11||2|O|150||8|80|0.75|3|1||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|O|750||0|120|0.3|7|11||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|O|0||150|40|0.4|2|||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|110|0.1|1|||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||9|1|1|11|nil|nil|3||0||300|1000|0.35|0|30||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||
80|rEPAIR|47|47||5|1|1|11|nil|nil|||||||||||||||draw_repair||repair_click]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
cartdata("pn_picodune")
cf()
cg=1
ch()
ci=0
cursor={
bv=0,
bw=0,
w=8,
h=8,
spr=0,
cj=function(self)
return{
bv=self.bv+(not ck and l or 0)+2,
bw=self.bw+(not ck and m or 0)+1,
w=1,
h=1
}
end,
cl=function(self)
spr((r and(r.type==1)) and 1 or self.obj_spr,
self.bv,self.bw,self.w/8,self.h/8)
end
}
cm()
l=44
m=20
music(9)
end
function cm()
for cn=1,2 do
for co=0,31 do
for cp=0,127 do
local cq=nil
local cr=mget(cp,co)
local cs=fget(cr)
if cn==1 and cr==1 then
ct=cp*8
cu=co*8
cq=ce[1]
elseif cn==2
and cr!=63 then
for cv in all(
ce) do
if(cv.obj_spr!=nil and cv.obj_spr==cr) cq=cv break
end
end
if cq!=nil then
cw(cq,cp*8,co*8)
if cq.type==1 then
mset(cp,co,17)
end
end
end
end
end
end
function cw(cq,bv,bw,cx,cy)
local cz=da(cq,bv,bw,cq.type,nil,bg[cq.func_init],bg[cq.func_draw],bg[cq.func_update],nil)
cz.db=da(cq,109,0,3,cz,nil,nil,bg[cq.func_onclick])
cz.cb=dc and cq.hitpoint/2 or cq.hitpoint
cz.bk={}
for cv in all(ce) do
if(cv.parent_id!=nil and cv.parent_id==cz.id) then
local bo=da(cv,109,0,4,cz,nil,nil,function(self)
if bn then
r=self
else
self.dd=cocreate(function(self)
self.de=0
self.df=0
while self.df<self.cost do
self.de+=1
if(self.de>3 and dg(-1)) self.de=0 self.df+=1
self.cb=(self.df/self.cost)*100
yield()
end
sfx(56)
if self.cc.type==1 then
local dh,di=dj(self,(self.bj.bv+8)/8,(self.bj.bw+16)/8,dk)
cw(self.cc,dh*8,di*8,self)
self.cb=0
end
end)
end
end)
add(cz.bk,bo)
cz.bo=cz.bk[1]
end
end
cz.dl=da(ce[80],109,-20,5,cz,nil,bg.bx,bg.bz)
cz.cy=cy or(dm(bv,bw,ct,cu)<75 and 1 or 2)
cz.cx=cx
if cz.cy==1 then
cz.dn=c
cz.dp=d
cz.dq=e
else
cz.dn=g
cz.dp=i
cz.dq=j
cz.db.func_onclick=nil
end
if cq.type==2 then
cz.dr=53
local ds=flr(bv/8)
local dt=flr(bw/8)
local du=(cq.id==2 or cq.id==3)
for dv=0,cq.w-1 do
for dw=0,cq.h-1 do
dx(ds+dv,dt+dw,du and 63 or 95)
end
end
if(not du) add(bd,cz)
if(cz.id==7 and cz.cy==1) x=true
if cz.id==6 and cz.bj==nil then
local dh,di=dj(cz,(cz.bv+32)/8,(cz.bw+8)/8,dk)
local dy=cw(ce[27],dh*8,di*8,cz)
dy.dz=0
end
end
if cq.type==1 then
cz.dr=54
if(cz.norotate!=1) cz.ea=flr(rnd(8))*.125
if cz.arms then
cz.eb=function(self)
self.ec=4
self.ed=self.bv+4
self.ee=self.bw+4
self.ef=self.eg.bv+self.eg.w/2
self.eh=self.eg.bw+self.eg.h/2
local ei=self.ef-self.ed
local ej=self.eh-self.ee
local ek=sqrt(ei*ei+ej*ej)
self.el=(ei/ek)*2
self.em=(ej/ek)*2
sfx(self.arms<100 and 60 or 58,3)
en(self)
end
else
end
add(bb,cz)
eo(cz)
end
en(cz)
return cz
end
function da(ep,bv,bw,eq,bj,func_init,func_draw,func_onclick)
local er=(ep.w or 1)*8
local es=(ep.h or 1)*8
local et={
cc=ep,
bv=bv,
bw=bw,
eu=1,
type=eq,
bj=bj,
func_onclick=func_onclick,
w=er,
h=es,
ev=ep.obj_spr,
ew=ep.w or 1,
ex=ep.h or 1,
cb=0,
ey=0,
ez=0,
fa=0,
fb=1,
cj=function(self)
return{
bv=self.bv,
bw=self.bw,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cl=func_draw or function(self)
if self.type<=2
and(self.bv+self.w<l
or self.bv>l+127
or self.bw+self.h<m
or self.bw>m+127)
then
return
end
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.dn) pal(12,self.dp) pal(14,self.dq)
if self.bq then
pal(self.bq[self.br][1],
self.bq[self.br][2])
end
if self.ea then
if not self.fc or self.fc>.025 then
fd(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bv,self.bw+1,.25-self.ea,1,self.trans_col,5)
fd(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bv,self.bw,.25-self.ea,1,self.trans_col,flr(self.fb)%2==0 and 7 or nil)
end
else
if self.type>2 and self.type<5 then
rectfill(self.bv-1,self.bw-1,self.bv+16,self.bw+19,0)
local fe=self.type==4 and self or self.bj
local ff=fe.cc.hitpoint
local fg=fe.de and 12 or(fe.cb<ff*.33 and 8 or fe.cb<ff*.66 and 10 or 11)
local fh=fe.de and(15*fe.cb/100) or(15*fe.cb/ff)
if(fe.cb>0) rectfill(self.bv,self.bw+17,self.bv+fh,self.bw+18,fg)
end
if self.type>2 then
spr(self.ico_spr,self.bv,self.bw,
self.type==5 and 1 or 2,
self.type==5 and 1 or 2)
else
spr(self.obj_spr,self.bv,self.bw,self.w/8,self.h/8)
end
end
if self.ed then
if(self.fi==1) then
circfill(self.ed,self.ee,0,rnd(2)<1 and 8 or 9)
else
fj(self.ed,self.ee,
0,0,0,.15,-.01,20,{7,7,10,9,8,2,13,6,7},rnd(2)<1 and 0xa5a5.8 or 0)
end
end
if self.type<=2 and self.cb<self.cc.hitpoint*.33 then
if(rnd(10)<1) fj(self.bv+3.5,self.bw+3.5,1,.1,-.02,.1,-.01,40,{10,9,6,5},rnd(2)<1 and 0xa5a5.8 or 0)
end
self.fa=0
if(b) fk(self)
end,
fl=function(self)
self.fb=max(self.fb-.4,1)
if(self.cb<=0 and self.fc==nil) self.ec=5 self.dd=nil self.fc=(self.type==2 and 1 or .5) sfx(self.dr,3)
if self.fc then
self.fc-=.025
if self.fc<=0 then
if self.type==2 then
for dv=0,self.cc.w-1 do
for dw=0,self.cc.h-1 do
mset(self.bv/8+dv,self.bw/8+dw,15)
end
end
del(bd,self)
else
local fm,fn=flr(self.bv/8),flr(self.bw/8)
if(fn>31) fm+=64 fn-=32
if(fo(fm,fn)<9) mset(fm,fn,20)
del(bb,self)
end
if(r==self) r=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fp(self.bv+rnd(self.w),self.bw+rnd(self.h))
end
end
if self.framecount!=nil then
self.ey+=1
if(self.ey>self.framecount) then
self.ey=0
if self.altframe
and self.ec==2 then
self.obj_spr=self.ev+(self.altframe-self.obj_spr)
end
if self.bq then
self.br+=1
if(self.br>#self.bq) self.br=1
end
end
end
if self.ed then
self.ed+=self.el
self.ee+=self.em
if dm(
self.ed,self.ee,
self.ef,self.eh)<2
then
fp(self.ed,self.ee,self.fi)
if dm(
self.ed,self.ee,
self.eg.bv+self.eg.w/2,
self.eg.bw+self.eg.h/2)<4
then
self.eg.cb-=self.arms
self.eg.fa=self.fi
self.eg.fq=self
end
self.ed=nil
end
end
if self.cd then
self.ca+=1
if self.cb<self.cc.hitpoint then
self.cb+=.1
if(self.ca>100 and dg(-1)) self.ca=0
else
self.cd=false
end
end
end,
fr=function(self,bv,bw)
self.bv=bv
self.bw=bw
end,
fs=function(self)
return flr(self.bv/8)..","..flr(self.bw/8)
end
}
for ft,fu in pairs(ep) do
if et[ft]==nil and fu!=""then
et[ft]=fu
end
end
if(func_init) func_init(et)
return et
end
function dg(fv)
if(fw(f)+fv<0) return false
f+=sgn(fv)*shr(abs(fv),16)
sfx(63)
return true
end
function fp(bv,bw,fx)
fj(bv,bw,2,
0,0,.1,0,fx==1 and 5 or 30,{5,7,10,8,9,2},rnd(2)<1 and 0xa5a5.8 or 0)
end
function en(fy)
if(fy.cy!=1 and fy.ec!=4) return
local fz=fy.type==2 and 3 or 2
for dv=-fz,fz do
for dw=-fz,fz do
local ga=flr(fy.bv/8)+dv
local gb=flr(fy.bw/8)+dw
gc[ga][gb]=16
gd(ga,gb)
for ej=-1,1 do
for ei=-1,1 do
gd(ga+ei,gb+ej)
end
end
end
end
end
function _update60()
ge()
gf()
if(t()%1==0) gg()
if(t()%1==0 and t()%2==0) gh()
s+=1
end
function _draw()
gi()
gj()
if(a) gk("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function ch()
gc={}
for cn=-2,66 do
gc[cn]={}
for gl=-2,66 do
gc[cn][gl]=0
end
end
end
function gm()
local gn=flr(l/8)
local go=flr(m/8)
for dv=gn-1,gn+16 do
for dw=go-1,go+16 do
if gc[dv][dw]!=0 and gc[dv][dw]!=16 then
palt(11,true)
spr(gc[dv][dw]+31,dv*8,dw*8)
elseif gc[dv][dw]<16 then
rectfill(dv*8,dw*8,dv*8+7,dw*8+7,0)
end
end
end
end
function gd(bv,bw)
if(bv<0 or bv>#gc or bw<0 or bw>#gc) return
local gp=0
if gc[bv][bw]!=0 then
if(gc[bv][bw-1]>0) gp+=1
if(gc[bv-1][bw]>0) gp+=2
if(gc[bv+1][bw]>0) gp+=4
if(gc[bv][bw+1]>0) gp+=8
gc[bv][bw]=1+gp
end
end
function gh()
z={}
if u then
for cn=0,124,4 do
for gl=0,124,4 do
local cp=cn/2
local co=gl/2
if(co>=32) cp+=64 co-=32
local gq=mget(cp,co)
local gr=(gq*8)%128
local gs=(gq*8)/16
local fg=sget(gr+4,gs)
if(gc[cn/2][gl/2]==16) z[((cn/2)/2)..","..((gl/2)/2)]=fg!=11 and fg or 15
end
end
end
for gt,gu in pairs(bd) do
local ga=flr(gu.bv/8)
local gb=flr(gu.bw/8)
if gu.cy==1 or(u and gc[ga][gb]==16) then
z[flr(gu.bv/2/8)..","..flr(gu.bw/2/8)]=gu.dp
end
end
if u then
for gt,gv in pairs(bb) do
local ga=flr(gv.bv/8)
local gb=flr(gv.bw/8)
if gv.cy==1 or gc[ga][gb]==16 then
z[flr(gv.bv/2/8)..","..flr(gv.bw/2/8)]=gv.dp
end
end
end
end
function gg()
bc={}
for ft,gv in pairs(bb) do
bc[flr(gv.bv/8)..","..flr(gv.bw/8)]=ft
end
end
function ge()
gw=stat(32)
gx=stat(33)
gy=stat(34)
gz=(gy>0 and ha!=gy) or btnp(4)
hb=(gy>0) or btn(4)
hc=btnp(5)
for ft=0,1 do
if(btn(ft)) p+=ft*2-1
if(btn(ft+2)) q+=ft*2-1
end
n=mid(0,gw+p,127)
o=mid(0,gx+q,127)
cursor.bv=n
cursor.bw=o
if not bn then
if(n<4) l-=2
if(n>123) l+=2
if(o<4) m-=2
if(o>123) m+=2
l=mid(l,384)
m=mid(m,384)
hd()
he()
ci+=1
end
hf()
ha=gy
hg=r
bp=bi
end
function hh(bv,bw)
local fh=fo(bv,bw)
return fh>=2 and fh<=8
end
function eo(gv,hi)
gv.ec=hi or 0
gv.dd=cocreate(function(self)
while true do
if(rnd(500)<1 and self.arms>0) dj(self,flr(self.bv/8),flr(self.bw/8),hj,self.range)
if self.fa>0 and self.ec==0 then
hk(5,true)
if(ba==0 or stat(24)>5) ba=1 music(0)
if(self.arms>0) hl(self,self.fq)
end
if self.id==27 then
if self.ec==0 or self.ec==7 or self.ec==9 then
if self.dz<=1500
and self.ec!=7 and self.ec!=9 then
local gr,gs
local hm,hn=flr(self.bv/8),flr(self.bw/8)
if hh(hm,hn) and not self.ho then
gr,gs=hm,hn
else
dj(self,hm,hn,
function(gv,bv,bw)
if hh(bv,bw) and rnd(10)<1 then
gr,gs=bv,bw
return true
end
end,
10)
end
if gr and gs then
hp(gv,gr,gs)
if(hh(flr(gv.bv/8),flr(gv.bw/8))) gv.ec=6
end
elseif self.ec==9 then
if not self.cx.hq then
self.cx.bu=false
self.cx.hq=true
while self.dz>0 do
self.ec=8
self.ea=.25
self.bv=self.cx.bv+16
self.bw=self.cx.bw+4
self.dz-=1
if(r==self) r=nil
if(self.dz%4==0 and self.cy==1) dg(2) sfx(63)
yield()
end
self.dz=0
self.cx.hq=false
self.ec=0
end
end
elseif self.dz>=1500
and self.ec!=7 then
self.ec=7
self.cx.bu=true
hp(self,(self.cx.bv+16)/8,self.cx.bw/8)
self.ec=9
elseif self.ec==6 then
self.ho=false
local ea=gv.ea+.75+rnd(.2)-.1
local hr,hs=sin(ea)*5.5,-cos(ea)*5.5
if(rnd(5)<1) fj(gv.bv+hr+3.5,gv.bw+hs+3.5,1,.15,0,.1,-.01,25,{2,4,9,15},0xa5a5.8)
bf[gv:fs()]=(bf[gv:fs()] or 10000)-1
self.dz=(self.dz or 0)+.5
if bf[gv:fs()]<=0 then
local ds=flr(self.bv/8)
local dt=flr(self.bw/8)
for dw=-1,1 do
for dv=-1,1 do
fh=fo(ds+dv,dt+dw)
dx(ds+dv,dt+dw,
(dv==0 and dw==0) and 0 or((fh>1 and fh<8) and 8 or fh)
)
end
end
self.ec=0
end
if self.dz%300==0 then
self.ho=true
self.ec=0
end
end
end
yield()
end
end)
end
function hl(gv,eg)
gv.ec=3
gv.eg=eg
gv.dd=cocreate(function(self)
while eg.cb>0 do
if dm(gv.bv,gv.bw,eg.bv,eg.bw)>gv.range*5 then
hp(gv,flr(eg.bv/8),flr(eg.bw/8),gv.range*5)
end
if not gv.norotate then
local ht=atan2(gv.bv-eg.bv,gv.bw-eg.bw)
while(gv.ea!=ht) do
hu(gv,ht)
end
end
gv.ez-=1
if(gv.ez<=0 and not gv.ed) gv.eb(gv) gv.ez=gv.arms*2
yield()
end
hk(5,false)
ba=2
eo(self)
end)
end
function dj(gv,bv,bw,hv,hw)
for dm=1,hw or 64 do
for dv=bv-dm,bv+dm do
for dw=bw-dm,bw+dm do
if((dv==bv-dm or dv==bv+dm or dw==bw-dm or dw==bw+dm) and(hv(gv,dv,dw))) return dv,dw
end
end
yield()
end
end
function fo(cp,co)
if(co>31) cp+=64 co-=32
return mget(cp,co)
end
function dx(cp,co,hx)
if(co>31) cp+=64 co-=32
mset(cp,co,hx)
end
function dk(gv,bv,bw)
return not fget(fo(bv,bw),0)
and bc[bv..","..bw]==nil
end
function hj(gv,bv,bw)
local eg=bb[bc[bv..","..bw]]
if(eg!=hy and eg.cy!=gv.cy and gc[bv][bw]==16) hl(gv,eg) return true
end
function hp(gv,bv,bw,hz)
::restart_move_unit::
gv.ia="init"
if not dk(nil,bv,bw) then
bv,bw=dj(gv,bv,bw,dk)
end
gv.hm=bv
gv.hn=bw
gv.ib=gv.ec
gv.ec=1
gv.ia=ic(
{bv=flr(gv.bv/8),bw=flr(gv.bw/8)},
{bv=gv.hm,bw=gv.hn},
ie,
ig,
ih,
function(ii) return shl(ii.bw,8)+ii.bv end,
nil)
gv.ib=gv.ec
gv.ec=2
gv.ec=2
if gv.ia!=nil then
for cn=#gv.ia-1,1,-1 do
local ii=gv.ia[cn]
if not gv.norotate then
local ei=gv.bv-(ii.bv*8)
local ej=gv.bw-(ii.bw*8)
local ht=atan2(ei,ej)
while(gv.ea!=ht) do
hu(gv,ht)
end
end
if(not dk(nil,ii.bv,ii.bw)) goto ij
local ik=gv.speed or .5
local il=sqrt((ii.bv*8-gv.bv)^2+(ii.bw*8-gv.bw)^2)
local im=ik*(ii.bv*8-gv.bv)/il
local io=ik*(ii.bw*8-gv.bw)/il
for cn=0,il/ik-1 do
bc[ii.bv..","..ii.bw]=gv
gv.bv+=im
gv.bw+=io
yield()
end
gv.bv,gv.bw=ii.bv*8,ii.bw*8
bc[ii.bv..","..ii.bw]=gv
en(gv)
if(dm(gv.bv,gv.bw,gv.hm*8,gv.hn*8)<=(hz or 0)) break
end
end
gv.ec=0
end
function hd()
for gt,gv in pairs(bb) do
ip(gv)
end
for gt,gu in pairs(bd) do
ip(gu)
ip(gu.bo)
end
end
function ip(et)
if et then
if et.dd and costatus(et.dd)!='dead'then
assert(coresume(et.dd,et))
else
et.dd=nil
end
end
end
function gf()
end
function gi()
cls"15"
camera(l,m)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for gt,gu in pairs(bd) do
if(not bn) gu:fl()
gu:cl()
if(gu==r) then
rect(r.bv,r.bw,
r.bv+r.w-1,r.bw+r.h-1,
7)
end
end
palt(11,true)
for gt,gv in pairs(bb) do
if(not bn) gv:fl()
gv:cl()
if(gv==r) then
palt(11,true)
spr(16,r.bv,r.bw)
end
end
iq()
gm()
end
function ir()
local fz=31
local bv,bw=93,93
rectfill(bv-1,bw-1,bv+fz+1,bw+fz+1,e)
if(x) u=true
rectfill(bv,bw,bv+fz,bw+fz,0)
if u!=v then
y=1
is=1
sfx(55)
end
v=u
if y>0 and y<60 then
y+=is
clip(
max(bv+(fz/2)-y,bv),
max(bw+(fz/2)-(y>20 and y-20 or 0),bw),
min(y*2,fz),
min((y>20 and y-20 or 1)*2,fz))
for cn=1,300 do
pset(bv+rnd(fz),bw+rnd(fz),5+rnd(3))
end
clip()
return
end
for dv=0,fz do
for dw=0,fz do
if(z[dv..","..dw]) pset(bv+dv,bw+dw,z[dv..","..dw])
end
end
local hr=bv+l/16
local hs=bw+m/16
rect(hr,hs,hr+7,hs+7,7)
end
function gj()
camera(0,0)
pal()
palt(0,false)
if r and r.db then
r.db:fr(109,20)
r.db:cl()
if r.bo and r.cy==1 then
r.bo:fr(109,44)
r.bo:cl()
end
if r.cb<r.cc.hitpoint
and r.dl and r.cy==1 then
r.dl:fr(117,28)
r.dl:cl()
end
end
it=fw(f)
gk(sub("000000",#it+1)..it,103,2,7)
if r
and r.bo
and r.bo.cc.type==2
and r.bo.cb>=100 then
local iu=flr((cursor.bv+l)/8)
local iv=flr((cursor.bw+m)/8)
local iw=iu*8-l
local ix=iv*8-m
iy=false
iz=false
dc=false
local w=r.bo.cc.w
local h=r.bo.cc.h
for dv=-1,w do
for dw=-1,h do
if dv==-1 or dv==w or dw==-1 or dw==h then
if(fo(iu+dv,iv+dw)>=63) iy=true
else
local fh=fo(iu+dv,iv+dw)
if(fh>=9 and fh<=15) dc=true
if(bc[iu+dv..","..iv+dw] or fh==0 or fh<8 or fh>15) iz=true
end
end
end
if(iz) iy=false
fillp("0b1110110110110111.1")
rectfill(iw,ix,
iw+r.bo.w,ix+r.bo.h,iy and 11 or 8)
fillp()
end
ir()
if bn then
ja(121,73,e,d)
if r.bk then
rectfill(6,30,27,97,0)
for cn=1,#r.bk do
local jb=r.bk[cn]
if cn>=bh and cn<=bh+2 then
jb:fr(9,32+((cn-bh)*19))
jb:cl()
else
jb:fr(-16,16)
end
if(bi==jb) then
bm=cn
rect(jb.bv-2,jb.bw-2,
jb.bv+17,jb.bw+17,
7)
print(bi.name,30,31,7)
print("cOST:"..bi.cost,85,38,9)
jc=0
local jd=je(bi.description,23)
for gl in all(jd) do
print(gl,30,44+jc,6)
jc+=6
end
end
end
end
for gt,jf in pairs(be) do
jf:cl()
end
end
palt(11,true)
cursor:cl()
end
function ja(w,h,jg,jh)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-w/2,64-h/2,64+w/2,64+h/2,jg)
rect(64-w/2+1,64-h/2+1,64+w/2-1,64+h/2-1,jh)
end
function bl(bv,bw,ji,func_onclick,er)
local et={
bv=bv,
bw=bw,
w=er or#ji*4+2,
h=8,
ji=ji,
cj=function(self)
return{
bv=self.bv,
bw=self.bw,
w=self.w,
h=self.h
}
end,
cl=function(self)
if(#ji>1) rectfill(self.bv,self.bw,self.bv+self.w,self.bw+self.h,7)
if(#ji>1) rectfill(self.bv+1,self.bw+1,self.bv+self.w-1,self.bw+self.h-1,self.jj and 12 or 6)
print(self.ji,self.bv+2,self.bw+2,(#ji>1) and 0 or(self.jj and 12 or 7))
if(b) fk(self)
end,
func_onclick=func_onclick
}
add(be,et)
end
function je(jk,jl)
local jm={}
local jn=""
local jo=""
local jp=""
local jq=function(jr)
if#jo+#jn>jr then
add(jm,jn)
jn=""
end
jn=jn..jo
jo=""
end
for cn=1,#jk do
jp=sub(jk,cn,cn)
jo=jo..jp
if jp==" "
or#jo>jl-1 then
jq(jl)
elseif#jo>jl-1 then
jo=jo.."-"
jq(jl)
elseif jp==";"then
jn=jn..sub(jo,1,#jo-1)
jo=""
jq(0)
end
end
jq(jl)
if jn!=""then
add(jm,jn)
end
return jm
end
function hf()
js=false
if r then
ck=true
if(r.dl) jt(r.dl)
if(r.db and not bn and not js) jt(r.db)
foreach(r.bk,jt)
foreach(be,jt)
ck=false
end
if not bn
and not js then
foreach(bb,jt)
foreach(bd,jt)
end
if hb
and not bn
and n>93 and n<120
and o>93 and o<120 then
l=min((n-94)*16,400)
m=min((o-94)*16,400)
elseif gz then
if js then
if(not bn and r.func_onclick and r.bj!=nil) r:func_onclick() r=hg return
if(bn and bi.ji and bi.func_onclick) bi:func_onclick()
if(r.cy==1 and r.type==1 and r!=hg) sfx(62)
if(r.cy==2 and hg and hg.type==1 and hg.cy==1) r.fb=10 hl(hg,r) r=nil
else
if r
and r.type==1
and r.cy==1
and(r.id!=27 or r.ec!=7) then
r.dd=cocreate(function(gv)
hp(gv,flr((l+n)/8),flr((m+o)/8))
eo(gv)
end)
end
if r
and r.bo
and r.bo.cb>=100
and iy then
local ds=flr((cursor.bv+l)/8)
local dt=flr((cursor.bw+m)/8)
local cq=r.bo.cc
cw(cq,ds*8,dt*8,nil,1)
r.bo.cb=0
sfx(61)
end
if(not bn) r=nil
end
end
end
function jt(et)
et.jj=ju(cursor,et)
if gz and et.jj then
if bn then
bi=et
else
local ds=flr((cursor.bv+l)/8)
local dt=flr((cursor.bw+m)/8)
if(et.type<=2 and gc[ds][dt]!=16) return
if(et.id==27 and et.ec==8) return
if et.id==6 and r and r.id==27 and r.cy==1 then
r.ec=7
r.cx.bu=true
r.dd=cocreate(function(gv)
gv.cx=et
hp(gv,(et.bv+16)/8,dt)
eo(gv,9)
end)
return
else
r=et
end
end
js=true
end
end
function jv(self,jw)
if(jw==self.jx) return
local ht=self.jy[jw]
self.jz=ht.ci
self.jx=jw
self.ka=1
end
function kb(self)
self.jz-=1
if self.jz<=0 then
self.ka+=1
local ht=self.jy[self.jx]
self.jz=ht.ci
if self.ka>#ht.kc then
self.ka=1
end
self.obj_spr=ht.kc[self.ka]
end
end
function hk(kd,ke)
local kf=0x3100
local kg=1
kd*=4
local fh=peek(kf+kd+kg)
if((band(fh,128)>0)!=ke) fh=bxor(fh,128)
poke(kf+kd+kg,fh)
end
function gk(kh,ki,
kj,fg,
kk)
for dv=-1,1 do
for dw=-1,1 do
print(kh,ki+dv,kj+dw,kk)
end
end
print(kh,ki,kj,fg)
end
function ju(kl,km)
local kn=kl:cj()
local ko=km:cj()
if kn.bv<ko.bv+ko.w and
kn.bv+kn.w>ko.bv and
kn.bw<ko.bw+ko.h and
kn.bw+kn.h>ko.bw
then
return true
else
return false
end
end
function fk(et)
local kp=et:cj()
rect(kp.bv,kp.bw,kp.bv+kp.w,kp.bw+kp.h,et.jj and 11 or 8)
end
function by()
return flr(t())%2==0
end
function cf()
kq=kr(ce,"|","\n")
ks={}
for cn=2,#kq-1 do
kt={}
for ku=1,#kq[cn] do
local fh=kq[cn][ku]
if(ku!=2 and ku<24) fh=tonum(fh)
kt[kq[1][ku]]=fh
end
ks[tonum(kq[cn][1])]=kt
end
ce=ks
end
function fw(fh)
local kv=""
local fu=abs(fh)
repeat
kv=(fu%0x0.000a/0x.0001)..kv
fu/=10
until fu==0
if(fh<0) kv="-"..kv
return kv
end
function kr(kh,ek,kw)
local ht={}
local kx=0
local kv=''
local ky=''
if kw~=nil then kh=kr(kh,kw) end
while#kh>0 do
if type(kh)=='table'then
kv=kh[1]
add(ht,kr(kv,ek))
del(kh,kv)
else
kv=sub(kh,1,1)
kh=sub(kh,2)
if kv==ek then
add(ht,ky)
ky=''
else
ky=ky..kv
end
end
end
add(ht,ky)
return ht
end
local kz=0
function fd(gr,gs,bv,bw,ht,w,la,lb)
local lc,ld=cos(ht),sin(ht)
local le,lf,kf,lg
local lh,li=lc,ld
local gp=shl(0xfff8,(w-1))
w*=4
lc*=w-0.5
ld*=w-0.5
local lj,lk=ld-lc+w,-lc-ld+w
w=2*w-1
for ll=0,w do
le,lf=lj,lk
for lm=0,w do
if band(bor(le,lf),gp)==0 then
local kx=sget(gr+le,gs+lf)
if(kx!=la) pset(bv+ll,bw+lm,lb or kx)
end
le-=li
lf+=lh
end
lj+=lh
lk+=li
end
end
function dm(ln,lo,lp,lq)
return abs(sqrt(((ln-lp)/1000)^2+((lo-lq)/1000)^2)*1000)
end
lr=3.14159
lt=.5*(lr/180)
function hu(gv,lu)
lv=lu-gv.ea
if lv>0.5 then
lv-=1
elseif lv<-0.5 then
lv+=1
end
if lv>lt then
gv.ea+=lt
elseif lv<-lt then
gv.ea-=lt
else
gv.ea=lu
end
if(gv.ea>lr) gv.ea-=2*lr
if(gv.ea<-lr) gv.ea+=2*lr
yield()
end
function ig(lw,ii,lx)
local ly=fget(fo(ii.bv,ii.bw),1) and 4 or 1
if(lw.bv!=ii.bv and lw.bw!=ii.bw) return ly+1
return ly
end
function ih(ii,lx)
local lz={}
for dv=-1,1 do
for dw=-1,1 do
if(dv!=0 or dw!=0) ma(ii.bv+dv,ii.bw+dw,lz)
end
end return lz
end
function ma(mb,mc,md)
if(
not fget(fo(mb,mc),0)
and bc[mb..","..mc]==nil
and mb>=0
and mc>=0
and mb<=63
and mc<=63
)
then
add(md,{bv=mb,bw=mc})
end
end
function ie(ht,me)
return abs(ht.bv-me.bv)+abs(ht.bw-me.bw)
end
function ic
(mf,
mg,
mh,
mi,
lz,
mj,
lx)
local mk,
ml={
mm=mf,
mn=0,
mo=mh(mf,mg,lx)
},{}
ml[mj(mf,lx)]=mk
local mp,mq,mr,ms={mk},1,mj(mg,lx),32767.99
while mq>0 do
local cost,mt=ms
for cn=1,mq do
local mu=mp[cn].mn+mp[cn].mo
if(mu<=cost) mt,cost=cn,mu
end
mk=mp[mt]
mp[mt],mk.mv=mp[mq],true
mq-=1
local mw=mk.mm
if mj(mw,lx)==mr then
mw={mg}
while mk.mx do
mk=ml[mj(mk.mx,lx)]
add(mw,mk.mm)
end
return mw
end
for my in all(lz(mw,lx)) do
local id=mj(my,lx)
local mz,na=
ml[id],
mk.mn+mi(mw,my,lx)
if not mz then
mz={
mm=my,
mn=ms,
mo=mh(my,mg,lx)
}
mq+=1
mp[mq],ml[id]=mz,mz
end
if not mz.mv and mz.mn>na then
mz.mn,mz.mx=na,mw
end
end
count+=1
if count>10 then
count=1
yield()
end
end
end
nb={}
function fj(bv,bw,ea,ei,ej,nc,nd,cb,ne,kd)
local mw={
bv=bv,bw=bw,ea=ea,ei=ei,ej=ej,nc=nc,
cb=0,nd=nd or 0.0625,
ne=ne or{7,6,5},kd=kd or 0,
nf=bw,ng=cb or 8
}
add(nb,mw)
end
function he()
for ft,mw in pairs(nb) do
mw.ej+=mw.nd
mw.bv+=mw.ei
mw.bw+=mw.ej
mw.ea+=mw.nc
mw.cb+=1
if(mw.cb>=mw.ng) del(nb,mw)
end
end
function iq()
for ft,mw in pairs(nb) do
local fg=flr((#mw.ne/mw.ng)*mw.cb)+1
if(mw.kd) fillp(mw.kd)
circfill(mw.bv,mw.bw,mw.ea,mw.ne[fg])
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
b7bbbb7bffffffffffffffffbb888b8bfff9ffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
77bbbb77fffffffffff77fffb8899898ff66669ff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
bbbbbbbbffffffffff79ff7f8999998bf66dd66ff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
bbbbbbbbfffffffff79f779f889aa988f6d55d6ff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
bbbbbbbbfffffffffff799ffb89aa998f6d55d6ff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
bbbbbbbbffffffffff799fff899aa98bf66dd66ff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
77bbbb77ffffffffff79ffff88999988ff6666fff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffb88898bbf9ffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000bbbbbbbb
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bbbbbbbbb
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbbbbbbbbb
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbb0000b000
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb07700077
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00777770
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb07700077
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb0000b000
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffbbbbbbbbbbb76bbbbbb76bbbb6bbb6bbb6bbb6bbdddddddd
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbb0eee0bbffffffffffffffffbbbbbbbbbbb76bbbbbb76bbbb8bbb8bbb8bbb8bbd5555555
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbb0d6d0bbfd5ff5ffffffffffbbbbbbbbbbbddbbbb7b55b7bb2bbb2bbb2bbb2bbd5555555
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbbbc7cbbbf5dfffffffffffffbbbbbbbbbbd66dbbb651156bb0bbb0bb0b0b0b0bd5555555
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbb0c7c0bbffff555fffffffff77bbb77bbbd66dbbbdd66ddbbbb6bbbbbbb6bbbbd5555555
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbb0ccc0bbffff5d5fffffffffb7777711bbbddbbbb1b11b1bbbb8bbbbbbb8bbbbd5555555
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbbb6b6bbbffff555fffffffff7711177bbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbbd5555555
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffb11bbb11bbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbd5555555
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
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
000000000000000000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000000000000000000000000000000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007770777077707770777077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707000700070007070000
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f000007070707077700770077077700
000000000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707070000070007000700
0000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000007770777077707770777077700
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
0000000000000000000100000000fffffffffffffffffffffffffffffffffffffffffffffffffff66ffffffffffffffffff00000000000000000000000000000
0000000000000000000ff000000ff6fffffff6fffffff6ffffffffffffffffffffffffffffffff2277fffffffffffffff1000000000000000000000000000000
000000000000000000f1f1f1f1ffffffff6fffffff6fffffff6ffffffffffffffffffffffffff220877fffffffffffff1f000000000000000000000000000000
000000000000000001ffff1f1ffffffffffffffffffffffffffffffffffffffffffffffffffff6886d76fffffffffffff1000000000000000000000000000000
00000000000000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff578d786ffffffffffff1f000000000000000000000000000000
0000000000000001f1fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffff57d8d5fffffffffffff1000000000000000000000000000000
00000000000000ff1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5685fffffffffffffff000000000000000000000000000000
0000000000001f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55fffffffffffffffff00000000000000000000000000000
000100000000fffffffffffffffffffffffffffffffff6fff6ffddddddddddddddddfffffffffffffffffffffffffffffff00000000000000000000000000000
000ff000000ff6fffffff6fffffff6fffffff6fffffff8fff8ffd766777755555555fffffffffffffffffffffffffffff1000000000000000000000000000000
00f1f1f1f1ffffffff6fffffff6fffffff6fffffff6ff2fff2ffd7ddfff755555555ffffffffffffffffffffffffffff1f000000000000000000000000000000
01ffff1f1fffffffffffffffffffffffffffffffffff0f0f0f0fd7777f7765555777fffffffffffffffffffffffffffff1000000000000000000000000000000
0f1ffffffffffffffffffffffffffffffffffffffffffff6ffffd4447ff7265557f6ffffffffffffffffffffffffffff1f000000000000000000000000000000
f1fffffffffffff6fffffff6fffffff6fffffff6fffffff8ffffd4047777655777fdfffffffffffffffffffffffffffff1000000000000000000000000000000
1ffffffffffffffffffffffffffffffffffffffffffffff2ffffd44444442657ffffffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffff0f0fffd55544445557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd76677775557ff7ffffffffffffffffffffffffffffffff00000000000000000000000000000
7ffffffffffffffffffff6fffffff6fffffff6ffffffffffffffd7ddfff755577777fffffffffffffffffffffffffffff1000000000000000000000000000000
ff7fffffffffffffffffffffff6fffffff6fffffff6fffffffffd7777f7765544444ffffffffffffffffffffffffffff1f000000000000000000000000000000
779fffffffffffffffffffffffffffffffffffffffffffffffffd4447ff726580480fffffffffffffffffffffffffffff1000000000000000000000000000000
99ffffffffffffffffffffffffffffffffffffffffffffffffffd404777765220220ffffffffffffffffffffffffffff1f000000000000000000000000000000
9ffffffffffffffffffffff6fffffff6fffffff6ffffffffffffd444444426550550fffffffffffffffffffffffffffff1000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555444455550550ffffffffffffffffffffffffffffff000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffd555222255555555fffffffffffffffffffffffffffffff00000000000000000000000000000
ffffffffffffffffffffffffffffffffffffd199999999999999ddd776ddddddddddffffffffffffffffffffffffffffffff0000000000000000000000001000
ffffffffffff0288220ff6ffffffffffffffd494955949999249d576d165d5577655ffffffffffffffffffffffffffff9ffff000000f90000009900000099000
ffffffffffff8d66d82fffffff6fffffffffd194255999229999d76d1115d576d165ffffffffffffffffffffffffffff9999f1f1f1ff91f1919991f191991900
ffffffffffffd7776660ffffffffffffffffd495f5f4f4121419d66d1115d76d1115fffffffffffffffffffffffffff99f9ff91f1f9f99191f9999191f999900
ffffffffffffd7776660ffffffffffffffffd195656565999959d66d0115d66d1115fffffffffffffffffffffffffffff9f9ff99f999fff99999fff99999f1f0
ffffffffffff8d66d825fff6ffffffffffffd499955555944959d66d0155d66d0115ffffffffffffffffffffffffffff9999999f99f999999f9999999f999919
ffffffffffff0288220fffffffffffffffffd194958055944959d56dd555d66d0155fffffffffffffffffffffffffff99f9f9f99f99f99fff9f999fff9f999f1
ffffffffffff5555555fffffffffffffffffd499922055944959d5555555d56dd555ffffffffffffffffffffffffffff99f9f99f99f9ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffffffffffd195594095999959ddddd776ddddddddffffffffffffffffffffffff99f9999999f99999ff9f999999f9999999f9
ffffffffffffffffffffffffffffffffffffd495594495977779d55576d165555555ffffffffffff9fffffffffff9f9999f99f9999f999f998999f9999f99f99
ffffffffffffffffffffffffffffffffffff9999529925777777d5576d1115558055ffffffffffff9999ffffffff99ff999999ff99999f9989f999ff999999ff
ffffffffffffffffffffffffffffffffffff9429444444776666d5566d1115522055fffffffffff99f9ff9ffff9f99999f9999999f9999f8889999999f999999
ffffffffffffffffffffffffffffffffffff9999242424766666d5566d0115555055fffffffffffff9f9ff99f999fff99999fff9999999998f99fff99999fff9
ffffffffffffffffffffffffffffffffffff944242424296666dd5566d01d5555055ffffffffffff9999999f99f999999f9999999f99fff8999999999f999999
ffffffffffffffffffffffffffffffffffff944242424294ddd2d5556dd5d5555555fffffffffff99f9f9f99f99f99fff9f999fff9f999999f9999fff9f999ff
ffffffffffffffffffffffffffffffffffffd555555555594425d5555555d5555555ffffffffffff99f9f99f99f9ff9f9999ff9f999999fff9f9ff9f9999ff9f
ffffffffffffffffffffffffffffddddddddddd666dddddddddd5d555d5fffffffffffffffffffffffff9f99f9f999f9999999f9999999f9999999f9999999f9
ffffffffffffffffffffffffffffd5555555d5766665d5555555d5155551fffffffffffffffffffffffff99f99f99f9999f99f9999f99f9999f99f9999f99f99
ffffffffffffffffffffffffffffd5556555d5766665d5888885155d55d5ffffffffffffffffffffffff9f99f99f99ff999999ff999999ff999999ff999999ff
ffffffffffffffffffffffffffffd5576655d5677725d555555555d51555ffffffffffffffffffffffff999f999999999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd55d7d55d566dd25d55222555555d55dfffffffffffffffffffffffff9ffff9ffff99999fff99999fff99999fff99999fff9
ffffffffffffffffffffffffffffd55ddd55d566dd25d55555555d155d55ffffffffffffffffffffffffffffffff99999f9999999f9999999f9999999f999999
ffffffffffffffffffffffffffffd555d555d556dd55d555255555555551ffffffffffffffffffffffffffffffff99fff9f999fff9f999fff9f999fff9f999ff
ffffffffffffffffffffffffffffd5555555d5555555d55222555155d55fffffffffffffffffffffffffffffffffff9f9999ff9f9999ff9f9999ff9f9999ff9f
ffffffffffffffffffffffffffffddd666ddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddd66666666666ffff
fffff6ffffffffffffffffffffffd5766665d5555555d5522255fffffffff002200fffffffffffffffffffffffffffffffffd557755555555ddddd4dddddffff
ffffffffff6fffffffffffffffffd5766665d5556555d5552555ffffffff288882d2ffffffffffffffffffffffffffff6f0fd566969666655ddddd4ddd5dffff
ffffffffffffffffffffffffffffd5677725d5576655d5555555ffffffff28888828fffffffffffffffffffffffffff8805fd5ddadadddd55ddd5ddd5dddffff
ffffffffffffffffffffffffffffd566dd25d55d7d55d5522255ffffffff28888828fffffffffffffffffffffffff0d888ff7777a7a711555ddddd55d5ddffff
fffffff6ffffffffffffffffffffd566dd25d55ddd55d5555555ffffffff288882d2fffffffffffffffffffffffff22685ff7d9d9d971155544d5555dd44ffff
ffffffffffffffffffffffffffffd556dd55d555d555d5888885ffffffff50022005fffffffffffffffffffffffff5820fff7da76767115767dddd5d5dddffff
ffffffffffffffffffffffffffffd5555555d5555555d5555555fffffffff555555fffffffffffffffffffffffffff500fff75776d675576667d5ddddd5dffff
ffffffffffffffffffffffffffff1d515555d66dddddddd6fffdfffffffffffffffffffffffffffffffff5d555d5fff55fff75777777766767667d4d5dddffff
fffffffffffff6ffffffffffffff5155d55d76665555551ffff1ffffffffffffffffffffffffffffffff1555515d5dfffd5f7d780777767767767d4dddddffff
ffffffffffffffffff6fffffffff555d515576665805555f4441ffffffffffffffffffffffffffffffff5d55d551d51555517d220dddd666d66d75555555ffff
ffffffffffffffffffffffffffffd5555d55177d22055d5ffff1ffffffffffffffffffffffffffffffff55515d55155d55d57ddd0d777d66d6dd76555555ffff
ffffffffffffffffffffffffffff55d155d5d1d55505555f1011ffffffffffffffffffffffffffffffffd55d555555d51555777757707dddddd77d675555ffff
fffffffffffffff6ffffffffffff155555556555550515df1001ffffffffffffffffffffffffffffffff55d551d55555d55dddddddd07777777776d75555ffff
fffffffffffffffffffffffffffff51ffd5fd6d6d55555551005ffffffffffffffffffffffffffffffff155555555d155d55d111d1d5ddddddddd7775555ffff
ffffffffffffffffffffffffffffffffffffd6d6d555d55d5555fffffffffffffffffffffffffffffffff55d551555555551d5555555d1d1d1d1dddd5555ffff
ffffffffffffffffffffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffffffffffff55d555d555d555d555d555d555d555d555d555d555d5
fffff6fffffff0088800ffffffffffffffffd5555555155551555dfffd5fffffffffffffffffffffffff15555155155551551555515515555155155551551555
ffffffffff6ff2808082ffffffffffffffffd555555a5d55d555d5155551ffffffffffffffffffffffff5d55d5555d55d5555d55d555555555555555d5555d55
fffffffffffff2262622ffffffffffffffffd5aaa99a55515d5d155d55d5ffffffffffffffffffffffff55515d5d55515d5d555155555555555551555d5d5551
fffffffffffff2868682ffffffffffffffffd5aaa55ad555555555d51555ffffffffffffffffffffffffd5555555d5555555d55555555544444444455555d555
fffffff6fffff0828280ffffffffffffffffd5a1199a55d515555555d55dffffffffffffffffffffffff55d5155555d5155555d55544444444444444455555d5
fffffffffffff0888880ffffffffffffffffd544445a155555155d155d55ffffffffffffffffffffffff15555515155555151555544444444444444445151555
fffffffffffff5288825ffffffffffffffffd5151515555d555555555551ffffffffffffffffffffffff555d5555555d5555555524444444444444444455555d
ffffffffffffff55555fffffffffdddd666666ddddddddddddddddd7778666666dddddddddddffffffff1d51555555d555d555dd2444444444444444444455d5
fffff6fffffff6ffffffffffffffd566ddddd6111110d55555556667d22ddddd657667555555ffffffff5155d55d155551551550244444444444444444441551
ffffffffff6fffffff6fffffffffd5dddd000066dd66d55555556dd7dd0dd6666dddddd56765ffffffff555d51555d55d5555d51044444444444444444445515
ffffffffffffffffffffffffffffd5dd0000001111ddd55555556dd7660dd6dd611111ddddd5ffffffffd5555d5555515d5d5551124444444444444444445150
ffffffffffffffffffffffffffffd50000000066dd10d55555556dd11666666d705501111115ffffffff55d151d5d5515155d551110222414142444141444400
fffffff6fffffff6ffffffffffffd555555555111110d55555556d7661111117705055421425ffffffff15151515551515155515151000121210441414141400
ffffffffffffffffffffffffffffd551f6155566dd66d55555556d55d5dd6661100555425425fffffffff000000f100000051000000510000001400000044000
ffffffffffffffffffffffffffffd550f605551111ddd55555556ddd6ddd7111102555425425ffffffff00000000000000000000000000000000000000001000
ffffffffffffffffffffffffffffd555f655551d6d10ffffffff6d7777777111104555425425fffffff000000000000000000000000000000000000000000000
1ffffffffffff6ffffffffffffffd5516615551d6d10ffffffff6d7011111ddd644555555555fffff10000000000000000000000000000000000000000000000
f1ffffffffffffffff6fffffffffd5505505551d6d10ffffffff6770d1d11ddd705555555555ffff1f0000000000000000000000000000000000000000000000
0f1fffffffffffffffffffffffffd5555555551d6d10ffffffffddd0d1d11677705555555555fffff10000000000000000000000000000000000000000000000
01ffffffffffffffffffffffffffd55555555510d010ffffffffddd0d1dd111115dddddd5555ffff1f0000000000222222222222222222222222222222222200
00f1fffffffffff6ffffffffffffd555550f050aaa00ffffffff0001d1111111105555555555fffff10000000000200777777770000000000000000000000200
000fffffffffffffffffffffffffd55f0f5555555555ffffffff00111ddd111115dddddd5555ffffff0000000000200700080070000000000000000000000200
0001ffffffffffffffffffffffffd555555555555555ffffffff011111111111105555555555fffffff000000000200700880070000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d555d555d5fffffff000000000200708000070000000000000000000000200
000000ffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d15555155fffff10000000000200700800070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d5515d55d555ffff1f0000000000200708080070000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55515d5555515d5dfffff10000000000200700000070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffffd55d5555d5555555ffff1f0000000000200777777770000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d555d51555fffff10000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff1555555515555515ffffff0000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515555d5555fffffff000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffffffffffffffffffff1d5155555d555d5ffffff1f100000000200000000000000000000000000000000200
000000fffffffffffffff688886ff6fffffff6ffffffffffffffffffffff5155d55dd5155551fff1ff0000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8fffffff6fffffff6fffffffffffffffff555d5155155d55d5ff1f000000000000200000000000000000000000000000000200
000000f1fffffffffffff2888d8fffffffffffffffffffffffffffffffffd5555d5555d51555f1f0000000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8ffffffffffffffffffff1f1fffff1f1ff55d151d55551d15dff00000000000000200000000000000000000000000000000200
000000f1fffffffffffff688886ffff6fffffff6ffffff1f1f1fff1f1f1f151515155d151d151f00000000000000200000000000000000000000000000000200
0000001ffffffffffffff555555ffffffffffffffffff000000ff000000ff000000f50000001f000000000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffff000000000000000000000000000000001000000000000000200000000000000000000000000000000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000fffffffffffffffffffffffffffffff6fff100000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000f1fffffffffffffffffffffffffffffffff100000000000000000000000000000000000000000000000000200000000000000000000000110000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000000000000000000000171000000200
000000f1fffffffffffffffffffffffffffffff6f100000000000000000000000000000000000000000000000000200000000000000000000000177100000200
0000001fffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000200000000000000000000000177710000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000177771000200
00001f1ffffffffffffffffffffffffffffffffff1f1000000000000000000000000000000000000000000000000200000000000000000000000177110000200
000000ff1ffffffffffffffffffffffffffffff1ff00000000000000000000000000000000000000000000000000200000000000000000000000011000000200
00000001f1ffffffffffffffffffffffffffff1f0000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000000f1ffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000001fffff1f1fffff1f1fffff1f1ffff000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000000f1ff1f1f1fff1f1f1fff1f1f1f1f000000000000000000000000000000000000000000000000000000222222222222222222222222222222222200
00000000000ff000000ff000000ff000000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000202020202020000000200000000010101010101010101010101010000000000000101010000000001010101010101000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
0000000000000000000000000000000016000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000016030303030303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300001200000008030300000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d4b0a000012120000000203030303000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616000a0a001200020502030303030303000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d0a420a000205030303030303030600000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001200000000000a0a0a0a00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012121200001600000a0a0a0e0000121200650a0a00000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000d010a00001244090c0a0a0a0000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121200163400000a0a0c0012000a0a1718190a00000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212001232161637600a0d620a0e000d0a1d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012000016000a0a000a0a0a00000917191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000012120000000000000000490a0000091d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000d0a0000000d0d0d0000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000003500360000000000000000000000000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012120012120000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120000000000000000000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
1212000000000000000000000000000000000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000003000000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000000000121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000090c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200000000000000000a0e0047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0c0c0a0a0a00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000000000009171818190a0a0a490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a1d1b1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a1d1e1b1b1b1c0a6200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d0a0a0a0a1a1b1b1f0a0a0a0a0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600000000000000000d0a4d0a1d1e1f0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1616160000000000000000090a650a0a0a0a0a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

