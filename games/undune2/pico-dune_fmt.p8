pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- undune ii
-- by paul nicholas
cartdata("pn_undune2")
a,b,c,d=dget"0",dget"1",dget"7",dget"8"
e,f={},
{
dget"35">>16,
500>>16,
dget"36">>16
}
for g=1,dget"5"do
local h={}
for i=1,5 do
h[i]=dget(g*5+i)
end
add(e,h)
end
j,k,l,m,n,o,p,q,r,s,u,v,w,x,y,z,ba,bb,bc={},{},{},{},{},{},{},{{},{}},t(),0,{0,0},{0,0},0,0,false,0,"",0,{}
bd=y
j.factory_click=function(self)
be,bf,bg=1,nil,{}
bh(6,"⬆️",function()
bi=mid(1,bi-1,#bj.bk)
bf=bj.bk[bi]
if(bi<be) be-=1
end,10)
bh(17,"⬇️",function()
local bl=#bj.bk
if(bi<bl) bi=mid(1,bi+1,bl)
bf=bj.bk[bi]
if(bi>be+2) be=min(be+1,bl-2)
end,10)
bh(32,"build",function()
bm=nil
bn:func_onclick()
end)
bh(96,"close",function()
bm=nil
end)
bm=self
end
j.draw_refinery=function(self)
local col2=self.col2
pal{
[8]=col2,
[10]=col2,
[11]=col2,
[12]=self.col1,
[14]=self.col2
}
if self.bo then
pal(self.col_cycle[self.col_cycle_pos],self.col1)
else
pal(11,self.col1)
self.col_cycle_pos=1
end
end
draw_action=function(self)
pal(7,8)
if(self.id==80 and bj.process==2 and not bj.bp) pal(7,11)
end
repair_click=function()
bq(br,2)
end
bs=function(self)
if br.id!=35 then
bt"pick target"
bu=true
else
local bv,bw=br:bx()
local by=bz(bv,bw)
if by>=12 and by<=22 then
br.life=0
ca(cb[1],bv*8,bw*8,1)
cc"61"
end
br=nil
end
end
function bq(self,cd)
self.ce,self.cf,self.process=0,self.process,cd
if(self.life>0 and self.cf>0) self.bp=not self.bp
if(cd==1) self.cg.bo=true self.cg.ch=self
end
cb=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|fire_sfx|death_sfx|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|storage|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|22|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|22|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||||0|0|0|0|0|0|1|1||0||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||53||164||0|0|0|0|0|0|1|1||0||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0|||||53|||10|0|0|0|0|0|0|1|1|11|0|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|5|1|||400|30|0|1800|0|||||53|||15|0|0|0|0|0|0|1|1|11|1000|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|5|2|||400|30|0|2000|0|||||53||||0|0|0|0|0|0|1|1||0||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||53||||0|0|0|0|0|0|1|1||1000||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||53||||0|0|0|0|0|0|1|1||0||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||53||||0|0|0|0|0|0|1|1||0||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0|||||53|||4|0|0|0|0|0|0|1|1|8|0|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5|58|53||||0|0|0|0|0|0|1|1||0||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28|60|53||||0|0|0|0|0|0|1|1||0||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||53|||15|0|0|0|0|0|0|1|1|11|0|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||53||||0|0|0|0|0|0|1|1||0||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||53||||0|0|0|0|0|0|1|1||0||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||8|80|0.05|2|1|2|60|57|1|48|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||16|200|0.05|2|1|5|60|57|1|49|10|0|0|0|0|0|0|1|1||0||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||16|180|0.1|6|2|12|58|57|1|48|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||32|440|0.1|6|2|24|58|57|1|49|10|0|0|0|0|0|0|1|1||0||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||64|880|0.1|3|1|3|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||600|160|0.4|0|1|150|60|57|1|49|10|0|0|0|0|0|0|1|1||0||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||20|440|0.1|1|2|5|58|57||||0|0|0|0|0|0|1|1||0||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||32|400|0.6|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||40|520|0.5|3|1|5|60|54||||0|0|0|0|0|0|1|1||0||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||152|800|0.25|4|1|38|58|54||||0|0|0|0|0|0|1|1||0||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||180|1200|0.2|5|1|45|58|54||||0|0|0|0|0|0|1|1||0||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||448|400|0.3|9|2|112|58|54||||0|0|0|0|0|0|1|1||0||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||54||||0|0|0|0|0|0|1|1||0||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|40|160|1|1|1|4|11|13|17||||||2|2|18|7|-3||600||300|20|1|9|2|20||54||41|5|0|0|0|0|0|0|1|1||0||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|38|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||54||||0|0|0|0|0|0|1|1||0||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|18|7|1||600||360|440|0.3|8|3|90|52|54||||0|0|0|0|0|0|1|1||0||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|18|8|3||800||240|1600|0.1|7|1|60|58|54||||0|0|0|0|0|0|1|1||0||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||600|280|1|0|20|150|59|54||||0|0|0|0|0|0|1|1||0||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||32|320|0.75|3|1|8|60|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|18|7|2||750||50|480|0.3|7|2|500|59|54||||0|0|0|0|0|0|1|1||0||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||1200|4000|0.35|0|30|300|50|||||0|0|0|0|0|0|1|1||0||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|32||1|1|1|1|11|||2|||||1|1|||||||0|4|0|||||53|1|||0|0|0|0|0|0|1|1||0||||||
80|rEPAIR|3|3|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||draw_action||action_click
81|lAUNCH|1|1|5|1|1|1|11||||||||1|1|||||||0|0||||||||||0|0|0|0|0|0|1|1||0||||draw_action||action_click]]
function _init()
poke(0x5f2d,0x5)
menuitem(1,"exit to title",function()
load"pico-dune-main"
end)
local ci=cj(cb,"|","\n")
cb={}
for g=2,45 do
local ck={}
for i=1,51 do
local by=ci[g][i]
if(i!=2 and i<46) by=tonum(by)
if i==47 then
cl,by=cj(by,"~"),""
for line in all(cl) do
by..="\n"..line
end
end
ck[ci[1][i]]=by
end
cb[tonum(ci[g][1])]=ck
end
for g=-2,66 do
bc[g]={}
for cm=-2,66 do
bc[g][cm]=0
end
end
cursor={
w=8,
h=8,
cn=function(self)
return{
co=self.co+(not cp and cq or 0)+2,
cr=self.cr+(not cp and cs or 0)+1,
w=1,
h=1
}
end,
ct=function(self)
spr((bj and bj.type==1 and bj.owner==1 or bu) and 1,
self.co,self.cr)
end
}
for bw=0,31 do
for bv=0,127 do
local cu=nil
local cv=mget(bv,bw)
if(cv==1) cq,cs,cu=e[1][4]-56,e[1][5]-56,cb[1]
for cw in all(cb) do
if(cw.obj_spr!=nil and cw.obj_spr==cv) cu=cw break
end
if cu!=nil and(cv==1 or cv>=32) then
local cx,cy=bv,bw
if(cx>63) cy+=32 cx-=64
mset(bv,bw,bz(bv,bw+1))
ca(cu,cx*8,cy*8)
end
end
end
cz=cocreate(function()
while true do
if s%30==0 then
da"false"
m={}
for db in all(l) do
m[db:dc()]=db
end
dd={}
if y then
for g=0,62,2 do
for cm=0,62,2 do
local de=bz(g,cm)*8
if(bc[g][cm]==16) dd[(g/2)..","..(cm/2)]=de>0 and sget(de%128+3,de\8\16*8+3) or 15
end
yield()
end
end
df,dg,dh,di,q=0,0,false,{0,0},{{},{}}
for dj in all(k) do
if dj.owner==1 or(y and dk(dj)) then
dd[(dj.co\2\8)..","..dj.cr\2\8]=dj.col1
end
if dj.owner==1 then
df-=dj.power
if(dj.id==7) dh=true
dg+=dj.storage
end
di[dj.owner]+=1
dl(q[dj.dm],dj.id,dj)
end
for db in all(l) do
if y and(db.owner==1 or dk(db) and db.z==1) then
dd[(db.co\2\8)..","..db.cr\2\8]=db.col1
end
if(db.dm>0) dl(q[db.dm],db.id,db)
end
y,dn,n=(dh and df>0),2,dd
if(f[3]>0 and f[1]>f[3]) dp=1
if(di[2]==0 and a>1) dp=2
if(di[1]==0) dp=3
if dp then
local dq=40
for dr in all{dp,t()-r,ds,dt(f[2]),v[1],v[2],u[1],u[2]} do
dset(dq,dr)
dq+=1
end
rectfill(30,54,104,70,0)
flip()
load("pico-dune-main")
end
end
yield()
end
end)
music"7"
du=0
end
function ca(cu,co,cr,owner,dv)
local dw=dx(cu,co,cr,cu.type,nil,j[cu.func_init],j[cu.func_draw],j[cu.func_update],nil)
dw.dy,dw.life=dx(cu,109,0,3,dw,nil,nil,j[cu.func_onclick]),dz and cu.hitpoint/2 or cu.hitpoint
dw.owner=dw.owner or owner
if not dv then
if not dw.owner then
local ea=9999
for g=1,#e do
local eb=ec(co,cr,e[g][4],e[g][5])
if(eb<ea) dw.ed,dw.owner,ea=g,min(g,2),eb
end
else
dw.ed,h=1,e[1]
end
else
dw.ed=dv.ed
end
dw.dm,dw.ee,h=owner or dw.owner,{},e[dw.ed or dv.ed]
ef=h[1]
dw.eg,dw.col1,dw.col2=ef,h[2],h[3]
for cw in all(cb) do
local eh=cw.req_faction
if(cw.parent_id!=nil and(cw.parent_id==dw.id or cw.parent2_id==dw.id))
and(not eh
or(eh>0 and eh==ef)
or(eh<0 and-ef!=eh))
then
add(dw.ee,
dx(cw,109,0,4,dw,nil,nil,function(self)
if bm then
bj=self
else
bq(self,1)
end
end)
)
end
end
if dw.owner>1 then
dw.dy.func_onclick=nil
end
if cu.col1 then
dw.col1,dw.col2=cu.col1,cu.col2
end
if(dw.z>1) dw.owner=0
local ei,ej=co\8,cr\8
if cu.type==2 then
local ek=cu.obj_spr==22
for el=0,cu.w-1 do
for em=0,cu.h-1 do
en(ei+el,ej+em,ek and 22 or dw.owner==1 and 81 or 103)
end
end
if(not ek) add(k,dw)
if dw.id==6 and not dw.cg then
eo(dw)
end
else
dw.ep=dw.norotate!=1 and flr(rnd"8")*.125
if dw.arms>0 then
dw.eq=function(self)
self.er,self.es,self.et,self.eu,self.ev=4,self.co+4,self.cr+4,self.ew.co+self.ew.w/2,self.ew.cr+self.ew.h/2
local ex,ey=self.eu-self.es,self.ev-self.et
local ez=sqrt(ex*ex+ey*ey)
self.fa,self.fb=(ex/ez)*2,(ey/ez)*2
cc(self.fire_sfx)
fc(self)
end
if(dw.speed==0) en(ei,ej,21)
else
if(dw.id==32) dw.fd=0
dw.fe=dv
end
add(l,dw)
ff(dw)
end
fc(dw)
return dw
end
function dx(fg,co,cr,fh,cg,func_init,func_draw,func_onclick)
local fi={
fj=fg,
id=fg.id,
hitpoint=fg.hitpoint,
co=co,
cr=cr,
z=fg.z,
fk=co/8,
fl=cr/8,
type=fh,
cg=cg,
func_onclick=func_onclick,
w=fg.w*8,
h=fg.h*8,
fm=fg.obj_spr,
fn=fg.w,
fo=fg.h,
col_cycle=cj(fg.col_cycle),
cn=function(self)
return{
co=self.co,
cr=self.cr,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
ct=function(self)
local co=self.co
local cr=self.cr
local fp=self.type
if fp>2
or(co+self.w>=cq
and co<=cq+127
and cr+self.h>=cs
and cr<cs+127+self.z)
then
pal()
palt(0,false)
if(self.trans_col and fp<=2 or fp>=5) palt(self.trans_col,true)
if(self.eg and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if fp>2 and fp<5 then
local fq=fp==4 and self or self.cg
rectfill(co-1,cr-1,co+16,cr+19,0)
local fr=fq.hitpoint
local by=self.process==1 and 15*(fq.life/100) or 15*(fq.life/fr)
if(fq.life>0 and not bm) rectfill(co,cr+17,co+by,cr+18,self.process==1 and 12 or fq.life<fr*.33 and 8 or fq.life<fr*.66 and 10 or 11)
pal(11,fq.icol1) pal(3,fq.icol2)
end
if self.col_cycle then
pal(self.col_cycle_src,self.col_cycle[self.col_cycle_pos])
end
if(func_draw) func_draw(self)
if self.ep then
if not self.fs or self.fs>.025 then
ft(self.obj_spr%16*8,self.obj_spr\16*8,co,cr,.25-self.ep,1,self.trans_col,self.z,flr(self.flash_count)%2==0 and 7 or nil)
end
else
if fp>2 then
spr(self.ico_spr,co,cr,self.ico_w,self.ico_h)
else
fu(self)
end
end
if self.es then
if self.fire_type==1 then
pset(self.es,self.et,rnd"2"<1 and 8 or 9)
else
local fv=self.fire_type==2
fw(self.es,self.et,0,
0,0,
fv and .15 or 2,
-.01,
fv and 20 or 2.5,
self.id==40 and{11} or fv and cj("7,7,10,9,8,2,13,6,7") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.life<self.hitpoint*.33 and not self.altframe and rnd"10"<1 and fp<=2) fw(self.co+3.5,cr+3.5,1,.1,-.02,.05,-.002,80,cj("10,8,9,6,5"),rnd"2"<1 and 0xa5a5.8 or 0)
self.hit=0
end
end,
fx=function(self)
local life=self.life
local fp=self.type
self.flash_count=max(self.flash_count-.4,1)
if self.hit>0 and self.dm>0 then
da"true"
if(dn==0 or stat(24)>5) dn=1 music"0"
if(self.arms>0 and self.er==0) fy(self,self.fz)
if(self.obj_spr<=49 and life<100) self.fn,self.fo=0.5,0.5
if(life<50 and self.er!=7) ga(self,gb(q[self.dm][14]) or self.fe)
end
if(fp<=2 and life<=0 and not self.fs) self.er=5 self.gc=nil self.fs=(fp==2 and 1 or .5) cc(self.death_sfx) du+=((fp==2 or self.id==38) and 0.25 or 0)
if self.fs then
self.fs-=.025
if self.fs<=0 then
if fp==2 then
for el=0,self.fn-1 do
for em=0,self.fo-1 do
en(self.co/8+el,self.cr/8+em,21)
end
end
del(k,self)
u[self.fz.dm]+=1
else
local gd,ge=self:bx()
if(bz(gd,ge)<9) en(gd,ge,33)
if(self.id<=16) en(gd,ge,21)
if(self.fe) self.fe.bo=false
gf(self)
if self.id==42 then
gg(self,gd,ge,
function(db,co,cr)
if(bz(co,cr)==0) en(co,cr,10)
end,
4,true)
end
if(self.fz) v[self.fz.dm]+=1
end
if(bj==self) bj=nil
else
if(rnd(fp==2 and 2 or 8)<1) gh(self.co+rnd(self.w),self.cr+rnd(self.h))
end
end
if self.framecount!=nil then
self.frame+=1
if self.frame>self.framecount then
self.frame=0
if self.altframe
and self.er==2 then
self.obj_spr=self.fm+(self.altframe-self.obj_spr)
end
if self.col_cycle then
self.col_cycle_pos+=1
if(self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
end
end
end
if self.es then
self.es+=self.fa
self.et+=self.fb
if ec(
self.es,self.et,
self.eu,self.ev)<2
then
gh(self.es,self.et,self.fire_type)
local ew=self.ew
if ec(
self.es,self.et,
ew.co+ew.w/2,
ew.cr+ew.h/2)<4
then
ew.life-=self.arms
ew.hit,ew.fz=self.fire_type,self
if self.id==40 and ew.speed!=nil then
ew.owner,ew.eg,ew.col1,ew.col2=self.owner,self.eg,self.col1,self.col2
ff(self)
elseif ew.gi then
ew.eg,ew.col1,ew.col2,ew.gi=ew.gi,ew.gj,ew.gk,nil
ff(ew)
end
end
self.es=nil
end
end
if self.process>0
and not self.bp
and not self.gl then
if self.process==1 and self.spent>self.cost then
self.gl=true
if(self.cg.owner==1) cc"56"bt("cONSTRUCTION cOMPLETE")
if self.fj.type==1
and self.parent_id!=1 then
local gm,gn=go(self.cg)
ca(self.fj,gm,gn,self.cg.owner,self.cg)
gp(self)
end
elseif self.process==2 and life>self.hitpoint then
self.process=0
if fp==1 and self.speed>0 then
self.gq.col_cycle={0}
self.er=0
self.co,self.cr=go(self)
end
else
if self.ce>(self.process==1 and 3 or 100) then
if(gr(-1,self.process==1 and self.cg or self)) self.ce=0 self.spent+=1
else
self.ce+=1
self.life=(self.process==1 and(self.spent/self.cost)*100 or life+.5)
end
end
end
if self.fire_cooldown>0 then
self.fire_cooldown-=.1
end
if(self.id==5) self.name="wINDTRAP (pOWER:"..df..")"
end,
gs=function(self,co,cr)
self.co,self.cr=co,cr
end,
dc=function(self)
local co,cr=self:bx()
return co..","..cr
end,
bx=function(self)
return self.co\8,self.cr\8
end
}
for gt,gu in pairs(fg) do
if not fi[gt] and gu!=""then
fi[gt]=gu
end
end
if(func_init) func_init(fi)
return fi
end
function gr(gv,fi)
if(dt(f[fi.owner])+gv<0) return false
f[fi.owner]+=sgn(gv)*(abs(gv)>>16)
if(fi.owner==1) sfx"63"
return true
end
function gh(co,cr,gw)
fw(co,cr,2,
0,0,.1,0,gw==1 and 5 or 30,cj("5,7,10,8,9,2"),rnd"2"<1 and 0xa5a5.8 or 0)
end
function fc(gx)
if(gx.owner<=0 or gx.id==42) return
local gy=gx.type==2 and 3 or 2
for el=-gy,gy do
for em=-gy,gy do
local gz,ha=gx.co\8+el,gx.cr\8+em
bc[gz][ha]=16
hb(gz,ha)
for ey=-1,1 do
for ex=-1,1 do
hb(gz+ex,ha+ey)
end
end
end
end
end
function _update60()
hc,hd,he=stat"32",stat"33",stat"34"
hf,hg,hh=(he==1 and hi!=he) or btnp"4",(he>0) or btn"4",(he==2 and hi!=he) or btnp"5"
for gt=0,1 do
if(btn(gt)) w+=gt*2-1
if(btn(gt+2)) x+=gt*2-1
end
hj,hk=mid(0,hc+w,127),mid(0,hd+x,127)
cursor.co,cursor.cr=hj,hk
if not bm then
if(hj<4) cq-=2
if(hj>123) cq+=2
if(hk<4) cs-=2
if(hk>123) cs+=2
cq,cs=mid(cq,368),mid(-8,cs,368)
for db in all(l) do
if db then
if(db.gc) hl,hm=coresume(db.gc,db)
if(not hl) db.gc=nil
if hn
and fget(bz(db:bx()),2)
and ec(ho,hp,db.co,db.cr)<1
and db.z==1
then
gf(db)
hq=.01
cc"50"
end
end
end
for hr in all(p) do
hr.ey+=hr.hs
hr.co+=hr.ex
hr.cr+=hr.ey
hr.ep+=hr.ht
hr.life+=1
if(hr.life>=hr.hu) del(p,hr)
end
hv()
assert(coresume(cz))
end
hw()
hi,br,bn=he,bj,bf
s+=1
end
function gf(db)
del(l,db)
if db.id==32 and#q[db.dm][32]<=1 then
hx=gb(q[db.dm][6])
if(hx) eo(hx)
end
end
function eo(hy)
local gm,gn=go(hy)
local hz=ca(cb[32],gm,gn,hy.owner,hy)
end
function _draw()
ia()
ib()
end
function hb(co,cr)
if(co<0 or co>#bc or cr<0 or cr>#bc) return
local ic=0
if bc[co][cr]!=0 then
if(bc[co][cr-1]>0) ic+=1
if(bc[co-1][cr]>0) ic+=2
if(bc[co+1][cr]>0) ic+=4
if(bc[co][cr+1]>0) ic+=8
bc[co][cr]=1+ic
end
end
function id(co,cr)
local by=bz(co,cr)
return by>=4 and by<=10
end
function ff(db,ie)
db.er,db.ig=ie or 0,nil
db.gc=cocreate(function(self)
while true do
if self.z>1 then
ih(self,
mid(flr(self.fk+rnd"32")-16,64),
mid(flr(self.fl+rnd"32")-16,64))
end
if rnd(250)<1 and self.arms>0 and self.er!=8 then
local gd,ge=self:bx()
gg(self,gd,ge,
function(db,co,cr)
local ew=m[co..","..cr]
if ew!=ii and ew.dm!=db.dm and bc[co][cr]==16 and ew.z==1 then
fy(db,ew)
return true
end
end,
max(4,self.range))
elseif self.id==34 then
ij(self)
end
local fe=self.gq or self.fe
if self.id==32 then
if self.er==0 or self.er==9 then
if self.fd<=1500
and self.er!=7 and self.er!=9 then
self.gq=nil
local ik,il
local im,fp=self:bx()
if id(im,fp) and not self.io then
ik,il=im,fp
else
gg(self,im,fp,
function(db,co,cr)
if id(co,cr) then
ik,il=co,cr
return true
end
end,
10)
end
if ik and il then
ih(db,ik,il)
if(id(db:bx())) db.er=6
end
end
elseif self.fd>=1500
and self.er!=7 then
self.ik,self.il=self:bx()
ga(self,fe or gb(q[db.dm][6]))
elseif self.er==6 then
self.io=false
ip(db.co,db.cr,db.ep+.75+rnd".2"-.1)
local iq=db:dc()
self.fd+=.5
o[iq],self.name=(o[iq] or 1000)-1,"hARVESTER ("..flr(self.fd/1500*100).."% fULL)"
if o[iq]<=0 then
local ei,ej=self:bx()
for em=-1,1 do
for el=-1,1 do
by=bz(ei+el,ej+em)
en(ei+el,ej+em,
(el==0 and em==0) and 0 or((by>1 and by<8) and 10 or by)
)
end
end
self.er=0
end
if(self.fd%300==0) self.io=true self.er=0
end
end
if self.id>26 then
if self.er==9 then
if fe.life>0 and not fe.ir and self.life>0 then
fe.bo,self.er,self.ep,self.co,self.cr=false,8,.25,fe.co+16,fe.cr+4
if(bj==self) bj=nil
if self.fd and fe.id==6 then
fe.ir=true
while self.fd>0 do
self.fd-=1
if flr(self.fd)%4==0 then
if tonum(ds)<dg then
gr(2,self)
elseif self.owner==1 then
bt"sPICE LOST. bUILD sILO"
end
end
yield()
end
self.fd,fe.ir,self.er=0,false,0
if(self.ik) ih(self,self.ik,self.il,0,true)
else
self.process,self.ce,fe.col_cycle_src,fe.col_cycle=2,0,8,cj("7,10,0,0,7,0,0")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function go(ew)
local gm,gn=gg(ew,(ew.co+8)\8,(ew.cr+8)\8,is,nil,true)
return gm*8,gn*8
end
function ip(co,cr,ep)
if(rnd"5"<1) fw(co+sin(ep)*5.5+3.5,cr+-cos(ep)*5.5+3.5,rnd"2",.15,0,.1,-.01,25,cj("2,4,9,15"),0xa5a5.8)
end
function fy(db,ew)
it=true
if db.id!=19 then
db.er,db.ew,db.gc=3,ew,cocreate(function(self)
while ew.life>0 do
local iu=ec(db.co,db.cr,ew.co,ew.cr)
if iu>db.range*5
and db.speed>0 then
ih(db,ew.co\8,ew.cr\8,db.range*5)
if db.id==25 or db.id==38 then
db.life=0
for g=1,db.id/3 do
gh(db.co+rnd"32"-16,db.cr+rnd"32"-16,2)
end
ew.life-=(400+rnd"200")
ew.fz=db
return
end
end
if not db.norotate then
local iv=atan2(db.co-ew.co,db.cr-ew.cr)
while(db.ep!=iv) do
iw(db,iv)
end
end
if iu<=db.range*5 then
if(db.fire_cooldown<=0 and not db.es) db.eq(db) db.fire_cooldown=db.fire_rate
elseif db.speed==0 then
ff(db)
end
yield()
if(db.id==40 or db.id==34 or ew.eg==db.eg or ew.ig) break
end
ff(self)
end)
else
local ix={24,25,38,38}
fy(ca(cb[ix[db.eg]],db.co,db.cr,db.owner),ew)
db.fire_cooldown=1750
end
end
function gg(db,co,cr,iy,iz,ja)
for t=0,iz or 4,.04 do
local el,em=mid(flr(co+t*cos(t)),61),mid(flr(cr+t*sin(t)),61)
if(iy(db,el,em)) return el,em
if(not ja) yield()
end
end
function bz(bv,bw)
if(bw>31) bv+=64 bw-=32
return mget(bv,bw)
end
function en(bv,bw,jb)
if(bw>31) bv+=64 bw-=32
mset(bv,bw,jb)
end
function is(db,co,cr)
return not fget(bz(co,cr),0)
and not m[co..","..cr]
end
function ih(db,co,cr,jc,jd,ie)
::retry_hail::
local je=db.z>1
if jd then
local jf=q and gb(q[db.dm][33])
if jf and not jf.ig and jf.eg==db.eg then
jf.ig,db.ig,db.er,jf.gc=db,jf,2,cocreate(function(jg)
ih(jg,db.co\8,db.cr\8)
if(bj==db) bj=nil
if db.life>0 then
jf.obj_spr=149
del(l,db)
ih(jf,co,cr)
db:gs(jf.co,jf.cr)
add(l,db)
ff(db,ie)
end
jf.obj_spr=73
ff(jf)
end)
return
end
end
::restart_move_unit::
if not je and not is(nil,co,cr) then
co,cr=gg(db,co,cr,is)
end
db.im,db.fp,db.jh,db.er,db.ji=co*8,cr*8,db.er,1,nil
local jj,jk,jl={co=db.co\8,cr=db.cr\8},{co=co,cr=cr},function(jm) return(jm.cr<<8)+jm.co end
local jn,
jo={
jp=jj,
jq=0,
jr=js(jj,jk)
},{}
jo[jl(jj)]=jn
local jt,ju,jv,jw,count={jn},1,jl(jk),32767.99,0
while ju>0 do
local cost,jx=jw
for g=1,ju do
local jy=jt[g].jq+jt[g].jr
if(jy<=cost) jx,cost=g,jy
end
jn=jt[jx]
jt[jx],jn.jz=jt[ju],true
ju-=1
local hr=jn.jp
if jl(hr)==jv then
hr={jk}
while jn.ka do
jn=jo[jl(jn.ka)]
add(hr,jn.jp)
end
db.ji=hr
goto end_pathfinding
end
for kb in all(kc(hr,je)) do
local id=jl(kb)
local kd=not je and fget(bz(kb.co,kb.cr),1) and 4 or 1
if(hr.co!=kb.co and hr.cr!=kb.cr) kd+=.2
local ke,kf=
jo[id],
jn.jq+kd
if not ke then
ke={
jp=kb,
jq=jw,
jr=js(kb,jk)
}
ju+=1
jt[ju],jo[id]=ke,ke
end
if not ke.jz and ke.jq>kf then
ke.jq,ke.ka=kf,hr
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
db.jh,db.er=db.er,2
if db.ji!=nil then
for g=#db.ji-1,1,-1 do
local jm=db.ji[g]
if not db.norotate then
local iv=atan2(
db.co-(jm.co*8),
db.cr-(jm.cr*8))
while(db.ep!=iv) do
iw(db,iv)
end
end
if(not je and not is(nil,jm.co,jm.cr)) goto restart_move_unit
local kg,kh=db.speed or .5,sqrt((jm.co*8-db.co)^2+(jm.cr*8-db.cr)^2)
local ki,kj=kg*(jm.co*8-db.co)/kh,kg*(jm.cr*8-db.cr)/kh
for g=0,kh/kg-1 do
m[jm.co..","..jm.cr]=db
db.co+=ki
db.cr+=kj
if db.id==33 then
if db.ig then
local ez=ec(db.co,db.cr,db.im,db.fp)
if(ez<32) db.z=ez/4
end
db.z=mid(2,db.z+0.1,8)
db.speed=db.z/12
end
yield()
end
db.co,db.cr,m[jm.co..","..jm.cr]=jm.co*8,jm.cr*8,db
fc(db)
if(ec(db.co,db.cr,db.im,db.fp)<=(jc or 0)) break
end
elseif jd then
goto retry_hail
end
db.er=0
end
function ia()
cls"15"
camera(cq+(16-rnd"32")*du,cs+(16-rnd"32")*du)
du=(du>0.05) and du*0.95 or 0
if hn then
for g=1,#hn do
if(g%2==1) fillp(0xa5a5.8)
circfill(
hn[g][1]+4,
hn[g][2]+4,4,
kk[g%#kk+1])
fillp()
end
if(hq>0) spr(88+hq,ho,hp)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32,0x8)
map(64,0,0,256,64,32,0x8)
for dj in all(k) do
if not bm then
dj:fx()
if(dj.ch) dj.ch:fx()
end
dj:ct()
if(dj==bj) rect(bj.co,bj.cr,bj.co+bj.w-1,bj.cr+bj.h-1,7)
end
pal()
for hr=1,2 do
for db in all(l) do
if(hr==1 and db.z==1) or(hr==2 and db.z>1) then
if(not bm) db:fx()
if(db.process!=2 or db.speed==0) db:ct()
if(db==bj) spr(2,bj.co,bj.cr)
end
end
end
for hr in all(p) do
if(hr.kl) fillp(hr.kl)
circfill(hr.co,hr.cr,hr.ep,hr.km[flr((#hr.km/hr.hu)*hr.life)+1])
fillp()
end
local kn,ko=cq\8,cs\8
palt(0,false)
palt(11,true)
for el=kn-1,kn+16 do
for em=ko-1,ko+16 do
local gd,ge=el*8,em*8
if bc[el][em]!=0 and bc[el][em]!=16 then
spr(bc[el][em]+31,gd,ge)
elseif bc[el][em]<16 then
rectfill(gd,ge,gd+7,ge+7,0)
end
end
end
end
function bt(kp)
ba,bb=kp,500
end
function ib()
camera(0,0)
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,124,124,c)
rect(91,91,123,123,d)
rectfill(92,92,122,122,0)
if(bb>0) bb-=1 print(ba,2,2)
ds=dt(f[1])
if y!=bd then
z,kq=y and 1 or 59,y and 1 or-1
if(kq<1) bt("pOWER LOW.bUILD wINDTRAP")
cc"55"
end
bd=y
if z>0 and z<60 then
z+=kq
clip(
max(109-z,91),
max(109-(z>20 and z-20 or 0),92),
min(z*2,32),
min((z>20 and z-20 or 1)*2,32))
for g=1,300 do
pset(92+rnd"32",91+rnd"32",5+rnd"3")
end
clip()
return
end
for el=0,30 do
for em=0,30 do
local gt=el..","..em
if(n[gt]) pset(92+el,92+em,n[gt])
end
end
local kr,ks=92+cq/16,93+cs/16
rect(kr,ks,kr+7,ks+6,7)
local kt=bj and bj.ch
if bj and bj.ico_spr then
bj.dy:gs(109,20)
bj.dy:ct()
ku,kv=nil,nil
if bj.owner==1 then
if kt then
kt:gs(109,44)
kt:ct()
end
if bj.life<bj.hitpoint
and bj.id!=4
and(bj.type==2
or bj.speed==0) then
ku=dx(cb[80],117,28,5,{},nil,draw_action,repair_click)
ku:ct()
end
if(bj.id==19
and bj.fire_cooldown<=0)
or bj.id==35
then
kv=dx(cb[81],109,29,5,{},nil,draw_action,bs)
kv:ct()
end
end
end
pal()
if kt
and(kt.type==4
and kt.speed==0)
and kt.life>=100 then
local kw,kx=(cursor.co+cq)\8,(cursor.cr+cs)\8
local ky,kz,w,h=kw*8-cq,kx*8-cs,kt.fn,kt.fo
la,lb,dz=false,false,false
for el=-1,w do
for em=-1,h do
local by=bz(kw+el,kx+em)
if el==-1 or el==w or em==-1 or em==h then
if(by==22 or by>=58) la=true
else
if(by>=12 and by<=21) dz=true
if(m[kw+el..","..kx+em] or by==0 or by<=12 or by>=23) lb=true
end
end
end
if(lb) la=false
fillp("0b1110110110110111.1")
rectfill(ky,kz,
ky+kt.w,kz+kt.h,la and 11 or 8)
fillp()
end
if bm then
rectfill(0,0,127,127,0)
fillp()
rectfill(3,22,124,95,d)
rect(4,23,123,94,c)
if bj.ee then
bj.bk={}
rectfill(6,25,27,92,0)
local lc=1
for g=1,#bj.ee do
local ld=bj.ee[g]
if not ld.req_id
or q[bj.dm][ld.req_id]
and ld.req_level<=a
then
bj.bk[lc]=ld
if lc>=be and lc<=be+2 then
ld:gs(9,28+(lc-be)*19)
ld:ct()
else
ld:gs(-16,16)
end
bf=bf or bj.bk[1]
if bf==ld then
bi=lc
rect(ld.co-2,ld.cr-2,
ld.co+17,ld.cr+17,
7)
end
lc+=1
end
end
end
for le in all(bg) do
le:ct()
end
end
palt(11,true)
cursor:ct()
end
function bh(co,lf,func_onclick,lg)
add(bg,{
co=co,
cr=83,
w=lg or 22,
h=8,
lf=lf,
cn=function(self)
return self
end,
ct=function(self)
if(#lf>1) rectfill(self.co,83,self.co+self.w,91,self.lh and c or 6)
end,
func_onclick=func_onclick
})
end
function fu(fi)
spr(fi.obj_spr,fi.co,fi.cr,fi.fn,fi.fo)
end
function hw()
li=false
if bj then
cp=true
lj(ku)
lj(kv)
if(bj.dy and not bm and not li) lj(bj.dy) lj(bj.ch)
if(bm) foreach(bj.ee,lj) foreach(bg,lj)
cp=false
end
if not bm
and not li then
foreach(l,lj)
foreach(k,lj)
end
if hg
and not bm
and hj>89 and hj<122
and hk>90 and hk<123 then
cq,cs=mid(0,(hj-94)*16,368),mid(-8,(hk-94)*16,368)
bj=br
elseif hf then
if(bj and bj.type<=2) bt(bj.name)
if li then
if not bm and bj.cg!=nil then
if(bj.func_onclick) bj:func_onclick()
bj=br
return
end
if(bm and bf.lf and bf.func_onclick) bf:func_onclick()
if(bj.owner==1 and bj.type==1 and bj!=br and bj.speed>0) cc"62"
if(bj.dm!=1 and br and(br.type==1 or(br.id==19 and bu)) and br.owner==1) bj.flash_count=10 fy(br,bj) bj=nil
else
if bj
and bj.owner==1
and bj.speed>0
and bj.er!=7 then
bj.gc=cocreate(function(db)
ih(db,(cq+hj)\8,(cs+hk)\8)
ff(db)
end)
end
local kt=bj and bj.ch
if kt
and kt.life>=100
and la then
ca(kt.fj,
(cursor.co+cq)\8*8,
(cursor.cr+cs)\8*8,1)
gp(kt)
cc"61"
end
end
bu=false
elseif hh and not bm then
bj,bu=nil,false
end
end
function gp(fi)
fi.life,fi.process,fi.spent,fi.gl=0,0,0,false
if(fi.cg) fi.cg.bo=false
end
function lj(fi)
if(not fi) return
local lk,ll=cursor:cn(),fi:cn()
fi.lh=lk.co<ll.co+ll.w and
lk.co+lk.w>ll.co and
lk.cr<ll.cr+ll.h and
lk.cr+lk.h>ll.cr
if hf and fi.lh then
if bm then
bf=fi
else
if(fi.type<=2 and bc[(cursor.co+cq)\8][(cursor.cr+cs)\8]!=16 or fi.er==8) return
if bj
and br
and(fi.id==6 and br.id==32
or fi.id==14 and br.id>26)
and fi.owner==1 and br.owner==1
then
ga(br,fi)
return
else
bj=fi
end
end
li=true
end
end
function ga(db,hy)
hy=hy or gb(q[db.dm][1]) or db
db.er,hy.bo,db.gq=7,true,hy
if(db.id!=32 or hy.id==6) db.fe=hy
db.gc=cocreate(function(db)
local lm=hy.id!=1 and 9 or 0
ih(db,(hy.co+16)/8,hy.cr/8,0,true,lm)
if(not db.ig) ff(db,lm)
end)
end
ln=0
function hv()
if it and t()%b==0 then
local lo=rnd(l)
if lo.owner==2 and lo.arms>0 and lo.er==0 then
ij(lo)
end
local lp=rnd(k)
if lp.owner==2 and
(not lp.ch or lp.ch.process!=1) then
local lq=rnd(lp.ee)
if lq and lq.speed>0 then
lq:func_onclick()
end
if lp.life<lp.hitpoint and lp.process!=2 then
bq(lp,2)
end
end
local lr=gb(q[2][19])
if lr and lr.fire_cooldown<=0
and lt and lt.type==2 then
fy(lr,lt)
end
end
ln-=1
if ln<0 then
if hn then
hn=nil
else
hn,lu,lv,kk,hq={{rnd"500",rnd"500"}},rnd"1",0,cj("15,9,4"),0
end
lw=rnd"5000"
ln=lw
end
if hn then
if(s%6<1 or#hn<30) and hq==0 then
while#hn<31 do
if(rnd"9"<.5) lv=rnd".04"-.02
ho,hp=hn[#hn][1],hn[#hn][2]
add(hn,{ho+sin(lu),hp-cos(lu)})
lu+=lv
end
end
if(#hn>30) del(hn,hn[1])
if(hq>0) hq+=.01 ip(ho,hp,rnd"1")
if(hq>2) hq=0
end
end
function ij(fi)
repeat
lt=(rnd"4"<1) and rnd(l) or rnd(k)
until lt.dm!=fi.dm
if(lt and dk(lt)) fy(fi,lt)
end
function dk(fi)
local co,cr=fi:bx()
return bc[co][cr]==16
end
function cc(lx)
sfx(lx,3)
end
function da(ly)
local by=peek(0x3115)
if(by&128>0!=ly) by=by^^128
poke(0x3115,by)
end
function dt(by)
local lz,gu="",abs(by)
repeat
lz=(gu%0x0.000a/0x.0001)..lz
gu/=10
until gu==0
return lz
end
function cj(ma,ez,mb)
ez=ez or","
if(mb) ma=split(ma,mb)
if type(ma)=="table"then
local t={}
while#ma>0 do
local lz=ma[1]
add(t,split(lz,ez))
del(ma,lz)
end
return t
else
return split(ma,ez)
end
end
function dl(mc,md,gx)
if(not mc[md]) mc[md]={}
add(mc[md],gx)
end
function gb(mc)
if(mc) return rnd(mc)
end
function ft(ik,il,co,cr,iv,w,me,mf,mg)
local mh,mi=cos(iv),sin(iv)
local mj,mk,ic=mh,mi,0xfff8<<w-1
w*=4
mh*=w-0.5
mi*=w-0.5
local ml,mm,w=mi-mh+w,-mh-mi+w,2*w-1
for mn=0,w do
local mo,mp=ml,mm
for mq=0,w do
if((mo|mp)&ic)==0 then
local mr=sget(ik+mo,il+mp)
if mr!=me then
if(mf) pset(co+mn,cr+mq,1)
pset(co+mn,cr+mq-mf,mg or mr)
end
end
mo-=mk
mp+=mj
end
ml+=mj
mm+=mk
end
end
function ec(ms,mt,mu,mv)
return sqrt(((ms-mu)>>10)^2+((mt-mv)>>10)^2)<<10
end
function iw(db,mw)
local gv=mw-db.ep
if(db.z>1) db.ep=mw
if gv>0.5 then
gv-=1
elseif gv<-0.5 then
gv+=1
end
if gv>0.0087 then
db.ep+=0.0087
elseif gv<-0.0087 then
db.ep-=0.0087
else
db.ep=mw
end
yield()
end
function kc(jm,je)
local mx={}
for el=-1,1 do
for em=-1,1 do
if(el!=0 or em!=0) my(jm.co+el,jm.cr+em,mx,je)
end
end
return mx
end
function my(mz,na,nb,je)
if(je or not fget(bz(mz,na),0) and not fget(bz(mz,na),7) and not m[mz..","..na] and mz>=0 and na>=0 and mz<=63 and na<=63) add(nb,{co=mz,cr=na})
end
function js(iv,nc)
return abs(iv.co-nc.co)+abs(iv.cr-nc.cr)
end
function fw(co,cr,ep,ex,ey,ht,hs,life,km,kl)
add(p,{
co=co,cr=cr,ep=ep,ex=ex,ey=ey,ht=ht,
life=0,hs=hs,
km=km,kl=kl,
nd=cr,hu=life},1)
end
__gfx__
bbbbbbbbbb171bbbb7bbbb7bbbbbbbbbbbbbbbbb99b9bb99bbbbbbbbbbbbbbbb9b9b99b99bb9999bb99bbbbbbbbb9bbbbb95555555d555555d155dbbbbbbbbbb
bb11bbbbb17771bb77bbbb77bbbbbbbbbbbb9bbb9b9999b9bbb9bbbbbbbbbbbbb9999b99b99999b9bbbbbb99bb99bbbbbbbd5515555555515555d59bbb9d5d9b
bb171bbb1711171bbbbbbbbb0000b000bbbb9999999b99999999bbbbbbbbbbbb9b99999b999999999bb99b9bb9bbb79bbbd555d5515d5d5555d515db55515515
bb1771bb7717177bbbbbbbbb07700077bbb99b9bb9999b9bb9b99bbbb9bbbb9b9999b99b99999999bb99bbbbbbb799bbb955515d5555155d155d55db55d5155d
bb17771b1711171bbbbbbbbb00777770bbbbb9b99bb9999b9b9bbbbbbb99b999b9b99bbb99999999b999b99bbb99bbbbbd55d55155155555d515559b155555d5
bb177771b17771bbbbbbbbbb07700077bbbb9999b999b99b9999bbbb999b99b99bbbbbbbb999999999bb9bbbb79bbbbbbd515d55d555d5555d555dbbd55d5555
bb17711bbb171bbb77bbbb770000b000bbb99b9b99b999b9b9b99bbb9b99b99bbbbbbbbb9999999bbbbbbbbb99bbbbb9b95d5555555555155155dbbb5d555d15
bbb11bbbbbbbbbbbb7bbbb7bbbbbbbbbbbbb99b9bb9bbb999b99bbbbb99b99b9bbbbbbbb999b9999bbb99bbbbbbbb99bbbd551d5515d555d555559bb55515555
55551d51bbbbbbbbbbbbbbbbbd5d555555d555dbdddddddddddddddd55d555d55d44444555d555d5d44444444444444444444444542444444444444444444424
d55d5155bbbbbbdddbbbbbbbbd5551551555d5dbd5555555d55555551555515d4444444444555155544444444444444444444444544224222242224442422442
5155555dbbbb9d5555d9bbbbbb55d5555d5555bbd5015515d55555555d55d444444444444445d555444444444444444444444444524442444424442224444221
5d55d555bbbd555d5555dbbbbbd15d5d55555dbbd5105555d5555555555d4444444444444444445d444444444444444444444442522222212222222242222110
55d555d1bb955555d55559bbbb955555d555d9bbd5555111d5555555555444444444444444444445444444444444444444444422502112121121122121121200
5d551555bbd5155555d55dbbbbbb9d5555d9bbbbd1555101d555555555d444444444444444444445444444444444444444444242550221200012210012100005
db9d5d9bbd555515555555dbbbbbbbbddbbbbbbbd5555111d5555555154444444444444444444444444444444444444444444240555000055000000500055555
bbbbbbbbbd5d5555555d55dbbbbbbbbbbbbbbbbbd5515555d555555555444444444444444444444444444444444444444444442155555555555555555555d555
bbbbbbbbbbb9bbbbbbbbbbbbbbbbb1b1bbbbbbbb1b1bbbbbbb0ee0bbbbbbbbbbbbbbbbbbbbbbbbbb10000000bbbbbbb0000000010bbbbbbb0000000000000000
bbbbbbbbbb66669bbbbbbbbbbbb1bb00b6bbbbbb00bb1bbbbb5c65bbbbbbbbbbbb676bbbbb676bbbb0000000bbbbb1000000000b00bbbbbbb000000b00000000
bbb777bbb66dd66bbd5bb5bbbb1b0000bbbbbb6b0001b1bbbb0c60bbbbbbbbbbbbb7bbbbbbb7bbbb1b000000bbbb1b00000000b1001bbbbbb1b1b1bb00000000
bb77994bb6d55d6bb5dbbbbbb1b00000bbbbbbbb00000b1bbb5c75bbbbbbbbbbbb676bbbb6e6e6bbbb000000bbbbb100000001bb00b1bbbbbb1b1bbb00000000
bb79994bb6d55d6bbbbb555bbb000000bbbbbbbb000001bbbbbc7bbbbbb1b1bb7e777e7bbb676bbbb1b00000bbbb1b0000000b1b001bbbbbbbbbbbbb00000000
bb79944bb66dd66bbbbb5d5b1b000000bbb6bbbb000000b1bb0cc0bbbb1b1b1bbbb7bbbbbbb7bbbbbb1b0000bbbbb1000001b1bb00b1bbbbbbbbbbbb00000000
bbb444bbbb6666bbbbbb555bb0000000bbbbbbbb0000000bbb5dd5bbb000000bbbbcbbbbbbbcbbbbbbb1bb00bbbbbb0000bb1bbb001bbbbbbbbbbbbb00000000
bbbbbbbbb9bbbbbbbbbbbbbb10000000bbbbbbbb00000001bb0cc0bb00000000bbbbbbbbbbbbbbbbbbbbb1b1bbbbbbb01b1bbbbb0bbbbbbbbbbbbbbb00000000
b7bbb7bbb7bbb7bbbbeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0cddc0bbecccebbbbbbbbbbdddddddddddddddddddddddddfff61ffddddd999dddddddd
bcbbbcbbbcbbbcbbb0cccc0bb0ece0bbb0eee0bbb6cdc6bbb6ccc6bbbed77deb0ccccc0bbdeeedbbd555555555555544c4555555df44414ff559999999555765
bebbbebbbebbbebbb0cccc0bb0d6d0bbb0d6d0bbb7d7d7bbbcdddcbbbc6776cb0cecec0bb6cdc6bbd5555555555554a904455555dfff4144f54499999445f66f
b0bbb0bb0b0b0b0bbeccccebbbc7cbbbbbc7cbbbb7d6d7bbbc6c6cbbbc6776cbec6c6cebb6d7d6bbd4c455444444549904499c95df444444f52449494425dffd
bbb7bbbbbbb7bbbbbeccccebbbcccbbbb0c7c0bbb7c6c7bbbc7c7cbbbed66debee6e6eebb6d4d6bb4a042499999442424297a094dffffffff5424444424556d5
bbbcbbbbbbbcbbbbb0ecce0bbb606bbbb0ccc0bbb7c0c7bbbc0c0cbbbec66cebec0c0cebb69996bb49029999c0994422229aa094d44444444522424244255425
bbbebbbbbbbebbbbb0deed0bbbb0bbbbbb6b6bbbb6eee6bbb6eee6bbb0e66e0b00ccc00bbdeaedbb242499aee099942dd1499942d41441144554224224555425
bbb0bbbbbb0b0bbbbbeccebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbbbbbbbbbd2499a77a0a99442d1542425d44411114555224225ff2225
d77dd77d67d6fffdd6dddddd6ddddddddddcddddddddddddddddddddbbbbbbbbbbb8bbbbb5e77e5bd1499a77aaa99422d15242f5d55555555555555555f44225
76667666561ffff1dd577765d5555555d560d55555555555d5555555bbbbbbbbbbb9bbbbbbc77cbbd1299aaaaaa99442d551414fdddddbbdddbbdd5d5fff4445
76667666565f4441d576611655577765d56d1555c5555555d5bbbbb5bbbddbbbbbdadbbbbbb77bbbd52499aaaa9994225552424fdd55bb5ddddbb5dd5f444445
d6621662165ffff1d7661bb155766116d5110d560d6c0655d5555555bbd66dbbbb666bbbc767767cd5229999999942425551424fd55bbddadad5bb5d5fff4765
d2221222165f1011d76101b107661bb1d51001d6d6ee0dd5d55aaa55bbd66dbbbbb6bbbbc767767cd5542499999424255555114fd5bbd5aadaaddbb55444f66f
622112211ddf1001d76000b0176101b1d515050116dd0dd5d5555555bbbddbbbbbb6bbbbbbb77bbbd55142424242421599c9554fdbbddaa5ddaad5bb5414dffd
61155111515510056d600b01576000b0d55d155106dd15d5d5558555bbb67bbbbbb6bbbbbb5775bbd55f1424242421197a09954fdbd5aadd8d5aaddb544446d4
66767555d55d5555d5d1b1155d600b01d566665551ddd501d5588855bbb67bbbbbb7bbbbbb6556bbd5599c9212121119aa09954fd5daa5d888ddaadd55555425
6d6d65d555d555d5d5555555d5d1b115d6ddcdd551110001ddddddddbbbbbbbbbbbb447bbbbbbbbbd597a099fffffff455555425dddddd88888ddddd55555425
66d1d555155dc0556dd577765d5555ddd6dd0dd55d110001d5588855bbbbbbbbbbb2557bbb5555bbd59aa094dddddddf5fff2225dddaadd888d5aadd5fff2225
d555555a5d5ee055d55766116555c055d6dd15d1d1510c01d5558555b1b11b1bbb2555dbb507665bdf249492dd929ddf5ffff225dbddaa5d8d5aaddb5ffff225
15aaa99a5555505dd57661bb155ee0ddd1ddd500155560d5d5555555bdd66ddbb775f55bb562720bdff2424fd9d2d9df54444445dbbd5aadd5aad5bb54444445
55aaa55ad55550556d76101b105d5055d1111005dddd6d15d55aaa55b651156b76dfff2bb567275bd1fffff1d99299df5ffffff5d5bbddaadaad5bb55ffffff5
d5a1199a55d51555d576000b015d5055d111100111111105d5555555b7b55b7b76d5f564b572765bd4414141111111145ffffff54d5bb5dadad5bb5d5ffffff5
5544445a15555515d5d600b015d6d555d511005555551015d5bbbbb5bbb67bbb4422d664bb5055bbd14404455555555454444445d4d5bbdd5ddbbddd54444445
d5151515555d5555d55d1b1155d5d555d555555555555555d5555555bbb67bbbbbbbbd77bbbbbbbbd51111155555555452222225dd4ddbbdddbbdddd55555555
dddd666666ddddddddd777c066666ddddddddddddddddddddddddddddd4dddddddd66666ddddddddddddddddddddddddddddddddddddddddd199999999999999
d566ddddd61111106667dee0dddd657667555555d557755555555ddddd4ddd5dd566777665555555d555555555555555d766777755555555d494955949999249
d5dddd000066dd666dd7ddd0d6666dddddd56765d566969666655ddd5ddd5dddd767666d6d555555d554777777777455d7ddfff755555555d194255999229999
d5dd0000001111dd6dd766d0d6dd611111ddddd5d5ddadadddd55ddddd5dd5ddd767666d6d555555d544ff7fff7ff445d7777f7765555777d495f5f4f4121419
d50000000066dd106dd11666666d7055011111157777a7a71155544dd555dd44d766ddd66d555555d504777778617405d4447ff7265557f6d195656565999959
d5555555551111106d76611111177050554214257d9d9d9711555ddddd5d5dddd6d66666d1555555d544ff7ff6d1f445d4047777655777fdd499955555944959
d551f6155566dd666d55d5dd66611005554254257da76767115767dd5dddddddd6dd0d0221666665d504777771177405d44444442657ffffd19495c055944959
d550f605551111dd6ddd6ddd711110255542542575776d675576667ddd4dd5ddd6dd0002266c0766d544ff7fff7ff445d22244445557ff7fd4999ee055944959
d555f655551d6d106d777777711110455542542575777777766767667d4dddddd52d0d0276ee06d6d504777777777405d76677775557ff7fd195594095999959
d5516615551d6d106d7011111ddd6445555555557d7c07777677677675555555d5120001767606d6d544ff7fff7ff445d7ddfff755577777d495594495977779
d5505505551d6d106770d1d11ddd7055555555557dee0dddd666d66d75555555d5511111766d0d66d542222222222245d7777f77655444449999529925777777
d5555555551d6d10ddd0d1d116777055555555557ddd0d777d66d6dd76555555d55555556d666662d52c02c020200225d4447ff7265c04c09429444444776666
d55555555510d010ddd0d1dd111115dddddd5555777757707dddddd77d675555d55555556dd0d022d5ee0ee022200225d404777765ee0ee09999242424766666
d555550f050aaa000001d1111111105555555555ddddddd07777777776d75555d55555556dd00022d551011011111115d444444426550550944242424296666d
d55f0f555555555500111ddd111115dddddd5555d111d1d5ddddddddd7775555d555555552202021d555011011111155d222444455550550944242424294ddd2
d555555555555555011111111111105555555555d5555555d1d1d1d1dddd5555d555555555100011d555555555555555d555222255555555d111111111194421
ddddddddddddddd6766dddddddddddddd7766ddd577777d59ff99f999f999999ccccccccccccccccccccccccccccccccccccccccc550cccc66cccccccccccccc
d55555555c0555d6766dd555d76555557c67c676576666d59999999999996666cccccccc7ccccccccccccccccccccccccccccc655cc0cccc6665c5cccccccccc
d5d6d555ee055dd6766dd155d6d5555dcd76dc6d576666d0ff99f99ff96666ddccccccc7dc0cccccdddcccccccccccccccccc551cc50ccccdd76767cccc7cccc
d576dddd550516d6766d6105d556555dccddccd5576666d099999999dd766666cccc7ccc50ccccccdddddddccccccc66ccccc611cccfccccddddddd6ccd6dccc
d50015055505ddd6766ddd05d5c7c5cd6cccc6dc56dddd10777666dd55777777ccc7d1cc5ccccc7cddddddddddcc6666dddd6c1c1ccc5c66dddd66ddd5d6dccc
d55555555d101dd6766dd105d1dcd1c1d6666d1c56dddd1066dd666155766dddcc6666666dddc7dcddd7dddddddd666611dddddddddcc6dd66dd577ddcd6dccc
d455555550001dd6766dd105d1cdc177660dd1c656dddd106666661155766dddff61616160d0cc5cdd75ddf2dddddd6600111ddddddddd115d66d55ddccd577c
d15ddddddddd1dd6d16dd105d51117c67c601ccd5d111110dddd22115d766dddf666ddd66d55dc5fddd1df442df4dddd044fff44fffdd100d51dddddf0c77dd5
d55776d7777716d6116d6105d500dcd76dcd0dd1b5e77e5bdddd2661dd766dddf666ddd66d55dffffd42d9442d94d76d54450ffff50555555d11117fdd7dddd5
d55666666666ddd6766ddd05d555dccddccd0110bec77ccbdddd2261d5566ddd777777777776666d9944444444444994605060ff50606666d5117f11dd5d11d5
d56ddddddddd1d0888880105d55cd6cccc6dc005bee77ecbdddd2261ddd55d6d777777766667777d49442424242449d46605066665066666dd7ff6f6fd5d00d5
d5d111111111101d6dd6d005d55c1d6666d1c555c767767cdddd22655dddd565ffff7776666666dd4944242424244994666666d666666ddd662f5f5f5f266666
d551a1a11111008888888005d556c1dddd1c6055c767767cdddd2265555ddd654999466555555dddff22222222222255ddd666666dddd5666662222222666666
d45111111111016d6d6d6d05d55dcc1111ccd055bee77ecb5555555555777777994999966ddddd945555555555999955666666dd776666666666666666666667
d44555555555555555555555d761ddccccdd1076be5775cb55555555766666669449449499449949555999995555999966666655ddddd7775555566666667fff
d11555555555555555555555d6d511dddd11056dbb6556bb55555576666dddd6444444444444444499999999999555596666666666655ddd5556666667ffffff
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
040080000c0c0c0c0c0c0c0e0808080808080808080a08090909090909090909060e0e010c00000000000000000000010000000000000000000001010101010101010001000102010000010101020201010101000001020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010000000000010100000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
05050505064400006800680042000d0d140405050506131014040505061344000068004200000000008565000000000000000011120000004940000d0d0d2f2f0000000405050505090909090500000000000000000a00000000000000000000000000000000000000110d0d14070600000000000000000a0505050508000000
050505050a0000000000000000000405050505080505050505050505050600000000000000000000001600000012000000000042004200420000001404052f2f0000000505050509090909050500000000000000000000000000000000000000000000000000000000130d140000000000000000000000000000000000000000
05050506858542004200650000000a050508110f120a050909050505050557858585858557000000001662000016000000001100000000000085850405052f2f12000405090505050909090505050600000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050613850000000000000085000a081116161612050509090505050585853a00008585120000001600000016000000005785858585858585040505052f2f140005090905050909050509090905000000000000000a0000110f0d0f12000000110f0d0f1200000000000000000000000000000b0b0b000000000000000000
05050505068585858585858585851249113a00001616120a05050505050585160000001685160000008585858585000000161610101010101404050505052f2f00000a05050a0505050505090905050600000000000000110f0d0d0d0d0d0000110d0d0d0d0d0f1200000000000000000000000b0b0b0b0b0000000000000000
0a210505050613570d0d101016164000160000006200001205050505050885850000008585166e00161616161616161616160004050505050505050505052f2f00000000000000000000050509090505000000000000000d0d0d0d0d0d1400000c0d0d0d0d0d0d0d0f0f12000000000000000405060b0b0b0000000000000000
0a0505050905061637140000130d0000160000000000001616120a08001185858516858585160000161614001316161616000405050505050505086800122f2f0000110f0d0f120000000a0509090905060000000000110d0d0d0d0d140000000c0d0d0d0d0d0d0d0d0d0d0f120000000004050505060b0b0b00000000000000
00000005090508160d040507060c856e0085168516856000850e00000013578585858585571685850014040506856e0016000505050505050508110000162f2f110f0d0d0d0d0d1204060005090905050500000000000c0d0d0d1400000000000c0d0d0d0d0d0d0d0d0d0d0d0e000000040509090905060b0b0b000000000000
0000000a050800160e050905051385000085858585850000850d120000000057858585570d101014000005050885000016000505050505050811440000162f2f0d0d0d1d0d0d0d140505050509090909050000000000130d14000000000000000c0d0d0d0d10100d0d0d0d1014000000050505090505050b0b0b0b0000000000
00000000000000160e050509050a858585850d100d858585850d0d120000040505060c0d0e00000000000a081185858557000505050505081136000000162f2f0d1d0d0d0d0d14040505050505050909050000000000000000000011120000000c0d0d0d0e0000000000000000000000050505090905080b0b0b0b0000000000
12000000000057570e05050508000c570d0e000000130d0d57160d0e0004050905050c0d0e000000000000110d0d0d0d0e00040505050885850d858585162f2f0d0d0d1010140405050509050509090505000011120000040506110d0d1200000c0d0d0d0e00000000000000000000000a05090905080b0b0b0b000000000000
0e000000000057571405050500000c0d0d0e0000000013101016370d120a050909050c0d0e0000000000110d0d370d0d0d12000a37110f856000650000162f2f0d1014000004050909050505050509090506110d0e00040505050c0d0d0d0000130d0d0d0e0000000000000000000000000a050508000b0b0b00000000000000
0d120000000004050505050500000c0d370e000000000000001616160d12050905080c0d0d12000000110d0d0d0d0d5716161612000a13850000000000162f2f1400000000000a05050800050505050508110d0d0e0005090905130d0d140000000c0d0d0d1200000000000000000000000000000000000b0b00000000000000
0d0d1200000005090909050500000c0d0d0d12000000000000001316160e0a0508110d0d0d0d0f0f0f0d0d100d0d0d163a000016000000008585858585852f2f00000000000000000000000a05050508110d0d0d0e000509090505060000000000130d0d0d0d12000000000000000000000000000000000b0b00000000000000
0d0d0d1200000a05090505050000130d0d0d0d12000000000000000c16160f1200000000130d0d0d0d14000000130d1600000016123700000013856200002f2f0000000000000000000000000000110f0d0d0d0d0e0005050909050500000000000000130d0d0d0f12000000000000000000000000000b0b0b0b0b0000000000
0d0d0d0d12000005050505080000000c0d0d0d0e000000000000000c0d16160d120000000000130d1400000000001316000000160e0000000000850000002f2f0000000000000000000000000015100d0d0d0d0d0e00000a05050508000000000000000000130d101407000000000000000000000000000b0b0b000004050000
0d0d0d0d0e00000a080000000000000c0d0d0d1400000020000000130d0d16160e00000000000000000000000000005716161616160000000000161616162f2f000000000000000000000000000000130d0d0d0d0d1200000a0508000000000000000000040505050505050506000000000000000000000b0b0b040505050000
0d0d10100e000000000000000000000c0d0d1400000000000000000000130d160d120000000000000000200000000000000016400049000037000c166e002f2f00000000000000000000110f0000000000000c0d0d0d120000000000000000110f0e000005050509090905050500000000000000000000000000050909090000
0d14040505062100000000000000000c0d140000000000000000000000000c160d0e0000000000000000000000000000000016000000000000000c1600002f2f000405050600000000110d0d0000000000000c0d0d0d0d12000000110f380f370d14000405050909050505050800000000000000002000000000050909090000
0e04050905050506000000000000001314000000000000000000000000001357570e000000000000000000000000040506000c161600000000000c8585852f2f0005090505060000000c0d0d1200000000000c0d0d0d0d0d0f0f0f0d300d0d0d0e000000000a05050509051112000000000000000000000000000a0505090000
0e05090905050505000000000000000000000000000000000000000000000057570e00000000000000000000000a050505001642000000000000131057372f2f0005050905050000000c0d0d0d00000020000c0d0d0d0d0d0d36440d0d01220d360000000000000a0505080c0e00000000000000000000000000110e05090000
0e0a05050505050800000000000000000000000000000000000000000000110d0d140000000000000000000505050509050057000012000000150000000d2f2f0005090909050000000c0d0d0d12000000110d0d0d0d0d0d0d0d0d0d0d22220d0e000000000000000000000c0d12000000000000000000000000000405050000
0d0f0f120a000000000000000000000004050600000000000000000000110d0d14000000000000110f0d0f120509050505001657440000160e00000000132f2f0005090909050000000c0d0d0d0d0f0f0f0d0d0d0d0d0d0d0d6a0d0d4942160d37000000000000000000000c0d0d0f1200000000000000000000000a05080000
0d0d0d0e00000000000000000000040505050500000000000a00110f0f0d0d14000000000000000c0d0d0d0e0509090905001316000000160000000000002f2f0a05050505080000000c0d0d0d0d0d0d0d0d1400130d0d0d0d0d0d340d0d0d0d0e0000000000000000000013100d0d0d12000000000000000000000000000000
1010101400000000000000000405050909090500000000000000130d10101400000000000000000c0d0d1014050509050800000c140000000000000000002f2f0000000000000000000c0d0d0d0d0d1014000000000c0d0d0d0d100d100d380d0e000000000000000000000000130d0d0e000000000000000000000000000000
0000000000000000000000000509090905050506000000070000000000000000000000000000000c0d1400040505050800000000000000000000000000002f2f0000000000000000000c0d0d0d0d14000000000000130d0d0d14000000130d0d0e00000000000000000000000406130d0e000000000000000000000000000000
0000000000000000000000000a05090905080b0b000000050000000000000000000000000000110d140000000a050800000000000a0000040506000000002f2f000000000000000000130d0d0d1400000000000000000c0d140000000000130d14000000000000110e040505050506130d0f1200000000000000000000000000
000000000000000000000000000a0505080b0b0b000000050600000000000000000000110d0d0d0e000000000000000000000000000405050505050506002f2f00110f0e0000000000001310140000000000000000001314000000000000000004050a0000000000000509050505050506130d0e000000000000000000000000
0000000000000000000000000000000b0b0b0000000000000000000000000000000000130d0d0d14000004050505060000000000000005090905050505062f2f00000000000000000000000000000000000000000000000000000000000005050505050600000000040509090509090905000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000005050505000000000a00000a050909090909052f2f0000000000000000000000000000000000000000000000000004050507000a050505080b0b000000050505050505050508000004050505060000000000000000
0000000000000000040505060000000000000000000000000000000000000000000000000000000000040505050508110f0e0000000000050505050905082f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
000000000004050505090505060000000000000000000000000000000000000000000000000000000000110f0f0f0f0d14000000000000050505090905002f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f
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

