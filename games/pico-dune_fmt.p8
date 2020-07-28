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
self.cj,self.ck=0,self.process
if(self.life>0 and self.ck>0) self.bv=not self.bv
self.process=ci
end
ch=[[id|name|obj_spr|ico_spr|type|w|h|z|trans_col|parent_id|parent2_id|owner|col1|col2|icol1|icol2|ico_w|ico_h|req_id|req_level|req_faction|max|cost|power|arms|hitpoint|speed|range|fire_type|fire_rate|norotate|altframe|framecount|life|frame|process|spent|fire_cooldown|hit|flash_count|col_cycle_pos|col_cycle_src|col_cycle|description|func_init|func_draw|func_update|func_onclick
1|cONSTRUCTION yARD|64|170|2|2|2|1||nil|||||||2|2|nil|1|||100|0|0|1600|0|||||||0|0|0|0|0|0|1|1|||aLL STRUCTURES ARE~BUILT BY THE~CONSTRUCTION YARD.||||factory_click
2|lARGE cONCRETE sLAB|16|162|2|2|2|1||1|||||7|5|2|2|1|4|||20|0|0|0|0|||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
3|sMALL cONCRETE sLAB|16|162|2|1|1|1||1|||||6|6|2|2|1|1|||5|0|0|0|0|||||||0|0|0|0|0|0|1|1|||uSE CONCRETE TO MAKE A~STURDY FOUNDATION FOR~YOUR STRUCTURES.||||
4|dEFENSIVE wALL|133|164|2|1|1|1||1|||||||2|2|7|4|||50|0|0|200|0|||||||0|0|0|0|0|0|1|1|||tHE wALL IS USED FOR~PASSIVE DEFENSE.||||
5|wINDTRAP|66|172|2|2|2|1||1|||||||2|2|1|1|||300|-100|0|800|0||||||10|0|0|0|0|0|0|1|1|11|12,12,12,12,13,1,1,1,1,13|tHE WINDTRAP SUPPLIES~POWER TO YOUR BASE.~wITHOUT POWER YOUR~STRUCTURES WILL DECAY.||||
6|sPICE rEFINERY|68|174|2|3|2|1||1|||||||2|2|1|1|||400|30|0|1800|0||||||10|0|0|0|0|0|0|1|1||11,10,8,8|tHE rEFINERY CONVERTS~SPICE INTO CREDITS.||draw_refinery||
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
17|sTARPORT|61|228|2|3|3|1||1|||||11|3|2|2|6|6||1|500|50|0|2000|0|||||||0|0|0|0|0|0|1|1|11|12,12,12,12,13,1,1,1,1,13|tHE sTARPORT IS USED TO~ORDER AND RECEIVED~SHIPMENTS FROM~c.h.o.a.m.||draw_refinery||factory_click
18|hOUSE OF ix|131|224|2|2|2|1||1|||||||2|2|12|5|||500|40|0|1600|0|||||||0|0|0|0|0|0|1|1|||tHE ix rESEARCH~fACILITY ADVANCES YOUR~hOUSE'S TECHNOLOGY.||||
19|pALACE|58|226|2|3|3|1||1|||||||2|2|17|8||1|999|80|0|4000|0|||1750||||0|0|0|0|0|0|1|1|||tHIS IS YOUR pALACE.||||
20|iNFANTRY sOLDIER|49|236|1|0.5|0.5|1|11|9|||||15|3|2|2||2|-3||60||2|100|0.05|2|1|5|1|48|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
21|lIGHT iNFANTRY sQUAD|48|236|1|1|1|1|11|9|||||15|3|2|2||2|-3||100||4|200|0.05|2|1|5|1|49|10|0|0|0|0|0|0|1|1|||iNFANTRY ARE LIGHTLY~ARMOURED FOOTSOLDIERS,~WITH LIMITED FIRING~RANGE AND SPEED.||||
22|hEAVY tROOPER|49|194|1|0.5|0.5|1|11|10|||||||2|2||3|-1||100||4|440|0.1|3|1|5|1|48|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
23|hEAVY tROOPERS|48|194|1|1|1|1|11|10|||||||2|2||3|-1||200||8|440|0.1|3|1|5|1|49|10|0|0|0|0|0|0|1|1|||tROOPERS ARE HEAVILY~ARMOURED FOOTSOLDIERS,~WITH IMPROVED FIRING~RANGE AND SPEED.||||
24|fREMEN|48|236|1|1|1|1|11|||0|9|4|9|1|2|2||8|1||0||8|880|0.1|3|1|3|1|49|10|0|0|0|0|0|0|1|1|||tHE fREMEN ARE NATIVE~TO dUNE. eLITE FIGHTERS~IN ALLIANCE WITH THE~aTREIDES.||||
25|sABOTEUR|48|236|1|0.5|0.5|1|11|||0|1|0|13|1|2|2||8|2||0||150|160|0.4|0|1|37.5|1|49|10|0|0|0|0|0|0|1|1|||tHE sABOTEUR IS A~SPECIAL MILITARY UNIT,~TRAINED AT AN oRDOS~pALACE. cAN DESTROY~ALMOST ANY STRUCTURE OR~VEHICLE.||||
26|sARDAUKAR|48|236|1|1|1|1|11|||0|14|2|14|2|2|2||4|||0||5|440|0.1|1||1.25||||0|0|0|0|0|0|1|1|||tHE sARDUKAR ARE THE~eMPEROR'S ELITE TROOPS.~WITH SUPERIOR FIREPOWER~AND ARMOUR.||||
27|tRIKE|51|204|1|1|1|1|11|11|17||||15|4|2|2||2|||150||8|400|0.6|3|1|5||||0|0|0|0|0|0|1|1|||tHE tRIKE IS A LIGHTLY-~ARMOURED, 3-WHEELED~VEHICLE, WITH LIMITED~FIRING RANGE, BUT RAPID~SPEED.||||
28|qUAD|52|206|1|1|1|1|11|11|17||||||2|2||3|||200||10|520|0.5|3|1|5||||0|0|0|0|0|0|1|1|||tHE qUAD IS A LIGHTLY-~ARMOURED, 4-WHEELED~VEHICLE. sLOWER THAN~THE tRIKE, BUT STRONGER~ARMOUR AND FIREPOWER.||||
29|cOMBAT tANK|53|196|1|1|1|1|11|12|17||||||2|2|7|4|||300||38|800|0.25|4|1|9.5||||0|0|0|0|0|0|1|1|||tHE cOMBAT tANK IS A~MEDIUM ARMOURED TANK,~FIRES HIGH-EXPLOSIVE~ROUNDS.||||
30|sIEGE tANK|55|198|1|1|1|1|11|12|17||||15|4|2|2|7|6|||600||45|1200|0.2|5|1|11.25||||0|0|0|0|0|0|1|1|||tHE mISSILE tANK IS A~MEDIUM ARMOURED TANK,~WHICH FIRES MISSILES.~lONG-RANGE, BUT~INACCURATE.||||
31|rOCKET lAUNCHER|54|202|1|1|1|1|11|12|17||||15|4|2|2|7|5|||450||112|400|0.3|9|2|28||||0|0|0|0|0|0|1|1|||tHE sIEGE tANK IS A~HEAVY ARMOURED TANK,~WHICH HAS DUAL CANNONS,~BUT IS SLOW.||||
32|hARVESTER|50|192|1|1|1|1|11|12|17||||12|12|2|2||2|||300||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|||tHE hARVESTER SEPARATES~SPICE FROM THE SAND &~RETURNS RAW SPICE TO~THE rEFINERY FOR~PROCESSING.||||
33|cARRYALL|73|238|1|1|1|8|11|13|||||11|3|2|2|13|5|||800||0|400|0.75|0||0||||0|0|0|0|0|0|1|1|||tHE cARRYALL IS A LIGHTLY~ARMOURED AIRCRAFT WITH~NO WEAPONS. mAINLY USED~TO LIFT+TRANSPORT~hARVESTERS.||||
34|oRNITHOPTER|160|166|1|1|1|4|11|13|||||||2|2|13|7|-3||600||75|20|1|9|2|20||161|5|0|0|0|0|0|0|1|1|||tHE oRNITHOPTER IS A~LIGHTLY ARMOURED~AIRCRAFT THAT FIRES~ROCKETS.hIGHLY MANOUVERABLE~+ FASTEST AIRCRAFT ON~dUNE.||||
35|mcv|176|192|1|1|1|1|11|12|||||0|5|2|2|7|4|||900||0|600|0.1|0||0||||0|0|0|0|0|0|1|1|||tHE mcv (mOBILE~cONSTRUCTION vEHICLE)~SCOUT VEHICLE IS USED~TO FIND AND DEPLOY NEW~BASE LOCATIONS.||||
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
local cl=cm(ch,"|","\n")
ch={}
for cn=2,46 do
co={}
for cp=1,48 do
local ce=cl[cn][cp]
if(cp!=2 and cp<43) ce=tonum(ce)
if cp==44 then
cq,ce=cm(ce,"~"),""
for line in all(cq) do
ce=ce.."\n"..line
end
end
co[cl[1][cp]]=ce
end
ch[tonum(cl[cn][1])]=co
end
for cn=-2,66 do
bg[cn]={}
for cr=-2,66 do
bg[cn][cr]=0
end
end
cursor={
w=8,
h=8,
cs=function(self)
return{
ct=self.ct+(not cu and cv or 0)+2,
cw=self.cw+(not cu and cx or 0)+1,
w=1,
h=1
}
end,
cy=function(self)
spr((bm and bm.type==1 and bm.owner==1 or ca) and 1,
self.ct,self.cw)
end
}
for cn=1,2 do
for cc=0,31 do
for cb=0,127 do
local cz=nil
local da=mget(cb,cc)
if cn==1 and da==1 then
db,dc=cb*8,cc*8
cv,cx,cz=db-56,dc-56,ch[1]
elseif cn==2
and da>=48 then
for dd,de in pairs(ch) do
if(de.obj_spr!=nil and de.obj_spr==da) cz=de break
end
end
if cz!=nil then
local df,dg=cb,cc
if(df>63) dg+=31 df-=64
mset(cb,cc,0)
cg(cz,df*8,dg*8)
end
end
end
end
dh=cg(ch[99],-8,-8)
dh.di=cocreate(function()
while true do
if(not bp) dj()
if u%60==0 then
n={}
for dk,dl in pairs(m) do
n[dl:dm()]=dk
end
dn={}
if bb then
for cn=0,124,4 do
for cr=0,124,4 do
local cb,cc=cn/2,cr/2
if(cc>=32) cb+=64 cc-=32
local dp=mget(cb,cc)
local dq=sget((dp*8)%128+4,(dp*8)/16)
if(bg[cn/2][cr/2]==16) dn[(cn/2/2)..","..(cr/2/2)]=dq!=11 and dq or 15
end
yield()
end
end
dr,ds,dt,du=0,0,false,{0,0}
for dd,dv in pairs(l) do
if dv.owner==1 or(bb and dw(dv)) then
dn[flr(dv.ct/2/8)..","..flr(dv.cw/2/8)]=dv.col1
end
if dv.owner==1 then
dr-=dv.power
if(dv.id==7) dt=true
if(sub(dv.name,1,5)=="sPICE") ds+=1000
end
du[dv.owner]+=1
r[dv.dx][dv.id]=dv
end
for dd,dl in pairs(m) do
if bb and(dl.owner==1 or dw(dl) and dl.z==1) then
dn[flr(dl.ct/2/8)..","..flr(dl.cw/2/8)]=dl.col1
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
function cg(cz,ct,cw,owner,ee)
local ef=eg(cz,ct,cw,cz.type,nil,k[cz.func_init],k[cz.func_draw],k[cz.func_update],nil)
ef.eh,ef.life=eg(cz,109,0,3,ef,nil,nil,k[cz.func_onclick]),ei and cz.hitpoint/2 or cz.hitpoint
ef.owner=ef.owner or owner or ej(ct,cw,db,dc)<75 and 1 or 2
ef.dx,ef.ek=owner or ef.owner,{}
for de in all(ch) do
local el=de.req_faction
if(de.parent_id!=nil and(de.parent_id==ef.id or de.em==ef.id))
and(el==nil
or(el>0 and el==b)
or(el<0 and-b!=el))
then
add(ef.ek,
eg(de,109,0,4,ef,nil,nil,function(self)
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
ef.en,ef.col1,ef.col2=b,c,d
else
ef.en,ef.col1,ef.col2,ef.eh.func_onclick=e,f,g,nil
if(ef.id==19) eo=ef
end
if cz.col1 then
ef.col1,ef.col2=cz.col1,cz.col2
end
if(ef.z>1) ef.owner=0
local ep,eq=flr(ct/8),flr(cw/8)
if cz.type==2 then
local er=(cz.id==2 or cz.id==3)
for es=0,cz.w-1 do
for et=0,cz.h-1 do
eu(ep+es,eq+et,er and 16 or ef.owner==1 and 149 or 27)
end
end
if(not er) add(l,ef)
if ef.id==6 and ef.ev==nil then
local ew,ex=ey(ef)
cg(ch[32],ew,ex,ef.owner,ef)
end
else
if(ef.norotate!=1) ef.ez=flr(rnd"8")*.125
if ef.arms>0 then
ef.fa=function(self)
self.fb,self.fc,self.fd,self.fe,self.ff=4,self.ct+4,self.cw+4,self.fg.ct+self.fg.w/2,self.fg.cw+self.fg.h/2
local fh,fi=self.fe-self.fc,self.ff-self.fd
local fj=sqrt(fh*fh+fi*fi)
self.fk,self.fl=(fh/fj)*2,(fi/fj)*2
sfx(self.arms<50 and 60 or 58,3)
fm(self)
end
if(ef.id==15 or ef.id==16) eu(ep,eq,149)
else
ef.fn=ee
if(ef.id==32) ef.fo=0
end
add(m,ef)
fp(ef)
end
fm(ef)
return ef
end
function eg(fq,ct,cw,fr,ev,func_init,func_draw,func_onclick)
local fs={
ft=fq,
id=fq.id,
hitpoint=fq.hitpoint,
ct=ct,
cw=cw,
z=fq.z,
fu=ct/8,
fv=cw/8,
type=fr,
ev=ev,
func_onclick=func_onclick,
w=fq.w*8,
h=fq.h*8,
fw=fq.obj_spr,
fx=fq.w,
fy=fq.h,
col_cycle=cm(fq.col_cycle),
cs=function(self)
return{
ct=self.ct,
cw=self.cw,
w=(self.type>2 and self.type<5 and 16 or self.w)-1,
h=(self.type>2 and self.type<5 and 16 or self.h)-1
}
end,
cy=func_draw or function(self)
if self.type<=2
and(self.ct+self.w<cv
or self.ct>cv+127
or self.cw+self.h<cx
or self.cw>cx+127+self.z)
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
if self.ez then
if not self.fz or self.fz>.025 then
for cn=1,2 do
if(cn==2 or self.speed>0) ga(self.obj_spr%16*8,flr(self.obj_spr/16)*8,self.ct,self.cw-(cn==2 and self.z or 0),.25-self.ez,1,self.trans_col,cn==1 and 5 or flr(self.flash_count)%2==0 and 7 or nil)
end
end
else
if self.type>2 and self.type<5 then
local gb=self.type==4 and self or self.ev
rectfill(self.ct-1,self.cw-1,self.ct+16,self.cw+19,0)
local gc=gb.hitpoint
local ce=self.process==1 and 15*(gb.life/100) or 15*(gb.life/gc)
if(gb.life>0 and not bp) rectfill(self.ct,self.cw+17,self.ct+ce,self.cw+18,self.process==1 and 12 or gb.life<gc*.33 and 8 or gb.life<gc*.66 and 10 or 11)
pal(11,gb.icol1) pal(3,gb.icol2)
end
if self.type>2 then
spr(self.ico_spr,self.ct,self.cw,self.ico_w,self.ico_h)
else
bt(self)
end
end
if self.fc then
if self.fire_type==1 then
pset(self.fc,self.fd,rnd"2"<1 and 8 or 9)
else
local gd=self.fire_type==2
ge(self.fc,self.fd,0,
0,0,
gd and .15 or 2,
-.01,
gd and 20 or 2.5,
self.id==40 and{11} or gd and cm("7,7,10,9,8,2,13,6,7") or{15},
rnd"2"<1 and 0xa5a5.8 or 0)
end
end
if(self.life<self.hitpoint*.33 and self.altframe==nil and rnd"10"<1 and self.type<=2) ge(self.ct+3.5,self.cw+3.5,1,.1,-.02,.05,-.002,80,cm("10,8,9,6,5"),rnd"2"<1 and 0xa5a5.8 or 0)
self.hit=0
end,
gf=function(self)
local life=self.life
self.flash_count=max(self.flash_count-.4,1)
if self.hit>0 and self.dx>0 then
dz(true)
if(dy==0 or stat(24)>5) dy=1 music"0"
if(self.arms>0 and self.fb==0) gg(self,self.gh)
if(self.obj_spr<=49 and life<100) self.fx,self.fy=0.5,0.5
if(life<250 and self.fb!=7) gi(self,r[self.dx][14] or self.fn)
end
if(self.type<=2 and life<=0 and self.fz==nil) self.fb=5 self.di=nil self.fz=(self.type==2 and 1 or .5) sfx(self.type==2 and 53 or 54,3) ed+=((self.type==2 or self.id==38) and 0.25 or 0)
if self.fz then
self.fz-=.025
if self.fz<=0 then
if self.type==2 then
for es=0,self.fx-1 do
for et=0,self.fy-1 do
eu(self.ct/8+es,self.cw/8+et,15)
end
end
del(l,self)
v[self.gh.dx]+=1
else
local gj,gk=self:cd()
if(cf(gj,gk)<9) eu(gj,gk,20)
if(self.id<=17) eu(gj,gk,15)
del(m,self)
if self.id==42 then
gl(self,gj,gk,
function(dl,ct,cw)
if(cf(ct,cw)==0) eu(ct,cw,8)
end,
4,true)
end
if(self.gh) x[self.gh.dx]+=1
end
if(bm==self) bm=nil
else
if(rnd(self.type==2 and 2 or 8)<1) gm(self.ct+rnd(self.w),self.cw+rnd(self.h))
end
end
if self.framecount!=nil then
self.frame+=1
if self.frame>self.framecount then
self.frame=0
if self.altframe
and self.fb==2 then
self.obj_spr=self.fw+(self.altframe-self.obj_spr)
end
if self.col_cycle then
self.col_cycle_pos+=1
if(self.col_cycle_pos>#self.col_cycle) self.col_cycle_pos=1
end
end
end
if self.fc then
self.fc+=self.fk
self.fd+=self.fl
if ej(
self.fc,self.fd,
self.fe,self.ff)<2
then
gm(self.fc,self.fd,self.fire_type)
local fg=self.fg
if ej(
self.fc,self.fd,
fg.ct+fg.w/2,
fg.cw+fg.h/2)<4
then
fg.life-=self.arms
fg.hit,fg.gh=self.fire_type,self
if self.id==40 and fg.speed!=nil then
fg.owner,fg.en,fg.col1,fg.col2=self.owner,self.en,self.col1,self.col2
fp(self)
elseif fg.gn then
fg.en,fg.col1,fg.col2,fg.gn=fg.gn,fg.go,fg.gp,nil
fp(fg)
end
end
self.fc=nil
end
end
if self.process>0
and not self.bv
and not self.gq then
if self.process==1 and self.spent>self.cost then
self.gq=true
if(self.ev.owner==1) sfx"56"bz("cONSTRUCTION cOMPLETE")
if self.ft.type==1
and self.parent_id!=1 then
local ew,ex=ey(self.ev)
cg(self.ft,ew,ex,self.ev.owner,self.ev)
gr(self)
end
elseif self.process==2 and life>self.hitpoint then
self.process=0
if self.type==1 and self.speed>0 then
self.gs.col_cycle={0}
self.fb=0
self.ct,self.cw=ey(self.fn)
end
else
if self.cj>(self.process==1 and 3 or 100) then
if(gt(-1,self.process==1 and self.ev or self)) self.cj=0 self.spent+=1
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
gu=function(self,ct,cw)
self.ct,self.cw=ct,cw
end,
dm=function(self)
local ct,cw=self:cd()
return ct..","..cw
end,
cd=function(self)
return flr(self.ct/8),flr(self.cw/8)
end
}
for dk,gv in pairs(fq) do
if fs[dk]==nil and gv!=""then
fs[dk]=gv
end
end
if(func_init) func_init(fs)
return fs
end
function gt(gw,fs)
if(ec(j[fs.owner])+gw<0) return false
j[fs.owner]+=sgn(gw)*shr(abs(gw),16)
if(fs.owner==1) sfx"63"
return true
end
function gm(ct,cw,gx)
ge(ct,cw,2,
0,0,.1,0,gx==1 and 5 or 30,cm("5,7,10,8,9,2"),rnd"2"<1 and 0xa5a5.8 or 0)
end
function fm(gy)
if(gy.owner!=1 and gy.fb!=4) return
local gz=gy.type==2 and 3 or 2
for es=-gz,gz do
for et=-gz,gz do
local ha,hb=flr(gy.ct/8)+es,flr(gy.cw/8)+et
bg[ha][hb]=16
hc(ha,hb)
for fi=-1,1 do
for fh=-1,1 do
hc(ha+fh,hb+fi)
end
end
end
end
end
function _update60()
hd()
u+=1
end
function _draw()
he()
hf()
end
function hc(ct,cw)
if(ct<0 or ct>#bg or cw<0 or cw>#bg) return
local hg=0
if bg[ct][cw]!=0 then
if(bg[ct][cw-1]>0) hg+=1
if(bg[ct-1][cw]>0) hg+=2
if(bg[ct+1][cw]>0) hg+=4
if(bg[ct][cw+1]>0) hg+=8
bg[ct][cw]=1+hg
end
end
function hd()
hh,hi,hj=stat"32",stat"33",stat"34"
hk,hl,hm=(hj==1 and hn!=hj) or btnp"4",(hj>0) or btn"4",(hj==2 and hn!=hj) or btnp"5"
for dk=0,1 do
if(btn(dk)) y+=dk*2-1
if(btn(dk+2)) ba+=dk*2-1
end
ho,hp=mid(0,hh+y,127),mid(0,hi+ba,127)
cursor.ct,cursor.cw=ho,hp
if not bp then
if(ho<4) cv-=2
if(ho>123) cv+=2
if(hp<4) cx-=2
if(hp>123) cx+=2
cv,cx=mid(cv,384),mid(-8,cx,384)
for dd,dl in pairs(m) do
if dl then
if dl.di and costatus(dl.di)!="dead"then
assert(coresume(dl.di,dl))
else
dl.di=nil
end
if hq
and fget(cf(dl:cd()),2)
and ej(hr,hs,dl.ct,dl.cw)<1
and dl.z==1
then
del(m,dl)
ht=.01
end
end
end
for dk,hu in pairs(q) do
hu.fi+=hu.hv
hu.ct+=hu.fh
hu.cw+=hu.fi
hu.ez+=hu.hw
hu.life+=1
if(hu.life>=hu.hx) del(q,hu)
end
end
hy()
hn,bx,br=hj,bm,bi
end
function hz(ct,cw)
local ce=cf(ct,cw)
return ce>=2 and ce<=8
end
function fp(dl,ia)
dl.fb,dl.ib=ia or 0,nil
dl.di=cocreate(function(self)
while true do
if self.z>1 then
ic(self,
mid(flr(self.fu+rnd"32")-16,64),
mid(flr(self.fv+rnd"32")-16,64))
end
if rnd"250"<1 and self.arms>0 and self.fb!=8 then
local gj,gk=self:cd()
gl(self,gj,gk,
function(dl,ct,cw)
local fg=m[n[ct..","..cw]]
if(fg!=ie and fg.dx!=dl.dx and bg[ct][cw]==16 and fg.z==1) gg(dl,fg) return true
end,
self.range)
elseif self.id==34 then
ig(self)
end
local fn=self.gs or self.fn
if self.id==32 then
if self.fb==0 or self.fb==9 then
if self.fo<=1500
and self.fb!=7 and self.fb!=9 then
self.gs=nil
local ih,ii
local ij,ik=self:cd()
if hz(ij,ik) and not self.il then
ih,ii=ij,ik
else
gl(self,ij,ik,
function(dl,ct,cw)
if hz(ct,cw) and rnd"10"<1 then
ih,ii=ct,cw
return true
end
end,
10)
end
if ih and ii then
ic(dl,ih,ii)
if(hz(dl:cd())) dl.fb=6
end
end
elseif self.fo>=1500
and self.fb!=7 then
self.ih,self.ii=self:cd()
gi(self,fn or r[dl.dx][6])
elseif self.fb==6 then
self.il=false
im(dl.ct,dl.cw,dl.ez+.75+rnd".2"-.1)
local io=dl:dm()
p[io],self.fo,self.name=(p[io] or 1000)-1,(self.fo or 0)+.5,"hARVESTER ("..flr(self.fo/1500*100).."% fULL)"
if p[io]<=0 then
local ep,eq=self:cd()
for et=-1,1 do
for es=-1,1 do
ce=cf(ep+es,eq+et)
eu(ep+es,eq+et,
(es==0 and et==0) and 0 or((ce>1 and ce<8) and 8 or ce)
)
end
end
self.fb=0
end
if(self.fo%300==0) self.il=true self.fb=0
end
end
if self.id>26 then
if self.fb==9 then
if fn.life>0 and not fn.ip and self.life>0 then
fn.bs,self.fb,self.ez,self.ct,self.cw=false,8,.25,fn.ct+16,fn.cw+4
if(bm==self) bm=nil
if self.fo and fn.id==6 then
fn.ip=true
while self.fo>0 do
self.fo-=1
if flr(self.fo)%4==0 then
if tonum(eb)<ds then
gt(2,self)
else
bz"sPICE LOST. bUILD sILO"
end
end
yield()
end
self.fo,fn.ip,self.fb=0,false,0
if(self.ih) ic(self,self.ih,self.ii,0,true)
else
self.process,self.cj,fn.col_cycle_src,fn.col_cycle=2,0,8,cm("7,10,0,0,7,0,0")
end
end
end
end
::skip_end_guard::
yield()
end
end)
end
function ey(fg)
local ew,ex=gl(fg,flr((fg.ct+8)/8),flr((fg.cw+8)/8),iq,nil,true)
return ew*8,ex*8
end
function im(ct,cw,ez)
local ir,is=sin(ez)*5.5,-cos(ez)*5.5
if(rnd"5"<1) ge(ct+ir+3.5,cw+is+3.5,rnd"2",.15,0,.1,-.01,25,cm("2,4,9,15"),0xa5a5.8)
end
function gg(dl,fg)
if dl.id!=19 then
dl.fb,dl.fg=3,fg
dl.di=cocreate(function(self)
while fg.life>0 do
local it=ej(dl.ct,dl.cw,fg.ct,fg.cw)
if it>dl.range*5
and dl.speed>0 then
ic(dl,flr(fg.ct/8),flr(fg.cw/8),dl.range*5)
if dl.id==25 or dl.id==38 then
dl.life=0
for cn=1,dl.id/3 do
gm(dl.ct+rnd"32"-16,dl.cw+rnd"32"-16,2)
end
fg.life-=(100+rnd"50")
fg.gh=dl
return
end
end
if not dl.norotate then
local iu=atan2(dl.ct-fg.ct,dl.cw-fg.cw)
while(dl.ez!=iu) do
iv(dl,iu)
end
end
if it<=dl.range*5 then
if(dl.fire_cooldown<=0 and not dl.fc) dl.fa(dl) dl.fire_cooldown=dl.fire_rate
elseif dl.speed==0 then
fp(dl)
end
yield()
if(dl.id==40 or dl.id==34 or fg.en==dl.en or fg.ib) break
end
fp(self)
end)
else
local iw={24,25,38,38}
gg(cg(ch[iw[dl.en]],dl.ct,dl.cw,dl.owner),fg)
dl.fire_cooldown=1750
end
end
function gl(dl,ct,cw,ix,iy,iz)
for t=0,iy or 64,.02 do
local es,et=flr(ct+t*cos(t)),flr(cw+t*sin(t))
if(ix(dl,es,et)) return es,et
if(not iz) yield()
end
end
function cf(cb,cc)
if(cc>31) cb+=64 cc-=32
return mget(cb,cc)
end
function eu(cb,cc,ja)
if(cc>31) cb+=64 cc-=32
mset(cb,cc,ja)
end
function iq(dl,ct,cw)
return not fget(cf(ct,cw),0)
and n[ct..","..cw]==nil
end
function ic(dl,ct,cw,jb,jc,ia)
local jd=dl.z>1
if jc then
local je=r and r[dl.dx][33] or false
if je and not je.ib then
je.ib,dl.ib=dl,je
je.di=cocreate(function(jf)
ic(jf,flr(dl.ct/8),flr(dl.cw/8))
if(bm==dl) bm=nil
if dl.life>0 then
del(m,dl)
ic(je,ct,cw)
dl:gu(je.ct,je.cw)
add(m,dl)
fp(dl,ia)
end
fp(je)
end)
return
end
end
::restart_move_unit::
if not jd and not iq(nil,ct,cw) then
ct,cw=gl(dl,ct,cw,iq)
end
dl.ij,dl.ik,dl.jg,dl.fb=ct,cw,dl.fb,1
dl.jh=nil
local ji,jj,jk={ct=flr(dl.ct/8),cw=flr(dl.cw/8)},{ct=dl.ij,cw=dl.ik},function(jl) return shl(jl.cw,8)+jl.ct end
local jm,
jn={
jo=ji,
jp=0,
jq=jr(ji,jj)
},{}
jn[jk(ji)]=jm
local js,jt,ju,jv,count={jm},1,jk(jj),32767.99,0
while jt>0 do
local cost,jw=jv
for cn=1,jt do
local jx=js[cn].jp+js[cn].jq
if(jx<=cost) jw,cost=cn,jx
end
jm=js[jw]
js[jw],jm.jy=js[jt],true
jt-=1
local hu=jm.jo
if jk(hu)==ju then
hu={jj}
while jm.jz do
jm=jn[jk(jm.jz)]
add(hu,jm.jo)
end
dl.jh=hu
goto end_pathfinding
end
for ka in all(kb(hu,jd)) do
local id=jk(ka)
local kc=not jd and fget(cf(ka.ct,ka.cw),1) and 4 or 1
if(hu.ct!=ka.ct and hu.cw!=ka.cw) kc+=.2
local kd,ke=
jn[id],
jm.jp+kc
if not kd then
kd={
jo=ka,
jp=jv,
jq=jr(ka,jj)
}
jt+=1
js[jt],jn[id]=kd,kd
end
if not kd.jy and kd.jp>ke then
kd.jp,kd.jz=ke,hu
end
end
count+=1
if count%4==0 then
yield()
if(count>3000 or stat(0)/2048>.8) goto end_pathfinding
end
end
::end_pathfinding::
dl.jg,dl.fb=dl.fb,2
if dl.jh!=nil then
for cn=#dl.jh-1,1,-1 do
local jl=dl.jh[cn]
if not dl.norotate then
local iu=atan2(
dl.ct-(jl.ct*8),
dl.cw-(jl.cw*8))
while(dl.ez!=iu) do
iv(dl,iu)
end
end
if(not jd and not iq(nil,jl.ct,jl.cw)) goto restart_move_unit
local kf,kg=dl.speed or .5,sqrt((jl.ct*8-dl.ct)^2+(jl.cw*8-dl.cw)^2)
local kh,ki=kf*(jl.ct*8-dl.ct)/kg,kf*(jl.cw*8-dl.cw)/kg
for cn=0,kg/kf-1 do
n[jl.ct..","..jl.cw]=dl
dl.ct+=kh
dl.cw+=ki
yield()
end
dl.ct,dl.cw,n[jl.ct..","..jl.cw]=jl.ct*8,jl.cw*8,dl
fm(dl)
if(ej(dl.ct,dl.cw,dl.ij*8,dl.ik*8)<=(jb or 0)) break
end
end
dl.fb=0
end
function he()
cls"15"
camera(cv+(16-rnd"32")*ed,cx+(16-rnd"32")*ed)
ed=(ed>0.05) and ed*0.95 or 0
if hq then
for cn=1,#hq do
if(cn%2==1) fillp(0xa5a5.8)
circfill(
hq[cn][1]+4,
hq[cn][2]+4,4,
kj[cn%#kj+1])
fillp()
end
if(ht>0) spr(88+ht,hr,hs)
end
palt(11,true)
palt(0,false)
map(0,0,0,0,64,32)
map(64,0,0,256,64,32)
for dd,dv in pairs(l) do
if not bp then
dv:gf()
if(dv.bq) dv.bq:gf()
end
dv:cy()
if(dv==bm) rect(bm.ct,bm.cw,bm.ct+bm.w-1,bm.cw+bm.h-1,7)
end
pal()
for hu=1,2 do
for dd,dl in pairs(m) do
if(hu==1 and dl.z==1) or(hu==2 and dl.z>1) then
if(not bp) dl:gf()
if(dl.process!=2 or dl.speed==0) dl:cy()
if(dl==bm) spr(17,bm.ct,bm.cw)
end
end
end
for dk,hu in pairs(q) do
if(hu.kk) fillp(hu.kk)
circfill(hu.ct,hu.cw,hu.ez,hu.kl[flr((#hu.kl/hu.hx)*hu.life)+1])
fillp()
end
local km,kn=flr(cv/8),flr(cx/8)
palt(0,false)
palt(11,true)
for es=km-1,km+16 do
for et=kn-1,kn+16 do
if bg[es][et]!=0 and bg[es][et]!=16 then
spr(bg[es][et]+31,es*8,et*8)
elseif bg[es][et]<16 then
rectfill(es*8,et*8,es*8+7,et*8+7,0)
end
end
end
end
function bz(ko)
be,bf=ko,500
end
function hf()
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
bc,kp=bb and 1 or 59,bb and 1 or-1
if(kp<1) bz("pOWER LOW.bUILD wINDTRAP")
sfx"55"
end
bd=bb
if bc>0 and bc<60 then
bc+=kp
clip(
max(108-bc,91),
max(108-(bc>20 and bc-20 or 0),91),
min(bc*2,33),
min((bc>20 and bc-20 or 1)*2,33))
for cn=1,300 do
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
local ir,is=92+cv/16,92+cx/16
rect(ir,is,ir+7,is+7,7)
if bm and bm.ico_spr then
bm.eh:gu(109,20)
bm.eh:cy()
kq,kr=nil,nil
if bm.owner==1 then
if bm.bq then
bm.bq:gu(109,44)
bm.bq:cy()
end
if bm.life<bm.hitpoint
and bm.id!=4
and(bm.type==2
or bm.speed==0) then
kq=eg(ch[80],117,28,5,{},nil,bu,repair_click)
kq:cy()
end
if(bm.id==19
and bm.fire_cooldown<=0)
or bm.id==35
then
kr=eg(ch[81],109,29,5,{},nil,bu,by)
kr:cy()
end
end
end
pal()
if bm
and bm.bq
and(bm.bq.type==4
and bm.bq.speed==0)
and bm.bq.life>=100 then
local ks,kt=flr((cursor.ct+cv)/8),flr((cursor.cw+cx)/8)
local ku,kv,w,h=ks*8-cv,kt*8-cx,bm.bq.fx,bm.bq.fy
kw,kx,ei=false,false,false
for es=-1,w do
for et=-1,h do
local ce=cf(ks+es,kt+et)
if es==-1 or es==w or et==-1 or et==h then
if(ce==16 or ce>=58) kw=true
else
if(ce>=9 and ce<=15) ei=true
if(n[ks+es..","..kt+et] or ce==0 or ce<8 or ce>16) kx=true
end
end
end
if(kx) kw=false
fillp("0b1110110110110111.1")
rectfill(ku,kv,
ku+bm.bq.w,kv+bm.bq.h,kw and 11 or 8)
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
local ky=1
for cn=1,#bm.ek do
local kz=bm.ek[cn]
if kz.req_id==nil
or r[bm.dx][kz.req_id]
and kz.req_level<=a
then
bm.bn[ky]=kz
if ky>=bh and ky<=bh+2 then
kz:gu(9,28+(ky-bh)*19)
kz:cy()
else
kz:gu(-16,16)
end
bi=bi or bm.bn[1]
if bi==kz then
bl=ky
rect(kz.ct-2,kz.cw-2,
kz.ct+17,kz.cw+17,
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
for dd,la in pairs(bj) do
la:cy()
end
end
palt(11,true)
cursor:cy()
end
function bk(ct,cw,lb,func_onclick,lc)
add(bj,{
ct=ct,
cw=cw,
w=lc or#lb*4+2,
h=8,
lb=lb,
cs=function(self)
return self
end,
cy=function(self)
if(#lb>1) rectfill(self.ct,self.cw,self.ct+self.w,self.cw+self.h,self.ld and c or 6)
? self.lb,self.ct+2,self.cw+2,(#lb>1) and 0 or(self.ld and c or 6)
end,
func_onclick=func_onclick
})
end
function bt(fs)
spr(fs.obj_spr,fs.ct,fs.cw,fs.fx,fs.fy)
end
function hy()
le=false
if bm then
cu=true
lf(kq)
lf(kr)
if(bm.eh and not bp and not le) lf(bm.eh) lf(bm.bq)
if(bp) foreach(bm.ek,lf) foreach(bj,lf)
cu=false
end
if not bp
and not le then
foreach(m,lf)
foreach(l,lf)
end
if hl
and not bp
and ho>89 and ho<122
and hp>90 and hp<123 then
cv,cx=mid(0,(ho-94)*16,400),mid(-8,(hp-94)*16,400)
bm=bx
elseif hk then
if(bm and bm.type<=2) bz(bm.name)
if le then
if(not bp and bm.func_onclick and bm.ev!=nil) bm:func_onclick() bm=bx return
if(bp and bi.lb and bi.func_onclick) bi:func_onclick()
if(bm.owner==1 and bm.type==1 and bm!=bx and bm.speed>0) sfx"62"
if(bm.dx==2 and bx and(bx.type==1 or(bx.id==19 and ca)) and bx.owner==1) bm.flash_count=10 gg(bx,bm) r={{},{}} bm=nil
else
if bm
and bm.owner==1
and bm.speed>0
and bm.fb!=7 then
bm.di=cocreate(function(dl)
ic(dl,flr((cv+ho)/8),flr((cx+hp)/8))
fp(dl)
end)
end
if bm
and bm.bq
and bm.bq.life>=100
and kw then
cg(bm.bq.ft,
flr((cursor.ct+cv)/8)*8,
flr((cursor.cw+cx)/8)*8,1)
gr(bm.bq)
sfx"61"
end
end
ca=false
elseif hm and not bp then
bm,ca=nil,false
end
end
function gr(fs)
fs.life,fs.process,fs.spent,fs.gq=0,0,0,false
end
function lf(fs)
if(fs==nil) return
local lg,lh=cursor:cs(),fs:cs()
fs.ld=lg.ct<lh.ct+lh.w and
lg.ct+lg.w>lh.ct and
lg.cw<lh.cw+lh.h and
lg.cw+lg.h>lh.cw
if hk and fs.ld then
if bp then
bi=fs
else
if(fs.type<=2 and bg[flr((cursor.ct+cv)/8)][flr((cursor.cw+cx)/8)]!=16 or fs.fb==8) return
if bm
and(fs.id==6 and bm.id==32
or fs.id==14 and bm.id>26)
and fs.owner==1 and bm.owner==1
then
gi(bm,fs)
return
else
bm=fs
end
end
le=true
end
end
function gi(dl,li)
li=li or r[dl.dx][1]
dl.fb,li.bs,dl.gs=7,true,li
if(dl.id!=32 or li.id==6) dl.fn=li
dl.di=cocreate(function(dl)
local lj=li.id!=1 and 9 or 0
ic(dl,(li.ct+16)/8,li.cw/8,0,true,lj)
if(dl.ib==nil) fp(dl,lj)
end)
end
lk=0
function dj()
if t()>i and t()%i*2==0 then
local ll=rnd(m)
if ll.owner==2 and ll.arms>0 and ll.fb==0 then
ig(ll)
end
local lm=rnd(l)
if lm.owner==2 then
if lm.bq and lm.bq.ft.type==1 and lm.bq.process!=1 then
local ln=rnd(lm.ek)
lm.bq=ln
ln:func_onclick()
end
if lm.life<lm.hitpoint and lm.process!=2 then
bw(lm,2)
end
end
if lo and lo.type==2
and eo and eo.fire_cooldown<=0 then
gg(eo,lo)
end
end
lk-=1
if lk<0 then
if hq then
hq=nil
else
hq,lp,lq,kj,ht={{rnd"500",rnd"500"}},rnd"1",0,{15,9,4},0
end
lr=rnd"5000"
lk=lr
end
if hq then
if(u%6<1 or#hq<30) and ht==0 then
while#hq<31 do
if(rnd"9"<.5) lq=rnd".04"-.02
hr,hs=hq[#hq][1],hq[#hq][2]
add(hq,{hr+sin(lp),hs-cos(lp)})
lp+=lq
end
end
if(#hq>30) del(hq,hq[1])
if(ht>0) ht+=.01 im(hr,hs,rnd"1")
if(ht>2) ht=0
end
end
function ig(fs)
local lo=lt(fs)
if(lo and dw(lo)) gg(fs,lo)
end
function lt(fs)
local lu
repeat
lu=(rnd"4"<1) and rnd(m) or rnd(l)
until lu.dx!=fs.dx
return lu
end
function dw(fs)
local ct,cw=fs:cd()
return bg[ct][cw]==16
end
function dz(lv)
local ce=peek(0x3115)
if((band(ce,128)>0)!=lv) ce=bxor(ce,128)
poke(0x3115,ce)
end
function ec(ce)
local lw,gv="",abs(ce)
repeat
lw=(gv%0x0.000a/0x.0001)..lw
gv/=10
until gv==0
if(ce<0) lw="-"..lw
return lw
end
function cm(lx,fj,ly)
fj=fj or","
if(ly~=nil) lx=split(lx,ly)
if type(lx)=="table"then
local t={}
while#lx>0 do
local lw=lx[1]
add(t,split(lw,fj))
del(lx,lw)
end
return t
else
return split(lx,fj)
end
end
function ga(ih,ii,ct,cw,iu,w,lz,ma)
local mb,mc=cos(iu),sin(iu)
local md,me,hg=mb,mc,shl(0xfff8,(w-1))
w*=4
mb*=w-0.5
mc*=w-0.5
local mf,mg,w=mc-mb+w,-mb-mc+w,2*w-1
for mh=0,w do
local mi,mj=mf,mg
for mk=0,w do
if band(bor(mi,mj),hg)==0 then
local ml=sget(ih+mi,ii+mj)
if(ml!=lz) pset(ct+mh,cw+mk,ma or ml)
end
mi-=me
mj+=md
end
mf+=md
mg+=me
end
end
function ej(mm,mn,mo,mp)
return abs(sqrt(((mm-mo)/1000)^2+((mn-mp)/1000)^2)*1000)
end
function iv(dl,mq)
local gw=mq-dl.ez
if(dl.z>1) dl.ez=mq
if gw>0.5 then
gw-=1
elseif gw<-0.5 then
gw+=1
end
if gw>0.0087 then
dl.ez+=0.0087
elseif gw<-0.0087 then
dl.ez-=0.0087
else
dl.ez=mq
end
yield()
end
function kb(jl,jd)
local mr={}
for es=-1,1 do
for et=-1,1 do
if(es!=0 or et!=0) ms(jl.ct+es,jl.cw+et,mr,jd)
end
end
return mr
end
function ms(mt,mu,mv,jd)
if(jd or not fget(cf(mt,mu),0) and n[mt..","..mu]==nil and mt>=0 and mu>=0 and mt<=63 and mu<=63) add(mv,{ct=mt,cw=mu})
end
function jr(iu,mw)
return abs(iu.ct-mw.ct)+abs(iu.cw-mw.cw)
end
function ge(ct,cw,ez,fh,fi,hw,hv,life,kl,kk)
local hu={
ct=ct,cw=cw,ez=ez,fh=fh,fi=fi,hw=hw,
life=0,hv=hv,
kl=kl,kk=kk,
mx=cw,hx=life
}
add(q,hu,1)
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
12000010101010101047420a6c0000b100001200120000000000000012000000000000000003030303171819030303030303000000000000000003030303030012120000000000000000000000121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12123d0a0a0a0a0a0d850a0a0e000000000000120000020303031212000000000000000000030303171b1b1b190303030303000000000000000000030303030012000000000000000000000000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0a0a0d0e0047010a0000001200020508030303030303000000000000000000000003031a1b1b1e1e1e1e03030303030000000000000000000303030000000000000000000012120000121212120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120a0a0e0d160057850a0a0c00000205030303030303030303020303030000000000000303031d1b1f0303030303030303030300000003030303030303000000000000000000000012121212121212000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12120d0e1212161685420a10620c00000803030703030303030303030303000000000000030303031a030303030303030300000000000000030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212120012121216850a0a100a0a00000000080808000003030303030303000000000003030303031d1f0303030000000000000000000000000000000003030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121212121236330057854785576a004400000002030303070303030303030000000000030303030303030303030300000000000012000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001212000000000000000000850a000000000000000000000000000303030000000003030303030303030303030303000000120012121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000004900005747000000000000000000000000000000000000000003030303030303030303030303030000120000000000000000000000000000000000000000000000000000000000000000000000000000121212121212120000000000000000000000000000000000000000000000000000000000000000
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
1600003000003000000d0a0a0a1d1e1f0a650a0a440a0c000000000000000000000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000015
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

