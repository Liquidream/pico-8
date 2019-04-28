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
[[1|Construction Yard|64|128|2|2|2|nil|nil|nil|1||100|nil||400|||All structures are built by the construction yard.||
2|Windtrap|66|130|2|2|2|nil|1|1|1||300|100||200|||The windtrap supplies power to your base. Without power your structures will decay.|draw_windtrap|update_bld
3|Small Concrete Slab|||2|1|1|nil|1|1|1||5|nil||0|||Use concrete to make a sturdy foundation for your structures.||
4|Large Concrete Slab|||2|2|2|nil|1|1|4||20|nil||0|||Use concrete to make a sturdy foundation for your structures.||
5|Defensive Wall|||2|1|1|nil|1|7|4||50|nil||50|||The Wall is used for passive defense.||
6|Spice Refinery|68|132|2|3|2|nil|1|2|1||400|30||450|||The Refinery converts spice into credits.||
7|Radar Outpost|||2|2|2|nil|1|2|2||400|30||500|||The Outpost provides radar and aids control of distant vehicles.||
8|Spice Storage Silo|||2|2|2|nil|1|6|2||150|5||150|||The Spice silo is used to store refined spice.||
9|Barracks|||2|2|2|nil|1|7|2||300|10||300|||The Barracks is used to train your Light infantry.||
10|WOR Trooper Facility|||2|2|2|nil|1|7|2||400|10||400|||WOR is used to train your Heavy infantry.||
11|Light Vehicle Factory|||2|2|2|nil|1|6|2||400|20||350|||The Light Factory produces light attack vehicles.||
12|Heavy Vehicle Factory|||2|3|2|nil|1|6|3||600|20||200|||The Heavy Factory produces heavy attack vehicles.||
13|Hi-Tech Factory|||2|3|2|nil|1|7+12|5||500|35||400|||The Hi-Tech Factory produces flying vehicles.||
14|Cannon Turret|||2|1|1|nil|1|7|5||125|10||200|||The Cannon Turret is used for short range active defense.||
15|Rocket Turret|||2|1|1|nil|1|7|6||250|20||200|||The Rocket/Cannon turret is used for both short and medium range active defense.||
16|Repair Facility|||2|3|2|nil|1|7+12|5||700|20||200|||The Repair Facility is used to repair your vehicles.||
17|Starport|||2|3|3|nil|1|6|6||500|50||500|||The Starport is used to order and received shipments from C.H.O.A.M.||
18|House of IX|||2|2|2|nil|1|7+12|5||500|40||400|||The IX Research Facility advances your House's technology.||
19|Palace|||2|3|3|nil|1|17|8||999|80||1000|||This is your Palace.||]]..
[[20|Light Infantry (x3)|||1|1|1||9|9|2|AO|60||4|50|5|2|Infantry are lightly armoured footsoldiers, with limited firing range and speed.||
21|Heavy Troopers (x3)|||1|1|1||10|9|3|HO|100||8|110|10|3|Troopers are heavily armoured footsoldiers, with improved firing range and speed.||
22|Trike|||1|1|1||11+17||2||150||8|100|60|3|The Trike is a lightly-armoured, 3-wheeled vehicle, with limited firing range, but rapid speed.||
23|Quad|||1|1|1||11+17||3||200||10|130|50|3|The Quad is a lightly-armoured, 4-wheeled vehicle. Slower than the Trike, but stronger armour and firepower.||
24|Combat Tank|||1|1|1||12+17|7|4||300||38|200|25|4|The Combat Tank is a medium armoured tank, fires high-explosive rounds.||
25|Siege Tank|||1|1|1||12+17|7|6||600||45|300|20|5|The Missile Tank is a medium armoured tank, which fires missiles. Long-range, but inaccurate.||
26|Rocket Launcher|||1|1|1||12+17|7|5||450||112|100|30|9|The Siege Tank is a heavy armoured tank, which has dual cannons, but is slow.||
27|Harvester|||1|1|1||12+17||2||300||0|150|30|nil|The Harvester separates spice from the sand & returns raw spice to the Refinery for processing.||
28|Carryall|||1|1|1||13|13|5||800||0|100|200|nil|The Carryall is a lightly armoured aircraft with no weapons. Mainly used to lift+transport Harvesters.||
29|Ornithopter|||1|1|1||13+17|13|7|AO|600||75|5|150|5|The Ornithopter is a lightly armoured aircraft that fires rockets. Highly manouverable + fasted aircraft on Dune.||
30|MCV (Mobile construction vehicle)|||1|2|1||12+17|7|4||900||0|150|0|nil|The MCV scout vehicle is used to find and deploy new base locations.||
31|Sonic Tank|||1|1|1||12|7|7|A|600||90|110|30|8|Developed by the Atreides, this enhanced tank fires powerful blast waves of sonic energy.||
32|Fremen (x3)|||1|1|1||19||8|A|0||8|220|10|3|The Fremen are native to Dune. Elite fighters, in alliance with the Atreides.||
33|Devastator|||1|1|1||12|13|8|H|800||60|400|10|7|The Devestator is a Harkennen-developed nuckear-powered tank, which fires dual plasma charges. Most powerful tank on Dune, but potentially unstable in combat.||
34|Death Hand|||1|1|1||19||8|H|0||150|70|250|nil|The Death Hand is a special Harkonnen Palace weapon. An inaccurate, but very destructive ballistic missile.||
35|Raider|||1|1|1||11||2|O|150||8|80|75|3|The Ordos Raider is similar to the standard Trike, but with less armour in favour of speed.||
36|Deviator|||1|1|1||12|13|7|O|750||0|120|30|7|The Ordos Deviator is a standard Missile Tank, which fires unique nerve gas missiles that may temporarily change enemy loyalty.||
37|Saboteur|||1|1|1||19||8|O|0||150|40|40|2|The Saboteur is a special military unit, trained at an Ordos Palace. Can destry almost any structure or vehicle.||
-- other
[[38|Sardaukar|||1|1|1||nil|nil|4||0||5|110|10|1|The Sardular are the Emperor's elite troops. with superior firepower and armour.||
39|Sandworm|||1|1|1||nil|nil|3||0||300|1000|35|0|The Sand Worms are indigeonous to Dune. Attracted by vibrations, almost impossible to destroy, will consume anything that moves.||]]
function _init()
local r=s(q,"|","\n")
printh("------------------")
printh("test 1:"..#r)
printh("test 4:"..r[1][1])
printh("test 5:"..r[2][1])
printh("test 5.1:"..r[2][11])
u={
p="test obj",
v=n[r[2][11]]
}
u:v()
poke(0x5f2d,1)
cartdata("pn_picodune")
w=1
x=0
cursor=y(0,0,0)
cursor.z=function(self)
return{
ba=self.ba+(not bb and c or 0)+2,
bc=self.bc+(not bb and d or 0)+1,
bd=1,
be=1
}
end
cursor.v=function(self)
spr((i and(i.type==1)) and 1 or self.spr,
self.ba,self.bc,self.bd/8,self.be/8)
end
local bf=y(12*8,2*8,2,66,nil,2,2)
bf.bg=50
bf.bh=y(109,20,2,138,nil,2,2,bf,function(self)
printh("todo: fix windfarm?...")
end)
bf.bi={
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
bf.bj=10
add(m,bf)
local bk=y(9*8,5*8,2,68,nil,3,2)
bk.bg=10
bk.bh=y(109,20,2,140,nil,2,2,bk,function(self)
printh("todo: fix refinary?...")
end)
add(m,bk)
local bl=y(10*8,7*8,2,64,nil,2,2)
bl.bg=75
bl.bh=y(109,20,2,142,nil,2,2,bl,function(self)
printh("todo: load construction yard menu...")
end)
bl.bm=y(109,44,2,168,nil,2,2,nil,function(self)
printh("todo: build slab...")
self.bn=0.5
self.bo=cocreate(function(self)
while self.bg<100 do
self.bg+=self.bn
j-=.1
yield()
end
end)
end)
add(m,bl)
local bp=y(7*8,5*8,1,49,11)
bp.bq=0
add(k,bp)
local bp=y(7*8,3*8,1,50,11)
bp.bq=0.25
add(k,bp)
bp=y(9*8,3*8,1,51,11)
bp.bq=0.5
add(k,bp)
end
function _update60()
br()
if(t()%1==0) bs()
end
function _draw()
bt()
bu()
if(a) bv("cpu: "..flr(stat(1)*100).."%\nmem: "..(flr(stat(0)/2048*100)).."%\nfps: "..stat(7),2,109,8,0)
end
function bw()
end
function bs()
l={}
for bx,bp in pairs(k) do
l[flr(bp.ba/8)..","..flr(bp.bc/8)]=1
end
end
function br()
by=stat(32)
bz=stat(33)
ca=stat(34)
cb=(ca>0 and cc!=ca) or btnp(4)
for ce=0,1 do
if(btn(ce)) g+=ce*2-1
if(btn(ce+2)) h+=ce*2-1
end
e=mid(0,by+g,127)
f=mid(0,bz+h,127)
cursor.ba=e
cursor.bc=f
if(e<8) c-=2
if(e>119) c+=2
if(f<8) d-=2
if(f>119) d+=2
c=mid(c,384)
d=mid(d,128)
cf()
cg()
x+=1
cc=ca
ch=i
end
function ci(bp,ba,bc)
bp.cj="init"
if fget(mget(ba,bc),0)
or l[ba..","..bc] then
printh("aborting pathfinding - invalid target")
return
end
bp.ck=ba
bp.cl=bc
bp.cm=bp.cn
bp.cn=1
bp.bo=cocreate(co)
end
function cf()
for bx,bp in pairs(k) do
cp(bp)
end
for bx,cq in pairs(m) do
cp(cq)
cp(cq.bm)
end
end
function cp(cr)
if cr then
if cr.bo and costatus(cr.bo)!='dead'then
cs(coresume(cr.bo,cr))
else
cr.bo=nil
end
end
end
function bt()
cls"15"
camera(c,d)
palt()
pal()
palt(0,false)
palt(11,true)
map(0,0)
if cj!=nil and cj!="init"then
spr(144,cj[1].ba*8,cj[1].bc*8)
end
for bx,cq in pairs(m) do
cq:ct()
cq:v()
if(cq==i) then
rect(i.ba,i.bc,
i.ba+i.bd-1,i.bc+i.be-1,
7)
end
end
palt(11,true)
for bx,bp in pairs(k) do
bp:ct()
bp:v()
if(bp==i) then
spr(16,i.ba,i.bc)
end
end
end
function bu()
camera(0,0)
pal()
palt(0,false)
if i and i.bh then
i.bh:v(109,20,true)
if i.bm then
i.bm:v(109,44,true)
end
end
bv("00"..flr(j),103,2,7)
if i
and i.bm
and i.bm.bg>=100 then
rectfill(flr(cursor.ba/8)*8,flr(cursor.bc/8)*8,
(flr(cursor.ba/8)+2)*8,(flr(cursor.bc/8)+2)*8,11)
end
palt(11,true)
cursor:v()
end
function cg()
cu=false
foreach(k,cv)
foreach(m,cv)
if i then
bb=true
if(i.bh) cv(i.bh)
if(i.bm) cv(i.bm)
bb=false
end
if cb then
if cu then
if(i.cw) i:cw() i=ch
else
if i and i.type==1 then
ci(i,flr((c+e)/8),flr((d+f)/8))
end
if i
and i.bm
and i.bm.bg>=100 then
local cx=flr((cursor.ba+c)/8)
local cy=flr((cursor.bc+d)/8)
mset(cx,cy,16)
mset(cx+1,cy,16)
mset(cx,cy+1,16)
mset(cx+1,cy+1,16)
i.bm.bg=0
end
i=nil
end
end
end
function cv(cr)
cr.cz=da(cursor,cr)
if cb and cr.cz then
i=cr
cu=true
end
end
function db(dc,dd)
end
function de(self,df)
if(df==self.dg) return
local r=self.dh[df]
self.di=r.x
self.dg=df
self.dj=1
end
function dk(self)
self.di-=1
if self.di<=0 then
self.dj+=1
local r=self.dh[self.dg]
self.di=r.x
if self.dj>#r.dl then
self.dj=1
end
self.spr=r.dl[self.dj]
end
end
function bv(dm,dn,
dp,dq,
dr)
for ds=-1,1 do
for dt=-1,1 do
print(dm,dn+ds,dp+dt,dr)
end
end
print(dm,dn,dp,dq)
end
function y(ba,bc,type,du,dv,bd,be,dw,cw)
return{
ba=ba,
bc=bc,
dx=1,
type=type,
bd=(bd or 1)*8,
be=(be or 1)*8,
dw=dw,
spr=du,
dv=dv,
cw=cw,
dy=false,
dz=bd or 1,
ea=be or 1,
bg=0,
eb=0,
bj=0,
ec=1,
z=function(self)
return{
ba=self.ba,
bc=self.bc,
bd=self.bd-1,
be=self.be-1
}
end,
v=function(self,ba,bc,ed)
pal()
palt(0,false)
if(self.dv) palt(self.dv,true)
if self.bi then
pal(self.bi[self.ec][1],
self.bi[self.ec][2])
end
if self.bq then
ee(self.spr%16*8,flr(self.spr/16)*8,self.ba,self.bc,.25-self.bq,1,11)
else
if ed then
rectfill(ba-1,bc-1,ba+16,bc+19,0)
local ef=self.dw or self
local dq=ef.bn and 12 or(ef.bg<33 and 8 or ef.bg<66 and 10 or 11)
if(ef.bg>0) rectfill(ba,bc+17,ba+(15*ef.bg/100),bc+18,dq)
end
spr(self.spr,self.ba,self.bc,self.bd/8,self.be/8)
end
if(b) eg(self)
end,
ct=function(self)
if self.bi then
self.eb+=1
if(self.eb>self.bj) then
self.eb=0
self.ec+=1
if(self.ec>#self.bi) self.ec=1
end
end
end
}
end
function da(dc,dd)
local eh=dc:z()
local ei=dd:z()
if eh.ba<ei.ba+ei.bd and
eh.ba+eh.bd>ei.ba and
eh.bc<ei.bc+ei.be and
eh.bc+eh.be>ei.bc
then
return true
else
return false
end
end
function eg(cr)
local ej=cr:z()
rect(ej.ba,ej.bc,ej.ba+ej.bd,ej.bc+ej.be,cr.cz and 11 or 8)
end
function ek()
return flr(t())%2==0
end
function s(dm,el,em)
local r={}
local en=0
local eo=''
local ep=''
if em~=nil then dm=s(dm,em) end
while#dm>0 do
if type(dm)=='table'then
eo=dm[1]
add(r,s(eo,el))
del(dm,eo)
else
eo=sub(dm,1,1)
dm=sub(dm,2)
if eo==el then
add(r,ep)
ep=''
else
ep=ep..eo
end
end
end
add(r,ep)
return r
end
local eq=0
function ee(er,es,ba,bc,r,bd,et)
local eu,ev=cos(r),sin(r)
local ew,ex,ey,ez
local fa,fb=eu,ev
local fc=shl(0xfff8,(bd-1))
bd*=4
eu*=bd-0.5
ev*=bd-0.5
local fd,fe=ev-eu+bd,-eu-ev+bd
bd=2*bd-1
for ff=0,bd do
ew,ex=fd,fe
for fg=0,bd do
if band(bor(ew,ex),fc)==0 then
local en=sget(er+ew,es+ex)
if(en!=et) pset(ba+ff,bc+fg,en)
end
ew-=fb
ex+=fa
end
fd+=fa
fe+=fb
end
end
function co(bp)
bp.cj=fh(
{ba=flr(bp.ba/8),bc=flr(bp.bc/8)},
{ba=bp.ck,bc=bp.cl},
fi,
fj,
fk,
function(fl) return shl(fl.bc,8)+fl.ba end,
nil)
bp.cm=bp.cn
bp.cn=2
bp.bo=cocreate(fm)
end
function fm(bp)
printh("-------------")
for fn=#bp.cj-1,1,-1 do
local fl=bp.cj[fn]
local fo=bp.ba-(fl.ba*8)
local fp=bp.bc-(fl.bc*8)
local r=atan2(fo,fp)
printh("  >> target angle="..r)
while(bp.bq!=r) do
fq(bp,r)
end
local fr=1
local fs=sqrt((fl.ba*8-bp.ba)^2+(fl.bc*8-bp.bc)^2)
local ft=fr*(fl.ba*8-bp.ba)/fs
local fu=fr*(fl.bc*8-bp.bc)/fs
for fn=0,fs/fr-1 do
bp.ba+=ft
bp.bc+=fu
yield()
end
bp.ba,bp.bc=fl.ba*8,fl.bc*8
end
end
fv=3.14159
fw=.5*(fv/180)
function fq(bp,fx)
fy=fx-bp.bq
printh("unit.r="..bp.bq)
printh("targetangle="..fx)
printh("diff="..fy)
printh("turnspeed="..fw)
printh("-")
if fy>0.5 then
printh("big angle 1")
fy-=1
elseif fy<-0.5 then
printh("big angle 2")
fy+=1
end
if fy>fw then
bp.bq+=fw
elseif fy<-fw then
bp.bq-=fw
else
bp.bq=fx
end
if(bp.bq>fv) bp.bq-=2*fv
if(bp.bq<-fv) bp.bq+=2*fv
yield()
end
function fj(fz,fl,ga)
local gb=fget(mget(fl.ba,fl.bc),1) and 4 or 1
if(fz.ba!=fl.ba and fz.bc!=fl.bc) return gb+1
return gb
end
function fk(fl,ga)
local gc={}
for ds=-1,1 do
for dt=-1,1 do
if(ds!=0 or dt!=0) gd(fl.ba+ds,fl.bc+dt,gc)
end
end return gc
end
function gd(ge,gf,gg)
printh("testing:"..ge..","..gf)
if(
not fget(mget(ge,gf),0)
and l[ge..","..gf]==nil
)
then
add(gg,{ba=ge,bc=gf})
end
printh("test passed.")
end
function fi(r,gh)
return abs(r.ba-gh.ba)+abs(r.bc-gh.bc)
end
function fh
(gi,
gj,
gk,
gl,
gc,
gm,
ga)
local gn,
go={
gp=gi,
gq=0,
gr=gk(gi,gj,ga)
},{}
go[gm(gi,ga)]=gn
local gs,gt,gu,gv={gn},1,gm(gj,ga),32767.99
while gt>0 do
local gw,gx=gv
for fn=1,gt do
local gy=gs[fn].gq+gs[fn].gr
if(gy<=gw) gx,gw=fn,gy
end
gn=gs[gx]
gs[gx],gn.gz=gs[gt],true
gt-=1
local ha=gn.gp
if gm(ha,ga)==gu then
ha={gj}
while gn.hb do
gn=go[gm(gn.hb,ga)]
add(ha,gn.gp)
end
return ha
end
for hc in all(gc(ha,ga)) do
local hd=gm(hc,ga)
local he,hf=
go[hd],
gn.gq+gl(ha,hc,ga)
if not he then
he={
gp=hc,
gq=gv,
gr=gk(hc,gj,ga)
}
gt+=1
gs[gt],go[hd]=he,he
end
if not he.gz and he.gq>hf then
he.gq,he.hb=hf,ha
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
bbbbbbbbbbb1bbbbf5d555d555d555d55d555d5fffffffff1d515555ffffffff99f99999ffffffffffffffff9f99f9f9ff9f999955d555d555d555d555d555d5
bb11bbbbbb171bbb1555515d15555155d51555515dfffd5f5155d55dffff9fff9f9999f9fff9fffffffffffff99f99f999f99899155551551555515515555155
bb171bbbb1bbb1bb5d55d5515d55d555155d55d5d5155551555d5155ffff999999ff99999999ffffffffffff9f99f99f9f9989f95d55d55555dddd555d55d555
bb1771bb17b1b71b55515d5555515d5d55d51555155d55d5d5555d55fff99f9f99999f99f9f99ffff9ffff9f999f999999f88899555155dddd4444ddddd15d5d
bb17771bb1bbb1bbd55d5555d55555555555d55d55d5155555d155d5fffff9f9fff999999f9fffffff99f999f9ffff9f99998f99d555dd444444444444445555
bb177771bb171bbb55d551d555d515555d155d555555d55d15555555ffff999999999f999999ffff999f99f9fffffffffff8999955d5d4444444444444444555
bb17711bbbb1bbbb1555555515555515555555515d155d55f51ffd5ffff99f9f99fff9f9f9f99fff9f99f99fffffffff99999f99155d44444444444444444415
bbb11bbbbbbbbbbbf55d5515555d55555155d55f55555551ffffffffffff99f9ff9f99999f99fffff99f99f9ffffffff99fff9f9555d44444444444444444455
b7bbbb7bddddddddffffffffddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055dd444444444444444444d5
77bbbb77d5555555fff77fffd5555555d5555555ffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444455
bbbbbbbbd5015515ff79ff7fd5555555d5015515ffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000005dd444444444444444444445
bbbbbbbbd5105555f79f779fd5555555d5105555ffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d44444444444444444444d
bbbbbbbbd5555111fff799ffd5555555d5555111ffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000d5d444444444444444444445
bbbbbbbbd1555101ff799fffd5555555d1555101ffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d444444444444444444445
77bbbb77d5555111ff79ffffd5555555d5555111ffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155d44444444444444444415
b7bbbb7bd5515555f7ffffffd5555555d5515555ffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555d44444444444444444455
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055dd444444444444444444d5
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155044444444444444444055
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000005d5104444444444444444155
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555114444444444444440d5d
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000d55510044444444444401555
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000055d515100044444000015555
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000155555151100000111155515
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000555d555555111115555d5555
bbb22bbbbb8dd8bb62ddd26bb28882bbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
bb2882bbb8d66d8b6d666d6b2828282bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
b522225bb8d66d8b6d666d6b2868682bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
b028820bb8d66d8b68d6d86b2262622bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
bb2882bbb856658b6886886b2808082bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
b522225bb886688b6226226b2888882bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
b002200bb220022b50b0b05b00bbb00bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
bbbbbbbbb00bb00bbbbbbbbbbbbbbbbbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000
d66dddddddd6fffdddd776ddddddddddddddddddddd666dddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
76665555551ffff1d576de65d5577655d5555555d5766665d5555555000000000000000000000000000000000000000000000000000000000000000000000000
76665805555f4441d76deee5d576de65d5556555d5766665d5888885000000000000000000000000000000000000000000000000000000000000000000000000
177d22055d5ffff1d66d11e5d76deee5d5576655d5677725d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d1d55505555f1011d66d01e5d66d11e5d55d7d55d566dd25d5522255000000000000000000000000000000000000000000000000000000000000000000000000
6555550515df1001d66d0e55d66d01e5d55ddd55d566dd25d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d6d6d55555551005d56dd555d66d0e55d555d555d556dd55d5552555000000000000000000000000000000000000000000000000000000000000000000000000
d6d6d555d55d5555d5555555d56dd555d5555555d5555555d5522255000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd55d555d5ddddd776ddddddddddd666dddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
d555555515555155d55576de65555555d5766665d5555555d5522255000000000000000000000000000000000000000000000000000000000000000000000000
d555555a5d55d555d5576deee5558055d5766665d5556555d5552555000000000000000000000000000000000000000000000000000000000000000000000000
d5aaa99a55515d5dd5566d11e5522055d5677725d5576655d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d5aaa55ad5555555d5566d01e5555055d566dd25d55d7d55d5522255000000000000000000000000000000000000000000000000000000000000000000000000
d5a1199a55d51555d5566d0ed5555055d566dd25d55ddd55d5555555000000000000000000000000000000000000000000000000000000000000000000000000
d544445a15555515d5556dd5d5555555d556dd55d555d555d5888885000000000000000000000000000000000000000000000000000000000000000000000000
d5151515555d5555d5555555d5555555d5555555d5555555d5555555000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff77777777ffffffff77757777ffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff766666666fffffff766657666fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff7666666666ffffff5555565555ffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f766666666666ffff777777577777fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f7666666666666fff7666665766666ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f76666666666666ff76666665766666f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f55555555555555ff55555555555555f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
ffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeeeffffffffffffffffeeeeeeeeeeeeeeee
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
0000020202020400000000000001010100010200010000000000000000010101000000000000000000000000000101010101010100000000000000000000000001010101010102000000000000000000010101010101020000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0809000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0808090213141604000000000000000000000000000012120000000000000000000000000000000000121200000000121200000000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
08080c0a0a090000000000000204000000001212121212000000000000000000000000000000000000001212121212120000000000000000000003030300000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
080808080b000000000000000304000012121212121200000000000000000000000000000000000000000000000012000000000000000000000303030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
080b0b1812000000000000020400000012000000000000000000000000120000000000000000000000000000000000000000030303030303030303030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000001212000000000203040000000000000000000000000000121212000000000000000000000000000000000000000000000003000000000303030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0012121212000000020303040030000000020505000000000000120000000000000000000000030303030303030303030000000000000000000003030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0012121212000000000614140000000005030d0f0500000000121200000000000000000000030303030d0e0e030303030303000000000000000003030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
00121212120000000000141400000000030d1e1f030000000012000000000000000000000003030d0e1e1e1e0f0303030303000000000000000000030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
00121200120000000002031313050500032d2e2f030000000000000000000000000000000003031d1e1e1e1e1e0e0e0e0e03030000000000000000000303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000012000000000606000002060006030303030000000000000000000012000000000303031d1e2f0303030303030303030300000003030303030303000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
000000121200000000000000000000000006060606000000000000000000001200000000030303031e030303030303030300000000000000030303030303030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
000000000000000000000000000000000000000000000000000000000012121200000003030303032e2f0303030000000000000000000000000000000003030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000012121200000000000000001200001212120000000000030303030303030303030300000000000012000000000000000000030095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000121212120000000000121212121212120000000000001212121200000000000003030303030303030303030303000000120012121212121200000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0012121212000000000000000000121212121212000000000000000000000000000003030303030303030303030303030000120000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000000000000000000000003030000000000000000000303030000001200120000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000003030300000000120000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000002050400000000000000000000000012000000000000000012121212121200000000030300000000001212000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000205050503030400000000000000000000000012121212000000000000001212121212120000000000000600000012121203000000060095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
00000000000000000002030d0e0f030303000000000000000000000000000012120000000000000000121212120000000000000000000000000003000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
00000000000000000503031d1e1e0e0e0f040000000000000000000000000000120000000000000000000000120000000000000000000000000003000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
00000000000000020303032d2e1e1e1e1f030400000000000000000000000012000000000000000000000000000000000000000003000000000303000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
000000000000000000060303031d1e1e2f030606060000000000000000121212000000000000000000000000000000000000000003030303030300000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
000000000000000000000002032d2e2f03060000000606000000000012120000000000000000000006060606060600000000000000030303000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000060603030303000000000000060000000012000000030000000000000000000000000606000600060000000003030303000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000606000000000000060000000000000000030000000000000000000000000000000000000000030300000003000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000030303030300000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000030603030600000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000006060600000000000000000000000000000000000000000000000000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000095959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595959595
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

