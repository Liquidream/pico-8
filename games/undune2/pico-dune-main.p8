pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================

--game_cart = "pico-dune_fmt.p8"
game_cart = "pico-dune.p8"

-- music
-- 00 = title
-- 06 = intro/advisor/level lose?
-- 10 = level win
-- 12 = map screen

-- constants
debug=false

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
 {1,999,1000,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,20},
 {2,1200,2700,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,8},
 {3,1500,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,7},
 {4,1500,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,6},
 {5,1500,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,5},
 {6,1700,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,4},
 {7,2000,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,3},
 {8,2000,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,2},
 {9,2500,nil,1,1,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,1},
},
{ -- ordos missions
 {1,999,1000,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,20},
 {2,1200,2700,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,8},
 {3,1500,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,7},
 {4,1500,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,6},
 {5,1500,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,5},
 {6,1700,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,4},
 {7,2000,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,3},
 {8,2000,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,2},
 {9,2500,nil,1,2,nil,nil,0,nil,nil,nil,nil,nil,nil,nil,nil,1},
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
 {9,2500,nil,4,3,192,416,4,360,40,2,112,40,1,408,136,1},
}
}

if debug then
 -- debug mission for easy win 
 mission_data[3][2]={2,1200,nil,2,3,144,200,1,144,152,nil,nil,nil,nil,nil,nil,8}
end

-- mission data (harkonnen)
-- mission_data={
-- -- # |	Credits |	Target Cred |	Enemy Fact 1,2,3 |	AI Level
--  { 1,	999,	 1000,	1,1,1,   9 },	-- No enemy, just reach 1000 credits
--  { 2,	1200,	2700,	1,   8 },	  -- 2700 credits of spice, OR eliminate Atreides presence
--  { 3,	1500,	0,    2,   7	}, -- Eliminate enemy
--  { 4,	1500,	0,    2,   6	}, -- Eliminate enemy
--  { 5,	1500,	0,    1,   5 }, --	Eliminate enemy
--  { 6,	1700,	0,    2,   4 }, --	Eliminate enemy
--  { 7,	2000,	0,    1,   3 }, --	Eliminate enemy
--  { 8,	2000,	0,    2,   2 }, --	(Should be 1 or 2)
--  { 9,	2500,	0,    4,   1 }, --	Eliminate enemy
-- }



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
 --mode = levelselect_mode

 -- if level end...
 if (mode==title_mode) init_title()
 if (mode==levelend_mode) init_levelend()
 if (mode==levelselect_mode) init_levelselect()

 -- debug menu
 if debug then
  menuitem(1,"!reset cartdata!",function()
   for i=0,63 do
    dset(i,nil)
   end
  end)
 end

end


function _update60()

 if mode == title_mode then
  update_title()
  -- switch to house select
  if btnp(5) then
   mode = houseselect_mode
   init_houseselect()
  end 
 
 elseif mode == houseselect_mode then
  update_houseselect()
  -- switch to level intro
  if btnp(5) then
   mode = levelintro_mode
   -- play "intro" music
   music(6)
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
   mode = levelselect_mode
   init_levelselect()
   -- play "select" music
   music(12)
  end

elseif mode == levelselect_mode then
  update_levelselect()
  -- switch to level intro
  if btnp(5) then   
   -- play "intro/select" music
   mode = levelintro_mode
   music(6)
  end
  
 end

end


function _draw()
 --## don't clear here - as coroutines handle own drawing
 --cls()

 print("-main cart-",0,0,8)

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
 
 --num=8
 printh("in load_level("..num..")...")

 -- set player to faction
 p_fact = 3 -- (1=atreides, 2=ordos, 3-harkonen)
 p_col1 = faction_cols[p_fact][1]
 p_col2 = faction_cols[p_fact][2]

 local mdata = mission_data[p_fact][num]
 ai1_fact = mdata[8]
 ai2_fact = mdata[11]
 ai3_fact = mdata[14]

 -- mission_bases_data={
 --  { -- mission 1
 --   {p_fact3,p_col1,p_col2,11*8,9*8}, -- p_faction, p_col1, p_col2,x,y
 --   {1,12,ai1_fact,3*8,64},            -- "other" lone enemy soldiers
 --   {1,12,ai2_fact,20*8,64},           --
 --   {1,12,ai3_fact,20*8,19*8},         --
 --  },
 -- }
 --local mbases = mission_data[num]
 
 dset(0, num)
 dset(1, mdata[17]) -- ai level
  
 num_bases=mdata[4]
 dset(5, num_bases)

 dset(6, p_fact) -- p_faction
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
  if(t()\1%2==0)printo("press ❎ to start",30,78,7,3)
 end

 -- intro anim (crisp hd)
 -- https://www.youtube.com/watch?v=SJ436NYbyK8
 -- (use this one for intro captions...)
 -- https://www.youtube.com/watch?v=TqCDj0IRSTk
end

-->8
-- house selection screen

function init_houseselect()
 ui_cursor=1
end

function update_houseselect()
 if (btnp(0) and ui_cursor>1) ui_cursor-=1
 if (btnp(1) and ui_cursor<3) ui_cursor+=1
end

function draw_houseselect()
 cls()
 pal()
 print("\n(house select screen)",0,0,8)
 print("\n< press ❎ >",0,8)

 rectfill(5,47,35,78,1)
 rectfill(47,47,78,78,3)
 rectfill(90,47,121,78,2)
 
 houses={"aTREIDES","oRDOS","hARKONNEN"}
 for i=0,2 do
  local off=i*29+(i*5)
  local gap=i*8
  rectfill(2+off+gap,86,39+off+gap,92,9)
  rect(off+gap,84,41+off+gap,94,ui_cursor==i+1 and 7 or 0)
  ?houses[i+1],4+off+gap,87,0
  end
end


-->8
-- level intro screen

function init_levelintro()
 
end

function draw_levelintro()
 cls() 
 print("\n(level intro screen)",0,0,8)
 print("\n< press ❎ >",0,8)
 
 -- poss mentat eye code...
 -- https://twitter.com/p01/status/1414888619211476992

 -- poss layout ideas
 -- https://www.youtube.com/watch?v=7GQkBJe3MTc
end

-->8
-- level end screen

function init_levelend()
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
  -- init map region data
 rdata=split2d(spr_data,",","\n")
 
 -- define colour "filters"
 cols={
  [-1]={6,7,13},-- orig map
  [0]={0,0,0},  -- borderline
  {8,2,1,7,7},  -- harkonnen
  {12,1,0},     -- attreides
  {11,10,1},    -- ordos
  {5,2,0}     -- emperor
 }

 col_origmap=-1
 col_borderline=0
 col_harkonnen=1
 col_attreides=2
 col_ordos=3
 col_emperor=4

 messagetext1=""
 messagetext2=""
 msg_ypos=0
 _t=0

 -- init anim sequence
 seq_cor=cocreate(play_sequence)
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

function sprint(str,x,y,col,scol)
 print(str, x, y+1, scol or 2)
 print(str, x, y,    col or 7)
end

function draw_bar(x,y,max_w,val,max_val,col)
 if (val <=0) return 
 local w=mid(0,val/max_val*max_w,max_w) 
 rectfill(x+1,y+1,x+w+1,y+4,2)
 rectfill(x,y,x+w,y+3,col)
end

function play_sequence(seqnum)
 printh("seqnum = "..seqnum)
 -- play scripted animated sequence
 -- (typically, one for each level) 

 -- "paint" blank map
 cls()
 pal()
 pal(1,6)
 pal(2,7)
 pal(3,13)
 --spr(0,0,0,16,16) 
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
  setmap(0, cols[col_borderline])
 end

 if seqnum == 1 then
  -- intro anim?

 elseif seqnum == 2 then
  -- first map sequence
  cleartext()  
  wait(20)    
  show_message("tHREE hOUSES HAVE\nCOME TO dUNE.") 
  show_message("tHE LAND HAS\nBECOME DIVIDED.")   
  fizzlemap(0,  cols[col_borderline])
  cleartext()
  show_message("hARKONNEN ARRIVED\nFIRST.")
  fizzlemap(6,  cols[col_harkonnen])
  fizzlemap(5,  cols[col_harkonnen])
  fizzlemap(4,  cols[col_harkonnen])
  fizzlemap(10, cols[col_harkonnen])
  fizzlemap(3,  cols[col_harkonnen])
  fizzlemap(9,  cols[col_harkonnen])
  cleartext()
  show_message("tHE WEAK aTREIDES\nWILL BE EASY.")
  fizzlemap(13, cols[col_attreides])
  fizzlemap(7,  cols[col_attreides])
  fizzlemap(20, cols[col_attreides])
  fizzlemap(14, cols[col_attreides])
  fizzlemap(21, cols[col_attreides]) 
  fizzlemap(22, cols[col_attreides])
  cleartext()
  show_message("tHE oRDOS ARE\nGETTING CLOSER.")
  fizzlemap(19, cols[col_ordos])
  fizzlemap(27, cols[col_ordos])
  fizzlemap(26, cols[col_ordos])
  fizzlemap(25, cols[col_ordos])
  fizzlemap(24, cols[col_ordos])
  fizzlemap(23, cols[col_ordos])
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(2, cols[col_harkonnen])
   wait(20)
   setmap(2, cols[col_origmap])
   wait(20)
  end

 elseif seqnum == 3 then
  setmap({6,5,4,10,3,9}, cols[col_harkonnen])
  setmap({13,7,20,14,21,22}, cols[col_attreides])
  setmap({19,27,26,25,24,23}, cols[col_ordos])
  show_message("hARKONNEN SPREAD\nOUT STRONG FORCES.")
  fizzlemap(2,  cols[col_harkonnen])
  fizzlemap(1,  cols[col_harkonnen])
  fizzlemap(8,  cols[col_harkonnen])
  show_message("aTREIDES WENT\nAFTER oRDOS.")
  fizzlemap(15, cols[col_attreides])
  fizzlemap(16, cols[col_attreides])
  fizzlemap(23, cols[col_attreides])
  show_message("oRDOS STOLE EVEN\nMORE LAND.")
  fizzlemap(17, cols[col_ordos])
  fizzlemap(11, cols[col_ordos])
  fizzlemap(18, cols[col_ordos])
  fizzlemap(12, cols[col_ordos])
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(11, cols[col_harkonnen])
   wait(20)
   setmap(11, cols[col_ordos])
   wait(20)
  end
 
 elseif seqnum == 4 then
   setmap({6,5,4,10,3,9,2,1,8}, cols[col_harkonnen])
   setmap({13,7,20,14,21,22,15,16,23}, cols[col_attreides])
   setmap({19,27,26,25,24,17,11,18,12}, cols[col_ordos])
   show_message("oRDOS DID NOT\nSTAND A CHANCE.")
   fizzlemap(17,  cols[col_harkonnen])
   fizzlemap(11,  cols[col_harkonnen])
   fizzlemap(12,  cols[col_harkonnen])
   show_message("aTREIDES AND oRDOS\nTRADED LAND.")
   fizzlemap(24, cols[col_attreides])
   fizzlemap(16, cols[col_ordos])     
   show_message("pRESS ❎ tO sTART")
   while true do
    setmap(18, cols[col_harkonnen])
    wait(20)
    setmap(18, cols[col_ordos])
    wait(20)
   end

 elseif seqnum == 5 then
  setmap({6,5,4,10,3,9,2,1,8,17,11,12}, cols[col_harkonnen])
  setmap({13,7,20,14,21,22,15,23,24}, cols[col_attreides])
  setmap({19,27,26,25,18,16}, cols[col_ordos])
  fizzlemap(25,  cols[col_harkonnen])
  show_message("aN oRDOS OUTPOST\nWAS SURROUNDED.")
  fizzlemap(18,  cols[col_harkonnen])
  fizzlemap(19,  cols[col_harkonnen])
  show_message("tHE oRDOS BROKE\nTHROUGH aTREIDES.")
  fizzlemap(24, cols[col_ordos])
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(7, cols[col_harkonnen])
   wait(20)
   setmap(7, cols[col_attreides])
   wait(20)
  end

 elseif seqnum == 6 then
  setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19}, cols[col_harkonnen])
  setmap({13,7,20,14,21,22,15,23}, cols[col_attreides])
  setmap({27,26,16,24}, cols[col_ordos])
  show_message("sOON tHE aTREIDES\nWILL BE EXTINCT.")
  fizzlemap(7,  cols[col_harkonnen])
  fizzlemap(14,  cols[col_harkonnen])
  fizzlemap(13,  cols[col_harkonnen])
  fizzlemap(23, cols[col_ordos])
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(26, cols[col_harkonnen])
   wait(20)
   setmap(26, cols[col_ordos])
   wait(20)
  end

 elseif seqnum == 7 then
  setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13}, cols[col_harkonnen])
  setmap({20,21,22,15}, cols[col_attreides])
  setmap({27,26,16,24,23}, cols[col_ordos])
  show_message("hARKONNEN CRUSHED\nMOST OF THE oRDOS.")
  fizzlemap(24,  cols[col_harkonnen])
  fizzlemap(26,  cols[col_harkonnen])
  fizzlemap(27,  cols[col_harkonnen])
  show_message("aTREIDES RECLAIMED\nITS LAND.")
  fizzlemap(23, cols[col_attreides])
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(21, cols[col_harkonnen])
   wait(20)
   setmap(21, cols[col_attreides])
   wait(20)
  end

 elseif seqnum == 8 then
  setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27}, cols[col_harkonnen])
  setmap({20,21,22,15,23}, cols[col_attreides])
  setmap({16}, cols[col_ordos])
  show_message("hARKONNEN CRUSHED\nTHE aTREIDES.")
  fizzlemap(20,  cols[col_harkonnen])
  fizzlemap(21,  cols[col_harkonnen])
  fizzlemap(22,  cols[col_harkonnen])     
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(16, cols[col_harkonnen])
   wait(20)
   setmap(16, cols[col_ordos])
   wait(20)
  end

 elseif seqnum == 9 then
  setmap({6,5,4,10,3,9,2,1,8,17,11,12,25,18,19,7,14,13,24,26,27,20,21,22}, cols[col_harkonnen])
  setmap({15,23}, cols[col_attreides])
  setmap({16}, cols[col_ordos])
  show_message("oNLY THE hARKONNEN\nWILL PREVAIL.")
  fizzlemap(16,  cols[col_harkonnen])
  fizzlemap(23,  cols[col_harkonnen])
  fizzlemap(15,  cols[col_emperor])     
  show_message("pRESS ❎ tO sTART")
  while true do
   setmap(15, cols[col_harkonnen])
   wait(20)
   setmap(15, cols[col_emperor])
   wait(20)
  end

 end
end

function show_message(msg)
 messagetext2=messagetext1
 messagetext1=msg
 msg_ypos=80
 clip(27,99,75,18)
 for i=1,75 do
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
 rectfill(27,99,101,118,9)
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

__gfx__
000000009eee99999e9e9e9e9e9fffffffffffffffffffe99e999999ee99e9999999999999e999f9eeeeeeeee9f999ee00000000000000000000000000000000
00000000e9e99999ee9ee9e9e99999ff9999999999999f4ee9fff999e99eee9eee9fffe9999ef9eeee999999eeef99e900000000000000000000000000000000
007007009e9eee9eeeee9eeef9f444444444444444449ff49fff949effffffffeefff949999fee999999999999eeefe900000000000000000000000000000000
00077000e9e9eeee999e99eeff449999999999999999f9f49ff994ef999999999eff99499999e99999999999999eee9e00000000000000000000000000000000
00077000e999ee999999ee9eff49999999999999999999f49ff9f4994444444499ff9f49e9fe9999999999999f99ee9e00000000000000000000000000000000
0070070099e99ee9e999e9ee9f49999999999999999999f49944499999999999999444e9994999999f9eeeef9999ff4900000000000000000000000000000000
00000000eeee999e999e9eee9f49999999999999999999f49eeee999999999999999fee994e999999f944e9ff9ee9fee00000000000000000000000000000000
00000000e9e999e9eeeee9e99f49999999999999999999f499e99999999999999999f4e9fe99e4ee9999ee9999e4e99400000000000000000000000000000000
000000009e9e999e9e999eee9f49999999999999999999f49e9f4999000000009999f4eefee444ee9ee9f99eeeee44e400000000000000000000000000000000
0000000099e9e9e9e9999e999f49999999999999999999f4e99f4999000000009999f49e4ee994e44e99999944e4994e00000000000000000000000000000000
000000009eeeee9eee9999999f49999999999999999999f49e9f4999000000009999f4994eeef9444e999e9e444ef94e00000000000000000000000000000000
000000009e9eee99eee999999f49999999999999999999f4e99f4999000000009999f4e9eeeef9449ee9e994e44e9ee400000000000000000000000000000000
00000000ee999e9e9e99999e9f49999999999999999999f4e99f4999000000009999f49ee4499e44ee4eee44e44499e400000000000000000000000000000000
00000000eee9eee9e999e9ee9f49999999999999999999f4999f4999000000009999f4eeee4ee4e4994e9e4e9e44ee4400000000000000000000000000000000
00000000ee9e9e9e9eeeeeee9f49999999999999999999f4ee9f4999000000009999f4eeeee444eeee4e9e44e4ee444e00000000000000000000000000000000
00000000e9eee9e9e9eeee999f49999999999999999999f4e99f4999000000009999f4e9f99eeeee4ee999ee44e9eee900000000000000000000000000000000
0000000000000000000000009f49999999999999999999f49e9fe999999999999999fee99e99999e4499fe9e4499999900000000000000000000000000000000
0000000000000000000000009f49999999999999999999f499e9e9999999999999999e999e99999ee49e9e944e99999900000000000000000000000000000000
0000000000000000000000009f49999999999999999999f49efff99999999999999fff9999e99999ee9eee944e99999f00000000000000000000000000000000
0000000000000000000000009f49999999999999999999f49fff94eeffffffffeefff94999f99999ee499ee4ee99999e00000000000000000000000000000000
00000000000000000000000099ff9999999999999999fff49ff99499999999999eff99499e9999999ee4ee44e999999e00000000000000000000000000000000
000000000000000000000000949ffffffffffffffffff9949ff9f4e944444444e9ff9f499eef999999ee444e99999fe900000000000000000000000000000000
0000000000000000000000009e99999999999999fff999449e444e9eee9e9e9e9ee444ee999ef99999999999999994ee00000000000000000000000000000000
000000000000000000000000ee444444444444444444444999999999e9eee9e9999999e99999eef99999999999f9ee9900000000000000000000000000000000
00000000000000088888000008880000000000008888888888000008888800000888008883000000888088888888888800000008888888008888888000000000
00000000000000008880000000800000000000000888000588800000888000000080000888300000080005888500008850000000588850000588850000000000
00000000000000008880000000800000000000000888000008880000888000000080000888830000080000888000000880000000088800000088800000000000
00000000000000008880000000800000000000000888000005888000888000000080000888883000080000888000000080000000088800000088800000000000
00000000000000008880000000800888005500000888000000888000888000000080000888888300080000888000080080000000088800000088800000000000
00000000000000008880000000800088088880000888000000888500888000000080000858888830080000888000080000000000088800000088800000000000
00000000000000008880000000800088800885000888000000888800888000000080000805888883080000888000880000045400088800000088800000000000
00000000000000008880000000800088500588000888000000888800888000000080000800588888380000888888880000058500088800000088800000000000
00000000000000008880000000800088000088000888000000888800888000000080000800058888880000888005880000045400088800000088800000000000
00000000000000008880000000800088000088000888000000888500888000000080000800005888880000888000580000000000088800000088800000000000
00000000000000008880000000800088000088000888000000888000888000000080000800000588880000888000080080000000088800000088800000000000
00000000000000005880000000800088000088000888000005885000588000000080000800000058880000888000000080000000088800000088800000000000
00000000000000000884000008500088000088000888000008880000088400000850000800000005880000888000000880000000088800000088800000000000
00000000000000000588500058000388300388300888000588500000058850005800005850000000580005888500008850000000588850000588850000000000
00000000000000000005888880000888800888808888888885000000000588888000088888000000080088888888888800000008888888008888888000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888880
00000000444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111123111111211111121131211111113112312221111121121221111321113122111111111111122211211111111123111112121211111
00000000111111121111111111112211111211111111111111113113311112123221111112311121131111111111112213211111112111112212112231121321
00000000112111111111111211111111111121111111111111111331321311112112121111321111111111111111113311111111111211112222331112112232
00000000121111311111111111111111111211111111111111113211311322111111212113222111111111111111212231111111111231112233221111212132
00000000111112112211111231112111111222111111111111112233121222111111231112312131222211112111213321111211111112111321111111111133
00000000121121121111112132112111112111111111111111111221213123111111111233322122111112232222322131111211111111221311311111211121
00000000111111121111111121222211111111111111111111121112232222111111112121332112332211333111111211111111111111111211111211112111
00000000112211111131111121222121111312111111111111111112233211121111121133332112132212211111321112231111111211111111111111112121
00000000211111123111211221111221111111111211111111113211122221121221131113323111132121111111322131221111111121123111111111211111
00000000111111111121111112121111211112112111111111112322222231231221211111232233133211111111112121121111111211121111111111111211
00000000111112111211111212111111112113111211111111111123223321321321232121231232133212111112321111111111111121111111111111111121
00000000111111111111212121221111122112111111111111113221333331222313123111123122213112311111121113311211111111111111112111111111
00000000111111111211111122211111331111111111111112112233332231222122321331122312123122111111111111111111111111111111111211111111
00000000111111121112111122221211232111111111111121111212312221332121211321232211111123211111112111111121211111111111111111111111
00000000111111111211111112212221121113121111111122111123122132122211112211221323121313211111113111131131111111111111111111111111
00000000111111111112111112212221112312113211111312131332322112122212112221221232311223211113221112311131111112121111113221111111
00000000111111122111111111111111111111113221111111231221221112211221112211131112113213211111222111211121211111111111111111111111
00000000111111111122221121211111111111113321111211323321311112211211111111111211133133321111121111321111111111111111211111111111
00000000111111112221111111222211111111121111111222311131221111222112221212111112111121111111113113121212111111111111111111121131
00000000111111112112111111211111111111111121211111111111321121121112231232111111311332311111123313111112111111211111111111111111
00000000111111111112111111222211111111111112111111113211112232311112221123221111312321321111322311323211122112121111111221121111
00000000111331111121111111221112111111111111111111111111311121131211232233212211211111121111232211212111111111111211111111121111
00000000113112111122111111221221211112311311111111111311321113131121111123111131111111111111113211211121131313221111111111111311
00000000111112212212211112112111112121111211121121121321132111131311111111111211121111111232122131123111213133212111111113111111
00000000111111111212211112222111111111111111111211111312133121212131111112321111223131111111122321232211111232211111112111112211
00000000111111111122221112121111112221111111111213123331111111222122111112111211113132213231111113311131111111111111111122221113
00000000111111121111221111121111121121121111111121122211333311123211111111111111121121113231111211111111111112131111112112211212
00000000131111221122111112221111111111222112111221212111123311132211111111111112111112111122222221111111111211311111111121121231
00000000121111121221111221122111211121322112211111121213321111132311111111111122111331112133333311121111111111111111111112121213
00000000111112112122112122122211111121111132211111221111131111133111111111112111111311111111111111111111111121111111112211212113
00000000112123111221112112112112111111123212312111111111113211122111111111111122111111111111111111111111111111111211211312211113
00000000113111111222112112112111212111211111131111111111113311121111111111121111111211111111111111111111211111111111211112111213
00000000132221222222122122222111211111211131112111211111111111111111111111112111111211111111111121111111111111111111111111111121
00000000313323211222121112212211112111111113121311111111111111111111111111112211311111111111112111111111111112111113131211112111
00000000131111211121111112222111222111121131122211113111111123111112111111111211111121111111133113111111111111111112112112321211
00000000122121122111111122211112211112221111111121112111131121211111111111111111111111311311233311121111111221131221112113221122
00000000111333222111221111111122112111212122111312111111111111221111111111111111111113211313321111111211111231111321211312211111
00000000131222221212111221112211111111122111221111221111111311211111111111111111111332112111313111111221111122111112313111311131
00000000132211121112121221112111111111111111122111231111111111222111311111111111113331313331221111131111311313111311113131111113
00000000112113221112121212112111111111112211212221111111111111111111111111111111212221111321112112111111131232322133321121311111
00000000112121212121111112122211111111121211211111111111111111111211111111111121111213121112111111111111222122211113111331122212
00000000111113121112112112112211111111111121121111331111111111111121111111111111121111122211111111111111223322313313331221211222
00000000112111121211111121121211111111121111111112221211122111111331111111312111132211312332223211111221113232321121111112111221
00000000312121211221211211112211111111111111313111131321111311113323111111111111111111322222222211111232111111311113111111112211
00000000112221221212211111112221111111111112113111111111111112113323311311111111111121231121112111121331132312111332111111111111
00000000111121111111111111112221111111111112111111111111121121111311111111111111111111221121112211123331122112311322111111111221
00000000111111122122111111112111111211111111111111112113111131111122111111112131111111222112211223332332113131213321211111132211
00000000121122112211121121111211112122111111111333123111111131111112111111211311111111121113221222213223111132133222311111121211
00000000111232221112112211111121111112121111111123122311111111112112211111221233111111122111212212223123122111332213211111211212
00000000211221221121112221111211211111122111111113211211111112111211121211112211111111122112112222331323233112232121111112211122
00000000222212211211111111111121121111111111211112113111111111111333311131111211112121121111212123323322333212232211111112211222
00000000212111222111112221111122111111111111111121133111111111111113311111111111322111122111111223222333232122212221111112111211
00000000111111121111211212111211111111111111111112212311111111111123122213111112222111112122111123123222212122112211111111111222
00000000111111122121211111111111111211111111111111211131111111111111323321111111222111221112111112222122221222111111111111112132
00000000111111222111111211111121221111111111111211311111111111111212322232213113221123321222112111111111221222221111111111112321
00000000111111212121111111112111211111111111111111111111111111121112112232221111221222122111111222222221112222211111111111112231
00000000111111211221111111121111211111211111112211111111111111121122122123322131221222222222312123223322221122111111111111123222
00000000111111111111111121221112112111111111111221112111111111123121211221312313221131223322322133123333321111111211111111132221
00000000111111112111211111221112112111111111111112111111111111133122221112223331221232332222222123333222211111111211212111122211
00000000111111111211122211112121121111111211111122111111111113221111221112121231121112222222221133332333211121111111122111111111
00000000111111111211221211112221121111111111111121111111111131211122111211222113122212232323321323223222111111111211322122211112
00000000111111111222111121111121221211111111111211211111111211111113222211111111111112223333212322332332111111111112222122221122
00000000111111111111211211211212221111111111211111211111121111112213233111222121211122222322112233323221111111111311222233313231
00000000121221111212122111112112111111111111111111111111121111112222333111121111212222223332122333332222111112212211221132332233
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
0102010201020102010201020102010200000000000000000000000000000000010201020102010201020102010201020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112111211121112111211121112111200030404040404040404040404040500111211121112111211121112111211120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102010201020102010201020102010200232424242424242424242424242500060707070707070707070707070707080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112111211121112111211121112111200000006070707070707070708000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112010201020102010201020102121100000016141414141414141418000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102111211121112111211121112020100000016141414141414141418000000161414141414141414141414141414180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

