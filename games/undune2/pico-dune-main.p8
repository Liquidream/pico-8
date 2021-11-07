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
 mode = levelintro_mode
 --mode = levelselect_mode

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

 if p_fact<=1 then
  -- intro/atreides
  load_gfx_page(2)
 elseif p_fact==2 then
  -- ordos
  load_gfx_page(3)
 elseif p_fact==3 then
  -- harkonnen
  load_gfx_page(4)
 end

 -- play "intro" music
 music(6)
end

function draw_levelintro()
 
 

 if p_fact==0 then
  -- intro
  cls(3)
  pal({[0]=10,1,129,0,5,128,13,142,4,132,140,6},1) 
  spr(0, 0,40,  6,16)

 elseif p_fact==1 then
  -- atreides
  cls(5)
  pal({[0]=3,128,132,5,6,0,10,9,4,15,143,129,13,1,140,142},1) 
  spr(7, 0,40,  8,11)
 
 elseif p_fact==2 then
  -- ordos
  cls(1)
  pal({[0]=10,0,128,129,5,132,4,143,15,142,1,3,9},1) 
  spr(0, 0,40,  16,16)

 elseif p_fact==3 then
  -- harkonnen
  cls(9)
  rectfill(40,36,128,112,9)
  rect(40,36,128,112,3)
  ?[[with my guidance, you may be
able to assist us in conquering
this dusty, little planet.]],4,4
  pal({[0]=10,128,1,6,132,4,13,142,143,0,129,3},1) 
  spr(0, 0,40,  16,16)
 
 end 


 --print("\n(todo: level intro screen)",0,0,8)
 --print("\n< press ❎ >",0,8)
 
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
17422902f2629c5244a1e3100b0839f840810148f2497682a809093042291c04489c99029429321c7d00b1ac031f33f1218c213078460434822062e24000ee80
ffffff0fff7faf31c45809d16ae27bfff209488cffc237341469afff27f3d69dff76d8019d4202696ce0effa1e68aad6ffb8c26bd4cec044a74a174ff79afb5b
b422f7f2fc52dd1bf04556369ee858894ef75b329ffa78c12fcefd6ec7b492e3592cef0864f0f46ffb9c1f8c6fbe5beafc3df3f8deb71fe830dc616e02213d42
2cff46bde7fb6b3d3bcf9b0247501c52bc070096dadcff429c4e7ece27ceac2fb9e1a01a92189409c0531393cff2251b3bb9cd7422c23f79b274021eb7cb6394
40ce929bcff2c2d4bd72958f5e857cf69443c219340e8090985f3e866f41ff78c21321bdccf7938ccf4b70291194e06be62919fcce07cff269cc161668ffc16d
4efa521d8688422128eb4e70696eff16310231f3e11b5ef2e8a9446948009c0938da3ff397611068f57dd12cf3a6956b488423490b4ce2636fff990b86232cf5
7426bf9e81edae5dd6990e78ee89ff5c14632229e08d42ff8ef428c2c124333940927d26ff318c229740c3cacf11198f5038d8761461639669b2bcff3099b056
063228779cef90b5693b1998f22d9de895eff22b429c017402780ee32d0f74d6dcec7d5973454895846b72bcff4c8c5b940a22429842ebd2bf5e19439f325197
23832bcff522324295e3342130ec42ffc11652f171253ea6cafff0e9565329dabc1442b07acf34c9c2c5029a8dc66d484cff2699e21298d4c318422742acf47d
1742d61f01667119306fff816942fb06b540992cb1e726e8cc991227ca42780f4aef72a59ef2b3407c0c399b21ffc39d21ea60ca9c693d190936c846b4ff729c
4cc0a704d1b02270006e8fbea719a914248c3987932be4ef7414d220139cd2bc984275ef9e576e0133b42b5a13e7197be194e9e198cff726c81f83a1fc309c9c
3169c33b88e6e8f5eebfdec3757e8c6990e993ce0fcaa0270b4ef727838a44e1a6174ea52c1350fdac33eaf5c9ef28938bebf1ecee9a7495d3e7844a95de1ef7
1bce022e0a9c09e1fc7595f9b21a842e72d017d48b7bd2b7c1ec429ee131bff742bd5aa84e04f05c231017cf5d42b76e97a9d6e0fce8d17c6232976fff0dd66a
54422191d010beccf47409421801c3625c48f2cff3c2fd2b4c2945842948560f878cf24a90b420424648d3c3cff4426489523207dbdc1fe2f4524e613afb87c1
9eb94de8d0b1100c3b5e8ff98aa8c2783e87f83e4f5215b427831f3c3766ae792118c62c0a6cff1e2aa74a9e39ac1094c116808fbe9db59c7278c4e1d028ab9f
f1c178860d4a7081752c336f84afd8f1231b8c9088909a5a012dba1ff30119094259b010407c1932d3e78cf1f780fa48972596046294467d7e7f4b1dde8930c8
19520145ecfe71f3caccb9856c612543708d23ff30249f50046690d8e3f7c3fb854c2c5d648f4229ce9f10c1cf17ccfc0bc5128f360b0f0e8d7b8bd7ebeedf12
d8bc3bc81c6179c1bb2dfb5297e8acf28440932f4f88ef079cf174f66e0d48432f8170f462f021ffaa52f07466ee4a89c187e846bef04f94294e02707c32bce8
f21169bdff027c11902cf0007e40bf1e20ea07426d36968270f49d1f376bfc077c7a195040d7f59f122ec4c3902801c2f55292f9f3697e9fb39c5b0197d7e80e
3069e42fef230b19424b9e345a1b9c3927d409f9d978c6197d33ce8342b46bc83f71a34bb34aa8994c5159726448f53159580875c4095eaef53184aa6c225403
3762924f76ed4df392c27f9fb5690994e0934d039f23d01ef5fc1c395e521e1e7cd29323d0b421a99b40029cf2ef5e06e8187834462ebf1f844ca2941a2f4523
c9698489efc93493c016242930ba7ffc94031136980478ac3440f8f5ef57e14de0a8d19398c39ce88ff4025b78812360ec094e4b448ff50ff884e0485eccf89f
1234ec3c6984c244a1e185c270f3ceaf73bd7b63569a80974ffc09e0a436440cc187d0eae5746befbafe213129c0364ab0f329472697c4d407098351232fc29f
56f735e896a12ab3adbea429df96a1bae7d1d32c401eb045ece1cfdc12fc274a1e9d1a993dfb7cc2260a442709ab0db62ea328ff78c1c55fc3d5821894cfab72
887249834242bd44f5243d5ef71274698265d6f4e858fd27c08c736d539c52942a834484774771454e7f99649d1c4ffec20484df07944608c1c3520793228f38
719978938d59defb78ba21a597a192758f2b1c21e8d7fcb198f3cec6318fd48df7269014838fb36444040292e7d191fb9cf8d444019feaf5c1766e84ddf0299e
11029cf1cff66daf13c88c57e37c57df27c5747e0cf480224ef1e9c36129bcf470e3f7d12fb88e67c46a7832a1fcfe852231737be3cf2c4429f52b4298ebfcc3
7d1f4ec912a8fb0d486fdf6e59b2701e170e70ccb1bdcf11909ba9be05db2eafea32998f32c0ba3e9e4cd1ef8c4c0f6422446ef8c5295266f4cae2fd252cff42
bdf0ea78522960e8c38fc9d98f3a7c4642b9c1a97ec140f74830c9bf8f481a92357422807579b5cb2cdb428e8d5cfa2550ecab2e5d78f3659f424e884cb66994
e0218f18f52c5cf0b0f04e2201986098baa131e9b3e8309479be319b29cf1bb81f3de883833317c149fa1b47cef891f44299578193c18f1e8df3fc994e3ff46f
d329cc39b890c1c58067cb93217ee118d32a3f9ec3934ed48dedf7ce9ba49e71ae8f6e171009f32d83853bdce5322ec84c154c17c2392c52972b6fb3ef1bf693
c546f52f079e63fcf70f74e98db429862784b8412301424278f56f1795339c1c27878bc61eb0f112261af8d2a87ad0149cf01c80f8c19f34ec456745835eb622
9956bf4ec82428c38de02c53c84ef80cd7ce56742dcb93d1c67554b84c7c77561626f7c63f704292c4af06ffcf26e1a613074226fae942cf262740c13ef014b1
8074a212c114ea88f4fa7ce070429e6c3c11e12b32210719e3a193427ab771da0701f84d9dac22dea174258c792fc5690eac380ef0374438d4f5ce7880914014
67b47b532f808d404c21374e94f832b4836be8ebc21c3f3c7956d42f7868381168428be04e9c7868c9e075d6fc6f0ca1e9446f4cb9ac124a987df0f801434227
0fc374229d242783588cea7429862e13949c215632c84cf1f64809005858c17c1f834e0906611a70293c0319c3f44880693c3279c2194845213973fc0780092c
068a567c13a8862222289a3a93f8029209f529302e8c61b362095833519480a01e2e1f01dc1dbcc161225ea36d20b440ffffff0fff7faf704c0949d16ae2ff3c
123b4adfff3da21123ca6bdfffb69361686bcffff590c12819bab52ffff554f07080433c3dc6bfff7a950944280227e42ffff339c398e4c2c568fff7959780d4
8d840c513cfff9cc4c0ac6b7628316ffff233701f0542587198fff7874682c03901ee19fff38211708121841e6dfff395208d69a8098cbd0effff5042809f29b
e2946cfff951702c1271f45c2483378fffb7958d3eb0d6e9d221780f42effffd061e2e84c33c3eafff389917242166e03c333ffffec0fb422c8d0f46efffe119
f1032dc6e01cfffbc0ff5229841efff52ff40d429b8b8ffff719f764a260c5afffff40fb1023efff8ad2cf254ef897cffff3cead62f530cf0f8c31efffd98711
d46b6c21ea056cffff3584394b126e0406c5cfff14756fc31c699cc23574c79020ce0efff065d722148422feeb133b20cffff317521d52da01c224d294901dff
ff74a21ca290221b46e09fff39e190cb9001483441efff1a842f48388011248d4cfff149070b2c4e8128880fff7073e8167814211c2c3cfff54b70c189026904
6128ce8ffff9c10a8890f52fcfff3493461c51890740f00ffff0958b0d1aca1c1cfff3cd3c30c091e1014e3ffff151d1229c2f5782fff72d5f5617c6740c611e
fffda19d2a18d040211433fff71798dc42d09329c14e819fefff4a5906976ca9de80f42efff36832085c07578e4cfff54e06b46e94294ea70c14ffff4a44e5c2
6d028b070efff1a1c8c42464e1c089cfff9c29dc9388983248638fff787c04276c7f0540c1d95429fff3845320a9ca100c312b524efffd9d2b4c0221915eac1f
6214294efff9d2c129326113c2c5962948463efff9de0a13519c2c2c5b72a1dc690efff7531288922295694ea58ea1d67cfff729c808464326346eb94ac17442
12fff782b44ca18004444ec58e6c522909fff34b94a7d16146f439db3955ed7c61efffc421d46942758581f68325f3c184efff980800b62485ced1e80fb494ef
ff742b4c267cc442cf09834e7a2cffff0066079cf519368fb677cfffb8c06b994437bf929c1cf83f5efff40d05e18b9cd96e84cf8dd33ffff1a60942e84c4ef8
8dff266efff4012c599f72d3ed8cf6570ffbf9b83cf029e0b4b4239c3dd1dd512cf6d19ffbf21cc63212bc5683bede3c218462e7ba1ff7f761c2d8f107cf6784
2546223b0e7b43fff70258e8ef8902642232cf7dd8ff7f318a789cbff2a67079367c11f76ceffe16294c2cf4be7a32e4285cf71effe4231e0e7a5a1c6c009842
9fff756fff003174d67029defff4d481efbb26343b8dc1108ff23ff7f6c0e0bf7ad9481674342a4f7c0fffe001e2e7194101242c62e73398ff3740148ff42380
703958ffc1c1fffe08f75420711e99afff7498098cf7740404e0428fb33ff7f284c19873b3481850dc2966efc0ff376d3094afe76074c800b042b1f72fff6299
442cdbc435687261b1fbadffc716289d7d54099569046838f331ff7f64936109fc124794220cff5cef7fedb0d365d563c83248913698cf9e8ff5304150ffffff
0fff7faf3048c059d16aeef8395cefffbb15e83ae93e8fff7d64fe0675bfff7857e242c52942ffff63fc224622c542bdfff7531a90708f096efff9a683300fd2
dcffffc502790480f0942ffff2315f58d0960f095f9cfff7cd10847852ac3899fffb81a2d0240280fdeb6efff2211c749848309b2ffff23cb28622cfff5d480f
38c1c946b5efff121e61c3c92ffff0b4cf852e06379fff77618cf2c12837aefff0210f718a4b798fff7723ac99834ab0370fcfffd303908b245e003574fc36bf
ff770239c989099ac3e9c6cfff33e191600a2f0787699fffb60a30c118a4407622d86efff956e2c40010b4c462e1e2ec4e0fff7c2431a6cb488444f22e17d53e
fffa5467168768acccb4c1fd9e1af52efffa11c8007d1881a6693ec726a749fff75b304227070a9f2e8ded8f7e83fd3791787eb4efff4de83083cce834744812
b9354d1431942afff7be631a979425e1936ea3680b3240c31d475efff31a139b27ccec8f46747b9ec68338d62dc53fff79c08532c1adc463bc27d13d5271dc15
9325cfff7adc3066137024239d8ce2a7f140d7c57e195ffff2d1b8060c9fca94cebd1bb5295de8c3dc8fff7413a0bd2f4e2b49c429d22ddec7eb5e06ddefffc0
e802956cf397e8d9e93694eb3426193217e689f229cfff39703262709c7edeec73983e8567c3fc8c1ebda5fd3fc1b529fff32b06b884a6b7d5fd63a62970d83e
97d85f1934cfff394244280002ea4f95ce0c68d71768607858fff7114a850b8014639526027421efc64cfff980e17c3d32319ca934284c2220e7e62cfffb0e8d
1cf03c5801efb0281efff4051b074046285280f33bac1efff3083a318c320122622940ff587c42efff141af840312a21b6dcfdc57442efff0882c6a909069444
6bc0e7e0fc0ffff28356309099129ccff14890ffb797f3444e8522cff14ec8befff0c120c135e02b400790b52ef7217dfff18484858325a95884e1f19429cff1
219c5fcfff1840c8c1bea6994226480c4cfec64efff04058746d4392f01ef71906fff71ea8c4c37ea3be88de84264efe44c44efff20d480d7d2194daaabd6fb3
78dfff5032eb8183eb43942367c42f37828ffff05946b4283e27c33227c29d1ff711cfff90019848be174290bc29cff5426ffff18111594e1c16031ffb10ffff
121878f1e2922ff712b0ffff0e10e1e70942eff40efff2430c31e7031eff210cefff1c42f3b19ff217f4ca21fff70422b014801695cabcff34e8d11fff702cc0
511211c429d7fffa4cfff188c60431aa088d02ff7a97e8ffdf0310280626786612fff9784bef7f3c11e0ac4e01cff46842fcffe7864a428d615b7b2b942ff31b
669fff30488d51dd1ec7fc4c40936ff3a43fff702e84992b31510b3619ff50094ffff0429f164529e6b2e80ff70efff547221e194356111808842ff31fdffe30
1b8c12be138c4420401e7f44a71ef7e94648ebc1f802c858d528def6114e9effd948c4c1b461b423329c8a4323fb3146effd807038f06498363d84a954ef7217
cffe199b796d25f488942ffb9c2ffbf136f9503690902196294629ff21d116ff3f44871d3b19852119096480f7168e6edff970c2e8e32d3211421be211d56166
48cf4c72ffb7489c174e89954019810295e8421fbb7efff006b97a952410c6236217ca984cf812623ff779b6936dc68c2b032485ca211b52f719827cffc787e8
0c6202b4616278c732fb1ffff3622c218d8952e2184c388cf7affff1e9432611905b529121b4423b4ce942f31cef7ec62bc4422bb611990d806cd0ef9d13ffbf
a413980218681d55239df219f32bdffd100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

