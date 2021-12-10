pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================
-- constants
--debug=true

--game_cart = "pico-dune_fmt.p8"
game_cart = "pico-dune.p8"

-- music
-- 00 = title
-- 06 = intro/advisor/level lose?
-- 10 = level win
-- 12 = map screen


faction_cols = {
 { 12, 1}, -- 1 = Atreides
 { 11, 3}, -- 2 = Ordos
 { 8,  2}, -- 3 = Harkonnen
 { 14, 2}, -- 4 = Emperor?
}

-- cart modes
title_mode=1
houseselect_mode=2
levelintro_mode=3
levelend_mode=4
levelselect_mode=5

-- No.|Starting Credits|Objective Credits|# Bases|P Faction|P XPos|P YPos|AI Fact 1|AI XPos 1|AI YPos 1|AI Fact 2|AI XPos 2|AI YPos 2|AI Fact 3|AI XPos 3|AI YPos 3|AI Level
mission_data={
{ -- atredies missions
 {1,999,1000,4,1,88,72,2,24,64,2,160,64,2,160,152,20},
 {2,1200,2700,2,1,144,200,2,120,96,nil,nil,nil,nil,nil,nil,8},
 {3,1500,nil,2,1,176,112,3,408,440,nil,nil,nil,nil,nil,nil,7},
 {4,1500,nil,2,1,176,432,3,296,16,nil,nil,nil,nil,nil,nil,6},
 {5,1500,nil,2,1,88,200,2,448,288,nil,nil,nil,nil,nil,nil,5},
 {6,1700,nil,3,1,264,312,3,8,24,3,480,136,nil,nil,nil,4},
 {7,2000,nil,4,1,200,72,2,280,408,nil,nil,nil,nil,nil,nil,3},
 {8,2000,nil,4,1,192,240,3,328,8,2,248,448,2,424,424,2},
 {9,2500,nil,4,1,232,416,4,360,40,3,112,40,2,408,136,1},
},
{ -- ordos missions
 {1,999,1000,4,2,88,72,3,24,64,3,160,64,3,160,152,20},
 {2,1200,2700,2,2,144,200,3,120,96,nil,nil,nil,nil,nil,nil,8},
 {3,1500,nil,2,2,176,112,1,408,440,nil,nil,nil,nil,nil,nil,7},
 {4,1500,nil,2,2,176,432,1,296,16,nil,nil,nil,nil,nil,nil,6},
 {5,1500,nil,2,2,88,200,3,448,288,nil,nil,nil,nil,nil,nil,5},
 {6,1700,nil,3,2,264,312,1,8,24,1,480,136,nil,nil,nil,4},
 {7,2000,nil,4,2,200,72,3,280,408,nil,nil,nil,nil,nil,nil,3},
 {8,2000,nil,4,2,192,240,1,328,8,3,248,448,3,424,424,2},
 {9,2500,nil,4,2,232,416,4,360,40,1,112,40,3,408,136,1},
},
{ -- harkonnen missions
 {1,999,1000,4,3,88,72,1,24,64,1,160,64,1,160,152,20},
 {2,1200,2700,2,3,144,200,1,120,96,nil,nil,nil,nil,nil,nil,8},
 {3,1500,nil,2,3,176,112,2,408,440,nil,nil,nil,nil,nil,nil,7},
 {4,1500,nil,2,3,176,432,2,296,16,nil,nil,nil,nil,nil,nil,6},
 {5,1500,nil,2,3,88,200,1,448,288,nil,nil,nil,nil,nil,nil,5},
 {6,1700,nil,3,3,264,312,2,8,24,2,480,136,nil,nil,nil,4},
 {7,2000,nil,4,3,200,72,1,280,408,nil,nil,nil,nil,nil,nil,3},
 {8,2000,nil,4,3,192,240,2,328,8,1,248,448,1,424,424,2},
 {9,2500,nil,4,3,232,416,4,360,40,2,112,40,1,408,136,1},
}
}

mentat_dialogs={ 
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
}
}

-- vars
mode = title_mode
seq_cor = nil

-- title vars

-- level-end vars
endstate = 0


function _init()
 cartdata("pn_undune2")

 log_cartdata()

 load_data()

 -- debug!!!
 mode = houseselect_mode
 --mode = levelselect_mode
 --mode = levelintro_mode

 -- initialise modes
 if (mode==title_mode) init_title()
 if (mode==houseselect_mode) init_houseselect()
 if (mode==levelintro_mode) p_fact=3 p_level=1 init_levelintro() 
 if (mode==levelend_mode) init_levelend()
 --if (mode==levelselect_mode) p_fact=3 p_level=2 init_levelselect() 
 if (mode==levelselect_mode) p_fact=3 p_level=9 init_levelselect() 

 -- debug menu
 --if debug then
  menuitem(1,"!reset cartdata!",function()
   for i=0,63 do
    dset(i,nil)
   end
  end)
 --end

end

function _update60()

 if mode == title_mode then
  update_title()
  -- switch to house select
  if btnp(5) then   
   if p_fact == 0 then
    -- starting new game
    init_houseselect()
   else
    -- continuing existing game
    init_levelintro()  
   end
  end 
 
 elseif mode == houseselect_mode then
  update_houseselect()
  -- switch to level intro
  if btnp(5) then
   -- set player faction 
   p_fact = ui_cursor -- (1=atreides, 2=ordos, 3-harkonen)
   init_levelintro()
  end

 elseif mode == levelintro_mode then
  update_levelintro()
  

 elseif mode == levelend_mode then
  update_levelend()
  -- switch to level select
  if btnp(5) then
   p_level += 1
   printh("p_level now set to = "..p_level)
   dset(0, p_level)
   dset(40, 0) -- clear endstate
   init_levelselect()   
  end

elseif mode == levelselect_mode then
  update_levelselect()
  -- switch to level intro
  if btnp(5) then   
   init_levelintro()
  end
  
 end

end


function _draw()
 --## don't clear here - as coroutines handle own drawing
 --cls()

 -- check for gfx change
 if req_gfx_num != curr_gfx_num then
  --printh("gfx update!!!!!!")
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

 --print("-main cart-",0,0,8)

 if mode == title_mode then
  draw_title()

 elseif mode == houseselect_mode then
  draw_houseselect()

 elseif mode == levelintro_mode then
  draw_levelintro()
 
 elseif mode == levelselect_mode then
  draw_levelselect()
  -- print("\n(level select screen)")
  -- print("\n< press ❎ to choose level >")
 
 elseif mode == levelend_mode then
  draw_levelend()
 
 end 

 -- debug state
 if debug then
  printo("mode="..mode.."\nlevelend_mode="..levelend_mode.."\np_level="..p_level,2,110,8)  
 end
end




function load_data()
 -- load saved data to determine current "state"

 p_fact = dget(6)
 p_level = max(1, dget(0))
 printh("p_level: = "..tostr(p_level))

 endstate = dget(40)  -- (0=none, 1=credit target, 2=enemy defeated, 3=player lost)
 printh("endstate = "..tostr(endstate))
 if endstate>0 then
  mode = levelend_mode
  -- get level end data
  p_score = dget(2)
  p_rank = calc_rank()
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

function calc_rank()
 return "sQUAD lEADER"
end

function load_level(num)
 
 -- debug
 --num=4
 
 printh("in load_level("..num..")...")
 printh("p_fact = "..p_fact)

 --debug
 --p_fact = 3 -- (1=atreides, 2=ordos, 3-harkonen)
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

 --ai1_fact = 1
 dset(11, ai1_fact) -- ai_faction
 dset(12, ai1_fact and faction_cols[ai1_fact][1] or nil)
 dset(13, ai1_fact and faction_cols[ai1_fact][2] or nil)
 dset(14, mdata[9])  -- ai1 base x-pos
 dset(15, mdata[10]) -- ai1 base y-pos 

 --ai2_fact = 1
 dset(16, ai2_fact)
 dset(17, ai2_fact and faction_cols[ai2_fact][1] or nil)
 dset(18, ai2_fact and faction_cols[ai2_fact][2] or nil)
 dset(19, mdata[12]) -- ai2 base x-pos
 dset(20, mdata[13]) -- ai2 base y-pos

 --ai3_fact = 1
 dset(21, ai3_fact)
 dset(22, ai3_fact and faction_cols[ai3_fact][1] or nil)
 dset(23, ai3_fact and faction_cols[ai3_fact][2] or nil)
 dset(24, mdata[15]) -- ai3 base x-pos
 dset(25, mdata[16]) -- ai3 base y-pos

 dset(35, mdata[2]) -- starting credits
 dset(36, mdata[3]) -- target credits

 dset(41, 0) -- playing time
 dset(42, 0) -- harvested
 dset(43, 0) -- ai harvested
 dset(44, 0) -- units destroyed
 dset(45, 0) -- ai units destroyed
 dset(46, 0) -- buildings destroyed
 dset(47, 0) -- ai buildings destroyed

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
  --print("\n(title screen)",0,0,8)
 
 --pal()
	-- draw orginal sprite when
	-- not rotating (as rotation
	-- code distorts slightly)
	--angle=0
	if angle~=0 then 
	 spr3d(8,0,123,20,cy,angle,1)
	else
	 spr(1, 3,38, 15,3)
	end
	
	local start⧗=6.5
 --local start⧗=0
	if t()>start⧗ then
	 local tagline="the demaking of a dynasty"
		fadeprint(tagline,12,62, (t()-start⧗)*8,3)
		fadeprint(tagline,12,61, (t()-start⧗)*8)
  fadeprint(" bY pAUL nICHOLAS @liquidream",4,104, (t()-start⧗)*8, 5)
  fadeprint("♪cHRIS dONNELLY @gruber_music",4,112, (t()-start⧗)*8, 4)
  fadeprint("(oRIGINAL BY wESTWOOD sTUDIOS)",4,120, (t()-start⧗)*8, 3)
	end

 if t()>start⧗+1 then
  local msg = "press ❎ to "..(p_fact>0 and "continue" or "start")
  if(t()\1%2==0)printo(msg,60-(#msg*4)/2,78,7,3)
 end

 -- intro anim (crisp hd)
 -- https://www.youtube.com/watch?v=SJ436NYbyK8
 -- (use this one for intro captions...)
 -- https://www.youtube.com/watch?v=TqCDj0IRSTk
end

-->8
-- house selection screen

function init_houseselect()
 mode = houseselect_mode
 load_gfx_page(0) 
 ui_cursor=1
end

function update_houseselect()
 if (btnp(0) and ui_cursor>1) ui_cursor-=1
 if (btnp(1) and ui_cursor<3) ui_cursor+=1
end

function draw_houseselect()
 cls()
 pal()
 pal(10,139,1)
 pal(14,140,1)
 pal(15,130,1)
 -- print("\n(house select screen)",0,0,8)
 -- print("\n< press ❎ >",0,8)

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
  --rectfill(2+off+gap,86,39+off+gap,92,9)
  rect(off+gap,84,41+off+gap,94,ui_cursor==i+1 and 7 or 0)
  ?houses[i+1],4+off+gap,87,1--faction_cols[i+1][2]
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

 load_gfx_page(p_fact+1)
 
 -- play "intro" music
 music(6)

 msg=mentat_dialogs[p_fact][1] 
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
  if btnp(5) and last_msg_part then   
   load_level(p_level)
  end
end

function draw_levelintro() 
 cls() 
 --dune bg
 draw_mentat(0) 

 if (current_msg) draw_dialog() 
 ?"❎ to "..(last_msg_part and "start" or "skip"),83,121,6
end

function draw_mentat(pnum) 
 --pnum (0=dune,  1=atreides, etc.)
 pal({[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},1) 
 
 -- space bg + window
 draw_planet(pnum)
 rect(40,36,128,112,7)

 palt(0,false)
 
 if p_fact==1 then
  palt(2, true)
  spr(7, 0,40,  16,16) 
 else
  palt(12, true)
  spr(0, 0,40,  16,16)
 end

end

function draw_planet(pnum)
	dx=100
	dy=75

	c=(
			{[0]={0,9,11,14,15,8,8,8}, --dune
--	 [0]={0,9,3,6,12}, --dune v2 (too yellow)
	   {0,10,1,13,2,6},--7 --atreides
    {0,10,1,7,5,15,15},--ordos
	   {0,9,2,15,6,6,6} --harkonnen
	  })[pnum]
	  
	 --spare cols: 2,6,8,15
	p=({
[0]={[0]=0,1,3,4,5,6,9,13,15,128,129,132,10,140,142,143},
				{[0]=0,1,3,4,5,6,139,13,8,128,129,132,8,140,142,8},
				{[0]=0,1,8,4,5,6,12,13,15,128,129,132,10,140,142,7},
				{[0]=0,1,2,4,5,6,8,13,15,128,129,132,10,140,142,136}
	  })[pnum]
	
	g=({[0]=.5,.65,0.75,.5})[pnum]
	
	pal(p,1)
	  
	srand(6)--6
	u=cos(.5)
	v=sin(.4)
	
	--stars
	for i=1,50 do
	 pset(40+rnd(88),36+rnd(76),rnd{10,13,1})
	end
	
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

-- Dialog Text Flow with Coroutines by @MBoffin
-- https://www.lexaloffle.com/bbs/?tid=35381
function draw_dialog()
 ?current_msg,2,5,11
 ?current_msg,2,4,5
end
function text_spool()
 local msgparts=split(msg,":")
 for j=1,#msgparts do
  msg=msgparts[j]
  for i=1,#msg do
   current_msg=sub(msg,1,i)
   --sfx(0)
   if (btnp(❎)) break
   yield()yield()
  end
  yield()
  current_msg=msg  
  last_msg_part=(j==#msgparts)
  while not (btnp(❎) or last_msg_part) do yield() end  
  --current_msg=nil
  _update_buttons()
 end
end

-->8
-- level end screen

function init_levelend()
 load_gfx_page(0)
 pal(3, 137, 1)
 -- debug testing
 p_score=927
 p_time=5000
 local hours = flr(p_time / 3600 )
 p_time = p_time - hours * 3600
 local minutes = flr(p_time / 60)
 p_time=hours.."H "..minutes.."M"
 -- p_harvested=30000
 -- ai_harvested=25000
 -- p_units=302
 -- ai_units=75
 -- p_buildings=74
 -- ai_buildings=13

 stats={
 	{ 0, p_harvested, 62, 8, 60, p_harvested },
 	{ 0, ai_harvested, 68, 6, 60, p_harvested },
  { 0, p_units, 85, 8, 40, p_units },
  { 0, ai_units, 91, 6, 40, p_units },
  { 0, p_buildings, 107, 8, 20, p_buildings},
  { 0, ai_buildings, 113, 6, 20, p_buildings }
  }
 curr_stat=1
 stat_delay=100
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
 palt(0,false)   -- show blacks
 pal(14, 137, 1)  -- bright pink > dark orange
 pal(12, 140, 1) -- light blue > royal blue
 pal(11, 139, 1) -- light green > grass green
 pal(10, 3, 1)   -- yellow > rough green
 --pal(8, 136, 1) -- red > cherry
 pal(6, 143, 1)  -- skin > peach
 pal(13, 134, 1) -- greyblue > beige
 --pal(7, 142, 1)  -- white > peach2
 
 pal(6, 14, 1)  -- grey > pink (as pink is being used in marble replacement)

 -- debug data
 -- step in original = n*0.003
 --p_harvested+=(5.5 >> 16)
-- p_harvested += 100
 local spr_fact=9
 map()
 map(17,1,8,2,14,6)
  
 spr(spr_fact,1,22,3,3)
 spr(spr_fact,103,22,3,3)

 sprint("sCORE:"..p_score,16,7,7)
 -- todo: round to nearest minute
 sprint("tIME:"..p_time,70,7)

 sprint("yOU'VE ATTAINED\n  THE RANK OF",36,24)
 sprint(p_rank,42,37,8)
  
	rect(8,56,120,75,4)
	line(26,56,100,56,9)
 sprint("SPICE HARVESTED BY",28,53)
 sprint("  YOU:\nENEMY:",11,61)
 sprint(flr(stats[1][1]).."\n"..flr(stats[2][1]),100,61)
 
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
 
end

-->8
-- level select screen

function init_levelselect()
 mode = levelselect_mode
 load_gfx_page(0)
 -- play "select" music
 music(12)
 -- init map region data
 rdata=split2d(spr_data,",","\n")
 
 -- define colour "filters"
 map_cols={
  [-1]={6,7,13},-- orig map
  [0]={0,0,0},  -- borderline
  {12,1,0},     -- attreides
  {11,10,1},    -- ordos
  {8,2,1,7,7},  -- harkonnen
  {5,2,0}     -- emperor
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
 _t=0

 -- init map anim sequence
 seq_cor=cocreate(play_map_sequence)
end

function update_levelselect()
 -- in map mode

 -- update coroutine
 if seq_cor and costatus(seq_cor)~="dead" then
  assert(coresume(seq_cor, p_level)) 
 end
end

function draw_levelselect()
 -- debug data
 if debug then
  local spr_fact=9
 end
 
 pal(5, 14, 1)  -- grey > pink (as pink is being used in marble replacement)

 --printo("p_level="..p_level,2,121,8)

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
 pal(2,7)
 pal(3,13)
 map(32,0,0,0)
 spr(97,4,20,15,8)
 pal()

 --
 -- init custom screen palette
 --
 palt(0,false)   -- show blacks
 pal(14, 137, 1)  -- bright pink > dark orange
 pal(12, 140, 1) -- light blue > royal blue
 pal(11, 139, 1) -- light green > grass green
 pal(10, 3, 1)   -- yellow > rough green
 --pal(8, 136, 1) -- red > cherry
 pal(6, 143, 1)  -- skin > peach
 pal(13, 134, 1) -- greyblue > beige
 pal(7, 142, 1)  -- dark red > peach2
 
 
 printo("your next conquest",30,7,8,0) 
 
 if seqnum > 2 then
  setmap(0, map_cols[col_borderline])
 end

 if p_fact == 1 then
  -- =========================================================
  -- atreides
  -- =========================================================
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
  -- =========================================================
  -- ordos
  -- =========================================================
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
  -- =========================================================
  -- harkonnen
  -- =========================================================
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
 show_message("pRESS ❎ tO sTART")
 while true do
  setmap(nextreg_num, map_cols[p_fact])
  wait(20)
  setmap(nextreg_num, nextreg_currcol)   
  wait(20)

  --seqnum+=1
  --goto demo   
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
  yield()--flip()
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
 sx=8
 sy=20
 sw=119
 sh=64
 dx=4 
 dy=20
 offx=0
 offy=28 -- if map sprite not 1:1 with screen draw pos
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
   if(_x%speed==0)yield()--flip()
  end
 end
end

-- immediately set a region's colour
function setmap(rnum, cols)
 sx=8
 sy=20
 sw=119
 sh=64
 dx=4
 dy=20
 offx=0
 offy=28 -- if map sprite not 1:1 with screen draw pos
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
-- 3d funcs

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
 yield()--flip()
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

-- skip through compressed data
-- blocks and load the one at
-- index
function load_gfx(index,x,y)
 local offset=0x0000 -- screen memory
 for i=0,index-1 do
  offset += peek(offset+0) + peek(offset+1)*256 + 2
 end
 -- use sget,sset to write back
 -- to the spritesheet instead
 -- of the screen
 px9_decomp(x,y,offset+2,pget,pset)
end

-->8
-- px9 decompress

-- x0,y0 where to draw to
-- src   compressed data address
-- vget  read function (x,y)
-- vset  write function (x,y,v)

   function px9_decomp(x0,y0,src,vget,vset)

    local function vlist_val(l, val)
        -- find position and move
        -- to head of the list

--[ 2-3x faster than block below
        local v,i=l[1],1
        while v!=val do
            i+=1
            v,l[i]=l[i],v
        end
        l[1]=val
--]]

--[[ 7 tokens smaller than above
        for i,v in ipairs(l) do
            if v==val then
                add(l,deli(l,i),1)
                return
            end
        end
--]]
    end

    -- bit cache is between 16 and 
    -- 31 bits long with the next
    -- bit always aligned to the
    -- lsb of the fractional part
    local cache,cache_bits=0,0
    function getval(bits)
        if cache_bits<16 then
            -- cache next 16 bits
            cache+=%src>>>16-cache_bits
            cache_bits+=16
            src+=2
        end
        -- clip out the bits we want
        -- and shift to integer bits
        local val=cache<<32-bits>>>16-bits
        -- now shift those bits out
        -- of the cache
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
        w,h_1,      -- w,h-1
        eb,el,pr,
        x,y,
        splen,
        predict
        =
        gnp"1",gnp"0",
        gnp"1",{},{},
        0,0,
        0
        --,nil

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

            -- create vlist if needed
            local l=pr[a]
            if not l then
                l={}
                for e in all(el) do
                    add(l,e)
                end
                pr[a]=l
            end

            -- grab index from stream
            -- iff predicted, always 1

            local v=l[predict and 1 or gnp"2"]

            -- update predictions
            vlist_val(l, v)
            vlist_val(el, v)

            -- set
            vset(x,y,v)

        end
    end
end

__gfx__
cc50ffffff0fff7faf310e4d11b78ac7bd6ef34921e6e4a492109427842cdc3c30e1e762c31ef0242b80b44872c842a3429422319936294461944ee4907acff4
284dfa9afb68b8fdd2cfff2123fb66efa4cff7cef69041ff7bccf299ff15a2cfa12980ff4aefa4435f39c7cffb33095ef7331dccd686f8acffe958ff1d055c3a
5a99fff70cfff2cf0229c39349fff7448fd68f52c1cffffd0f758ff768ff9862c8f13cf121effb9ae611e7390f42ab03ea0fb08ff9e146240a303ea466296442
24801e903ac4487213649ff14319589c9c7b0f43858042c1c2cb1e8070878ff148fffffffd3efffc3f93effffb18ffffffff700e1e214e3f3d880c91794df770
14e97509bdf41420c7ff39c5f14d70e5ea40793eb3bfd9f324c327975d7f307c2cff7042219f5681209f7948342ebf982ff7123cf81c010c5ff191210f7e228f
fdc148f5908984f78f72201b38329f305f3426f08ffb41e9c7ec0f82483c5f9f529727e339326747fdc1ed8322bc28ffb458c516b4977017ca167c122d8c5be3
3bbb9b2485bbb723f6b231eff320739f1eccf0f4ff9f7a3293e79765485522f4a17cdd31276e70e8ef17ef1e62d16e9ffd093f79327cb7cf190b59f7e70fcbee
a9daa4c1bb3b78ab6b90fc85edc5bc17cf1f746d7e78ef29d04399ff3ddfb4ea3ef9bfb7ef83e5bbe78f1c3f3cf37f7b074293a62597f8bf794e8fe783e10972
3bf1ecbc1fedbf7e78442d1ff4a2f91ff71bcf7fe5f8fe9c32f3cf3fabb7c5f38ef1bc12919344274ea33bbedd594e788c52bc178f6e217d6a9cd1411bfffc1d
7e780dcedf5c1fe3fd9f387fdaf72fd8c52137c7674f8e5f3c19bf9d3639f1e0f74f1bfebc12dc8427cff7e7af8fef93b7c7ffc19fe2fb0f7037ce84c7669eba
a76e832e70edc173a9437c5fc19a219d31fff1175d1791d7ea3f3fc1e0ce8de7971ec7c9da3e274837726d342d74a78f56dfe9667d5fd27d0ff31c37e9c378d3
7c5a1f4cf1f477de783eebeef7a97cc5e85ff9d127df390f7cf093e2bbea4eba6e997c27c13988cff6e974f97ef0e936ec3c193611f8c7e2590752b564fa3ff1
f742c9bce783e7109811d9299fff0eae1fc7f174a193e2df3616fd948fe5ef8f3629e1a7c311e436bf1edd6f7cf1a37ff2e85ea64a6cff48c5f4ea9936e09c91
e1e709fe06f04295c1fcec3e4bc2f30fc5f07ef078e38505cff78c3b8e9fe31705e574ee7fa32c568d5d7e8de8f5c2cf0ce967c70ed18dc9acff7275d1e92394
7b4897a72f8b4037c21bc5f58f34a7ce17d5144a2122ff316978e5fc1640dccf2e9be8cb5798442fe36dfe0e4bdf14ceb59e3f95b56121ab4cff62f527e3b76f
3ce854d1ea4cb285e942f9a483619c858b25c60c5b3cb920088cff823bbfac5be1f3c67cb9d3f30f036bde2319ce1bde9622f03b56678cf01739caff7abdaead
99df2fb893f157a195f213b8cd1bf367c5eac3b2431c288cff521bb87c77d32f3c170f16a2cf1940717607ceaf2f1f9c483ad8dff6ce978494401e8d11244e70
ce830e95059a26379c0112748b0bff9494ecf4add327530b4849c39f6bd210148c139911b7186edcef72334e8bc95131469e30266317d8727c08e295fa0275ef
8801621ff79d38cc269cc19e378a49621296c6c1c219762932942b67dc91988d8fff89d68522f2d0074298846530149508d021952b86994cef7542119f924242
11422a290ac0833818983879d0fff90e194e2f3842260f18d2319c2474460b70212f3ce01011eff2ae87e9becf32bf7e71b09d5f346bf3cf39ef0ebf7c1fcf0d
beec434e852953f78f2e0e2bf7e3bd3f5ea6229e719ff7ccf095fa4359f27f1fbc84374ffffc5f29fe71bf72ef838f52fef07af5a19f5a7d32d0b09d37769958
5f5fc159ff77ee3ebcf27cf8dc375beaf2bcf3c194eff598f52fde790fb4cbc5546ef80fb8cffb27cef1ef76d3e96e6394e788effb2cff32cfc9fe8f129bf71b
ff95ce798df22f3f6dbef0fbcf0d7afc1ff3a88c37cf3cffd4ef70bfeafef74cfff1c47ff72dfffb7cffb2cfffffff71fff2efffe1ff33efffedeeee1a0ea245
3cfff3422ffb09fffffffffff863ea70ffffff0fff7fa724af3d58cc7190db108df694483080f348c22fd4448dffce012b148233cf0352619424248442942719
420709421eff3938019e030a5964ff8426b52fc2956f8503bca9563e23112ff3228448192832952f35712429c7b48071f7063ef74e8e00c142290ff880513679
022e03909b318ff5580090708d100f7ec62cd38d8f63bd211199ffb91190001c42fb680f7c2bc4079988dc48fffd1005418dfb1efa42ea88c848d832121ff736
4098164e7d38d61db832abc2094cc68c31b0ff7b52216421f738f1321187211998588cffe213102c29cfa1e75c1a9019c24e1948fff526142eff03cf75824c70
298320ffbb11830ca0f72f7611986210b6529ff1e2480e10e75efc024a129501039ffd90948381ff28f732a0042061eff6110ac00efc0f3691444684f884cff0
3def20efc90ccef01585954a129849ffb3f371e722c310980efff548f57a12f7012b5433148b4effecfc299e8d58062bf0111309adffeb63ff069801ed08a0a7
095c13292ffb711bf984228d2bb219460594a54c8432ffb790f3012fc8c084e918c098466e1eb94efff08df7d887a402c11a5697b42fff3fcf0dbebc3c39c5e8
0af98a74e3e8f29c58028124294af840f38401eb94af404de2e94cd3478f5cace02b844360702e62314a1a740cb44842f68b3cd1e7984e842139438d059f181f
58908021139c95842ef31cf2264628380e8429cf212987345e9b211c9ca20a39421740cf124452ec58c22646c245e90d6092c998338248138c112cf2f848894e
09cb988422b061221123ea488421d4429cf3c3000c8f92464019b28f4211126190120ef19090b0f30832159e4ca11f31a9842413942190b5214a942094e94cf3
80fd0d9429058c070b07e29403c009448c445807c780c331629f21f3a80741616108372229148c0b02229852e112448b601e421e79010b10f40291ee520838c1
940b400b0d348cf01e7a0f3e070d103ed321909c5902159819339444c6810983833cfd1e802ca90f742c19421812d421442f301290170f778f5342c841431e78
12784298014469039884445872c358f34efe0f881c0b64c534a4852944422428f1442119874a162fffb445ea3844629a8704288c3985850b48621b42298801c3
d0e8424ef408f786168302b091020011394445819488c11e70ef70c058f1694a1c42a8c4ac7221942b529d4c610f748fd1980b01eb02c281c11123168c10a342
c7908780e6e9021f3509832cf2587394e02402228e283422743942c4e94cd48f19b80770c3b42388542240290620306f3428801002c3048f54051c1021efd444
c180319542098c8e445ef80f1fb4242968f0063980f60b4421b40294a98f3694a221e9048cf098f5a280858291209501c94848161e06201e97444421b4295427
424ea448ff8f4249f10c01882429c174222f842c81e019402e2290740210ff580b1e02c983229898644583280390e098c01148f94e88c7c398941c11401e9064
046838428f101694e819bb4c1d0064ec4c6100401a430480e10c84719f36461880307e38079ca4c71e088016021252a18c84440448cf0b01190b8c142c9cb323
9f2c2100c0840c80940a22c4e00fe0d0ff68f0061ed30838001c02c37a021227d2944e7101ef711408a844e511622cb70803228732b42f62e90ff58790123c9b
422112148256c2169848b9f12c1cf01e1ef4e412422880282101ea54429ff1c4840ed4cf11af401b07b4381e0880016180c2c21fc294317580b07d212cb27022
a444ed3000f44003002024248624981fb524094c2121f00b8404690983942194840093e1027004442978e0f3e2015114442a94e0c7420f7481a24202c87a0012
0e9480ff1051884c131ba0115113c2c9d429c001e1ef91627190842e7804c483421b5840809122682f121a227d08b18121ef7132329461c8c1d02224090981f2
42808280f516cf61ee0b788848b3c0821952842c702248802011e5214890ef84cf11a148f10b481c0229424e5402b1a802c710f40340c1b4c352a04321291922
2ea012744000eb50f6008123c74b1c429084c64078cdd4297836142984317531e34080a0822cd8052c3100901ee32298442ce028b21940198f750f70f71f62c0
11cf619b2c2900421429750f30140c51e80ff409894390ea21f88640c8854452cb1019c17424ec0081c02c2c81f94a214ac1197e148b24a9444c054321742297
29cd89422604868301e95423178c21907411c59083046140722240d680e46163048d10e81e9121e909092c640f6104274402e01240b1c0f30a0873807689440f
62214894b148df202110698d4c1c8bb0280324b0fb0228b505ea34446809229882248c87848f92c282480f31994ee529d44790c2009b80198450873c9c558177
8f3084cf03248439c18086148100e6429f83844a1e810f34023ed709409901c7194294018c3c10e701c7c1384c86848f94e780140291e04224807190b07f8cf3
8607d01e80f08fb0104889874e8b29440031807f42f278c9708c10ee121ed488ce224ce8880188802944244a1eb5212f358482f322cf09098444074421b4080a
890c21f84a1c3cf61248d020e807c0f621b40e802228a8c5842162b039d03ef4281a0e4e90fe1908c6010a98027400a11852ea48422216c7c90024181ed30c53
17422902f2629c5244a1e3100b0839f840810148f2497682a809093042291c04489c99029429321c7d00b1ac031f33f1218c213078460434822062e240006a80
ffffff0fff7faf3134ac29658dc1eb7ff209488cff5ce94cd05095e0ff73d3d137c5f4bf0bff38e1bd124c3b9414c2f4ce2effa6f38dafd7bdff222946267602
27c596675ff796ff9b8722f7fafc96d4ab7145521296f958894ef75936f36d5fd4eedfb5f3cf156c0f91b0b30e07d799b2bff902d748f5fac17cf1d7af7e1dcd
73e78170a95244012f4727c2cff46d7e3cfc6e8af1a9f37348eef0012fc08308c1f95e1ff31dff54c3e075e8cf6ea341243528e2909c0bc9f8023ffb84cf0519
bf844a6d9fbc9936090fd3e786294808c5a393dff1229669c3980fbc10bfd21a1698c120901148e1c122d0eff0942280b98ffcb9c2f3d0423229c1c6bd421c72
c5c1ffb8d72222c40ff9825f3de90d85884221283e70e848f85c3fff8429540998f1f9830f39d15198c29010211270b59ff70e884013cfabf67accf326956b58
84230246271bd27cff3c0906c2901efa708f7e81ef8ad5dd848f5a9b2ef7178848801110b94e79976ff812b1781bcc48849b64eff118c24050f0938f3e078af5
0385976342c2ac1d42758ff741e24918d881e5394e790b5693b1984ed8472e898ff704619428832093407f1569f3a6b66f3cf1eacf11a203344ea5deff2c7190
c44842194c762bcf1f84a9cf19a42e807909ff7c4c8067a4e3342130e422f7c11ef829f8b098bbaafff807c46619c2b6e022958b5ef02e7061e20945c69cea30
cff269862b44c68720944e8449f9eae194b5c3489d39de35cff44a31e71c2b812358790f7489323f34688c1b546781e94dff44a02fb891630f42e290f7c37c69
075306d46bcd424c209d2bff944c3628e0a69022700066f3d7bf309a914248c398f1898c1fc8fffc399870132629b5693098722f74f97378899529d2d81f78cd
f874296fa9cff80248a361b119c1cf2169c6a119d12cf17f5fb43e93b1746231c337c187e93c04e029cff3289646bc3cc032cf1cf2330959f8cb9f3cf1efa489
27eb7fb9c15b632e3f8f321b6a3b78ff74c4b6169c0909e3946d3e9c870190fb8e1e9d1934622d7c2f3429c6f864ef7294275b6846167cac2311423f3539ceac
df74317c32d7edc8194dff32966541e02c868806d83cf47409101280667148f2cff38c7ec329c3946e8842c2187cbc3fb09321421042400e1e1ef7246b066630
c5ff43fe72f4524e511ebf5c1e8cef84a67c0233500fca9dff327c1a8d237c1ef93e4f544de94e03cf0b3d4ae791609dc8145aeff07139a6c79942c832c0104e
79becdf1fa8f835e1b028a39ff143981a9ce003e94876ce19473e709958310c6123b080bd2e77b44242945e24001c174abe9f34ebb58790b42a9d2023b4223f9
fd9b62e003646940145e783f717caccb161290184e00146ef70482fb0080b446abf3e93c8858bad80f803e9f1203edecfc09c5128f360b0f0e07cbcd6ebde9f5
2d4e2d5681ccc527ce0bff3ce79a9cf2844096e9ee4ef872b8131d48432f028387259708fb322a998b3916270e96e857f38de2b84c14e874e091eb458907dfc8
8b24c48f100eba507df1f02ea07485f8da903934e92af3782981ee8b43e85040dfef0bf345a5fc302801c2fc1265e39d678fb5eb01975c101069c4af3cf08440
0211e8a60932639728ba20f735e0e5fc4ca39429d63e9f322dd4add125123198b28426448f75a2520e5131469be9fb62a6781b841133c99ca3e8ff152ef9c069
3fafd27ce9078c12689d798601e76a490f290f8cf8b62342a16c862e21084cf3f337ae0c3c1801fcf8d44a51a039362b0939442cc9f372971489094a85d7f7e4
278808440a3288e3440742ffcff282705ce8c544a9c6cf72016f01091ff403b9522cfbcf984a80bc39f13f74e8c66b448588409a7021dc1cdbbefd44991ac231
12f83efc0953c185001030fa1c5b3ea0fdfb1d7313129c0124ab0f3294719c16621c142e458c8c994e87ef6ac5434c67c6d6298f3dc91bcab1a2c4848f2019fe
c38fb5e0e3a1e95d233ff6769440c884a8a30db62e20fff0e0e24461a4084cfa7c30058894229c62af21aabcff2832440b669d94bacf6936325278da94e94294
4078809a5771454efe60d81938940e9ff60024a9be398d4809387ac0e2b80e74e84c36332fcc2f76f884822f3c11b2758f2a0b483c1d7221f3296638fd06ffd1
42401e0efe8044040292e7d16cf5cf9d011119feabc1756e84ddf022af40846ff3d932f723227d97c1fc9ffc1fc1d930f3128809f53199842e7a322f9fb0bf74
4d3d9c4f1f0d0fcfe85261ef321e1e716842fb469421df5ea87ea3e8dd114c0f71a90de3f4cf6901e11cf026e98d2ef84212753fe44fa4a7db74231f7481637c
3dd1cd993c22dc5228779480198f32f8c616dd0ba767e252cff42def06f095a2951e844c7ece4e8f3a7c4e17423d4fc140f74830c9b4cb6862c42746280fd2f9
8348b7940d1bb8f55a20c95d833c3cf1b9c7e809326cb661940902f30fb48b8f1698f8b8221d0217553624fe83e821b8344eac2f7ce26cf431ff488c149f209e
8df1334450b838293c0f3c1b3f8b39c1ef9cec333f4a5bc0e0e2403bc11ec550ebb4a1fae4278cb90e0e0be15a4fb05eb5ae25202f74ea8019d66fa111f6a4f8
28769841e29c39e3d3e8f7ceb58b42be2f079c617df72cf2e24e7029c234a90924602842299f5676c52dc429852978b471eb0f52840347219d387a3405290648
8c2f78d999ca1190f07e24669de6d71220e1c2d807d0329b3074af0e83ab5e5febb11ba48f8fe2b07a07362ef08891c4af06fbcd2e8c445174226fae923e7151
0cd3e7c28074eb4248328c3117ae35d341275ab1f07483d09087b198452fb8b3fa3a0702e19a3bc61967b9327c02f4ac57c1d0723ef0c11b063f7cb26f301238
0284ef0b44698c3288d404216297ebd3dc21e12cb4d83e78f2b4e842f7848381168424ea324e9c78227a8b267c1bd72dcc312b1f6a2780962e5fbc3204342212
c3f423bc612983122dbe13b4433f011c215632c142e9b5c24082c24e8e5746278403980d30dc1a894c5f461e01c2c344ac219484429cc1f6e9d50092c00b29d3
b0544319028983a9bed02900ef138856b8d111e8076624240580fb87886abbc4d8949be89100b440ffffff0fff7faf703865eec3a788df3c123b4adfff3da296
423ca6bdfffb69361686bcffff590c12819bab52ffff554f07080433c3dc6bfff7a950944280227e42ffff339c398e4c2c568fff7959780d48d840c513cfff9c
c4c0ac6b7628316ffff233701f0542587198fff7874682c03901ee19fff38211708121841e6dfff395208d69a8098cbd0effff5042809f29be2946cfff951702
c1271f45c2483378fffb7958d3eb0d6e9d221780f42effffd061e2e84c33c3eafff389917242166e03c333ffffec0fb422c8d0f46efffe119f1032dc6e01cfff
bc0ff5229841efff52ff40d429b8b8ffff719f764a260c5afffff40fb1023efff8ad2cf254ef897cffff3cead62f530cf0f8c31efffd98711d46b6c21ea056cf
fff3584394b126e0406c5cfff14756fc31c699cc23574c79020ce0efff065d722148422feeb133b20cffff317521d52da01c224d294901dffff74a21ca290221
b46e09fff39e190cb9001483441efff1a842f48388011248d4cfff149070b2c4e8128880fff7073e8167814211c2c3cfff54b70c1890269046128ce8ffff9c10
a8890f52fcfff3493461c51890740f00ffff0958b0d1aca1c1cfff3cd3c30c091e1014e3ffff151d1229c2f5782fff72d5f5617c6740c611efffda19d2a18d04
0211433fff71798dc42d09329c14e819fefff4a5906976ca9de80f42efff36832085c07578e4cfff54e06b46e94294ea70c14ffff4a44e5c26d028b070efff1a
1c8c42464e1c089cfff9c29dc9388983248638fff787c04276c7f0540c1d95429fff3845320a9ca100c312b524efffd9d2b4c0221915eac1f6214294efff9d2c
129326113c2c5962948463efff9de0a13519c2c2c5b72a1dc690efff7531288922295694ea58ea1d67cfff729c808464326346eb94ac1744212fff782b44ca18
004444ec58e6c522909fff34b94a7d16146f439db3955ed7c61efffc421d46942758581f68325f3c184efff980800b62485ced1e80fb494efff742b4c267cc44
2cf09834e7a2cffff0066079cf519368fb677cfffb8c06b994437bf929c1cf83f5efff40d05e18b9cd96e84cf8dd33ffff1a60942e84c4ef88dff266efff4012
c599f72d3ed8cf6570ffbf9b83cf029e0b4b4239c3dd1dd512cf6d19ffbf21cc63212bc5683bede3c218462e7ba1ff7f761c2d8f107cf67842546223b0e7b43f
ff70258e8ef8902642232cf7dd8ff7f318a789cbff2a67079367c11f76ceffe16294c2cf4be7a32e4285cf71effe4231e0e7a5a1c6c0098429fff756fff00317
4d67029defff4d481efbb26343b8dc1108ff23ff7f6c0e0bf7ad9481674342a4f7c0fffe001e2e7194101242c62e73398ff3740148ff42380703958ffc1c1fff
e08f75420711e99afff7498098cf7740404e0428fb33ff7f284c19873b3481850dc2966efc0ff376d3094afe76074c800b042b1f72fff6299442cdbc43568726
1b1fbadffc716289d7d54099569046838f331ff7f64936109fc124794220cff5cef7fedb0d365d563c83248913698cf9e8ff534150ffffff0fff7faf30764dec
9f38acf8395cefffbb15e83ae93e8fff7d64fe0675bfff7857e242c52942ffff63fc224622c542bdfff7531a90708f096efff9a683300fd2dcffffc502790480
f0942ffff2315f58d0960f095f9cfff7cd10847852ac3899fffb81a2d0240280fdeb6efff2211c749848309b2ffff23cb28622cfff5d480f38c1c946b5efff12
1e61c3c92ffff0b4cf852e06379fff77618cf2c12837aefff0210f718a4b798fff7723ac99834ab0370fcfffd303908b245e003574fc36bfff770239c989099a
c397263efff91f8c030059783c3bccfff530d10e80452283319643ffffc2371620808526231f07176278fff361a9053e524422a711f8bec1fff7d22bb03c3345
66e52e8be4f0df21fff7d806408be04c053bc17c313d3acfffbad102193830dc717c6f6cf37c9fe9bc83c3f52fff7a67c10c1667c1a322c09dc92ae0a98421df
ffb57b90dcb4292f8c137d1348d1120e986ab2ffff90d89c5936676c72b3abd4763c91c6396ea9fffb460ca11e0d662b9569be89e29b86e8ac192efff3d6e203
b89301299c64671dbf028e3ea3f8cafff79e854030ec76d426fde8dd29ca674e966cfff3a8158d6972f95a4629c619e67e3fd270be6fff7607409c23ef9c37ce
4fc1b42fd121b8c198373cc7194efff9c381139384e3f677eb94c17c2b3e9764e0fd6dafe97e8d29cfff1950b54425bdbeaf6b1539c386c1fcb6caf8c12efff9
4212214000175afc267063ceb8334383c2cfffb8025c2854802b9c213093290f7632efff440f83e9e199846dc1214261110f3731efff507ce0e781e2480ff501
c0fff728a858320231c2148f9955e0ffff10c1d904e118011319428ff2c3621ffff0a0d74289015985b6ef6ea3221fff7044163d4840b4222b560f378768fff7
1c92b1848cc0946eff02c48ffdbcbf12227c211eff0276c5fff70e010e8927095208b48d21ff398befff04242c2c192dc2442f8f84294eff0984ea7efff04206
4e8575bc4211324062e77632fff70282c32b6a949780ffb840bfffb075462e937d9574c6742132f7722622fff7186248eb6984a655dd6bfd93cefff2811f5c0c
1f5a94291b3629f9341cfff78a42b521c1793e9119369ce8ffb80efff4088442c5f8329485694eff221bffff0c888a42f0e03898ffd08ffff090c3cf079419ff
b0958fff70f00f0f38421ff720fff71a10e90f3890ff79006ffff0629f9d8cf798b726598fff302195802480bc26d5eff127ce88fff301668a80980629cebff7
52efff044630a905504c609ff3dc37cffe7890014031b343b09fffc34a5ffbf1e8070562780ef7234297ef7f3432521c6b8add59d429ff9853bcfff1024cea8e
e0fed762628c1bff15a9fff30174ac49d98a08d1b8cff2084afff7029cf03a2947b51748ff30ffff2a3190f84a92b880404429ff98fef7f18854e095f8146221
0280fb722db0ff3f42324f5e874016c2ce21c6f7b802f4fffe42462e852b85299194645a199fd9023fff648381c703a4c1b9642dc22ff3983ef7f8ccdb4b69a7
24c429ffd469ffdf81bfc281b4840984394239cf798e80bff9722cb8e9d84c29884843248fb03473feffc306174f19e198029857988e2b03324e72e39ffd32c4
e8327ccc22884c009c274298fdd3fff700bdc3dc21a00639139836d442e7c01399ffbbc5bc1b66346958112c265988d29fb84493ef7e3c37406310952b03934e
b19fd8ffff1311690c6cc2179042e144ef3dffff0f4a11b8848ad29c09852299526f429f906ff37639562219d5b88c486403e60ffce89ffd75a894409043c8ea
299ce798cf19deffe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0102010201020102010201020102010200000000000000000000000000000000010201020102010201020102010201027071727374000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112111211121112111211121112111200030404040404040404040404040500111211121112111211121112111211127500000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102010201020102010201020102010200232424242424242424242424242500060707070707070707070707070707087700000078000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111211121112111211121112111211120000000607070707070707070800000016141414141414141414141414141418790000007a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112010201020102010201020102121100000016141414141414141418000000161414141414141414141414141414187b7c7d7e7f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102111211121112111211121112020100000016141414141414141418000000161414141414141414141414141414188081828384000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0607070707070707070707070707070800000026272727272727272728000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000262727272727272727272727272727280000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000111211121112111211121112111211120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000090a0b03040404040404040405090a0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000191a1b13141414141414141415191a1b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1614141414141414141414141414141800000000000000000000000000000000292a2b23242424242424242425292a2b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2627272727272727272727272727272800000000000000000000000000000000010201020102010201020102010201020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00 0c0d0a0b
00 0e0f1011
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

