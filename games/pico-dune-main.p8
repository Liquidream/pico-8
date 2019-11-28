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



function _init()
 cartdata("pn_undune2")


end

function _draw()
 cls()
 print("-main cart-")
 print("\n< press ❎ to start game >")
end

function _update60()
 -- test loading of game cart
 if btnp(5) then
  load_level(1)
 end
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

 -- set ai to atreides
 ai_fact = 1
 dset(10, ai_fact) -- ai_faction
 dset(11, faction_cols[ai_fact][1]) -- ai_col1
 dset(12, faction_cols[ai_fact][2]) -- ai_col2
 dset(13, 5) -- ai_level
 

 load("pico-dune")
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
