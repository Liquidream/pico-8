pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
a=true
b=false
c=3
d=8
e=2
f=1
g=12
i=1
j,k=0,0
l,m=0,0
n,o=0,0
p=nil
q=2335
r=0
s=false
u=s
v=false
x=0
y=0
count=0
z={}
ba={}
bb={}
bc={}
bd={}
bd.factory_click=function(self)
be=1
bf=self.bg.bh[1]
bi(6,89,"⬆️",function(self)
bj=mid(1,bj-1,#p.bh)
bf=p.bh[bj]
if(bj<be) be-=1
end,10)
bi(17,89,"⬇️",function(self)
bj=mid(1,bj+1,#p.bh)
bf=p.bh[bj]
if(bj>be+2) be=min(be+1,#bk.bg.bh-2)
end,10)
bi(32,88,"build",function(self)
bk=nil
p.bl=bm
bm:func_onclick()
end)
bi(96,88,"close",function(self)
bk=nil
end)
bk=self
end
bd.init_windtrap=function(self)
self.bn={
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
self.bo=1
end
bp=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|nil||400||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|63|162||2|2|2|nil|1|1|4||20|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|63|160||2|1|1|nil|1|1|1||5|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|nil||50||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
5|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|100||200|||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30||450||||||tHE rEFINERY CONVERTS SPICE INTO CREDITS.||||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30||500||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5||150||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10||300||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10||400||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20||350||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20||200||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35||400||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20||200||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
15|cANNON tURRET|59|170||2|1|1|nil|1|7|5||125|10||200||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
16|rOCKET tURRET|60|172||2|1|1|nil|1|7|6||250|20||200||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50||500||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40||400||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80||1000||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|61|174||1|1|1|11|9|9|2|AO|60||4|50|0.05|2|1|62|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|61|194||1|1|1|11|10|9|3|HO|100||8|110|0.1|3|1|62|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE|54|204||1|1|1|11|11||2||150||8|150|0.6|3||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
23|qUAD||||1|1|1|11|11||3||200||10|130|0.5|3||||tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||||
24|cOMBAT tANK|51|196||1|1|1|11|12|7|4||300||38|200|0.25|4||||tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||||
25|sIEGE tANK|50|198||1|1|1|11|12|7|6||600||45|300|0.2|5||||tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||||
26|rOCKET lAUNCHER|53|202||1|1|1|11|12|7|5||450||112|100|0.3|9||||tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||||
27|hARVESTER|49|192||1|1|1|11|12||2||300||0|150|0.3|nil||||tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||||
28|cARRYALL||238||1|1|1|11|13|13|5||800||0|100|2|nil||||tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||||
29|oRNITHOPTER||||1|1|1|11|13|13|7|AO|600||75|5|1.5|5||||tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||||
30|mcv||||1|2|1|11|12|7|4||900||0|150|0|nil||||tHE mcv (mOBILE cONSTRUCTION vEHICLE) SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||||
31|sONIC tANK||||1|1|1|11|12|7|7|A|600||90|110|0.3|8||||dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||||
32|fREMEN (X3)||||1|1|1|11|19||8|A|0||8|220|0.1|3||||tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||||
33|dEVASTATOR|52|200||1|1|1|11|12|13|8|H|800||60|400|0.1|7||||tHE dEVESTATOR IS A NUCLEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||||
34|dEATH hAND||||1|1|1|11|19||8|H|0||150|70|2.5|nil||||tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||||
35|rAIDER||||1|1|1|11|11||2|O|150||8|80|0.75|3||||tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||||
36|dEVIATOR||||1|1|1|11|12|13|7|O|750||0|120|0.3|7||||tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||||
37|sABOTEUR||||1|1|1|11|19||8|O|0||150|40|0.4|2||||tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||||
]]..
[[38|sARDAUKAR||||1|1|1|11|nil|nil|4||0||5|110|0.1|1||||tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||||
39|sANDWORM||||1|1|1|11|nil|nil|3||0||300|1000|0.35|0||||tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||||]]
function _init()
printh("-- init -------------")
poke(0x5f2d,1)
cartdata("pn_picodune")
bq()
br=1
bs()
bt=0
cursor={
bu=0,
bv=0,
w=8,
h=8,
spr=0,
bw=function(self)
return{
bu=self.bu+(not bx and j or 0)+2,
bv=self.bv+(not bx and k or 0)+1,
w=1,
h=1
}
end,
by=function(self)
spr((p and(p.type==1)) and 1 or self.obj_spr,
self.bu,self.bv,self.w/8,self.h/8)
end
}
bz()
j=44
k=8
music(9)
end
function bz()
for ca=1,2 do
for cb=0,31 do
for cc=0,127 do
local cd=nil
local ce=mget(cc,cb)
local cf=fget(ce)
if ca==1 and ce==1 then
cg=cc*8
ch=cb*8
cd=bp[1]
elseif ca==2
and ce!=63 then
for ci in all(
bp) do
if(ci.obj_spr!=nil and ci.obj_spr==ce) cd=ci break
end
end
if cd!=nil then
cj(cd,cc*8,cb*8)
if cd.type==1 then
mset(cc,cb,17)
end
end
end
end
end
end
function cj(cd,bu,bv)
local ck=cl(cd,bu,bv,cd.type,nil,bd[cd.func_init],bd[cd.func_draw],bd[cd.func_update],nil)
ck.cm=cl(cd,109,0,3,ck,nil,nil,bd[cd.func_onclick])
ck.cn=co and cd.hitpoint/2 or cd.hitpoint
ck.bh={}
for ci in all(bp) do
if(ci.parent_id!=nil and ci.parent_id==ck.id) then
local bl=cl(ci,109,0,4,ck,nil,nil,function(self)
if bk then
p=self
else
self.cp=5/self.cost
self.cq=cocreate(function(self)
self.cr=0
self.cs=0
while self.cs<self.cost do
self.cr+=1
if(self.cr>3) self.cr=0 q-=1 sfx(63) self.cs+=1
self.cn=(self.cs/self.cost)*100
yield()
end
sfx(56)
if self.ct.type==1 then
local cu,cv=cw((self.bg.bu+8)/8,(self.bg.bv+16)/8)
cj(self.ct,cu*8,cv*8)
self.cn=0
end
end)
end
end)
add(ck.bh,bl)
ck.bl=ck.bh[1]
end
end
ck.cx=cy(bu,bv,cg,ch)<75 and 1 or 2
if ck.cx==1 then
ck.cz=c
ck.da=d
ck.db=e
else
ck.cz=f
ck.da=g
ck.db=i
ck.cm.func_onclick=nil
end
if cd.type==2 then
ck.dc=53
local dd=flr(bu/8)
local de=flr(bv/8)
local df=(cd.id==2 or cd.id==3)
for dg=0,cd.w-1 do
for dh=0,cd.h-1 do
mset(dd+dg,de+dh,df and 63 or 95)
end
end
if(not df) add(bb,ck)
if(ck.id==7 and ck.cx==1) v=true
end
if cd.type==1 then
ck.dc=54
if(ck.norotate!=1) ck.di=flr(rnd(8))*.125
ck.dj=function(self)
printh("fire...")
printh("life b4="..self.dk.cn)
self.dk.cn-=self.arms
printh("life after="..self.dk.cn)
self.dk.dl=1
self.dk.dm=self
sfx(self.arms<100 and 60 or 58)
end
add(z,ck)
dn(ck)
end
dp(ck)
end
function cl(dq,bu,bv,dr,bg,func_init,func_draw,func_onclick)
local ds=(dq.w or 1)*8
local dt=(dq.h or 1)*8
local du={
ct=dq,
bu=bu,
bv=bv,
dv=1,
type=dr,
bg=bg,
func_onclick=func_onclick,
w=ds,
h=dt,
dw=dq.obj_spr,
dx=dq.w or 1,
dy=dq.h or 1,
cn=0,
dz=0,
ea=0,
dl=0,
bw=function(self)
return{
bu=self.bu,
bv=self.bv,
w=(self.type>2 and 16 or self.w)-1,
h=(self.type>2 and 16 or self.h)-1
}
end,
by=func_draw or function(self)
pal()
palt(0,false)
if(self.trans_col) palt(self.trans_col,true)
if(self.cz) pal(12,self.da) pal(14,self.db)
if self.bn then
pal(self.bn[self.bo][1],
self.bn[self.bo][2])
end
if self.di then
eb(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bu,self.bv+1,.25-self.di,1,self.trans_col,5)
eb(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.bu,self.bv,.25-self.di,1,self.trans_col)
else
if self.type>2 then
rectfill(self.bu-1,self.bv-1,self.bu+16,self.bv+19,0)
local ec=self.type==4 and self or self.bg
local ed=ec.ct.hitpoint
local ee=ec.cp and 12 or(ec.cn<ed*.33 and 8 or ec.cn<ed*.66 and 10 or 11)
local ef=ec.cp and(15*ec.cn/100) or(15*ec.cn/ed)
if(ec.cn>0) rectfill(self.bu,self.bv+17,self.bu+ef,self.bv+18,ee)
end
if self.type>2 then
spr(self.ico_spr,self.bu,self.bv,2,2)
else
spr(self.obj_spr,self.bu,self.bv,self.w/8,self.h/8)
end
end
if self.dl>0 then
printh("draw HIT!!!! - id="..self.ct.id)
spr(19,self.bu+rnd(self.w)-4,self.bv+rnd(self.h)-4)
end
if self.eg==5 then
palt(11,true)
spr(19,self.bu+rnd(self.w)-4,self.bv+rnd(self.h)-4)
end
if(b) eh(self)
end,
ei=function(self)
if(self.cn<=0 and self.ej==nil) self.eg=5 self.ej=t()+1 sfx(self.dc)
if self.ej and t()>self.ej then
if self.type==2 then
for dg=0,self.ct.w-1 do
for dh=0,self.ct.h-1 do
mset(self.bu/8+dg,self.bv/8+dh,14)
end
end
del(bb,self)
else
del(z,self)
end
if(p==self) p=nil
end
if self.framecount!=nil then
self.dz+=1
if(self.dz>self.framecount) then
self.dz=0
if self.altframe
and self.eg==2 then
self.obj_spr=self.dw+(self.altframe-self.obj_spr)
end
if self.bn then
self.bo+=1
if(self.bo>#self.bn) self.bo=1
end
end
end
end,
ek=function(self,bu,bv)
self.bu=bu
self.bv=bv
end
}
for el,em in pairs(dq) do
if du[el]==nil and em!=""then
du[el]=em
end
end
if(func_init) func_init(du)
return du
end
function dp(en)
if(en.cx!=1 and en.eg!=3) return
local eo=en.type==2 and 3 or 2
for dg=-eo,eo do
for dh=-eo,eo do
local ep=flr(en.bu/8)+dg
local eq=flr(en.bv/8)+dh
er[ep][eq]=16
es(ep,eq)
for et=-1,1 do
for eu=-1,1 do
es(ep+eu,eq+et)
end
end
end
end
end
function _update60()
ev()
ew()
if(t()%1==0) ex()
r+=1
end
function _draw()
ey()
ez()
if(a) fa("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function bs()
er={}
for ca=-2,66 do
er[ca]={}
for fb=-2,66 do
er[ca][fb]=0
end
end
end
function fc()
local fd=flr(j/8)
local fe=flr(k/8)
for dg=fd-1,fd+16 do
for dh=fe-1,fe+16 do
if er[dg][dh]!=0 and er[dg][dh]!=16 then
palt(11,true)
spr(er[dg][dh]+31,dg*8,dh*8)
elseif er[dg][dh]<16 then
rectfill(dg*8,dh*8,dg*8+7,dh*8+7,0)
end
end
end
end
function es(bu,bv)
if(bu<0 or bu>#er or bv<0 or bv>#er) return
local ff=0
if er[bu][bv]!=0 then
if(er[bu][bv-1]>0) ff+=1
if(er[bu-1][bv]>0) ff+=2
if(er[bu+1][bv]>0) ff+=4
if(er[bu][bv+1]>0) ff+=8
er[bu][bv]=1+ff
end
end
function ex()
ba={}
for fg,fh in pairs(z) do
ba[flr(fh.bu/8)..","..flr(fh.bv/8)]=1
end
end
function ev()
fi=stat(32)
fj=stat(33)
fk=stat(34)
fl=(fk>0 and fm!=fk) or btnp(4)
fn=(fk>0) or btn(4)
fo=btnp(5)
for el=0,1 do
if(btn(el)) n+=el*2-1
if(btn(el+2)) o+=el*2-1
end
l=mid(0,fi+n,127)
m=mid(0,fj+o,127)
cursor.bu=l
cursor.bv=m
if not bk then
if(l<4) j-=2
if(l>123) j+=2
if(m<4) k-=2
if(m>123) k+=2
j=mid(j,384)
k=mid(k,384)
end
fp()
fq()
bt+=1
fm=fk
fr=p
bm=bf
end
function dn(fh)
printh("do_guard()!!")
fh.eg=3
fh.cq=cocreate(function(self)
while true do
if self.dl>0 then
printh("do_guard() > HIT!!")
self.dl-=0.5
if(y!=1) y=1 music(0)
if(self.arms>0) fs(self,self.dm)
end
yield()
end
end)
end
function fs(fh,dk)
printh("do_attack()...")
fh.eg=3
fh.dk=dk
fh.cq=cocreate(function(self)
while dk.cn>0 do
self.dl-=0.5
if cy(fh.bu,fh.bv,dk.bu,dk.bv)>fh.range*5 then
ft(fh,flr(dk.bu/8),flr(dk.bv/8),fh.range*5)
end
if not fh.norotate then
local fu=atan2(fh.bu-dk.bu,fh.bv-dk.bv)
while(fh.di!=fu) do
fv(fh,fu)
self.dl-=0.5
end
end
fh.ea-=1
if(fh.ea<=0) fh.dj(fh) fh.ea=fh.arms*2
yield()
end
fw(5,false)
y=0
dn(self)
end)
end
function cw(bu,bv,fx)
for cy=1,fx or 64 do
for dg=bu-cy,bu+cy do
for dh=bv-cy,bv+cy do
if((dg==bu-cy or dg==bu+cy or dh==bv-cy or dh==bv+cy) and(fy(dg,dh))) return dg,dh
end
end
end
end
function fy(bu,bv)
printh("is_free_tile("..bu..","..bv..")")
return not fget(mget(bu,bv),0)
and ba[bu..","..bv]==nil
end
function ft(fh,bu,bv,fz)
fh.ga="init"
if not fy(bu,bv) then
bu,bv=cw(bu,bv)
end
fh.gb=bu
fh.gc=bv
fh.gd=fh.eg
fh.eg=1
fh.ga=ge(
{bu=flr(fh.bu/8),bv=flr(fh.bv/8)},
{bu=fh.gb,bv=fh.gc},
gf,
gg,
gh,
function(gi) return shl(gi.bv,8)+gi.bu end,
nil)
fh.gd=fh.eg
fh.eg=2
fh.eg=2
for ca=#fh.ga-1,1,-1 do
local gi=fh.ga[ca]
if not fh.norotate then
local eu=fh.bu-(gi.bu*8)
local et=fh.bv-(gi.bv*8)
local fu=atan2(eu,et)
while(fh.di!=fu) do
fv(fh,fu)
end
end
local gj=fh.speed or .5
local gk=sqrt((gi.bu*8-fh.bu)^2+(gi.bv*8-fh.bv)^2)
local gl=gj*(gi.bu*8-fh.bu)/gk
local gm=gj*(gi.bv*8-fh.bv)/gk
for ca=0,gk/gj-1 do
fh.bu+=gl
fh.bv+=gm
yield()
end
fh.bu,fh.bv=gi.bu*8,gi.bv*8
dp(fh)
local gn=cy(fh.bu,fh.bv,fh.gb*8,fh.gc*8)
printh("        dist = "..gn)
printh("dist_to_keep = "..tostr(fz))
if gn<=(fz or 0) then
printh("stop!!! close enough!")
break
end
end
fh.eg=1
end
function fp()
for fg,fh in pairs(z) do
go(fh)
end
for fg,gp in pairs(bb) do
go(gp)
go(gp.bl)
end
end
function go(du)
if du then
if du.cq and costatus(du.cq)!='dead'then
assert(coresume(du.cq,du))
else
du.cq=nil
end
end
end
function ew()
if(t()==1) then
local fh=z[#z]
local dk=z[3]
fs(fh,dk)
end
end
function ey()
cls"15"
camera(j,k)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
if ga!=nil and ga!="init"then
spr(144,ga[1].bu*8,ga[1].bv*8)
end
for fg,gp in pairs(bb) do
gp:ei()
gp:by()
if(gp==p) then
rect(p.bu,p.bv,
p.bu+p.w-1,p.bv+p.h-1,
7)
end
end
palt(11,true)
for fg,fh in pairs(z) do
fh:ei()
fh:by()
if(fh==p) then
palt(11,true)
spr(16,p.bu,p.bv)
end
end
fc()
end
function gq()
local eo=31
local bu,bv=93,93
rectfill(bu-1,bv-1,bu+eo+1,bv+eo+1,e)
if(v) s=true
rectfill(bu,bv,bu+eo,bv+eo,0)
if s!=u then
x=1
gr=1
sfx(55)
end
u=s
if x>0 and x<60 then
x+=gr
clip(
max(bu+(eo/2)-x,bu),
max(bv+(eo/2)-(x>20 and x-20 or 0),bv),
min(x*2,eo),
min((x>20 and x-20 or 1)*2,eo))
for ca=1,300 do
pset(bu+rnd(eo),bv+rnd(eo),5+rnd(3))
end
return
end
if s then
for ca=0,124,4 do
for fb=0,124,4 do
local cc=ca/2
local cb=fb/2
if(cb>=32) cc+=64 cb%=32
local gs=mget(cc,cb)
local gt=(gs*8)%128
local gu=(gs*8)/16
local ee=sget(gt+4,gu)
if(er[ca/2][fb/2]==16) pset(bu+(ca/2)/2,bv+(fb/2)/2,ee!=11 and ee or 15)
end
end
end
for fg,gp in pairs(bb) do
local ep=flr(gp.bu/8)
local eq=flr(gp.bv/8)
if gp.cx==1 or(s and er[ep][eq]==16) then
pset(bu+gp.bu/2/8,bv+gp.bv/2/8,gp.da)
end
end
if s then
for fg,fh in pairs(z) do
local ep=flr(fh.bu/8)
local eq=flr(fh.bv/8)
if fh.cx==1 or er[ep][eq]==16 then
pset(bu+fh.bu/2/8,bv+fh.bv/2/8,fh.da)
end
end
end
local gv=bu+j/16
local gw=bv+k/16
rect(gv,gw,gv+7,gw+7,7)
end
function ez()
camera(0,0)
pal()
palt(0,false)
if p and p.cm then
p.cm:ek(109,20)
p.cm:by()
if p.bl and p.cx==1 then
p.bl:ek(109,44)
p.bl:by()
end
end
fa("00"..flr(q),103,2,7)
if p
and p.bl
and p.bl.ct.type==2
and p.bl.cn>=100 then
local gx=flr((cursor.bu+j)/8)
local gy=flr((cursor.bv+k)/8)
local gz=gx*8-j
local ha=gy*8-k
hb=false
hc=false
co=false
local w=p.bl.ct.w
local h=p.bl.ct.h
for dg=-1,w do
for dh=-1,h do
if dg==-1 or dg==w or dh==-1 or dh==h then
if(mget(gx+dg,gy+dh)>=63) hb=true
else
local ef=mget(gx+dg,gy+dh)
if(ef>=2 and ef<=7) co=true
if(ba[gx+dg..","..gy+dh] or ef==0 or(ef>=8 and ef<63) or ef>63) hc=true
end
end
end
if(hc) hb=false
fillp("0b1110110110110111.1")
rectfill(gz,ha,
gz+p.bl.w,ha+p.bl.h,hb and 11 or 8)
fillp()
end
gq()
if bk then
hd(121,73,e,d)
if p.bh then
rectfill(6,30,27,97,0)
for ca=1,#p.bh do
local he=p.bh[ca]
if ca>=be and ca<=be+2 then
he:ek(9,32+((ca-be)*19))
he:by()
else
he:ek(-16,16)
end
if(bf==he) then
bj=ca
rect(he.bu-2,he.bv-2,
he.bu+17,he.bv+17,
7)
print(bf.name,30,31,7)
print("cOST:"..bf.cost,85,38,9)
hf=0
local hg=hh(bf.description,23)
for fb in all(hg) do
print(fb,30,44+hf,6)
hf+=6
end
end
end
end
for fg,hi in pairs(bc) do
hi:by()
end
end
palt(11,true)
cursor:by()
end
function hd(w,h,hj,hk)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-w/2,64-h/2,64+w/2,64+h/2,hj)
rect(64-w/2+1,64-h/2+1,64+w/2-1,64+h/2-1,hk)
end
function bi(bu,bv,hl,func_onclick,ds)
local du={
bu=bu,
bv=bv,
w=ds or#hl*4+2,
h=8,
hl=hl,
bw=function(self)
return{
bu=self.bu,
bv=self.bv,
w=self.w,
h=self.h
}
end,
by=function(self)
if(#hl>1) rectfill(self.bu,self.bv,self.bu+self.w,self.bv+self.h,7)
if(#hl>1) rectfill(self.bu+1,self.bv+1,self.bu+self.w-1,self.bv+self.h-1,self.hm and 12 or 6)
print(self.hl,self.bu+2,self.bv+2,(#hl>1) and 0 or(self.hm and 12 or 7))
if(b) eh(self)
end,
func_onclick=func_onclick
}
add(bc,du)
end
function hh(hn,ho)
local hp={}
local hq=""
local hr=""
local hs=""
local ht=function(hu)
if#hr+#hq>hu then
add(hp,hq)
hq=""
end
hq=hq..hr
hr=""
end
for ca=1,#hn do
hs=sub(hn,ca,ca)
hr=hr..hs
if hs==" "
or#hr>ho-1 then
ht(ho)
elseif#hr>ho-1 then
hr=hr.."-"
ht(ho)
elseif hs==";"then
hq=hq..sub(hr,1,#hr-1)
hr=""
ht(0)
end
end
ht(ho)
if hq!=""then
add(hp,hq)
end
return hp
end
function fq()
hv=false
if not bk then
foreach(z,hw)
foreach(bb,hw)
end
if p then
bx=true
if(p.cm and not bk) hw(p.cm)
foreach(p.bh,hw)
foreach(bc,hw)
bx=false
end
if fn
and not bk
and l>93 and l<120
and m>93 and m<120 then
j=min((l-94)*16,400)
k=min((m-94)*16,400)
elseif fl then
if hv then
if(not bk and p.func_onclick and p.bg!=nil) p:func_onclick() p=fr
if(bk and bf.hl and bf.func_onclick) bf:func_onclick()
if(p.cx==1 and p.type==1 and p!=fr) sfx(62)
if(p.cx==2 and fr and fr.type==1 and fr.cx==1) fs(fr,p) p=nil
else
if p and p.type==1
and p.cx==1 then
p.cq=cocreate(function(fh)
ft(fh,flr((j+l)/8),flr((k+m)/8))
end)
end
if p
and p.bl
and p.bl.cn>=100
and hb then
local dd=flr((cursor.bu+j)/8)
local de=flr((cursor.bv+k)/8)
local cd=p.bl.ct
cj(cd,dd*8,de*8)
p.bl.cn=0
sfx(61)
end
if(not bk) p=nil
end
end
end
function hw(du)
du.hm=hx(cursor,du)
if fl and du.hm then
if bk then
bf=du
else
local dd=flr((cursor.bu+j)/8)
local de=flr((cursor.bv+k)/8)
if(du.type<=2 and er[dd][de]!=16) return
p=du
end
hv=true
end
end
function hy(self,hz)
if(hz==self.ia) return
local fu=self.ib[hz]
self.ic=fu.bt
self.ia=hz
self.ie=1
end
function ig(self)
self.ic-=1
if self.ic<=0 then
self.ie+=1
local fu=self.ib[self.ia]
self.ic=fu.bt
if self.ie>#fu.ih then
self.ie=1
end
self.obj_spr=fu.ih[self.ie]
end
end
function fw(ii,ij)
local ik=0x3100
local il=1
ii*=4
local ef=peek(ik+ii+il)
if((band(ef,128)>0)!=ij) ef=bxor(ef,128)
poke(ik+ii+il,ef)
end
function fa(im,io,
ip,ee,
iq)
for dg=-1,1 do
for dh=-1,1 do
print(im,io+dg,ip+dh,iq)
end
end
print(im,io,ip,ee)
end
function hx(ir,is)
local it=ir:bw()
local iu=is:bw()
if it.bu<iu.bu+iu.w and
it.bu+it.w>iu.bu and
it.bv<iu.bv+iu.h and
it.bv+it.h>iu.bv
then
return true
else
return false
end
end
function eh(du)
local iv=du:bw()
rect(iv.bu,iv.bv,iv.bu+iv.w,iv.bv+iv.h,du.hm and 11 or 8)
end
function iw()
return flr(t())%2==0
end
function bq()
ix=iy(bp,"|","\n")
iz={}
for ca=2,#ix-1 do
ja={}
for jb=1,#ix[ca] do
local ef=ix[ca][jb]
if(jb!=2 and jb<23) ef=tonum(ef)
ja[ix[1][jb]]=ef
end
iz[tonum(ix[ca][1])]=ja
end
bp=iz
end
function iy(im,gn,jc)
local fu={}
local jd=0
local je=''
local jf=''
if jc~=nil then im=iy(im,jc) end
while#im>0 do
if type(im)=='table'then
je=im[1]
add(fu,iy(je,gn))
del(im,je)
else
je=sub(im,1,1)
im=sub(im,2)
if je==gn then
add(fu,jf)
jf=''
else
jf=jf..je
end
end
end
add(fu,jf)
return fu
end
local jg=0
function eb(gt,gu,bu,bv,fu,w,jh,ji)
local jj,jk=cos(fu),sin(fu)
local jl,jm,ik,jn
local jo,jp=jj,jk
local ff=shl(0xfff8,(w-1))
w*=4
jj*=w-0.5
jk*=w-0.5
local jq,jr=jk-jj+w,-jj-jk+w
w=2*w-1
for js=0,w do
jl,jm=jq,jr
for jt=0,w do
if band(bor(jl,jm),ff)==0 then
local jd=sget(gt+jl,gu+jm)
if(jd!=jh) pset(bu+js,bv+jt,ji or jd)
end
jl-=jp
jm+=jo
end
jq+=jo
jr+=jp
end
end
function cy(ju,jv,jw,jx)
return abs(sqrt(((ju-jw)/1000)^2+((jv-jx)/1000)^2)*1000)
end
jy=3.14159
jz=.5*(jy/180)
function fv(fh,ka)
kb=ka-fh.di
if kb>0.5 then
kb-=1
elseif kb<-0.5 then
kb+=1
end
if kb>jz then
fh.di+=jz
elseif kb<-jz then
fh.di-=jz
else
fh.di=ka
end
if(fh.di>jy) fh.di-=2*jy
if(fh.di<-jy) fh.di+=2*jy
yield()
end
function gg(kc,gi,kd)
local ke=fget(mget(gi.bu,gi.bv),1) and 4 or 1
if(kc.bu!=gi.bu and kc.bv!=gi.bv) return ke+1
return ke
end
function gh(gi,kd)
local kf={}
for dg=-1,1 do
for dh=-1,1 do
if(dg!=0 or dh!=0) kg(gi.bu+dg,gi.bv+dh,kf)
end
end return kf
end
function kg(kh,ki,kj)
if(
not fget(mget(kh,ki),0)
and ba[kh..","..ki]==nil
)
then
add(kj,{bu=kh,bv=ki})
end
end
function gf(fu,kk)
return abs(fu.bu-kk.bu)+abs(fu.bv-kk.bv)
end
function ge
(kl,
km,
kn,
ko,
kf,
kp,
kd)
local kq,
kr={
ks=kl,
kt=0,
ku=kn(kl,km,kd)
},{}
kr[kp(kl,kd)]=kq
local kv,kw,kx,ky={kq},1,kp(km,kd),32767.99
while kw>0 do
local cost,kz=ky
for ca=1,kw do
local la=kv[ca].kt+kv[ca].ku
if(la<=cost) kz,cost=ca,la
end
kq=kv[kz]
kv[kz],kq.lb=kv[kw],true
kw-=1
local lc=kq.ks
if kp(lc,kd)==kx then
lc={km}
while kq.ld do
kq=kr[kp(kq.ld,kd)]
add(lc,kq.ks)
end
return lc
end
for le in all(kf(lc,kd)) do
local id=kp(le,kd)
local lf,lg=
kr[id],
kq.kt+ko(lc,le,kd)
if not lf then
lf={
ks=le,
kt=ky,
ku=kn(le,km,kd)
}
kw+=1
kv[kw],kr[id]=lf,lf
end
if not lf.lb and lf.kt>lg then
lf.kt,lf.ld=lg,lc
end
end
count+=1
if count>10 then
count=1
yield()
end
end
end
__gfx__
bbbbbbbbbbb1bbbbf5d555d555d555d55d555d5fffffffff1d5155555d555d5fffffffff99f99999ffffffffffffffff9f99f9f9ff9f9999ddddddddffffffff
bb11bbbbbb171bbb1555515d15555155d51555515dfffd5f5155d55dd5155551ffff9fff9f9999f9fff9fffffffffffff99f99f999f99899d5555555ffffffff
bb171bbbb1bbb1bb5d55d5515d55d555155d55d5d5155551555d5155155d55d5ffff999999ff99999999ffffffffffff9f99f99f9f9989f9d5015515ffffffff
bb1771bb17b1b71b55515d5555515d5d55d51555155d55d5d5555d5555d51555fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899d5105555ffffffff
bb17771bb1bbb1bbd55d5555d55555555555d55d55d5155555d155d55555d55dfffff9f9fff999999f9fffffff99f999f9ffff9f99998f99d5555111ffffffff
bb177771bb171bbb55d551d555d515555d155d555555d55d155555555d155d55ffff999999999f999999ffff999f99f9fffffffffff89999d1555101ffffffff
bb17711bbbb1bbbb1555555515555515555555515d155d55f51ffd5f55555551fff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99d5555111ffffffff
bbb11bbbbbbbbbbbf55d5515555d55555155d55f55555551ffffffff5155d55fffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9d5515555ffffffff
b7bbbb7bffffffffffffffffbb88888bffffffffffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
77bbbb77fffffffffff77fffb8899998fffffffff888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
bbbbbbbbffffffffff79ff7f8999a98bfffffffff8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
bbbbbbbbfffffffff79f779f889aa988fffffffff888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
bbbbbbbbfffffffffff799ffb89aa998fffffffff888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
bbbbbbbbffffffffff799fff899aa98bfffffffff888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
77bbbb77ffffffffff79ffff88999988fffffffff888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffb88898bbffffffffffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbbeeeebbb0cddc0bbbbbbbbbbecccebbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb6bbb6bbb6bbb6bbdddddddd
ffffffffb0cccc0bbed77debb6cdc6bb0ccccc0bb6ccc6bbb0ece0bbffffffffffffffffffffffffffffffffbbb76bbbbbb76bbbb8bbb8bbb8bbb8bbd5555555
ffffffffb0cccc0bbc6776cbb7d7d7bb0cecec0bbcdddcbbb0d6d0bbffffffffffffffffffffffffffffffffbbbddbbbb7b55b7bb2bbb2bbb2bbb2bbd5555555
ffffffffbeccccebbc6776cbb7d6d7bbec6c6cebbc6c6cbbbbc7cbbbffffffffffffffffffffffffffffffffbbd66dbbb651156bb0bbb0bb0b0b0b0bd5555555
ffffffffbeccccebbed66debb7c6c7bbee6e6eebbc7c7cbbbbcccbbbffffffffffffffffffffffffffffffffbbd66dbbbdd66ddbbbb6bbbbbbb6bbbbd5555555
ffffffffb0ecce0bbec66cebb7c0c7bbec0c0cebbc0c0cbbbb606bbbffffffffffffffffffffffffffffffffbbbddbbbb1b11b1bbbb8bbbbbbb8bbbbd5555555
ffffffffb0deed0bb0e66e0bb6eee6bb00ccc00bb6eee6bbbbb0bbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbbd5555555
ffffffffbbeccebbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbbd5555555
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddddd6666dddddddddddddddddddddddddddddddddddddddddd19999999999999977777777
76665555551ffff1d576db65d5577655d5555555d5766665d5555555d566777655555555d555555555555555d766777755555555d49495594999924976666665
76665c05555f4441d76dbbb5d576db65d5556555d5766665d5ccccc5d767666d65555555d554777777777455d7ddfff755555555d19425599922999976666665
177dee055d5ffff1d66d11b5d76dbbb5d5576655d5677725d5555555d767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f412141976666665
d1d55505555f1011d66d01b5d66d11b5d55d7d55d566dd25d55eee55d766ddd665555555d504777778617405d4447ff7265557f6d19565656599995976666665
6555550515df1001d66d0b55d66d01b5d55ddd55d566dd25d5555555d676666625555555d544ff7ff6d1f445d4047777655777fdd49995555594495976666665
d6d6d55555551005d56dd555d66d0b55d555d555d556dd55d555e555d667ddd225666655d504777771177405d44444442657ffffd19495c05594495976666665
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d55eee55d66d11d2266c0765d544ff7fff7ff445d55544445557ff7fd4999ee05594495955555555
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd56d11d276ee06d6d504777777777405d76677775557ff7fd195594095999959dddddddd
d555555515555155d55576db65555555d5766665d5555555d55eee55d55d11d5767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779d5ddddd5
d555555a5d55d555d5576dbbb555c055d5766665d5556555d555e555d5555555766d0d66d542222222222245d7777f77655444449999529925777777d55ddd55
d5aaa99a55515d5dd5566d11b55ee055d5677725d5576655d5555555d555555567666662d52c02c020200225d4447ff7265c04c09429444444776666d555d555
d5aaa55ad5555555d5566d01b5555055d566dd25d55d7d55d55eee55d5555555667dd722d5ee0ee022200225d404777765ee0ee09999242424766666d5551555
d5a1199a55d51555d5566d0bd5555055d566dd25d55ddd55d5555555d555555566d11d22d551011011111115d444444426550550944242424296666dd5511155
d544445a15555515d5556dd5d5555555d556dd55d555d555d5ccccc5d555555556d11d25d555011011111155d555444455550550944242424294ddd2d5111115
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
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffc7cccccccccccccccccccccceeeeeeeeeeeeeeee
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff54ccccccccccccccccccccccceeeeeeeeeeeeeeee
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660ccccc2888887660cccc4ff54cccccccccccccc7ffc455550ceeeeeeeeeeeeeeee
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cccc288888887ccccccc54cccccff5ccccccc44ffff4ccccceeeeeeeeeeeeeeee
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444ccccc5225222222287ccc45555cc4ffffcccc50005444544ccceeeeeeeeeeeeeeee
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cc55588888888855cc54fffffffffff5cc5000005ffff505ceeeeeeeeeeeeeeee
916666d001110009cccc00df00cccccc95060000000006599504000000000459950600000000065995040000000004599500000599940009eeeeeeeeeeeeeeee
f90500000444000999999900ff99999999555555555555999955555555555599995555555555559999555555555555999950005222225059eeeeeeeeeeeeeeee
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999feeeeeeeeeeeeeeee
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f999999eeeeeeeeeeeeeeee
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff9eeeeeeeeeeeeeeee
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999eeeeeeeeeeeeeeee
9fffff99999999ff9999999f99999ff999fffff9999f99999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99eeeeeeeeeeeeeeee
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
0000000000000000f00000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1ff0f007070707077700770077077700
000f00000000000000000000000000f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1000007070707070000070007000700
0000000000000000ff0000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000007770777077707770777077700
00000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000
0000000000000000000100000000fffffffffffffffffffffffffffffffffffffffffffffffffff66ffffffffffffffffff0000000000000ffffffffffffffff
0000000000000000fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffffff2277fffffffffffffff1000000000000000000000000000000
000000000000000000f1f1f1f1ffffffff6fffffff6fffffff6ffffffffffffffffffffffffff220877fffffffffffff1f00000000000000f000000ff000000f
0000000000000000f1ffff1f1ffffffffffffffffffffffffffffffffffffffffffffffffffff6886d76fffffffffffff10000000000ffff0000000000000000
000000000000ffff0f1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff578d786ffffffffffff1f000000000000f0ffffffffffffffff
00000000000f0001f1fffffffffffff6fffffff6fffffff6ffffffffffffffffffffffffffffff57d8d5fffffffffffff1fff000ffff00000000000000000000
fffffff0ffff00ff1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5685fffffffffffffff000000000000000000000000000000
0000000000001f1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55fffffffffffffffff000000000000000000000000f0000
000100000000fffffffffffffffffffffffffffffffff6fff6ffddddddddddddddddffffffffffffffffffffffffffffffff0000000000000000000000000000
000ff000000ff6fffffff6fffffff6fffffff6fffffff8fff8ffd766777755555555fffffffffffffffffffffffffffff1ffff0000fffff00000000000fffff0
00f1f1f1f1ffffffff6fffffff6fffffff6fffffff6ff2fff2ffd7ddfff755555555ffffffffffffffffffffffffffff1f000000000000000000000000000000
01ffff1f1fffffffffffffffffffffffffffffffffff0f0f0f0fd7777f7765555777fffffffffffffffffffffffffffff1000f000000000000000f0000000000
0f1ffffffffffffffffffffffffffffffffffffffffffff6ffffd4447ff7265557f6ffffffffffffffffffffffffffff1f000ff00000000000000000ffffffff
f1fffffffffffff6fffffff6fffffff6fffffff6fffffff8ffffd4047777655777fdfffffffffffffffffffffffffffff1000000ffffffff00000000ffffffff
1ffffffffffffffffffffffffffffffffffffffffffffff2ffffd44444442657ffffffffffffffffffffffffffffffffff0000000000000000000000ffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff0fffd55544445557ff7ffffffffffffffffffffffffffffffff00000ffffffff00000000ffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffd76677775557ff7ffffffffffffffffffffffffffffffff000000000000000000000ffffffff
7ffffffffffffffffffff6fffffff6fffffff6ffffffffffffffd7ddfff755577777fffffffffffffffffffffffffffff1000000ffffffff00000000ffffffff
ff7fffffffffffffffffffffff6fffffff6fffffff6fffffffffd7777f7765544444ffffffffffffffffffffffffffff1f0000000000000000000000ffffffff
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
ffffffffffffffffffffffffffffd50000000066dd1fd55555556dd11666666d705501111115ffffffff55d151d5d5515155d551110222414142444141444400
fffffff6fffffff6ffffffffffffd555555555111110d55555556d7661111117705055421425ffffffff15151515551515155515151000121210441414141400
ffffffffffffffffffffffffffffd551f6155566dd66d55555556d55d5dd6661100555425425fffffffff000000f100000051000000510000001400000044000
ffffffffffffffffffffffffffffd550f605551111ddd55555556ddd6ddd7111102555425425ffffffff00000000000f00000000000000000000000000001000
ffffffffffffffffffffffffffffd555f655551d6d10ffffffff6d7777777111104555425425fffffff0000f0f0f0f0000000000000000000000000000000000
1ffffffffffff6ffffffffffffffd5516615551d6d10ffffffff6d7011111ddd644555555555fffff1000000000000f000000000000000000000000000000000
f1ffffffffffffffff6fffffffffd5505505551d6d10ffffffff6770d1d11ddd705555555555ffff1f0000000000000000000000000f00000000000000000000
0f1fffffffffffffffffffffffffd5555555551d6d10ffffffffddd0d1d11677705555555555fffff10000000000000000000000000000000000000000000000
01ffffffffffffffffffffffffffd55555555510d010ffffffffddd0d1dd111115dddddd5555ffff1f0000000000222222222222222222222222222222222200
00f1fffffffffff6ffffffffffffd555550f050aaa00ffffffff0001d1111111105555555555fffff1000000000020f777777770000000000000000000000200
000fffffffffffffffffffffffffd55f0f5555555555ffffffff00111ddd111115dddddd5555ffffff0000000000200700080070000000000000000000000200
0001ffffffffffffffffffffffffd555555555555555ffffffff011111111111105555555555fffffff00000000020070088007000000000f000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d555d555d5fffffff000000000200708000070000000000000000000000200
000000ffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d15555155fffff10f00000000200700800070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d5515d55d555ffff1f0000000000200708080f70000000000000000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55515d5555515d5dfffff1000000000020f700000070000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffffd55d5555d5555555ffff1f000000000020077777777000000000000f000000000200
000000f1ffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d555d51555fffff10000000000200000000000000000000000000000000200
0000001fffffffffffffffffffffffffffffffffffffffffffffffffffff1555555515555515ffffff0000000000200000000000f00000000000000000000200
00000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515555d5555fffffff000000000200000000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffffffffffffffffffff1d5155555d555d5ffffff1f100000000200000000000000000000000000000000200
000000fffffffffffffff688886ff6fffffff6ffffffffffffffffffffff5155d55dd5155551fff1ff0000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8fffffff6fffffff6fffffffffffffffff555d5155155d55d5ff1f0000000000002000000000000f0000000000000000000200
000000f1fffffffffffff2888d8fffffffffffffffffffffffffffffffffd5555d5555d51555f1f0000000000000200000000000000000000000000000000200
0000001ffffffffffffff2076d8ffffffffffffffffffff1f1fffff1f1ff55d151d55551d15dff00000000000000200000000000000000000000000000000200
000000f1fffffffffffff688886ffff6fffffff6ffffff1f1f1fff1f1f1f151515155d151d151f00000000000000200000000000000000000f000f00000f02f0
0f00001ffffffffffffff555555ffffffffffffffffff000000ff000000ff000000f50000001f00000000000000020000f000000000000000000000000000200
00000fffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000f100f00f0000000002000000000000f0000000000000000000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000000000000200
000000fffffffffffffffffffffffffffffff6fff1000000000000000000000000000000000000000000000000002000000000000000000000f0000000000200
0000001fffffffffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000200000f00000000000000000000000000200
0f0000f1fffffffffffffffffffffffffffffffff100000000000000000000000000000000000000000000000000200000000000000000000000110000000200
0000001fffffffffffffffffffffffffffffffff1f0000000000000000000f000000000000000000000000000000200000000000000000000000171000000200
000000f1fffffffffffffffffffffffffffffff6f100000000000000000000000000000000000000000000000000200000000000000000000000177100000200
0000001fffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000f00000000002000000000000000f0000000177710000200
00000ffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000200000000000000000000000177771000200
00001f1ffffffffffffffffffffffffffffffffff1f1f00000000000000000000000000000000000000000000000200f000f00f00f0000000000177110000200
ff0000ff1ffffffffffffffffffffffffffffff1ff00000000000000000000000000000000000000000000000000200000000000000000000000011000000200
00000001f1ffffffffffffffffffffffffffff1f000000000000000f00f0000f0000000000000000000000000000200000000000000000000000000000000200
000000000f1ffffffffffffffffffffffffff1f00000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000001fffff1f1fffff1f1fffff1f1ffff000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200
0000000000f1ff1f1f1fff1f1f1fff1f1f1f1f00000000000000000000000f000000000000000000000000000000222222222222222222222222222222222200
00000000000ff000000ff000000ff000000ff000000000000000000000000000f000f00000000000000000000000000000000000000000000000000000000000
0000000000010000f000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000020202020202000000000000000000000200000000010101010101010101010101010000000000000101010000000001010101010100000000000000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012121212120000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
0000000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000000001616160000003300000000000008090a00000000000000000000000000000000001212121212120000000000000000000003030300000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
12121200000000161616163d4b0000000000000000080909090a000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121212000016161600141400000000000809090909090a000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d004214000000080b09090909090c00000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000002040000080b09090d0909090c0000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000441414040000000c09090909090c000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016000014141400310000003665050500000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000601140000000002050303030000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001634000014140500000003031718190300000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016160060033f6205050006031d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000120000160006060002030300000217191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001212000000000000000049030000061d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000351616000006070000000206060000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000016000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000121212120000000000001212121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012121212000016000000000000121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000000000000000001600000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
0000000000000000161600000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001600160000000000000000000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000044050047000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000035000205050503030400000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000217181819030303490000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003200310040031d1b1b1b181819040000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000020303031d1e1b1b1b1c036200000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
160000000000000000060303031a1b1b1f030303050000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000360000004d031d1e1f03060700020605000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1616160000000000000000060665030303000000000006070000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

