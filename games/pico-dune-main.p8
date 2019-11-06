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
--### do this in main cart, pre-game!
--faction_cols={12,1,  11,3,  8,2}
--faction_cols[plr_faction*2], faction_cols[plr_faction*2-1]

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

 -- set player to atreides
 -- dset(1, 1)
 -- dset(2, 12)
 -- dset(3, 1)
 
 -- set player to ordos
 -- dset(1, 2)
 -- dset(2, 11)
 -- dset(3, 3)

 -- set player to harkonnen
 dset(1, 3) -- p_faction
 dset(2, 8) -- p_col1
 dset(3, 2) -- p_col2
 dset(4, 3990) -- p_credits

 -- set ai to atreides
 dset(10, 1) -- ai_faction
 dset(11,12) -- ai_col1
 dset(12, 1) -- ai_col2
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
