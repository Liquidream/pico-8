pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
cartdata("pn_undune2")
a,b,c,d,e,f,g,i=dget"0",dget"1",dget"2",dget"3",dget"20",dget"21",dget"22",dget"23"
j={
shr(dget"6",16),
shr(500,16),
shr(dget"7",16)
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
k.draw_refinery=function(self)
pal()
pal(11,self.col2)
pal(10,self.col2)
pal(8,self.col2)
if self.bs then
pal(self.col_cycle[self.col_cycle_pos],self.col1)
else
pal(11,self.col1)
self.col_cycle_pos=1
end
bt(self)
end
bu=function(self)
palt(11,true)
pal(7,8)
if(self.id==80 and bm.process==2 and not bm.bv) pal(7,11)
bt(self)
pal()
end
repair_click=function()
bw(bx,2)
end
by=function(self)
if bx.id!=35 then
bz"pick target"
ca=true
else
local cb,cc=bx:cd()
local ce=cf(cb,cc)
if ce>=9 and ce<=15 then
bx.life=0
cg(ch[1],cb*8,cc*8,1)
sfx"61"
end
bx=nil
end
end
function bw(self,ci)
self.cj,self.ck,self.process=0,self.process,ci
if(self.life>0 and self.ck>0) self.bv=not self.bv
if(self.cl) self.cl.bs=true
end
ch=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||||0|0|0|0|0|0|1|1|||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||||0|0|0|0|0|0|1|1|||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0||||||10|0|0|0|0|0|0|1|1|11|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|1|1|||400|30|0|1800|0||||||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
7|rADAR oUTPOST|106|136|2|2|2|1||1|||||||2|2|1|2|||400|30|0|2000|0|||||||0|0|0|0|0|0|1|1|||tHE oUTPOST PROVIDES~RADAR AND AIDS CONTROL~OF DISTANT VEHICLES.||||
8|sPICE sTORAGE sILO|104|134|2|2|2|1||1|||||||2|2|6|2|||150|5|0|600|0|||||||0|0|0|0|0|0|1|1|||tHE sPICE SILO IS USED ~TO STORE REFINED SPICE.||||
9|bARRACKS|108|168|2|2|2|1||1|||||11|3|2|2|7|2|-3||300|10|0|1200|0|||||||0|0|0|0|0|0|1|1|||tHE bARRACKS IS USED TO~TRAIN YOUR lIGHT ~INFANTRY.||||factory_click
10|wor tROOPER fACILITY|110|138|2|2|2|1||1|||||||2|2|7|2|3||400|10|0|1600|0|||||||0|0|0|0|0|0|1|1|||wor IS USED TO TRAIN~YOUR hEAVY INFANTRY.||||factory_click
11|lIGHT vEHICLE fACTORY|96|140|2|2|2|1||1|||||||2|2|6|2|||400|20|0|1400|0|||||||0|0|0|0|0|0|1|1|||tHE lIGHT fACTORY~PRODUCES LIGHT ATTACK~VEHICLES.||||factory_click
12|hEAVY vEHICLE fACTORY|98|142|2|3|2|1||1|||||||2|2|6|3|||600|20|0|800|0|||||||0|0|0|0|0|0|1|1|||tHE hEAVY fACTORY~PRODUCES HEAVY ATTACK~VEHICLES.||||factory_click
13|hI-tECH fACTORY|101|166|2|3|2|1||1|||||||2|2|12|5|||500|35|0|1600|0|||||||0|0|0|0|0|0|1|1|||tHE hI-tECH fACTORY~PRODUCES FLYING~VEHICLES.||||factory_click
14|rEPAIR fACILITY|128|230|2|3|2|1||1|||||||2|2|12|5|||700|20|0|800|0||||||4|0|0|0|0|0|0|1|1|8|0|tHE rEPAIR fACILITY~IS USED TO REPAIR YOUR~VEHICLES.||||
15|cANNON tURRET|71|232|1|1|1|1|11|1|||||||2|2|7|5|||125|10|38|1200|0|4|1|9.5||||0|0|0|0|0|0|1|1|||tHE cANNON tURRET IS~USED FOR SHORT RANGE~ACTIVE DEFENSE.||||
16|rOCKET tURRET|87|234|1|1|1|1|11|1|||||||2|2|7|6|||250|20|112|1200|0|9|2|28||||0|0|0|0|0|0|1|1|||tHE rOCKET TURRET IS~USED FOR MEDIUM RANGE~ACTIVE DEFENSE.||||
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0||||||15|0|0|0|0|0|0|1|1|11|11,10,8,8|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||||0|0|0|0|0|0|1|1|||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||||0|0|0|0|0|0|1|1|||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||2|100|0.05|2|1|2|1|48|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||4|200|0.05|2|1|5|1|49|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||4|440|0.1|6|2|12|1|48|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||8|440|0.1|6|2|24|1|49|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||8|880|0.1|3|1|3|1|49|10|0|0|0|0|0|0|1|1|||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||150|160|0.4|0|1|37.5|1|49|10|0|0|0|0|0|0|1|1|||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||5|440|0.1|1||1.25||||0|0|0|0|0|0|1|1|||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||8|400|0.6|3|1|5||||0|0|0|0|0|0|1|1|||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||10|520|0.5|3|1|5||||0|0|0|0|0|0|1|1|||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||38|800|0.25|4|1|9.5||||0|0|0|0|0|0|1|1|||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||45|1200|0.2|5|1|11.25||||0|0|0|0|0|0|1|1|||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||112|400|0.3|9|2|28||||0|0|0|0|0|0|1|1|||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||||0|0|0|0|0|0|1|1|||tHE cARRYALL IS A~LIGHTLY ARMOURED~AIRCRAFT WITH NO~WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|160|166|1|1|1|4|11|13|17||||||2|2|13|7|-3||600||75|20|1|9|2|20||161|5|0|0|0|0|0|0|1|1|||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY~MANOUVERABLE + FASTEST~AIRCRAFT ON dUNE.||||
35|mcv|176|192|1|1|1|1|11|12|17||||0|5|2|2|7|4|||900||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
36|sONIC tANK|57|198|1|1|1|1|11|12|||||12|9|2|2|7|7|1||600||90|440|0.3|8|3|22.5||||0|0|0|0|0|0|1|1|||dEVELOPED BY THE~aTREIDES,THIS ENHANCED~TANK FIRES POWERFUL~BLAST WAVES OF SONIC~ENERGY.||||
37|dEVASTATOR|56|200|1|1|1|1|11|12|||||||2|2|13|8|3||800||60|1600|0.1|7|1|15||||0|0|0|0|0|0|1|1|||tHE dEVESTATOR IS A~NUCLEAR-POWERED TANK,~WHICH FIRES DUAL PLASMA~CHARGES. mOST POWERFUL~TANK ON dUNE, BUT~POTENTIALLY UNSTABLE~IN COMBAT.||||
38|dEATH hAND|72||1|1|1|8|11|||0|||||2|2|13|8|3||0||150|280|0.5|0|20|37.5||||0|0|0|0|0|0|1|1|||tHE dEATH hAND IS A~SPECIAL hARKONNEN~pALACE WEAPON. aN~INACCURATE, BUT VERY~DESTRUCTIVE BALLISTIC~MISSILE.||||
39|rAIDER|51|204|1|1|1|1|11|11|||||12|1|2|2||2|2||150||8|320|0.75|3|1|2||||0|0|0|0|0|0|1|1|||tHE oRDOS rAIDER IS~SIMILAR TO THE STANDARD~tRIKE, BUT WITH LESS~ARMOUR IN FAVOUR OF~SPEED.||||
40|dEVIATOR|54|202|1|1|1|1|11|12|||||11|3|2|2|13|7|2||750||50|480|0.3|7|2|500||||0|0|0|0|0|0|1|1|||tHE oRDOS dEVIATOR IS A~STANDARD mISSILE tANK,~WHICH FIRES UNIQUE~NERVE GAS MISSILES THAT~MAY TEMPORARILY CHANGE~ENEMY LOYALTY.||||
41|sANDWORM|88||9|1|1|1|11||||||||2|2||3|||0||300|4000|0.35|0|30|75||||0|0|0|0|0|0|1|1|||tHE sAND wORMS ARE~INDIGEONOUS TO dUNE.~aTTRACTED BY VIBRATIONS~ALMOST IMPOSSIBLE TO~DESTROY, WILL CONSUME~ANYTHING THAT MOVES.||||
42|sPICE bLOOM|177||1|1|1|1|11|||0|||||1|1|||||||0|4|0||||1|||0|0|0|0|0|0|1|1|||||||
80|rEPAIR|19||5|1|1|1|11||||||||1|1||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
81|lAUNCH|1||5|1|1|1|11||||||||1|1||||||||||||||||0|0|0|0|0|0|1|1|||||draw_action||action_click
99|worker|0||10|1|1|1||||0|||||||||||||0|99|0|||||||0|0|0|0|0|0|1|1|||||||]]
function _init()
poke(0x5f2d,1)
menuitem(1,"exit to title",function()
load("pico-dune-main")
end)
local cm=cn(ch,"|","\n")
ch={}
for co=2,46 do
local cp={}
for cq=1,48 do
local ce=cm[co][cq]
if(cq!=2 and cq<43) ce=tonum(ce)
if cq==44 then
cr,ce=cn(ce,"~"),""
for line in all(cr) do
ce=ce.."\n"..line
end
end
cp[cm[1][cq]]=ce
end
ch[tonum(cm[co][1])]=cp
end
for co=-2,66 do
bg[co]={}
for cs=-2,66 do
bg[co][cs]=0
end
end
cursor={
w=8,
h=8,
ct=function(self)
return{
cu=self.cu+(not cv and cw or 0)+2,
cx=self.cx+(not cv and cy or 0)+1,
w=1,
h=1
}
end,
cz=function(self)
spr((bm and bm.type==1 and bm.owner==1 or ca) and 1,
self.cu,self.cx)
end
}
for co=1,2 do
for cc=0,31 do
for cb=0,127 do
local da=nil
local db=mget(cb,cc)
if co==1 and db==1 then
dc,dd=cb*8,cc*8
cw,cy,da=dc-56,dd-56,ch[1]
elseif co==2
and db>=48 then
for de,df in pairs(ch) do
if(df.obj_spr!=nil and df.obj_spr==db) da=df break
end
end
if da!=nil then
local dg,dh=cb,cc
if(dg>63) dh+=31 dg-=64
mset(cb,cc,0)
cg(da,dg*8,dh*8)
end
end
end
end
di=cg(ch[99],-8,-8)
di.dj=cocreate(function()
while true do
if u%30==0 then
n={}
for dk,dl in pairs(m) do
n[dl:dm()]=dk
end
dn={}
if bb then
for co=0,124,4 do
for cs=0,124,4 do
local cb,cc=co/2,cs/2
if(cc>=32) cb+=64 cc-=32
local dp=mget(cb,cc)
local dq=sget((dp*8)%128+4,(dp*8)/16)
if(bg[co/2][cs/2]==16) dn[(co/2/2)..","..(cs/2/2)]=dq!=11 and dq or 15
end
yield()
end
end
dr,ds,dt,du=0,0,false,{0,0}
if(u%100==0) r={{},{}}
for de,dv in pairs(l) do
if dv.owner==1 or(bb and dw(dv)) then
dn[flr(dv.cu/2/8)..","..flr(dv.cx/2/8)]=dv.col1
end
if dv.owner==1 then
dr-=dv.power
if(dv.id==7) dt=true
if(sub(dv.name,1,5)=="sPICE") ds+=1000
end
du[dv.owner]+=1
r[dv.dx][dv.id]=dv
end
for de,dl in pairs(m) do
if bb and(dl.owner==1 or dw(dl) and dl.z==1) then
dn[flr(dl.cu/2/8)..","..flr(dl.cx/2/8)]=dl.col1
end
if(dl.dx>0) r[dl.dx][dl.id]=dl
end
bb,dy,o=(dt and dr>0),2,dn
dz(false)
if(j[3]>0 and j[1]>j[3]) ea=1
if(du[2]==0 and a>1) ea=2
if(du[1]==0) ea=3
if ea then
dset(14,ea)
dset(13,t()-s)
dset(10,eb)
dset(24,ec(j[2]))
dset(11,x[1])
dset(25,x[2])
dset(12,v[1])
dset(26,v[2])
rectfill(30,54,104,70,0)
?"mission "..(ea<3 and"complete"or"failed"),36,60,c
flip()
load("pico-dune-main")
end
end
yield()
end
end)
music"7"
ed=0
end
function cg(da,cu,cx,owner,ee)
local ef=eg(da,cu,cx,da.type,nil,k[da.func_init],k[da.func_draw],k[da.func_update],nil)
ef.eh,ef.life=eg(da,109,0,3,ef,nil,nil,k[da.func_onclick]),ei and da.hitpoint/2 or da.hitpoint
ef.owner=ef.owner or owner or ej(cu,cx,dc,dd)<75 and 1 or 2
ef.dx,ef.ek=owner or ef.owner,{}
for df in all(ch) do
local el=df.req_faction
if(df.parent_id!=nil and(df.parent_id==ef.id or df.parent2_id==ef.id))
and(el==nil
or(el>0 and el==b)
or(el<0 and-b!=el))
then
add(ef.ek,
eg(df,109,0,4,ef,nil,nil,function(self)
if bp then
bm=self
else
bw(self,1)
end
end)
)
end
end
if ef.owner==1 then
ef.em,ef.col1,ef.col2=b,c,d
else
ef.em,ef.col1,ef.col2,ef.eh.func_onclick=e,f,g,nil
if(ef.id==19) en=ef
end
if da.col1 then
ef.col1,ef.col2=da.col1,da.col2
end
if(ef.z>1) ef.owner=0
local eo,ep=flr(cu/8),flr(cx/8)
if da.type==2 then
local eq=(da.id==2 or da.id==3)
for er=0,da.w-1 do
for es=0,da.h-1 do
et(eo+er,ep+es,eq and 16 or ef.owner==1 and 149 or 27)
end
end
if(not eq) add(l,ef)
if ef.id==6 and ef.cl==nil then
local eu,ev=ew(ef)
cg(ch[32],eu,ev,ef.owner,ef)
end
else
if(ef.norotate!=1) ef.ex=flr(rnd"8")*.125
if ef.arms>0 then
ef.ey=function(self)
self.ez,self.fa,self.fb,self.fc,self.fd=4,self.cu+4,self.cx+4,self.fe.cu+self.fe.w/2,self.fe.cx+self.fe.h/2
local ff,fg=self.fc-self.fa,self.fd-self.fb
local fh=sqrt(ff*ff+fg*fg)
self.fi,self.fj=(ff/fh)*2,(fg/fh)*2
sfx(self.arms<50 and 60 or 58,3)
fk(self)
end
if(ef.id==15 or ef.id==16) et(eo,ep,149)
else
ef.fl=ee
if(ef.id==32) ef.fm=0
end
add(m,ef)
fn(ef)
end
fk(ef)
return ef
end
function eg(fo,cu,cx,fp,cl,func_init,func_draw,func_onclick)
local fq={
fr=fo,
id=fo.id,
hitpoint=fo.hitpoint,
cu=cu,
cx=cx,
z=fo.z,
fs=cu/8,
ft=cx/8,
type=fp,
cl=cl,
func_onclick=func_onclick,
w=fo.w*8,
h=fo.h*8,
fu=fo.obj_spr,
fv=fo.w,
fw=fo.h,
col_cycle=cn(fo.col_cycle),
ct=function(self)
return{
cu=self.cu,
cx=self.cx,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cz=func_draw or function(self)
if self.type<=2
and(self.cu+self.w<cw
or self.cu>cw+127
or self.cx+self.h<cy
or self.cx>cy+127+self.z)
then
return
end
pal()
palt(0,false)
if(self.trans_col and self.type<=2) palt(self.trans_col,true)
if(self.em and self.id!=18) pal(12,self.col1) pal(14,self.col2)
if self.col_cycle then
pal(self.col_cycle_src,self.col_cycle[self.col_cycle_pos])
end
if self.ex then
if not self.fx or self.fx>.025 then
for co=1,2 do
if(co==2 or self.speed>0) fy(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.cu,self.cx-(co==2 and self.z or 0),.25-self.ex,1,self.trans_col,co==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
local fz=self.type==4 and self or self.cl
rectfill(self.cu-1,self.cx-1,self.cu+16,self.cx+19,0)
local ga=fz.hitpoint
local ce=self.process==1 and 15*(fz.life/100) or 15*(fz.life/ga)
if(fz.life>0 and not bp) rectfill(self.cu,self.cx+17,self.cu+ce,self.cx+18,self.process==1 and 12 or fz.life<ga*.33 and 8 or fz.life<ga*.66 and 10 or 11)
pal(11,fz.icol1) pal(3,fz.icol2)
end
if self.type>2 then
spr(self.ico_spr,self.cu,self.cx,self.ico_w,self.ico_h)
else
bt(self)
end
end
if self.fa then
if self.fire_type==1 then
pset(self.fa,self.fb,rnd"2"<1 and 8 or 9)
else
local gb=self.fire_type==2
gc(self.fa,self.fb,0,
0,0,
gb and .15 or 2,
-.01,
gb and 20 or 2.5,
self.id==40 and{11} or gb and cn("7,7,10,9,8,2,13,6,7") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.life<self.hitpoint*.33 and self.altframe==nil and rnd"10"<1 and self.type<=2) gc(self.cu+3.5,self.cx+3.5,1,.1,-.02,.05,-.002,80,cn("10,8,9,6,5"),rnd"2"<1 and 0xa5a5.8 or 0)
self.hit=0
end,
gd=function(self)
local life=self.life
self.flash_count=max(self.flash_count-.4,1)
if self.hit>0 and self.dx>0 then
dz(true)
if(dy==0 or stat(24)>5) dy=1 music"0"
if(self.arms>0 and self.ez==0) ge(self,self.gf)
if(self.obj_spr<=49 and life<100) self.fv,self.fw=0.5,0.5
if(life<50 and self.ez!=7) gg(self,r[self.dx][14] or self.fl)
end
if(self.type<=2 and life<=0 and self.fx==nil) self.ez=5 self.dj=nil self.fx=(self.type==2 and 1 or .5) sfx(self.type==2 and 53 or 54,3) ed+=((self.type==2 or self.id==38) and 0.25 or 0)
if self.fx then
self.fx-=.025
if self.fx<=0 then
if self.type==2 then
for er=0,self.fv-1 do
for es=0,self.fw-1 do
et(self.cu/8+er,self.cx/8+es,15)
end
end
del(l,self)
v[self.gf.dx]+=1
else
local gh,gi=self:cd()
if(cf(gh,gi)<9) et(gh,gi,20)
if(self.id<=17) et(gh,gi,15)
del(m,self)
if self.id==42 then
gj(self,gh,gi,
function(dl,cu,cx)
if(cf(cu,cx)==0) et(cu,cx,8)
end,
4,true)
end
if(self.gf) x[self.gf.dx]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gk(self.cu+rnd(self.w),self.cx+rnd(self.h))
end
end
if self.framecount!=nil then
self.frame+=1
if self.frame>self.framecount then
self.frame=0
if self.altframe
and self.ez==2 then
self.obj_spr=self.fu+(self.altframe-self.obj_spr)
end
if self.col_cycle then
self.col_cycle_pos+=1
if(self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
end
end
end
if self.fa then
self.fa+=self.fi
self.fb+=self.fj
if ej(
self.fa,self.fb,
self.fc,self.fd)<2
then
gk(self.fa,self.fb,self.fire_type)
local fe=self.fe
if ej(
self.fa,self.fb,
fe.cu+fe.w/2,
fe.cx+fe.h/2)<4
then
fe.life-=self.arms
fe.hit,fe.gf=self.fire_type,self
if self.id==40 and fe.speed!=nil then
fe.owner,fe.em,fe.col1,fe.col2=self.owner,self.em,self.col1,self.col2
fn(self)
elseif fe.gl then
fe.em,fe.col1,fe.col2,fe.gl=fe.gl,fe.gm,fe.gn,nil
fn(fe)
end
end
self.fa=nil
end
end
if self.process>0
and not self.bv
and not self.go then
if self.process==1 and self.spent>self.cost then
self.go=true
if(self.cl.owner==1) sfx"56"bz("cONSTRUCTION cOMPLETE")
if self.fr.type==1
and self.parent_id!=1 then
local eu,ev=ew(self.cl)
cg(self.fr,eu,ev,self.cl.owner,self.cl)
gp(self)
end
elseif self.process==2 and life>self.hitpoint then
self.process=0
if self.type==1 and self.speed>0 then
self.gq.col_cycle={0}
self.ez=0
self.cu,self.cx=ew(self.fl)
end
else
if self.cj>(self.process==1 and 3 or 100) then
if(gr(-1,self.process==1 and self.cl or self)) self.cj=0 self.spent+=1
else
self.cj+=1
self.life=(self.process==1 and(self.spent/self.cost)*100 or life+.5)
end
end
end
if self.fire_cooldown>0 then
self.fire_cooldown-=.1
end
if(self.id==5) self.name="wINDTRAP (pOWER:"..dr..")"
end,
gs=function(self,cu,cx)
self.cu,self.cx=cu,cx
end,
dm=function(self)
local cu,cx=self:cd()
return cu..","..cx
end,
cd=function(self)
return flr(self.cu/8),flr(self.cx/8)
end
}
for dk,gt in pairs(fo) do
if fq[dk]==nil and gt!=""then
fq[dk]=gt
end
end
if(func_init) func_init(fq)
return fq
end
function gr(gu,fq)
if(ec(j[fq.owner])+gu<0) return false
j[fq.owner]+=sgn(gu)*shr(abs(gu),16)
if(fq.owner==1) sfx"63"
return true
end
function gk(cu,cx,gv)
gc(cu,cx,2,
0,0,.1,0,gv==1 and 5 or 30,cn("5,7,10,8,9,2"),rnd"2"<1 and 0xa5a5.8 or 0)
end
function fk(gw)
if(gw.owner!=1 and gw.ez!=4) return
local gx=gw.type==2 and 3 or 2
for er=-gx,gx do
for es=-gx,gx do
local gy,gz=flr(gw.cu/8)+er,flr(gw.cx/8)+es
bg[gy][gz]=16
ha(gy,gz)
for fg=-1,1 do
for ff=-1,1 do
ha(gy+ff,gz+fg)
end
end
end
end
end
function _update60()
hb,hc,hd=stat"32",stat"33",stat"34"
he,hf,hg=(hd==1 and hh!=hd) or btnp"4",(hd>0) or btn"4",(hd==2 and hh!=hd) or btnp"5"
for dk=0,1 do
if(btn(dk)) y+=dk*2-1
if(btn(dk+2)) ba+=dk*2-1
end
hi,hj=mid(0,hb+y,127),mid(0,hc+ba,127)
cursor.cu,cursor.cx=hi,hj
if not bp then
if(hi<4) cw-=2
if(hi>123) cw+=2
if(hj<4) cy-=2
if(hj>123) cy+=2
cw,cy=mid(cw,384),mid(-8,cy,384)
for de,dl in pairs(m) do
if dl then
if dl.dj and costatus(dl.dj)!="dead"then
assert(coresume(dl.dj,dl))
else
dl.dj=nil
end
if hk
and fget(cf(dl:cd()),2)
and ej(hl,hm,dl.cu,dl.cx)<1
and dl.z==1
then
del(m,dl)
hn=.01
end
end
end
for dk,ho in pairs(q) do
ho.fg+=ho.hp
ho.cu+=ho.ff
ho.cx+=ho.fg
ho.ex+=ho.hq
ho.life+=1
if(ho.life>=ho.hr) del(q,ho)
end
hs()
end
ht()
hh,bx,br=hd,bm,bi
u+=1
end
function _draw()
hu()
hv()
end
function ha(cu,cx)
if(cu<0 or cu>#bg or cx<0 or cx>#bg) return
local hw=0
if bg[cu][cx]!=0 then
if(bg[cu][cx-1]>0) hw+=1
if(bg[cu-1][cx]>0) hw+=2
if(bg[cu+1][cx]>0) hw+=4
if(bg[cu][cx+1]>0) hw+=8
bg[cu][cx]=1+hw
end
end
function hx()
end
function hy(cu,cx)
local ce=cf(cu,cx)
return ce>=2 and ce<=8
end
function fn(dl,hz)
dl.ez,dl.ia=hz or 0,nil
dl.dj=cocreate(function(self)
while true do
if self.z>1 then
ib(self,
mid(flr(self.fs+rnd"32")-16,64),
mid(flr(self.ft+rnd"32")-16,64))
end
if rnd"250"<1 and self.arms>0 and self.ez!=8 then
local gh,gi=self:cd()
gj(self,gh,gi,
function(dl,cu,cx)
local fe=m[n[cu..","..cx]]
if(fe!=ic and fe.dx!=dl.dx and bg[cu][cx]==16 and fe.z==1) ge(dl,fe) return true
end,
self.range)
elseif self.id==34 then
ie(self)
end
local fl=self.gq or self.fl
if self.id==32 then
if self.ez==0 or self.ez==9 then
if self.fm<=1500
and self.ez!=7 and self.ez!=9 then
self.gq=nil
local ig,ih
local ii,ij=self:cd()
if hy(ii,ij) and not self.ik then
ig,ih=ii,ij
else
gj(self,ii,ij,
function(dl,cu,cx)
if hy(cu,cx) and rnd"10"<1 then
ig,ih=cu,cx
return true
end
end,
10)
end
if ig and ih then
ib(dl,ig,ih)
if(hy(dl:cd())) dl.ez=6
end
end
elseif self.fm>=1500
and self.ez!=7 then
self.ig,self.ih=self:cd()
gg(self,fl or r[dl.dx][6])
elseif self.ez==6 then
self.ik=false
il(dl.cu,dl.cx,dl.ex+.75+rnd".2"-.1)
local im=dl:dm()
p[im],self.fm,self.name=(p[im] or 1000)-1,(self.fm or 0)+.5,"hARVESTER ("..flr(self.fm/1500*100).."% fULL)"
if p[im]<=0 then
local eo,ep=self:cd()
for es=-1,1 do
for er=-1,1 do
ce=cf(eo+er,ep+es)
et(eo+er,ep+es,
(er==0 and es==0) and 0 or((ce>1 and ce<8) and 8 or ce)
)
end
end
self.ez=0
end
if(self.fm%300==0) self.ik=true self.ez=0
end
end
if self.id>26 then
if self.ez==9 then
if fl.life>0 and not fl.io and self.life>0 then
fl.bs,self.ez,self.ex,self.cu,self.cx=false,8,.25,fl.cu+16,fl.cx+4
if(bm==self) bm=nil
if self.fm and fl.id==6 then
fl.io=true
while self.fm>0 do
self.fm-=1
if flr(self.fm)%4==0 then
if tonum(eb)<ds then
gr(2,self)
else
bz"sPICE LOST. bUILD sILO"
end
end
yield()
end
self.fm,fl.io,self.ez=0,false,0
if(self.ig) ib(self,self.ig,self.ih,0,true)
else
self.process,self.cj,fl.col_cycle_src,fl.col_cycle=2,0,8,cn("7,10,0,0,7,0,0")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function ew(fe)
local eu,ev=gj(fe,flr((fe.cu+8)/8),flr((fe.cx+8)/8),ip,nil,true)
return eu*8,ev*8
end
function il(cu,cx,ex)
if(rnd"5"<1) gc(cu+sin(ex)*5.5+3.5,cx+-cos(ex)*5.5+3.5,rnd"2",.15,0,.1,-.01,25,cn("2,4,9,15"),0xa5a5.8)
end
function ge(dl,fe)
if dl.id!=19 then
dl.ez,dl.fe=3,fe
dl.dj=cocreate(function(self)
while fe.life>0 do
local iq=ej(dl.cu,dl.cx,fe.cu,fe.cx)
if iq>dl.range*5
and dl.speed>0 then
ib(dl,flr(fe.cu/8),flr(fe.cx/8),dl.range*5)
if dl.id==25 or dl.id==38 then
dl.life=0
for co=1,dl.id/3 do
gk(dl.cu+rnd"32"-16,dl.cx+rnd"32"-16,2)
end
fe.life-=(100+rnd"50")
fe.gf=dl
return
end
end
if not dl.norotate then
local ir=atan2(dl.cu-fe.cu,dl.cx-fe.cx)
while(dl.ex!=ir) do
is(dl,ir)
end
end
if iq<=dl.range*5 then
if(dl.fire_cooldown<=0 and not dl.fa) dl.ey(dl) dl.fire_cooldown=dl.fire_rate
elseif dl.speed==0 then
fn(dl)
end
yield()
if(dl.id==40 or dl.id==34 or fe.em==dl.em or fe.ia) break
end
fn(self)
end)
else
local it={24,25,38,38}
ge(cg(ch[it[dl.em]],dl.cu,dl.cx,dl.owner),fe)
dl.fire_cooldown=1750
end
end
function gj(dl,cu,cx,iu,iv,iw)
for t=0,iv or 64,.02 do
local er,es=flr(cu+t*cos(t)),flr(cx+t*sin(t))
if(iu(dl,er,es)) return er,es
if(not iw) yield()
end
end
function cf(cb,cc)
if(cc>31) cb+=64 cc-=32
return mget(cb,cc)
end
function et(cb,cc,ix)
if(cc>31) cb+=64 cc-=32
mset(cb,cc,ix)
end
function ip(dl,cu,cx)
return not fget(cf(cu,cx),0)
and n[cu..","..cx]==nil
end
function ib(dl,cu,cx,iy,iz,hz)
local ja=dl.z>1
if iz then
local jb=r and r[dl.dx][33] or false
if jb and not jb.ia then
jb.ia,dl.ia=dl,jb
jb.dj=cocreate(function(jc)
ib(jc,flr(dl.cu/8),flr(dl.cx/8))
if(bm==dl) bm=nil
if dl.life>0 then
del(m,dl)
ib(jb,cu,cx)
dl:gs(jb.cu,jb.cx)
add(m,dl)
fn(dl,hz)
end
fn(jb)
end)
return
end
end
::restart_move_unit::
if not ja and not ip(nil,cu,cx) then
cu,cx=gj(dl,cu,cx,ip)
end
dl.ii,dl.ij,dl.jd,dl.ez=cu,cx,dl.ez,1
dl.je=nil
local jf,jg,jh={cu=flr(dl.cu/8),cx=flr(dl.cx/8)},{cu=dl.ii,cx=dl.ij},function(ji) return shl(ji.cx,8)+ji.cu end
local jj,
jk={
jl=jf,
jm=0,
jn=jo(jf,jg)
},{}
jk[jh(jf)]=jj
local jp,jq,jr,js,count={jj},1,jh(jg),32767.99,0
while jq>0 do
local cost,jt=js
for co=1,jq do
local ju=jp[co].jm+jp[co].jn
if(ju<=cost) jt,cost=co,ju
end
jj=jp[jt]
jp[jt],jj.jv=jp[jq],true
jq-=1
local ho=jj.jl
if jh(ho)==jr then
ho={jg}
while jj.jw do
jj=jk[jh(jj.jw)]
add(ho,jj.jl)
end
dl.je=ho
goto end_pathfinding
end
for jx in all(jy(ho,ja)) do
local id=jh(jx)
local jz=not ja and fget(cf(jx.cu,jx.cx),1) and 4 or 1
if(ho.cu!=jx.cu and ho.cx!=jx.cx) jz+=.2
local ka,kb=
jk[id],
jj.jm+jz
if not ka then
ka={
jl=jx,
jm=js,
jn=jo(jx,jg)
}
jq+=1
jp[jq],jk[id]=ka,ka
end
if not ka.jv and ka.jm>kb then
ka.jm,ka.jw=kb,ho
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
dl.jd,dl.ez=dl.ez,2
if dl.je!=nil then
for co=#dl.je-1,1,-1 do
local ji=dl.je[co]
if not dl.norotate then
local ir=atan2(
dl.cu-(ji.cu*8),
dl.cx-(ji.cx*8))
while(dl.ex!=ir) do
is(dl,ir)
end
end
if(not ja and not ip(nil,ji.cu,ji.cx)) goto restart_move_unit
local kc,kd=dl.speed or .5,sqrt((ji.cu*8-dl.cu)^2+(ji.cx*8-dl.cx)^2)
local ke,kf=kc*(ji.cu*8-dl.cu)/kd,kc*(ji.cx*8-dl.cx)/kd
for co=0,kd/kc-1 do
n[ji.cu..","..ji.cx]=dl
dl.cu+=ke
dl.cx+=kf
yield()
end
dl.cu,dl.cx,n[ji.cu..","..ji.cx]=ji.cu*8,ji.cx*8,dl
fk(dl)
if(ej(dl.cu,dl.cx,dl.ii*8,dl.ij*8)<=(iy or 0)) break
end
end
dl.ez=0
end
function hu()
cls"15"
camera(cw+(16-rnd"32")*ed,cy+(16-rnd"32")*ed)
ed=(ed>0.05) and ed*0.95 or 0
if hk then
for co=1,#hk do
if(co%2==1) fillp(0xa5a5.8)
circfill(
hk[co][1]+4,
hk[co][2]+4,4,
kg[co%#kg+1])
fillp()
end
if(hn>0) spr(88+hn,hl,hm)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for de,dv in pairs(l) do
if not bp then
dv:gd()
if(dv.bq) dv.bq:gd()
end
dv:cz()
if(dv==bm) rect(bm.cu,bm.cx,bm.cu+bm.w-1,bm.cx+bm.h-1,7)
end
pal()
for ho=1,2 do
for de,dl in pairs(m) do
if(ho==1 and dl.z==1) or(ho==2 and dl.z>1) then
if(not bp) dl:gd()
if(dl.process!=2 or dl.speed==0) dl:cz()
if(dl==bm) spr(17,bm.cu,bm.cx)
end
end
end
for dk,ho in pairs(q) do
if(ho.kh) fillp(ho.kh)
circfill(ho.cu,ho.cx,ho.ex,ho.ki[flr((#ho.ki/ho.hr)*ho.life)+1])
fillp()
end
local kj,kk=flr(cw/8),flr(cy/8)
palt(0,false)
palt(11,true)
for er=kj-1,kj+16 do
for es=kk-1,kk+16 do
if bg[er][es]!=0 and bg[er][es]!=16 then
spr(bg[er][es]+31,er*8,es*8)
elseif bg[er][es]<16 then
rectfill(er*8,es*8,er*8+7,es*8+7,0)
end
end
end
end
function bz(kl)
be,bf=kl,500
end
function hv()
camera(0,0)
pal()
palt(0,false)
rectfill(0,0,127,8,9)
rect(90,90,125,125,c)
rect(91,91,124,124,d)
rectfill(92,92,123,123,0)
if(bf>0) bf-=1 print(be,2,2)
eb=ec(j[1])
? sub("000000",#eb+1)..eb,103,2,d
if bb!=bd then
bc,km=bb and 1 or 59,bb and 1 or-1
if(km<1) bz("pOWER LOW.bUILD wINDTRAP")
sfx"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=km
clip(
max(108-bc,91),
max(108-(bc>20 and bc-20 or 0),91),
min(bc*2,33),
min((bc>20 and bc-20 or 1)*2,33))
for co=1,300 do
pset(92+rnd"32",92+rnd"32",5+rnd"3")
end
clip()
return
end
for er=0,31 do
for es=0,31 do
if(o[er..","..es]) pset(92+er,92+es,o[er..","..es])
end
end
local kn,ko=92+cw/16,93+cy/16
rect(kn,ko,kn+7,ko+6,7)
if bm and bm.ico_spr then
bm.eh:gs(109,20)
bm.eh:cz()
kp,kq=nil,nil
if bm.owner==1 then
if bm.bq then
bm.bq:gs(109,44)
bm.bq:cz()
end
if bm.life<bm.hitpoint
and bm.id!=4
and(bm.type==2
or bm.speed==0) then
kp=eg(ch[80],117,28,5,{},nil,bu,repair_click)
kp:cz()
end
if(bm.id==19
and bm.fire_cooldown<=0)
or bm.id==35
then
kq=eg(ch[81],109,29,5,{},nil,bu,by)
kq:cz()
end
end
end
pal()
if bm
and bm.bq
and(bm.bq.type==4
and bm.bq.speed==0)
and bm.bq.life>=100 then
local kr,ks=flr((cursor.cu+cw)/8),flr((cursor.cx+cy)/8)
local kt,ku,w,h=kr*8-cw,ks*8-cy,bm.bq.fv,bm.bq.fw
kv,kw,ei=false,false,false
for er=-1,w do
for es=-1,h do
local ce=cf(kr+er,ks+es)
if er==-1 or er==w or es==-1 or es==h then
if(ce==16 or ce>=58) kv=true
else
if(ce>=9 and ce<=15) ei=true
if(n[kr+er..","..ks+es] or ce==0 or ce<8 or ce>16) kw=true
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
if bm.ek then
bm.bn={}
rectfill(6,25,27,92,0)
local kx=1
for co=1,#bm.ek do
local ky=bm.ek[co]
if ky.req_id==nil
or r[bm.dx][ky.req_id]
and ky.req_level<=a
then
bm.bn[kx]=ky
if kx>=bh and kx<=bh+2 then
ky:gs(9,28+(kx-bh)*19)
ky:cz()
else
ky:gs(-16,16)
end
bi=bi or bm.bn[1]
if bi==ky then
bl=kx
rect(ky.cu-2,ky.cx-2,
ky.cu+17,ky.cx+17,
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
for de,kz in pairs(bj) do
kz:cz()
end
end
palt(11,true)
cursor:cz()
end
function bk(cu,cx,la,func_onclick,lb)
add(bj,{
cu=cu,
cx=cx,
w=lb or#la*4+2,
h=8,
la=la,
ct=function(self)
return self
end,
cz=function(self)
if(#la>1) rectfill(self.cu,self.cx,self.cu+self.w,self.cx+self.h,self.lc and c or 6)
? self.la,self.cu+2,self.cx+2,(#la>1) and 0 or(self.lc and c or 6)
end,
func_onclick=func_onclick
})
end
function bt(fq)
spr(fq.obj_spr,fq.cu,fq.cx,fq.fv,fq.fw)
end
function ht()
ld=false
if bm then
cv=true
le(kp)
le(kq)
if(bm.eh and not bp and not ld) le(bm.eh) le(bm.bq)
if(bp) foreach(bm.ek,le) foreach(bj,le)
cv=false
end
if not bp
and not ld then
foreach(m,le)
foreach(l,le)
end
if hf
and not bp
and hi>89 and hi<122
and hj>90 and hj<123 then
cw,cy=mid(0,(hi-94)*16,384),mid(-8,(hj-94)*16,384)
bm=bx
elseif he then
if(bm and bm.type<=2) bz(bm.name)
if ld then
if not bp and bm.cl!=nil then
if(bm.func_onclick) bm:func_onclick()
bm=bx
return
end
if(bp and bi.la and bi.func_onclick) bi:func_onclick()
if(bm.owner==1 and bm.type==1 and bm!=bx and bm.speed>0) sfx"62"
if(bm.dx!=1 and bx and(bx.type==1 or(bx.id==19 and ca)) and bx.owner==1) bm.flash_count=10 ge(bx,bm) bm=nil
else
if bm
and bm.owner==1
and bm.speed>0
and bm.ez!=7 then
bm.dj=cocreate(function(dl)
ib(dl,flr((cw+hi)/8),flr((cy+hj)/8))
fn(dl)
end)
end
if bm
and bm.bq
and bm.bq.life>=100
and kv then
cg(bm.bq.fr,
flr((cursor.cu+cw)/8)*8,
flr((cursor.cx+cy)/8)*8,1)
gp(bm.bq)
sfx"61"
end
end
ca=false
elseif hg and not bp then
bm,ca=nil,false
end
end
function gp(fq)
fq.life,fq.process,fq.spent,fq.go=0,0,0,false
if(fq.cl) fq.cl.bs=false
end
function le(fq)
if(fq==nil) return
local lf,lg=cursor:ct(),fq:ct()
fq.lc=lf.cu<lg.cu+lg.w and
lf.cu+lf.w>lg.cu and
lf.cx<lg.cx+lg.h and
lf.cx+lf.h>lg.cx
if he and fq.lc then
if bp then
bi=fq
else
if(fq.type<=2 and bg[flr((cursor.cu+cw)/8)][flr((cursor.cx+cy)/8)]!=16 or fq.ez==8) return
if bm
and(fq.id==6 and bm.id==32
or fq.id==14 and bm.id>26)
and fq.owner==1 and bm.owner==1
then
gg(bm,fq)
return
else
bm=fq
end
end
ld=true
end
end
function gg(dl,lh)
lh=lh or r[dl.dx][1]
dl.ez,lh.bs,dl.gq=7,true,lh
if(dl.id!=32 or lh.id==6) dl.fl=lh
dl.dj=cocreate(function(dl)
local li=lh.id!=1 and 9 or 0
ib(dl,(lh.cu+16)/8,lh.cx/8,0,true,li)
if(dl.ia==nil) fn(dl,li)
end)
end
lj=0
function hs()
if t()>i and t()%i*2==0 then
local lk=rnd(m)
if lk.owner==2 and lk.arms>0 and lk.ez==0 then
ie(lk)
end
local ll=rnd(l)
if ll.owner==2 then
if ll.bq and ll.bq.fr.type==1 and ll.bq.process!=1 then
local lm=rnd(ll.ek)
ll.bq=lm
lm:func_onclick()
end
if ll.life<ll.hitpoint and ll.process!=2 then
bw(ll,2)
end
end
if ln and ln.type==2
and en and en.fire_cooldown<=0 then
ge(en,ln)
end
end
lj-=1
if lj<0 then
if hk then
hk=nil
else
hk,lo,lp,kg,hn={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lq=rnd"5000"
lj=lq
end
if hk then
if(u%6<1 or#hk<30) and hn==0 then
while#hk<31 do
if(rnd"9"<.5) lp=rnd".04"-.02
hl,hm=hk[#hk][1],hk[#hk][2]
add(hk,{hl+sin(lo),hm-cos(lo)})
lo+=lp
end
end
if(#hk>30) del(hk,hk[1])
if(hn>0) hn+=.01 il(hl,hm,rnd"1")
if(hn>2) hn=0
end
end
function ie(fq)
local ln=lr(fq)
if(ln and dw(ln)) ge(fq,ln)
end
function lr(fq)
local lt
repeat
lt=(rnd"4"<1) and rnd(m) or rnd(l)
until lt.dx!=fq.dx
return lt
end
function dw(fq)
local cu,cx=fq:cd()
return bg[cu][cx]==16
end
function dz(lu)
local ce=peek(0x3115)
if((band(ce,128)>0)!=lu) ce=bxor(ce,128)
poke(0x3115,ce)
end
function ec(ce)
local lv,gt="",abs(ce)
repeat
lv=(gt%0x0.000a/0x.0001)..lv
gt/=10
until gt==0
if(ce<0) lv="-"..lv
return lv
end
function cn(lw,fh,lx)
fh=fh or","
if(lx~=nil) lw=split(lw,lx)
if type(lw)=="table"then
local t={}
while#lw>0 do
local lv=lw[1]
add(t,split(lv,fh))
del(lw,lv)
end
return t
else
return split(lw,fh)
end
end
function fy(ig,ih,cu,cx,ir,w,ly,lz)
local ma,mb=cos(ir),sin(ir)
local mc,md,hw=ma,mb,shl(0xfff8,(w-1))
w*=4
ma*=w-0.5
mb*=w-0.5
local me,mf,w=mb-ma+w,-ma-mb+w,2*w-1
for mg=0,w do
local mh,mi=me,mf
for mj=0,w do
if band(bor(mh,mi),hw)==0 then
local mk=sget(ig+mh,ih+mi)
if(mk!=ly) pset(cu+mg,cx+mj,lz or mk)
end
mh-=md
mi+=mc
end
me+=mc
mf+=md
end
end
function ej(ml,mm,mn,mo)
return abs(sqrt(((ml-mn)/1000)^2+((mm-mo)/1000)^2)*1000)
end
function is(dl,mp)
local gu=mp-dl.ex
if(dl.z>1) dl.ex=mp
if gu>0.5 then
gu-=1
elseif gu<-0.5 then
gu+=1
end
if gu>0.0087 then
dl.ex+=0.0087
elseif gu<-0.0087 then
dl.ex-=0.0087
else
dl.ex=mp
end
yield()
end
function jy(ji,ja)
local mq={}
for er=-1,1 do
for es=-1,1 do
if(er!=0 or es!=0) mr(ji.cu+er,ji.cx+es,mq,ja)
end
end
return mq
end
function mr(ms,mt,mu,ja)
if(ja or not fget(cf(ms,mt),0) and n[ms..","..mt]==nil and ms>=0 and mt>=0 and ms<=63 and mt<=63) add(mu,{cu=ms,cx=mt})
end
function jo(ir,mv)
return abs(ir.cu-mv.cu)+abs(ir.cx-mv.cx)
end
function gc(cu,cx,ex,ff,fg,hq,hp,life,ki,kh)
local ho={
cu=cu,cx=cx,ex=ex,ff=ff,fg=fg,hq=hq,
life=0,hp=hp,
ki=ki,kh=kh,
mw=cx,hr=life
}
add(q,ho,1)
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
bbbbbbbbbbbbbbbbffffffffffffffffcccccccccccccccccccccccccccccccc9999999999999999ccccccccccccc0cccccccccccccccccccccccccccccccccc
bb676bbbbb676bbbffffffffffffffffcccccccccccccc77ccc7c7ccccc776cc9999999777799999ccccccccccccc0ccccccccccccccccccc71dcccc1c0c1cc7
bbb7bbbbbbb7bbbbffffffffffffffffccccccccccc77766cc77c7cccccc6ccc99999772fff11447cccccccccccccdccccccc677ddcccccc5666ccccc101c7d7
bb676bbbb6e6e6bbffffffffffffffffcccccc7777766666c777677ccccc6ccc99955ff21111577fccccccccccccccdccccc67111dcccccc11116666dc0157d7
7e777e7bbb676bbbff77777777ffffffccc7776666766666c77d677cccc76777977ff555555554479accc5acccccc55cccc6660dd1dccccc6d1d111166665757
bbb7bbbbbbb7bbbbff76663b666fffff7776666666766666c77d6c7cc66677777ff2211757575444575c544aaaccccccccd6650001dccc7776d76d1c11111110
bbbcbbbbbbbcbbbbff7333363333ffff6676666666766666c77d6c7cccc77766ff221153535355545d75144444aaaccc9dddd055d1d996666d1dd11cc5650555
bbbbbbbbbbbbbbbbf7bbbbb3bbbbbfff6676666666766666c7d66c7ccc777655ff775555555555559511199994444ccc95ddd000011d5ddd6d1d6d1ccd7d0d6d
bb0ee0bbbbbbbbbbf7666663b66666ff6676666666766666c7c651cc7777650077221155555555779001199999991515675dd055501d5ddd6d1d6d1ddd7d0d7d
bb5c65bbbbbbbbbbf76666663b66666f6676666666766666fd87151fffffffff422215577755576f50d019999999151501755000001d55556d1d4d9949945499
bb0c60bbbbb777bbfddddddddddddddf6676666666766666f668777fffffffff4221557fff7776ff501015aaaaaaa44450155ddddddd66996d19999999666666
bb5c75bbbb77994bffffffffffffffffdd76666666766666ffdddd6fff778787421557fffffffffd4500545aa744444566666666666666669999999966776767
bbbc7bbbbb79994bfffffffffffffffffffdddd666766666fffffffff7777e7e555554777fffff6d544454444444544466666666555555554999996777777776
bb0cc0bbbb79944bfffffffffffffffffffffffddd766666ffffffff67777d88955554444777fff64554444544544454555555559999f9999944677667767698
bb5dd5bbbbb444bbfffffffffffffffffffffffffffddd66ffffffff66776d22999554444444777f54445544554545449f9999f9999999f99977777777679887
bb0cc0bbbbbbbbbbffffffffffffffffffffffffffffffddfffffffff666d2229999955544444447455454554555544599fffffff9f999994777776677988977
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

__gff__
0400040404040404040000000000000200000600060604010101010101010101010101010000000000000101010000000000000000000000000001010101010101010101010102010000010101020201010101010101020101010101010202010101010101010101010101010101010101010101010101010101010101010101
0101010101010000000001010000000001010101010100000000010100000000000000000000000001010000000000000006000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
16160000000000000012121200000012120000000000000000000000000000000000000000000000000000000000121212121200000000000000000000001515161616000000000000000000000000090a0a0d0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000161616
16000000000000001212000000001212000000000000000000000000000000000000000000000000001212000000001212000000001200120000000000000015161200020508000005050002050803000d0e05000400000000000000000000000000000000000000000000000000000000000000000000000000000000000016
1212000000000c00001600160000000000000000000000000000000000000000000000000000000000001212121212120000000000001200000203030300000016020503030303030303030303030303030608080000000000000000000000000000000000000000000000000000000000000000000000000000000000000016
121212800a0a0a1616161600420a001612121200000000001212120000000000000000000000000000000000000012000000120002050803030303030303030000020303030703030303030303070303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212160a0a0a0a00165785850a0a161212120000000012121200000000000000000000000000000000000000000000000000020503030303030303030303030000000012121212000806000008060800120012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212003a10100a6810856a0a600a001216000000001212000000000000000000000000000000000000000000000000000000020303030703030303030303030000001212121212121200000000000000121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121216101010101010850a0a0a0a160000330012121200000000000000000000000000000000030303030303030303030000000000000000000003030303030000121212121212000000000000001212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12000010101042101047420a6e0000b100001200120000000000000012000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12123d0a0a0a0a0a0d850a0a0e000000000000120000020303031212000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0d0e0047010a0000001200020508030303030303000000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0e0d160057850a0a0c00000205030303030303030303020303030000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212650e1212161685420a10620c00000803030703030303030303030303000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212120012121216850a0a100a0a00000000080808000003030303030303000000000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121236330057854785576a004400000002030303070303030303030000000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212000000000000000000850a000000000000000000000000000303030000000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000004900005747000000000000000000000000000000000000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
0000120012120000000000121200121212120000000000001212121200000000000003030000000000000000000303030000001200120000000000000000000000000000000000000000000000000000000000000000000012121212121212120000000000000000000000000000000000000000000000000000000000000000
001212001212b000000000121200121212121212000000000000000000000000000003000000000000000000000003030300000000120000000000000000000000000000000000000000000000000000000000000000001212121212121212120000000000000000000000000000000000000000000000000000000000000000
000012000000000c0a0c00000000000000000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000000000000000000000000000000000000000000000000001212121200121212000000000000000000000000000000000000000000000000000000000000000000
12120000000000090a0a0c000000000000000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060000000000000000000000000000000000000000001212121212120000000000000000000000000000000000000000000000000000000000000000000000000000
12120000000030090a0a0b000000020303040000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012120000090a00121200000303030400000000000000000000000000120000000000000000000000120000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000012123400000d0c121200000000000000000000000000000000000012000000000000000000000000000000000000000003000000000303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000090a0c0b0c0000000000000000000000000000121212000000000000000000000000000000000000000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001200a000000000090a0a0e0068000000000000000000000012120000000000000000000006060606060600000000000000030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212121200000000000c0a0a0a0a0c00000000000000000000000012000000030000000000000000000000000606000600060000000003030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121200000000000000090a1818190a0a0a6a0000000000000000000000000000030000000000000000000000000000000000000000030300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000400a0a1e1b1b1818190a0000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000090a0a0a0a1e1e1b1b1c0a6000000000000002050700000000000000000000000000000000000000000000000000030603030600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16000000000000000d620a0a0a1a1b1c1f0a0a0a0c0000000002060600000000000000000000000000000000000000000000000000000000000000000000001616000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1600003000003000000d0a0a0a1d1e1f0a650a0a440a0c000000000000000000000000000000000000000000000000000000000000000000000000000000001616000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
1616160000370034000000090a0a0a0a0a0a0a0a0a0a0a0e0000000000000000000000000000000000000000000000000000000000000000000000000016161616161600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001515
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

