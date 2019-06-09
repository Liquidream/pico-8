pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=false
b=false
c,d=0,0
e,f=0,0
g,h=0,0
i=nil
j=2335
k=8
l=2
m=0
count=0
n={}
o={}
p={}
q={}
r={}
r.s=function(self)
u=1
v=self.w.x[1]
y(6,89,"⬆️",function(self)
z=mid(1,z-1,#i.x)
v=i.x[z]
if(z<u) u-=1
end,10)
y(17,89,"⬇️",function(self)
z=mid(1,z+1,#i.x)
v=i.x[z]
if(z>u+2) u=min(u+1,#ba.w.x-2)
end,10)
y(32,88,"build",function(self)
ba=nil
i.bb=bc
bc:bd()
end)
y(96,88,"close",function(self)
ba=nil
end)
ba=self
end
r.be=function(self)
self.bf={
{14,12},
{14,12},
{14,12},
{14,12},
{14,13},
{14,1},
{14,1},
{14,1},
{14,1},
{14,13},
}
self.bg=1
end
bh=[[id|name|obj_spr|ico_spr|map_spr|type|w|h|trans_col|parent_id|req_id|req_level|req_faction|cost|power|arms|hitpoint|speed|range|norotate|altframe|framecount|description|func_init|func_draw|func_update|func_onclick
]]..
[[1|cONSTRUCTION yARD|64|128||2|2|2|nil|nil|nil|1||100|nil||400||||||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||||factory_click
2|wINDTRAP|66|130||2|2|2|nil|1|1|1||300|100||200|||||10|tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|init_windtrap|||
3|sMALL cONCRETE sLAB|19|160||2|1|1|nil|1|1|1||5|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
4|lARGE cONCRETE sLAB|19|162||2|2|2|nil|1|1|4||20|nil||0||||||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||||
5|dEFENSIVE wALL|79|164||2|1|1|nil|1|7|4||50|nil||50||||||tHE wALL IS USED FOR PASSIVE DEFENSE.||||
6|sPICE rEFINERY|68|132||2|3|2|nil|1|2|1||400|30||450||||||tHE rEFINERY CONVERTS SPICE INTO CREDITS.||||
7|rADAR oUTPOST|73|136||2|2|2|nil|1|2|2||400|30||500||||||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|71|134||2|2|2|nil|1|6|2||150|5||150||||||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||||
9|bARRACKS|75|168||2|2|2|nil|1|7|2||300|10||300||||||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||||factory_click
10|wor tROOPER fACILITY|77|138||2|2|2|nil|1|7|2||400|10||400||||||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140||2|2|2|nil|1|6|2||400|20||350||||||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142||2|3|2|nil|1|6|3||600|20||200||||||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166||2|3|2|nil|1|12|5||500|35||400||||||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||||factory_click
14|cANNON tURRET|60|170||2|1|1|nil|1|7|5||125|10||200||||||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||||
15|rOCKET tURRET|61|172||2|1|1|nil|1|7|6||250|20||200||||||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||||
16|rEPAIR fACILITY||||2|3|2|nil|1|12|5||700|20||200||||||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||||
17|sTARPORT||||2|3|3|nil|1|6|6||500|50||500||||||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||||factory_click
18|hOUSE OF ix||||2|2|2|nil|1|12|5||500|40||400||||||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||||
19|pALACE||||2|3|3|nil|1|17|8||999|80||1000||||||tHIS IS YOUR pALACE.||||factory_click
]]..
[[20|lIGHT iNFANTRY (X3)|62|174||1|1|1|11|9|9|2|AO|60||4|50|0.05|2|1|63|10|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||||
21|hEAVY tROOPERS (X3)|62|194||1|1|1|11|10|9|3|HO|100||8|110|0.1|3|1|63|10|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.|||
22|tRIKE||204||1|1|1|11|11||2||150||8|100|0.6|3||||tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||||
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
bi()
bj=1
bk()
bl=0
cursor={
bm=0,
bn=0,
bo=8,
bp=8,
spr=0,
bq=function(self)
return{
bm=self.bm+(not br and c or 0)+2,
bn=self.bn+(not br and d or 0)+1,
bo=1,
bp=1
}
end,
bs=function(self)
spr((i and(i.type==1)) and 1 or self.bt,
self.bm,self.bn,self.bo/8,self.bp/8)
end
}
bu()
c=44
d=8
music(9)
end
function bu()
for bv=1,2 do
for bw=0,31 do
for bx=0,127 do
local by=nil
local bz=mget(bx,bw)
local ca=fget(bz)
local cb=0
if(bz>0) printh("mpos="..bx..","..bw.." - spr_val="..bz)
if bv==1 and bz==1 then
cc=bx*8
cd=bw*8
cb=1
by=bh[1]
elseif bv==2 then
for ce in all(
bh) do
if(ce.bt!=nil and ce.bt==bz) by=ce break
end
end
if by!=nil then
cf(by,bx*8,bw*8,cb)
if by.type==2 then
mset(bx,bw,20)
elseif by.type==1 then
mset(bx,bw,17)
end
end
end
end
end
end
function cf(by,bm,bn,cb)
local cg=ch(by,bm,bn,by.type,nil,r[by.ci],r[by.cj],r[by.ck],nil)
cg.cl=ch(by,109,0,3,cg,nil,nil,r[by.bd])
cg.cm=100
cg.x={}
for ce in all(bh) do
if(ce.cn!=nil and ce.cn==cg.co) then
local bb=ch(ce,109,0,4,cg,nil,nil,function(self)
printh("build item clicked...")
printh("name=.."..self.cp)
if ba then
i=self
else
self.cq=5/self.cr
self.cs=cocreate(function(self)
self.ct=0
self.cu=0
while self.cu<self.cr do
self.ct+=1
if(self.ct>3) self.ct=0 j-=1 sfx(63) self.cu+=1
self.cm=(self.cu/self.cr)*100
yield()
end
sfx(56)
end)
end
end)
add(cg.x,bb)
cg.bb=cg.x[1]
end
end
if cb==0 then
if cv(bm,bn,cc,cd)<75 then
cg.cb=1
else
cg.cb=2
end
else
cg.cb=cb
end
if by.type==2 then
add(p,cg)
end
if by.type==1 then
if(cg.cw!=1) cg.cx=flr(rnd(8))*.125
add(n,cg)
end
cy(cg)
end
function ch(cz,bm,bn,da,w,ci,cj,bd)
local db=(cz.bo or 1)*8
local dc=(cz.bp or 1)*8
local dd={
de=cz,
bm=bm,
bn=bn,
df=1,
type=da,
w=w,
bd=bd,
bo=db,
bp=dc,
dg=cz.bt,
dh=cz.bo or 1,
di=cz.bp or 1,
cm=0,
dj=0,
dk=0,
bq=function(self)
return{
bm=self.bm,
bn=self.bn,
bo=(self.type>2 and 16 or self.bo)-1,
bp=(self.type>2 and 16 or self.bp)-1
}
end,
bs=cj or function(self)
pal()
palt(0,false)
if(self.dl) palt(self.dl,true)
if self.bf then
pal(self.bf[self.bg][1],
self.bf[self.bg][2])
end
if self.cx then
dm(self.bt%16*8,flr(self.bt/16)*8,self.bm,self.bn+1,.25-self.cx,1,self.dl,self.cb==2 and 8 or 5)
dm(self.bt%16*8,flr(self.bt/16)*8,self.bm,self.bn,.25-self.cx,1,self.dl)
else
if self.type>2 then
rectfill(self.bm-1,self.bn-1,self.bm+16,self.bn+19,0)
local dn=self.type==4 and self or self.w
local dp=dn.cq and 12 or(dn.cm<33 and 8 or dn.cm<66 and 10 or 11)
if(dn.cm>0) rectfill(self.bm,self.bn+17,self.bm+(15*dn.cm/100),self.bn+18,dp)
end
if self.type>2 then
spr(self.dq,self.bm,self.bn,2,2)
else
spr(self.bt,self.bm,self.bn,self.bo/8,self.bp/8)
end
end
if(b) dr(self)
end,
ds=function(self)
if self.dt!=nil then
self.dj+=1
if(self.dj>self.dt) then
self.dj=0
if self.du
and self.dv==2 then
self.bt=self.dg+(self.du-self.bt)
end
if self.bf then
self.bg+=1
if(self.bg>#self.bf) self.bg=1
end
end
end
end,
dw=function(self,bm,bn)
self.bm=bm
self.bn=bn
end
}
for dx,dy in pairs(cz) do
if dd[dx]==nil and dy!=""then
dd[dx]=dy
end
end
if(ci) ci(dd)
return dd
end
function cy(dz)
if(dz.cb!=1 and dz.dv!=3) return
local ea=dz.type==2 and 3 or 2
for eb=-ea,ea do
for ec=-ea,ea do
local ed=flr(dz.bm/8)+eb
local ee=flr(dz.bn/8)+ec
ef[ed][ee]=16
eg(ed,ee)
for eh=-1,1 do
for ei=-1,1 do
eg(ed+ei,ee+eh)
end
end
end
end
end
function _update60()
ej()
if(t()%1==0) ek()
m+=1
end
function _draw()
el()
em()
if(a) en("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function bk()
ef={}
for bv=-2,66 do
ef[bv]={}
for eo=-2,66 do
ef[bv][eo]=0
end
end
end
function ep()
local eq=flr(c/8)
local er=flr(d/8)
for eb=eq-1,eq+16 do
for ec=er-1,er+16 do
if ef[eb][ec]!=0 and ef[eb][ec]!=16 then
palt(11,true)
spr(ef[eb][ec]+31,eb*8,ec*8)
elseif ef[eb][ec]<16 then
rectfill(eb*8,ec*8,eb*8+7,ec*8+7,0)
end
end
end
end
function eg(bm,bn)
if(bm<0 or bm>#ef or bn<0 or bn>#ef) return
local es=0
if ef[bm][bn]!=0 then
if(ef[bm][bn-1]>0) es+=1
if(ef[bm-1][bn]>0) es+=2
if(ef[bm+1][bn]>0) es+=4
if(ef[bm][bn+1]>0) es+=8
ef[bm][bn]=1+es
end
end
function ek()
o={}
for et,eu in pairs(n) do
o[flr(eu.bm/8)..","..flr(eu.bn/8)]=1
end
end
function ej()
ev=stat(32)
ew=stat(33)
ex=stat(34)
ey=(ex>0 and ez!=ex) or btnp(4)
for dx=0,1 do
if(btn(dx)) g+=dx*2-1
if(btn(dx+2)) h+=dx*2-1
end
e=mid(0,ev+g,127)
f=mid(0,ew+h,127)
cursor.bm=e
cursor.bn=f
if not ba then
if(e<4) c-=2
if(e>123) c+=2
if(f<4) d-=2
if(f>123) d+=2
c=mid(c,384)
d=mid(d,384)
end
fa()
fb()
bl+=1
ez=ex
fc=i
bc=v
end
function fd(eu,bm,bn)
eu.fe="init"
if fget(mget(bm,bn),0)
or o[bm..","..bn] then
printh("aborting pathfinding - invalid target")
return
end
eu.ff=bm
eu.fg=bn
eu.fh=eu.dv
eu.dv=1
eu.cs=cocreate(fi)
end
function fa()
for et,eu in pairs(n) do
fj(eu)
end
for et,fk in pairs(p) do
fj(fk)
fj(fk.bb)
end
end
function fj(dd)
if dd then
if dd.cs and costatus(dd.cs)!='dead'then
assert(coresume(dd.cs,dd))
else
dd.cs=nil
end
end
end
function el()
cls"15"
camera(c,d)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
if fe!=nil and fe!="init"then
spr(144,fe[1].bm*8,fe[1].bn*8)
end
for et,fk in pairs(p) do
fk:ds()
fk:bs()
if(fk==i) then
rect(i.bm,i.bn,
i.bm+i.bo-1,i.bn+i.bp-1,
7)
end
end
palt(11,true)
for et,eu in pairs(n) do
eu:ds()
eu:bs()
if(eu==i) then
palt(11,true)
spr(16,i.bm,i.bn)
end
end
ep()
end
function em()
camera(0,0)
pal()
palt(0,false)
if i and i.cl then
i.cl:dw(109,20)
i.cl:bs()
if i.bb then
i.bb:dw(109,44)
i.bb:bs()
end
end
en("00"..flr(j),103,2,7)
if i
and i.bb
and i.bb.cm>=100 then
local fl=flr((cursor.bm+c)/8)*8-c
local fm=flr((cursor.bn+d)/8)*8-d
fillp("0b1110110110110111.1")
rectfill(fl,fm,
fl+i.bb.bo,fm+i.bb.bp,11)
fillp()
end
if ba then
fn(121,73,l,k)
if i.x then
rectfill(6,30,27,97,0)
for bv=1,#i.x do
local fo=i.x[bv]
if bv>=u and bv<=u+2 then
fo:dw(9,32+((bv-u)*19))
fo:bs()
else
fo:dw(-16,16)
end
if(v==fo) then
z=bv
rect(fo.bm-2,fo.bn-2,
fo.bm+17,fo.bn+17,
7)
print(v.cp,30,31,7)
print("cOST:"..v.cr,85,38,9)
fp=0
local fq=fr(v.fs,23)
for eo in all(fq) do
print(eo,30,44+fp,6)
fp+=6
end
end
end
end
for et,ft in pairs(q) do
ft:bs()
end
end
palt(11,true)
cursor:bs()
end
function fn(bo,bp,fu,fv)
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(64-bo/2,64-bp/2,64+bo/2,64+bp/2,fu)
rect(64-bo/2+1,64-bp/2+1,64+bo/2-1,64+bp/2-1,fv)
end
function y(bm,bn,fw,bd,db)
local dd={
bm=bm,
bn=bn,
bo=db or#fw*4+2,
bp=8,
fw=fw,
bq=function(self)
return{
bm=self.bm,
bn=self.bn,
bo=self.bo,
bp=self.bp
}
end,
bs=function(self)
if(#fw>1) rectfill(self.bm,self.bn,self.bm+self.bo,self.bn+self.bp,7)
if(#fw>1) rectfill(self.bm+1,self.bn+1,self.bm+self.bo-1,self.bn+self.bp-1,self.fx and 12 or 6)
print(self.fw,self.bm+2,self.bn+2,(#fw>1) and 0 or(self.fx and 12 or 7))
if(b) dr(self)
end,
bd=bd
}
add(q,dd)
end
function fr(fy,fz)
local ga={}
local gb=""
local gc=""
local gd=""
local ge=function(gf)
if#gc+#gb>gf then
add(ga,gb)
gb=""
end
gb=gb..gc
gc=""
end
for bv=1,#fy do
gd=sub(fy,bv,bv)
gc=gc..gd
if gd==" "
or#gc>fz-1 then
ge(fz)
elseif#gc>fz-1 then
gc=gc.."-"
ge(fz)
elseif gd==";"then
gb=gb..sub(gc,1,#gc-1)
gc=""
ge(0)
end
end
ge(fz)
if gb!=""then
add(ga,gb)
end
return ga
end
function fb()
gg=false
if not ba then
foreach(n,gh)
foreach(p,gh)
end
if i then
br=true
if(i.cl and not ba) gh(i.cl)
foreach(i.x,gh)
foreach(q,gh)
br=false
end
if ey then
if gg then
if(not ba and i.bd and i.w!=nil) i:bd() i=fc
if(ba and v.fw and v.bd) v:bd()
if(i.type==1) sfx(62)
else
if i and i.type==1 then
fd(i,flr((c+e)/8),flr((d+f)/8))
end
if i
and i.bb
and i.bb.cm>=100 then
local fl=flr((cursor.bm+c)/8)
local fm=flr((cursor.bn+d)/8)
if(i.bb.co==3 or i.bb.co==4) then
for eb=0,i.bb.dh-1 do
for ec=0,i.bb.di-1 do
mset(fl+eb,fm+ec,19)
end
end
else
local by=i.bb.de
cf(by,fl*8,fm*8)
end
i.bb.cm=0
sfx(61)
end
if(not ba) i=nil
end
end
end
function gh(dd)
dd.fx=gi(cursor,dd)
if ey and dd.fx then
if ba then
v=dd
printh("selected_subobj selected!")
else
i=dd
end
gg=true
end
end
function gj(gk,gl)
end
function gm(self,gn)
if(gn==self.go) return
local gp=self.gq[gn]
self.gr=gp.bl
self.go=gn
self.gs=1
end
function gt(self)
self.gr-=1
if self.gr<=0 then
self.gs+=1
local gp=self.gq[self.go]
self.gr=gp.bl
if self.gs>#gp.gu then
self.gs=1
end
self.bt=gp.gu[self.gs]
end
end
function en(gv,gw,
gx,dp,
gy)
for eb=-1,1 do
for ec=-1,1 do
print(gv,gw+eb,gx+ec,gy)
end
end
print(gv,gw,gx,dp)
end
function gi(gk,gl)
local gz=gk:bq()
local ha=gl:bq()
if gz.bm<ha.bm+ha.bo and
gz.bm+gz.bo>ha.bm and
gz.bn<ha.bn+ha.bp and
gz.bn+gz.bp>ha.bn
then
return true
else
return false
end
end
function dr(dd)
local hb=dd:bq()
rect(hb.bm,hb.bn,hb.bm+hb.bo,hb.bn+hb.bp,dd.fx and 11 or 8)
end
function hc()
return flr(t())%2==0
end
function bi()
hd=he(bh,"|","\n")
hf={}
for bv=2,#hd-1 do
hg={}
for hh=1,#hd[bv] do
local hi=hd[bv][hh]
if(hh!=2 and hh<23) hi=tonum(hi)
hg[hd[1][hh]]=hi
end
hf[tonum(hd[bv][1])]=hg
end
bh=hf
printh("test 8:"..bh[2].cp)
printh("test 98:"..bh[2].co)
printh("test 98b:"..bh[2].ci)
end
function he(gv,hj,hk)
local gp={}
local hl=0
local hm=''
local hn=''
if hk~=nil then gv=he(gv,hk) end
while#gv>0 do
if type(gv)=='table'then
hm=gv[1]
add(gp,he(hm,hj))
del(gv,hm)
else
hm=sub(gv,1,1)
gv=sub(gv,2)
if hm==hj then
add(gp,hn)
hn=''
else
hn=hn..hm
end
end
end
add(gp,hn)
return gp
end
local ho=0
function dm(hp,hq,bm,bn,gp,bo,hr,hs)
local ht,hu=cos(gp),sin(gp)
local hv,hw,hx,hy
local hz,ia=ht,hu
local es=shl(0xfff8,(bo-1))
bo*=4
ht*=bo-0.5
hu*=bo-0.5
local ib,ic=hu-ht+bo,-ht-hu+bo
bo=2*bo-1
for id=0,bo do
hv,hw=ib,ic
for ie=0,bo do
if band(bor(hv,hw),es)==0 then
local hl=sget(hp+hv,hq+hw)
if(hl!=hr) pset(bm+id,bn+ie,hs or hl)
end
hv-=ia
hw+=hz
end
ib+=hz
ic+=ia
end
end
function cv(ig,ih,ii,ij)
return abs(sqrt(((ig-ii)/1000)^2+((ih-ij)/1000)^2)*1000)
end
function fi(eu)
eu.fe=ik(
{bm=flr(eu.bm/8),bn=flr(eu.bn/8)},
{bm=eu.ff,bn=eu.fg},
il,
im,
io,
function(ip) return shl(ip.bn,8)+ip.bm end,
nil)
eu.fh=eu.dv
eu.dv=2
eu.cs=cocreate(iq)
end
function iq(eu)
eu.dv=2
for bv=#eu.fe-1,1,-1 do
local ip=eu.fe[bv]
if not eu.cw then
local ei=eu.bm-(ip.bm*8)
local eh=eu.bn-(ip.bn*8)
local gp=atan2(ei,eh)
while(eu.cx!=gp) do
ir(eu,gp)
end
end
local is=eu.it or .5
local iu=sqrt((ip.bm*8-eu.bm)^2+(ip.bn*8-eu.bn)^2)
local iv=is*(ip.bm*8-eu.bm)/iu
local iw=is*(ip.bn*8-eu.bn)/iu
for bv=0,iu/is-1 do
eu.bm+=iv
eu.bn+=iw
yield()
end
eu.bm,eu.bn=ip.bm*8,ip.bn*8
cy(eu)
end
eu.dv=1
end
ix=3.14159
iy=.5*(ix/180)
function ir(eu,iz)
ja=iz-eu.cx
if ja>0.5 then
ja-=1
elseif ja<-0.5 then
ja+=1
end
if ja>iy then
eu.cx+=iy
elseif ja<-iy then
eu.cx-=iy
else
eu.cx=iz
end
if(eu.cx>ix) eu.cx-=2*ix
if(eu.cx<-ix) eu.cx+=2*ix
yield()
end
function im(jb,ip,jc)
local jd=fget(mget(ip.bm,ip.bn),1) and 4 or 1
if(jb.bm!=ip.bm and jb.bn!=ip.bn) return jd+1
return jd
end
function io(ip,jc)
local je={}
for eb=-1,1 do
for ec=-1,1 do
if(eb!=0 or ec!=0) jf(ip.bm+eb,ip.bn+ec,je)
end
end return je
end
function jf(jg,jh,ji)
if(
not fget(mget(jg,jh),0)
and o[jg..","..jh]==nil
)
then
add(ji,{bm=jg,bn=jh})
end
end
function il(gp,jj)
return abs(gp.bm-jj.bm)+abs(gp.bn-jj.bn)
end
function ik
(jk,
jl,
jm,
jn,
je,
jo,
jc)
local jp,
jq={
jr=jk,
js=0,
jt=jm(jk,jl,jc)
},{}
jq[jo(jk,jc)]=jp
local ju,jv,jw,jx={jp},1,jo(jl,jc),32767.99
while jv>0 do
local cr,jy=jx
for bv=1,jv do
local jz=ju[bv].js+ju[bv].jt
if(jz<=cr) jy,cr=bv,jz
end
jp=ju[jy]
ju[jy],jp.ka=ju[jv],true
jv-=1
local kb=jp.jr
if jo(kb,jc)==jw then
kb={jl}
while jp.kc do
jp=jq[jo(jp.kc,jc)]
add(kb,jp.jr)
end
return kb
end
for kd in all(je(kb,jc)) do
local co=jo(kd,jc)
local ke,kf=
jq[co],
jp.js+jn(kb,kd,jc)
if not ke then
ke={
jr=kd,
js=jx,
jt=jm(kd,jl,jc)
}
jv+=1
ju[jv],jq[co]=ke,ke
end
if not ke.ka and ke.js>kf then
ke.js,ke.kc=kf,kb
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
bbbbbbbbbbb1bbbbf5d555d555d555d55d555d5fffffffff1d515555ffffffff99f99999ffffffffffffffff9f99f9f9ff9f9999ffffffffffffffffffffffff
bb11bbbbbb171bbb1555515d15555155d51555515dfffd5f5155d55dffff9fff9f9999f9fff9fffffffffffff99f99f999f99899ffffffffffffffffffffffff
bb171bbbb1bbb1bb5d55d5515d55d555155d55d5d5155551555d5155ffff999999ff99999999ffffffffffff9f99f99f9f9989f9ffffffffffffffffffffffff
bb1771bb17b1b71b55515d5555515d5d55d51555155d55d5d5555d55fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899ffffffffffffffffffffffff
bb17771bb1bbb1bbd55d5555d55555555555d55d55d5155555d155d5fffff9f9fff999999f9fffffff99f999f9ffff9f99998f99ffffffffffffffffffffffff
bb177771bb171bbb55d551d555d515555d155d555555d55d15555555ffff999999999f999999ffff999f99f9fffffffffff89999ffffffffffffffffffffffff
bb17711bbbb1bbbb1555555515555515555555515d155d55f51ffd5ffff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99ffffffffffffffffffffffff
bbb11bbbbbbbbbbbf55d5515555d55555155d55f55555551ffffffffffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9ffffffffffffffffffffffff
b7bbbb7bffffffffffffffffddddddddddddddddffffffffffffffff55d555d555d555d555d555d555d2444444444444444444d555dd244444444444444442d5
77bbbb77fffffffffff77fffd5555555d5555555f888888ff6ffffff155551551555515515555155155244444444444444444455155024444444444444444055
bbbbbbbbffffffffff79ff7fd5555555d5015515f8a8888fffffff6f5d55d555555555555555d5555d24444444444444444444455d5104444444444444442155
bbbbbbbbfffffffff79f779fd5555555d5105555f888888fffffffff555155555555555551555d5d55244444444444444444444d555112444444444444420d5d
bbbbbbbbfffffffffff799ffd5555555d5555111f888888fffffffffd55555555544444444455555d52444444444444444444445d55510022244444222201555
bbbbbbbbffffffffff799fffd5555555d1555101f888888ffff6ffff55d55544444444444444455555244444444444444444442555d515100022222000015555
77bbbb77ffffffffff79ffffd5555555d5555111f888888fffffffff155554444444444444444515155244444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffd5555555d5515555ffffffffffffffff555524444444444444444455555244444444444444444255555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
0000000000000000bbb0bbbb10000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbb2222bbb08dd80bbbbbbbbbb28882bbbbbbbbbbffffffffffffffffffffffffffffffffffffffff50bbb05bbbb76bbbbbb76bbbb6bbb6bbb6bbb6bb
ffffffffb088880bb2d77d2bb68d86bb0888880bb68886bbbfffffffffffffffffffffffffffffffffffffff6888886bbbb76bbbbbb76bbbb8bbb8bbb8bbb8bb
ffffffffb088880bb867768bb7d7d7bb0828280bb8ddd8bbbfffffffffffffffffffffffffffffffffffffff68d8d86bbbbddbbbb7b55b7bb2bbb2bbb2bbb2bb
ffffffffb288882bb867768bb7d6d7bb2868682bb86868bbbfffffffffffffffffffffffffffffffffffffff6868686bbbd66dbbb651156bb0bbb0bb0b0b0b0b
ffffffffb288882bb2d66d2bb78687bb2262622bb87878bbbfffffffffffffffffffffffffffffffffffffff6878786bbbd66dbbbdd66ddbbbb6bbbbbbb6bbbb
ffffffffb028820bb286682bb78087bb2c0c0c2bb80808bbbfffffffffffffffffffffffffffffffffffffff6808086bbbbddbbbb1b11b1bbbb8bbbbbbb8bbbb
ffffffffb0d22d0bb026620bb62226bb0088800bb62226bbbfffffffffffffffffffffffffffffffffffffff7888887bbbbbbbbbbbbbbbbbbbb2bbbbbbb2bbbb
ffffffffbb2882bbbbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffffffffff50bbb05bbbbbbbbbbbbbbbbbbbb0bbbbbb0b0bbb
d66dddddddd6fffdddd776ddddddddddddddddddddd666ddddddddddddd6666dddddddddddddddddddddddddddddddddddddddddd19999999999999977777777
76665555551ffff1d576de65d5577655d5555555d5766665d5555555d566777655555555d555555555555555d766777755555555d49495594999924976666665
76665805555f4441d76deee5d576de65d5556555d5766665d5888885d767666d65555555d554777777777455d7ddfff755555555d19425599922999976666665
177d22055d5ffff1d66d11e5d76deee5d5576655d5677725d5555555d767666d65555555d544ff7fff7ff445d7777f7765555777d495f5f4f412141976666665
d1d55505555f1011d66d01e5d66d11e5d55d7d55d566dd25d5522255d766ddd665555555d504777778617405d4447ff7265557f6d19565656599995976666665
6555550515df1001d66d0e55d66d01e5d55ddd55d566dd25d5555555d676666625555555d544ff7ff6d1f445d4047777655777fdd49995555594495976666665
d6d6d55555551005d56dd555d66d0e55d555d555d556dd55d5552555d667ddd225666655d504777771177405d44444442657ffffd19495805594495976666665
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5522255d66d11d226680765d544ff7fff7ff445d55544445557ff7fd49992205594495955555555
dddddddd55d555d5ddddd776ddddddddddd666ddddddddddddddddddd56d11d2762206d6d504777777777405d76677775557ff7fd195594095999959dddddddd
d555555515555155d55576de65555555d5766665d5555555d5522255d55d11d5767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779d5ddddd5
d555555a5d55d555d5576deee5558055d5766665d5556555d5552555d5555555766d0d66d542222222222245d7777f77655444449999529925777777d55ddd55
d5aaa99a55515d5dd5566d11e5522055d5677725d5576655d5555555d555555567666662d528028020200225d4447ff7265804809429444444776666d555d555
d5aaa55ad5555555d5566d01e5555055d566dd25d55d7d55d5522255d5555555667dd722d522022022200225d4047777652202209999242424766666d5551555
d5a1199a55d51555d5566d0ed5555055d566dd25d55ddd55d5555555d555555566d11d22d551011011111115d444444426550550944242424296666dd5511155
d544445a15555515d5556dd5d5555555d556dd55d555d555d5888885d555555556d11d25d555011011111155d555444455550550944242424294ddd2d5111115
d5151515555d5555d5555555d5555555d5555555d5555555d5555555d555555555d11d55d555511111111555d555222255555555d555555555594425d1111111
dddd666666ddddddddd7778666666dddddddddddddddddddddddd666666666660000000000000000000000000000000000000000000000000000000000000000
d566ddddd61111106667d22ddddd657667555555d557755555555ddddd4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5dddd000066dd666dd7dd0dd6666dddddd56765d566969666655ddddd4ddd5d0000000000000000000000000000000000000000000000000000000000000000
d5dd0000001111dd6dd7660dd6dd611111ddddd5d5ddadadddd55ddd5ddd5ddd0000000000000000000000000000000000000000000000000000000000000000
d50000000066dd106dd11666666d7055011111157777a7a711555ddddd55d5dd0000000000000000000000000000000000000000000000000000000000000000
d5555555551111106d76611111177050554214257d9d9d971155544d5555dd440000000000000000000000000000000000000000000000000000000000000000
d551f6155566dd666d55d5dd66611005554254257da76767115767dddd5d5ddd0000000000000000000000000000000000000000000000000000000000000000
d550f605551111dd6ddd6ddd711110255542542575776d675576667d5ddddd5d0000000000000000000000000000000000000000000000000000000000000000
d555f655551d6d106d777777711110455542542575777777766767667d4d5ddd0000000000000000000000000000000000000000000000000000000000000000
d5516615551d6d106d7011111ddd6445555555557d780777767767767d4ddddd0000000000000000000000000000000000000000000000000000000000000000
d5505505551d6d106770d1d11ddd7055555555557d220dddd666d66d755555550000000000000000000000000000000000000000000000000000000000000000
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
99f99999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
9f9999f9fff9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99ff99999999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f99f9f99fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fff999999f9fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f999999ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99fff9f9f9f99fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ff9f99999f99ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99f9999999f99999fffffffff5d555d5ffffffffffffffffffffffff5d555d5fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
9f9999f99f9999f9fff9ffff1555515dffffffffffffffffffffffffd5155551ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99ff999999ff99999999ffff5d55d551ffffffffffffffffffffffff155d55d5ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f9999999f99f9f99fff55515d55ffffffffffffffffffffffff55d51555ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fff99999fff999999f9fffffd55d5555ffffffffffffffffffffffff5555d55dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99999f9999999f999999ffff55d551d5ffffffffffffffffffffffff5d155d55ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99fff9f999fff9f9f9f99fff15555555ffffffffffffffffffffffff55555551f11fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ff9f9999ff9f99999f99fffff55d5515ffffffffffffffffffffffff5155d55ff171ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
99f9999999f99999ff9f9999fffffffffffffffffffffffffffffffffffffffff1771fffffffffffffffffffffffffffddd776ddddddddddffffffffffffffff
9f9999f99f9999f999f99899fffffffffffffffffff9fffffffffffffffffffff17771ffffffffffffffffffffffffffd576dc65d5577655ffffffffffffffff
99ff999999ff99999f9989f9ffffffffffffffff9999fffffffffffffffffffff177771fffffffffffffffffffffffffd76dccc5d576dc65ffffffffffffffff
99999f9999999f9999f88899f9ffff9ff9ffff9ff9f99ffffffffffffffffffff17711ffffffffffffffffffffffffffd66d11c5d76dccc5ffffffffffffffff
fff99999fff9999999998f99ff99f999ff99f9999f9fffffffffffffffffffffff11ffffffffffffffffffffffffffffd66d01c5d66d11c5ffffffffffffffff
99999f9999999f99fff89999999f99f9999f99f99999ffffffffffffffffffffffffffffffffffffffffffffffffffffd66d0c55d66d01c5ffffffffffffffff
99fff9f999fff9f999999f999f99f99f9f99f99ff9f99fffffffffffffffffffffffffffffffffffffffffffffffffffd56dd555d66d0c55ffffffffffffffff
ff9f9999ff9f999999fff9f9f99f99f9f99f99f99f99ffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d56dd555ffffffffffffffff
99f9999999f9999999f9999999f999999f99f9f9ffffffffffffffffff8dd8fffffffffff28882ffffffffffffffffffddddd776ddddddddffffffffffffffff
9f9999f99f9999f99f9999f99f9999f9f99f99f9fffffffffffffffff8d66d8fffffffff2828282fffffffffffffffffd55576dc65555555ffffffffffffffff
99ff999999ff999999ff999999ff99999f99f99ffffffffffffffffff8d66d8fffffffff2868682fffffffffffffffffd5576dccc5558055ffffffffffffffff
99999f9999999f9999999f9999999f99999f9999fffffffffffffffff8d66d8fffffffff2262622fffffffffffffffffd5566d11c5522055ffffffffffffffff
fff99999fff99999fff99999fff99999f9ffff9ffffffffffffffffff856658fffffffff2808082fffffffffffffffffd5566d01c5555055ffffffffffffffff
99999f9999999f9999999f9999999f99fffffffffffffffffffffffff886688fffffffff2888882fffffffffffffffffd5566d0cd5555055ffffffffffffffff
99fff9f999fff9f999fff9f999fff9f9fffffffffffffffffffffffff220022fffffffff00fff00fffffffffffffffffd5556dd5d5555555ffffffffffffffff
ff9f9999ff9f9999ff9f9999ff9f9999fffffffffffffffffffffffff00ff00fffffffffffffffffffffffffffffffffd5555555d5555555ffffffffffffffff
99f999999f99f9f99f99f9f9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d5f5d555d5fffffffffffffffffffffffff
9f9999f9f99f99f9f99f99f9fffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffd5155551d5155551ffffffffffffffffffffffff
99ff99999f99f99f9f99f99fffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffff155d55d5155d55d5ffffffffffffffffffffffff
99999f99999f9999999f9999fffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffff55d5155555d51555ffffffffffffffffffffffff
fff99999f9ffff9ff9ffff9ffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffff5555d55d5555d55dffffffffffffffffffffffff
99999f99ffffffffffffffffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffff5d155d555d155d55ffffffffffffffffffffffff
99fff9f9ffffffffffffffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffff5555555155555551ffffffffffffffffffffffff
ff9f9999fffffffffffffffffffffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffff5155d55f5155d55fffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffff5666666ffffffffddddddddddd666ddddddddddffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff77ffffff77ffffffffffffffffffff0288dd2ffffffffd5555555d5766665d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ff7fff79ff7fffffffffffffffffff28d66dffffffffd5556555d5766665d5888885ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff79f779ff79f779ffffffffffffffffff066666dffffffffd5576655d5677725d5555555ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff799fffff799ffffffffffffffffffff28d66dffffffffd55d7d55d566dd25d5522255ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff799fffff799ffffffffffffffffffff0288dd2ffffffffd55ddd55d566dd25d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ffffff79fffffffffffffffffffff5666666ffffffffd555d555d556dd55d5552555ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff7fffffff7ffffffffffffffffffffffffffffffffffffffd5555555d5555555d5522255ffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d5ddd666ddddddddddddddddddfffffffffff22fffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffff1555515dd5766665d5555555d5522255ffffffffff2882ffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffff5d55d551d5766665d5556555d5552555fffffffff522225fffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffff55515d55d5677725d5576655d5555555fffffffff028820fffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffd55d5555d566dd25d55d7d55d5522255ffffffffff2882ffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffff55d551d5d566dd25d55ddd55d5555555fffffffff522225fffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffff15555555d556dd55d555d555d5888885fffffffff002200fffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7fffffffffffffffffffffffffffffff55d5515d5555555d5555555d5555555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddd66dddddddd6fffdffffffffffffffffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffffffffffffd555555576665555551ffff1ffffffffffffffffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffffffffffffd555555576665805555f4441ffffffffffffffffffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffffffffffffd5555555177d22055d5ffff1ffffffffffffffffffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffffffffffd5555555d1d55505555f1011ffffffffffffffffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffffffffffffd55555556555550515df1001ffffffffffffffffffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffffffffffffd5555555d6d6d55555551005ffffffffffffffffffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7ffffffffffffffffffffffffffffffffffffffd5555555d6d6d555d55d5555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddd55d555d5ffffffffffffffffffffffffffffffff
fffffffffff77ffffff77ffffff77ffffff77fffffffffffffffffffffffffffffffffffffffffffd555555515555155ffffffffffffffffffffffffffffffff
ffffffffff79ff7fff79ff7fff79ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffd555555a5d55d555ffffffffffffffffffffffffffffffff
fffffffff79f779ff79f779ff79f779ff79f779fffffffffffffffffffffffffffffffffffffffffd5aaa99a55515d5dffffffffffffffffffffffffffffffff
fffffffffff799fffff799fffff799fffff799ffffffffffffffffffffffffffffffffffffffffffd5aaa55ad5555555ffffffffffffffffffffffffffffffff
ffffffffff799fffff799fffff799fffff799fffffffffffffffffffffffffffffffffffffffffffd5a1199a55d51555ffffffffffffffffffffffffffffffff
ffffffffff79ffffff79ffffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffd544445a15555515ffffffffffffffffffffffffffffffff
fffffffff7fffffff7fffffff7fffffff7ffffffffffffffffffffffffffffffffffffffffffffffd5151515555d5555ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddddddffffffffffffffffffffffff
fffffffffff77ffffff77ffffffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555dfffd5f5dfffd5fffffffff
ffffffffff79ff7fff79ff7fffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffd5555555d5555555d5155551d5155551ffffffff
fffffffff79f779ff79f779ffffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffffd5555555d5555555155d55d5155d55d5ffffffff
fffffffffff799fffff799fffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d555555555d5155555d51555ffffffff
ffffffffff799fffff799fffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555555d55d5555d55dffffffff
ffffffffff79ffffff79ffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555d155d555d155d55ffffffff
fffffffff7fffffff7fffffffffffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffd5555555d55555555555555155555551ffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d555d51d515555ffffffff
fffffffffffffffffffffffffffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1555515d5155d55dffffffff
ffffffffffffffffffffffffffffffffff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5d55d551555d5155ffffffff
fffffffffffffffffffffffffffffffff79f779fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55515d55d5555d55ffffffff
fffffffffffffffffffffffffffffffffff799ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd55d555555d155d5ffffffff
ffffffffffffffffffffffffffffffffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d551d515555555ffffffff
ffffffffffffffffffffffffffffffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff15555555f51ffd5fffffffff
fffffffffffffffffffffffffffffffff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff55d5515ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff77ffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff79f779ff79f779fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffff799fffff799ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff799fffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff7fffffff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff77ffffff77ffffff77fff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7fff79ff7f
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79f779ff79f779ff79f779f
ff000000000000fffffff0000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799ff
f0088088808080000ffff0880088008080ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fff
f0800080808080080ffff0080008000080ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffffff79ffff
f080f088808080000fffff080f08000800fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7fffffff7fffffff7ffffff
f0800080008080080ffff0080008008000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
f0088080f00880000ff770888088808080f77ffffff77ffffffffffffffffffffffffffffffffffffffffffffff77ffffff77ffffff77ffffff77ffffff77fff
f0000000000000ffff79f000000000000079ff7fff79ff7fffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7fff79ff7fff79ff7fff79ff7f
f088808880888000079f70888080809ff79f779ff79f779ffffffffffffffffffffffffffffffffffffffffff79f779ff79f779ff79f779ff79f779ff79f779f
f0888080008880080ff79000800080fffff799fffff799fffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fffff799fffff799ff
f0808088008080000f799088800800ffff799fffff799fffffffffffffffffffffffffffffffffffffffffffff799fffff799fffff799fffff799fffff799fff
f0808080008080080f79f080008000ffff79ffffff79ffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffffff79ffffff79ffffff79ffff
f08080888080800007fff088808080fff7fffffff7fffffffffffffffffffffffffffffffffffffffffffffff7fffffff7fffffff7fffffff7fffffff7ffffff
f0000000000000fffffff000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
f0888088800880000ff77080f08880fffff77ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff77ffffff77fff
f0800080808000080f79f0800080807fff79ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ff7fff79ff7f
f088008880888000079f70888080809ff79f779ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79f779ff79f779f
f0800080000080080ff79080808080fffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799ff
f080f080f08800000f799088808880ffff799fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff799fffff799fff
f000f000f0000fffff79f000000000ffff79ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff79ffffff79ffff
fffffffff7fffffff7fffffff7fffffff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7fffffff7ffffff

__gff__
0000020202020400000000000000000000000200010000010101010101010101010101010000000000000101010000000001010101010000000000010000000001010101010102010101010101010100010101010101020101010101010101010101010101010101000000000000000001010101010101010000000000000000
0000000000000000000001010000000000000000000000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000151515
0000000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1212000000000000001616160000003300000000000007080900000000000000000000000000000000001212121212120000000000000000000003030300000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
12121200000000161616163e4b00000000000000000708080809000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616001414000000000007080808080809000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212120000003216004d004214000000000708080808080b00000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000002040000070a0a0c080808080b0000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000441414040000000b08080808080b000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016350014141400310000000065050500000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000601140000000002050303030000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001600000014140500000003031718190300000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0012120012001616006003136205050006031d1e1b190000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000120000160006060000020600000217191b1c0000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001212000000000000000049000000061d1e1e1f00000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000341616000000000000000206060000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000016000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000121212120000000000001212121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012121212000016000000000000121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000002050400000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000205050503030400000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000217181819030303000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000310005031d1b1b1b181819040000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000020303031d1b1b1b1b1c030400000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000060303031a1b1b1f030606060000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000002031d1b1f03060000000606000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000060603030303000000000000060000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000606000000000000060000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1500000000000000000000000000000000000000000000000006060600000000000000000000000000000000000000000000000000000000000000000000001500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1515150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
01 08090a0b
00 080c0a0b
00 080c0a0b
00 0d0e0f0b
00 0d0e0f0b
00 10111213
00 10111213
00 10141213
00 10151213
00 16171819
00 101a1b13
00 101c1b13
00 100c0a13
00 1e0f0e13
00 16171819
00 1f0c0a13
00 16171819
02 08090a0b

