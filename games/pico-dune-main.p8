pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- undune ii
-- by paul nicholas
-- (with support from my patrons)

-- =======================================
-- main cart (title menu, level select)
-- =======================================

-- constants
faction_cols = {
 { 12, 1}, -- Atreides
 { 11, 3}, -- Ordos
 { 8,  2}, -- Harkonnen
 { 14, 2}, -- Emperor?
}

-- cart modes
title_mode=1
levelselect_mode=2
levelend_mode=3

-- mission data (harkonnen)
mission_data={
-- #,	Credits,	Obj. Credits,	Obj. Enemy,	Enemy Type
 { 1,	999,	 1000,	nil },	-- No enemy, just reach 1000 credits
 { 2,	1200,	2700,	1 },	  -- 2700 credits of spice, OR eliminate Atreides presence
 { 3,	1500,	0,    2	}, -- Eliminate enemy
 { 4,	1500,	0,    2	}, -- Eliminate enemy
 { 5,	1500,	0,    1 }, --	Eliminate enemy
 { 6,	1700,	0,    2 }, --	Eliminate enemy
 { 7,	2000,	0,    1 }, --	Eliminate enemy
 { 8,	2000,	0,    2 }, --	(Should be 1 or 2)
 { 9,	2500,	0,    4 }, --	Eliminate enemy
}

-- vars
mode = title_mode


-- title vars

-- level-end vars
endstate = 0


function _init()
 cartdata("pn_undune2")

 load_data()
end

function _draw()
 cls()
 print("-main cart-")

 if mode == title_mode then
  print("\n(title screen)")
  print("\n< press ❎ to start game >")
 
 elseif mode == levelselect_mode then
  print("\n(level select screen)")
  print("\n< press ❎ to choose level >")
 
 elseif mode == levelend_mode then
  print("\n(level end screen)")
  print("\n< press ❎ to continue >")
 
 end 

end

function _update60()

 
 if mode == title_mode then
  -- switch to level select
  if btnp(5) then
   mode = levelselect_mode
  end 
 
 elseif mode == levelselect_mode then
  -- load and initialise game cart
  if btnp(5) then
   load_level(p_level)  --1
  end

 elseif mode == levelend_mode then
  -- switch to level select
  if btnp(5) then
   p_level += 1
   --printh("p_level = "..p_level)
   dset(0, p_level)
   mode = levelselect_mode
  end

  
 end
 

 


end

function load_data()
 -- load saved data to determine current "state"
 p_level = max(1, dget(0))
 printh("p_level = "..tostr(p_level))
 endstate = dget(14)  -- (0=none, 1=credit target, 2=enemy defeated, 3=player lost)
 printh("endstate = "..tostr(endstate))
 if (endstate>0) mode=levelend_mode

end

function load_level(num)
 printh("in load_level("..num..")...")

 -- set player to harkonnen
 p_fact = 3
 dset(1, p_fact3) -- p_faction
 dset(2, faction_cols[p_fact][1]) -- p_col1
 dset(3, faction_cols[p_fact][2]) -- p_col2

 dset(6, 999) -- starting credits
 dset(7, 1000) -- target credits
 dset(10, 0) -- harvested
 dset(11, 0) -- units destroyed
 dset(12, 0) -- buildings destroyed
 dset(13, 0) -- playing time

 -- set ai to atreides
 ai_fact = 1
 dset(20, ai_fact) -- ai_faction
 dset(21, faction_cols[ai_fact][1]) -- ai_col1
 dset(22, faction_cols[ai_fact][2]) -- ai_col2
 
 dset(23, 5) -- ai level
 dset(24, 0) -- ai harvested
 dset(25, 0) -- ai units destroyed
 dset(26, 0) -- ai buildings destroyed
 

 load("pico-dune")
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
