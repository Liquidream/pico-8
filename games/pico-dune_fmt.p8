pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
cartdata("pn_undune2")
a,b,c,d=1,3,8,2
e,f,g,i=1,12,1,2
j={shr(999,16),shr(999,16),shr(9999,16)}
k,l,m,n,o,p,q,r,s,u,v,x,y,ba,bb,bc={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0
bd,be,bf,bg=bb,"",0,{}
k.factory_click=function(self)
bh,bi,bj=1,nil,{}
bk(6,84,"⬆️",function()
bl=mid(1,bl-1,#bm.bn)
bi=bm.bn[bl]
if(bl<bh) bh-=1
end,10)
bk(17,84,"⬇️",function()
local bo=#bm.bn
if(bl<bo) bl=mid(1,bl+1,bo)
bi=bm.bn[bl]
if(bl>bh+2) bh=min(bh+1,bo-2)
end,10)
bk(32,83,"build",function()
bp=nil
bq:func_onclick()
end)
bk(96,83,"close",function()
bp=nil
end)
bp=self
end
k.draw_refinery=function(self)
pal()
pal(11,self.col2)
pal(10,self.col2)
pal(8,self.col2)
if self.br then
pal(self.col_cycle[self.col_cycle_pos],self.col1)
else
pal(11,self.col1)
self.col_cycle_pos=1
end
bs(self)
end
bt=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bm.process==2 and not bm.bu) pal(7,11)
bs(self)
pal()
end
repair_click=function()
bv(bw,2)
end
bx=function(self)
if bw.id!=35 then
by"pick target"
bz=true
else
local ca,cb=bw:cc()
local cd=ce(ca,cb)
if cd>=9 and cd<=15 then
bw.life=0
cf(cg[1],ca*8,cb*8,1)
ch"61"
end
bw=nil
end
end
function bv(self,ci)
self.cj,self.ck,self.process=0,self.process,ci
if(self.life>0 and self.ck>0) self.bu=not self.bu
if(ci==1) self.cl.br=true self.cl.cm=self
end
cg=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1|||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1|||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1|||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1|||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1|||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1|||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1|||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1|||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1|||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1|||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1|||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1|||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1|||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1|||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1|||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1|||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1|||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||448|400|0.3|9|2|112|58|54||||0|0|0|0|0|0|1|1|||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1|||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1|||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||300|20|1|9|2|20||54||41|5|0|0|0|0|0|0|1|1|||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1|||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1|||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1|||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1|||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1|||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||50|480|0.3|7|2|500|58|54||||0|0|0|0|0|0|1|1|||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1|||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|32||1|1|1|1|11|||0|||||1|1|||||||0|4|0||||||1|||0|0|0|0|0|0|1|1|||||||
80|rEPAIR|19||5|1|1|1|11||||||||1|1||||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
81|lAUNCH|1||5|1|1|1|11||||||||1|1||||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
99|worker|0||10|1|1|1||||0|||||||||||||0|99|0|||||||||0|0|0|0|0|0|1|1|||||||]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
local cn=co(cg,"|","\n")
cg={}
for cp=2,46 do
local cq={}
for cr=1,50 do
local cd=cn[cp][cr]
if(cr!=2 and cr<45) cd=tonum(cd)
if cr==46 then
cs,cd=co(cd,"~"),""
for line in all(cs) do
cd=cd.."\n"..line
end
end
cq[cn[1][cr]]=cd
end
cg[tonum(cn[cp][1])]=cq
end
for cp=-2,66 do
bg[cp]={}
for ct=-2,66 do
bg[cp][ct]=0
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
spr((bm and bm.type==1 and bm.owner==1 or bz) and 1,
self.cv,self.cy)
end
}
for cp=1,2 do
for cb=0,31 do
for ca=0,127 do
local db=nil
local dc=mget(ca,cb)
if cp==1 and dc==1 then
dd,de=ca*8,cb*8
cx,cz,db=dd-56,de-56,cg[1]
elseif cp==2
and dc>=32 then
for df,dg in pairs(cg) do
if(dg.obj_spr!=nil and dg.obj_spr==dc) db=dg break
end
end
if db!=nil then
local dh,di=ca,cb
if(dh>63) di+=32 dh-=64
mset(ca,cb,0)
cf(db,dh*8,di*8)
end
end
end
end
dj=cf(cg[99],-8,-8)
dj.dk=cocreate(function()
while true do
if u%30==0 then
n={}
for dl,dm in pairs(m) do
n[dm:dn()]=dl
end
dp={}
if bb then
for cp=0,124,4 do
for ct=0,124,4 do
local ca,cb=cp/2,ct/2
if(cb>=32) ca+=64 cb-=32
local dq=mget(ca,cb)
local dr=sget((dq*8)%128+4,(dq*8)/16)
if(bg[cp/2][ct/2]==16) dp[(cp/2/2)..","..(ct/2/2)]=dr!=11 and dr or 15
end
yield()
end
end
ds,dt,du,dv=0,0,false,{0,0}
if(u%100==0) r={{},{}}
for df,dw in pairs(l) do
if dw.owner==1 or(bb and dx(dw)) then
dp[flr(dw.cv/2/8)..","..flr(dw.cy/2/8)]=dw.col1
end
if dw.owner==1 then
ds-=dw.power
if(dw.id==7) du=true
if(sub(dw.name,1,5)=="sPICE") dt+=1000
end
dv[dw.owner]+=1
r[dw.dy][dw.id]=dw
end
for df,dm in pairs(m) do
if bb and(dm.owner==1 or dx(dm) and dm.z==1) then
dp[flr(dm.cv/2/8)..","..flr(dm.cy/2/8)]=dm.col1
end
if(dm.dy>0) r[dm.dy][dm.id]=dm
end
bb,dz,o=(du and ds>0),2,dp
ea(false)
if(j[3]>0 and j[1]>j[3]) eb=1
if(dv[2]==0 and a>1) eb=2
if(dv[1]==0) eb=3
if eb then
dset(14,eb)
dset(13,t()-s)
dset(10,ec)
dset(24,ed(j[2]))
dset(11,x[1])
dset(25,x[2])
dset(12,v[1])
dset(26,v[2])
rectfill(30,54,104,70,0)
?"mission "..(eb<3 and"complete"or"failed"),36,60,c
flip()
load("pico-dune-main")
end
end
yield()
end
end)
music"7"
ee=0
end
function cf(db,cv,cy,owner,ef)
local eg=eh(db,cv,cy,db.type,nil,k[db.func_init],k[db.func_draw],k[db.func_update],nil)
eg.ei,eg.life=eh(db,109,0,3,eg,nil,nil,k[db.func_onclick]),ej and db.hitpoint/2 or db.hitpoint
eg.owner=eg.owner or owner or ek(cv,cy,dd,de)<75 and 1 or 2
eg.dy,eg.el=owner or eg.owner,{}
for dg in all(cg) do
local em=dg.req_faction
if(dg.parent_id!=nil and(dg.parent_id==eg.id or dg.parent2_id==eg.id))
and(em==nil
or(em>0 and em==b)
or(em<0 and-b!=em))
then
add(eg.el,
eh(dg,109,0,4,eg,nil,nil,function(self)
if bp then
bm=self
else
bv(self,1)
end
end)
)
end
end
if eg.owner==1 then
eg.en,eg.col1,eg.col2=b,c,d
else
eg.en,eg.col1,eg.col2,eg.ei.func_onclick=e,f,g,nil
if(eg.id==19) eo=eg
end
if db.col1 then
eg.col1,eg.col2=db.col1,db.col2
end
if(eg.z>1) eg.owner=0
local ep,eq=flr(cv/8),flr(cy/8)
if db.type==2 then
local er=(db.id==2 or db.id==3)
for es=0,db.w-1 do
for et=0,db.h-1 do
eu(ep+es,eq+et,er and 16 or eg.owner==1 and 149 or 27)
end
end
if(not er) add(l,eg)
if eg.id==6 and eg.cl==nil then
local ev,ew=ex(eg)
cf(cg[32],ev,ew,eg.owner,eg)
end
else
if(eg.norotate!=1) eg.ey=flr(rnd"8")*.125
if eg.arms>0 then
eg.ez=function(self)
self.fa,self.fb,self.fc,self.fd,self.fe=4,self.cv+4,self.cy+4,self.ff.cv+self.ff.w/2,self.ff.cy+self.ff.h/2
local fg,fh=self.fd-self.fb,self.fe-self.fc
local fi=sqrt(fg*fg+fh*fh)
self.fj,self.fk=(fg/fi)*2,(fh/fi)*2
ch(self.fire_sfx)
fl(self)
end
if(eg.id==15 or eg.id==16) eu(ep,eq,149)
else
if(eg.id==32) eg.fm=0 ef=nil
eg.fn=ef
end
add(m,eg)
fo(eg)
end
fl(eg)
return eg
end
function eh(fp,cv,cy,fq,cl,func_init,func_draw,func_onclick)
local fr={
fs=fp,
id=fp.id,
hitpoint=fp.hitpoint,
cv=cv,
cy=cy,
z=fp.z,
ft=cv/8,
fu=cy/8,
type=fq,
cl=cl,
func_onclick=func_onclick,
w=fp.w*8,
h=fp.h*8,
fv=fp.obj_spr,
fw=fp.w,
fx=fp.h,
col_cycle=co(fp.col_cycle),
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
or self.cy>cz+127+self.z)
then
return
end
pal()
palt(0,false)
if(self.trans_col and self.type<=2) palt(self.trans_col,true)
if(self.en and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.col_cycle then
pal(self.col_cycle_src,self.col_cycle[self.col_cycle_pos])
end
if self.ey then
if not self.fy or self.fy>.025 then
for cp=1,2 do
if(cp==2 or self.speed>0) fz(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cv,self.cy-(cp==2 and self.z or 0),.25-self.ey,1,self.trans_col,cp==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
local ga=self.type==4 and self or self.cl
rectfill(self.cv-1,self.cy-1,self.cv+16,self.cy+19,0)
local gb=ga.hitpoint
local cd=self.process==1 and 15*(ga.life/100) or 15*(ga.life/gb)
if(ga.life>0 and not bp) rectfill(self.cv,self.cy+17,self.cv+cd,self.cy+18,self.process==1 and 12 or ga.life<gb*.33 and 8 or ga.life<gb*.66 and 10 or 11)
pal(11,ga.icol1) pal(3,ga.icol2)
end
if self.type>2 then
spr(self.ico_spr,self.cv,self.cy,self.ico_w,self.ico_h)
else
bs(self)
end
end
if self.fb then
if self.fire_type==1 then
pset(self.fb,self.fc,rnd"2"<1 and 8 or 9)
else
local gc=self.fire_type==2
gd(self.fb,self.fc,0,
0,0,
gc and .15 or 2,
-.01,
gc and 20 or 2.5,
self.id==40 and{11} or gc and co("7,7,10,9,8,2,13,6,7") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.life<self.hitpoint*.33 and self.altframe==nil and rnd"10"<1 and self.type<=2) gd(self.cv+3.5,self.cy+3.5,1,.1,-.02,.05,-.002,80,co("10,8,9,6,5"),rnd"2"<1 and 0xa5a5.8 or 0)
self.hit=0
end,
ge=function(self)
local life=self.life
self.flash_count=max(self.flash_count-.4,1)
if self.hit>0 and self.dy>0 then
ea(true)
if(dz==0 or stat(24)>5) dz=1 music"0"
if(self.arms>0 and self.fa==0) gf(self,self.gg)
if(self.obj_spr<=49 and life<100) self.fw,self.fx=0.5,0.5
if(life<50 and self.fa!=7) gh(self,r[self.dy][14] or self.fn)
end
if(self.type<=2 and life<=0 and self.fy==nil) self.fa=5 self.dk=nil self.fy=(self.type==2 and 1 or .5) ch(self.death_sfx) ee+=((self.type==2 or self.id==38) and 0.25 or 0)
if self.fy then
self.fy-=.025
if self.fy<=0 then
if self.type==2 then
for es=0,self.fw-1 do
for et=0,self.fx-1 do
eu(self.cv/8+es,self.cy/8+et,15)
end
end
del(l,self)
v[self.gg.dy]+=1
else
local gi,gj=self:cc()
if(ce(gi,gj)<9) eu(gi,gj,20)
if(self.id<=17) eu(gi,gj,15)
del(m,self)
if self.id==42 then
gk(self,gi,gj,
function(dm,cv,cy)
if(ce(cv,cy)==0) eu(cv,cy,8)
end,
4,true)
end
if(self.gg) x[self.gg.dy]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gl(self.cv+rnd(self.w),self.cy+rnd(self.h))
end
end
if self.framecount!=nil then
self.frame+=1
if self.frame>self.framecount then
self.frame=0
if self.altframe
and self.fa==2 then
self.obj_spr=self.fv+(self.altframe-self.obj_spr)
end
if self.col_cycle then
self.col_cycle_pos+=1
if(self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
end
end
end
if self.fb then
self.fb+=self.fj
self.fc+=self.fk
if ek(
self.fb,self.fc,
self.fd,self.fe)<2
then
gl(self.fb,self.fc,self.fire_type)
local ff=self.ff
if ek(
self.fb,self.fc,
ff.cv+ff.w/2,
ff.cy+ff.h/2)<4
then
ff.life-=self.arms
ff.hit,ff.gg=self.fire_type,self
if self.id==40 and ff.speed!=nil then
ff.owner,ff.en,ff.col1,ff.col2=self.owner,self.en,self.col1,self.col2
fo(self)
elseif ff.gm then
ff.en,ff.col1,ff.col2,ff.gm=ff.gm,ff.gn,ff.go,nil
fo(ff)
end
end
self.fb=nil
end
end
if self.process>0
and not self.bu
and not self.gp then
if self.process==1 and self.spent>self.cost then
self.gp=true
if(self.cl.owner==1) ch"56"by("cONSTRUCTION cOMPLETE")
if self.fs.type==1
and self.parent_id!=1 then
local ev,ew=ex(self.cl)
cf(self.fs,ev,ew,self.cl.owner,self.cl)
gq(self)
end
elseif self.process==2 and life>self.hitpoint then
self.process=0
if self.type==1 and self.speed>0 then
self.gr.col_cycle={0}
self.fa=0
self.cv,self.cy=ex(self)
end
else
if self.cj>(self.process==1 and 3 or 100) then
if(gs(-1,self.process==1 and self.cl or self)) self.cj=0 self.spent+=1
else
self.cj+=1
self.life=(self.process==1 and(self.spent/self.cost)*100 or life+.5)
end
end
end
if self.fire_cooldown>0 then
self.fire_cooldown-=.1
end
if(self.id==5) self.name="wINDTRAP (pOWER:"..ds..")"
end,
gt=function(self,cv,cy)
self.cv,self.cy=cv,cy
end,
dn=function(self)
local cv,cy=self:cc()
return cv..","..cy
end,
cc=function(self)
return flr(self.cv/8),flr(self.cy/8)
end
}
for dl,gu in pairs(fp) do
if fr[dl]==nil and gu!=""then
fr[dl]=gu
end
end
if(func_init) func_init(fr)
return fr
end
function gs(gv,fr)
if(ed(j[fr.owner])+gv<0) return false
j[fr.owner]+=sgn(gv)*shr(abs(gv),16)
if(fr.owner==1) sfx"63"
return true
end
function gl(cv,cy,gw)
gd(cv,cy,2,
0,0,.1,0,gw==1 and 5 or 30,co("5,7,10,8,9,2"),rnd"2"<1 and 0xa5a5.8 or 0)
end
function fl(gx)
if(gx.owner!=1 and gx.fa!=4) return
local gy=gx.type==2 and 3 or 2
for es=-gy,gy do
for et=-gy,gy do
local gz,ha=flr(gx.cv/8)+es,flr(gx.cy/8)+et
bg[gz][ha]=16
hb(gz,ha)
for fh=-1,1 do
for fg=-1,1 do
hb(gz+fg,ha+fh)
end
end
end
end
end
function _update60()
hc,hd,he=stat"32",stat"33",stat"34"
hf,hg,hh=(he==1 and hi!=he) or btnp"4",(he>0) or btn"4",(he==2 and hi!=he) or btnp"5"
for dl=0,1 do
if(btn(dl)) y+=dl*2-1
if(btn(dl+2)) ba+=dl*2-1
end
hj,hk=mid(0,hc+y,127),mid(0,hd+ba,127)
cursor.cv,cursor.cy=hj,hk
if not bp then
if(hj<4) cx-=2
if(hj>123) cx+=2
if(hk<4) cz-=2
if(hk>123) cz+=2
cx,cz=mid(cx,384),mid(-8,cz,384)
for df,dm in pairs(m) do
if dm then
if dm.dk and costatus(dm.dk)!="dead"then
assert(coresume(dm.dk,dm))
else
dm.dk=nil
end
if hl
and fget(ce(dm:cc()),2)
and ek(hm,hn,dm.cv,dm.cy)<1
and dm.z==1
then
del(m,dm)
ho=.01
ch"50"
end
end
end
for dl,hp in pairs(q) do
hp.fh+=hp.hq
hp.cv+=hp.fg
hp.cy+=hp.fh
hp.ey+=hp.hr
hp.life+=1
if(hp.life>=hp.hs) del(q,hp)
end
ht()
end
hu()
hi,bw,bq=he,bm,bi
u+=1
end
function _draw()
hv()
hw()
end
function hb(cv,cy)
if(cv<0 or cv>#bg or cy<0 or cy>#bg) return
local hx=0
if bg[cv][cy]!=0 then
if(bg[cv][cy-1]>0) hx+=1
if(bg[cv-1][cy]>0) hx+=2
if(bg[cv+1][cy]>0) hx+=4
if(bg[cv][cy+1]>0) hx+=8
bg[cv][cy]=1+hx
end
end
function hy()
end
function hz(cv,cy)
local cd=ce(cv,cy)
return cd>=2 and cd<=8
end
function fo(dm,ia)
dm.fa,dm.ib=ia or 0,nil
dm.dk=cocreate(function(self)
while true do
if self.z>1 then
ic(self,
mid(flr(self.ft+rnd"32")-16,64),
mid(flr(self.fu+rnd"32")-16,64))
end
if rnd"250"<1 and self.arms>0 and self.fa!=8 then
local gi,gj=self:cc()
gk(self,gi,gj,
function(dm,cv,cy)
local ff=m[n[cv..","..cy]]
if(ff!=ie and ff.dy!=dm.dy and bg[cv][cy]==16 and ff.z==1) gf(dm,ff) return true
end,
5)
elseif self.id==34 then
ig(self)
end
local fn=self.gr or self.fn
if self.id==32 then
if self.fa==0 or self.fa==9 then
if self.fm<=1500
and self.fa!=7 and self.fa!=9 then
self.gr=nil
local ih,ii
local ij,ik=self:cc()
if hz(ij,ik) and not self.il then
ih,ii=ij,ik
else
gk(self,ij,ik,
function(dm,cv,cy)
if hz(cv,cy) and rnd"10"<1 then
ih,ii=cv,cy
return true
end
end,
10)
end
if ih and ii then
ic(dm,ih,ii)
if(hz(dm:cc())) dm.fa=6
end
end
elseif self.fm>=1500
and self.fa!=7 then
self.ih,self.ii=self:cc()
gh(self,fn or r[dm.dy][6])
elseif self.fa==6 then
self.il=false
im(dm.cv,dm.cy,dm.ey+.75+rnd".2"-.1)
local io=dm:dn()
p[io],self.fm,self.name=(p[io] or 1000)-1,(self.fm or 0)+.5,"hARVESTER ("..flr(self.fm/1500*100).."% fULL)"
if p[io]<=0 then
local ep,eq=self:cc()
for et=-1,1 do
for es=-1,1 do
cd=ce(ep+es,eq+et)
eu(ep+es,eq+et,
(es==0 and et==0) and 0 or((cd>1 and cd<8) and 8 or cd)
)
end
end
self.fa=0
end
if(self.fm%300==0) self.il=true self.fa=0
end
end
if self.id>26 then
if self.fa==9 then
if fn.life>0 and not fn.ip and self.life>0 then
fn.br,self.fa,self.ey,self.cv,self.cy=false,8,.25,fn.cv+16,fn.cy+4
if(bm==self) bm=nil
if self.fm and fn.id==6 then
fn.ip=true
while self.fm>0 do
self.fm-=1
if flr(self.fm)%4==0 then
if tonum(ec)<dt then
gs(2,self)
elseif self.owner==1 then
by"sPICE LOST. bUILD sILO"
end
end
yield()
end
self.fm,fn.ip,self.fa=0,false,0
if(self.ih) ic(self,self.ih,self.ii,0,true)
else
self.process,self.cj,fn.col_cycle_src,fn.col_cycle=2,0,8,co("7,10,0,0,7,0,0")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function ex(ff)
local ev,ew=gk(ff,flr((ff.cv+8)/8),flr((ff.cy+8)/8),iq,nil,true)
return ev*8,ew*8
end
function im(cv,cy,ey)
if(rnd"5"<1) gd(cv+sin(ey)*5.5+3.5,cy+-cos(ey)*5.5+3.5,rnd"2",.15,0,.1,-.01,25,co("2,4,9,15"),0xa5a5.8)
end
function gf(dm,ff)
if dm.id!=19 then
dm.fa,dm.ff=3,ff
dm.dk=cocreate(function(self)
while ff.life>0 do
local ir=ek(dm.cv,dm.cy,ff.cv,ff.cy)
if ir>dm.range*5
and dm.speed>0 then
ic(dm,flr(ff.cv/8),flr(ff.cy/8),dm.range*5)
if dm.id==25 or dm.id==38 then
dm.life=0
for cp=1,dm.id/3 do
gl(dm.cv+rnd"32"-16,dm.cy+rnd"32"-16,2)
end
ff.life-=(400+rnd"200")
ff.gg=dm
return
end
end
if not dm.norotate then
local is=atan2(dm.cv-ff.cv,dm.cy-ff.cy)
while(dm.ey!=is) do
it(dm,is)
end
end
if ir<=dm.range*5 then
if(dm.fire_cooldown<=0 and not dm.fb) dm.ez(dm) dm.fire_cooldown=dm.fire_rate
elseif dm.speed==0 then
fo(dm)
end
yield()
if(dm.id==40 or dm.id==34 or ff.en==dm.en or ff.ib) break
end
fo(self)
end)
else
local iu={24,25,38,38}
gf(cf(cg[iu[dm.en]],dm.cv,dm.cy,dm.owner),ff)
dm.fire_cooldown=1750
end
end
function gk(dm,cv,cy,iv,iw,ix)
for t=0,iw or 64,.02 do
local es,et=flr(cv+t*cos(t)),flr(cy+t*sin(t))
if(iv(dm,es,et)) return es,et
if(not ix) yield()
end
end
function ce(ca,cb)
if(cb>31) ca+=64 cb-=32
return mget(ca,cb)
end
function eu(ca,cb,iy)
if(cb>31) ca+=64 cb-=32
mset(ca,cb,iy)
end
function iq(dm,cv,cy)
return not fget(ce(cv,cy),0)
and n[cv..","..cy]==nil
end
function ic(dm,cv,cy,iz,ja,ia)
local jb=dm.z>1
if ja then
local jc=r and r[dm.dy][33] or false
if jc and not jc.ib then
jc.ib,dm.ib=dm,jc
jc.dk=cocreate(function(jd)
ic(jd,flr(dm.cv/8),flr(dm.cy/8))
if(bm==dm) bm=nil
if dm.life>0 then
del(m,dm)
ic(jc,cv,cy)
dm:gt(jc.cv,jc.cy)
add(m,dm)
fo(dm,ia)
end
fo(jc)
end)
return
end
end
::restart_move_unit::
if not jb and not iq(nil,cv,cy) then
cv,cy=gk(dm,cv,cy,iq)
end
dm.ij,dm.ik,dm.je,dm.fa=cv,cy,dm.fa,1
dm.jf=nil
local jg,jh,ji={cv=flr(dm.cv/8),cy=flr(dm.cy/8)},{cv=dm.ij,cy=dm.ik},function(jj) return shl(jj.cy,8)+jj.cv end
local jk,
jl={
jm=jg,
jn=0,
jo=jp(jg,jh)
},{}
jl[ji(jg)]=jk
local jq,jr,js,jt,count={jk},1,ji(jh),32767.99,0
while jr>0 do
local cost,ju=jt
for cp=1,jr do
local jv=jq[cp].jn+jq[cp].jo
if(jv<=cost) ju,cost=cp,jv
end
jk=jq[ju]
jq[ju],jk.jw=jq[jr],true
jr-=1
local hp=jk.jm
if ji(hp)==js then
hp={jh}
while jk.jx do
jk=jl[ji(jk.jx)]
add(hp,jk.jm)
end
dm.jf=hp
goto end_pathfinding
end
for jy in all(jz(hp,jb)) do
local id=ji(jy)
local ka=not jb and fget(ce(jy.cv,jy.cy),1) and 4 or 1
if(hp.cv!=jy.cv and hp.cy!=jy.cy) ka+=.2
local kb,kc=
jl[id],
jk.jn+ka
if not kb then
kb={
jm=jy,
jn=jt,
jo=jp(jy,jh)
}
jr+=1
jq[jr],jl[id]=kb,kb
end
if not kb.jw and kb.jn>kc then
kb.jn,kb.jx=kc,hp
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
dm.je,dm.fa=dm.fa,2
if dm.jf!=nil then
for cp=#dm.jf-1,1,-1 do
local jj=dm.jf[cp]
if not dm.norotate then
local is=atan2(
dm.cv-(jj.cv*8),
dm.cy-(jj.cy*8))
while(dm.ey!=is) do
it(dm,is)
end
end
if(not jb and not iq(nil,jj.cv,jj.cy)) goto restart_move_unit
local kd,ke=dm.speed or .5,sqrt((jj.cv*8-dm.cv)^2+(jj.cy*8-dm.cy)^2)
local kf,kg=kd*(jj.cv*8-dm.cv)/ke,kd*(jj.cy*8-dm.cy)/ke
for cp=0,ke/kd-1 do
n[jj.cv..","..jj.cy]=dm
dm.cv+=kf
dm.cy+=kg
yield()
end
dm.cv,dm.cy,n[jj.cv..","..jj.cy]=jj.cv*8,jj.cy*8,dm
fl(dm)
if(ek(dm.cv,dm.cy,dm.ij*8,dm.ik*8)<=(iz or 0)) break
end
end
dm.fa=0
end
function hv()
cls"15"
camera(cx+(16-rnd"32")*ee,cz+(16-rnd"32")*ee)
ee=(ee>0.05) and ee*0.95 or 0
if hl then
for cp=1,#hl do
if(cp%2==1) fillp(0xa5a5.8)
circfill(
hl[cp][1]+4,
hl[cp][2]+4,4,
kh[cp%#kh+1])
fillp()
end
if(ho>0) spr(88+ho,hm,hn)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for df,dw in pairs(l) do
if not bp then
dw:ge()
if(dw.cm) dw.cm:ge()
end
dw:da()
if(dw==bm) rect(bm.cv,bm.cy,bm.cv+bm.w-1,bm.cy+bm.h-1,7)
end
pal()
for hp=1,2 do
for df,dm in pairs(m) do
if(hp==1 and dm.z==1) or(hp==2 and dm.z>1) then
if(not bp) dm:ge()
if(dm.process!=2 or dm.speed==0) dm:da()
if(dm==bm) spr(16,bm.cv,bm.cy)
end
end
end
for dl,hp in pairs(q) do
if(hp.ki) fillp(hp.ki)
circfill(hp.cv,hp.cy,hp.ey,hp.kj[flr((#hp.kj/hp.hs)*hp.life)+1])
fillp()
end
local kk,kl=flr(cx/8),flr(cz/8)
palt(0,false)
palt(11,true)
for es=kk-1,kk+16 do
for et=kl-1,kl+16 do
if bg[es][et]!=0 and bg[es][et]!=16 then
spr(bg[es][et]+31,es*8,et*8)
elseif bg[es][et]<16 then
rectfill(es*8,et*8,es*8+7,et*8+7,0)
end
end
end
end
function by(km)
be,bf=km,500
end
function hw()
camera(0,0)
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,125,125,c)
rect(91,91,124,124,d)
rectfill(92,92,123,123,0)
if(bf>0) bf-=1 print(be,2,2)
ec=ed(j[1])
? sub("000000",#ec+1)..ec,103,2,d
if bb!=bd then
bc,kn=bb and 1 or 59,bb and 1 or-1
if(kn<1) by("pOWER LOW.bUILD wINDTRAP")
ch"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=kn
clip(
max(108-bc,91),
max(108-(bc>20 and bc-20 or 0),91),
min(bc*2,33),
min((bc>20 and bc-20 or 1)*2,33))
for cp=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for es=0,31 do
for et=0,31 do
if(o[es..","..et]) pset(92+es,92+et,o[es..","..et])
end
end
local ko,kp=92+cx/16,93+cz/16
rect(ko,kp,ko+7,kp+6,7)
if bm and bm.ico_spr then
bm.ei:gt(109,20)
bm.ei:da()
kq,kr=nil,nil
if bm.owner==1 then
if bm.cm then
bm.cm:gt(109,44)
bm.cm:da()
end
if bm.life<bm.hitpoint
and bm.id!=4
and(bm.type==2
or bm.speed==0) then
kq=eh(cg[80],117,28,5,{},nil,bt,repair_click)
kq:da()
end
if(bm.id==19
and bm.fire_cooldown<=0)
or bm.id==35
then
kr=eh(cg[81],109,29,5,{},nil,bt,bx)
kr:da()
end
end
end
pal()
if bm
and bm.cm
and(bm.cm.type==4
and bm.cm.speed==0)
and bm.cm.life>=100 then
local ks,kt=flr((cursor.cv+cx)/8),flr((cursor.cy+cz)/8)
local ku,kv,w,h=ks*8-cx,kt*8-cz,bm.cm.fw,bm.cm.fx
kw,kx,ej=false,false,false
for es=-1,w do
for et=-1,h do
local cd=ce(ks+es,kt+et)
if es==-1 or es==w or et==-1 or et==h then
if(cd==16 or cd>=58) kw=true
else
if(cd>=9 and cd<=15) ej=true
if(n[ks+es..","..kt+et] or cd==0 or cd<8 or cd>16) kx=true
end
end
end
if(kx) kw=false
fillp("0b1110110110110111.1")
rectfill(ku,kv,
ku+bm.cm.w,kv+bm.cm.h,kw and 11 or 8)
fillp()
end
if bp then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,d)
rect(4,23,123,94,c)
if bm.el then
bm.bn={}
rectfill(6,25,27,92,0)
local ky=1
for cp=1,#bm.el do
local kz=bm.el[cp]
if kz.req_id==nil
or r[bm.dy][kz.req_id]
and kz.req_level<=a
then
bm.bn[ky]=kz
if ky>=bh and ky<=bh+2 then
kz:gt(9,28+(ky-bh)*19)
kz:da()
else
kz:gt(-16,16)
end
bi=bi or bm.bn[1]
if bi==kz then
bl=ky
rect(kz.cv-2,kz.cy-2,
kz.cv+17,kz.cy+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,34,6
end
ky+=1
end
end
end
pal()
for df,la in pairs(bj) do
la:da()
end
end
palt(11,true)
cursor:da()
end
function bk(cv,cy,lb,func_onclick,lc)
add(bj,{
cv=cv,
cy=cy,
w=lc or#lb*4+2,
h=8,
lb=lb,
cu=function(self)
return self
end,
da=function(self)
if(#lb>1) rectfill(self.cv,self.cy,self.cv+self.w,self.cy+self.h,self.ld and c or 6)
? self.lb,self.cv+2,self.cy+2,(#lb>1) and 0 or(self.ld and c or 6)
end,
func_onclick=func_onclick
})
end
function bs(fr)
spr(fr.obj_spr,fr.cv,fr.cy,fr.fw,fr.fx)
end
function hu()
le=false
if bm then
cw=true
lf(kq)
lf(kr)
if(bm.ei and not bp and not le) lf(bm.ei) lf(bm.cm)
if(bp) foreach(bm.el,lf) foreach(bj,lf)
cw=false
end
if not bp
and not le then
foreach(m,lf)
foreach(l,lf)
end
if hg
and not bp
and hj>89 and hj<122
and hk>90 and hk<123 then
cx,cz=mid(0,(hj-94)*16,384),mid(-8,(hk-94)*16,384)
bm=bw
elseif hf then
if(bm and bm.type<=2) by(bm.name)
if le then
if not bp and bm.cl!=nil then
if(bm.func_onclick) bm:func_onclick()
bm=bw
return
end
if(bp and bi.lb and bi.func_onclick) bi:func_onclick()
if(bm.owner==1 and bm.type==1 and bm!=bw and bm.speed>0) ch"62"
if(bm.dy!=1 and bw and(bw.type==1 or(bw.id==19 and bz)) and bw.owner==1) bm.flash_count=10 gf(bw,bm) bm=nil
else
if bm
and bm.owner==1
and bm.speed>0
and bm.fa!=7 then
bm.dk=cocreate(function(dm)
ic(dm,flr((cx+hj)/8),flr((cz+hk)/8))
fo(dm)
end)
end
if bm
and bm.cm
and bm.cm.life>=100
and kw then
cf(bm.cm.fs,
flr((cursor.cv+cx)/8)*8,
flr((cursor.cy+cz)/8)*8,1)
gq(bm.cm)
ch"61"
end
end
bz=false
elseif hh and not bp then
bm,bz=nil,false
end
end
function gq(fr)
fr.life,fr.process,fr.spent,fr.gp=0,0,0,false
if(fr.cl) fr.cl.br=false
end
function lf(fr)
if(fr==nil) return
local lg,lh=cursor:cu(),fr:cu()
fr.ld=lg.cv<lh.cv+lh.w and
lg.cv+lg.w>lh.cv and
lg.cy<lh.cy+lh.h and
lg.cy+lg.h>lh.cy
if hf and fr.ld then
if bp then
bi=fr
else
if(fr.type<=2 and bg[flr((cursor.cv+cx)/8)][flr((cursor.cy+cz)/8)]!=16 or fr.fa==8) return
if bm
and(fr.id==6 and bm.id==32
or fr.id==14 and bm.id>26)
and fr.owner==1 and bm.owner==1
then
gh(bm,fr)
return
else
bm=fr
end
end
le=true
end
end
function gh(dm,li)
li=li or r[dm.dy][1] or dm
dm.fa,li.br,dm.gr=7,true,li
if(dm.id!=32 or li.id==6) dm.fn=li
dm.dk=cocreate(function(dm)
local lj=li.id!=1 and 9 or 0
ic(dm,(li.cv+16)/8,li.cy/8,0,true,lj)
if(dm.ib==nil) fo(dm,lj)
end)
end
lk=0
function ht()
if t()*20>i and t()%i==0 then
local ll=rnd(m)
if ll.owner==2 and ll.arms>0 and ll.fa==0 then
ig(ll)
end
local lm=rnd(l)
if lm.owner==2 and
(lm.cm==nil or lm.cm.process!=1) then
local ln=rnd(lm.el)
if ln and ln.speed>0 then
ln:func_onclick()
end
if lm.life<lm.hitpoint and lm.process!=2 then
bv(lm,2)
end
end
if lo and lo.type==2
and eo and eo.fire_cooldown<=0 then
gf(eo,lo)
end
end
lk-=1
if lk<0 then
if hl then
hl=nil
else
hl,lp,lq,kh,ho={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lr=rnd"5000"
lk=lr
end
if hl then
if(u%6<1 or#hl<30) and ho==0 then
while#hl<31 do
if(rnd"9"<.5) lq=rnd".04"-.02
hm,hn=hl[#hl][1],hl[#hl][2]
add(hl,{hm+sin(lp),hn-cos(lp)})
lp+=lq
end
end
if(#hl>30) del(hl,hl[1])
if(ho>0) ho+=.01 im(hm,hn,rnd"1")
if(ho>2) ho=0
end
end
function ig(fr)
local lo=lt(fr)
if(lo and dx(lo)) gf(fr,lo)
end
function lt(fr)
local lu
repeat
lu=(rnd"4"<1) and rnd(m) or rnd(l)
until lu.dy!=fr.dy
return lu
end
function dx(fr)
local cv,cy=fr:cc()
return bg[cv][cy]==16
end
function ch(lv)
sfx(lv,3)
end
function ea(lw)
local cd=peek(0x3115)
if(band(cd,128)>0!=lw) cd=bxor(cd,128)
poke(0x3115,cd)
end
function ed(cd)
local lx,gu="",abs(cd)
repeat
lx=(gu%0x0.000a/0x.0001)..lx
gu/=10
until gu==0
if(cd<0) lx="-"..lx
return lx
end
function co(ly,fi,lz)
fi=fi or","
if(lz~=nil) ly=split(ly,lz)
if type(ly)=="table"then
local t={}
while#ly>0 do
local lx=ly[1]
add(t,split(lx,fi))
del(ly,lx)
end
return t
else
return split(ly,fi)
end
end
function fz(ih,ii,cv,cy,is,w,ma,mb)
local mc,md=cos(is),sin(is)
local me,mf,hx=mc,md,shl(0xfff8,w-1)
w*=4
mc*=w-0.5
md*=w-0.5
local mg,mh,w=md-mc+w,-mc-md+w,2*w-1
for mi=0,w do
local mj,mk=mg,mh
for ml=0,w do
if band(bor(mj,mk),hx)==0 then
local mm=sget(ih+mj,ii+mk)
if(mm!=ma) pset(cv+mi,cy+ml,mb or mm)
end
mj-=mf
mk+=me
end
mg+=me
mh+=mf
end
end
function ek(mn,mo,mp,mq)
return sqrt(((mn-mp)>>10)^2+((mo-mq)>>10)^2)<<10
end
function it(dm,mr)
local gv=mr-dm.ey
if(dm.z>1) dm.ey=mr
if gv>0.5 then
gv-=1
elseif gv<-0.5 then
gv+=1
end
if gv>0.0087 then
dm.ey+=0.0087
elseif gv<-0.0087 then
dm.ey-=0.0087
else
dm.ey=mr
end
yield()
end
function jz(jj,jb)
local ms={}
for es=-1,1 do
for et=-1,1 do
if(es!=0 or et!=0) mt(jj.cv+es,jj.cy+et,ms,jb)
end
end
return ms
end
function mt(mu,mv,mw,jb)
if(jb or not fget(ce(mu,mv),0) and n[mu..","..mv]==nil and mu>=0 and mv>=0 and mu<=63 and mv<=63) add(mw,{cv=mu,cy=mv})
end
function jp(is,mx)
return abs(is.cv-mx.cv)+abs(is.cy-mx.cy)
end
function gd(cv,cy,ey,fg,fh,hr,hq,life,kj,ki)
local hp={
cv=cv,cy=cy,ey=ey,fg=fg,fh=fh,hr=hr,
life=0,hq=hq,
kj=kj,ki=ki,
my=cy,hs=life
}
add(q,hp,1)
end
__gfx__
bbbbbbbbbb171bbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbb9b5d555d555d555d55d555d5bbbbbbbbb1d515555dddddddddddddddd
bb11bbbbb17771bbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99d555515d15555155d515555dbd5bd5db5155d55dd5555555d5555555
bb171bbb1711171bbbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9b5d55d5515d55d555155d55d5d5155551555d5155d5015515d5555555
bb1771bb7717177bbbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbb55515d5555515d5d55d51555155d55d5d5555d55d5105555d5555555
bb17771b1711171bbbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99b155d5555d55555555555d55155d5155555d155d5d5555111d5555555
bb177771b17771bbbbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbb55d551d555d515555d155d555555d55d15555555d1555101d5555555
bb17711bbb171bbbbbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbbd5555555555555155555555d5d155d55b51bd5dbd5555111d5555555
bbb11bbbbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbb55d5515555d55555155d55b55555551bbbbbbbbd5515555d5555555
b7bbbb7bbbbbbbbbbbbbbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbb55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
77bbbb77bbbbbbbbbb77bbb7bbbbbbbbbb66669bbbbbbbbbb6bbbbbb1555515d4444444444555155544444444444444444444444544224222242224442422442
bbbbbbbb0000b000b79bb77bbbb777bbb66dd66bbd5bb5bbbbbbbb6b5d55d444444444444445d555444444444444444444444444524442444424442224444221
bbbbbbbb0770007779b779bbbb77994bb6d55d6bb5dbbbbbbbbbbbbb55544444444444444444445d444444444444444444444442522222212222222242222110
bbbbbbbb00777770bb799bbbbb79994bb6d55d6bbbbb555bbbbbbbbb555444444444444444444445444444444444444444444422502112121121122121121200
bbbbbbbb07700077b799bbbbbb79944bb66dd66bbbbb5d5bbbb6bbbb55d444444444444444444445444444444444444444444242550221200012210012100005
77bbbb770000b000b79bbbbbbbb444bbbb6666bbbbbb555bbbbbbbbb154444444444444444444444444444444444444444444240555000055000000500055555
b7bbbb7bbbbbbbbb7bbbbbbbbbbbbbbbb9bbbbbbbbbbbbbbbbbbbbbb55444444444444444444444444444444444444444444442155555555555555555555d555
bbbbbbbbbbbbbbbbbbbbbbbbbbbbb1b1bbbbbbbb1b1bbbbbbb0ee0bbbbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbb0000000010bbbbbbb0000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbb1bb00bbbbbbbb00bb1bbbbb5c65bbbbbbbbbbbb676bbbbb676bbbb0000000bbbbb1000000000b00bbbbbbb000000b00000000
bbbbbbbbbbbbbbbbbbbbbbbbbb1b0000bbbbbbbb0001b1bbbb0c60bbbbbbbbbbbbb7bbbbbbb7bbbb1b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
bbbbbbbbbbbbbbbbbbbbbbbbb1b00000bbbbbbbb00000b1bbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
bbbbbbbbbbbbbbbbbbbbbbbbbb000000bbbbbbbb000001bbbbbc7bbbbbb1b1bb7e777e7bbb676bbbb1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbb1b000000bbbbbbbb000000b1bb0cc0bbbb1b1b1bbbb7bbbbbbb7bbbbbb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbbb0000000bbbbbbbb0000000bbb5dd5bbb000000bbbbcbbbbbbbcbbbbbbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
bbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbbb00000001bb0cc0bb00000000bbbbbbbbbbbbbbbbbbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cb0cecec0bb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbec6c6cebb6d7d6bbd4c455444445549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debee6e6eebb6d4d6bb4a042499999452424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebec0c0cebb69996bb49029999c0994922229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0b00ccc00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a94942d1542425d44411114555224225ff2225
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
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd5dd0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d51d0001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
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
ccccc7776cccccccffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
ccccc77767ccccccffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
ccccc79767ccccccffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
ccccc97767ccccccffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67000dcccccc11116666dc0157d7
ccccc79967ccccccff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
ccccc777667cccccff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650111dccc7776d76d1c11111110
ccccc677687cccccff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
7ccccc77867cccccf7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd011111d5ddd6d1d6d1ccd7d0d6d
97cccc77887cd6ccf7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055511d5ddd6d1d6d1ddd7d0d7d
c9776d77d677756cf76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755011111d55556d1d4d9949945499
7d679d77dd6707dffddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
dff67d775d567100ffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
9999917799909999fffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
9444546444516449fffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
9999944444499999fffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
9999999999999999ffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
cccccccccbb3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
ccccccccbbc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddddddddddddddddddddddddddddcccccccccccccccc
cccccccbbcc3ccccccccccccccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddd70dddddddddddddddddddddddcccccccccccccccc
ccccccbbccccccccccccccf7ccccccccccccccccccccccccddddddddddddddddccccccccccccccccddddddbb70ddddddddddddddddddddddcccccccccccccccc
cccc7755555555ccccccc5f01cccccccccccccccccccccccddddddddddddddddccccccccccccccccddddbbb53dddddddddddddddddddddddcccccc006ccccccc
ccc76753355335cccccc055ffccccccccccccc4ff75550ccdddddddd7773330dcccc2888887660ccdd3bb53dddddddddddddd7bbd355550dccc7f000005550cc
cc76667555dd555ccccc0f7557ccccccccccc4ffff7fccccddddd4bbbb75550dccc288888887ccccddd53dddddbb5ddddddd33bbbb3ddddd4fffffffff4ccccc
cd66d6755dddd55ccccc0f7fff7ccccccc54454444444f7cdd45444444444dddcc5225222222287cdd35555dd3bbbbdddd50005333533ddd45005444455005cc
c5dd66655555555ccccc0ff000550cccc555fffffffff55cd54bbbbbbbbbbb5dc55588888888855cd53bbbbbbbbbbb5dd5000005bbbb505d5016054ff501605c
9166660001110009cccc00df00cccccc950600000000065995040000000004599506000000000659950360000000635995000005999300095061052995061059
f90500000444000999999900ff999999995555255555559999555555555555999955555555555599995555555555559999500052222250599500522222500599
999999999999999f44999df9dff9f999f99999999999999f9999999999999999f99999999999999f9999999999999999f99999999999999f99999999999999ff
9f9ff9999f9999994444df449df999f9999999f999999999f99f99f99999f99f999999f999999999f99f99f99999f99f999999999f99999999999999f9999999
99999999999999f999945559455599999ff9999999fff999999999999ff999999ff9999999fff999999999999ff99999999fff9999999ff999fff9999999ff99
99999999ffff9999fff999999999999999999999999999ff999fff9999999f9999999999999999ff999fff9999999f99ff99999999999999f99999999999999f
9fffff99999999ff9999999f99999ff999ff99fffffff9999f9999999999999999fffff9999f99999f999999999999999999f9999fffff99999f9999fffff999
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
__label__
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922292229222922299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292999292929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292922292929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992929292929992929292929299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999992229222922292229222922299
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
ff77fff7d5555555580555d6766dd55515555155f6fffffff6fffffff6fffffff6ffffffffffffffd576dc65d5577655ffffff99f6fff1000000000000000000
f79ff77fd5d6d55522055dd6766dd1555d55d555ffffff6fffffff6fffffff6fffffff6fffffffffd76dccc5d576dc659ff99f9fffff1f000000000000000000
79f779ffd576dddd550516d6766d610555515d5dffffffffffffffffffffffffffffffffffffffffd66d11c5d76dccc5ff99fffffffff1000000000000000000
ff799fffd50015055505ddd6766ddd05d5555555ffffffffffffffffffffffffffffffffffffffffd66d01c0d66d11c5f999f99fffff1f000000000000000000
f799ffffd55555555d101dd6766dd10555d51555fff6fffffff6fffffff6fffffff6ffffffffffffd66d0c01d66d01c099ff9ffffff6f1000000000000000000
f79fffffd455555550001dd6766dd10555555515ffffffffffffffffffffffffffffffffffffffffd56dd015d66d0c01ffffffffffffff000000000000000000
7fffffffd15ddddddddd1dd6d16dd105555d5555ffffffffffffffffffffffffffffffffffffffffd5511155d56dd015fff99ffffffffff00000000000000000
ffffffffd55776d7777716d6116d610555d555d5ffffffffffffffffd76d76dd577777d5577777d5ddddd776ddd111ddffffffffffffffff0000000000000000
f6ffffffd55666666666ddd6766ddd0515555155fffffffff6ffffffd77556d5576666d5576666d5d55576dc65555555f6ffffffff77fff7f0000007f0000007
ffffff6fd56ddddddddd1d00000001055d55d555ffffffffffffff6fd5511d15576666d0576666d0d5576dccc5558055ffffff6ff79ff77ff191f17ff191f17f
ffffffffd5d111111111101d6dd6d00555515d5dffffffffffffffffd7516155576666d0576666d0d5566d11c5522055ffffffff79f779ff791719ff791719ff
ffffffffd551a1a11111000000000005d5555555ffffffffffffffffd66d155556dddd1056dddd10d5566d01c0555055ffffffffff799fffff799fffff799fff
fff6ffffd45111111111016d6d6d6d0555d51555fffffffffff6ffffd5d1115556dddd1056dddd10d5566d0c01555055fff6fffff799fffff799fffff799ffff
ffffffffd4455555555555555555555555555515ffffffffffffffffd511111556dddd1056dddd10d5556dd015555555fffffffff79ffffff79ffffff79fffff
ffffffffd11555555555555555555555555d5555ffffffffffffffffd11111115d1111105d111110d5555111d5555555ffffffff7fffffff7fffffff7fffffff
ffffffffdddddddddddddddddddddddd55d555d5ddd66666dddddddd577777d5dddddddddddddddddddd666666ddddddf99ffff9fffffffffffffffff99ffff9
ffffffffd5555555555555448455555515555155d566777665555555576666d5d555555555555555d566ddddd6111110ffffff99ff77fff7f6ffffffffffff99
ffffffffd5555555555554a9044555555d55d555d767666d6d555555576666d0d554777777777455d5dddd000066dd669ff99f9ff79ff77fffffff6f9ff99f9f
ffffffffd4845544444554990449989555515d5dd767666d6d555555576666d0d544ff7fff7ff445d5dd0000001111ddff99ffff79f779ffffffffffff99ffff
ffffffff4a042499999452424297a094d5555555d766ddd66d55555556dddd10d504777778617405d50000000066dd10f999f99fff799ffffffffffff999f99f
ffffffff4902999980994922229aa09455d51555d6d66666d155555556dddd10d544ff7ff6d1f445d55555555511111099ff9ffff799fffffff6ffff99ff9fff
ffffffff242499a22099942dd149994255555515d6dd0d022166666556dddd10d504777771177405d551f6155566dd66fffffffff79fffffffffffffffffffff
ffffffffd2499a77a0a94942d1542425555d5555d6dd0002266807665d111110d544ff7fff7ff445d550f605551111ddfff99fff7ffffffffff00ffffff99fff
ffffffffd1499a77aaa99424d15242f5ddddddddd5dd0d02762206d6577777d5d504777777777405d555f655551d6d10fffffffff99ffff9f99028f9f99ffff9
f6ffffffd1299aaaaaa94942d551414fd5555555d51d0001767606d6576666d5d544ff7fff7ff445d5516615551d6d10f6ffffffffffff99fff86229ffffff99
ffffff6fd52499aaaa9494245552424fd5555555d5511111766d0d66576666d0d542222222222245d5505505551d6d10ffffff6f9ff99f9f9f888d0f9ff99f9f
ffffffffd5424999994942425551424fd5555555d55555556d666662576666d0d528028020200225d5555555551d6d10ffffffffff99ffffff08855fff99ffff
ffffffffd5542494949424255555114fd5555555d55555556dd0d02256dddd10d522022022200225d55555555510d010fffffffff999f99ff056599ff999f99f
fff6ffffd5514242424242159989554fd5555555d55555556dd0002256dddd10d551011011111115d555550f050aaa00fff6ffff99ff9fff95f59fff99ff9fff
ffffffffd55f1424242421197a09954fd5555555d55555555dd0d02156dddd10d555011011111155d55f0f5555555555ffffffffffffffffffffffffffffffff
ffffffffd559989212121119aa09954fd5555555d5555555551000115d111110d555555555555555d555555555555555fffffffffff99ffffff99ffffff99fff
ffffffffd597a099fffffff455555425ddd776ddddddddddddddddddddddddddddd776ddddddddddd199999999999999f99ffff9fff9fffff99ffff9f99ffff9
ffffffffd59aa094dddddddf5fff2225d576dc65d5577655d5555555d5ddddd5d576dc65d5577655d494955949999249ffffff99ff66669fffffff99ffffff99
ffffffffdf249492dd929ddf5ffff225d76dccc5d576dc65d555555566d66d55d76dccc5d576dc65d1942559992299999ff99f9ff66dd66f9ff99f9f9ff99f9f
ffffffffdff2424fd9d2d9df54444445d66d11c5d76dccc5d555555577d66d55d66d11c5d76dccc5d495f5f4f4121419ff99fffff6d55d6fff99ffffff99ffff
ffffffffd1fffff1d99299df5ffffff5d66d01c0d66d11c5d5555555d55dd555d66d01c0d66d11c5d195656565999959f999f99ff6d55d6ff999f99ff999f99f
ffffffffd4414141111111145ffffff5d66d0c01d66d01c0d5555555d5511155d66d0c01d66d01c0d49995555594495999ff9ffff66dd66f99ff9fff99ff9fff
ffffffffd14404455555555454444445d56dd015d66d0c01d5555555d5111115d56dd015d66d0c01d194958055944959ffffffffff6666ffffffffffffffffff
ffffffffd51111155555555452222225d5511155d56dd015d5555555d1111111d5511155d56dd015d499922055944959fff99ffff9fffffffff99ffffff99fff
dfff61ffddddd999dddddddd55d555d5ddddd776ddd111dd1d515555577777d5ddddd776ddd111ddd195594095999959f99ffff9f99ffff9f99ffff9f99ffff9
df44414ff55999999955576515555155d55576dc655555555155d55d576666d5d55576dc65555555d495594495977779ffffff99ffffff99ffffff99ffffff99
dfff4144f54499999445f66f5d55d555d5576dccc5558055555d5155576666d0d5576dccc555805599995299257777779ff99f9f9ff99f9f9ff99f9f9ff99f9f
df444444f52449494425dffd55515d5dd5566d11c5522055d5555d55576666d0d5566d11c55220559429444444776666ff99ffffff99ffffff99ffffff99ffff
dffffffff5424444424556d5d5555555d5566d01c055505555d155d556dddd10d5566d01c05550559999242424766666f999f99ff999f99ff999f99ff999f99f
d4444444452242424425542555d51555d5566d0c015550551555555556dddd10d5566d0c01555055944242424296666d99ff9fff99ff9fff99ff9fff99ff9fff
d4144114455422422455542555555515d5556dd015555555f51ffd5f56dddd10d5556dd015555555944242424294ddd2ffffffffffffffffffffffffffffffff
d44411114555224225ff2225555d5555d5555111d5555555ffffffff5d111110d5555111d5555555d111111111194421fff99ffffff99ffffff99ffffff99fff
d55555555555555555f4422555d555d51d5155555d555d5fffffffffddddddddd77dd77d67d6fffdf99ffff9f99ffff9f99ffff9fffffffff99ffff9ffffffff
ddddd88ddd88dd5d5fff4445155551555155d55dd5155551ffffffffd5ddddd576667666561ffff1ffffff99ffffff99ffffff99ff77fff7ffffff99ffff9fff
dd55885dddd885dd5f4444455d55d555555d5155155d55d5ffffffffd5d66d5576667666565f44419ff99f9f9ff99f9f9ff99f9ff79ff77f9ff99f9fffff9999
d5588dd2d2d5885d5fff476555515d5dd5555d5555d51555ffffffffd5d66d55d6621662165ffff1ff99ffffff99ffffff99ffff79f779ffff99fffffff99f9f
d588d522d22dd8855444f66fd555555555d155d55555d55dffffffffd67dd555d2221222165f1011f999f99ff999f99ff999f99fff799ffff999f99ffffff9f9
d88dd225dd22d5885414dffd55d51555155555555d155d55ffffffffd7711155622112211ddf100199ff9fff99ff9fff99ff9ffff799ffff99ff9fffffff9999
d8d522dd2d522dd8544446d455555515f51ffd5f55555551ffffffffd51111156115511151551005fffffffffffffffffffffffff79ffffffffffffffff99f9f
d5d225d222dd22dd55555425555d5555ffffffff5155d55ffff76fffd111111166767555d55d5555fff99ffffff99ffffff99fff7ffffffffff99fffffff99f9
dddddd22222ddddd555554251d515555ffffffffffffffffddd76ddd577777d56d6d65d555d555d5fffffffff99ffff9f99ffff9ffffffffffffffff99f9ff99
ddd22dd222d522dd5fff22255155d55df6ffffffffffffffd7d55d75576666d566d1d555155d80555dfffd5fffffff99ffffff99ffff9fffffffffff9f9999f9
d8dd225d2d522dd85ffff225555d5155ffffff6fffffffffd6511565576666d0d555555a5d522055d51555519ff99f9f9ff99f9fffff9999ffffffff999f9999
d88d522dd522d58854444445d5555d55ffffffffffffffffddd66dd5576666d015aaa99a5555505d155d55d5ff99ffffff99fffffff99f9ff9ffff9ff9999f9f
d588dd22d22d58855ffffff555d155d5ffffffffffffffffd151151556dddd1055aaa55ad555505555d51555f999f99ff999f99ffffff9f9ff99f9999ff9999f
4d5885d2d2d5885d5ffffff515555555fff6ffffffffffffd551115556dddd10d5a1199a55d515555555d55d99ff9fff99ff9fffffff9999999f99f9f999f99f
d4d588dd5dd88ddd54444445f51ffd5fffffffffffffffffd511111556dddd105544445a155555155d155d55fffffffffffffffffff99f9f9f99f99f99f999f9
dd4dd88ddd88dddd55555555ffffffffffffffffffffffffd11111115d111110d5151515555d555555555551fff99ffffff99fffffff99f9f92882f9ff9fff99
dddddddddddddddddd4dddddffffffffffffffffffffffff577777d5ddd776ddddddddddddddddddddd7778066666dddddddddddfffffffff0d22d0999f9ff99
d557755555555ddddd4ddd5dff77fff7f6fffffff6ffffff576666d5d576dc65d5577655d55555556667d220dddd657667555555fffffffff02882099f9999f9
d566969666655ddd5ddd5dddf79ff77fffffff6fffffff6f576666d0d76dccc5d576dc65d55555556dd7ddd0d6666dddddd56765ffffffff9288882f999f9999
d5ddadadddd55ddddd5dd5dd79f779ffffffffffffffffff576666d0d66d11c5d76dccc5d55555556dd766d0d6dd611111ddddd5fffffffff288882ff9999f9f
7777a7a71155544dd555dd44ff799fffffffffffffffffff56dddd10d66d01c0d66d11c5d55555556dd11666666d705501111115fffffffff088880f9ff9999f
7d9d9d9711555ddddd5d5dddf799fffffff6fffffff6ffff56dddd10d66d0c01d66d01c0d55555556d7661111117705055421425ffffffff9088889f9999f99f
7da76767115767dd5dddddddf79fffffffffffffffffffff56dddd10d56dd015d66d0c01d55555556d55d5dd6661100555425425fffffffff522295999f999f9
75776d675576667ddd4dd5dd7fffffffffffffffffffffff5d111110d5511155d56dd015d55555556ddd6ddd7111102555425425ffffffffff55559f9f9fff99
75777777766767667d4dddddffffffffffffffffffffffff577777d5ddddd776ddd111dddddddddd6d7777777111104555425425fffffffffffff9f9f9ffffff
7d7807777677677675555555ff77fff7ff77fff7f6ffffff576666d5d55576dc65555555d55555556d7011111ddd644555555555ffffffffffffff9f9fffffff
7d220dddd666d66d75555555f79ff77ff79ff77fffffff6f576666d0d5576dccc5558055d55555556770d1d11ddd705555555555ffffffffffffffffffffffff
7ddd0d777d66d6dd7655555579f779ff79f779ffffffffff576666d0d5566d11c5522055d5555555ddd0d1d11677705555555555ffffffffffffffffffffffff
777757707dddddd77d675555ff799fffff799fffffffffff56dddd10d5566d01c0555055d5555555ddd0d1dd111115dddddd5555ffffffffffffffffffffffff
ddddddd07777777776d75555f799fffff799fffffff6ffff56dddd10d5566d0c01555055d55555550001d1111111105555555555ffffffffffffffffffffffff
d111d1d5ddddddddd7775555f79ffffff79fffffffffffff56dddd10d5556dd015555555d555555500111ddd111115dddddd5555ffffffffffffffffffffffff
d5555555d1d1d1d1dddd55557fffffff7fffffffffffffff5d111110d5555111d5555555d5555555011117111111105555555555ffffffffffffffffffffffff
ffffffffffffffffffffffffff62226fffffffffffffffffd76d76dd577777d5dddddddd577777d5dd7d76ddddddddddddddddddddddddddddd777dddddddddd
ff77fff7ff77fff7ff77fff7ff80808ff00fffffffffffffd77556d5576666d5d5ddddd5576666d5d66d56d5d555555555555555d5555555d5766665d5555555
f79ff77ff79ff77ff79ff77fff87878ff2d886ffffffffffd5511d15576666d0d5d66d55576666d0ddd11d75d588888888888888888888888888888888888885
79f779ff79f779ff79f779ffff86868ff867800fffffffffd7516155576666d0d5d66d55576666d0d1566565d582222222222222222222222222222222222855
ff799fffff799fffff799fffff8ddd8ff2d8865fffffffffd66d155556dddd10d55dd77556dddd10d5511dd5d582000000000000000000000000000000002855
f799fffff799fffff799ffffff68886ff00555ffffffffffd5d1115556dddd10d551167556dddd10d5511155d58208f5ff8f0000000000000000000000002855
f79ffffff79ffffff79fffffff55555ff55fffffffffffffd511111556dddd10d511111556dddd10d5111115d582077777777000000000000000000000002855
7fffffff7fffffff7fffffffffffffffffffffffffffffffd11111115d111110d11111115d111110d1111111d582f7d8888f7f00000000000000000000002855
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff577777d5d582f7dd88df7f000000000000000000000028dd
ff77fff7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff576666d5d582f7df8d8f7000000000000000000000002855
f79ff77ffffffffffffffffffffffffffffffffffffffffffffffffffff7ff67ffffffffffffffff576666d0d582f78888887000000000000000000000002855
79f779fffffffffffffffffffffffffffffffffffffffffffffffffffff116766fffffffffffffff576666d0d58207ffff8d7000000000000000000000002855
ff7191ffffffffffffffffffffffffffffffffffffffffffffffffffffff776fffffffffffffffff56dddd10d582077777777000000000000000000000002855
f7191f1fffffffffffffffffffffffffffffffffffffffffffffffffffff777fffffffffffffffff56dddd10d582000f00000000000000000000000000002855
f000000ffffffffffffffffffffffffffffffffffffffffffffffffffffcff17ffffffffffffffff56dddd10d582000000000000000000000000000000002885
00000000fffffffffffffffffffffffffffffffffffffffffffffffffff555575fffffffffffffff5d111110d582000000000000000000000000000000002855
000000001f1fffffffffffffffffffffffffffffffffff88ffffffffffff555fffffffffffffffffdd76d1dddd820000000000000000000000000000000028ff
0000000000ff1ffffffffffffffffffffffffffffff5ff77ffffffffffff555fffffffffffffffffd5d5ddd5d5820000000000000000000000000000000028ff
000000000001f1fffffffffffffffffffffffffffff28f66f56ffffffff5ff55ffffffffffffffff66516155d5820000000000000000000000000000000028ff
0000000000000f1ffffffffffffffffffffffffffff77777775ffffffffffff5ffffffffffffffff77516155d5820000000000000000000000000000000028ff
00000000000001fffffffffffffffffffffffffffff77777775fffffffffffffffffffffffffffffd555d555d5820000000000000000000000000000000028ff
00000000000000f1fffffffffffffffffffffffffff28f66f56fffffffffffffffffffffffffffffd576d155d5820000000000000000000000000000000028ff
000000000000000ffffffffffffffffffffffffffff5ff77ffffffffffffffffffffffffffffffffd5111115d5820000000000000000000000000000000028ff
0000000000000001ffffffffffffffffffffffffffffff88fffffffffffffff11fffffffffffffffd1111111d1820000000000000000000000000000000028ff
00000000000000000fffffffffffffffffffffffffffff55fffffffffffffff171ffffffffffffffffffffffff820000000000000000000000000000000028ff
00000000000000000077fff7ff77fff7fffffffffff5ff55fffffffffffffff1771fffffff77fff7ff77fff7ff820000000000000000000000000000000028f7
0000000000000000001ff77ff79ff77ffffffffffff55f55f55ffffffffffff17771fffff79ff77ff79ff77fff8200000000000000000000000000000000287f
000000000000000000f179ff79f779fffffffffffff55555555ffffffffffff177771fff79f779ff79f779ffff820000000000000000000000000000000028ff
000000000000000000199fffff799ffffffffffffff55555555ffffffffffff17711ffffff799fffff799fffff820000000000000000000000000000000028ff
00000000000000000091fffff799fffffffffffffff55f55f55fffffffffffff11fffffff799fffff799ffffff8200000000000000000000000000000000281f
0000000000000000001ffffff79ffffffffffffffff5ff55fffffffffffffffffffffffff79ffffff79fffffff8200000000000000000000000000000000280f
00000000000000000fffffff7fffffffff0220ffffffff55ffffffffffffffffffffffff7fffffff7fffffffff82000000000000000000000000000000002800
00000000000000000fffffffffffffffff5865ffffffffffffffffffffffffffffffffffffffffffffffffffff82000000000000000000000000000000002800
00000000000000000077fff7ff77fff7ff0860ffffffffffffffffffffffffffffffffffff77fff7ff77fff7ff82000000000000000000000000000000002800
0000000000000000001ff77ff79ff77fff5875fffffffffffffffffffffffffffffffffff79ff77ff79ff77fff82000000000000000000000000000000002800
000000000000000000f179ff79f779ffff5875ffffffffffffffffffffffffffffffffff79f779ff79f779ffff82000000000000000000000000000000002800
000000000000000000199fffff799fffff0880fffffffffffffffffffff1f1fffff1f1ffff7191ffff7191ffff82222222222222222222222222222222222800
00000000000000000091fffff799ffffff5dd5ffffffffffffffffffff1f1f1fff1f1f1ff7191f1ff7191f1fff88888888888888888888888888888888888800
0000000000000000001ffffff79fffffff0880fffffffffffffffffff000000ff000000ff000000ff000000ff000000ff000000ff00000000000000000000000
00000000000000000fffffff7fffffffff5555ffffffffffffffffff000000000000000000000000000000000000000000000000100000000000000000000000

__gff__
0400040404040404040000000000020000000606060604010101010101010101000101010000000000000101010000010000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0d0000000003070707070400000d0a0a0a0a0a0a0d0203030707040a0a0a0c2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
1600000008300303070703030000000d0a0a0a0a0d02030303030606090a0a0a2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000000000306030600000000000000000000000000000000090a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000090a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000030000000000000000d0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000090a0b000000000000000000000203080512000000000000000d0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
30000c0b000000000000000000000002030703031212000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0c0b0000000000000031090a0c3100080307041212121200000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b00000000000000340c0a0a0a0c34030303060012121212000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a00000000000000090a010a0a0a0c080306000012121212120000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b0000000000000c0a0a0a0a0a0a0a0a0c00000012123012120000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b000000000c0a0a0a0a0a0a0a0a0a0a0a00000012121212120000003000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0b000000090a0a0a0a0a0d0d0a0a0a0d00000000121212000000000c00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0b0000000d0a0a0a0a0b0031090a0d00000000000000000000000d0000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0b00000000090a0a0a0a0c000000000000000030000000000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b00000000000d0a0a0a0a0a00000000000000000c0c000a0a0d00000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b0000000000000d0a0a0a0a0c0000000000000c0a0a0a0a0a0000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b000030000000000d0a0a0a0b00000000000c0a0a0a0a0d000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0b080000050303050500090a0a0c0000300c0a0a0a0a0a00000000000000002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0d0005030303070703000a0a0a0a0a0a0a0a0a0a0a0000000000000c0c0c0c2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d020303030303030306000d0a0a0a0d0a0a0d0a0a0a00000000000c0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03030303030703080000300000080303030303050a0a0c0000000c0a0a0a0a0d2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03070703070707030000000000020707070303060a0a0a0a0a0a0a0a0a0a00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
070303030303030800000000000803030307030c0a0a0a0a0a0a0a0a0a0b00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303060c0c0c0c0000000000000002030303060a0a0a0a0a0a0a0a0a0a0a00002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c0a0a0a0a0a0a0c0000000030000000000c0a0a0a0a0a0a0a0a0a0a0a0c002f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0c00000000000000000a0a0a0a0a0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0a0c000000000000090a0a0a0a0a0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0d0503050a0a0a0a0a0c000000090a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0d000203030d0a0a0a0a05000000000d0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000303030303030303030500000000000d0a0a0a0a0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
161600020303030303030303050500000000000000000d0a0a0a0a0a0a0a0a0a2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
01040000039230531308933093130b9430d3130e95310313129631331314973153131696315313149531331311943103130f9330d3130c9330a31308923073130592303313019130031308303073030430301303
0109000020f1220f2220f3220f4220f5220f6220f7220f6220f5220f4220f3220f2220f1220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f0220f02
010900002cf122cf222cf322cf422cf522cf622cf722cf622cf522cf422cf322cf222cf122cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf022cf02
010400000647307b710a6730cb711093313631159331ab510145302b510565307b310b9330e6211092315b410044300b410064302b4106923096210b92310b210041300b110061300b110191304611069130bb11
01020000104230db53306532db532b953276532495323b53206531f4531c9531b6531895316b531564313b4312943104430f9430db330b63309b3308923066230492303b230162300b2300933002150094300615
00040000049132ff13069132cf13039132af23049230592327f230693326f330493325f430694325f430494328f430794329f430a94326f530595324f530795329f2321f432cf632ff7330610306103061030615
010400002b72418765187641876518764187551875418755187541874518744187451873418735187341872518724187251870418705187041870518704187051870418705187041870518704187051870418705
010800003a9703a9523a925249003a9703a9503f9703f9503f9403f9323f9203f9103f91518900189000090000900009000090000900009000090000900009000090000900009000090000900009000090000000
010200002cd732cd732cd732cd732cd632cd632cd632cd632bd132bd532ad532ad1329d5329d4328d4327d4326d132594324d432293320d331e9031cd331a93319d0317d231592313d131191300d0300d0300d03
000200000fd130452011d33107301ad43157501fd531b76326d601d76332d70157732ed600b7632ad600975323d50057431cd400673316d200a72310d10027130ad15007030dd0009d0006d0003d0001d0001d00
0101000030e71189753fe000000000000000000d97118e75000000000000000000003097118e7500e0018e0116e0100e0113e0111e0100e010de010ce0100e0109e0107e0100e0105e0104e0100e0101e0100e01
0102000033b6131863006102f86316b61006101eb531c851006101885116b430061013b4311841006100d8410cb430061009b3307831006100582104b230061001b1100811006140061507b0007b0006b0105b01
010100003062030610306203c6103c6203c6100060000600006000060000600006000060000600006000060000600006000060000600006000060000600006003060030600306003c6003c6003c6000060000600
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

