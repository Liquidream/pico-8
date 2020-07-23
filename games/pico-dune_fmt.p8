pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
cartdata("pn_undune2")
a,b,c,d=dget"0",dget"1",dget"2",dget"3"
e,f,g,i=dget"20",dget"21",dget"22",dget"23"
j={
shr(dget"6",16),
shr(500,16),
shr(dget"7",16),
}
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
bp,bm.bq=nil,br
br:func_onclick()
end)
bk(96,83,"close",function()
bp=nil
end)
bp=self
end
k.init_windtrap=function(self)
self.bs=11
self.bt=bu("12,12,12,12,13,1,1,1,1,13")
end
k.init_refinery=function(self)
self.bt=bu("11,10,8,8")
end
k.draw_refinery=function(self)
pal()
pal(11,self.col2)
pal(10,self.col2)
pal(8,self.col2)
if self.bv then
pal(self.bt[self.col_cycle_pos],self.col1)
else
pal(11,self.col1)
self.col_cycle_pos=1
end
bw(self)
end
k.init_repairfact=function(self)
self.bs,self.bt=8,{0}
end
bx=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bm.process==2 and not bm.by) pal(7,11)
bw(self)
pal()
end
repair_click=function()
bz(ca,2)
end
cb=function(self)
if ca.id!=35 then
cc"pick target"
cd=true
else
local ce,cf=ca:cg()
local ch=ci(ce,cf)
if ch>=9 and ch<=15 then
ca.life=0
cj(ck[1],ce*8,cf*8,1)
sfx"61"
end
ca=nil
end
end
function bz(self,cl)
self.cm,self.cn=0,self.process
if(self.life>0 and self.cn>0) self.by=not self.by
self.process=cl
end
ck=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1|nil|nil|||||||2|2|nil|1|||100|0|0|1600|0|||||||0|0|0|0|0|0|1|1|aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1|nil|1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||0|0|0|0|0|0|1|1|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1|nil|1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||0|0|0|0|0|0|1|1|uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1|nil|1|||||||2|2|7|4|||50|0|0|200|0|||||||0|0|0|0|0|0|1|1|tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1|nil|1|||||||2|2|1|1|||300|-100|0|800|0||||||10|0|0|0|0|0|0|1|1|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.|init_windtrap|||
6|sPICE rEFINERY|68|174|2|3|2|1|nil|1|||||||2|2|1|1|||400|30|0|1800|0||||||10|0|0|0|0|0|0|1|1|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.|init_refinery|draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1|nil|1|||||||2|2|1|2|||400|30|0|2000|0|||||||0|0|0|0|0|0|1|1|tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1|nil|1|||||||2|2|6|2|||150|5|0|600|0|||||||0|0|0|0|0|0|1|1|tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1|nil|1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||||0|0|0|0|0|0|1|1|tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1|nil|1|||||||2|2|7|2|3||400|10|0|1600|0|||||||0|0|0|0|0|0|1|1|wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1|nil|1|||||||2|2|6|2|||400|20|0|1400|0|||||||0|0|0|0|0|0|1|1|tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1|nil|1|||||||2|2|6|3|||600|20|0|800|0|||||||0|0|0|0|0|0|1|1|tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1|nil|1|||||||2|2|12|5|||500|35|0|1600|0|||||||0|0|0|0|0|0|1|1|tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1|nil|1|||||||2|2|12|5|||700|20|0|800|0||||||4|0|0|0|0|0|0|1|1|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.|init_repairfact|||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5||||0|0|0|0|0|0|1|1|tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28||||0|0|0|0|0|0|1|1|tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1|nil|1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||||0|0|0|0|0|0|1|1|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.|init_refinery|draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1|nil|1|||||||2|2|12|5|||500|40|0|1600|0|||||||0|0|0|0|0|0|1|1|tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1|nil|1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||||0|0|0|0|0|0|1|1|tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||2|100|0.05|2|1|5|1|48|10|0|0|0|0|0|0|1|1|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||4|200|0.05|2|1|5|1|49|10|0|0|0|0|0|0|1|1|iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||4|440|0.1|3|1|5|1|48|10|0|0|0|0|0|0|1|1|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||8|440|0.1|3|1|5|1|49|10|0|0|0|0|0|0|1|1|tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||8|880|0.1|3|1|3|1|49|10|0|0|0|0|0|0|1|1|tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||150|160|0.4|0|1|37.5|1|49|10|0|0|0|0|0|0|1|1|tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||5|440|0.1|1||1.25||||0|0|0|0|0|0|1|1|tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||8|400|0.6|3|1|5||||0|0|0|0|0|0|1|1|tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||10|520|0.5|3|1|5||||0|0|0|0|0|0|1|1|tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||38|800|0.25|4|1|9.5||||0|0|0|0|0|0|1|1|tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||45|1200|0.2|5|1|11.25||||0|0|0|0|0|0|1|1|tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||112|400|0.3|9|2|28||||0|0|0|0|0|0|1|1|tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||||0|0|0|0|0|0|1|1|tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|160|166|1|1|1|4|11|13|||||||2|2|13|7|-3||600||75|20|1|9|2|20||161|5|0|0|0|0|0|0|1|1|tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY MANOUVERABLE~+ FASTEST AIRCRAFT ON~dUNE.||||
35|mcv|176|192|1|1|1|1|11|12|||||0|5|2|2|7|4|||900||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|7|7|1||600||90|440|0.3|8|3|22.5||||0|0|0|0|0|0|1|1|dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|13|8|3||800||60|1600|0.1|7|1|15||||0|0|0|0|0|0|1|1|tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||150|280|0.5|0|20|37.5||||0|0|0|0|0|0|1|1|tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||8|320|0.75|3|1|2||||0|0|0|0|0|0|1|1|tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|13|7|2||750||50|480|0.3|7|2|500||||0|0|0|0|0|0|1|1|tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11|nil|||||||2|2|nil|3|||0||300|4000|0.35|0|30|75||||0|0|0|0|0|0|1|1|tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
80|rEPAIR|19||5|1|1|1|11|nil|||||||1|1|nil|||||||||||||||0|0|0|0|0|0|1|1|||draw_action||action_click
81| |1||5|1|1|1|11|nil|||||||1|1|nil|||||||||||||||0|0|0|0|0|0|1|1|||draw_action||action_click]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
local co=bu(ck,"|","\n")
ck={}
for cp=2,44 do
cq={}
for cr=1,46 do
local ch=co[cp][cr]
if(cr!=2 and cr<42) ch=tonum(ch)
if cr==42 then
cs,ch=bu(ch,"~"),""
for line in all(cs) do
ch=ch.."\n"..line
end
end
cq[co[1][cr]]=ch
end
ck[tonum(co[cp][1])]=cq
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
spr((bm and bm.type==1 and bm.owner==1 or cd) and 1,
self.cv,self.cy)
end
}
for cp=1,2 do
for cf=0,31 do
for ce=0,127 do
local db=nil
local dc=mget(ce,cf)
if cp==1 and dc==1 then
dd,de=ce*8,cf*8
cx,cz,db=dd-56,de-56,ck[1]
elseif cp==2
and dc>=48 then
for df,dg in pairs(ck) do
if(dg.obj_spr!=nil and dg.obj_spr==dc) db=dg break
end
end
if db!=nil then
local dh,di=ce,cf
if(dh>63) di+=31 dh-=64
mset(ce,cf,0)
cj(db,dh*8,di*8)
end
end
end
end
music"7"
dj=0
end
function cj(db,cv,cy,owner,dk)
local dl=dm(db,cv,cy,db.type,nil,k[db.func_init],k[db.func_draw],k[db.func_update],nil)
dl.dn,dl.life=dm(db,109,0,3,dl,nil,nil,k[db.func_onclick]),dp and db.hitpoint/2 or db.hitpoint
dl.owner=dl.owner or owner or dq(cv,cy,dd,de)<75 and 1 or 2
dl.dr,dl.ds=owner or dl.owner,{}
for dg in all(ck) do
local dt=dg.req_faction
if(dg.parent_id!=nil and(dg.parent_id==dl.id or dg.du==dl.id))
and(dt==nil
or(dt>0 and dt==b)
or(dt<0 and-b!=dt))
then
add(dl.ds,
dm(dg,109,0,4,dl,nil,nil,function(self)
if bp then
bm=self
else
bz(self,1)
end
end)
)
end
end
if dl.owner==1 then
dl.dv,dl.col1,dl.col2=b,c,d
else
dl.dv,dl.col1,dl.col2,dl.dn.func_onclick=e,f,g,nil
if(dl.id==19) dw=dl
end
if db.col1 then
dl.col1,dl.col2=db.col1,db.col2
end
if(dl.z>1) dl.owner=0
local dx,dy=flr(cv/8),flr(cy/8)
if db.type==2 then
local dz=(db.id==2 or db.id==3)
for ea=0,db.w-1 do
for eb=0,db.h-1 do
ec(dx+ea,dy+eb,dz and 16 or dl.owner==1 and 149 or 27)
end
end
if(not dz) add(l,dl)
if dl.id==6 and dl.ed==nil then
local ee,ef=eg(dl,(dl.cv+32)/8,(dl.cy+8)/8,eh)
cj(ck[32],ee*8,ef*8,nil,dl)
end
end
if db.type==1 then
if(dl.norotate!=1) dl.ei=flr(rnd"8")*.125
if dl.arms>0 then
dl.ej=function(self)
self.ek,self.el,self.em,self.en,self.eo=4,self.cv+4,self.cy+4,self.ep.cv+self.ep.w/2,self.ep.cy+self.ep.h/2
local eq,er=self.en-self.el,self.eo-self.em
local es=sqrt(eq*eq+er*er)
self.et,self.eu=(eq/es)*2,(er/es)*2
sfx(self.arms<50 and 60 or 58,3)
ev(self)
end
if(dl.id==15 or dl.id==16) ec(dx,dy,149)
else
dl.ew=dk
if(dl.id==32) dl.ex=0
end
add(m,dl)
ey(dl)
end
ev(dl)
return dl
end
function dm(ez,cv,cy,fa,ed,func_init,func_draw,func_onclick)
local fb={
fc=ez,
id=ez.id,
hitpoint=ez.hitpoint,
cv=cv,
cy=cy,
z=ez.z,
fd=cv/8,
fe=cy/8,
type=fa,
ed=ed,
func_onclick=func_onclick,
w=ez.w*8,
h=ez.h*8,
ff=ez.obj_spr,
fg=ez.w,
fh=ez.h,
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
if(self.dv and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.bt then
pal(self.bs,self.bt[self.col_cycle_pos])
end
if self.ei then
if not self.fi or self.fi>.025 then
for cp=1,2 do
if(cp==2 or self.speed>0) fj(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cv,self.cy-(cp==2 and self.z or 0),.25-self.ei,1,self.trans_col,cp==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
rectfill(self.cv-1,self.cy-1,self.cv+16,self.cy+19,0)
local fk=self.type==4 and self or self.ed
local fl=fk.hitpoint
local ch=self.process==1 and 15*(fk.life/100) or 15*(fk.life/fl)
if(fk.life>0 and not bp) rectfill(self.cv,self.cy+17,self.cv+ch,self.cy+18,self.process==1 and 12 or fk.life<fl*.33 and 8 or fk.life<fl*.66 and 10 or 11)
pal(11,fk.icol1) pal(3,fk.icol2)
end
if self.type>2 then
spr(self.ico_spr,self.cv,self.cy,self.ico_w,self.ico_h)
else
bw(self)
end
end
if self.el then
if self.fire_type==1 then
pset(self.el,self.em,rnd"2"<1 and 8 or 9)
else
local fm=self.fire_type==2
fn(self.el,self.em,0,
0,0,
fm and .15 or 2,
-.01,
fm and 20 or 2.5,
self.id==40 and{11} or fm and bu("7,7,10,9,8,2,13,6,7") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.life<self.hitpoint*.33 and self.altframe==nil and rnd"10"<1 and self.type<=2) fn(self.cv+3.5,self.cy+3.5,1,.1,-.02,.05,-.002,80,bu("10,8,9,6,5"),rnd"2"<1 and 0xa5a5.8 or 0)
self.hit=0
end,
fo=function(self)
local life=self.life
self.flash_count=max(self.flash_count-.4,1)
if self.hit>0 then
fp(true)
if(fq==0 or stat(24)>5) fq=1 music"0"
if(self.arms>0 and self.ek==0) fr(self,self.fs)
if(self.obj_spr<=49 and life<100) self.fg,self.fh=0.5,0.5
if(life<50 and self.ek!=7) ft(self,r[self.dr][14] or self.ew)
end
if(self.type<=2 and life<=0 and self.fi==nil) self.ek=5 self.fu=nil self.fi=(self.type==2 and 1 or .5) sfx(self.type==2 and 53 or 54,3) dj+=((self.type==2 or self.id==38) and 0.25 or 0)
if self.fi then
self.fi-=.025
if self.fi<=0 then
if self.type==2 then
for ea=0,self.fg-1 do
for eb=0,self.fh-1 do
ec(self.cv/8+ea,self.cy/8+eb,15)
end
end
del(l,self)
v[self.fs.dr]+=1
else
local fv,fw=self:cg()
if(fw>31) fv+=64 fw-=32
if(ci(fv,fw)<9) ec(fv,fw,20)
if(self.speed==0) ec(fv,fw,15)
del(m,self)
if(self.fs) x[self.fs.dr]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) fx(self.cv+rnd(self.w),self.cy+rnd(self.h))
end
end
if self.framecount!=nil then
self.frame+=1
if self.frame>self.framecount then
self.frame=0
if self.altframe
and self.ek==2 then
self.obj_spr=self.ff+(self.altframe-self.obj_spr)
end
if self.bt then
self.col_cycle_pos+=1
if(self.col_cycle_pos>#self.bt) self.col_cycle_pos=1
end
end
end
if self.el then
self.el+=self.et
self.em+=self.eu
if dq(
self.el,self.em,
self.en,self.eo)<2
then
fx(self.el,self.em,self.fire_type)
local ep=self.ep
if dq(
self.el,self.em,
ep.cv+ep.w/2,
ep.cy+ep.h/2)<4
then
ep.life-=self.arms
ep.hit,ep.fs=self.fire_type,self
if self.id==40 and ep.speed!=nil then
ep.owner,ep.dv,ep.col1,ep.col2=self.owner,self.dv,self.col1,self.col2
ey(self)
elseif ep.fy then
ep.dv,ep.col1,ep.col2,ep.fy=ep.fy,ep.fz,ep.ga,nil
ey(ep)
end
end
self.el=nil
end
end
if self.process>0
and not self.by
and not self.gb then
if self.process==1 and self.spent>self.cost then
self.gb=true
if(self.ed.owner==1) sfx"56"cc("cONSTRUCTION cOMPLETE")
if self.fc.type==1
and self.parent_id!=1 then
local ee,ef=gc(self,self.ed)
cj(self.fc,ee,ef,nil,self.ed)
gd(self)
end
elseif self.process==2 and life>self.hitpoint then
self.process=0
if self.type==1 and self.speed>0 then
k.init_repairfact(self.ge)
self.ek=0
self.cv,self.cy=gc(self,self.ew)
end
else
if self.cm>(self.process==1 and 3 or 100) then
if(gf(-1,self.process==1 and self.ed or self)) self.cm=0 self.spent+=1
else
self.cm+=1
self.life=(self.process==1 and(self.spent/self.cost)*100 or life+.5)
end
end
end
if self.fire_cooldown>0 then
self.fire_cooldown-=.1
end
if(self.id==5) self.name="wINDTRAP (pOWER:"..gg..")"
end,
gh=function(self,cv,cy)
self.cv,self.cy=cv,cy
end,
gi=function(self)
local cv,cy=self:cg()
return cv..","..cy
end,
cg=function(self)
return flr(self.cv/8),flr(self.cy/8)
end
}
for gj,gk in pairs(ez) do
if fb[gj]==nil and gk!=""then
fb[gj]=gk
end
end
if(func_init) func_init(fb)
return fb
end
function gf(gl,fb)
if(gm(j[fb.owner])+gl<0) return false
j[fb.owner]+=sgn(gl)*shr(abs(gl),16)
if(fb.owner==1) sfx"63"
return true
end
function fx(cv,cy,gn)
fn(cv,cy,2,
0,0,.1,0,gn==1 and 5 or 30,bu("5,7,10,8,9,2"),rnd"2"<1 and 0xa5a5.8 or 0)
end
function ev(go)
if(go.owner!=1 and go.ek!=4) return
local gp=go.type==2 and 3 or 2
for ea=-gp,gp do
for eb=-gp,gp do
local gq,gr=flr(go.cv/8)+ea,flr(go.cy/8)+eb
bg[gq][gr]=16
gs(gq,gr)
for er=-1,1 do
for eq=-1,1 do
gs(gq+eq,gr+er)
end
end
end
end
end
function _update60()
gt()
if(not bp) gu()
if u%60==0 then
o={}
if bb then
for cp=0,124,4 do
for ct=0,124,4 do
local ce,cf=cp/2,ct/2
if(cf>=32) ce+=64 cf-=32
local gv=mget(ce,cf)
local gw=sget((gv*8)%128+4,(gv*8)/16)
if(bg[cp/2][ct/2]==16) o[(cp/2/2)..","..(ct/2/2)]=gw!=11 and gw or 15
end
end
end
gg,gx,gy,gz=0,0,false,{0,0}
for df,ha in pairs(l) do
local gq,gr=ha:cg()
if ha.owner==1 or(bb and bg[gq][gr]==16) then
o[flr(ha.cv/2/8)..","..flr(ha.cy/2/8)]=ha.col1
end
if ha.owner==1 then
gg-=ha.power
if(ha.id==7) gy=true
if(sub(ha.name,1,5)=="sPICE") gx+=1000
end
gz[ha.owner]+=1
r[ha.dr][ha.id]=ha
end
if bb then
for df,hb in pairs(m) do
if hb.owner==1 or hc(hb) then
o[flr(hb.cv/2/8)..","..flr(hb.cy/2/8)]=hb.col1
end
r[hb.dr][hb.id]=hb
end
end
bb,fq=(gy and gg>0),2
fp(false)
if(j[3]>0 and j[1]>j[3]) hd=1
if(gz[2]==0 and a>1) hd=2
if(gz[1]==0) hd=3
if hd then
dset(14,hd)
dset(13,t()-s)
dset(10,he)
dset(24,gm(j[2]))
dset(11,x[1])
dset(25,x[2])
dset(12,v[1])
dset(26,v[2])
rectfill(30,54,104,70,0)
?"mission "..(hd<3 and"complete"or"failed"),36,60,c
flip()
load("pico-dune-main")
end
elseif u%60==30 then
n={}
for gj,hb in pairs(m) do
n[hb:gi()]=gj
end
end
u+=1
end
function _draw()
hf()
hg()
end
function gs(cv,cy)
if(cv<0 or cv>#bg or cy<0 or cy>#bg) return
local hh=0
if bg[cv][cy]!=0 then
if(bg[cv][cy-1]>0) hh+=1
if(bg[cv-1][cy]>0) hh+=2
if(bg[cv+1][cy]>0) hh+=4
if(bg[cv][cy+1]>0) hh+=8
bg[cv][cy]=1+hh
end
end
function gt()
hi,hj,hk=stat"32",stat"33",stat"34"
hl,hm,hn=(hk==1 and ho!=hk) or btnp"4",(hk>0) or btn"4",(hk==2 and ho!=hk) or btnp"5"
for gj=0,1 do
if(btn(gj)) y+=gj*2-1
if(btn(gj+2)) ba+=gj*2-1
end
hp,hq=mid(0,hi+y,127),mid(0,hj+ba,127)
cursor.cv,cursor.cy=hp,hq
if not bp then
if(hp<4) cx-=2
if(hp>123) cx+=2
if(hq<4) cz-=2
if(hq>123) cz+=2
cx,cz=mid(cx,384),mid(-8,cz,384)
for df,hb in pairs(m) do
if hb then
if hb.fu and costatus(hb.fu)!="dead"then
assert(coresume(hb.fu,hb))
else
hb.fu=nil
end
if hr
and fget(ci(hb:cg()),2)
and dq(hs,ht,hb.cv,hb.cy)<1
and hb.z==1
then
del(m,hb)
hu=.01
end
end
end
for gj,hv in pairs(q) do
hv.er+=hv.hw
hv.cv+=hv.eq
hv.cy+=hv.er
hv.ei+=hv.hx
hv.life+=1
if(hv.life>=hv.hy) del(q,hv)
end
end
hz()
ho,ca,br=hk,bm,bi
end
function ia(cv,cy)
local ch=ci(cv,cy)
return ch>=2 and ch<=8
end
function ey(hb,ib)
hb.ek,hb.ic=ib or 0,nil
hb.fu=cocreate(function(self)
while true do
if self.z>1 then
ie(self,
mid(flr(self.fd+rnd"32")-16,64),
mid(flr(self.fe+rnd"32")-16,64))
end
if rnd"250"<1 and self.arms>0 and self.ek!=8 then
eg(self,flr(self.cv/8),flr(self.cy/8),
function(hb,cv,cy)
local ep=m[n[cv..","..cy]]
if(ep!=ig and ep.dr!=hb.dr and bg[cv][cy]==16 and ep.z==1) fr(hb,ep) return true
end,
self.range)
elseif self.id==34 then
ih(self)
end
local ew=self.ge or self.ew
if self.id==32 then
if self.ek==0 or self.ek==9 then
if self.ex<=1500
and self.ek!=7 and self.ek!=9 then
self.ge=nil
local ii,ij
local ik,il=self:cg()
if ia(ik,il) and not self.im then
ii,ij=ik,il
else
eg(self,ik,il,
function(hb,cv,cy)
if ia(cv,cy) and rnd"10"<1 then
ii,ij=cv,cy
return true
end
end,
10)
end
if ii and ij then
ie(hb,ii,ij)
if(ia(hb:cg())) hb.ek=6
end
end
elseif self.ex>=1500
and self.ek!=7 then
self.ii,self.ij=self:cg()
ft(self,ew or r[hb.dr][6])
elseif self.ek==6 then
self.im=false
io(hb.cv,hb.cy,hb.ei+.75+rnd".2"-.1)
local ip=hb:gi()
p[ip],self.ex,self.name=(p[ip] or 1000)-1,(self.ex or 0)+.5,"hARVESTER ("..flr(self.ex/1500*100).."% fULL)"
if p[ip]<=0 then
local dx,dy=self:cg()
for eb=-1,1 do
for ea=-1,1 do
ch=ci(dx+ea,dy+eb)
ec(dx+ea,dy+eb,
(ea==0 and eb==0) and 0 or((ch>1 and ch<8) and 8 or ch)
)
end
end
self.ek=0
end
if(self.ex%300==0) self.im=true self.ek=0
end
end
if self.id>26 then
if self.ek==9 then
if ew.life>0 and not ew.iq and self.life>0 then
ew.bv,self.ek,self.ei,self.cv,self.cy=false,8,.25,ew.cv+16,ew.cy+4
if(bm==self) bm=nil
if self.ex and ew.id==6 then
ew.iq=true
while self.ex>0 do
self.ex-=1
if flr(self.ex)%4==0 then
if tonum(he)<gx then
gf(2,self)
else
cc"sPICE LOST. bUILD sILO"
end
end
yield()
end
self.ex,ew.iq,self.ek=0,false,0
if(self.ii) ie(self,self.ii,self.ij,0,true)
else
self.process,self.cm,ew.bs,ew.bt=2,0,8,bu("7,10,0,0,7,0,0")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function gc(fb,ep)
local ee,ef=eg(fb,(ep.cv+8)/8,(ep.cy+16)/8,eh)
return ee*8,ef*8
end
function io(cv,cy,ei)
local ir,is=sin(ei)*5.5,-cos(ei)*5.5
if(rnd"5"<1) fn(cv+ir+3.5,cy+is+3.5,rnd"2",.15,0,.1,-.01,25,bu("2,4,9,15"),0xa5a5.8)
end
function fr(hb,ep)
if hb.id!=19 then
hb.ek,hb.ep=3,ep
hb.fu=cocreate(function(self)
while ep.life>0 do
local it=dq(hb.cv,hb.cy,ep.cv,ep.cy)
if it>hb.range*5
and hb.speed>0 then
ie(hb,flr(ep.cv/8),flr(ep.cy/8),hb.range*5)
if hb.id==25 or hb.id==38 then
hb.life=0
for cp=1,hb.id/3 do
fx(hb.cv+rnd"32"-16,hb.cy+rnd"32"-16,2)
end
ep.life-=(100+rnd"50")
ep.fs=hb
return
end
end
if not hb.norotate then
local iu=atan2(hb.cv-ep.cv,hb.cy-ep.cy)
while(hb.ei!=iu) do
iv(hb,iu)
end
end
if it<=hb.range*5 then
if(hb.fire_cooldown<=0 and not hb.el) hb.ej(hb) hb.fire_cooldown=hb.fire_rate
elseif hb.speed==0 then
ey(hb)
end
yield()
if(hb.id==40 or hb.id==34 or ep.dv==hb.dv) break
end
ey(self)
end)
else
local iw={24,25,38,38}
fr(cj(ck[iw[hb.dv]],hb.cv,hb.cy,hb.owner),ep)
hb.fire_cooldown=1750
end
end
function eg(hb,cv,cy,ix,iy)
for dq=1,iy or 64 do
for ea=cv-dq,cv+dq do
for eb=cy-dq,cy+dq do
if((ea==cv-dq or ea==cv+dq or eb==cy-dq or eb==cy+dq) and(ix(hb,ea,eb))) return ea,eb
end
end
yield()
end
end
function ci(ce,cf)
if(cf>31) ce+=64 cf-=32
return mget(ce,cf)
end
function ec(ce,cf,iz)
if(cf>31) ce+=64 cf-=32
mset(ce,cf,iz)
end
function eh(hb,cv,cy)
return not fget(ci(cv,cy),0)
and n[cv..","..cy]==nil
end
function ie(hb,cv,cy,ja,jb,ib)
local jc=hb.z>1
if jb then
local jd=r and r[hb.dr][33] or false
if jd and not jd.ic then
jd.ic,hb.ic=hb,jd
jd.fu=cocreate(function(je)
ie(je,flr(hb.cv/8),flr(hb.cy/8))
del(m,hb)
ie(jd,cv,cy)
hb:gh(jd.cv,jd.cy)
add(m,hb)
ey(jd)
ey(hb,ib)
end)
return
end
end
::restart_move_unit::
if not jc and not eh(nil,cv,cy) then
cv,cy=eg(hb,cv,cy,eh)
end
hb.ik,hb.il,hb.jf,hb.ek=cv,cy,hb.ek,1
hb.jg=nil
local jh,ji,jj={cv=flr(hb.cv/8),cy=flr(hb.cy/8)},{cv=hb.ik,cy=hb.il},function(jk) return shl(jk.cy,8)+jk.cv end
local jl,
jm={
jn=jh,
jo=0,
jp=jq(jh,ji)
},{}
jm[jj(jh)]=jl
local jr,js,jt,ju,count={jl},1,jj(ji),32767.99,0
while js>0 do
local cost,jv=ju
for cp=1,js do
local jw=jr[cp].jo+jr[cp].jp
if(jw<=cost) jv,cost=cp,jw
end
jl=jr[jv]
jr[jv],jl.jx=jr[js],true
js-=1
local hv=jl.jn
if jj(hv)==jt then
hv={ji}
while jl.jy do
jl=jm[jj(jl.jy)]
add(hv,jl.jn)
end
hb.jg=hv
goto end_pathfinding
end
for jz in all(ka(hv,jc)) do
local id=jj(jz)
local kb=not jc and fget(ci(jz.cv,jz.cy),1) and 4 or 1
if(hv.cv!=jz.cv and hv.cy!=jz.cy) kb+=.2
local kc,kd=
jm[id],
jl.jo+kb
if not kc then
kc={
jn=jz,
jo=ju,
jp=jq(jz,ji)
}
js+=1
jr[js],jm[id]=kc,kc
end
if not kc.jx and kc.jo>kd then
kc.jo,kc.jy=kd,hv
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
hb.jf,hb.ek=hb.ek,2
if hb.jg!=nil then
for cp=#hb.jg-1,1,-1 do
local jk=hb.jg[cp]
if not hb.norotate then
local iu=atan2(
hb.cv-(jk.cv*8),
hb.cy-(jk.cy*8))
while(hb.ei!=iu) do
iv(hb,iu)
end
end
if(not jc and not eh(nil,jk.cv,jk.cy)) goto restart_move_unit
local ke,kf=hb.speed or .5,sqrt((jk.cv*8-hb.cv)^2+(jk.cy*8-hb.cy)^2)
local kg,kh=ke*(jk.cv*8-hb.cv)/kf,ke*(jk.cy*8-hb.cy)/kf
for cp=0,kf/ke-1 do
n[jk.cv..","..jk.cy]=hb
hb.cv+=kg
hb.cy+=kh
yield()
end
hb.cv,hb.cy,n[jk.cv..","..jk.cy]=jk.cv*8,jk.cy*8,hb
ev(hb)
if(dq(hb.cv,hb.cy,hb.ik*8,hb.il*8)<=(ja or 0)) break
end
end
hb.ek=0
end
function hf()
cls"15"
camera(cx+(16-rnd"32")*dj,cz+(16-rnd"32")*dj)
dj=(dj>0.05) and dj*0.95 or 0
if hr then
for cp=1,#hr do
if(cp%2==1) fillp(0xa5a5.8)
circfill(
hr[cp][1]+4,
hr[cp][2]+4,4,
ki[cp%#ki+1])
fillp()
end
if(hu>0) spr(88+hu,hs,ht)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for df,ha in pairs(l) do
if not bp then
ha:fo()
if(ha.bq) ha.bq:fo()
end
ha:da()
if(ha==bm) rect(bm.cv,bm.cy,bm.cv+bm.w-1,bm.cy+bm.h-1,7)
end
pal()
for hv=1,2 do
for df,hb in pairs(m) do
if(hv==1 and hb.z==1) or(hv==2 and hb.z>1) then
if(not bp) hb:fo()
if(hb.process!=2 or hb.speed==0) hb:da()
if(hb==bm) spr(17,bm.cv,bm.cy)
end
end
end
for gj,hv in pairs(q) do
if(hv.kj) fillp(hv.kj)
circfill(hv.cv,hv.cy,hv.ei,hv.kk[flr((#hv.kk/hv.hy)*hv.life)+1])
fillp()
end
local kl,km=flr(cx/8),flr(cz/8)
palt(0,false)
palt(11,true)
for ea=kl-1,kl+16 do
for eb=km-1,km+16 do
if bg[ea][eb]!=0 and bg[ea][eb]!=16 then
spr(bg[ea][eb]+31,ea*8,eb*8)
elseif bg[ea][eb]<16 then
rectfill(ea*8,eb*8,ea*8+7,eb*8+7,0)
end
end
end
end
function cc(kn)
be,bf=kn,500
end
function hg()
camera(0,0)
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,125,125,c)
rect(91,91,124,124,d)
rectfill(92,92,123,123,0)
if(bf>0) bf-=1 print(be,2,2)
he=gm(j[1])
? sub("000000",#he+1)..he,103,2,d
if bb!=bd then
bc,ko=bb and 1 or 59,bb and 1 or-1
if(ko<1) cc("pOWER LOW.bUILD wINDTRAP")
sfx"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=ko
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
for ea=0,31 do
for eb=0,31 do
if(o[ea..","..eb]) pset(92+ea,92+eb,o[ea..","..eb])
end
end
local ir,is=92+cx/16,92+cz/16
rect(ir,is,ir+7,is+7,7)
if bm and bm.dn then
bm.dn:gh(109,20)
bm.dn:da()
kp,kq=nil,nil
if bm.owner==1 then
if bm.bq then
bm.bq:gh(109,44)
bm.bq:da()
end
if bm.life<bm.hitpoint
and bm.id!=4
and(bm.type==2
or bm.speed==0) then
kp=dm(ck[80],117,28,5,{},nil,bx,repair_click)
kp:da()
end
if(bm.id==19
and bm.fire_cooldown<=0)
or bm.id==35
then
kq=dm(ck[81],109,29,5,{},nil,bx,cb)
kq:da()
end
end
end
pal()
if bm
and bm.bq
and(bm.bq.type==4
or bm.bq.speed==0)
and bm.bq.life>=100 then
local kr,ks=flr((cursor.cv+cx)/8),flr((cursor.cy+cz)/8)
local kt,ku,w,h=kr*8-cx,ks*8-cz,bm.bq.fg,bm.bq.fh
kv,kw,dp=false,false,false
for ea=-1,w do
for eb=-1,h do
local ch=ci(kr+ea,ks+eb)
if ea==-1 or ea==w or eb==-1 or eb==h then
if(ch==16 or ch>=58) kv=true
else
if(ch>=9 and ch<=15) dp=true
if(n[kr+ea..","..ks+eb] or ch==0 or ch<8 or ch>16) kw=true
end
end
end
if(kw) kv=false
fillp("0b1110110110110111.1")
rectfill(kt,ku,
kt+bm.bq.w,ku+bm.bq.h,kv and 11 or 8)
fillp()
end
if bp then
fillp(0xA5A5.8)
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,d)
rect(4,23,123,94,c)
if bm.ds then
bm.bn={}
rectfill(6,25,27,92,0)
local kx=1
for cp=1,#bm.ds do
local ky=bm.ds[cp]
if ky.req_id==nil
or r[bm.dr][ky.req_id]
and ky.req_level<=a
then
bm.bn[kx]=ky
if kx>=bh and kx<=bh+2 then
ky:gh(9,28+(kx-bh)*19)
ky:da()
else
ky:gh(-16,16)
end
bi=bi or bm.bn[1]
if bi==ky then
bl=kx
rect(ky.cv-2,ky.cy-2,
ky.cv+17,ky.cy+17,
7)
? bi.name,30,26,7
?"cOST:"..bi.cost,85,33,9
? bi.description,30,34,6
end
kx+=1
end
end
end
pal()
for df,kz in pairs(bj) do
kz:da()
end
end
palt(11,true)
cursor:da()
end
function bk(cv,cy,la,func_onclick,lb)
add(bj,{
cv=cv,
cy=cy,
w=lb or#la*4+2,
h=8,
la=la,
cu=function(self)
return self
end,
da=function(self)
if(#la>1) rectfill(self.cv,self.cy,self.cv+self.w,self.cy+self.h,self.lc and c or 6)
? self.la,self.cv+2,self.cy+2,(#la>1) and 0 or(self.lc and c or 6)
end,
func_onclick=func_onclick
})
end
function bw(fb)
spr(fb.obj_spr,fb.cv,fb.cy,fb.fg,fb.fh)
end
function hz()
ld=false
if bm then
cw=true
le(kp)
le(kq)
if(bm.dn and not bp and not ld) le(bm.dn) le(bm.bq)
if(bp) foreach(bm.ds,le) foreach(bj,le)
cw=false
end
if not bp
and not ld then
foreach(m,le)
foreach(l,le)
end
if hm
and not bp
and hp>89 and hp<122
and hq>90 and hq<123 then
cx,cz=mid(0,(hp-94)*16,400),mid(-8,(hq-94)*16,400)
bm=ca
elseif hl then
if(bm) cc(bm.name)
if ld then
if(not bp and bm.func_onclick and bm.ed!=nil) bm:func_onclick() bm=ca return
if(bp and bi.la and bi.func_onclick) bi:func_onclick()
if(bm.owner==1 and bm.type==1 and bm!=ca and bm.speed>0) sfx"62"
if(bm.dr==2 and ca and(ca.type==1 or(ca.id==19 and cd)) and ca.owner==1) bm.flash_count=10 fr(ca,bm) bm=nil r={{},{}}
else
if bm
and bm.owner==1
and bm.speed>0
and bm.ek!=7 then
bm.fu=cocreate(function(hb)
ie(hb,flr((cx+hp)/8),flr((cz+hq)/8))
ey(hb)
end)
end
if bm
and bm.bq
and bm.bq.life>=100
and kv then
cj(bm.bq.fc,
flr((cursor.cv+cx)/8)*8,
flr((cursor.cy+cz)/8)*8,1)
gd(bm.bq)
sfx"61"
end
if(not bp) bm=nil
end
cd=false
elseif hn and not bp then
bm,cd=nil,false
end
end
function gd(fb)
fb.life,fb.process,fb.spent,fb.gb=0,0,0,false
end
function le(fb)
if(fb==nil) return
local lf,lg=cursor:cu(),fb:cu()
fb.lc=lf.cv<lg.cv+lg.w and
lf.cv+lf.w>lg.cv and
lf.cy<lg.cy+lg.h and
lf.cy+lf.h>lg.cy
if hl and fb.lc then
if bp then
bi=fb
else
if(fb.type<=2 and bg[flr((cursor.cv+cx)/8)][flr((cursor.cy+cz)/8)]!=16 or fb.ek==8) return
if bm
and(fb.id==6 and bm.id==32
or fb.id==14 and bm.id>26)
and fb.owner==1
then
ft(bm,fb)
return
else
bm=fb
end
end
ld=true
end
end
function ft(hb,lh)
lh=lh or r[hb.dr][1]
hb.ek,lh.bv,hb.ge=7,true,lh
if(hb.id!=32 or lh.id==6) hb.ew=lh
hb.fu=cocreate(function(hb)
ie(hb,(lh.cv+16)/8,lh.cy/8,0,true,9)
if(hb.ic==nil) ey(hb,9)
end)
end
li=0
function gu()
if t()>i and t()%i*2==0 then
local lj=rnd(m)
if lj.owner==2 and lj.arms>0 and lj.ek==0 then
ih(lj)
end
local lk=rnd(l)
if lk.owner==2 then
if lk.bq and lk.bq.fc.type==1 and lk.bq.process!=1 then
local ll=rnd(lk.ds)
lk.bq=ll
ll:func_onclick()
end
if lk.life<lk.hitpoint and lk.process!=2 then
bz(lk,2)
end
end
if lm and lm.type==2
and dw and dw.fire_cooldown<=0 then
fr(dw,lm)
end
end
li-=1
if li<0 then
if hr then
hr=nil
else
hr,ln,lo,ki,hu={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lp=rnd"5000"
li=lp
end
if hr then
if(u%6<1 or#hr<30) and hu==0 then
while#hr<31 do
if(rnd"9"<.5) lo=rnd".04"-.02
hs,ht=hr[#hr][1],hr[#hr][2]
add(hr,{hs+sin(ln),ht-cos(ln)})
ln+=lo
end
end
if(#hr>30) del(hr,hr[1])
if(hu>0) hu+=.01 io(hs,ht,rnd"1")
if(hu>2) hu=0
end
end
function ih(fb)
local lm=lq(fb)
if(lm and hc(lm)) fr(fb,lm)
end
function lq(fb)
local lr
repeat
lr=(rnd"4"<1) and rnd(m) or rnd(l)
until lr.dr!=fb.dr
return lr
end
function hc(fb)
local cv,cy=fb:cg()
return bg[cv][cy]==16
end
function fp(lt)
local ch=peek(0x3115)
if((band(ch,128)>0)!=lt) ch=bxor(ch,128)
poke(0x3115,ch)
end
function gm(ch)
local lu,gk="",abs(ch)
repeat
lu=(gk%0x0.000a/0x.0001)..lu
gk/=10
until gk==0
if(ch<0) lu="-"..lu
return lu
end
function bu(lv,es,lw)
es=es or","
if(lw~=nil) lv=split(lv,lw)
if type(lv)=="table"then
local t={}
while#lv>0 do
local lu=lv[1]
add(t,split(lu,es))
del(lv,lu)
end
return t
else
return split(lv,es)
end
end
function fj(ii,ij,cv,cy,iu,w,lx,ly)
local lz,ma=cos(iu),sin(iu)
local mb,mc,hh=lz,ma,shl(0xfff8,(w-1))
w*=4
lz*=w-0.5
ma*=w-0.5
local md,me,w=ma-lz+w,-lz-ma+w,2*w-1
for mf=0,w do
local mg,mh=md,me
for mi=0,w do
if band(bor(mg,mh),hh)==0 then
local mj=sget(ii+mg,ij+mh)
if(mj!=lx) pset(cv+mf,cy+mi,ly or mj)
end
mg-=mc
mh+=mb
end
md+=mb
me+=mc
end
end
function dq(mk,ml,mm,mn)
return abs(sqrt(((mk-mm)/1000)^2+((ml-mn)/1000)^2)*1000)
end
function iv(hb,mo)
local gl=mo-hb.ei
if(hb.z>1) hb.ei=mo
if gl>0.5 then
gl-=1
elseif gl<-0.5 then
gl+=1
end
if gl>0.0087 then
hb.ei+=0.0087
elseif gl<-0.0087 then
hb.ei-=0.0087
else
hb.ei=mo
end
yield()
end
function ka(jk,jc)
local mp={}
for ea=-1,1 do
for eb=-1,1 do
if(ea!=0 or eb!=0) mq(jk.cv+ea,jk.cy+eb,mp,jc)
end
end
return mp
end
function mq(mr,ms,mt,jc)
if(jc or not fget(ci(mr,ms),0) and n[mr..","..ms]==nil and mr>=0 and ms>=0 and mr<=63 and ms<=63) add(mt,{cv=mr,cy=ms})
end
function jq(iu,mu)
return abs(iu.cv-mu.cv)+abs(iu.cy-mu.cy)
end
function fn(cv,cy,ei,eq,er,hx,hw,life,kk,kj)
local hv={
cv=cv,cy=cy,ei=ei,eq=eq,er=er,hx=hx,
life=0,hw=hw,
kk=kk,kj=kj,
mv=cy,hy=life
}
add(q,hv,1)
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
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfffb1ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df4aa14ff559999999555765
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
bbbbbbbbbbbbbbbbffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
bb676bbbbb676bbbffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
bbb7bbbbbbb7bbbbffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
bb676bbbb6e6e6bbffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
7e777e7bbb676bbbff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
bbb7bbbbbbb7bbbbff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
bbbcbbbbbbbcbbbbff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
bbbbbbbbbbbbbbbbf7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
bb0ee0bb00000000f7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
bb5c65bb00000000f76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
bb0c60bb00000000fddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
bb5c75bb00000000ffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
bbbc7bbb00000000fffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
bb0cc0bb00000000fffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
bb5dd5bb00000000fffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
bb0cc0bb00000000ffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
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

__gff__
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
161600000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000121212121200000000000000000000001515161616000000000000000000000000090a0a0d0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
1600000a0a0000000000000000000000160000000000000000000000000000000000000000000000001212000000001212000000001200120000000000000015161200020508000005050002050803000d0e05000400000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000a0a0a003d001616160000000000001200000008030300000000000000000000000000000000001212121212120000000000001200000203030300000016020503030303030303030303030303030608080000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212126c0a0a0a1616161600420a000012120000000203030303000000000000000000000000000000000000000012000000120002050803030303030303030000020303030703030303030303070303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212160a0a0a0000165785850a0a001200020508030303030303000000000000000000000000000000000000000000000000020503030303030303030303030000000012121212000806000008060800120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212003a10100c830a856e0a600a000205030303030303030642000000000000000000000000000000000000000000000000020303030703030303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212161010100a0a0a850a0a0a0a000203030307030303060000000000120000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
120000101010420a0a47420a6c00000006030303030306000000121212000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12123d0a0a0a0a0a0d850a0a0e0000121200650a0a0a0a0b00001200000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0d0e0047010a00001244090c0a0a0a0a0a0a0b12120000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0e0d160057850a0a0c00120a0a0a1718190a0a0a0a12000000000000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120d0e1212161685420a10620c0c680a0a1d1e1b190a0a0a0c0a0b0000000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212120012121216850a0a100a0a0a0a0a0a17191e1c0a0a0a0a0a0a0000001200000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121236330057854785576a0a5785571d1e1e1f0a0a0a0a0a0a42000012000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212000000000000000000850a0a8500000d0d0d0d0d0d0d0d0d0d0d121212000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000004900005747475700360000000000001200001212120000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
001212001212b000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
000012000000000c0a0c00000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
12120000000000090a0a0c000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000000090a0a0b000000020303040000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000090a00121200000303030400000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012123400000d0c121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000090a0c0b0c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200a000000000090a0a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0a0a0a0a0c00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121200000000000000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a0a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a0a1e1e1b1b1c0a6000000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d620a0a0a1a1b1c1f0a0a0a0c0000000002060600000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600003000003000000d0a0a0a1d1e1f0a650a0a0a0a0c000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000370034000000090a0a0a0a0a0a0a0a0a0a0a0e0000000000000000000000000000000000000000000000000000000000000000000000000016161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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

