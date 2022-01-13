pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- 
game_cart = "pico-dune.p8" --_min

faction_cols = {
 { 12, 1}, -- 1 = Atreides
 { 11, 3}, -- 2 = Ordos
 { 8,  2}, -- 3 = Harkonnen
 { 14, 2}, -- 4 = Emperor
}

-- cart modes
title_mode=1
houseselect_mode=2
levelintro_mode=3
levelend_mode=4
levelselect_mode=5


mission_data={
{ -- atredies missions
 {1,999,1000,4,1,88,72,2,24,64,2,160,64,2,160,152,40,32},
 {2,1200,2700,2,1,144,200,2,120,96,nil,nil,nil,nil,nil,nil,16,32},
 {3,1500,nil,2,1,176,112,3,408,440,nil,nil,nil,nil,nil,nil,14,62},
 {4,1500,nil,2,1,176,432,3,296,16,nil,nil,nil,nil,nil,nil,12,62},
 {5,1500,nil,2,1,88,200,2,448,288,nil,nil,nil,nil,nil,nil,10,62},
 {6,1700,nil,3,1,264,312,3,8,24,3,480,136,nil,nil,nil,8,62},
 {7,2000,nil,4,1,200,72,2,280,408,nil,nil,nil,nil,nil,nil,6,62},
 {8,2000,nil,4,1,192,240,3,328,8,2,248,448,2,424,424,4,62},
 {9,2500,nil,4,1,232,416,4,360,40,3,112,40,2,408,136,2,62},
},
{ -- ordos missions
 {1,999,1000,4,2,88,72,3,24,64,3,160,64,3,160,152,40,32},
 {2,1200,2700,2,2,144,200,3,120,96,nil,nil,nil,nil,nil,nil,16,32},
 {3,1500,nil,2,2,176,112,1,408,440,nil,nil,nil,nil,nil,nil,0,62},
 {4,1500,nil,2,2,176,432,1,296,16,nil,nil,nil,nil,nil,nil,12,62},
 {5,1500,nil,2,2,88,200,3,448,288,nil,nil,nil,nil,nil,nil,10,62},
 {6,1700,nil,3,2,264,312,1,8,24,1,480,136,nil,nil,nil,8,62},
 {7,2000,nil,4,2,200,72,3,280,408,nil,nil,nil,nil,nil,nil,6,62},
 {8,2000,nil,4,2,192,240,3,328,8,1,248,448,1,424,424,4,62},
 {9,2500,nil,4,2,232,416,4,360,40,3,112,40,1,408,136,2,62},
},
{ -- harkonnen missions
 {1,999,1000,4,3,88,72,1,24,64,1,160,64,1,160,152,40,32},
 {2,1200,2700,2,3,144,200,1,120,96,nil,nil,nil,nil,nil,nil,16,32},
 {3,1500,nil,2,3,176,112,2,408,440,nil,nil,nil,nil,nil,nil,0,62},
 {4,1500,nil,2,3,176,432,2,296,16,nil,nil,nil,nil,nil,nil,12,62},
 {5,1500,nil,2,3,88,200,1,448,288,nil,nil,nil,nil,nil,nil,10,62},
 {6,1700,nil,3,3,264,312,2,8,24,2,480,136,nil,nil,nil,8,62},
 {7,2000,nil,4,3,200,72,1,280,408,nil,nil,nil,nil,nil,nil,6,62},
 {8,2000,nil,4,3,192,240,2,328,8,1,248,448,1,424,424,4,62},
 {9,2500,nil,4,3,232,416,4,360,40,2,112,40,1,408,136,2,62},
}
}

mentat_dialogs={ 
[0]={ -- introduction
 "tHE PLANET aRRAKIS,\nKNOWN AS dUNE.\n\nlAND OF SAND;\nHOME OF THE sPICE mELANGE.:tHE sPICE CONTROLS THE eMPIRE.\n\nwHOEVER CONTROLS dUNE \nCONTROLS THE sPICE.:tHE eMPEROR HAS PROPOSED A \nCHALLENGE TO EACH OF THE hOUSES.:tHE hOUSE THAT PRODUCES THE \nMOST sPICE WILL CONTROL dUNE.\n\ntHERE ARE NO SET TERRITORIES \nAND NO RULES OF ENGAGEMENT.",
 "vAST ARMIES HAVE ARRIVED.\n\nnOW, THREE HOUSES FIGHT FOR \nCONTROL OF dUNE.",
 "tHE NOBLE aTREIDES,",
 "THE INSIDIOUS oRDOS, ",
 "AND THE EVIL hARKONNEN. ",
 "oNLY ONE HOUSE WILL PREVAIL.",
 "yOUR BATTLE FOR dUNE BEGINS...\n\n           ...now.",
},
{ -- atredies missions
 "gREETINGS,\ni AM YOUR mENTAT cYRIL.:tOGETHER WE WILL PURGE THIS\nPLANET OF THE FOULNESS OF THE\nOTHER hOUSES.:tHE hIGH cOMMAND WISHES YOU\nTO PRODUCE 1000 CREDITS.:yOU MAY EARN CREDITS BY\nBUILDING A REFINERY AND\nHARVESTING SPICE",
 "gREETINGS,\ni AM HONORED TO SEE YOU AGAIN.:tHE hIGH cOMMAND NOW REQUIRES\nTHAT YOU PRODUCE 2700 CREDITS\nIN A NEW HARVESTING AREA.:uNFORTUNATELY, WE HAVE\nCONFIRMED THE PRESENCE OF AN\noRDOS BASE IN THIS REGION.:gOOD LUCK!",
 "tHE BATTLE WITH THE OTHER \nhOUSES HAS INTENSIFIED AND WE \nARE NOW FORCED TO ENGAGE IN \nSOME SELECTED OFFENSIVE \nMANEUVERS.:tHE hARKONNEN ARE BEING \nEXTREMELY TROUBLESOME IN YOUR \nNEXT REGION, AND WE MUST ASK \nYOU TO REMOVE THEIR PRESENCE \nFROM THIS AREA.", 
 "yOUR DEMONSTRATION OF MILITARY \nSKILLS NOW FORCES US TO ASSIGN \nYOU TO ANOTHER OFFENSIVE \nCAMPAIGN AGAINST THE hOUSE \nhARKONNEN.:tHEY HAVE CONTINUED TO ATTACK \nOUR PEACEFUL HARVESTERS, AND \nMUST BE REMOVED FROM THE AREA.",
 "wELCOME.\n\ntHE RULES SEEM TO HAVE CHANGED.:\naS YOU HAVE WITNESSED THE \neMPEROR HIMSELF HAS BEEN AIDING \nTHE EFFORTS OF OUR COMPETITORS!:aS A PART OF OUR NEW STRATEGY, \nWE MUST ASK THAT YOU ELIMINATE \nTHE TREACHEROUS oRDOS FORCES \nTHAT PRESENTLY CONTROL THIS \nREGION.",
 "aS THE BATTLE FOR THIS PLANET \nINTENSIFIES, ALL EFFORTS MUST \nBE TAKEN TO ENSURE SUCCESS.:oNCE AGAIN WE MUST CALL UPON \nYOU TO DESTROY OUR ENEMIES IN A \nTROUBLED SECTOR.:hOUSE hARKONNEN MUST BE TAUGHT \nA LESSON.\n\ntHANK YOU, AND GOOD LUCK!",
 "tHE BATTLE GOES WELL, BUT THERE \nIS NO TIME TO RELAX.:wE HAVE AN URGENT NEED FOR YOU \nTO SUBDUE ALL oRDOS FORCES IN \nTHIS REGION PROMPTLY.:oUR ONGOING NEGOTIATIONS ARE \nAIDED IMMEASURABLY BY \nCORRESPONDING VICTORIES IN THE \nFIELD.:wE ARE COUNTING ON YOU.",
 "aLTHOUGH YOU HAVE EARNED A WELL \nDESERVED REST, i'M AFRAID THE \nPOLITICAL SITUATION REQUIRES \nTHAT WE SEND YOU BACK INTO THE \nFIELD IMMEDIATELY.:bOTH oRDOS AND hARKONNEN FORCES \nHAVE BUILT UP TO UNACCEPTABLE \nLEVELS IN THIS REGION, AND NOW \nMUST BE REMOVED COMPLETELY.",
 "yOUR NEXT ASSIGNMENT WILL \nDETERMINE THE ENTIRE OUTCOME OF \nOUR EFFORTS ON dUNE.:vICTORY WILL NOT COME EASILY.:iN ADDITION TO DESTROYING ALL \nREMAINING oRDOS AND hARKONNEN \nTROOPS...:...YOU ARE ALSO INSTRUCTED TO \nSUBDUE eMPEROR fREDERICK'S \nFORCES.:aLL OF OUR HOPES AND DREAMS ARE\nRIDING ON YOU, AND WE HUMBLY \nBEG YOU TO PROVIDE ONE FINAL \nVICTORY FOR OUR NOBLE \nhOUSE aTREIDES.",
 "gOOD MORNING YOUR LORDSHIP,\nAND CONGRATULATIONS!\n\nyOU SERVED hOUSE aTREIDES WELL.:wE WILL NOT SOON FORGET OUR \nMOST NOBLE WARRIOR.:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",
 "mY GOODNESS, WHAT AN AWFUL \nDEFEAT!:pERHAPS WE HAVE GIVEN YOU TOO\nMUCH RESPONSIBILITY.:iF YOU FAIL AT YOUR NEXT\nASSIGNMENT,\nWE WILL HAVE TO SERIOUSLY\nCONSIDER SENDING YOU HOME!",
},
{ -- ordos missions
 "wELCOME.\ni AM YOUR mENTAT, AND YOU MAY \nCALL ME aMMON.:tO BE OF ANY VALUE TO THE \ncARTEL, YOU MUST PROVIDE US \nWITH CREDITS.:aS A TEST, WE WILL ASSIGN YOU \nTO A REGION, AND ASK THAT YOU \nMEET A PRODUCTION QUOTA OF \n1000 CREDITS.:bUILD A REFINERY AND HARVEST \nTHE SPICE IN THE AREA. i AM \nVERY BUSY, BUT YOU MAY CALL \nUPON ME IF YOU HAVE FURTHER \nQUESTIONS.",
 "yOUR QUOTA IS NOW 2700 CREDITS, \nAND THIS SPICE ACCUMULATION IS \nYOUR PRIMARY DIRECTIVE.:wE DO NOT EXPECT YOU TO DESTROY \nTHE hARKONNEN FORCES IN THE \nAREA,:HOWEVER YOU SHOULD CONSIDER THE \nTIME THAT COULD BE SAVED BY \nAPPROPRIATING THEIR SILOS.",
 "wE FIND THE ACTIVITIES OF \naTREIDES TROOPS IN THIS REGION \nINCONVENIENT.:pLEASE REMOVE THIS OBSTACLE.\n\nwE CANNOT ALLOW THE MYTHICAL \nVALUE OF FAIR PLAY TO IMPEDE \nOUR PROGRESS.",
 "tHE aTREIDES FORCES IN THIS \nAREA MUST BE ELIMINATED.:aS ALWAYS, WE APPRECIATE YOUR \nCAPTURE OF ANY ENEMY SILOS OR \nOTHER STRUCTURES THAT MIGHT BE \nSALVAGEABLE.",
 "sO, OUR SPIES REVEAL WHY THE \nsARDAUKAR ATTACKED US IN YOUR \nLAST MISSION.\n\ni WILL NEED TO LOOK INTO THIS.:aLTHOUGH THE hARKONNEN \nCOMMANDERS ARE LAUGHABLY STUPID\nTHEIR MILITARY STRENGTH IS A \nTHREAT TO US IN THIS AREA.:tHEY MUST BE ELIMINATED AS SOON\nAS POSSIBLE.",
 "tHE aTREIDES HAVE BECOME FAR \nTOO VOCAL IN THIS SECTOR, AND \nWHINE CONSTANTLY ABOUT THEIR \nRIGHTS.:wE oRDOS DO NOT HAVE THE \nLEISURE OF POINTLESS \nCONVERSATION, AND MUST ASK YOU \nELIMINATE THIS DISTRACTION.",
 "hARKONNEN FORCES CONTINUE TO \nTHWART OUR EFFORTS IN THIS \nREGION, AND MUST BE REMOVED \nCOMPLETELY.:cRUSH THEIR BELOVED TROOPERS \nAND THEY WILL RUN CRYING BACK \nTO THEIR UGLY MOTHERS!",
 "bOTH aTREIDES AND hARKONNEN \nFORCES OPPOSE OUR CONTROL OF \nTHIS AREA AND MUST THEREFORE BE\nDESTROYED.:tHE TIME OF COOPERATION AND \nCOMPROMISE IS PAST, AND ALL \nENEMIES OF hOUSE oRDOS MUST BE\nELIMINATED!",
 "eMPEROR fREDERICK HAS JOINED \nTHE LIST OF oRDOS' ENEMIES, AND \nMUST BE PUNISHED.:dESTROY HIS TROOPS AND ANY \naTREIDES AND hARKONNEN REMNANTS \nTHAT STILL OPPOSE US ON THIS \nPLANET.:wE HAVE RISKED EVERYTHING ON \nTHIS FINAL BATTLE, AND CANNOT \nTOLERATE LESS THAN YOUR BEST \nEFFORT.",
 "gOOD mORNING, YOUR LORDSHIP, \nAND CONGRATULATIONS!\n\nyOU'VE SERVED hOUSE oRDOS WELL.:wE WILL NOT SOON FORGET OUR \nMOST NOBLE WARRIOR!:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY, AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",
 "aPPARENTLY, i WAS MISTAKEN \nABOUT YOUR POTENTIAL.:iT WILL COST US A GREAT DEAL TO\nRETAKE THIS REGION.:oNLY COMPLETE SUCCESS WITH YOUR\nNEXT ASSIGNMENT COULD POSSIBLY\nRESURRECT YOUR CAREER.",
},
{ -- harkonnen missions
 "i AM THE mENTAT, rADNOR.:wITH MY GUIDANCE, YOU MAY BE \nABLE TO ASSIST US IN CONQUERING \nTHIS DUSTY LITTLE PLANET.:fOR YOUR FIRST TEST YOU WILL BE\nEXPECTED TO PRODUCE 1000 \nCREDITS, AND NOT A GRANULE LESS:yOU MAY EARN CREDITS BY \nHARVESTING SPICE, AND WILL NEED\nTO BUILD A REFINERY TO CONVERT\nSPICE TO CREDITS.:iF ANY OF OUR FOOLISH ENEMIES \nATTEMPTS TO ATTACK YOUR BASE \nYOU WILL HAVE THE PLEASURE OF\nSEEING THE INVINCIBLE hARKONNEN\nTROOPS IN ACTION.",
 "hOUSE hARKONNEN HAS GENEROUSLY \nGRANTED YOU A NEW OPPORTUNITY \nTO SERVE US.:wE WILL NOW ALLOW YOU TO TAKE \nCOMMAND IN A MORE DANGEROUS \nAREA, AND ACCUMULATE 2700 \nCREDITS.:aLTHOUGH THE WORTHLESS aTREIDES\nYOU MAY ENCOUNTER IN THIS \nREGION SHOULD BE ELIMINATED AS \nA MATTER OF PRINCIPLE,:...THE SPICE QUOTA IS \nYOUR OBJECTIVE.",
 "tHE DESPISED oRDOS ARE WELL \nESTABLISHED IN THIS REGION, AND \nARE HARVESTING SPICE THAT \nSHOULD RIGHTFULLY BELONG TO \nhOUSE hARKONNEN.:dESTROY THE oRDOS INSTALLATIONS \nIN THIS AREA AND ASSERT CONTROL \nIN THE NAME OF hOUSE hARKONNEN.",
 "oNE SMALL VICTORY DOES NOT WIN \nTHE WAR.:aNOTHER REGION HAS THE \nMISFORTUNE TO BE INFESTED WITH \nVERMIN FROM hOUSE oRDOS, AND \nYOU MUST NOW REPEAT YOUR \nSUCCESS.:i HAVE MANY DELICATE POLITICAL \nNEGOTATIONS ON MY MIND, AND i \nDON'T NEED TO BE WORRYING ABOUT\nLOOSE ENDS.",
 "sO, THE eMPEROR WAS HELPING THE \noRDOS IN YOUR LAST MISSION.:nEVER THE LESS, hOUSE aTREIDES \nHAS GROWN STRONGER DUE TO OUR \nNEGLIGENCE, AND MUST NOW BE \nTAUGHT A LESSON.:yOU WILL REMOVE ALL THE \naTREIDES FROM THIS REGION.",
 "yOU ARE TO PROCEED INTO YET \nANOTHER REGION DOMINATED BY \nTHOSE PESKY oRDOS, AND i EXPECT\nYOU TO OVERCOME THIS RATHER \nTROUBLESOME oRDOS GROUP.:wE HAVE ESTABLISHED A GOOD \nREPUTATION ON THIS PLANET.\n\ndO NOT EMBARRASS ME NOW!",
 "rEPORTS OF NEW aTREIDES \nACTIVITY REQUIRE THAT i SEND \nYOU IMMEDIATELY BACK TO THE \nFRONT LINE.:yOU DO NOT SEEM TO ENJOY REST \nAND RELAXATION ANYWAY.\n\ni THINK YOU WOULD PREFER TO \nCRUSH THE aTREIDES.",
 "i HAVE USED MY INFLUENCE TO \nARRANGE A pALACE FOR YOU.:a COMMANDER OF YOUR STATUS MAY \nREQUIRE RELAXATION OCCASIONALLY \nBUT i EXPECT AN EVEN GREATER \nEFFICIENCY ON YOUR PART WILL \nCOME FROM OUR GENEROSITY.:bOTH aTREIDES AND oRDOS FORCES \nEXIST IN THIS REGION,\nAND ALL MUST BE ELIMINATED!",
 "wE HAVE BEEN DECEIVED!:oUR BARGAINING IN GOOD FAITH \nHAS ONLY BROUGHT A TREACHEROUS \nHARVEST. aLL HAVE CONSPIRED \nAGAINST US, AND ALL MUST DIE!:yOUR MILITARY SKILLS ARE THE \nLAST REMAINING HOPE FOR THIS \nPLANET.:dESTROY ALL REMAINING aTREIDES \nAND oRDOS FORCES, AND CONQUER \nTHE eMPEROR'S pALACE.\nhE HAS TREATED US POORLY, AND \nMUST NOT LIVE ANOTHER DAY!",
 "gOOD mORNING, YOUR LORDSHIP, \nAND CONGRATULATIONS!\n\nyOU HAVE SERVED ME, i MEAN \nhOUSE hARKONNEN, WELL.:oUR hOUSE WILL NOT SOON FORGET \nOUR MOST NOBLE WARRIOR!:i GO NOW TO RELAY THE NEWS OF \nYOUR MOST GLORIOUS VICTORY, AND \nDELIVER YOUR TERMS TO THE \neMPEROR.",
 "yOU ARE BENEATH MY COMTEMPT.:dO YOU KNOW WHAT HAPPENS TO \nTHOSE WHO HAVE FAILED \nhOUSE hARKONNEN?",
}
}

patreon_thanks="   ♥ sUPPORTER tHANKS: ★ tHATtOMhALL ★ vITORIO mILIANO ★ aNDREW dICKER ★ kURT kLEMM ★ BBSAMURAI ★ dALJIT cHANDI ★ rOY fIELDING ★ gRAHAM wENZ ★ fRANZ tORMER ★ cHRISTOPHER cASTILLO ★ oLIVER hUNT ★ cODY dILL ★ wILMAN ★ mICHAEL sULLIVAN ★ mANDO ★ UENA ★ sTRIPESBYnw ★ mORGAN bROWN ★"

-- vars
mode = title_mode
seq_cor = nil
t_=0
-- title vars

-- level-end vars
endstate = 0


function _init()
 cartdata("pn_undune2")

 -- Enable "locked" mouse pointer
 poke(0x5f2d, 0x5)

 log_cartdata()

 load_data()

 -- debug!!!
 --mode = houseselect_mode
 --mode = levelselect_mode
 --mode = levelintro_mode
 --mode = levelend_mode
  -- p_fact=1
  -- p_level=9

 if (mode==title_mode) init_title()
 if (mode==houseselect_mode) init_houseselect()
 if (mode==levelintro_mode)  init_levelintro() 
 if (mode==levelend_mode)  init_levelend()
 if (mode==levelselect_mode) init_levelselect() 

 menuitem(1,"!wipe save data!",reset_saved_data)
 menuitem(2,"level: ⬅️ "..p_level.." ➡️",level_warp)
end



function level_warp(b)
 if (b&1>0) p_level=max(p_level-1,1)
 if (b&2>0) p_level=min(p_level+1,9)
 if (b&32>0) init_levelintro() printh">>>" return false
 menuitem(2,"level: ⬅️ "..p_level.." ➡️",level_warp)
 return true
end

function _update60()

 if mode == title_mode then
  update_title()
  -- switch to house select
  if input_pressed() then      
    init_levelintro()
  end 
 
 elseif mode == houseselect_mode then
  update_houseselect()
  -- switch to level intro
  if input_pressed() then
   -- set player faction 
   p_fact = ui_cursor -- (1=atreides, 2=ordos, 3-harkonen)
   init_levelintro()
  end

 elseif mode == levelintro_mode then
  update_levelintro()
  

 elseif mode == levelend_mode then
  update_levelend()
  
  if input_pressed() then   
   -- switch to level select
   if p_level<=9 then 
    init_levelselect()
   else
    init_levelintro()
   end
  end

 elseif mode == levelselect_mode then
  update_levelselect()
  -- switch to level intro
  if input_pressed() then   
   init_levelintro()
  end  
 end

 t_+=1
end


function _draw()
 --## don't clear here - as routines handle own clearing
 --cls()

 -- check for gfx change
 if req_gfx_num != curr_gfx_num then
  -- reset to compressed sprite data
  reload()
  -- decompress requested gfx page to screen
  load_gfx(req_gfx_num,0,0)
  -- copy screen to sprite sheet
  memcpy(0x0000,0x6000,0x2000)  
  -- save value
  curr_gfx_num = req_gfx_num
  -- tidy up
  cls()
 end

 if mode == title_mode then
  draw_title()

 elseif mode == houseselect_mode then
  draw_houseselect()

 elseif mode == levelintro_mode then
  draw_levelintro()
 
 elseif mode == levelselect_mode then
  draw_levelselect()
 
 elseif mode == levelend_mode then
  draw_levelend()
 
 end 

end

function reset_saved_data()
 for i=0,63 do
  dset(i,nil)
 end
end

function input_pressed(test)
 local val = btnp"5" or (stat"34">0 and not ismouseclicked)
 ismouseclicked = stat"34">0
 return val 
end

function load_data()
 -- load saved data to determine current "state"
 p_fact = dget(6)
 p_level = max(1, dget(0))
 endstate = dget(40)  -- (0=none, 1=credit target, 2=enemy defeated, 3=player lost)
 
 if endstate>0 then
  if endstate==3 then
   mode = levelintro_mode
  else
   mode = levelend_mode
  end
  -- get level end data
  p_score = dget(2)  
  p_time = flr(dget(41)) -- playing time 
  p_harvested = dget(42) -- spice harvested by player
  ai_harvested = dget(43) -- harvested by ai
  p_units = dget(44) -- units destroyed by player
  ai_units = dget(45) -- units destroyed by ai
  p_buildings = dget(46) -- buildings destroyed by player
  ai_buildings = dget(47) -- buildings destroyed by ai  
  --
  if endstate < 3 then 
   -- play "win" music
   music(10)
  else
   -- play "lose" music
   music(6)
  end
 else
  -- play "title" music
  music(0)
 end

end


function load_level(num)
 -- printh("in load_level("..num..")...")
 -- printh("p_fact = "..p_fact)

 p_col1 = faction_cols[p_fact][1]
 p_col2 = faction_cols[p_fact][2]
 mdata = mission_data[p_fact][num]
 ai1_fact = mdata[8]
 ai2_fact = mdata[11]
 ai3_fact = mdata[14]
 
 dset(0, num)
 dset(1, mdata[17]) -- ai level
  
 num_bases=mdata[4]
 dset(5, num_bases)

 dset(6, p_fact) -- p_fact
 dset(7, p_col1) -- p_col1
 dset(8, p_col2) -- p_col2
 dset(9, mdata[6]) -- player base x-pos
 dset(10,mdata[7]) -- player base y-pos

 dset(11, ai1_fact) -- ai_faction
 dset(12, ai1_fact and faction_cols[ai1_fact][1] or nil)
 dset(13, ai1_fact and faction_cols[ai1_fact][2] or nil)
 dset(14, mdata[9])  -- ai1 base x-pos
 dset(15, mdata[10]) -- ai1 base y-pos 

 dset(16, ai2_fact)
 dset(17, ai2_fact and faction_cols[ai2_fact][1] or nil)
 dset(18, ai2_fact and faction_cols[ai2_fact][2] or nil)
 dset(19, mdata[12]) -- ai2 base x-pos
 dset(20, mdata[13]) -- ai2 base y-pos

 dset(21, ai3_fact)
 dset(22, ai3_fact and faction_cols[ai3_fact][1] or nil)
 dset(23, ai3_fact and faction_cols[ai3_fact][2] or nil)
 dset(24, mdata[15]) -- ai3 base x-pos
 dset(25, mdata[16]) -- ai3 base y-pos
 dset(26, mdata[18]) -- size of map

 dset(35, mdata[2]) -- starting credits
 dset(36, mdata[3]) -- target credits

 dset(41, 0) -- playing time
 dset(42, 0) -- player harvested
 dset(43, 0) -- ai ...
 dset(44, 0) -- player units destroyed
 dset(45, 0) -- ai ...
 dset(46, 0) -- player buildings destroyed
 dset(47, 0) -- ai ...

 log_cartdata()

 -- load level map data
 local mapfile = "pico-dune-map"..num..".p8"
 printh("loading data from: "..mapfile)
 -- read map_cart data to user mem
 -- then write back to game_cart
 reload(0x4300, 0x2000, 0x1000, mapfile)   -- read map data
 cstore(0x2000, 0x4300, 0x1000, game_cart) -- write map data
 reload(0x4300, 0x3100, 0x1199, mapfile)   -- read music+sfx data
 cstore(0x3100, 0x4300, 0x1199, game_cart) -- write music+sfx data
 
 -- clear all user data to avoid garbage on radar init
 memset(0x4300, 0, 0x1b00) 
 
 load(game_cart)
end


function log_cartdata()
 printh("--- cart data ---------")
 for i=0,63 do
  --dset(i,0)
  printh("["..i.."] "..tostr(dget(i)))
 end
end

-->8
-- title screen

function init_title() 
 load_gfx_page(0)
 angle,cy=0.25,-96
end

function update_title()
 _set_fps(60)
 -- auto-rotate in...
 if angle>.0 then
  angle-=.1/128
  cy+=.25
 else
  angle=0
 end
end

function draw_title()
 cls()
	if angle~=0 then 
	 spr3d(0,0,123,20,cy,angle,1)
	else
	 spr(0, 3,38, 15,3)
	end
	
	local start⧗=375
 --local start⧗=0
	if t_>start⧗ then
	 local tagline="the demaking of a dynasty"
		fadeprint(tagline,12,62, (t_-start⧗)/5,3)
		fadeprint(tagline,12,61, (t_-start⧗)/5)
  fadeprint(" bY pAUL nICHOLAS  liquidream",4,104, (t_-start⧗)/5, 5)
  fadeprint("♪cHRIS dONNELLY  gruber_music",4,112, (t_-start⧗)/5, 4)
  fadeprint("\^.⁶	\r¹⁶\0\0\0",75,104, (t_-start⧗)/5, 5)
  fadeprint("\^.⁶	\r¹⁶\0\0\0",71,112, (t_-start⧗)/5, 4)
    
  fadeprint("(oRIGINAL BY wESTWOOD sTUDIOS)"..patreon_thanks,
   4-max(t_/2-250), 120,
   (t_-start⧗)/5, 3)

	end
 
 if t_>start⧗+1 then
  local msg = "❎ / \^.⁶	>.>\"\"、 TO "..(p_fact>0 and "cONTINUE" or "sTART")
  if(t_\60%2==0) printo(msg,52-(#msg*2)/2,78,7,3)
 end

end

-->8
-- house selection screen

function init_houseselect()
 mode = houseselect_mode
 load_gfx_page(0) 
 ui_cursor=1
 t_=0
end

function update_houseselect()
 if ((btnp(0) or (t_%5==0 and stat(38)<-10)) and ui_cursor>1) ui_cursor-=1
 if ((btnp(1) or (t_%5==0 and stat(38)>10)) and ui_cursor<3) ui_cursor+=1
 t_+=1
end

function draw_houseselect()
 cls()
 pal()
 pal(10,139,1)
 pal(14,140,1)
 pal(15,130,1)

 ssprint("select your house",28,28, 9,2,7)

 spr(48, 5,47,  4,4)
 spr(52, 47,47, 4,4)
 spr(56, 89,47, 4,4)
 map(48,0, 1,45, 5,7)
 map(48,0, 43,45, 5,7)
 map(48,0, 85,45, 5,7)

 houses={"aTREIDES","  oRDOS","hARKONNEN"}
 for i=0,2 do
  local off=i*29+(i*5)
  local gap=i*8
  rectfill(off+gap,84,41+off+gap,94,15)
  rectfill(off+gap+2,86,39+off+gap,92,9)
  rect(off+gap,84,41+off+gap,94,ui_cursor==i+1 and 7 or 0)
  ?houses[i+1],4+off+gap,87,1
 end
 local fact_cols=faction_cols[ui_cursor]
 printo("press ❎ to select",30,108,fact_cols[1],1)
end


-->8
-- level intro screen



function init_levelintro() 
 mode = levelintro_mode
 current_msg=nil
 last_msg_part=false
 cls()
 load_gfx_page(max(2,p_fact+1))
 
 -- play game/level "intro" music
 music(p_fact==0 and 2 or 6)

 printh("p_level="..tostr(p_level))

 start_dialog()
end

function start_dialog()
 if (endstate!=3) then
  endstate=0
  msg=mentat_dialogs[p_fact][p_level+intro_counter] 
 else
  msg=mentat_dialogs[p_fact][11] 
 end
 co_text=cocreate(text_spool) 
end

function update_levelintro()
 _set_fps(30)

 if (co_text!=nil and costatus(co_text)!="dead") then
  coresume(co_text)
 else
  co_text=nil
 end
 
 -- load and initialise game cart
 if input_pressed() and last_msg_part then
  -- intro?
  if p_fact==0 then
   intro_counter+=1
   if intro_counter>6 then
    intro_counter=0
    init_houseselect()
   else
    start_dialog()
   end
  else
   if endstate==3 then
    endstate=0
    if p_level>1 then 
     init_levelselect()
    else
     init_levelintro()
    end
   elseif p_level<=9 then
    load_level(p_level)
   else
    -- reset game back to start
    reset_saved_data()
    run()
   end
  end
 end
end

intro_counter=0

function draw_levelintro() 
 cls()

 intro_plist={[0]=0,-1,1,2,3,-1,0}
 --dune bg
 draw_mentat(p_fact==0 and intro_plist[intro_counter] or 0)

 if (current_msg) draw_dialog() 
 printo("pRESS ❎/\^.⁶	>.>\"\"、",80,120,7,10) --4,9
end


function draw_mentat(pnum) 
 --pnum (0=dune,  1=atreides, etc.)
 pal({[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},1) 
 
 -- space bg + window
 draw_planet(pnum)
 rect(40,36,128,112,7)

 palt(0,false)
 
 if p_fact==0 then
  palt(12, true)
  spr(0, 0,40,  6,16) 
 elseif p_fact==1 then
  palt(2, true)
  spr(6, 0,40,  16,16) 
 else
  palt(12, true)
  spr(0, 0,40,  16,16)
 end

end

function draw_planet(pnum)
	dx=100
	dy=75

	srand(pnum)--6
 
	--stars
	for i=1,50 do
  pset(40+rnd(88),36+rnd(76),rnd{10,13,1})
	end

 if pnum > -1 then
	c=(
			{[0]={0,9,11,14,15,8,8,8}, --dune
	   {0,10,1,13,2,15},--7 --atreides
    {0,10,1,7,5,15,15},--ordos
	   {0,9,2,15,6,6,6} --harkonnen
	  })[pnum]
	
	 --spare cols: 2,6,8,15
	p=({
[0]={[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},
				{[0]=0,1,3,4,5,6,12,13,15,128,129,132,10,140,142,139},
				{[0]=0,1,8,4,5,6,139,13,15,128,129,132,10,140,142,7},
				{[0]=0,1,2,4,5,6,8,13,15,128,129,132,10,140,142,136}
	  })[pnum]
	
	g=({[0]=.5,.65,0.75,.5})[pnum]
	
	pal(p,1)
	  
	u=cos(.5)
	v=sin(.4)
	
	
  -- atmosphere
  circfill(dx-1,dy-1,22,10)
  circfill(dx-1,dy-1,21,13)
  circfill(dx-1,dy-1,20,10) --if not ordos
  
  -- planet
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

-- Dialog Text Flow with Coroutines by @MBoffin
-- https://www.lexaloffle.com/bbs/?tid=35381
function draw_dialog()
 ?current_msg,2,5,11
 ?current_msg,2,4,6 --8
end
function text_spool()
 local msgparts=split(msg,":")
 for j=1,#msgparts do
  msg=msgparts[j]
  for i=1,#msg,0.5 do
   current_msg=sub(msg,1,i)
   --sfx(0)
   if (input_pressed("s")) break
   yield()
  end
  yield()
  current_msg=msg  
  last_msg_part=(j==#msgparts)
  while not (input_pressed() or last_msg_part) do yield() end  
  --current_msg=nil
  _update_buttons()
 end
end

-->8
-- level end screen

function init_levelend()
 load_gfx_page(1)
 pal()
 pal(3, 137, 1)

 p_col1 = faction_cols[p_fact][1]
 p_col2 = faction_cols[p_fact][2]

 local hours = flr(p_time / 3600 )
 p_time = p_time - hours * 3600
 local minutes = flr(p_time / 60)
 p_time=hours.."H "..minutes.."M"

 -- calc score
 p_score += p_units-ai_units + p_buildings-ai_buildings + p_harvested\100
 p_rank = calc_rank()
 -- save score
 dset(2, p_score)
 -- move to next level
 p_level += 1
 printh("p_level now set to = "..p_level)
 dset(0, p_level)
 dset(40, 0) -- clear endstate
 
 local max_harvested=max(p_harvested,ai_harvested)
 local max_units=max(p_units,ai_units)
 local max_buildings=max(p_buildings,ai_buildings)
 stats={
 	{ 0, p_harvested, 62, p_col1, 60, max_harvested },
 	{ 0, ai_harvested, 68, 6, 60, max_harvested },
  { 0, p_units, 85, p_col1, 40, max_units },
  { 0, ai_units, 91, 6, 40, max_units },
  { 0, p_buildings, 107, p_col1, 20, max_buildings},
  { 0, ai_buildings, 113, 6, 20, max_buildings }
  }
 curr_stat=1
 stat_delay=100
end


function calc_rank()
 ranks=split"25,sAND sNAKE,50,dESERT mONGOOSE,100,sAND wARRIOR,150,dUNE tROOPER,200,sQUAD lEADER,400,oUTPOST cOMMANDER,500,bASE cOMMANDER,700,wARLORD,1000,cHIEF wARLORD,1400,rULER OF aRRAKIS,18000,eMPEROR"
 rank="sAND fLEA"
 for i=1,#ranks,2 do
  if p_score>=ranks[i] then
   rank=ranks[i+1]
  end
 end 
 return rank
end

function update_levelend()
 -- in stats mode
 if stat_delay > 0 then
  -- pausing
  stat_delay-=1
  return
 end
 if curr_stat <= #stats then
  -- scale the stats?
  stats[curr_stat][1] += (stats[curr_stat][6]/stats[curr_stat][5])/3
  
  if stats[curr_stat][1] >= stats[curr_stat][2] then
  	stats[curr_stat][1] = stats[curr_stat][2]
   curr_stat+=1
   stat_delay=50
  end
 end 
end

function draw_levelend()
 cls()
 --
 -- init custom screen palette
 --
 palt(0,false)
 pal(14, 137, 1)
 pal(6, 14, 1)

 map()
 map(17,1,8,2,14,6)
 
 local spr_fact=3+(3*p_fact)
 spr(spr_fact,1,22,3,3)
 spr(spr_fact,103,22,3,3)

 sprint("sCORE:"..p_score,16,7,7)
 sprint("tIME:"..p_time,70,7)

 sprint("yOU'VE ATTAINED\n  THE RANK OF",36,24)
 sprint(p_rank,65-#p_rank*2,37,8)
  
	rect(8,56,120,75,4)
	line(26,56,100,56,9)
 sprint("SPICE HARVESTED BY",28,53)
 sprint("  YOU:\nENEMY:",11,61)

 -- handle big numbers
 temp={0,0}
 for i=1,2 do
  temp[i]=stats[i][1]>>16
  for j=1,3 do
   temp[i]+=stats[i][1]>>16
  end
 end  
 sprint(tostr(temp[1],0x2).."\n"..tostr(temp[2],0x2),100,61)
  
 rect(8,79,120,98,4)
 line(26,79,100,79,9)
 sprint("UNITS DESTROYED BY",28,76)
 sprint("  YOU:\nENEMY:",11,84)
 sprint(flr(stats[3][1]).."\n"..flr(stats[4][1]),100,84)
 
 rect(8,102,120,120,4)
 line(18,102,108,102,9)
 sprint("BUILDINGS DESTROYED BY",20,99)
 sprint("  YOU:\nENEMY:",11,106)
 sprint(flr(stats[5][1]).."\n"..flr(stats[6][1]),100,106)
 
 -- draw bars 
 for i=1,#stats do
  draw_bar(
  	35,
  	stats[i][3],
   stats[i][5],
  	stats[i][1],
   stats[i][6],
  	stats[i][4])  
 end
 
 if(curr_stat>6) printo("pRESS ❎ / \^.⁶	>.>\"\"、",40,120,7,0)
end

-->8
-- level select screen

function init_levelselect()
 mode = levelselect_mode 
 load_gfx_page(1) 
 -- play "select" music
 music(12)
 -- init map region data
 rdata=split2d(spr_data,",","\n")
 
 -- define colour "filters"
 map_cols={
  [-1]={6,5,13},-- orig map
  [0]={0,0,0},  -- borderline
  {12,1,0},     -- attreides
  {11,10,1},    -- ordos
  {8,2,1,5,5},  -- harkonnen
  {5,2,0}       -- emperor
 } 

 col_origmap=-1
 col_borderline=0
 col_attreides=1
 col_ordos=2
 col_harkonnen=3
 col_emperor=4
 messagetext1=""
 messagetext2=""
 msg_ypos=0
 t_=0

 -- init map anim sequence
 seq_cor=cocreate(play_map_sequence)
end

function update_levelselect()
 _set_fps(60)
 -- in map mode

 -- update coroutine
 if seq_cor and costatus(seq_cor)~="dead" then
  assert(coresume(seq_cor, p_level)) 
 end
end

function draw_levelselect()

end


 -- play scripted animated sequence
 -- (typically, one for each level) 
function play_map_sequence(seqnum)
 printh("seqnum = "..seqnum)

 --::demo::
 
 -- dummy pause in to allow gfx unpack to happen before map() call below
 -- (not necessary in final game - only when *starting* on level select)
 yield()
 
 local nextreg_num
 local nextreg_currcol -- ref to next region's orig col b4 start flashing player fact

 -- "paint" blank map
 cls() 
 pal()
 pal(1,6)
 pal(2,5)
 pal(3,13)
 map(32,0,0,0)
 spr(48,4,20,15,8)

 local spr_fact=3+(3*p_fact)
 spr(spr_fact,0,96,3,3)
 spr(spr_fact,104,96,3,3)

 pal()

 --
 -- init custom screen palette
 --
 palt(0,false)   -- show blacks
 pal(14, 137, 1)  -- bright pink > dark orange
 pal(12, 140, 1) -- light blue > royal blue
 pal(11, 139, 1) -- light green > grass green
 pal(10, 3, 1)   -- yellow > rough green
 pal(6, 143, 1)  -- skin > peach
 pal(13, 134, 1) -- greyblue > beige
 pal(5, 14, 1)  -- grey > normal pink
  
 printo("your next conquest",28,7,8,0) 
 ssprint("your next conquest",28,7, 8,0,5) 
 
 if seqnum > 2 then
  setmap(0, map_cols[col_borderline])
 end

 if p_fact == 1 then
  -- atreides
  if seqnum == 1 then
   -- intro anim?
  elseif seqnum == 2 then
   -- first map sequence
   cleartext()  
   wait(20)    
   show_message("tHREE hOUSES HAVE\nCOME TO dUNE.") 
   show_message("tHE LAND HAS\nBECOME DIVIDED.")   
   fizzlemap(0,  map_cols[col_borderline])
   cleartext()
   show_message("aTREIDES CLAIMED\nSTRATEGIC REGIONS")
   fizzlemap({13,7,20,14,21,22}, map_cols[col_attreides])
   cleartext()
   show_message("oRDOS MOVED IN\nFROM THE EAST.")
   fizzlemap({19,27,26,25,24,23}, map_cols[col_ordos])
   cleartext()
   show_message("hARKONNEN INVADED\nFROM THE NORTH.")
   fizzlemap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   nextreg_num = 23
   nextreg_currcol = map_cols[col_ordos]

  elseif seqnum == 3 then
   setmap({13,7,20,14,21,22}, map_cols[col_attreides])
   setmap({19,27,26,25,24,23}, map_cols[col_ordos])
   setmap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   show_message("aTREIDES CAPTURED\nMORE TERRITORY...")
   fizzlemap({8,15},  map_cols[col_attreides])
   show_message("...AND DROVE THE\noRDOS OUT.")   
   fizzlemap({23}, map_cols[col_attreides])
   show_message("oRDOS HEADED\nFOR hARKONNEN.")   
   fizzlemap({12,18,16,17}, map_cols[col_ordos])
   show_message("hARKONNEN EXPANDED\nTHEIR BORDERS.")
   fizzlemap({1,2,11}, map_cols[col_harkonnen])
   nextreg_num = 2
   nextreg_currcol = map_cols[col_harkonnen]
  
  elseif seqnum == 4 then
   setmap({13,7,20,14,21,22,8,15,23}, map_cols[col_attreides])
   setmap({19,27,26,25,24,12,18,16,17}, map_cols[col_ordos])
   setmap({6,5,4,10,3,9,1,2,11}, map_cols[col_harkonnen])
   show_message("hARKONEN BORDERS\nWERE WEAK...")
   fizzlemap({1,2,3}, map_cols[col_attreides])
   fizzlemap({11}, map_cols[col_ordos])
   show_message("...EXCEPT FOR\nONE OUTPOST.")
   fizzlemap({16}, map_cols[col_harkonnen])
   nextreg_num = 9
   nextreg_currcol = map_cols[col_harkonnen]
 
  elseif seqnum == 5 then
   setmap({13,7,20,14,21,22,8,15,23,1,2,3}, map_cols[col_attreides])
   setmap({19,27,26,25,24,12,18,17,11}, map_cols[col_ordos])
   setmap({6,5,4,10,9,16}, map_cols[col_harkonnen])
   show_message("hARKONEN CONTINUED\nTO RETREAT.")
   fizzlemap({4,9,16}, map_cols[col_attreides])
   show_message("...INTO TERRITORY\nOF THE oRDOS.")
   fizzlemap({11}, map_cols[col_harkonnen])
			nextreg_num = 25
   nextreg_currcol = map_cols[col_ordos]

  elseif seqnum == 6 then
   setmap({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16}, map_cols[col_attreides])
   setmap({19,27,26,25,24,12,18,17}, map_cols[col_ordos])
   setmap({6,5,10,11}, map_cols[col_harkonnen])
   show_message("aLL FORCES WERE\nAIMED AT oRDOS.")
   fizzlemap({17,25,24}, map_cols[col_attreides])
   fizzlemap({18}, map_cols[col_harkonnen])
			nextreg_num = 11
   nextreg_currcol = map_cols[col_harkonnen]

  elseif seqnum == 7 then
   setmap({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24}, map_cols[col_attreides])
   setmap({19,27,26,12}, map_cols[col_ordos])
   setmap({6,5,10,11,18}, map_cols[col_harkonnen])
   show_message("aTREIDES PUSHED\nhARKONNEN BACK.")
   fizzlemap({10,11,18}, map_cols[col_attreides])
			nextreg_num = 26   
   nextreg_currcol = map_cols[col_ordos]

 elseif seqnum == 8 then
   setmap({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24,10,11,18}, map_cols[col_attreides])
   setmap({19,27,26,12}, map_cols[col_ordos])
   setmap({6,5}, map_cols[col_harkonnen])
   show_message("oRDOS WERE NEARLY\nWIPED OUT.")
   fizzlemap({26,27,19}, map_cols[col_attreides])
			nextreg_num = 5   
   nextreg_currcol = map_cols[col_harkonnen]

  elseif seqnum == 9 then
   setmap({13,7,20,14,21,22,8,15,23,1,2,3,4,9,16,17,25,24,10,11,18,26,27,19}, map_cols[col_attreides])
   setmap({12}, map_cols[col_ordos])
   setmap({6,5}, map_cols[col_harkonnen])
   show_message("oNLY THE eMPEROR'S\nFORCES REMAIN.")
   fizzlemap({5,12}, map_cols[col_attreides])
   fizzlemap({6}, map_cols[col_emperor])
			nextreg_num = 6
   nextreg_currcol = map_cols[col_emperor]

  end

 elseif p_fact == 2 then
  -- ordos
  if seqnum == 1 then
   -- intro anim?
  elseif seqnum == 2 then
   -- first map sequence
   cleartext()  
   wait(20)    
   show_message("tHREE hOUSES HAVE\nCOME TO dUNE.") 
   show_message("tHE LAND HAS\nBECOME DIVIDED.")   
   fizzlemap(0,  map_cols[col_borderline])
   cleartext()
   show_message("oRDOS TOOK THE\nBEST LAND")
   fizzlemap({19,27,26,25,24,23}, map_cols[col_ordos])
   cleartext()
   show_message("hARKONNEN ARE\nA THREAT.")
   fizzlemap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   cleartext()
   show_message("hOUSE aTREIDES\nIS NEARBY.")
   fizzlemap({13,7,20,14,21,22}, map_cols[col_attreides])
   nextreg_num = 16
   nextreg_currcol = map_cols[col_origmap]

  elseif seqnum == 3 then
   setmap({19,27,26,25,24,23}, map_cols[col_ordos])
   setmap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   setmap({13,7,20,14,21,22}, map_cols[col_attreides])
   show_message("oRDOS ADVANCED\nWITHOUT CHALLENGE.")
   fizzlemap({15,16,17},  map_cols[col_ordos])
   show_message("tHE hARKONNEN\nDREW CLOSER.")
   fizzlemap({11,12,18}, map_cols[col_harkonnen])
   show_message("tHE aTREIDES\nSPREAD TOO THIN.")   
   fizzlemap({1,2,8}, map_cols[col_attreides])
   nextreg_num = 14
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 4 then
   setmap({19,27,26,25,24,23,15,16,17}, map_cols[col_ordos])
   setmap({6,5,4,10,3,9,11,12,18}, map_cols[col_harkonnen])
   setmap({13,7,20,14,21,22,1,2,8}, map_cols[col_attreides])
   show_message("aLL ATTACKS WERE\nAIMED AT aTREIDES.")
   fizzlemap({8,14,22}, map_cols[col_ordos])
   fizzlemap({2}, map_cols[col_harkonnen])   
   nextreg_num = 13
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 5 then
   setmap({19,27,26,25,24,23,15,16,17,8,14,22}, map_cols[col_ordos])
   setmap({6,5,4,10,3,9,11,12,18,2}, map_cols[col_harkonnen])
   setmap({13,7,20,21,1}, map_cols[col_attreides])
   show_message("oRDOS OVERPOWERED\nTHE aTREIDES...")
   fizzlemap({21,20,13}, map_cols[col_ordos])
   show_message("...WHILE THEY WERE\nFIGHTING hARKONNEN")
   fizzlemap({2,3}, map_cols[col_attreides])   
   nextreg_num = 18
   nextreg_currcol = map_cols[col_harkonnen]

  elseif seqnum == 6 then
   setmap({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13}, map_cols[col_ordos])
   setmap({6,5,4,10,9,11,12,18}, map_cols[col_harkonnen])
   setmap({7,1,2,3}, map_cols[col_attreides])
   show_message("hARKONNEN HAD TO\nBE TURNED BACK.")
   fizzlemap({18,11,12}, map_cols[col_ordos])
   nextreg_num = 2
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 7 then
   setmap({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12}, map_cols[col_ordos])
   setmap({6,5,4,10,9}, map_cols[col_harkonnen])
   setmap({7,1,2,3}, map_cols[col_attreides])
   show_message("oRDOS KILLED OFF\nMOST OF aTREIDES")
   fizzlemap({7,1,2}, map_cols[col_ordos])
   nextreg_num = 6
   nextreg_currcol = map_cols[col_harkonnen]

  elseif seqnum == 8 then
   setmap({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12,7,1,2}, map_cols[col_ordos])
   setmap({6,5,4,10,9}, map_cols[col_harkonnen])
   setmap({3}, map_cols[col_attreides])
   show_message("oRDOS GAINED MORE\nhARKONNEN LAND.")
   fizzlemap({6,5,10}, map_cols[col_ordos])
   nextreg_num = 3
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 9 then
   setmap({19,27,26,25,24,23,15,16,17,8,14,22,21,20,13,18,11,12,7,1,2,6,5,10}, map_cols[col_ordos])
   setmap({4,9}, map_cols[col_harkonnen])
   setmap({3}, map_cols[col_attreides])
   show_message("sOON oRDOS WILL\nRULE ALL OF dUNE.")
   fizzlemap({3,9}, map_cols[col_ordos])
   fizzlemap({4}, map_cols[col_emperor])
   nextreg_num = 4
   nextreg_currcol = map_cols[col_emperor]

  end

 elseif p_fact == 3 then 
  -- harkonnen
  if seqnum == 1 then
   -- intro anim?
  elseif seqnum == 2 then
   -- first map sequence
   cleartext()  
   wait(20)    
   show_message("tHREE hOUSES HAVE\nCOME TO dUNE.") 
   show_message("tHE LAND HAS\nBECOME DIVIDED.")   
   fizzlemap(0,  map_cols[col_borderline])
   cleartext()
   show_message("hARKONNEN ARRIVED\nFIRST.")
   fizzlemap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   cleartext()
   show_message("tHE WEAK aTREIDES\nWILL BE EASY.")
   fizzlemap({13,7,20,14,21,22}, map_cols[col_attreides])
   cleartext()
   show_message("tHE oRDOS ARE\nGETTING CLOSER.")
   fizzlemap({19,27,26,25,24,23}, map_cols[col_ordos])
   nextreg_num = 2
   nextreg_currcol = map_cols[col_origmap]

  elseif seqnum == 3 then
   setmap({6,5,4,10,3,9}, map_cols[col_harkonnen])
   setmap({13,7,20,14,21,22}, map_cols[col_attreides])
   setmap({19,27,26,25,24,23}, map_cols[col_ordos])
   show_message("hARKONNEN SPREAD\nOUT STRONG FORCES.")
   fizzlemap({2,1,8},  map_cols[col_harkonnen])
   show_message("aTREIDES WENT\nAFTER oRDOS.")
   fizzlemap({15,16,23}, map_cols[col_attreides])
   show_message("oRDOS STOLE EVEN\nMORE LAND.")
   fizzlemap({17,11,18,12}, map_cols[col_ordos])
   nextreg_num = 11
   nextreg_currcol = map_cols[col_ordos]
  
  elseif seqnum == 4 then
    setmap({6,5,4,10,3,9,2,1,8}, map_cols[col_harkonnen])
    setmap({13,7,20,14,21,22,15,16,23}, map_cols[col_attreides])
    setmap({19,27,26,25,24,17,11,18,12}, map_cols[col_ordos])
    show_message("oRDOS DID NOT\nSTAND A CHANCE.")
    fizzlemap({17,11,12}, map_cols[col_harkonnen])
    show_message("aTREIDES AND oRDOS\nTRADED LAND.")
    fizzlemap({24}, map_cols[col_attreides])
    fizzlemap({16}, map_cols[col_ordos])
    nextreg_num = 18
    nextreg_currcol = map_cols[col_ordos]

  elseif seqnum == 5 then
   setmap({6,5,4,10,3,9,2,1,8,17,11,12}, map_cols[col_harkonnen])
   setmap({13,7,20,14,21,22,15,23,24}, map_cols[col_attreides])
   setmap({19,27,26,25,18,16}, map_cols[col_ordos])
   fizzlemap(25,  map_cols[col_harkonnen])
   show_message("aN oRDOS OUTPOST\nWAS SURROUNDED.")
   fizzlemap({18,19},  map_cols[col_harkonnen])
   show_message("tHE oRDOS BROKE\nTHROUGH aTREIDES.")
   fizzlemap(24, map_cols[col_ordos])
   nextreg_num = 7
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 6 then
   setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19}, map_cols[col_harkonnen])
   setmap({13,7,20,14,21,22,15,23}, map_cols[col_attreides])
   setmap({27,26,16,24}, map_cols[col_ordos])
   show_message("sOON tHE aTREIDES\nWILL BE EXTINCT.")
   fizzlemap({7,14,13}, map_cols[col_harkonnen])
   fizzlemap({23}, map_cols[col_ordos])
   nextreg_num = 26
   nextreg_currcol = map_cols[col_ordos]

  elseif seqnum == 7 then
   setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13}, map_cols[col_harkonnen])
   setmap({20,21,22,15}, map_cols[col_attreides])
   setmap({27,26,16,24,23}, map_cols[col_ordos])
   show_message("hARKONNEN CRUSHED\nMOST OF THE oRDOS.")
   fizzlemap({24,26,27},  map_cols[col_harkonnen])
   show_message("aTREIDES RECLAIMED\nITS LAND.")
   fizzlemap(23, map_cols[col_attreides])
   nextreg_num = 21
   nextreg_currcol = map_cols[col_attreides]

  elseif seqnum == 8 then
   setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27}, map_cols[col_harkonnen])
   setmap({20,21,22,15,23}, map_cols[col_attreides])
   setmap({16}, map_cols[col_ordos])
   show_message("hARKONNEN CRUSHED\nTHE aTREIDES.")
   fizzlemap({20,21,22},  map_cols[col_harkonnen])
   nextreg_num = 16
   nextreg_currcol = map_cols[col_ordos]

  elseif seqnum == 9 then
   setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27,20,21,22}, map_cols[col_harkonnen])
   setmap({15,23}, map_cols[col_attreides])
   setmap({16}, map_cols[col_ordos])
   show_message("oNLY THE hARKONNEN\nWILL PREVAIL.")
   fizzlemap({16,23},  map_cols[col_harkonnen])
   fizzlemap({15},  map_cols[col_emperor])
   nextreg_num = 15
   nextreg_currcol = map_cols[col_emperor]

  end

 end -- factions

 -- flash next region until player "starts"
 show_message(" ❎/\^.⁶	>.>\"\"、 tO sTART")
 while true do
  setmap(nextreg_num, map_cols[p_fact])
  wait(20)
  setmap(nextreg_num, nextreg_currcol)   
  wait(20)
 end

end

function show_message(msg)
 messagetext2=messagetext1
 messagetext1=msg
 msg_ypos=80
 clip(27,99,75,18)
 for i=1,85 do
  cleartext()
  ?messagetext1,29,msg_ypos,0
  ?messagetext2,29,msg_ypos+22,0
  yield()
  -- move message
  if (i<46) msg_ypos+=.5
 end
 clip()
end

function cleartext()
 rectfill(27,99,101,116,9)
end

function split2d(str,d,dd) 
 d=d or ","
 if (dd) str=split(str,dd) 
 if type(str)=="table" then
  local t={}
  while #str>0 do
   local s=str[1]   
   add(t,split(s,d))
   del(str,s)
  end
  return t
 else
  return split(str,d)
 end 
end

-- filtered-fizzlesspr
function fizzlemap(rnum, cols)
 sx=0
 sy=20
 sw=119
 sh=64
 dx=4 
 dy=20
 offx=0
 offy=4 -- if map sprite not 1:1 with screen draw pos
 speed=3
 num=0
 taps=0x3006
 lfsr=0x3fff

 -- handle table param
 if type(rnum)=="table" then
  rtable=rnum
 else
  rtable={rnum}
 end

 for rnum in all(rtable) do
  for _x=0,127 do
   for _y=0,127 do
    num+=1
    if (num==0x4000) then
     num=0
     x,y = 0,0
    end
    x,y = band(lfsr,0x7f),flr(lshr(lfsr,7))
    lfsr = bxor(flr(lshr(lfsr,1)),band(-band(lfsr,1),taps))
    -- within draw region?   
    if x>=sx and x<=sx+sw
     and y>=sy and y<=sy+sh 
    then
     if not rnum or rdata[y-sy+1][x-sx+1]==rnum
     then
      local origcol=sget(x+offx,y+offy)
      pset(dx-sx+x,dy-sy+y, cols[origcol])
     end
    end
   end
   if(_x%speed==0)yield()
  end
 end
end

-- immediately set a region's colour
function setmap(rnum, cols)
 sx=0
 sy=20
 sw=119
 sh=64
 dx=4
 dy=20
 offx=0
 offy=4 -- if map sprite not 1:1 with screen draw pos
 rtable=nil
 
 -- handle table param
 if type(rnum)=="table" then
  rtable={}
  for k in all(rnum) do
   rtable[k]=k
  end
 end

 for x=0,127 do
  for y=0,127 do
   if x>=sx and x<=sx+sw
    and y>=sy and y<=sy+sh 
   then
    if not rnum 
     or (rtable and rtable[rdata[y-sy+1][x-sx+1]])
     or rdata[y-sy+1][x-sx+1]==rnum
    then     
     local origcol=sget(x+offx,y+offy)
     pset(dx-sx+x,dy-sy+y, cols[origcol])
    end    
   end
  end
 end
end


-->8
-- 3d funcs (by freds72)

function v2_dot(a,b)
 return a[1]*b[1]+a[2]*b[2]
end

function v2_make(a,b)
 return {b[1]-a[1],b[2]-a[2]}
end

function v2_normz(a)
 local x,z=a[1],a[2]
 local d=sqrt(x*x+z*z)
 return {
  x/d,z/d
 },d
end

function v2_add(a,b,scale)
 scale=scale or 1
 return {
  a[1]+scale*b[1],
  a[2]+scale*b[2]}  
end

function spr3d(sx,sy,sw,sh,y,angle,scale)
	-- camera pos
	local c={0,sw}	
	-- wall pos is assumed to be zero
	-- wall u/v vectors
	local v={sin(angle),-cos(angle)}
	local u={-v[2],v[1]}
	for i=0,127 do
		-- camera to screen normal vector
		-- note: could be precomputed
		local n,d=v2_normz(v2_make(c,{i-63.5,0}))
  	-- intersect wall
		local t0=(-v2_dot(c,v))/v2_dot(n,v)		
		if t0>0 then 
		 -- find projection on wall
		 local x=v2_add(c,n,t0)
		 -- project wx on wall
		 local t1=v2_dot(x,u)/(scale*sw)+0.5
		 if t1>=0 and t1<1 then
	  	local w=scale*d/t0
	  	local y0=63.5-(sh/2-y)*w
	  	-- %1: adjust flooring impact on actual span height
	   sspr(sx+sw*t1,sy,1,sh,i,y0,1,sh*w+y0%1)
	  end
	 end
	end
end

-->8
-- helper funcs

-- use red gradient
-- make with #PALETTE_MAKER
-- https://www.lexaloffle.com/bbs/?pid=68190
_pal={0,128,130,2,136,8}
pal(_pal,1)

function fadeprint(text, x, y, fadeamount, maxfade)
 local fcol = mid(0,flr(fadeamount),maxfade or #_pal)
 print(text, x, y, fcol)
end

--print string with outline.
function printo(str,startx,
															 starty,col,
															 col_bg)
 for xx = -1, 1 do
		for yy = -1, 1 do
			print(str, startx+xx, starty+yy, col_bg)
		end
 end
 print(str,startx,starty,col)
end

--shadow print
function sprint(str,x,y,col,scol)
 print(str, x, y+1, scol or 2)
 print(str, x, y,    col or 7)
end

--shiny shadow print
function ssprint(str,x,y,col,scol,hcol)
 sprint(str,x,y,col,scol)
 clip(x,y+1,#str*4,3)
 print(str,x,y,hcol)
 clip()
end

function draw_bar(x,y,max_w,val,max_val,col)
 if (val <=0) return 
 local w=mid(0,val/max_val*max_w,max_w) 
 rectfill(x+1,y+1,x+w+1,y+4,2)
 rectfill(x,y,x+w,y+3,col)
end


function wait(num)
 for i=1,num do
 yield()
 end 
end

-->8
spr_data=[[
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


-->8
-- cart data related

req_gfx_num = -1
curr_gfx_num = -1

function load_gfx_page(gfx_num) 
 req_gfx_num = gfx_num
end

function load_gfx(index,x,y)
 local offset=0x0000 -- screen memory
 for i=0,index-1 do
  offset += peek(offset+0) + peek(offset+1)*256 + 2
 end
 px9_decomp(x,y,offset+2,pget,pset)
end

-->8
-- px9 decompress
-- https://www.lexaloffle.com/bbs/?tid=34058

   function px9_decomp(x0,y0,src,vget,vset)

    local function vlist_val(l, val)        
        local v,i=l[1],1
        while v!=val do
            i+=1
            v,l[i]=l[i],v
        end
        l[1]=val
    end

    local cache,cache_bits=0,0
    function getval(bits)
        if cache_bits<16 then
            cache+=%src>>>16-cache_bits
            cache_bits+=16
            src+=2
        end
        local val=cache<<32-bits>>>16-bits
        cache=cache>>>bits
        cache_bits-=bits
        return val
    end

    -- get number plus n
    function gnp(n)
        local bits=0
        repeat
            bits+=1
            local vv=getval(bits)
            n+=vv
        until vv<(1<<bits)-1
        return n
    end

    -- header

    local 
        w,h_1,
        eb,el,pr,
        x,y,
        splen,
        predict
        =
        gnp"1",gnp"0",
        gnp"1",{},{},
        0,0,
        0

    for i=1,gnp"1" do
        add(el,getval(eb))
    end
    for y=y0,y0+h_1 do
        for x=x0,x0+w-1 do
            splen-=1

            if(splen<1) then
                splen,predict=gnp"1",not predict
            end

            local a=y>y0 and vget(x,y-1) or 0

            local l=pr[a]
            if not l then
                l={}
                for e in all(el) do
                    add(l,e)
                end
                pr[a]=l
            end

            local v=l[predict and 1 or gnp"2"]

            vlist_val(l, v)
            vlist_val(el, v)

            vset(x,y,v)
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
00000000008888800000888000000000000888888888800000888880000088800888i00000088808888888888880000000888888800888888800000000000000
000000000008880000000800000000000000888000o88800000888000000080000888i0000008000o888o000088o0000000o888o0000o888o000000000000000
0000000000088800000008000000000000008880000088800008880000000800008888i000008000088800000088000000008880000008880000000000000000
00000000000888000000080000000000000088800000o88800088800000008000088888i00008000088800000008000000008880000008880000000000000000
00000000000888000000080088800oo00000888000000888000888000000080000888888i0008000088800008008000000008880000008880000000000000000
000000000008880000000800088088880000888000000888o008880000000800008o88888i008000088800008000000000008880000008880000000000000000
00000000000888000000080008880088o00088800000088880088800000008000080o88888i08000088800088000002o20008880000008880000000000000000
000000000008880000000800088o00o88000888000000888800888000000080000800o88888i800008888888800000o8o0008880000008880000000000000000
0000000000088800000008000880000880008880000008888008880000000800008000o888888000088800o88000002o20008880000008880000000000000000
000000000008880000000800088000088000888000000888o0088800000008000080000o888880000888000o8000000000008880000008880000000000000000
000000000008880000000800088000088000888000000888000888000000080000800000o8888000088800008008000000008880000008880000000000000000
00000000000o88000000080008800008800088800000o88o000o880000000800008000000o888000088800000008000000008880000008880000000000000000
000000000000882000008o000880000880008880000088800000882000008o000080000000o88000088800000088000000008880000008880000000000000000
000000000000o88o000o8000i88i00i88i00888000o88o000000o88o000o80000o8o0000000o8000o888o000088o0000000o888o0000o888o000000000000000
00000000000000o88888000088880088880888888888o000000000o8888800008888800000008008888888888880000000888888800888888800000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888000000
00022222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000088808080888000008800888088808880808088808800088000000880888000008880000088008080880088800880888080800000000000000000
000000000000i8i080808ii000008i808ii088808i808080i8i08i808ii000008i808ii000008i8000008i8080808i808i808ii0i8i080800000000000000000
0000000000000800888088000000808088008i80888088i008008080800000008080880000008880000080808880808088808880080088800000000000000000
00000000000008008i808i00000080808i0080808i808i80080080808080000080808i0000008i8000008080ii8080808i80ii800800ii800000000000000000
000000000000080080808880000088808880808080808080888080808880000088i08000000080800000888088808080808088i0080088800000000000000000
0000000000000i00i0i0iii00000iii0iii0i0i0i0i0i0i0iii0i0i0iii00000ii00i0000000i0i00000iii0iii0i0i0i0i0ii000i00iii00000000000000000
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
00000000ooo000000000ooo00000000000000000oo0000000000000000000000000000000000oo00o000ooo00o00o0o0ooo0oo00ooo0ooo0ooo0ooo000000000
00000000o0o0o0o00000o0o00oo0o0o0o0000000o0o0ooo00oo0o0o00oo0o0000oo00oo0000o00o0o0000o00o0o0o0o00o00o0o0o0o0o000o0o0ooo000000000
00000000oo00ooo00000ooo0o0o0o0o0o0000000o0o00o00o000o0o0o0o0o000o0o0o000000o0oo0o0000o00o0o0o0o00o00o0o0oo00oo00ooo0o0o000000000
00000000o0o000o00000o000ooo0o0o0o0000000o0o00o00o000ooo0o0o0o000ooo000o0000o0000o0000o00oo00o0o00o00o0o0o0o0o000o0o0o0o000000000
00000000ooo0oo000000o000o0o00oo00oo00000o0o0ooo00oo0o0o0oo000oo0o0o0oo000000oo00ooo0ooo00oo00oo0ooo0ooo0o0o0ooo0o0o0o0o000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000002220002200000000000000000000022000000000000000000000000000000000022000220222020202220222022200000222020200220222002200000
00000002000020002020220022200220000020200220220022002220200020002020000200202000202020202020200020200000222020202000020020000000
00000002000020002020202002002000000020202020202020202200200020002220000202202000220020202200220022000000202020202220020020000000
00000222000020002220220002000020000020202020202020202000200020000020000200002020202020202020200020200000202020200020020020000000
00000222000002202020202022202200000022202200202020200220022002202200000022002220202002202220222020202220202002202200222002200000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000i000ii000000000000000000000000000000000000000000000i0i0000000000000000000000000000000000ii00000000000000000000000000i000000
0000i000i0i0ii00iii00ii0iii0ii000ii0i0000000ii00i0i00000i0i0iii00ii0iii0i0i00ii00ii0ii000000i000iii0i0i0ii00iii00ii00ii000i00000
0000i000i0i0i0i00i00i0000i00i0i0i0i0i0000000ii00iii00000i0i0ii00i0000i00i0i0i0i0i0i0i0i00000iii00i00i0i0i0i00i00i0i0i00000i00000
0000i000i0i0ii000i00i0i00i00i0i0iii0i0000000i0i000i00000iii0i00000i00i00iii0i0i0i0i0i0i0000000i00i00i0i0i0i00i00i0i000i000i00000
00000i00ii00i0i0iii0iii0iii0i0i0i0i00ii00000iii0ii000000iii00ii0ii000i00iii0ii00ii00ii000000ii000i000ii0ii00iii0ii00ii000i000000
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
01 0e0f1011
00 12141315
00 16171819
02 1a1b1c1d
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

