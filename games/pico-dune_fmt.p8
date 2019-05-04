pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true
b=false
c,d=0,0
e,f=0,0
g,h=0,0
i=nil
j=2335
count=0
k={}
l={}
m={}
n={}
n.o=function(self)
printh("hello building!!!")
printh("hello "..self.p)
end
q=
[[1|cONSTRUCTION yARD|64|128|2|2|2|nil|nil|nil|1||100|nil||400|||aLL STRUCTURES ARE BUILT BY THE CONSTRUCTION YARD.||
2|wINDTRAP|66|130|2|2|2|nil|1|1|1||300|100||200|||tHE WINDTRAP SUPPLIES POWER TO YOUR BASE. wITHOUT POWER YOUR STRUCTURES WILL DECAY.|draw_windtrap|update_bld
3|sMALL cONCRETE sLAB|||2|1|1|nil|1|1|1||5|nil||0|||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||
4|lARGE cONCRETE sLAB|||2|2|2|nil|1|1|4||20|nil||0|||uSE CONCRETE TO MAKE A STURDY FOUNDATION FOR YOUR STRUCTURES.||
5|dEFENSIVE wALL|||2|1|1|nil|1|7|4||50|nil||50|||tHE wALL IS USED FOR PASSIVE DEFENSE.||
6|sPICE rEFINERY|68|132|2|3|2|nil|1|2|1||400|30||450|||tHE rEFINERY CONVERTS SPICE INTO CREDITS.||
7|rADAR oUTPOST|||2|2|2|nil|1|2|2||400|30||500|||tHE oUTPOST PROVIDES RADAR AND AIDS CONTROL OF DISTANT VEHICLES.||
8|sPICE sTORAGE sILO|||2|2|2|nil|1|6|2||150|5||150|||tHE sPICE SILO IS USED TO STORE REFINED SPICE.||
9|bARRACKS|||2|2|2|nil|1|7|2||300|10||300|||tHE bARRACKS IS USED TO TRAIN YOUR lIGHT INFANTRY.||
10|wor tROOPER fACILITY|||2|2|2|nil|1|7|2||400|10||400|||wor IS USED TO TRAIN YOUR hEAVY INFANTRY.||
11|lIGHT vEHICLE fACTORY|||2|2|2|nil|1|6|2||400|20||350|||tHE lIGHT fACTORY PRODUCES LIGHT ATTACK VEHICLES.||
12|hEAVY vEHICLE fACTORY|||2|3|2|nil|1|6|3||600|20||200|||tHE hEAVY fACTORY PRODUCES HEAVY ATTACK VEHICLES.||
13|hI-tECH fACTORY|||2|3|2|nil|1|7+12|5||500|35||400|||tHE hI-tECH fACTORY PRODUCES FLYING VEHICLES.||
14|cANNON tURRET|||2|1|1|nil|1|7|5||125|10||200|||tHE cANNON tURRET IS USED FOR SHORT RANGE ACTIVE DEFENSE.||
15|rOCKET tURRET|||2|1|1|nil|1|7|6||250|20||200|||tHE rOCKET/cANNON TURRET IS USED FOR BOTH SHORT AND MEDIUM RANGE ACTIVE DEFENSE.||
16|rEPAIR fACILITY|||2|3|2|nil|1|7+12|5||700|20||200|||tHE rEPAIR fACILITY IS USED TO REPAIR YOUR VEHICLES.||
17|sTARPORT|||2|3|3|nil|1|6|6||500|50||500|||tHE sTARPORT IS USED TO ORDER AND RECEIVED SHIPMENTS FROM c.h.o.a.m.||
18|hOUSE OF ix|||2|2|2|nil|1|7+12|5||500|40||400|||tHE ix rESEARCH fACILITY ADVANCES YOUR hOUSE'S TECHNOLOGY.||
19|pALACE|||2|3|3|nil|1|17|8||999|80||1000|||tHIS IS YOUR pALACE.||]]..
[[20|lIGHT iNFANTRY (X3)|||1|1|1||9|9|2|AO|60||4|50|5|2|iNFANTRY ARE LIGHTLY ARMOURED FOOTSOLDIERS, WITH LIMITED FIRING RANGE AND SPEED.||
21|hEAVY tROOPERS (X3)|||1|1|1||10|9|3|HO|100||8|110|10|3|tROOPERS ARE HEAVILY ARMOURED FOOTSOLDIERS, WITH IMPROVED FIRING RANGE AND SPEED.||
22|tRIKE|||1|1|1||11+17||2||150||8|100|60|3|tHE tRIKE IS A LIGHTLY-ARMOURED, 3-WHEELED VEHICLE, WITH LIMITED FIRING RANGE, BUT RAPID SPEED.||
23|qUAD|||1|1|1||11+17||3||200||10|130|50|3|tHE qUAD IS A LIGHTLY-ARMOURED, 4-WHEELED VEHICLE. sLOWER THAN THE tRIKE, BUT STRONGER ARMOUR AND FIREPOWER.||
24|cOMBAT tANK|||1|1|1||12+17|7|4||300||38|200|25|4|tHE cOMBAT tANK IS A MEDIUM ARMOURED TANK, FIRES HIGH-EXPLOSIVE ROUNDS.||
25|sIEGE tANK|||1|1|1||12+17|7|6||600||45|300|20|5|tHE mISSILE tANK IS A MEDIUM ARMOURED TANK, WHICH FIRES MISSILES. lONG-RANGE, BUT INACCURATE.||
26|rOCKET lAUNCHER|||1|1|1||12+17|7|5||450||112|100|30|9|tHE sIEGE tANK IS A HEAVY ARMOURED TANK, WHICH HAS DUAL CANNONS, BUT IS SLOW.||
27|hARVESTER|||1|1|1||12+17||2||300||0|150|30|nil|tHE hARVESTER SEPARATES SPICE FROM THE SAND & RETURNS RAW SPICE TO THE rEFINERY FOR PROCESSING.||
28|cARRYALL|||1|1|1||13|13|5||800||0|100|200|nil|tHE cARRYALL IS A LIGHTLY ARMOURED AIRCRAFT WITH NO WEAPONS. mAINLY USED TO LIFT+TRANSPORT hARVESTERS.||
29|oRNITHOPTER|||1|1|1||13+17|13|7|AO|600||75|5|150|5|tHE oRNITHOPTER IS A LIGHTLY ARMOURED AIRCRAFT THAT FIRES ROCKETS. hIGHLY MANOUVERABLE + FASTED AIRCRAFT ON dUNE.||
30|mcv (mOBILE CONSTRUCTION VEHICLE)|||1|2|1||12+17|7|4||900||0|150|0|nil|tHE mcv SCOUT VEHICLE IS USED TO FIND AND DEPLOY NEW BASE LOCATIONS.||
31|sONIC tANK|||1|1|1||12|7|7|A|600||90|110|30|8|dEVELOPED BY THE aTREIDES, THIS ENHANCED TANK FIRES POWERFUL BLAST WAVES OF SONIC ENERGY.||
32|fREMEN (X3)|||1|1|1||19||8|A|0||8|220|10|3|tHE fREMEN ARE NATIVE TO dUNE. eLITE FIGHTERS, IN ALLIANCE WITH THE aTREIDES.||
33|dEVASTATOR|||1|1|1||12|13|8|H|800||60|400|10|7|tHE dEVESTATOR IS A hARKENNEN-DEVELOPED NUCKEAR-POWERED TANK, WHICH FIRES DUAL PLASMA CHARGES. mOST POWERFUL TANK ON dUNE, BUT POTENTIALLY UNSTABLE IN COMBAT.||
34|dEATH hAND|||1|1|1||19||8|H|0||150|70|250|nil|tHE dEATH hAND IS A SPECIAL hARKONNEN pALACE WEAPON. aN INACCURATE, BUT VERY DESTRUCTIVE BALLISTIC MISSILE.||
35|rAIDER|||1|1|1||11||2|O|150||8|80|75|3|tHE oRDOS rAIDER IS SIMILAR TO THE STANDARD tRIKE, BUT WITH LESS ARMOUR IN FAVOUR OF SPEED.||
36|dEVIATOR|||1|1|1||12|13|7|O|750||0|120|30|7|tHE oRDOS dEVIATOR IS A STANDARD mISSILE tANK, WHICH FIRES UNIQUE NERVE GAS MISSILES THAT MAY TEMPORARILY CHANGE ENEMY LOYALTY.||
37|sABOTEUR|||1|1|1||19||8|O|0||150|40|40|2|tHE sABOTEUR IS A SPECIAL MILITARY UNIT, TRAINED AT AN oRDOS pALACE. cAN DESTRY ALMOST ANY STRUCTURE OR VEHICLE.||]]..
[[38|sARDAUKAR|||1|1|1||nil|nil|4||0||5|110|10|1|tHE sARDULAR ARE THE eMPEROR'S ELITE TROOPS. WITH SUPERIOR FIREPOWER AND ARMOUR.||
39|sANDWORM|||1|1|1||nil|nil|3||0||300|1000|35|0|tHE sAND wORMS ARE INDIGEONOUS TO dUNE. aTTRACTED BY VIBRATIONS, ALMOST IMPOSSIBLE TO DESTROY, WILL CONSUME ANYTHING THAT MOVES.||]]
function _init()
r()
poke(0x5f2d,1)
cartdata("pn_picodune")
s=1
u()
v=0
cursor=w(0,0,0)
cursor.x=function(self)
return{
y=self.y+(not z and c or 0)+2,
ba=self.ba+(not z and d or 0)+1,
bb=1,
bc=1
}
end
cursor.bd=function(self)
spr((i and(i.type==1)) and 1 or self.spr,
self.y,self.ba,self.bb/8,self.bc/8)
end
local be=w(12*8,4*8,2,66,nil,2,2)
be.bf=50
be.bg=w(109,20,2,130,nil,2,2,be,function(self)
printh("todo: fix windfarm?...")
end)
be.bh={
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
be.bi=10
add(m,be)
bj(be)
local bk=w(9*8,7*8,2,68,nil,3,2)
bk.bf=10
bk.bg=w(109,20,2,132,nil,2,2,bk,function(self)
printh("todo: fix refinary?...")
end)
add(m,bk)
bj(bk)
local bl=w(10*8,9*8,2,bm[1][3],nil,2,2)
bl.bf=75
bl.bg=w(109,20,2,128,nil,2,2,bl,function(self)
printh("todo: load construction yard menu...")
end)
bl.bn=w(109,44,2,162,nil,2,2,nil,function(self)
printh("todo: build slab...")
self.bo=0.5
self.bp=cocreate(function(self)
while self.bf<100 do
self.bf+=self.bo
j-=.1
yield()
end
end)
end)
add(m,bl)
bj(bl)
local bq=w(5*8,3*8,1,50,11)
bq.br=0
bq.bg=w(109,20,2,198,nil,2,2,bq,nil)
bq.bf=100
add(k,bq)
bj(bq)
bq=w(7*8,9*8,1,51,11)
bq.br=0.25
bq.bg=w(109,20,2,196,nil,2,2,bq,nil)
bq.bf=100
add(k,bq)
bj(bq)
bq=w(14*8,6*8,1,49,11)
bq.bg=w(109,20,2,192,nil,2,2,bq,nil)
bq.br=0.75
bq.bs=.25
bq.bf=100
add(k,bq)
bj(bq)
bq=w(9*8,3*8,1,62,11)
bq.bg=w(109,20,2,194,nil,2,2,bq,nil)
bq.bt=63
bq.bi=10
bq.bs=.15
bq.bu=true
bq.bf=100
add(k,bq)
bj(bq)
c=15
end
function bj(bv)
local bw=bv.type==2 and 3 or 2
for bx=-bw,bw do
for by=-bw,bw do
local bz=flr(bv.y/8)+bx
local ca=flr(bv.ba/8)+by
cb[bz][ca]=16
cc(bz,ca)
for ce=-1,1 do
for cf=-1,1 do
cc(bz+cf,ca+ce)
end
end
end
end
end
function _update60()
cg()
if(t()%1==0) ch()
end
function _draw()
ci()
cj()
if(a) ck("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function u()
cb={}
for cl=-2,66 do
cb[cl]={}
for cm=-2,66 do
cb[cl][cm]=0
end
end
end
function cn()
local co=flr(c/8)
local cp=flr(d/8)
for bx=co-1,co+16 do
for by=cp-1,cp+16 do
if cb[bx][by]!=0 and cb[bx][by]!=16 then
spr(cb[bx][by]+31,bx*8,by*8)
elseif cb[bx][by]<16 then
rectfill(bx*8,by*8,bx*8+7,by*8+7,0)
end
end
end
end
function cc(y,ba)
if(y<0 or y>#cb or ba<0 or ba>#cb) return
local cq=0
if cb[y][ba]!=0 then
if(cb[y][ba-1]>0) cq+=1
if(cb[y-1][ba]>0) cq+=2
if(cb[y+1][ba]>0) cq+=4
if(cb[y][ba+1]>0) cq+=8
cb[y][ba]=1+cq
end
end
function ch()
l={}
for cr,bq in pairs(k) do
l[flr(bq.y/8)..","..flr(bq.ba/8)]=1
end
end
function cg()
cs=stat(32)
ct=stat(33)
cu=stat(34)
cv=(cu>0 and cw!=cu) or btnp(4)
for cx=0,1 do
if(btn(cx)) g+=cx*2-1
if(btn(cx+2)) h+=cx*2-1
end
e=mid(0,cs+g,127)
f=mid(0,ct+h,127)
cursor.y=e
cursor.ba=f
if(e<8) c-=2
if(e>119) c+=2
if(f<8) d-=2
if(f>119) d+=2
c=mid(c,384)
d=mid(d,384)
cy()
cz()
v+=1
cw=cu
da=i
end
function db(bq,y,ba)
bq.dc="init"
if fget(mget(y,ba),0)
or l[y..","..ba] then
printh("aborting pathfinding - invalid target")
return
end
bq.dd=y
bq.de=ba
bq.df=bq.dg
bq.dg=1
bq.bp=cocreate(dh)
end
function cy()
for cr,bq in pairs(k) do
di(bq)
end
for cr,dj in pairs(m) do
di(dj)
di(dj.bn)
end
end
function di(dk)
if dk then
if dk.bp and costatus(dk.bp)!='dead'then
dl(coresume(dk.bp,dk))
else
dk.bp=nil
end
end
end
function ci()
cls"15"
camera(c,d)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
if dc!=nil and dc!="init"then
spr(144,dc[1].y*8,dc[1].ba*8)
end
for cr,dj in pairs(m) do
dj:dm()
dj:bd()
if(dj==i) then
rect(i.y,i.ba,
i.y+i.bb-1,i.ba+i.bc-1,
7)
end
end
palt(11,true)
for cr,bq in pairs(k) do
bq:dm()
bq:bd()
if(bq==i) then
spr(16,i.y,i.ba)
end
end
cn()
end
function cj()
camera(0,0)
pal()
palt(0,false)
if i and i.bg then
i.bg:bd(109,20,true)
if i.bn then
i.bn:bd(109,44,true)
end
end
ck("00"..flr(j),103,2,7)
if i
and i.bn
and i.bn.bf>=100 then
rectfill(flr(cursor.y/8)*8,flr(cursor.ba/8)*8,
(flr(cursor.y/8)+2)*8,(flr(cursor.ba/8)+2)*8,11)
end
palt(11,true)
cursor:bd()
end
function cz()
dn=false
foreach(k,dp)
foreach(m,dp)
if i then
z=true
if(i.bg) dp(i.bg)
if(i.bn) dp(i.bn)
z=false
end
if cv then
if dn then
if(i.dq) i:dq() i=da
else
if i and i.type==1 then
db(i,flr((c+e)/8),flr((d+f)/8))
end
if i
and i.bn
and i.bn.bf>=100 then
local dr=flr((cursor.y+c)/8)
local ds=flr((cursor.ba+d)/8)
mset(dr,ds,19)
mset(dr+1,ds,19)
mset(dr,ds+1,19)
mset(dr+1,ds+1,19)
i.bn.bf=0
end
i=nil
end
end
end
function dp(dk)
dk.dt=du(cursor,dk)
if cv and dk.dt then
i=dk
dn=true
end
end
function dv(dw,dx)
end
function dy(self,dz)
if(dz==self.ea) return
local eb=self.ec[dz]
self.ed=eb.v
self.ea=dz
self.ee=1
end
function ef(self)
self.ed-=1
if self.ed<=0 then
self.ee+=1
local eb=self.ec[self.ea]
self.ed=eb.v
if self.ee>#eb.eg then
self.ee=1
end
self.spr=eb.eg[self.ee]
end
end
function ck(eh,ei,
ej,ek,
el)
for bx=-1,1 do
for by=-1,1 do
print(eh,ei+bx,ej+by,el)
end
end
print(eh,ei,ej,ek)
end
function w(y,ba,type,em,en,bb,bc,eo,dq)
return{
y=y,
ba=ba,
ep=1,
type=type,
bb=(bb or 1)*8,
bc=(bc or 1)*8,
eo=eo,
spr=em,
eq=em,
en=en,
dq=dq,
er=false,
es=bb or 1,
et=bc or 1,
bf=0,
eu=0,
bi=0,
ev=1,
dg=1,
x=function(self)
return{
y=self.y,
ba=self.ba,
bb=self.bb-1,
bc=self.bc-1
}
end,
bd=function(self,y,ba,ew)
pal()
palt(0,false)
if(self.en) palt(self.en,true)
if self.bh then
pal(self.bh[self.ev][1],
self.bh[self.ev][2])
end
if self.br then
ex(self.spr%16*8,flr(self.spr/16)*8,self.y,self.ba,.25-self.br,1,11)
else
if ew then
rectfill(y-1,ba-1,y+16,ba+19,0)
local ey=self.eo or self
local ek=ey.bo and 12 or(ey.bf<33 and 8 or ey.bf<66 and 10 or 11)
if(ey.bf>0) rectfill(y,ba+17,y+(15*ey.bf/100),ba+18,ek)
end
spr(self.spr,self.y or y,self.ba or ba,self.bb/8,self.bc/8)
end
if(b) ez(self)
end,
dm=function(self)
self.eu+=1
if(self.eu>self.bi) then
self.eu=0
if self.bt
and self.dg==2 then
self.spr=self.eq+(self.bt-self.spr)
end
if self.bh then
self.ev+=1
if(self.ev>#self.bh) self.ev=1
end
end
end
}
end
function du(dw,dx)
local fa=dw:x()
local fb=dx:x()
if fa.y<fb.y+fb.bb and
fa.y+fa.bb>fb.y and
fa.ba<fb.ba+fb.bc and
fa.ba+fa.bc>fb.ba
then
return true
else
return false
end
end
function ez(dk)
local fc=dk:x()
rect(fc.y,fc.ba,fc.y+fc.bb,fc.ba+fc.bc,dk.dt and 11 or 8)
end
function fd()
return flr(t())%2==0
end
function r()
bm=fe(q,"|","\n")
printh("------------------")
printh("test 1:"..#bm)
printh("test 4:"..bm[1][1])
printh("test 5:"..bm[2][1])
printh("test 5.1:"..bm[2][11])
ff={
p="test obj",
bd=n[bm[2][20]]
}
ff:bd()
end
function fe(eh,fg,fh)
local eb={}
local fi=0
local fj=''
local fk=''
if fh~=nil then eh=fe(eh,fh) end
while#eh>0 do
if type(eh)=='table'then
fj=eh[1]
add(eb,fe(fj,fg))
del(eh,fj)
else
fj=sub(eh,1,1)
eh=sub(eh,2)
if fj==fg then
add(eb,fk)
fk=''
else
fk=fk..fj
end
end
end
add(eb,fk)
return eb
end
local fl=0
function ex(fm,fn,y,ba,eb,bb,fo)
local fp,fq=cos(eb),sin(eb)
local fr,fs,ft,fu
local fv,fw=fp,fq
local cq=shl(0xfff8,(bb-1))
bb*=4
fp*=bb-0.5
fq*=bb-0.5
local fx,fy=fq-fp+bb,-fp-fq+bb
bb=2*bb-1
for fz=0,bb do
fr,fs=fx,fy
for ga=0,bb do
if band(bor(fr,fs),cq)==0 then
local fi=sget(fm+fr,fn+fs)
if(fi!=fo) pset(y+fz,ba+ga,fi)
end
fr-=fw
fs+=fv
end
fx+=fv
fy+=fw
end
end
function dh(bq)
bq.dc=gb(
{y=flr(bq.y/8),ba=flr(bq.ba/8)},
{y=bq.dd,ba=bq.de},
gc,
gd,
ge,
function(gf) return shl(gf.ba,8)+gf.y end,
nil)
bq.df=bq.dg
bq.dg=2
bq.bp=cocreate(gg)
end
function gg(bq)
printh("-------------")
bq.dg=2
for cl=#bq.dc-1,1,-1 do
local gf=bq.dc[cl]
if not bq.bu then
local cf=bq.y-(gf.y*8)
local ce=bq.ba-(gf.ba*8)
local eb=atan2(cf,ce)
printh("  >> target angle="..eb)
while(bq.br!=eb) do
gh(bq,eb)
end
end
local gi=bq.bs or .5
local gj=sqrt((gf.y*8-bq.y)^2+(gf.ba*8-bq.ba)^2)
local gk=gi*(gf.y*8-bq.y)/gj
local gl=gi*(gf.ba*8-bq.ba)/gj
for cl=0,gj/gi-1 do
bq.y+=gk
bq.ba+=gl
yield()
end
bq.y,bq.ba=gf.y*8,gf.ba*8
bj(bq)
end
bq.dg=1
end
gm=3.14159
gn=.5*(gm/180)
function gh(bq,go)
gp=go-bq.br
printh("unit.r="..bq.br)
printh("targetangle="..go)
printh("diff="..gp)
printh("turnspeed="..gn)
printh("-")
if gp>0.5 then
printh("big angle 1")
gp-=1
elseif gp<-0.5 then
printh("big angle 2")
gp+=1
end
if gp>gn then
bq.br+=gn
elseif gp<-gn then
bq.br-=gn
else
bq.br=go
end
if(bq.br>gm) bq.br-=2*gm
if(bq.br<-gm) bq.br+=2*gm
yield()
end
function gd(gq,gf,gr)
local gs=fget(mget(gf.y,gf.ba),1) and 4 or 1
if(gq.y!=gf.y and gq.ba!=gf.ba) return gs+1
return gs
end
function ge(gf,gr)
local gt={}
for bx=-1,1 do
for by=-1,1 do
if(bx!=0 or by!=0) gu(gf.y+bx,gf.ba+by,gt)
end
end return gt
end
function gu(gv,gw,gx)
printh("testing:"..gv..","..gw)
if(
not fget(mget(gv,gw),0)
and l[gv..","..gw]==nil
)
then
add(gx,{y=gv,ba=gw})
end
printh("test passed.")
end
function gc(eb,gy)
return abs(eb.y-gy.y)+abs(eb.ba-gy.ba)
end
function gb
(gz,
ha,
hb,
hc,
gt,
hd,
gr)
local he,
hf={
hg=gz,
hh=0,
hi=hb(gz,ha,gr)
},{}
hf[hd(gz,gr)]=he
local hj,hk,hl,hm={he},1,hd(ha,gr),32767.99
while hk>0 do
local hn,ho=hm
for cl=1,hk do
local hp=hj[cl].hh+hj[cl].hi
if(hp<=hn) ho,hn=cl,hp
end
he=hj[ho]
hj[ho],he.hq=hj[hk],true
hk-=1
local hr=he.hg
if hd(hr,gr)==hl then
hr={ha}
while he.hs do
he=hf[hd(he.hs,gr)]
add(hr,he.hg)
end
return hr
end
for ht in all(gt(hr,gr)) do
local hu=hd(ht,gr)
local hv,hw=
hf[hu],
he.hh+hc(hr,ht,gr)
if not hv then
hv={
hg=ht,
hh=hm,
hi=hb(ht,ha,gr)
}
hk+=1
hj[hk],hf[hu]=hv,hv
end
if not hv.hq and hv.hh>hw then
hv.hh,hv.hs=hw,hr
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
b7bbbb7bffffffffffffffffddddddddddddddddffffffffffffffff55d555d555d555d555d555d555dd444444444444444444d555dd444444444444444444d5
77bbbb77fffffffffff77fffd5555555d5555555f888888ff6ffffff155551551555515515555155155d44444444444444444455155044444444444444444055
bbbbbbbbffffffffff79ff7fd5555555d5015515f8a8888fffffff6f5d55d55555dddd555d55d5555dd4444444444444444444455d5104444444444444444155
bbbbbbbbfffffffff79f779fd5555555d5105555f888888fffffffff555155dddd4444ddddd15d5d55d44444444444444444444d555114444444444444440d5d
bbbbbbbbfffffffffff799ffd5555555d5555111f888888fffffffffd555dd444444444444445555d5d444444444444444444445d55510044444444444401555
bbbbbbbbffffffffff799fffd5555555d1555101f888888ffff6ffff55d5d444444444444444455555d44444444444444444444555d515100044444000015555
77bbbb77ffffffffff79ffffd5555555d5555111f888888fffffffff155d44444444444444444415155d44444444444444444415155555151100000111155515
b7bbbb7bfffffffff7ffffffd5555555d5515555ffffffffffffffff555d44444444444444444455555d44444444444444444455555d555555111115555d5555
000000000bbbbbb000000000bbbbb1b1000000001b1bbbbb00000000bbbbbbbb0000000001bbbb1010000000bbbbbbb0000000010bbbbbbb00000000ffffffff
001bb1000bbbbbb0bbb1b000bbb1bb000000bbbb00bb1bbb1b1b1b1bbbbbbbbb000000000bbbbbb0b0000000bbbbb1000000000b00bbbbbbb000000bffffffff
01bbbb100bbbbbb0bbbb1b00bb1b0000000b1bbb0001b1bbbbbbbbbbbbbbbbbb00b0b00001bbbb101b000000bbbb1b00000000b1001bbbbbb1b1b1bbffffffff
0bbbbbb00b1b1b10bbb1b000b1b0000000b1bbbb00000b1bbbbbbbbbbbbbbbbb0b1b1b000bbbbbb0bb000000bbbbb100000001bb00b1bbbbbb1b1bbbffffffff
0bbbbbb000b1b1b0bbbb1b00bb000000000b1bbb000001bbbbbbbbbbbbb1b1bb01b1b1b001bbbb10b1b00000bbbb1b0000000b1b001bbbbbbbbbbbbbffffffff
01bbbb10000b0b00bbb1b0001b00000000b1bbbb000000b1bbbbbbbbbb1b1b1b0bbbbbb00bbbbbb0bb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbbffffffff
001bb10000000000bbbb0000b0000000000b1bbb0000000b1b1b1b1bb000000b0bbbbbb001bbbb10bbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbbffffffff
00000000000000000000000010000000000000000000000100000000000000000bbbbbb00bbbbbb0bbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbbffffffff
ffffffffbb2222bbbb8dd8bb62ddd26bb28882bbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb6bbb6bbb6bbb6bb
ffffffffb088880bb8d66d8b6d666d6b2828282bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb8bbb8bbb8bbb8bb
ffffffffb088880bb8d66d8b6d666d6b2868682bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb2bbb2bbb2bbb2bb
ffffffffb288882bb8d66d8b68d6d86b2262622bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb0bbb0bb0b0b0b0b
ffffffffb288882bb856658b6886886b2808082bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb6bbbbbbb6bbbb
ffffffffb028820bb886688b6226226b2888882bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb8bbbbbbb8bbbb
ffffffffb0d22d0bb220022b50b0b05b00bbb00bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb2bbbbbbb2bbbb
ffffffffbb2882bbb00bb00bbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbbb0bbbbbb0b0bbb
d66dddddddd6fffdddd776ddddddddddddddddddddd666dddddddddd0000000000000000000000000000000000000000000000000000000100fff00010fff000
76665555551ffff1d576de65d5577655d5555555d5766665d55555550000000000000000000000000000000000000000000000000000000bb000000bb0000000
76665805555f4441d76deee5d576de65d5556555d5766665d5888885000000000000000000000000000000000000000000000000000000b1b1b1b1bb1b000000
177d22055d5ffff1d66d11e5d76deee5d5576655d5677725d5555555000000000000000000000000000000000000000000000000000001bbbb1b1bbbbb000000
d1d55505555f1011d66d01e5d66d11e5d55d7d55d566dd25d552225500000000000000000000000000000000000000000000000000000b1bbbbbbbbbb1b00000
6555550515df1001d66d0e55d66d01e5d55ddd55d566dd25d55555550000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbb1b0000
d6d6d55555551005d56dd555d66d0e55d555d555d556dd55d555255500000000000000000000000000000000000000000000000000bb1bbbbbbbbbbbbbb1bb00
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d55222550000000000000000000000000000000000000000000000001b1bbbbbbbbbbbbbbbbbb1b1
dddddddd55d555d5ddddd776ddddddddddd666dddddddddddddddddd0000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbb0
d555555515555155d55576de65555555d5766665d5555555d552225500000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbb100
d555555a5d55d555d5576deee5558055d5766665d5556555d5552555000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbb1b00
d5aaa99a55515d5dd5566d11e5522055d5677725d5576655d555555500000000000000000000000000000000000000000000000000b1bbbbbbbbbbbbbbbbb100
d5aaa55ad5555555d5566d01e5555055d566dd25d55d7d55d5522255000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbb1b00
d5a1199a55d51555d5566d0ed5555055d566dd25d55ddd55d555555500000000000000000000000000000000000000000000000000b1bbbbbbbbbbbbbbbbb100
d544445a15555515d5556dd5d5555555d556dd55d555d555d5888885000000000000000000000000000000000000000000000000001bbbbbbbbbbbbbbbbbbb00
d5151515555d5555d5555555d5555555d5555555d5555555d55555550000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbb0
ffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbbbbbbbb1b1
ffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000bb1bbbbbbbbbbbbbb1bb00
ffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000001b1bbbbbbbbbbbb1b0000
ffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000b1bbbbbbbbbb1b00000
ff77777777ffffffff77757777ffffff000000000000000000000000000000000000000000000000000000000000000000000000000001bbbbb1b1bbbb000000
ff766666666fffffff766657666fffff000000000000000000000000000000000000000000000000000000000000000000000000000000b1bb1b1b1b1b000000
ff7666666666ffffff5555565555ffff0000000000000000000000000000000000000000000000000000000000000000000000000000000bb000000bb0000000
f766666666666ffff777777577777fff000000000000000000000000000000000000000000000000000000000000000000000000000000010000000010000000
f7666666666666fff7666665766666ff000000000000000000000000bbb22bbbbb8dd8bb62ddd26bb28882bb0000000000000000000000000000000000000000
f76666666666666ff76666665766666f000000000000000000000000bb2882bbb8d66d8b6d666d6b2828282b0000000000000000000000000000000000000000
f55555555555555ff55555555555555f000000000000000000000000b522225bb8d66d8b6d666d6b2868682b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b028820bb8d66d8b68d6d86b2262622b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000bb2882bbb856658b6886886b2808082b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b522225bb886688b6226226b2888882b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000b002200bb220022b50b0b05b00bbb00b0000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000bbbbbbbbb00bb00bbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
ccccccccccccc0cccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccdccccc67111dcccccc11116666dc0157d7eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9accc5acccccc55cccc6660dd1dccccc6d1d111166665757eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
575c544aaaccccccccd6650001dccc7776d76d1c11111110eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
5d75144444aaaccc9dddd055d1d996666d1dd11cc5650555eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6deeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7deeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
50d019999999151501755000001d55556d1d4d9949945499eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
501015aaaaaaa44450155ddddddd66996d19999999666666eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
4500545aa744444566666666666666669999999966776767eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
544454444444544466666666555555554999996777777776eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
4554444544544454555555559999f9999944677667767698eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
54445544554545449f9999f9999999f99977777777679887eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
455454554555544599fffffff9f999994777776677988977eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff77777777ffffffff77757777ffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff766666666fffffff766657666fffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ff7666666666ffffff5555565555ffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f766666666666ffff777777577777fffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f7666666666666fff7666665766666ffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f76666666666666ff76666665766666feeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
f55555555555555ff55555555555555feeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccccccccccccccccccccccf7ccccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cccc7755555555ccccccc5f01cccccccccccccccccccccccccccccccccccccccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ccc7675dd55dd5cccccc055ffccccccccccccc4ff75550cccccccccc7776660cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cc7666755566555ccccc0f7557ccccccccccc4ffff7fccccccccc4ffff75550cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
cd66d6755666655ccccc0f7fff7ccccccc54454444444f7ccc45444444444cccffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
c5dd66655555555ccccc0ff000550cccc555fffffffff55cc54fffffffffff5cffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
916666d001110009cccc00df00cccccc95060000000006599504000000000459ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
f90500000444000999999900ff99999999555555555555999955555555555599ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
999999999999999f44999df9dff9f999f99999999999999f9999999999999999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99fffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
99999999999999f999945559455599999ff9999999fff999999999999ff99999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
99999999ffff9999fff999999999999999999999999999ff999fff9999999f99ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
9fffff99999999ff9999999f99999ff999fffff9999f99999f99999999999999ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
eeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffff
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
0000020202020400000000000000000000000200010000010101010101010101010101010000000000000101010000000001010101000000000000000000000001010101010102000000000001010101010101010101020000000000010101010000000000000000000000000101010100000000000000010101010000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015151500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000151515
0000000000000000000000000000000000000000000000000000000000000000000000000000000000121200000000121200000000000000000000000000000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1212000000000000001616161600000000000000000007080900000000000000000000000000000000001212121212120000000000000000000003030300000015000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1212120000000016161616000000000000000000000708080809000000000000000000000000000000000000000012000000000000000000000303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212120000161616000204000000000007080808080809000000000000000000000000000000000000000000000000030303030303030303030303030000000012121212000000000000000000120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121200000000160000000304000000000708080808080b00000000000000000000000000000000000000000000000000000003000000000303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212160000000000000002040000070a0a0c080808080b0000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000120000000000020304000000000b08080808080b000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121212000016000003030400000000000205050000000000001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212000016000614140000000005031719050000000012120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212001600000014140000000003171b1c030000000012000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00121200120016160002031313050500031d1b1f03000000000000000000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200001600060600000206000603030303000000000000000000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001212000000000000000000000000060606060000000000000000000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000001616000000000000000000000000000000000000121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000016000012121200000000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000121212120000000000001212121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
0012121212000016000000000000121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000002050400000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000205050503030400000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000217181819030303000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000005031d1b1b1b181819040000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

