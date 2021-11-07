pico-8 cartridge // http://www.pico-8.com
version 33
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


-- if debug then
--  -- debug mission for easy win 
--  mission_data[3][2]={2,1200,nil,2,3,144,200,1,144,152,nil,nil,nil,nil,nil,nil,8}
-- end

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
 mode = levelselect_mode

 -- if level end...
 if (mode==title_mode) init_title()
 if (mode==houseselect_mode) init_houseselect()
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
  -- load and initialise game cart
  if btnp(5) then   
   load_level(p_level)
  end

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
 --num=9
 
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
 reload(0x4300, 0x2000, 0x1000, mapfile)  -- read map data to user mem
 cstore(0x2000, 0x4300, 0x1000, game_cart)    -- write user mem to game map data

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
	 spr3d(8,24,123,20,cy,angle,1)
	else
	 spr(49, 3,38, 15,3)
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
 load_gfx_page(1)
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

 spr(0, 5,47,  4,4)
 spr(4, 47,47, 4,4)
 spr(8, 89,47, 4,4)
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
 -- play "intro" music
 music(6)
end

function draw_levelintro()
 cls() 
 print("\n(todo: level intro screen)",0,0,8)
 print("\n< press ❎ >",0,8)
 
 -- poss mentat eye code...
 -- https://twitter.com/p01/status/1414888619211476992

 -- poss layout ideas
 -- https://www.youtube.com/watch?v=7GQkBJe3MTc
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

function
    px9_decomp(x0,y0,src,vget,vset)

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
a980ffffff0ffffff0db12df9e07a24eb848ed00ce7b422c1048f124619f6222cef767809d024991e78921b84212124229429b84218384290fff9c148847810d
a43af7421bd29769c2b7c28956dc2b1799809ff111422c841c19c29f9ab01294eb5248b8f30b1ff3274700e021948f7448a81bb401178948cd90cffa24084830
ce008f37631ee1c6c7b9d69888ccffdc8840080629f5348f3695628bc44c662cfffe0082a0cefd0f75217544642c6c19098ffb13284c032fbe1c6b8e5c11d561
8426634e9858ffbd21903298fb1cf81980c3988c4c244ef77989001694e7d0fb2e0d4884612f842cfff21b021ff781efb2412e3094c118ffdd80c10658f39f3b
884439085b29cff071240f00fb2f76012d09c28089cffe4842c1c8f71cfb11500210b0ff7b8005600f768f1bc022234a7442ef7896f710f7e4066f7882cac22d
0944acffd9f9b0f311e908440ffff22cfa3d09f3809d2a9902c52ff77e769c47ce24039d78888184def7f5b9f70b4480f60450d38c2e81949ffdb88df44211c6
9d5984238a42d2264a19ffdb48f18097646042fc046844233f0fd42fff70cefb64c35201e80d2bcb529ffda7ac6d7e1e8b97c317496811409b20a421e0f0e5e1
0f0f331e90f70129f22c211e90329b47842944622f936294461944ef69ff94099f533f7d071fff772121fb62efa4cfff5090c0ff7bccf299fff311212cf399fb
21dccf42f1fffec0469ffdc44337b1adfa2ffb761ef743451f8696e3ffff08fff58f1442972792ffff880fbd0fb4834effff68fb2cff33cff44316cf81ef090f
ffd457b80fb948721d581758f50cff4f023120d1817523394322112480f4815622c39813acff0a98c2c4e4eb587a1c24021e061ed074830c3cff02cfffffffe1
fff7e9fc5fffffd0cffffffff3207ef0b7f8c19832864c390d4290d060c6942b80e70280fd42d720a671f42e07e13478f5cace02b8443a0702e62314a1a7cb0e
52242973cd1ee0fb4427429894a1c68acf0c8f2c404098894ec2421ff90e7113231c14074294e79094cb1a2fc5980e46510d94298320ef012a217e2461132361
a2f4863841ec4c91412c814e801e797424c42784ed44421950b01980917524429862294ef1e10006cf4123288c51c7298801b848010ff8484858f10c198a4726
d88f90d4421a89429848d2902d421842f42ef148f68e42948246838583794281608422462a2483e340e99039c798f15483a0b0b00c93119c02468501194c21f8
0122c53807290fb4808d087209c07f210c14e8428520858e124e780f358f17838e081fe198484ea4098a4c8c99422263c084c1c91efe074016d48f321e84290c
096290229f180948838fb3cfa12164a0a90f3c093429448022b48944422a2c31e92cf12f77874c068532ea1252c2942221121cf0229884c32d039fff52a27d14
223945c302144e94c2c28524398521944480e96074212f720cf34b03c10958c00108889422a2c84244e80f30ff30682cf0b42d062154625e3198429d29c626b0
8f32cfe8448580f50161c0e88099034e00d121eb40c34073f4098f9284c11e792cb94270120111471c12193a942162f42e62cf8c548b30e952914c2211209403
1810bf1214480001e102cf228a0e0090ff6222e04898c2218446472a2f748f8f5212943c700b944873852298520942d4cf1b425190f4024e784cf25140c249c0
18c280e4242c0b0703180fc3222298529c22932127522cf7c721acf00680441294e83211974216c0788420171948320908ff248d0701e4c1194c4432a2c11489
40784468802cf42744e3e94c4a0e80280f4032023c1421cf080b427c8cd52e8600327626b0002805a10240f0064ab8cf132b0448183f148b4652eb0704480309
0921d04642220224e7858884854e021e4ed199c7169000604206484205116270877868f73c700b0fe10c14080601e93509019b69422fb080ffb802045422fa80
311ed3048111cb19529731f48ff2cb48091ec5219809024923690b442cdcf01e0e780f0f727a012114401490807d2229cff062420f62ef80d728858b5a1c0704
4080b040616987694a98b24858b6901e5930115222fe100872208100101212431a4c8fd2128426909870854202b484c94298424208c1f0093002229c3478f171
88a802221d4270e3218f32c05121016c3508010f4248ff08a0442e89855888a88161ec62946080f0ffc039b840421f340262c1298d242048c011349f090519b6
0cd0c090ffb8191942b064e86011128484c87121404148fa03e7b0778d34442cd160498c21421e301124401880f2902c40f742ef80d02cf0852c060194212f22
09d05401eb08728120e852e92150a1909c8411175809322000fd287300c091e3ad06294042632834ee629c3c1b02944a98ba90f1204050411e64821e90084807
f119442216701c59842884cfb28f38fb87316880e7b8c516940029029cb28f18020ea0748f7284c4a940759874432064c22a21ed0884e832127600c0601616c8
f4259025e88c3f02c512d4222682a1983219c394e6c421130243c180fc2299834698483a80ea40c102b028311128634072b0b102ce007c0fc090f48484163287
b002932201780128d068f1050cb14833c4228731902c4ad02ce7109800b4c62e06cd5014811a58f5011cd2827d122234841944411246c342cf416141248f98c4
27f29c62ab406108c548844a20cb1e4ea2c8b3cf1042e781124a94e0404b02c0007329c7c1422d07c08f12091fe38428c480eb842942804e1e00f380e3e81426
4342cf42f3480209c070211248b84858b74ef1438b68074870cf580024c4c327c59422089048b7297934ec304e007f090f624467112674448044409422122d0f
d2909f924249f111e784844222832298520405c40698742d0e1e7b012c60107483687398520740111454e2429039589c681f721c05072f487f840463800d4409
3200d80c217524211903e3e4001a0c0fe10ea98321940971394e2122d0f900850c9c7420c0802c71ac334154848c10219c06022c4ec409429c190eb608d05689
8f99f09046981834230a12411031712833bdfff10dfffffffffff5c35e40ffffff0ffffff0df98d34705e1ada6f2928021f3d880c2a25ffd14093e114e2f3509
00fdff427d705f1879b21c5e8f8faf324c3e9bc5aebf18361eff302198cf23c018cfb42c121fdf449ffb091e7c06800eaff8c0908f3711cff6e02cfa40c44a7e
f31188d1c19cb8ab31b70cff5a0f4e37687412c1eafcf09c393f99c11b3abf6e37446950ff79a09b2c6927f02e853ce8344a19b6d766f7437580b677f46ed656
2cff740e62f637e3df5e79e84e8f1ee5116598c3964eca04eccf0c1dd93739e03fcff68c9f3c193ed3ef948dacf3ff87e5f6dc6552e8dd9d34d5bf362c336973
7d27c1feb95f9bbfb4630d46eff47ff09be8f7c7fcf17cb67df0f97ecf5e78f61e84274d4a2fe1f7cf19c1ffcf3b704e9cce783f27cf17fe79f121947cb9ac76
cff5c2ffdb7d3eb72f8cf0fbcdeee17df0a7f278464e019c19becceaf76fb429b3279c27c1eb9b4c5b96277054ceff374f9f1243bf7ef17cbfc77ebed7be79c7
32794cc1f9d1d3a7df074ee76f8d4e783cf1d7cebf27843329c1fff9f9e3ebf5ef8e1f3c174ebbcf2cf2cc1b321f995afaae993e8879737cd862dc17d374aa44
6f4cff74c557c564f9f7ecf1c37830b36bf3e583f176be8bc11ecd985f094f19e1e795fb7a9d57d7bc53cff40fc972fc16fc1796c31f7c3dd5b7f8bfabff96e1
37936df7678c5f62cf1f34e8bceab29faa976e1bc17c4222ffb97e1d7e9f387e893f074e854c32f9b452c59c691dbecf5cf1907e2bf1e8f50426447a46eff38b
a7c3fd7c1964e8b4ff858d7721eb79f1ef894a78e174483d8de7877bdf1f78ecdfb8369ba19a1ff3127d39b66e8934276878f14eb38d3094617c3b3f83d2bcf0
c37d34f7834f1c282eff34e954fc7f98382fa327fb7d11e23ceae37c67cf061e706f4b3e30fe0c6e45eff39bae0f4994ab52cc3d397c528936985eaf2cf12d36
f8bea02259019ff90bc34fa7e032866e70fc574edab442297f1be7707adef026fda4f9fcad2b090d52ef739f293f9d3bf167c2ae0752e51c2f429f452c1b846c
2c592630ead1ed410044ef7499dd75ea5f8f16b3edce9f18781bd6799846f8d6f4319789d23b34ef88b946dff3dd657deccef8f5cc9f8a3d8ca798954ee8df1b
3e275e951a906144eff298d5c3ebbe19f1e7838f0351ef8428b8338367d79f8f462c1d6cef736fc34a422807ce80122f3067c10fc28a451b9b46880932c58dff
4a427e72dee19ba18524a4e9c7bd6908024e89cc88db043f66ff399127c5eca8902b4f1013b98b6c39360479ca7509b2f74480398ffbce14661b46e84f9345a4
39094363e0698c339c194295bb6ec844c6cff7cc63c219796083294442ba180ac20c6098c2954bc426ffb22988cf412129802115940560c91c0c4c1cbc68fff4
0f84279f1421138f0c6998461a32238d30909f16780880ff7157c3fc57ef19df3fb858ceaf12bdf3e794ff1fdf3e87e78e5776a127c29ca9f7c717179df2f9de
9f2753194fb8cff36e78ca75a9ac79bf8f564a93afff7ea79c7fb8df31f7c1cf297fe3df0d8cf2dbe196858ce9b3bcc2cafa7e8acffb37f1f5e793e7c6e9ba57
d795ef1e842fffa4cf29f6fb48f52e5ea223f748f54eff5936ff0ff3be1f437b942f344fff51eff11e7ec77cf09cdfb8dffc26fb4ce719f97be5f78f7e78e3d7
e8ff1544e93ef1eff62ff38d77d7ff32efff06abff39efffd3eff51efffffffb8ff71fff7f8ff91fff7f6777f050751aa1efff1219ff58cfffffffffffffffff
ffb6707a30ffffff0ffffff0d7530aad946cefffffffffffff3278c119ffffe112f469fff7e6fe69cffff6198739cfff3f0f5cefffa3fd6befffbed642834e9a
4919ffffc39a32139d59e2f8ffffc19e1718c519defff672bc3e21228fff3feab2bcfff97e93eaa8ffffc2f3548cffff59fd20b8cfff559f319d4a9fffb994f7
f7a9cadffff8b50efe7c1abcfff141cff207832bcfffb4ed0f740668fff77a7c0758fde81cfffbb0f40c68ffc298ffff69970160efc2cfff5b0f18c0f7e10eff
fa171081ef5298fff362f3c0f7366efffb58d090f348f302ffffc821612148403cf17888fffb590401e22c0500e780fff7b2c2c11e0258090f3498fff356b20e
42492b0f12cfff136490901416c839fff761e6e248020efff221648683680042cd48fff75381e780280204879fff3682c13c710ff1fff7b2048301a40cf9cfff
d2ef80b12cf498adffffa4c909d110846c116259859fff78c5c1db29b8b6a0274a83efff417232c82e8c29ca95240ffffd21f483a07429e6c2110fff7e40a090
92c7c4a1eb21ffff92f0197002cbc817a0bffff7101eafeb4ec52e0464220bffff66748bf8f6987b294e840ffff925958c10a93e944e1e72efffa1ba1246950c
03e98cb51efff65601e2ac580480e0139dfff9a438b337081323024aadcfffda4cf1cf20021b48d4efff7d23590d0fb403c9d529fff351e947d4cf180146972e
32ffffa02d94a317721c4e04039cfffba4cf051e7008fe08dfffb21cf3cd13d8808027e42efff3529f7422fa7c1070095631fcfff7ad8f987d626b9429c89c1e
fff354e84d91087131461bffff53cf431ff420bd378ffff50e0971987948fff38cf5670f07024c1ffffd2cf301489029125dffff61e7a52925c6938843999fff
76cff209c016e8fff37cf4b54952224e19fff3cc484214809e2cfff33e7c4434467c6b522fff78794a1e95c699fff3c5b561a4858fff789a350ba42727c0ffff
57864070f9dfff14e64878f168ffffa50cfffff0c03effff762cfffbd090f759affffac3cf6842ffff33c30e7996298fff3b980873211221fff7c21f74229406
9875a31fff743c1980f65e11780ffffa23fb76e4e8320fff7a8fd09868b3d416ffff39382f64a32ffff370c1cf0bd1e80ffff31cf199a4739ffff61edd878f3c
1ffffe21ffc4c3c5901ec0fff7a832cf5c75858de1efffb1f30f7d068fff7b1e79060c8ffff71e414280f092124279fff751258f38f382f87efff6130fb4023e
7858ffff610f3d24932170742efff61768f2281707902eaffff6163cf2c51e0efffd58ff40890ef80ffff700b850ffffff0ffffff0df1604ac439ed3afffffff
fffffff21f073404699fff3bb4488d6204c2b859fff3a194231933c2a9a5bfff737d3e119367182757948894effff5d77e9c81e336f2ea66e8cefffed19feafe
4ec170a91fe391d58fffb7380dd0480f34c1699fff7767804862401e78c33146efffa97274021eba3b9f3ead62f8fffb690d0944e0184cf2ba8c0efffada2423
229c1c6b5ef0838dfff7b4396c24421901c172cf31dfff379865422b4240f756efffd98529d21229c080ef919fff3766c95bbab1fb53d8ffff628c2c12c233ff
1ffffe038d87614280b78f2cfffb39d2bc9d844c51964e3efffc556bceb3d59334506688c719fff37f88acf19a42e0efff7e18ba4e3e242e7819fff3715e361e
20945c698fa0ffffdea3e84ad2e12cce90f91efffcd01746ebc01936b8ca0e94cfffbb76bd2c5d08539d2739013a39dfffbbf6722533848097217231bc61efff
f5f83d12669529d2d8111e093834abe4effffddfe9d83e92d523147a6497694efffc9a42e233e2fcdf9e62dd2167f1127065efffb917c47bce62294547f9429c
92fff7e290eac3743c1f42bd11c79afff374e80230240c2e8f58fff374e80421042cf9e8fff376e8cec4a67c0ca200e3efffcd3f898f5241c8f69affff67d7b3
fb4c7c92ffce5efffa13907201a98f1a788fff369db2cb489e6b10eddbf8fff36ec5997348301e646efff7d3f464c2c5d6487e1eeb68ccfffd2bc5b7ee439b47
9936987563cfffdaa0d9862461e8fb219062efff69ce9442e027c1615bf211684dfff5b872c116becf2c354efff613c33014806b764e71b66efff61300422c1d
4b4a98b21282cfff532196739a06221754204d2efff81193c844a02cdc10bfff759836834e011ef884380ffffa211631d0b0f31002a8fff35942ca24122b9428
35219031cfff9a44812021182cd40c13f8fff352448d34046cf31c242421ffffa4644c2980b019f10c1f0f66efff51b0929002066f3802f4fa0bfffb56532930
190a42fa146901bfff36242f42f80d5890e6222370fff7d2b44a0122919b5c801cfffd3512824c42598bb24696efffb5b3a1c11b6293421fa809a4771454efff
e40024aa594331c5c5318b4228fff3311124b274325ea0f54069056d4cefffb00802c1cfe02a6b0044efffbc0248fea35b993257f1462210942fff76811ea35d
17c2bcc0fb50488cfff514225de46e8639521f7b01c25ffff482afe11f8832296798fb0486f8e2fff74e84229ba9722e8b2b3e8c26b9f32c5a7da9cffff85850
90c1ba76921ef72bd2ffff3e01178521b17c00ef8070837743ffff72c7c3cf3410eca5dfffb02c2840e70e79071f742efff444f82965172f78d1cf43bcfffb01
013950665936b8f32d7094cf31fcfff980127943df436f8cb91b3a17c1268f2c2cfff90a9b042d2876841ea49346b1e719fffb183788b846133be21924600c65
40fbce89fffb0422033df42278c3d58064689c82e71bffff011d4c0f06648b6811754c1be58c11cdafff73629f34842181d7093ea42458183211efff401e8280
74e84248320742ebc66781469e6cfffd8c593a0702e0bac7d8436147b97c494acfff90ce4246140142f19e093029d4040f98629421ffff1807032c0b4c7b043f
1b027f519629fff71eb74086844e0e97c669688cb8623ffff20b110a0b09367c659940b462ce1129b52affff24e20841601452bd2c01b440f7437d51cfff1844
8480a01e00f8dabee0350cf47c48ffdb1eb38052252178fe964646856bf9408ffbbcb3c18566427467c31b8443cf7740ef7fc0c8fce02986d0bc64219f15effe
48949f4462333e8529001e75effe4211ed72d70978679294616694bff93ef7e9748f23b480578c219882b4212c8fd29fef7f421b05980e04e4139543b8d22ffa
3ef7f122190194c3b0312198850c59095e7a0ff7fc6740019481231bc69401b4c92b4cf397cffdbe198884e0addb95834a094b4ff7099ffd304440ffffff0fff
fff0d7512c48cf72ffffffffffffffa17e099529dfff962cf0b52ffff99f7ab1ffff75a9a4835429ffffa245002cf0bc6ffff43384840cf139cffffc4c31acf2
28fff795e024312cf211cfff9c01182948fb4efff562e02e06f362efff1e191e11cf932fff7090e003e75bfff39100c4468cf3d0effff586012f52fc329cfff1
61702c12f0f45cef94dfffdbc2ce1758637c619f121fff703858b8321ff87efff0626c909489cf033ffffec0fb422cf498fffb744e70c8431fff769ff2119fff
3f14394efff0bcf33259f3ceffff18fd0cfffd5958f5a0fb4e0fffff0b76b9c7d0e7ae2cfffb31702439da19f39ffff76d02b688dfff96f467c3b7239995a2bb
29ffffa553c11298c79b29c8fffba2ea4269832312422c42e6bffff74a214a2984426fff77d121875a28ffffb229c31e31801efff9a4838d05e81efff9e6c13c
26d42281efff9ad30e0e01318339effff4e0054448f293efff1ac12b061e1e780ffff0958b09878f18fff78b387081e7bc5efff3a2a344294efff5b7ebc26b1c
61efff0b19d2a148080776efff2e21b9946127429b39befff4a5906936ca94ef84cfff7c07400b81ef998fffb8c1c69cc1129f349dfff9498cb11cf258fff786
03239059f98fff3952bb0cf658fff787408c4f7d64229cfff14a6110b8df546948cfff3cc440228fb4718429cfff3b58342d84e7bc480958fff76b1d89a0f791
a19c290efff753128891661e43478658ffff42b80846cab0833c1c185212fff7823129048110fe247833909fff34985f8a509c1d42f68fbe090fff7629862139
0b0fb81a1ef829cfff31101c3b016cd0efc29cffff8429844e2248f1872cf358ffff10c4c92f71828fb6f5cfffb8c0632832f9f9878f17eacfff909682f80327
3868f1bb76efff34506901298ffbeccfff902446c23f39cbcf7570ffbf9783c929686a52994ead1bd510ff5759ffbfe8066b090b52f830767f5f06904295efba
2ff7f761843e4cefb62922319a5cf82fff7020a3af36288198c80f3e2cffb3132788c7ff2a65aaba0f764ef7e1ea4cf9b447441c0f72ff7729a0742e72b0b10b
4842fff7b4e7760622329244efff5d481e7c901e0c2a1c4cf799ffb736078cf396848165121368fd2cffb3101eaccf38012484854efc4cff932802cf76914838
9c2cf7e0e8ff5f20efe40e22c3378fff74934844e7b72101093090e0efb4cffdb484cf594581850dc2966efc0ff37a344ee7c00600618423ffff984221907f23
d00c319858f7deffc46362856eb54090d08c0d0f762effed827c202f9348250879fff75a71ad557be03e80162c8522f7acffa9f1c054fb840c1c5bc11c8f39ff
f3016844423240719109d88cff02cff73c616f3407ad294079c104794ef7117cff99ac12159f0268a80109529ffb0ff3e9a372d42846b89c30423cfffbcec92c
0246c119c2cfffb3937bc90442154838458ffd880ffb5487ad7c98e25c8483804eff324fffb425dc9752c32b5a348068fff78ce872231e950e092b05bfff3878
40ffffff0ffffff0d3512c48ad7effffffffffffff1f9c26ffffdd8ac174be93e8fff7d64fe0675bfff7857e242c52942ffff63fc224622c542bdfff7531a907
08f096efff9a683300fd2dcffffc502790480f0942ffff2317f092c346d72ffff17708f12497033fff713e8f9002c7bba9fffb8cf64807029cfffb49fd211eff
fa6248fd839c6bcfff34ef5e49fff7858f1b4c1c6e2ffffec2cfa0ec9afff38cfa0a2de52efffd9cfd4716e0e9fffb70e75e0035743ddefffd12cf4146a2f4e9
ad8fff76cfbc3c1e956efffa182fb011c99843a9fff769978f38589c4c5c5c34aefff8586208b901988e540ad0fff7d22bb03c3345622834e9301d321fff7d80
6408be04c039c0244f81ffffa65098c1c14683692aef0564d3752fff7a6d20539e1a30134e919d202198dfffda7440d8884c22ea501e9900321b438ffff4862c
624e91bc1b56c22f30946dd33fff79407c8cc42594c29c5da9e3c6dca3cfff7a500ee4629093adfae8e1e9c11bfffb4944280eea42fc3dd72965a9b63efff15c
812c59bc631cc6c1bd37c7b4957bfff338328424e3dee274274275526193217e689b229cfff39703262f442797abfe233d2267627c9b554d19529fffb2852229
a4e3da042cdbe1e497e19a8fff7294845036dc842ea08f1f0b0fff7423ce108c6493842e7e64cfff11dc6c1273708ff1438ffff26fb3ff30c0ffff52cf42ff7a
9affff2d0eb07842cff6442efff9c121e102c619ff1552efff042eaa50601cff078ffff4008d4431fff048ffd383b01e803eff51fcfff10e78e06428170e0eff
21fcfff1807f21a948846e1242cff52fc1fff702183d899942260980ffb98cfff18001e345292f01eff22fff71e8018bebd8d88c0328ffb8cfff50a983b1239a
a3294cfff944983b6cc8d11efff76822c3d4399c29dfff35e80f6794e858ff19dfffb907e0b8cfff1d0f76441efff82fb78fff7a148f35eff66ffff022f7b94c
ffaa21ffff12cf711b52ff7a98fff30cd9868346eaff752efff00f7403351980ff7a93affbf0f80202c36c2cff944aef7f1e9070fb8cffb2e8ffd7874074016b
d7988c6ff7a42fff708073dc620409def7496efff4020ecd044e842fff946fff702cf419a03c1cfff7c609076ce021806cff5c3ffb7e190f463c18048022fff8
e18ff9311487ae0244848d128ffb42bfff70123c19422b4664291342cff423ffb7eec12364222b8858fff8dffe90f3463bcc31228fff429ffd340f7c85242844
043cfe116ffff02cb33872442c8ffb4c7fff7085836a978c6940940930cfff93ac17a50114422048d10ef67cffe9bb940300b84c0f1ff30399ffb37dc2d42842
20109f12cfa64ffff6c106b00b442c94300fff7e248520b11b4c52b0f08f1defff3c3211b88400b40974a44e1ef3bfffb019c090b5204482fb58f96d9ff93956
01280825a278cf3cf29def7f31902c5b4254864e746cfff59449b320012909520190fb01efff70d421eb44202b8c8b933150f58ff531142c52eec246349b9fb2
c5afff778e3b46cf6c7b4c31a6fff702bc2c5b4c36f72f984c398d168ff73f3429ffb07176834ef7d6f0f42eff3c53175852efff844eff31e3e462fffe05eff7
1e3e902429dffa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0102010201020102010201020102010200000000000000000000000000000000010201020102010201020102010201024041424344000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112111211121112111211121112111200030404040404040404040404040500111211121112111211121112111211124500000046000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102010201020102010201020102010200232424242424242424242424242500060707070707070707070707070707084700000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111211121112111211121112111211120000000607070707070707070800000016141414141414141414141414141418490000004a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112010201020102010201020102121100000016141414141414141418000000161414141414141414141414141414184b4c4d4e4f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102111211121112111211121112020100000016141414141414141418000000161414141414141414141414141414185051525354000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0607070707070707070707070707070800000026272727272727272728000000161414141414141414141414141414186061626364000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

