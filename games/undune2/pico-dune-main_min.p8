pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================
_a="pico-dune_min.p8"
_b={
{ 12, 1},
{ 11, 3},
{ 8,  2},
{ 14, 2},
}
_c=1
_d=2
_e=3
_f=4
_g=5
_h={
{
{1,999,1000,4,1,88,72,2,24,64,2,160,64,2,160,152,20},{2,1200,2700,2,1,144,200,2,120,96,nil,nil,nil,nil,nil,nil,8},{3,1500,nil,2,1,176,112,3,408,440,nil,nil,nil,nil,nil,nil,7},{4,1500,nil,2,1,176,432,3,296,16,nil,nil,nil,nil,nil,nil,6},{5,1500,nil,2,1,88,200,2,448,288,nil,nil,nil,nil,nil,nil,5},{6,1700,nil,3,1,264,312,3,8,24,3,480,136,nil,nil,nil,4},{7,2000,nil,4,1,200,72,2,280,408,nil,nil,nil,nil,nil,nil,3},{8,2000,nil,4,1,192,240,3,328,8,2,248,448,2,424,424,2},{9,2500,nil,4,1,232,416,4,360,40,3,112,40,2,408,136,1},},{
{1,999,1000,4,2,88,72,3,24,64,3,160,64,3,160,152,20},{2,1200,2700,2,2,144,200,3,120,96,nil,nil,nil,nil,nil,nil,8},{3,1500,nil,2,2,176,112,1,408,440,nil,nil,nil,nil,nil,nil,7},{4,1500,nil,2,2,176,432,1,296,16,nil,nil,nil,nil,nil,nil,6},{5,1500,nil,2,2,88,200,3,448,288,nil,nil,nil,nil,nil,nil,5},{6,1700,nil,3,2,264,312,1,8,24,1,480,136,nil,nil,nil,4},{7,2000,nil,4,2,200,72,3,280,408,nil,nil,nil,nil,nil,nil,3},{8,2000,nil,4,2,192,240,1,328,8,3,248,448,3,424,424,2},{9,2500,nil,4,2,232,416,4,360,40,1,112,40,3,408,136,1},},{
{1,999,1000,4,3,88,72,1,24,64,1,160,64,1,160,152,20},{2,1200,2700,2,3,144,200,1,120,96,nil,nil,nil,nil,nil,nil,8},{3,1500,nil,2,3,176,112,2,408,440,nil,nil,nil,nil,nil,nil,7},{4,1500,nil,2,3,176,432,2,296,16,nil,nil,nil,nil,nil,nil,6},{5,1500,nil,2,3,88,200,1,448,288,nil,nil,nil,nil,nil,nil,5},{6,1700,nil,3,3,264,312,2,8,24,2,480,136,nil,nil,nil,4},{7,2000,nil,4,3,200,72,1,280,408,nil,nil,nil,nil,nil,nil,3},{8,2000,nil,4,3,192,240,2,328,8,1,248,448,1,424,424,2},{9,2500,nil,4,3,232,416,4,360,40,2,112,40,1,408,136,1},}
}
_i={
[0]={
"tHE PLANET aRRAKIS,\nKNOWN AS dUNE.\n\nlAND OF SAND;\nHOME OF THE sPICE mELANGE.:tHE sPICE CONTROLS THE eMPIRE.\n\nwHOEVER CONTROLS dUNE \nCONTROLS THE sPICE.:tHE eMPEROR HAS PROPOSED A \nCHALLENGE TO EACH OF THE hOUSES.:tHE hOUSE THAT PRODUCES THE \nMOST sPICE WILL CONTROL dUNE.\n\ntHERE ARE NO SET TERRITORIES \nAND NO RULES OF ENGAGEMENT.","vAST ARMIES HAVE ARRIVED.\n\nnOW, THREE HOUSES FIGHT FOR \nCONTROL OF dUNE.","tHE NOBLE aTREIDES,","THE INSIDIOUS oRDOS, ","AND THE EVIL hARKONNEN. ","oNLY ONE HOUSE WILL PREVAIL.","yOUR BATTLE FOR dUNE BEGINS...\n\n           ...now.",},{
"gREETINGS,\ni AM YOUR mENTAT cYRIL.:tOGETHER WE WILL PURGE THIS\nPLANET OF THE FOULNESS OF THE\nOTHER hOUSES.:tHE hIGH cOMMAND WISHES YOU\nTO PRODUCE 1000 CREDITS.:yOU MAY EARN CREDITS BY\nBUILDING A REFINERY AND\nHARVESTING SPICE","gREETINGS,\ni AM HONORED TO SEE YOU AGAIN.:tHE hIGH cOMMAND NOW REQUIRES\nTHAT YOU PRODUCE 2700 CREDITS\nIN A NEW HARVESTING AREA.:uNFORTUNATELY, WE HAVE\nCONFIRMED THE PRESENCE OF AN\noRDOS BASE IN THIS REGION.:gOOD LUCK!","tHE BATTLE WITH THE OTHER \nhOUSES HAS INTENSIFIED AND WE \nARE NOW FORCED TO ENGAGE IN \nSOME SELECTED OFFENSIVE \nMANEUVERS.:tHE hARKONNEN ARE BEING \nEXTREMELY TROUBLESOME IN YOUR \nNEXT REGION, AND WE MUST ASK \nYOU TO REMOVE THEIR PRESENCE \nFROM THIS AREA.","yOUR DEMONSTRATION OF MILITARY \nSKILLS NOW FORCES US TO ASSIGN \nYOU TO ANOTHER OFFENSIVE \nCAMPAIGN AGAINST THE hOUSE \nhARKONNEN.:tHEY HAVE CONTINUED TO ATTACK \nOUR PEACEFUL HARVESTERS, AND \nMUST BE REMOVED FROM THE AREA.","wELCOME.\n\ntHE RULES SEEM TO HAVE CHANGED.:\naS YOU HAVE WITNESSED THE \neMPEROR HIMSELF HAS BEEN AIDING \nTHE EFFORTS OF OUR COMPETITORS!:aS A PART OF OUR NEW STRATEGY, \nWE MUST ASK THAT YOU ELIMINATE \nTHE TREACHEROUS oRDOS FORCES \nTHAT PRESENTLY CONTROL THIS \nREGION.","aS THE BATTLE FOR THIS PLANET \nINTENSIFIES, ALL EFFORTS MUST \nBE TAKEN TO ENSURE SUCCESS.:oNCE AGAIN WE MUST CALL UPON \nYOU TO DESTROY OUR ENEMIES IN A \nTROUBLED SECTOR.:hOUSE hARKONNEN MUST BE TAUGHT \nA LESSON.\n\ntHANK YOU, AND GOOD LUCK!","tHE BATTLE GOES WELL, BUT THERE \nIS NO TIME TO RELAX.:wE HAVE AN URGENT NEED FOR YOU \nTO SUBDUE ALL oRDOS FORCES IN \nTHIS REGION PROMPTLY.:oUR ONGOING NEGOTIATIONS ARE \nAIDED IMMEASURABLY BY \nCORRESPONDING VICTORIES IN THE \nFIELD.:wE ARE COUNTING ON YOU.","aLTHOUGH YOU HAVE EARNED A WELL \nDESERVED REST, i'M AFRAID THE \nPOLITICAL SITUATION REQUIRES \nTHAT WE SEND YOU BACK INTO THE \nFIELD IMMEDIATELY.:bOTH oRDOS AND hARKONNEN FORCES \nHAVE BUILT UP TO UNACCEPTABLE \nLEVELS IN THIS REGION, AND NOW \nMUST BE REMOVED COMPLETELY.","yOUR NEXT ASSIGNMENT WILL \nDETERMINE THE ENTIRE OUTCOME OF \nOUR EFFORTS ON dUNE.:vICTORY WILL NOT COME EASILY.:iN ADDITION TO DESTROYING ALL \nREMAINING oRDOS AND hARKONNEN \nTROOPS...:...YOU ARE ALSO INSTRUCTED TO \nSUBDUE eMPEROR fREDERICK'S \nFORCES.:aLL OF OUR HOPES AND DREAMS ARE\nRIDING ON YOU, AND WE HUMBLY \nBEG YOU TO PROVIDE ONE FINAL \nVICTORY FOR OUR NOBLE \nhOUSE aTREIDES.","gOOD MORNING YOUR LORDSHIP,\nAND CONGRATULATIONS!\n\nyOU SERVED hOUSE aTREIDES WELL.:wE WILL NOT SOON FORGET OUR \nMOST NOBLE WARRIOR.:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",},{
"wELCOME.\ni AM YOUR mENTAT, AND YOU MAY \nCALL ME aMMON.:tO BE OF ANY VALUE TO THE \ncARTEL, YOU MUST PROVIDE US \nWITH CREDITS.:aS A TEST, WE WILL ASSIGN YOU \nTO A REGION, AND ASK THAT YOU \nMEET A PRODUCTION QUOTA OF \n1000 CREDITS.:bUILD A REFINERY AND HARVEST \nTHE SPICE IN THE AREA. i AM \nVERY BUSY, BUT YOU MAY CALL \nUPON ME IF YOU HAVE FURTHER \nQUESTIONS.","yOUR QUOTA IS NOW 2700 CREDITS, \nAND THIS SPICE ACCUMULATION IS \nYOUR PRIMARY DIRECTIVE.:wE DO NOT EXPECT YOU TO DESTROY \nTHE hARKONNEN FORCES IN THE \nAREA,:HOWEVER YOU SHOULD CONSIDER THE \nTIME THAT COULD BE SAVED BY \nAPPROPRIATING THEIR SILOS.","wE FIND THE ACTIVITIES OF \naTREIDES TROOPS IN THIS REGION \nINCONVENIENT.:pLEASE REMOVE THIS OBSTACLE.\n\nwE CANNOT ALLOW THE MYTHICAL \nVALUE OF FAIR PLAY TO IMPEDE \nOUR PROGRESS.","tHE aTREIDES FORCES IN THIS \nAREA MUST BE ELIMINATED.:aS ALWAYS, WE APPRECIATE YOUR \nCAPTURE OF ANY ENEMY SILOS OR \nOTHER STRUCTURES THAT MIGHT BE \nSALVAGEABLE.","sO, OUR SPIES REVEAL WHY THE \nsARDAUKAR ATTACKED US IN YOUR \nLAST MISSION.\n\ni WILL NEED TO LOOK INTO THIS.:aLTHOUGH THE hARKONNEN \nCOMMANDERS ARE LAUGHABLY STUPID\nTHEIR MILITARY STRENGTH IS A \nTHREAT TO US IN THIS AREA.:tHEY MUST BE ELIMINATED AS SOON\nAS POSSIBLE.","tHE aTREIDES HAVE BECOME FAR \nTOO VOCAL IN THIS SECTOR, AND \nWHINE CONSTANTLY ABOUT THEIR \nRIGHTS.:wE oRDOS DO NOT HAVE THE \nLEISURE OF POINTLESS \nCONVERSATION, AND MUST ASK YOU \nELIMINATE THIS DISTRACTION.","hARKONNEN FORCES CONTINUE TO \nTHWART OUR EFFORTS IN THIS \nREGION, AND MUST BE REMOVED \nCOMPLETELY.:cRUSH THEIR BELOVED TROOPERS \nAND THEY WILL RUN CRYING BACK \nTO THEIR UGLY MOTHERS!","bOTH aTREIDES AND hARKONNEN \nFORCES OPPOSE OUR CONTROL OF \nTHIS AREA AND MUST THEREFORE BE\nDESTROYED.:tHE TIME OF COOPERATION AND \nCOMPROMISE IS PAST, AND ALL \nENEMIES OF hOUSE oRDOS MUST BE\nELIMINATED!","eMPEROR fREDERICK HAS JOINED \nTHE LIST OF oRDOS' ENEMIES, AND \nMUST BE PUNISHED.:dESTROY HIS TROOPS AND ANY \naTREIDES AND hARKONNEN REMNANTS \nTHAT STILL OPPOSE US ON THIS \nPLANET.:wE HAVE RISKED EVERYTHING ON \nTHIS FINAL BATTLE, AND CANNOT \nTOLERATE LESS THAN YOUR BEST \nEFFORT.","gOOD mORNING, YOUR LORDSHIP, \nAND CONGRATULATIONS!\n\nyOU'VE SERVED hOUSE oRDOS WELL.:wE WILL NOT SOON FORGET OUR \nMOST NOBLE WARRIOR!:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY, AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",},{
"i AM THE mENTAT, rADNOR.:wITH MY GUIDANCE, YOU MAY BE \nABLE TO ASSIST US IN CONQUERING \nTHIS DUSTY LITTLE PLANET.:fOR YOUR FIRST TEST YOU WILL BE\nEXPECTED TO PRODUCE 1000 \nCREDITS, AND NOT A GRANULE LESS:yOU MAY EARN CREDITS BY \nHARVESTING SPICE, AND WILL NEED\nTO BUILD A REFINERY TO CONVERT\nSPICE TO CREDITS.:iF ANY OF OUR FOOLISH ENEMIES \nATTEMPTS TO ATTACK YOUR BASE \nYOU WILL HAVE THE PLEASURE OF\nSEEING THE INVINCIBLE hARKONNEN\nTROOPS IN ACTION.","hOUSE hARKONNEN HAS GENEROUSLY \nGRANTED YOU A NEW OPPORTUNITY \nTO SERVE US.:wE WILL NOW ALLOW YOU TO TAKE \nCOMMAND IN A MORE DANGEROUS \nAREA, AND ACCUMULATE 2700 \nCREDITS.:aLTHOUGH THE WORTHLESS aTREIDES\nYOU MAY ENCOUNTER IN THIS \nREGION SHOULD BE ELIMINATED AS \nA MATTER OF PRINCIPLE,:...THE SPICE QUOTA IS \nYOUR OBJECTIVE.","tHE DESPISED oRDOS ARE WELL \nESTABLISHED IN THIS REGION, AND \nARE HARVESTING SPICE THAT \nSHOULD RIGHTFULLY BELONG TO \nhOUSE hARKONNEN.:dESTROY THE oRDOS INSTALLATIONS \nIN THIS AREA AND ASSERT CONTROL \nIN THE NAME OF hOUSE hARKONNEN.","oNE SMALL VICTORY DOES NOT WIN \nTHE WAR.:aNOTHER REGION HAS THE \nMISFORTUNE TO BE INFESTED WITH \nVERMIN FROM hOUSE oRDOS, AND \nYOU MUST NOW REPEAT YOUR \nSUCCESS.:i HAVE MANY DELICATE POLITICAL \nNEGOTATIONS ON MY MIND, AND i \nDON'T NEED TO BE WORRYING ABOUT\nLOOSE ENDS.","sO, THE eMPEROR WAS HELPING THE \noRDOS IN YOUR LAST MISSION.:nEVER THE LESS, hOUSE aTREIDES \nHAS GROWN STRONGER DUE TO OUR \nNEGLIGENCE, AND MUST NOW BE \nTAUGHT A LESSON.:yOU WILL REMOVE ALL THE \naTREIDES FROM THIS REGION.","yOU ARE TO PROCEED INTO YET \nANOTHER REGION DOMINATED BY \nTHOSE PESKY oRDOS, AND i EXPECT\nYOU TO OVERCOME THIS RATHER \nTROUBLESOME oRDOS GROUP.:wE HAVE ESTABLISHED A GOOD \nREPUTATION ON THIS PLANET.\n\ndO NOT EMBARRASS ME NOW!","rEPORTS OF NEW aTREIDES \nACTIVITY REQUIRE THAT i SEND \nYOU IMMEDIATELY BACK TO THE \nFRONT LINE.:yOU DO NOT SEEM TO ENJOY REST \nAND RELAXATION ANYWAY.\n\ni THINK YOU WOULD PREFER TO \nCRUSH THE aTREIDES.","i HAVE USED MY INFLUENCE TO \nARRANGE A pALACE FOR YOU.:a COMMANDER OF YOUR STATUS MAY \nREQUIRE RELAXATION OCCASIONALLY \nBUT i EXPECT AN EVEN GREATER \nEFFICIENCY ON YOUR PART WILL \nCOME FROM OUR GENEROSITY.:bOTH aTREIDES AND oRDOS FORCES \nEXIST IN THIS REGION,\nAND ALL MUST BE ELIMINATED!","wE HAVE BEEN DECEIVED!:oUR BARGAINING IN GOOD FAITH \nHAS ONLY BROUGHT A TREACHEROUS \nHARVEST. aLL HAVE CONSPIRED \nAGAINST US, AND ALL MUST DIE!:yOUR MILITARY SKILLS ARE THE \nLAST REMAINING HOPE FOR THIS \nPLANET.:dESTROY ALL REMAINING aTREIDES \nAND oRDOS FORCES, AND CONQUER \nTHE eMPEROR'S pALACE.\nhE HAS TREATED US POORLY, AND \nMUST NOT LIVE ANOTHER DAY!","gOOD mORNING, YOUR LORDSHIP, \nAND CONGRATULATIONS!\n\nyOU HAVE SERVED ME, i MEAN \nhOUSE hARKONNEN, WELL.:oUR hOUSE WILL NOT SOON FORGET \nOUR MOST NOBLE WARRIOR!:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY, AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",}
}
_j=_c
_k=nil
_l=0
function _init()
cartdata("pn_undune2")
poke(0x5f2d, 0x5)
_ad()
_t()
if(_j==_c) _ae()
if(_j==_d) _ak()
if(_j==_e)  _as()
if(_j==_f)  _a7()
if(_j==_g) _bk()
menuitem(1,"!wipe save data!",_o)
end
function _update60()
if _j==_c then
_af()
if _p() then
_as()
end
elseif _j==_d then
_al()
if _p() then
_m=_an
_as()
end
elseif _j==_e then
_aw()
elseif _j==_f then
_bh()
if _p() then
if _u<=9 then
_bk()
else
_as()
end
end
elseif _j==_g then
_bw()
if _p() then
_as()
end
end
end
function _draw()
if _c9 !=_n then
reload()
_da(_c9,0,0)
memcpy(0x0000,0x6000,0x2000)
_n=_c9
cls()
end
if _j==_c then
_ah()
elseif _j==_d then
_am()
elseif _j==_e then
_az()
elseif _j==_g then
_bx()
elseif _j==_f then
_bi()
end
end
function _o()
for i=0,63 do
dset(i,nil)
end
end
function _p(_q)
local _r=btnp"5" or (stat"34" >0 and not _s)
_s=stat"34" >0
return _r
end
function _t()
_m=dget(6)
_u=max(1, dget(0))
_l=dget(40)
if _l>0 then
_j=_f
_v=dget(2)
_w=flr(dget(41))
_x=dget(42)
_y=dget(43)
_z=dget(44)
_0=dget(45)
_1=dget(46)
_2=dget(47)
if _l < 3 then
music(10)
else
music(6)
end
else
music(0)
end
end
function _3(_4)
printh("in load_level(" .._4..")...")
printh("p_fact = " .._m)
_5=_b[_m][1]
_6=_b[_m][2]
_7=_h[_m][_4]
_8=_7[8]
_9=_7[11]
_aa=_7[14]
dset(0, _4)
dset(1, _7[17])
_ab=_7[4]
dset(5, _ab)
dset(6, _m)
dset(7, _5)
dset(8, _6)
dset(9, _7[6])
dset(10,_7[7])
dset(11, _8)
dset(12, _8 and _b[_8][1] or nil)
dset(13, _8 and _b[_8][2] or nil)
dset(14, _7[9])
dset(15, _7[10])
dset(16, _9)
dset(17, _9 and _b[_9][1] or nil)
dset(18, _9 and _b[_9][2] or nil)
dset(19, _7[12])
dset(20, _7[13])
dset(21, _aa)
dset(22, _aa and _b[_aa][1] or nil)
dset(23, _aa and _b[_aa][2] or nil)
dset(24, _7[15])
dset(25, _7[16])
dset(35, _7[2])
dset(36, _7[3])
dset(41, 0)
dset(42, 0)
dset(43, 0)
dset(44, 0)
dset(45, 0)
dset(46, 0)
dset(47, 0)
_ad()
local _ac="pico-dune-map" .._4..".p8" printh("loading data from: " .._ac)
reload(0x4300, 0x2000, 0x1000, _ac)
cstore(0x2000, 0x4300, 0x1000, _a)
reload(0x4300, 0x3100, 0x1199, _ac)
cstore(0x3100, 0x4300, 0x1199, _a)
load(_a)
end
function _ad()
printh("--- cart data ---------")
for i=0,63 do
printh("[" ..i.."] " ..tostr(dget(i)))
end
end
function _ae()
_c7(0)
_ag,cy=0.25,-96
end
function _af()
_set_fps(60)
if _ag>.0 then
_ag-=.1/128
cy+=.25
else
_ag=0
end
end
function _ah()
cls()
if _ag~=0 then
_cm(0,0,123,20,cy,_ag,1)
else
spr(0, 3,38, 15,3)
end
local start⧗=6.5
if t()>start⧗ then
local _ai="the demaking of a dynasty" _cn(_ai,12,62, (t()-start⧗)*8,3)
_cn(_ai,12,61, (t()-start⧗)*8)
_cn(" bY pAUL nICHOLAS @liquidream",4,104, (t()-start⧗)*8, 5)
_cn("♪cHRIS dONNELLY @gruber_music",4,112, (t()-start⧗)*8, 4)
_cn("(oRIGINAL BY wESTWOOD sTUDIOS)",4,120, (t()-start⧗)*8, 3)
end
if t()>start⧗+1 then
local _aj="❎ / \^.⁶	>.>\"\"、 TO " ..(_m>0 and"cONTINUE" or"sTART")
if(t()\1%2==0) _ct(_aj,52-(#_aj*2)/2,78,7,3)
end
end
function _ak()
_j=_d
_c7(0)
_an=1
_t=0
end
function _al()
if((btnp(0) or (_t%5==0 and stat(38)<-10)) and _an>1) _an-=1
if((btnp(1) or (_t%5==0 and stat(38)>10)) and _an<3) _an+=1
_t+=1
end
function _am()
cls()
pal()
pal(10,139,1)
pal(14,140,1)
pal(15,130,1)
_c0("select your house",28,28, 9,2,7)
spr(48, 5,47,  4,4)
spr(52, 47,47, 4,4)
spr(56, 89,47, 4,4)
map(48,0, 1,45, 5,7)
map(48,0, 43,45, 5,7)
map(48,0, 85,45, 5,7)
_ao={"aTREIDES","  oRDOS","hARKONNEN" }
for i=0,2 do
local _ap=i*29+(i*5)
local _aq=i*8
rectfill(_ap+_aq,84,41+_ap+_aq,94,15)
rectfill(_ap+_aq+2,86,39+_ap+_aq,92,9)
rect(_ap+_aq,84,41+_ap+_aq,94,_an==i+1 and 7 or 0)
?_ao[i+1],4+_ap+_aq,87,1
end
local _ar=_b[_an]
_ct("press ❎ to select",30,108,_ar[1],1)
end
function _as()
_j=_e
_at=nil
_au=false
cls()
_c7(max(2,_m+1))
music(_m==0 and 2 or 6)
printh("p_level=" ..tostr(_u))
_av()
end
function _av()
_aj=_i[_m][_u+_ay]
_ax=cocreate(_a5)
end
function _aw()
_set_fps(30)
if(_ax!=nil and costatus(_ax)!="dead") then
coresume(_ax)
else
_ax=nil
end
if _p() and _au then
if _m==0 then
_ay+=1
if _ay>6 then
_ay=0
_ak()
else
_av()
end
else
if _u<=9 then
_3(_u)
else
_o()
run()
end
end
end
end
_ay=0
function _az()
cls()
_a0={[0]=0,-1,1,2,3,-1,0}
_a1(_m==0 and _a0[_ay] or 0)
if(_at) _a4()
_ct("pRESS ❎/\^.⁶	>.>\"\"、",80,120,7,10)
end
function _a1(_a2)
pal({[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},1)
_a3(_a2)
rect(40,36,128,112,7)
palt(0,false)
if _m==0 then
palt(12, true)
spr(0, 0,40,  6,16)
elseif _m==1 then
palt(2, true)
spr(6, 0,40,  16,16)
else
palt(12, true)
spr(0, 0,40,  16,16)
end
end
function _a3(_a2)
dx=100
dy=75
srand(_a2)
for i=1,50 do
pset(40+rnd(88),36+rnd(76),rnd{10,13,1})
end
if _a2 > -1 then
c=(
{[0]={0,9,11,14,15,8,8,8},
{0,10,1,13,2,15},
{0,10,1,7,5,15,15},
{0,9,2,15,6,6,6}
})[_a2]
p=({
[0]={[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},{[0]=0,1,3,4,5,6,12,13,15,128,129,132,10,140,142,139},{[0]=0,1,8,4,5,6,139,13,15,128,129,132,10,140,142,7},{[0]=0,1,2,4,5,6,8,13,15,128,129,132,10,140,142,136}
})[_a2]
g=({[0]=.5,.65,0.75,.5})[_a2]
pal(p,1)
u=cos(.5)
v=sin(.4)
circfill(dx-1,dy-1,22,10)
circfill(dx-1,dy-1,21,13)
circfill(dx-1,dy-1,20,10)
for x=-1,.95,.05 do
for y=-1,.95,.05 do
h=x*x+y*y
z=(1-h)^.5
r=x*u+y*v+g+2*((x+y)%.1)
r=max(min(1,z*r))
r=(c)[flr(r*(#c-1))+1]
if(h<1)pset(dx+x*20,dy+y*20,r)
end
end
end
end
function _a4()
?_at,2,5,11
?_at,2,4,6
end
function _a5()
local _a6=split(_aj,":")
for j=1,#_a6 do
_aj=_a6[j]
for i=1,#_aj,0.5 do
_at=sub(_aj,1,i)
if(_p("s")) break
yield()
end
yield()
_at=_aj
_au=(j==#_a6)
while not (_p() or _au) do yield() end
_update_buttons()
end
end
function _a7()
_c7(1)
pal()
pal(3, 137, 1)
local _a8=flr(_w / 3600 )
_w=_w - _a8 * 3600
local _a9=flr(_w / 60)
_w=_a8.."H " .._a9.."M"
_v +=_z-_0 + _1-_2 + _x\100
_ba=_bb()
dset(2, _v)
_u +=1
printh("p_level now set to = " .._u)
dset(0, _u)
dset(40, 0)
_bc={
{ 0, _x, 62, 8, 60, _x },{ 0, _y, 68, 6, 60, _x },{ 0, _z, 85, 8, 40, _z },{ 0, _0, 91, 6, 40, _z },{ 0, _1, 107, 8, 20, _1},{ 0, _2, 113, 6, 20, _1 }
}
_bd=1
_be=100
end
function _bb()
_bf=split"25,sAND sNAKE,50,dESERT mONGOOSE,100,sAND wARRIOR,150,dUNE tROOPER,200,sQUAD lEADER,400,oUTPOST cOMMANDER,500,bASE cOMMANDER,700,wARLORD,1000,cHIEF wARLORD,1400,rULER OF aRRAKIS,18000,eMPEROR" _bg="sAND fLEA" for i=1,#_bf,2 do
if _v>=_bf[i] then
_bg=_bf[i+1]
end
end
return _bg
end
function _bh()
if _be > 0 then
_be-=1
return
end
if _bd <=#_bc then
_bc[_bd][1] +=(_bc[_bd][6]/_bc[_bd][5])/3
if _bc[_bd][1] >=_bc[_bd][2] then
_bc[_bd][1]=_bc[_bd][2]
_bd+=1
_be=50
end
end
end
function _bi()
cls()
palt(0,false)
pal(14, 137, 1)
pal(6, 14, 1)
map()
map(17,1,8,2,14,6)
local _bj=3+(3*_m)
spr(_bj,1,22,3,3)
spr(_bj,103,22,3,3)
_cy("sCORE:" .._v,16,7,7)
_cy("tIME:" .._w,70,7)
_cy("yOU'VE ATTAINED\n  THE RANK OF",36,24)
_cy(_ba,65-#_ba*2,37,8)
rect(8,56,120,75,4)
line(26,56,100,56,9)
_cy("SPICE HARVESTED BY",28,53)
_cy("  YOU:\nENEMY:",11,61)
_cy(flr(_bc[1][1]).."\n" ..flr(_bc[2][1]),100,61)
rect(8,79,120,98,4)
line(26,79,100,79,9)
_cy("UNITS DESTROYED BY",28,76)
_cy("  YOU:\nENEMY:",11,84)
_cy(flr(_bc[3][1]).."\n" ..flr(_bc[4][1]),100,84)
rect(8,102,120,120,4)
line(18,102,108,102,9)
_cy("BUILDINGS DESTROYED BY",20,99)
_cy("  YOU:\nENEMY:",11,106)
_cy(flr(_bc[5][1]).."\n" ..flr(_bc[6][1]),100,106)
for i=1,#_bc do
_c2(
35,_bc[i][3],_bc[i][5],_bc[i][1],_bc[i][6],_bc[i][4])
end
if(_bd>6) _ct("pRESS ❎ / \^.⁶	>.>\"\"、",40,120,7,0)
end
function _bk()
_j=_g
_c7(1)
music(12)
_bl=_b4(_c6,",","\n")
_bm={
[-1]={6,5,13},
[0]={0,0,0},
{12,1,0},
{11,10,1},
{8,2,1,5,5},
{5,2,0}
}
_bn=-1
_bo=0
_bp=1
_bq=2
_br=3
_bs=4
_bt="" _bu="" _bv=0
_t=0
_k=cocreate(_by)
end
function _bw()
if _k and costatus(_k)~="dead" then
assert(coresume(_k, _u))
end
end
function _bx()
end
function _by(_bz)
printh("seqnum = " .._bz)
yield()
local _b0
local _b1
cls()
pal()
pal(1,6)
pal(2,5)
pal(3,13)
map(32,0,0,0)
spr(48,4,20,15,8)
local _bj=3+(3*_m)
spr(_bj,0,96,3,3)
spr(_bj,104,96,3,3)
pal()
palt(0,false)
pal(14, 137, 1)
pal(12, 140, 1)
pal(11, 139, 1)
pal(10, 3, 1)
pal(6, 143, 1)
pal(13, 134, 1)
pal(5, 142, 1)
_ct("your next conquest",28,7,8,0)
_c0("your next conquest",28,7, 8,0,5)
if _bz > 2 then
_cg(0, _bm[_bo])
end
if _m==1 then
if _bz==1 then
elseif _bz==2 then
_b3()
_c5(20)
_b2("tHREE hOUSES HAVE\nCOME TO dUNE.")
_b2("tHE LAND HAS\nBECOME DIVIDED.")
_b6(0,  _bm[_bo])
_b3()
_b2("aTREIDES CLAIMED\nSTRATEGIC REGIONS")
_b6({13,7,20,14,21,22}, _bm[_bp])
_b3()
_b2("oRDOS MOVED IN\nFROM THE EAST.")
_b6({19,27,26,25,24,23}, _bm[_bq])
_b3()
_b2("hARKONNEN INVADED\nFROM THE NORTH.")
_b6({6,5,4,10,3,9}, _bm[_br])
_b0=23
_b1=_bm[_bq]
elseif _bz==3 then
_cg({13,7,20,14,21,22}, _bm[_bp])
_cg({19,27,26,25,24,23}, _bm[_bq])
_cg({6,5,4,10,3,9}, _bm[_br])
_b2("aTREIDES CAPTURED\nMORE TERRITORY...")
_b6({8,15},  _bm[_bp])
_b2("...AND DROVE THE\noRDOS OUT.")
_b6({23}, _bm[_bp])
_b2("oRDOS HEADED\nFOR hARKONNEN.")
_b6({12,18,16,17}, _bm[_bq])
_b2("hARKONNEN EXPANDED\nTHEIR BORDERS.")
_b6({1,2,11}, _bm[_br])
_b0=2
_b1=_bm[_br]
elseif _bz==4 then
_cg({13,7,20,14,21,22,8,15,23}, _bm[_bp])
_cg({19,27,26,25,24,12,18,16,17}, _bm[_bq])
_cg({6,5,4,10,3,9,1,2,11}, _bm[_br])
_b2("hARKONEN BORDERS\nWERE WEAK...")
_b6({1,2,3}, _bm[_bp])
_b6({11}, _bm[_bq])
_b2("...EXCEPT FOR\nONE OUTPOST.")
_b6({16}, _bm[_br])
_b0=9
_b1=_bm[_br]
elseif _bz==5 then
_cg({13,7,20,14,21,22,8,15,23,1,2,3}, _bm[_bp])
_cg({19,27,26,25,24,12,18,17,11}, _bm[_bq])
_cg({6,5,4,10,9,16}, _bm[_br])
_b2("hARKONEN CONTINUED\nTO RETREAT.")
_b6({4,9,16}, _bm[_bp])
_b2("...INTO TERRITORY\nOF THE oRDOS.")
_b6({11}, _bm[_br])
_b0=25
_b1=_bm[_bq]
elseif _bz==6 then
_cg({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16}, _bm[_bp])
_cg({19,27,26,25,24,12,18,17}, _bm[_bq])
_cg({6,5,10,11}, _bm[_br])
_b2("aLL FORCES WERE\nAIMED AT oRDOS.")
_b6({17,25,24}, _bm[_bp])
_b6({18}, _bm[_br])
_b0=11
_b1=_bm[_br]
elseif _bz==7 then
_cg({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24}, _bm[_bp])
_cg({19,27,26,12}, _bm[_bq])
_cg({6,5,10,11,18}, _bm[_br])
_b2("aTREIDES PUSHED\nhARKONNEN BACK.")
_b6({10,11,18}, _bm[_bp])
_b0=26
_b1=_bm[_bq]
elseif _bz==8 then
_cg({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24,10,11,18}, _bm[_bp])
_cg({19,27,26,12}, _bm[_bq])
_cg({6,5}, _bm[_br])
_b2("oRDOS WERE NEARLY\nWIPED OUT.")
_b6({26,27,19}, _bm[_bp])
_b0=5
_b1=_bm[_br]
elseif _bz==9 then
_cg({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24,10,11,18,26,27,19}, _bm[_bp])
_cg({12}, _bm[_bq])
_cg({6,5}, _bm[_br])
_b2("oNLY THE eMPEROR'S\nFORCES REMAIN.")
_b6({5,12}, _bm[_bp])
_b6({6}, _bm[_bs])
_b0=6
_b1=_bm[_bs]
end
elseif _m==2 then
if _bz==1 then
elseif _bz==2 then
_b3()
_c5(20)
_b2("tHREE hOUSES HAVE\nCOME TO dUNE.")
_b2("tHE LAND HAS\nBECOME DIVIDED.")
_b6(0,  _bm[_bo])
_b3()
_b2("oRDOS TOOK THE\nBEST LAND")
_b6({19,27,26,25,24,23}, _bm[_bq])
_b3()
_b2("hARKONNEN ARE\nA THREAT.")
_b6({6,5,4,10,3,9}, _bm[_br])
_b3()
_b2("hOUSE aTREIDES\nIS NEARBY.")
_b6({13,7,20,14,21,22}, _bm[_bp])
_b0=16
_b1=_bm[_bn]
elseif _bz==3 then
_cg({19,27,26,25,24,23}, _bm[_bq])
_cg({6,5,4,10,3,9}, _bm[_br])
_cg({13,7,20,14,21,22}, _bm[_bp])
_b2("oRDOS ADVANCED\nWITHOUT CHALLENGE.")
_b6({15,16,17},  _bm[_bq])
_b2("tHE hARKONNEN\nDREW CLOSER.")
_b6({11,12,18}, _bm[_br])
_b2("tHE aTREIDES\nSPREAD TOO THIN.")
_b6({1,2,8}, _bm[_bp])
_b0=14
_b1=_bm[_bp]
elseif _bz==4 then
_cg({19,27,26,25,24,23,15,16,17}, _bm[_bq])
_cg({6,5,4,10,3,9,11,12,18}, _bm[_br])
_cg({13,7,20,14,21,22,1,2,8}, _bm[_bp])
_b2("aLL ATTACKS WERE\nAIMED AT aTREIDES.")
_b6({8,14,22}, _bm[_bq])
_b6({2}, _bm[_br])
_b0=13
_b1=_bm[_bp]
elseif _bz==5 then
_cg({19,27,26,25,24,23,15,16,17,8,14,22}, _bm[_bq])
_cg({6,5,4,10,3,9,11,12,18,2}, _bm[_br])
_cg({13,7,20,21,1}, _bm[_bp])
_b2("oRDOS OVERPOWERED\nTHE aTREIDES...")
_b6({21,20,13}, _bm[_bq])
_b2("...WHILE THEY WERE\nFIGHTING hARKONNEN")
_b6({2,3}, _bm[_bp])
_b0=18
_b1=_bm[_br]
elseif _bz==6 then
_cg({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13}, _bm[_bq])
_cg({6,5,4,10,9,11,12,18}, _bm[_br])
_cg({7,1,2,3}, _bm[_bp])
_b2("hARKONNEN HAD TO\nBE TURNED BACK.")
_b6({18,11,12}, _bm[_bq])
_b0=2
_b1=_bm[_bp]
elseif _bz==7 then
_cg({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12}, _bm[_bq])
_cg({6,5,4,10,9}, _bm[_br])
_cg({7,1,2,3}, _bm[_bp])
_b2("oRDOS KILLED OFF\nMOST OF aTREIDES")
_b6({7,1,2}, _bm[_bq])
_b0=6
_b1=_bm[_br]
elseif _bz==8 then
_cg({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12,7,1,2}, _bm[_bq])
_cg({6,5,4,10,9}, _bm[_br])
_cg({3}, _bm[_bp])
_b2("oRDOS GAINED MORE\nhARKONNEN LAND.")
_b6({6,5,10}, _bm[_bq])
_b0=3
_b1=_bm[_bp]
elseif _bz==9 then
_cg({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12,7,1,2,6,5,10}, _bm[_bq])
_cg({4,9}, _bm[_br])
_cg({3}, _bm[_bp])
_b2("sOON oRDOS WILL\nRULE ALL OF dUNE.")
_b6({3,9}, _bm[_bq])
_b6({4}, _bm[_bs])
_b0=4
_b1=_bm[_bs]
end
elseif _m==3 then
if _bz==1 then
elseif _bz==2 then
_b3()
_c5(20)
_b2("tHREE hOUSES HAVE\nCOME TO dUNE.")
_b2("tHE LAND HAS\nBECOME DIVIDED.")
_b6(0,  _bm[_bo])
_b3()
_b2("hARKONNEN ARRIVED\nFIRST.")
_b6({6,5,4,10,3,9}, _bm[_br])
_b3()
_b2("tHE WEAK aTREIDES\nWILL BE EASY.")
_b6({13,7,20,14,21,22}, _bm[_bp])
_b3()
_b2("tHE oRDOS ARE\nGETTING CLOSER.")
_b6({19,27,26,25,24,23}, _bm[_bq])
_b0=2
_b1=_bm[_bn]
elseif _bz==3 then
_cg({6,5,4,10,3,9}, _bm[_br])
_cg({13,7,20,14,21,22}, _bm[_bp])
_cg({19,27,26,25,24,23}, _bm[_bq])
_b2("hARKONNEN SPREAD\nOUT STRONG FORCES.")
_b6({2,1,8},  _bm[_br])
_b2("aTREIDES WENT\nAFTER oRDOS.")
_b6({15,16,23}, _bm[_bp])
_b2("oRDOS STOLE EVEN\nMORE LAND.")
_b6({17,11,18,12}, _bm[_bq])
_b0=11
_b1=_bm[_bq]
elseif _bz==4 then
_cg({6,5,4,10,3,9,2,1,8}, _bm[_br])
_cg({13,7,20,14,21,22,15,16,23}, _bm[_bp])
_cg({19,27,26,25,24,17,11,18,12}, _bm[_bq])
_b2("oRDOS DID NOT\nSTAND A CHANCE.")
_b6({17,11,12}, _bm[_br])
_b2("aTREIDES AND oRDOS\nTRADED LAND.")
_b6({24}, _bm[_bp])
_b6({16}, _bm[_bq])
_b0=18
_b1=_bm[_bq]
elseif _bz==5 then
_cg({6,5,4,10,3,9,2,1,8,17,11,12}, _bm[_br])
_cg({13,7,20,14,21,22,15,23,24}, _bm[_bp])
_cg({19,27,26,25,18,16}, _bm[_bq])
_b6(25,  _bm[_br])
_b2("aN oRDOS OUTPOST\nWAS SURROUNDED.")
_b6({18,19},  _bm[_br])
_b2("tHE oRDOS BROKE\nTHROUGH aTREIDES.")
_b6(24, _bm[_bq])
_b0=7
_b1=_bm[_bp]
elseif _bz==6 then
_cg({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19}, _bm[_br])
_cg({13,7,20,14,21,22,15,23}, _bm[_bp])
_cg({27,26,16,24}, _bm[_bq])
_b2("sOON tHE aTREIDES\nWILL BE EXTINCT.")
_b6({7,14,13}, _bm[_br])
_b6({23}, _bm[_bq])
_b0=26
_b1=_bm[_bq]
elseif _bz==7 then
_cg({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13}, _bm[_br])
_cg({20,21,22,15}, _bm[_bp])
_cg({27,26,16,24,23}, _bm[_bq])
_b2("hARKONNEN CRUSHED\nMOST OF THE oRDOS.")
_b6({24,26,27},  _bm[_br])
_b2("aTREIDES RECLAIMED\nITS LAND.")
_b6(23, _bm[_bp])
_b0=21
_b1=_bm[_bp]
elseif _bz==8 then
_cg({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27}, _bm[_br])
_cg({20,21,22,15,23}, _bm[_bp])
_cg({16}, _bm[_bq])
_b2("hARKONNEN CRUSHED\nTHE aTREIDES.")
_b6({20,21,22},  _bm[_br])
_b0=16
_b1=_bm[_bq]
elseif _bz==9 then
_cg({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27,20,21,22}, _bm[_br])
_cg({15,23}, _bm[_bp])
_cg({16}, _bm[_bq])
_b2("oNLY THE hARKONNEN\nWILL PREVAIL.")
_b6({16,23},  _bm[_br])
_b6({15},  _bm[_bs])
_b0=15
_b1=_bm[_bs]
end
end
_b2(" ❎/\^.⁶	>.>\"\"、 tO sTART")
while true do
_cg(_b0, _bm[_m])
_c5(20)
_cg(_b0, _b1)
_c5(20)
end
end
function _b2(_aj)
_bu=_bt
_bt=_aj
_bv=80
clip(27,99,75,18)
for i=1,85 do
_b3()
?_bt,29,_bv,0
?_bu,29,_bv+22,0
yield()
if(i<46) _bv+=.5
end
clip()
end
function _b3()
rectfill(27,99,101,116,9)
end
function _b4(_b5,d,dd)
d=d or","
if(dd) _b5=split(_b5,dd)
if type(_b5)=="table" then
local t={}
while #_b5>0 do
local s=_b5[1]
add(t,split(s,d))
del(_b5,s)
end
return t
else
return split(_b5,d)
end
end
function _b6(_b7, _b8)
sx=0
sy=20
sw=119
sh=64
dx=4
dy=20
_b9=0
_ca=4
_cb=3
_4=0
_cc=0x3006
_cd=0x3fff
if type(_b7)=="table" then
_ce=_b7
else
_ce={_b7}
end
for _b7 in all(_ce) do
for _x=0,127 do
for _y=0,127 do
_4+=1
if(_4==0x4000) then
_4=0
x,y=0,0
end
x,y=band(_cd,0x7f),flr(lshr(_cd,7))
_cd=bxor(flr(lshr(_cd,1)),band(-band(_cd,1),_cc))
if x>=sx and x<=sx+sw
and y>=sy and y<=sy+sh
then
if not _b7 or _bl[y-sy+1][x-sx+1]==_b7
then
local _cf=sget(x+_b9,y+_ca)
pset(dx-sx+x,dy-sy+y, _b8[_cf])
end
end
end
if(_x%_cb==0)yield()
end
end
end
function _cg(_b7, _b8)
sx=0
sy=20
sw=119
sh=64
dx=4
dy=20
_b9=0
_ca=4
_ce=nil
if type(_b7)=="table" then
_ce={}
for k in all(_b7) do
_ce[k]=k
end
end
for x=0,127 do
for y=0,127 do
if x>=sx and x<=sx+sw
and y>=sy and y<=sy+sh
then
if not _b7
or (_ce and _ce[_bl[y-sy+1][x-sx+1]])
or _bl[y-sy+1][x-sx+1]==_b7
then
local _cf=sget(x+_b9,y+_ca)
pset(dx-sx+x,dy-sy+y, _b8[_cf])
end
end
end
end
end
function _ch(a,b)
return a[1]*b[1]+a[2]*b[2]
end
function _ci(a,b)
return {b[1]-a[1],b[2]-a[2]}
end
function _cj(a)
local x,z=a[1],a[2]
local d=sqrt(x*x+z*z)
return {
x/d,z/d
},d
end
function _ck(a,b,_cl)
_cl=_cl or 1
return {
a[1]+_cl*b[1],a[2]+_cl*b[2]}
end
function _cm(sx,sy,sw,sh,y,_ag,_cl)
local c={0,sw}
local v={sin(_ag),-cos(_ag)}
local u={-v[2],v[1]}
for i=0,127 do
local n,d=_cj(_ci(c,{i-63.5,0}))
local t0=(-_ch(c,v))/_ch(n,v)
if t0>0 then
local x=_ck(c,n,t0)
local t1=_ch(x,u)/(_cl*sw)+0.5
if t1>=0 and t1<1 then
local w=_cl*d/t0
local y0=63.5-(sh/2-y)*w
sspr(sx+sw*t1,sy,1,sh,i,y0,1,sh*w+y0%1)
end
end
end
end
_cr={0,128,130,2,136,8}
pal(_cr,1)
function _cn(_co, x, y, _cp, _cq)
local _cs=mid(0,flr(_cp),_cq or #_cr)
print(_co, x, y, _cs)
end
function _ct(_b5,_cu,_cv,_cw,_cx)
for xx=-1, 1 do
for yy=-1, 1 do
print(_b5, _cu+xx, _cv+yy, _cx)
end
end
print(_b5,_cu,_cv,_cw)
end
function _cy(_b5,x,y,_cw,_cz)
print(_b5, x, y+1, _cz or 2)
print(_b5, x, y,    _cw or 7)
end
function _c0(_b5,x,y,_cw,_cz,_c1)
_cy(_b5,x,y,_cw,_cz)
clip(x,y+1,#_b5*4,3)
print(_b5,x,y,_c1)
clip()
end
function _c2(x,y,_c3,_r,_c4,_cw)
if(_r <=0) return
local w=mid(0,_r/_c4*_c3,_c3)
rectfill(x+1,y+1,x+w+1,y+4,2)
rectfill(x,y,x+w,y+3,_cw)
end
function _c5(_4)
for i=1,_4 do
yield()
end
end
_c6=[[
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,5,5,5,5,5,5,5,5,5,5,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,5,5,5,5,5,5,5,5,5,5,5,0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,5,5,5,5,5,5,5,5,5,5,5,5,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,5,5,5,5,5,5,5,5,5,5,5,5,5,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,6,6,6,6,0,0,0,0,6,6,6,6,6,6,6
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,4,4,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,6,6,0,0,0,12,12,0,0,0,6,6,6,6,6
0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,10,10,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,12,12,12,12,12,12,0,6,6,6,6,6
7,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,10,10,10,10,10,10,10,0,11,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,12,12,12,12,12,12,12,12,0,6,6,6,6
7,7,7,7,0,0,1,1,1,1,1,1,1,1,1,1,0,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,10,10,10,10,10,10,10,10,10,0,11,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,0,0,6,6,6
7,7,7,7,7,7,0,0,1,1,1,1,1,1,1,1,0,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,10,10,10,10,10,10,10,10,10,0,11,11,11,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,0,6,6
7,7,7,7,7,7,7,7,0,0,1,1,1,1,1,0,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,0,0,10,10,10,10,10,10,10,10,10,0,11,11,11,11,0,5,5,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,0,0
7,7,7,7,7,7,7,7,7,7,0,0,0,0,0,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,0,0,5,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,0,0,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,0,5,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,0,0,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,0,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,0,5,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,4,4,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,0,0,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,9,9,9,9,9,9,9,9,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,0,0,11,11,11,11,11,0,5,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,0,9,9,9,9,9,9,9,9,9,9,9,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,0,5,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,7,7,0,0,0,0,0,0,0,0,7,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,8,8,8,8,8,8,8,8,0,0,0,3,3,3,3,3,0,9,9,9,9,9,9,9,9,9,9,9,9,9,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,11,0,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
7,0,0,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,2,2,2,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,3,3,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,11,0,5,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
0,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,2,2,2,2,2,2,2,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,3,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10,0,0,11,11,11,11,11,11,0,5,5,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,0,0,0,2,2,2,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,16,16,0,0,0,0,10,10,10,10,10,10,10,10,10,10,0,11,11,11,11,11,11,11,0,5,5,5,5,5,0,12,12,12,12,12,12,12,12,12,12,0,0,0,0,12,12
13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,16,16,16,0,17,17,0,0,0,0,0,0,10,10,10,10,10,0,11,11,11,11,11,11,11,11,0,5,5,5,5,0,12,12,12,12,12,12,12,12,0,0,19,19,19,19,0,0
13,13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,0,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,0,17,17,17,17,17,17,17,0,0,0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0,0,0,0,0,12,12,12,12,12,0,0,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,0,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,16,16,16,0,0,17,17,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,11,11,11,11,0,18,18,18,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,0,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,17,17,17,0,0,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,0,0,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,0,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,0,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,0,0,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,0,0,0,17,17,17,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,16,16,0,0,0,17,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,16,16,16,16,0,0,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,0,0,11,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,0,7,7,7,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,16,16,16,16,0,0,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,13,0,0,0,7,7,7,7,7,7,7,0,14,14,14,14,14,14,14,14,14,14,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,16,16,16,16,16,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,13,0,14,14,14,0,0,7,7,7,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,9,0,0,0,9,9,9,9,9,9,9,0,16,16,16,16,16,16,16,16,0,0,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,9,9,9,9,9,0,16,16,16,0,0,9,9,9,9,0,16,16,16,16,16,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,17,0,11,11,11,11,0,18,18,18,18,18,18,18,18,18,18,18,18,18,0,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,8,8,8,8,8,8,8,8,8,8,0,0,0,9,9,9,9,0,16,16,16,16,16,16,0,0,0,0,16,16,16,16,16,16,16,16,16,16,0,17,17,17,17,17,17,17,17,17,17,17,17,0,0,0,11,11,0,18,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,0,8,8,8,8,0,0,15,15,15,0,0,0,0,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,0,17,17,17,17,17,17,17,17,17,17,0,0,25,25,0,0,0,18,18,18,18,18,18,18,18,18,18,18,18,18,0,0,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,15,15,15,15,0,0,0,0,15,15,15,15,15,15,15,15,15,0,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,0,0,0,17,17,17,17,17,0,0,0,25,25,25,25,0,18,18,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,0,25,25,25,0,0,0,0,0,0,0,25,25,25,25,25,25,0,18,18,18,18,18,18,18,18,18,18,18,18,18,18,0,19,19,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,18,18,18,18,18,18,18,18,18,18,18,0,0,0,0,0,0,19,19,19,19,19,19,19
13,13,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,18,18,18,18,18,18,18,18,0,0,27,27,27,27,27,27,0,19,19,19,19,19,19
0,0,13,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,18,18,18,18,18,18,18,0,27,27,27,27,27,27,27,27,0,19,19,19,19,19,19
20,20,0,0,13,13,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,14,14,14,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,18,18,18,18,18,18,18,0,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19
20,20,20,20,0,0,13,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,22,22,22,0,0,14,14,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,18,18,18,18,18,0,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19
20,20,20,20,20,20,0,0,13,13,0,14,14,14,14,14,14,14,14,14,14,14,14,0,22,22,22,22,22,22,0,0,14,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,0,18,18,0,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19
20,20,20,20,20,20,20,20,0,0,0,14,14,14,14,14,14,0,0,0,0,0,14,0,22,22,22,22,22,22,22,22,0,14,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,16,16,16,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,0,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,0,0,0,14,14,14,0,21,21,21,21,0,0,22,22,22,22,22,22,22,22,22,0,14,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,16,16,0,0,0,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,20,0,0,0,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,16,16,16,16,16,16,16,16,16,0,0,24,24,24,24,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,0,0,16,16,16,16,16,16,16,0,24,24,24,24,24,24,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,0,16,16,16,16,16,0,24,24,24,24,24,24,24,24,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,0,0,16,16,0,24,24,24,24,24,24,24,24,24,24,0,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,0,16,0,24,24,24,24,24,24,24,24,24,24,0,25,25,25,25,25,25,0,0,0,0,0,0,0,0,25,25,25,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,0,0,0,0,0,0,26,26,26,26,26,26,26,26,0,0,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19
20,20,20,20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,22,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,0,0,27,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19,19
20,20,20,20,20,20,20,20,20,20,0,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19,19
20,20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,19,19,0
20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,0,0,0,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,24,24,0,0,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,0,19,19,19,0,27
20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,0,21,21,21,0,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,0,0,0,27,27
20,20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27
20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,0,0,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27
20,20,20,20,20,20,20,0,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,0,22,22,22,22,22,22,22,22,22,22,22,0,15,15,15,15,15,15,15,15,15,15,0,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,0,24,24,24,24,24,24,24,24,24,24,0,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,0,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27
]]
_c9=-1
_n=-1
function _c7(_c8)
_c9=_c8
end
function _da(_db,x,y)
local _dc=0x0000
for i=0,_db-1 do
_dc +=peek(_dc+0) + peek(_dc+1)*256 + 2
end
_dd(x,y,_dc+2,pget,pset)
end
function _dd(x0,y0,_de,_df,_dg)
local function _dh(l, _r)
local v,i=l[1],1
while v!=_r do
i+=1
v,l[i]=l[i],v
end
l[1]=_r
end
local _dk,_dl=0,0
function _di(_dj)
if _dl<16 then
_dk+=%_de>>>16-_dl
_dl+=16
_de+=2
end
local _r=_dk<<32-_dj>>>16-_dj
_dk=_dk>>>_dj
_dl-=_dj
return _r
end
function _dm(n)
local _dj=0
repeat
_dj+=1
local vv=_di(_dj)
n+=vv
until vv<(1<<_dj)-1
return n
end
local
w,h_1,eb,el,pr,x,y,_dn,_do
=
_dm"1",_dm"0",_dm"1",{},{},0,0,0
for i=1,_dm"1" do
add(el,_di(eb))
end
for y=y0,y0+h_1 do
for x=x0,x0+w-1 do
_dn-=1
if(_dn<1) then
_dn,_do=_dm"1",not _do
end
local a=y>y0 and _df(x,y-1) or 0
local l=pr[a]
if not l then
l={}
for e in all(el) do
add(l,e)
end
pr[a]=l
end
local v=l[_do and 1 or _dm"2" ]
_dh(l, v)
_dh(el, v)
_dg(x,y,v)
end
end
end

__gfx__
d450ffffff0ff7fef408354ce1a2f9d6b7715a48b93925a40429c129073f0f0878f990f48f3809c22c211e903298e094298c446e89421954219fb5ef72146e7d
ccf53c5cfffd9484cfa98fb21fff714203cffd23fb46efff448480ff46efa4433f39c7cffb33095ef7331dccd686b59ffd3b0ff3a1aa874b433ffff08fff58f1
44297255efff111e7b1e79070ffff73cf51eff91ef72a903e7c0f7848fff6aab548fd42c398e2c8b2cf20ef7a7099018e0c8b29994a11980124872c82311e94c
815ef70d44616272fd2c3d061209070b0f6832c10e1ef701effffff7f8fff3fc7afffffd0cffffffff32070f80279f96440eb8b4aefb3802fc928cbe7a0210e3
ddcddcd612bc2bccac9f24db0e5ea407a3edfafe7f324c32f935d9f307c205df1e377d9f52bf1042219f5681209f79c84987f72a4cb2faf32bbf623cf81c010c
5ff1928480f3ea2429c1ffb8380fb2103197e8f72201b38329f305f7426f08ffb41e9cbec0f82483cdf9f529b27e339b26747fcc1ec8b22bc28ffb458c516b49
b7017ca167c122d8c5be33bf7a9b2485bbf3623f6b231a19ff380cd4e78f2f3c3df1eee84e8f5e95116598c3964eda04ecc5c1df1ef8f1cd4a3cc39cdfeff28c
dfbc193e783ef84e9375ea7d3f387b66ba217ceece1aeedf231e952dcb9b693e8f3ef8cafcf1df72b1862b836773bd6dc5b42b529fe8f527f1fa3e97ef83e5bb
e78bd3f3cf2f3c7b074293a62597f8f1ef94e8fe83e109723bf1ecbc17e3bf3e79442d1f6a2f95c19d9fda9d1f3a5efb7fa7cb75f2df3ebbdf2d3ec75f785e09
c8c1a2932fcf29d57e69cd19bc693e0fdc5aea36a9cf11419c39e7d775e79c57e5f6f9b3295f717cf1fc77ef0ed7bedc9327944d37ad15579c39bf9d3639f1e1
fb4f2b3b934a9194e8fb3fda4e7af8fed3b7cf37d19fe3fb0f3037ce84c766bedae8337c11f30f6e8b1d4a93eb7e8c1a446f4c3c19febf5297b6e787c1792fdf
197d37830b36bf5e583f176f07c5e807ee5ca784af84f0fbca7e3dceabeb6ea16a7467cf341fc970fc167e1796c31fc3dd5bf3c37f57ff3dc36e27cadd127ef3
98cf1f34e8bce9b29faa976e1bc17c4222bceb62df5f972d7e9f787e893f074e854c32f9b4524247b1dbecf5cf1907e6bf3e8f30426447a46e9c6d8cf29da8ba
7c3fd7c1964e8b4f7958d7721eb79f3e78a4a78e37421e436bf1eedaf7cda37ff2e85ea64a6cfd94a4ea727dcc13784ed0f0f78c770b7029f61fcec3e4bc2f30
fc5f0fdf078e38505c32ff302fc2a7ebf4c1497d19bfdbe80791675fa36b3661e706f4b3e30fe0c6e4569fe796ce79e1dfec32755c32bd43dd216e9e9c3e21cc
1b42bc5f58f34a74f27d5144a21223f3c198f5ab63195e2a7e57811473f787ea32f34d522942f3c36dfe0e4bdf24ceb59e3f95f82d090d52e84fe669f52fdbc9
9cbbc9fcebdf0bb615f8f21f38069729cba616263bc858b270a30ead3ed410044e39fd33bbfac5b3e8f16b3e8ceaf38781bd6799846f8d6f4319789d23b34ef8
8b946d3397efebdaeadb9df2ff897f15fa195f213b8cd1bf36fc5eac3b2431c288c83274ffc4ce5e1fe5f8f1e7838f0351ef8428b0c5907ceaf2f1f9c483ad8d
2dbe7dd9f666fc34a39822c1b32488cf08d170c3b48a455c6e291224e80726ff3846929c9f9c3dd327530b4849c39f6bd210148c139911b7186edc32f858ce9b
3bcc2ccb2dfcc093e2f65c4095af0889d4c53e9c130ab46db28c59f322489548e79bdf3963b70995c29932d7e0592d424274c04e0699c539c1329ca9e1933211
b1136f56fcf3e99ad68522f2d80c1942229d19180ac20c698c09c4a174994cef7542119f92424211422a290ac0833828983879d0fff90e194e2f3842260f18d2
319c2474460b70232f3ce01011eff2ca80ffffff0fff7fa724af3d58cc7190db108df694016c734012c8f6802481fd01c38421bbe848c601acc0f3c498001e9a
1121802c35124201487a240f40cb1a3c0865a1df3298d63612c5b0524801b32152488c71a5612f6298c841c1294e7a3211954ef87428c24581702f844461ef8a
48426b5ec9408384848f701258f7611318e13bd46262999938b8421b8198cd1c106300f324021f601040942623d64695804239309301463198842f1b810808f7
1380b88c2c403484318ad60dd6144c46813c5246109fe080a87069f3721191e966bcc2b874422d5256ab17c716902b1583ca29a14e0122c80146681bf33a2a20
c139d4a1f4c29ca6219c184a19c22952e1695e8c64880e009032121e7546c5b0b44c47331b69c855298787a9441c2c11469762990016cfaf44690c333b9c2a31
219561c10eaa424e84202dd29123ceb985098329c12717532b54c79c29d8722b99c16b0f16902b16ce08842a6375720e00b1e1ef0069d85f9994010d6208465e
20ea99112702c1423ccec1240710e09b837bde9726b552cc6dc6dc463bb8661d479548884294a21f1222c1c8b0fc0c52996ec53c18d0fd21a4c9d50273b909dc
8c5d00568983a0807992c55427cc6e904e09f429429c00004a2d4c98e627c210c12ffc5848e89c4b30690c19878080bc690f4381019c2162e5e7649932b800b9
8e44dc6b9321c1d88e1169658572984c09f23909ff3534422b8c1d428958369420bbab0b7c0102ca942ab5621605873cfc8c8740b3e8d638c23fecc113bc4f85
843c01093011319f3e2161ff0e00ba527c1b88c20e788c3107461c3c22842484639852ecb6426f3199c421229c116518842762a50229ce181472c461e8c61339
df009f1809546bd6101e8581629bc488168956dd6b0bd213487639844ec302f78c3260d9deb8421a0b42f5429058529f2294048a76b7e97e9d5f5e075114f31f
42c19427903756046eb4298540fe300eb44fa0033670f42ee1a3cf2656709542a138301739902d0d320e52242973cd1ee0fb4427429894a1c68acf0c8f2c4040
98894ec2421ff90e7113231c14074294e79094cb1a2fc5980e46510d94298320ef012a217e2461132361a2f4863841ec4c91412c814e801e797424c42784ed44
421950b01980917524429862294ef1e10006cf4123288c51c7298801b848010ff8484858f10c198a4726d88f90d4421a89429848d2902d421842f42ef148f68e
42948246838583794281608422462a2483e340e99039c798abef111e82c2c2007e4442380916144421b4c3248807d02c94209f1240c60c318468b7900e027421
c210c24f012f348f92cf83c1470c87f8442427528445264ec42111b16042e0ec0f7783280b62cf190742940684394019cf048424c1cfd1e7d0903250d48f168c
129422401952c42221151e90f41ef09fb3c32603ca117d092169421198090e70194442e19689cfff2159be021994a2e109022f426161c21a94c298422240f438
32909f310ef1a581e08c246080044c421151642122748f18ff10341e785296039822392f984429c694631b50cf11e77422c248f280b0607448c4812708e090f5
20e128b97284cf4142e80fb41ed42938018880ab0e098c1d429039721731e74e22cd10fc29c02619801842890c08df0902240080f001e71145070848f7311170
2c4461904223a3159f32c7cf29094a1e308d422cb1c2194c21842962ef8529a84872012f342e79a02061a4680461407212168583890487e111194c294619c190
9b211ef3e3905e7003402a09427c1988c32903683442188b842c11840cf712c6838072e884262a1151e802c428342234401e729322f1f4262507401487281109
1e0290e7048529364ee217430819331b50001482d0012870032d54ef8195022c0c9f02c52b21f583022481848498602321110112f3c24442c22709072fe8c4eb
0b400030210324218a803930cb343cfb1e308587f00e02040380fc928488c5b4219f5048ff54010a22197548980fe102c880ed8c29cb9872cf71e5248c07e298
448401a491b485221e6e78070f34878f3935809802280a4048b61194ef7031218731f748e314c2cd2d06830220485020b0b4c3b42d4c512c2c5b480fac188821
197f000c3110c008080901a90526cf6901421b484c30c221095242e42944212104e8708c1001194e1a3cf8b044540119862930f190cf1168a090803e92048087
212cf704502217c4ca244454c0b0763942304878f7689c5420298f120131e094c612102468881ac7848a8c530e606848ff5c8c842950327438880142426cb090
20a02c7581fb58b3ce12221ee030a44690290f18801228044879401628f321f748601e70c2160388429097118c682280f50c31c0107c21f49820d848464a888b
248c111008f61cb10068c0f1d603942021b11c1277394e1e8509422d4c5d48f0102820a80732490f4004248bf88422190b380ea4421442ef51cf1cf5cb903440
fb54ea0b420094094e51cf0401075832cf314262d428ba4c32a11032611590f604427c1909330060380b036c729a4092744e9701ea0962111341d84c1984e942
7362988101a1e0487619c4c12b442c15407520e009501c988014b1283958d00167083687684872424a0b11cb5009c1118834801c603cf0820ed02c916211cb98
40162d6016fb08440852631703ee2802c80d2cf2880e6149be0119124a8422a80123e121e7a0b0a012cf44629b794631d520b004e224422510ed0727516cd1ef
0021f3c8012d427020a5016008b194e3e021968360cf018c87f142146240f5429421402f0708f140f17c0213a121e729f1240184683098012c542c2cd32ff0a1
c534832c30ef24001262e193ea42110c402cd39cbc127e102708b784873122bb801b3222402228421901968f6948cf4121acf880f342422111c1194c21028262
0b4c32960f0fb58016380832c13cb94c218328880a227129489c2c463c8f39068283972cb74202b14086228c1108640698b212988481f17208050687f007d4c1
98428cb89427901968f400c20e4e321060401eb05e91a822424e009846030116276284294e840f530c6823c4cfcc78402b4c0c12910d01a80898b01c908980ff
ffff0fff7faf3134ac29658dc1eb7ff209488cfc6f42e6828c278ffbae9e893ea7ad78df8a7c67801fc62501bc31bb8ffbbdf06be7fd6f76429c4cec044e8b2d
ceaeffadef371f44efa5f93da947f28aa4242de3b0139cff237ce7cabeb9cdbf7ae78f3ac81e3361670c1eaf23756ff334af80fbe593e8f3af4ff83a9bf6cf03
e043b488024e9e4e858ff9dafc78f9dc15f343f7c680ddf1024e91070093e3bc3ef76affb887c1eac197d5782486a40d521291693f1146ef7598f1a227f1984d
a37a337c021eb7cf0d4290109b4727aff3542dc297211e79306f6243c219340212280d38344a1cff9294401631ff97395eb1846442938d6b9428f48b83ef75bf
4444890ef315aebd31a1b019442407cf0c190f1b87eff5942b80231f3e3170e3b3a2219521204224e06b2fff2c1190268f57fde499b4c2bc6b01946048c4e26b
5e8ff79121c85212cf5f007d13cf15bbab190fb4375cffae0190112220639cf23fce23463e03699901927d8cffb209580a0e1270f7c1e05f060b2fc68485493a
94ea0fffa2c58230b113cb629c316bc2763219cb19e4c131fff28c2294017402780ee3ac274d6dce78f3c59f324506688c5badffd8f2218980942298fc4693e1
9439f32594c11e212fffa9811ce49c7684260c944e832cf152f171217755fff51e89cc22956dc1442b07bc14cf0c2c5029a8d29d5708ff5d21d46988d0f40298
c1982fd5d3296b87803b72bd7a8ff99472cf28561346a0f21e803746e78c01936b8ce03c39aff99414e7133c60e94c521e87e8d21ea60ca9c69b9488502b56ff
3b887c40d14d2144e000ccebf6f70253384809721f303193e91fffb7231f0264c427bc27021f44e8e3f6e0133b42b5a13ef09bf1f842de539ff1248057c26322
938f52c29d4322b3483eebe796c3763e8c462876e830fc37818c1429ff7503d8c697891648f38f56602b2f197378f3cf59035ec7fe7393a6d64c7e1f7426d476
f0fffa896d2c291212d729ca7c391f0221e1d3c3b3278c44af85e78429de1d8cffc294ea6d09c2ce8595622846eb629d59bff862e874afcb91329aff752dca82
c1481d011ca178fe802302401cce280f58ff719fc97429729cc11948520f8797e12742842084800c3c3cffc8c61ccc608bef96edf4e9a48cb22c7f83c19df194
de81466a00e953bff75e8341b56e83cf37c9eb88ad39c168ee439af568146336059aff3d5c4aa1f562903e80340097ea37f7cb2e3e497c280ae4ef74d426862b
30c8721e91b742dd8acc2c9006b0995048d61fff1b44242945e24001c174abe9dc77b0f2169443b504669446e3fff1ea9830c8195214059f1ec7c1b23f685842
4029304099ff111acf2002c2199ee87e03261ea632c32c87e780c87b3ff7184ea01cf1385870783e566ebde9f52d4e2d5681ccc527ce0bff3de79a9cf2844096
e9ee4e872b8131d48432f028387259708ffd44443317723c4e0c3dc1bea6bbc2217093e193468f25162c5ff714c51262cf000f5d28be870175832ca7c6d489c1
2f41dffb482981ee8b43e85040dfef0b345a5fc302801c2fc1265e39d678ffd8c7122fa83020c2994f782211084483aa14e88d4e90eaa0cff68270fa7626d942
9c6b1fc119e62dee09a09984c51421322cff44a2520e5131469be9372a6781b841133c99ca3e8ff162ef9c0693fa737ce9078c12689d798601eff24921e521e1
9f16d468443c81d4c520098f7eff2c9a30f07024c3f343196582c4e89c24e4219037eff529cb02c48425caebf362934404220d1144f1228329f7ef7549382674
e222d463e6180b7808c8f7289dc211ef72cf984a80bc39f12f74e8c66b448588409a7021dc1cdbbef72982334956224e17cf112b6830b002060e538b67c51ebf
f944fd4c484234809e2cf042d542789940709835123276293e9ffd05e2a126b36b6394cf16ec856dd0516242c7188c77e1cff64e0e3a1e95d233ff4769440c88
4a8a30db62e20fff2e0e24461a4084cf27c30058894229c62af21aabcffa832440b669d94bacb936325278da94e942944078809a5771454ef73d0a13270390c3
7f0048437d721b901270f491c5611cff18321f8dc8c33bcf1d3221a8cf074cac51eb82c21e074f984cff1843b1cf60bbf02128070f774022020941fff816cf5c
f1d011119feabc1756e84ddf022af40846ff3f932f703227d97c1fc9ffc1fc1d930f3128809ff74223194cf4744e3726ff88a7a399e3e1a1e9fd1b4c2cff0848
78f58129c3952944f79b2e9be836774013cf58624bfc31fb7248740f3889726b832948c5dcb31db29e5fe19c4cf1168dc1f4770ff56e0b8437980ed5212442e8
c32b58573cae9d9b490ff394bf3ad3469a46583211f93b393e8e1397c19c43d3701cf11e007e21fb91a9039c19902c7bc72e016b428e8d5cfa2510eca6cf51e1
ef8d4e3748c1132661940902f30fb48b8f1698f98b8221d0217553624717c15261788c595ef8d5c8f962efd019382f502d1b36688a0617052781e78367e17729
3cf39d9f756e94b691c1c580669328550ebb4a1fae4278cb90e0e0be15a4fb05e7a5ae25202f74ea8019d661322ed49e150fc2192c52972d7a7c1ff8df4b0794
6d5e1e29d2eab58f5c58cf0429568431258c04094423fbcec8f74a99421b42f079e2c752840347219d387a34052906488c2f78df599ca1190f07e24669de6d04
40c385a11ea1642770e84f1c1747bcbedfd6326590f1fd561e416898f30266039e38df27b8323155c1988df6a7ac8f545007f8f1a02c19f2901e802f44c9af45
f058c59e6cf2c11e43420ed642259cf2697d158301f84d956b84bbdc193609725ef93e868391f70e8850b9f3226f3012380284ef0b44698c3288d404216297eb
d3dc21e712cb4d83e78f2b4e8427848381168424ea324e9c78227a8b267c1bdf42dcc312b1f6a27809622e79740868442487e94669d24217244a7df2669866e1
22852ac648384c331b010a0b093a7d199c121c4224f0437826217df2958340b0f0192b4421219423742fce2084160859ce95822a98401c4c1dc5f60f6208f7c0
269d267448328c48480a01e71f01d47799a13927d133e4b440ffffff0fff7faf703865eec3a788df3c123b4adfff3da296423ca6bdfffb69361686bcffff590c
12819bab52ffff554f07080433c3dc6bfff7a950944280227e42ffff339c398e4c2c568fff7959780d48d840c513cfff9cc4c0ac6b7628316ffff233701f0542
587198fff7874682c03901ee19fff38211708121841e6dfff395208d69a8098cbd0effff5042809f29be2946cfff951702c1271f45c2483378fffb7958d3eb0d
6e9d221780f42effffd061e2e84c33c3eafff389917242166e03c333ffffec0fb422c8d0f46efffe119f1032dc6e01cfffbc0ff5229841efff52ff40d429b8b8
ffff719f764a260c5afffff40fb1023efff8ad2cf254ef897cffff3cead62f530cf0f8c31efffd98711d46b6c21ea056cffff3584394b126e0406c5cfff14756
fc31c699cc23574c79020ce0efff065d722148422feeb133b20cffff317521d52da01c224d294901dffff74a21ca290221b46e09fff39e190cb9001483441eff
f1a842f48388011248d4cfff149070b2c4e8128880fff7073e8167814211c2c3cfff54b70c1890269046128ce8ffff9c10a8890f52fcfff3493461c51890740f
00ffff0958b0d1aca1c1cfff3cd3c30c091e1014e3ffff151d1229c2f5782fff72d5f5617c6740c611efffda19d2a18d040211433fff71798dc42d09329c14e8
19fefff4a5906976ca9de80f42efff36832085c07578e4cfff54e06b46e94294ea70c14ffff4a44e5c26d028b070efff1a1c8c42464e1c089cfff9c29dc93889
83248638fff787c04276c7f0540c1d95429fff3845320a9ca100c312b524efffd9d2b4c0221915eac1f6214294efff9d2c129326113c2c5962948463efff9de0
a13519c2c2c5b72a1dc690efff7531288922295694ea58ea1d67cfff729c808464326346eb94ac1744212fff782b44ca18004444ec58e6c522909fff34b94a7d
16146f439db3955ed7c61efffc421d46942758581f68325f3c184efff980800b62485ced1e80fb494efff742b4c267cc442cf09834e7a2cffff0066079cf5193
68fb677cfffb8c06b994437bf929c1cf83f5efff40d05e18b9cd96e84cf8dd33ffff1a60942e84c4ef88dff266efff4012c599f72d3ed8cf6570ffbf9b83cf02
9e0b4b4239c3dd1dd512cf6d19ffbf21cc63212bc5683bede3c218462e7ba1ff7f761c2d8f107cf67842546223b0e7b43fff70258e8ef8902642232cf7dd8ff7
f318a789cbff2a67079367c11f76ceffe16294c2cf4be7a32e4285cf71effe4231e0e7a5a1c6c0098429fff756fff003174d67029defff4d481efbb26343b8dc
1108ff23ff7f6c0e0bf7ad9481674342a4f7c0fffe001e2e7194101242c62e73398ff3740148ff42380703958ffc1c1fffe08f75420711e99afff7498098cf77
40404e0428fb33ff7f284c19873b3481850dc2966efc0ff376d3094afe76074c800b042b1f72fff6299442cdbc435687261b1fbadffc716289d7d54099569046
838f331ff7f64936109fc124794220cff5cef7fedb0d365d563c83248913698cf9e8ff534150ffffff0fff7faf30764dec9f38acf8395cefffbb15e83ae93e8f
ff7d64fe0675bfff7857e242c52942ffff63fc224622c542bdfff7531a90708f096efff9a683300fd2dcffffc502790480f0942ffff2315f58d0960f095f9cff
f7cd10847852ac3899fffb81a2d0240280fdeb6efff2211c749848309b2ffff23cb28622cfff5d480f38c1c946b5efff121e61c3c92ffff0b4cf852e06379fff
77618cf2c12837aefff0210f718a4b798fff7723ac99834ab0370fcfffd303908b245e003574fc36bfff770239c989099ac397263efff91f8c030059783c3bcc
fff530d10e80452283319643ffffc2371620808526231f07176278fff361a9053e524422a711f8bec1fff7d22bb03c334566e52e8be4f0df21fff7d806408be0
4c053bc17c313d3acfffbad102193830dc717c6f6cf37c9fe9bc83c3f52fff7a67c10c1667c1a322c09dc92ae0a98421dfffb57b90dcb4292f8c137d1348d112
0e986ab2ffff90d89c5936676c72b3abd4763c91c6396ea9fffb460ca11e0d662b9569be89e29b86e8ac192efff3d6e203b89301299c64671dbf028e3ea3f8ca
fff79e854030ec76d426fde8dd29ca674e966cfff3a8158d6972f95a4629c619e67e3fd270be6fff7607409c23ef9c37ce4fc1b42fd121b8c198373cc7194eff
f9c381139384e3f677eb94c17c2b3e9764e0fd6dafe97e8d29cfff1950b54425bdbeaf6b1539c386c1fcb6caf8c12efff94212214000175afc267063ceb83343
83c2cfffb8025c2854802b9c213093290f7632efff440f83e9e199846dc1214261110f3731efff507ce0e781e2480ff501c0fff728a858320231c2148f9955e0
ffff10c1d904e118011319428ff2c3621ffff0a0d74289015985b6ef6ea3221fff7044163d4840b4222b560f378768fff71c92b1848cc0946eff02c48ffdbcbf
12227c211eff0276c5fff70e010e8927095208b48d21ff398befff04242c2c192dc2442f8f84294eff0984ea7efff042064e8575bc4211324062e77632fff702
82c32b6a949780ffb840bfffb075462e937d9574c6742132f7722622fff7186248eb6984a655dd6bfd93cefff2811f5c0c1f5a94291b3629f9341cfff78a42b5
21c1793e9119369ce8ffb80efff4088442c5f8329485694eff221bffff0c888a42f0e03898ffd08ffff090c3cf079419ffb0958fff70f00f0f38421ff720fff7
1a10e90f3890ff79006ffff0629f9d8cf798b726598fff302195802480bc26d5eff127ce88fff301668a80980629cebff752efff044630a905504c609ff3dc37
cffe7890014031b343b09fffc34a5ffbf1e8070562780ef7234297ef7f3432521c6b8add59d429ff9853bcfff1024cea8ee0fed762628c1bff15a9fff30174ac
49d98a08d1b8cff2084afff7029cf03a2947b51748ff30ffff2a3190f84a92b880404429ff98fef7f18854e095f81462210280fb722db0ff3f42324f5e874016
c2ce21c6f7b802f4fffe42462e852b85299194645a199fd9023fff648381c703a4c1b9642dc22ff3983ef7f8ccdb4b69a724c429ffd469ffdf81bfc281b48409
84394239cf798e80bff9722cb8e9d84c29884843248fb03473feffc306174f19e198029857988e2b03324e72e39ffd32c4e8327ccc22884c009c274298fdd3ff
f700bdc3dc21a00639139836d442e7c01399ffbbc5bc1b66346958112c265988d29fb84493ef7e3c37406310952b03934eb19fd8ffff1311690c6cc2179042e1
44ef3dffff0f4a11b8848ad29c09852299526f429f906ff37639562219d5b88c486403e60ffce89ffd75a894409043c8ea299ce798cf19deffe0000000000000
__label__
00006660666066606600000006606660666066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006660606006006060000060006060606006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606060666006006060000060006660660006006660000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006060606006006060000060006060606006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006060606066606060000006606060606006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06006660666066606000666000000660066066606660666066000600000000000000000000000000000000000000000000000000000000000000000000000000
60000600060006006000600000006000600060606000600060600060000000000000000000000000000000000000000000000000000000000000000000000000
60000600060006006000660000006660600066006600660060600060000000000000000000000000000000000000000000000000000000000000000000000000
60000600060006006000600000000060600060606000600060600060000000000000000000000000000000000000000000000000000000000000000000000000
06000600666006006660666000006600066060606660666060600600000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600000666066606660066006600000066666000000666006600000066066606660666066600000066066606660666000006000000000000000000000000000
06000000606060606000600060000000660606600000060060600000600006006060606006000000600060606660600000000600000000000000000000000000
60000000666066006600666066600000666066600000060060600000666006006660660006000000600066606060660000000060000000000000000000000000
06000000600060606000006000600000660606600000060060600000006006006060606006000000606060606060600000000600000000000000000000000000
00600000600060606660660066000000066666000000060066000000660006006060606006000000666060606060666000006000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__map__
0102010201020102010201020102010200000000000000000000000000000000010201020102010201020102010201023c3d3e3f4c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112111211121112111211121112111200030404040404040404040404040500111211121112111211121112111211124d0000004e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01020102010201020102010201020102002324242424242424242424242425002f1010101010101010101010101010204f0000005c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111211121112111211121112111211120000002f101010101010101020000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f225d0000005e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11120102010201020102010201021211000000213f3f3f3f3f3f3f3f22000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f225f6c6d6e6f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01021112111211121112111211120201000000213f3f3f3f3f3f3f3f22000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f1010101010101010101010101010200000000f14141414141414141f000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000213f3f3f3f3f3f3f3f3f3f3f3f3f3f220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f22000000000000000000000000000000000f14141414141414141414141414141f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000111211121112111211121112111211120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000000000030404040404040404050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000000000133f3f3f3f3f3f3f3f150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
213f3f3f3f3f3f3f3f3f3f3f3f3f3f2200000000000000000000000000000000000000232424242424242424250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f14141414141414141414141414141f00000000000000000000000000000000010201020102010201020102010201020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010200030016500065007650c1000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200020c4100c210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200030021500415003250c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000010c15000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010100140c3100c3200c1700c1700c1600c1600c1500c0500c0400c0300c0300c0300c7300c7300c7300c7300c7200c7200c7100c3150c1000c1000c1000c1000c1000c1000c1000c1000c1000c1000c1000c100
010300183c6353c6050000000000356153f6050500005000356153f6050500005000356153f6050500005000356153f6050500005000356153f6053f6053f6053c6053c6053c6053c6053c6053c6053c6053c605
01ff02041823418221182311822118200182001820018200182001820118201182011820118201182011820118201182011820118201182011820118201182011820118201182011820118201182011820118201
011406073c5303c5213c5113c5113c5113c5103c51000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
010a00001881018810188101881018821188201882018820188311883018830188301884118840188401884018851188501885018850188501885018850188501885018850188501885018850188501885018850
010a00000000000000000000000000000000000000000000009140091000910009100092100920009200092000931009300093000930009410094000940009400094000940009400094000940009400094000940
0150000018f2018f111bf201bf111af201af111af101af101af101af101af101af101af101af101af101af151b7201b7111b7111b715197201971119710197151886018851188411883118821188111681112811
0150000030f2430f1133f2433f110cb700cb510cb310cb1100b7000b6100b5100b4100b3100b2100b1100b150ff300ff2113f3013f2114f3014f2114f1114f1014f1500914009250093400945009340092500914
01500000188501884118831188411885118841188311884118a2418a3118a4118a3118a4118a3118a4118a3118a4018a3118a2118a3118a2118a3118a2118a1118a4016a4114a3112a3110a210ea210ca110aa11
01500000009400094000940009400092000920009110091518834188211881118821188111882118810188101f7301f7211f7111f7152073020721207112071500b7000b6100b5100b4100b3100b2100b1100b15
0115000003b5003b5003b5003b5003b5003b5003b5003b5003b4103b4003b4003b3103b3003b3003b2103b2006b5006b5006b5006b5006b5006b5006b5006b5006b4106b4006b4006b3106b3006b3006b2106b20
0115000022b3022b3022b2122b2022b2022b2022b2022b2022b2022b2022b1122b1022b1022b1022b1022b1521b3021b3021b3021b3021b3021b2121b2021b2021b2021b2021b1121b1021b1021b1021b1021b10
0115000022f2022f2022f2022f2022f2022f2022f2022f2022f1022f1022f1022f1022f1022f1122f1022f1521f2021f2021f2021f2021f2021f2021f2021f2021f1021f1021f1021f1021f1021f1121f1021f15
0115000024115231151f1151e1152111522115261152711523115211151d1151c11520115211152511526115201151f1151b1151a1151e1152111525115261151e1151d11519115171151e1151f1152311524115
0115000005b5005b5005b4105b4005b3105b3005b2105b1008b5008b5008b4108b4008b3108b3008b2108b1009b5009b5009b5009b4109b4009b4009b3109b3009b3009b2109b2009b2009b1109b1009b1009b10
01160000177371a727177171a717177171a717177171a717177171a717177171a717177171a715177001a700187371c727187171c717187171c717187171c717187171c717187171c717187171c715187001c700
0115000026b3026b3026b2126b2026b2026b2026b2026b2026b2026b2026b1126b1026b1026b1026b1026b1528b3028b3028b3028b3028b3028b2128b2028b2028b2028b2028b1128b1028b1028b1028b1028b15
0015000026f2026f2026f2026f2026f1126f1026f1026f1026f1026f1026f1026f1026f1026f1126f1026f1528f3028f3028f3028f3028f3028f3028f3028f3028f2028f2028f2028f2028f2028f1128f1028f15
012800000bb600bb510bb410bb310eb600eb510eb410eb3108b6008b5108b4108b3108b2108b1108b1108b100db600db510db410db3110b6010b5110b4110b310ab600ab510ab410ab310ab210ab110ab110ab10
012800000ef400ef110df400bf4006f4006f3106f2106f1108f4008f4008f3108f3008f2108f2008f1108f1510f4010f110ff400df4008f4008f3108f2108f110af400af400af310af300af210af200af110af15
012800001e7201e7121e7121e7151a7221a7121a7121a7151b7301b7211b7221b7111b7121b7121b7121b715207202071220712207151c7221c7121c7121c7151d7301d7301d7211d7221d7221d7111d7121d715
0128000006f3006f3006f2106f1502f3002f3002f2102f1503f3003f3003f2103f152cf202cf112cf112cf1008f3008f3008f2108f1504f3004f3004f2104f1505f2005f2005f2105f152ef202ef112ef102ef11
0128000003b6003b5103b4103b3103b2103b1103b1103b1503b6003b5103b4103b3103b2103b1503b6003b5502b6002b5102b4102b3102b2102b1102b1102b1002b1002b1002b1002b1002b1002b1002b1002b10
012800002eb042eb003ab143ab1239b1239b1135b1235b1235b1035b1036b1236b122fb122fb122eb122eb122db122db122db122db102db102db102db102db102db102db152db002db002db002db002db002db00
012800002e5202e5112e5102e5102e5102e5102e5102e5151e5201e5111e5101e5101e5101e5101e5101e51526520265112651026510265102651026510265102651026510265152650526500265002650026505
012800002ef202ef202ef202ef202ef202ef212ef112ef151ef201ef201ef201ef201ef201ef211ef111ef1526f2026f2026f2026f2026f1126f1026f1026f1026f151a8141a8211a8311a8411a8311a8211a811
0150000019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a5019a50
015000201ce541ce411ce311ce211ce111ce111ce151ce051be541be411be311be211be111be111be151be051ce541ce411ce311ce211ce111ce1523e5423e4124e5024e4124e3124e2124e1124e1124e1524e05
015000001c9501c9411c9311c9211c9121c9121c9121c91501b7001b6101b5101b4101b3101b2101b1101b1501b7001b5101b5501b7501b7001b6101b5101b1101b7001b5101b5501b7501b7001b6101b5101b11
0150000004520045110451104511045120451204515045050f5200f5110f5100f5151352013511135101351510520105111051010515145201451114510145100f5200f5110f5100f51513520135111351013515
015000000d9140d9210d9310d9410d9510d9410d9310d9351b9501b9411b9311b9211f9501f9411f9311f9211c9501c9411c9311c921209502094120931209211b9501b9411b9311b9211f9501f9411f9311f921
015000000eb400eb310eb210eb2509b4009b450eb400eb450db400db310db3501b6501b6001b5101b4101b450eb400eb310eb210eb2509b4009b450eb400eb450db400db310db3501b6501b6001b5101b4101b45
0150000015c1015c1015c1015c1015c1015c1015c1015c1014c1014c1014c1014c1014c1014c1014c1014c2115c2015c2017c2017c2018c2018c201dc201dc1120c1020c1020c1020c1020c1020c1020c1020c10
0150000011c2011c2011c2011c2011c2011c2011c2011c2010c2010c2010c2010c2010c2010c2010c2010c2011c2011c1114c1014c1015c1015c101ac101ac101cc101cc101cc101cc101cc101cc101cc101cc10
015000000050000500005000050000500005000050000500085500854108521085250d5500d5410d5210d5250050000500005000050000500005000050000500085500854108521085250d5500d5410d5210d525
015000000eb400eb310eb3509b650eb500eb310eb110eb1510b4010b3110b3504b6504b5004b4104b2104b250eb400eb310eb3509b650eb500eb310eb110eb1510b4010b3110b3504b6504b5004b4104b2104b20
0150000009014090100901209012090120901209012090150b016170160b0120b0120b0120b0120b0120b01509017150170901209012090120901209012090150b016170160b0120b0120b0120b0120b0120b010
015000001d9401d9311d9211d9111d9101d9101d9101d9111f9301f9301f9301f9301f9211f9111f9151f9051d9301d9301d9301d9301d9301d9211d9111d9111354013531135111351012540125311251112510
015000001d5301d5211d5111d5111d5111d5151d5001d5051f5401f5311f5111f515235402353123511235151d5401d5311d5211d5111d5111d5151d5001d5051fe541fe411fe311fe211ee501ee411ee311ee21
0150000001b5001b4101b3101b2101b1101b1001b1001b1501b7001b6101b5101b4101b3101b2101b1101b1501b7001b5101b5501b7501b7001b6101b5101b1101b7001b5101b5501b7501b7001b6101b5101b11
010c00001705000000000000000017050000000000000000170500000000000000001705000000000000000017050000000000000000170500000000000000001705000000000000000017050000000000000000
0118000018d3018d3018d3518d3018d3018d3518d3018d3018d3518d3519d3019d3518d3018d3519d301ad3018d3018d3018d3518d3018d3018d3518d3018d3018d3518d3519d3019d3518d3018d3519d301ad30
010c00200bb750bb650bb550bb450bb350bb250bb750bb650bb550bb450bb350bb250bb750bb650bb550bb450bb350bb250bb750bb650bb550bb450bb350bb250cb750cb550cb750cb6509b7509b5509b7509b65
0118000039a4631a3639a2736a1739a1239a1239a1239a1239a1239a1239a1239a1239a4631a3639a1736a173da4639a363da2736a173da123da123da123da123da123da123da123da123da4638a363da2738a17
011800001e4201e4101e4111e2101e2101e2101e4101e4121e4121b2121b4121b2121f4201f4111f2121f2121e4201e4111e4101e2101e2101e2101e4101e4121e4121b2121b4121b2121f4201f4111f2121f212
011800002322023211232112341023411234102341023411232122321223212232122322023211232122321223220232112321023410234102341023412234122321223212232122321223220234112321223212
010c002006b7506b5506b3506b3506b3506b3506b7506b5506b3506b3506b3506b3512b7506b5506b4506b3506b3506b2506b7506b5506b3506b3506b3506b2506b7506b5506b7506b6512b7506b5506b3506b35
010c00201214512135121251201512015120151214512135121251201512015120151214512135120251201512115121151214512135121251201512015120151314513135130251301515145151351502515015
010f00180cb750cb550cb350cb650cb650cb750cb750cb550cb350cb750cb550cb350cb750cb550cb350cb750cb750cb750cb750cb550cb350cb750cb550cb350cb750cb550cb350cb750cb550cb350cb750cb55
010f00183c61500d0000d0018d1519d1518d1519d15000000000019d1500000000003c61500d0000d0018d1530f0024f011ad15000000000019d1518d1519d150000000000000000000000000000000000000000
010f0000309762b976309562720607e7507e7507e7507e7507e6507e6507e6507e6507e5507e5507e5507e5507e4507e4507e4507e4507e3507e3507e3507e35309762b976309562720607e7507e7507e7507e75
010f00000cb750cb550cb350cb350fb750fb550fb350fb650fb650fb750fb750fb550fb350fb750fb550fb350fb750fb550fb350fb750fb750fb750fb750fb550fb350fb750fb550fb350fb750fb650fb550fb45
010f0000309762b9763095627206339762e976339562a2060ae750ae750ae750ae750ae650ae650ae650ae650ae550ae550ae550ae550ae450ae450ae450ae450ae350ae350ae350ae350ae350ae350ae350ae35
010f00003c61507e7507e7507e753c61500d0000d0018d1519d1518d1519d15000000000019d1500000000003c61500d0000d0018d1519d0519d051ad15000000000019d1518d1519d153c61519d1518d1519d15
010f00001bb451bb351bb251bb351bb351bb451bb451bb351bb251bb451bb351bb251bb451bb351bb251bb451bb451bb451bb451bb351bb251bb451bb351bb251bb451bb351bb251bb451bb351bb251bb451bb35
000f00001bb451bb351bb251bb351eb351eb451eb451eb351eb251eb451eb351eb251eb451eb351eb251eb451eb451eb451eb451eb351eb251eb451eb351eb251eb451eb351eb251eb451eb351eb251eb451eb35
000f002012b7512b5512b3512b6512b6512b7512b7512b5512b3512b7512b5512b3512b7512b5512b3512b7512b7512b7512b7512b5512b3512b7512b5512b3512b7512b5512b3512b7512b5512b3512b7512b55
010f002021b4521b3521b2521b3521b3521b4521b4521b3521b2521b4521b3521b2521b4521b3521b2521b4521b4521b4521b4521b3521b2521b4521b3521b2521b4521b3521b2521b4521b3521b2521b4521b35
010f00000de750de750de750de750de650de650de650de650de550de550de550de550de450de450de450de450de350de350de350de350de350de350de350de350de350de350de350de35259762a9762d9062af00
010f0000309762b976309562720607e7507e7507e7507e7507e6507e6507e6507e6507e5507e5507e5507e5507e4507e4507e4507e4507e3507e3507e3507e3507e3507e3507e3507e3507e3507e3507e3507e35
__music__
01 08094a4b
02 0c0d0a0b
00 0e0f1011
00 12141315
00 16171819
04 1a1b1c1d
01 2021221f
00 23242526
00 2728292a
02 2b21221f
01 2e30312d
02 322f332d
01 34353677
00 37393877
00 3435363a
00 3739383b
00 3c353d3e
00 34353a3f
00 3c353d3e
02 34353a3f

