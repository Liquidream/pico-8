pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
target={
 faction=3,
 col1=8,
 col2=2,
 owner=2
}

self={
 faction=2,
 col1=10,
 col2=3,
 owner=1
}

-->8
cls()
?target.faction

----v1_a (33 tokens)
--target.old_faction,
--target.old_owner,
--target.old_col1,
--target.old_col2,
--target.faction,
--target.owner,
--target.col1,
--target.col2
--=
--target.faction,
--target.owner,
--target.col1,
--target.col2,
--self.faction,
--self.owner,
--self.col1,
--self.col2
--
--?target.faction
--
----v1_b (20 tokens)
--target.old_faction,
--target.faction,
--target.owner,
--target.col1,
--target.col2
--=
--nil,
--target.old_faction,
--target.old_owner,
--target.old_col1,
--target.old_col2

--v2_a (28 tokens)
target.old_fact_data,
target.faction,
target.owner,
target.col1,
target.col2
=
{target.faction,
target.owner,
target.col1,
target.col2},
self.faction,
self.owner,
self.col1,
self.col2

?target.faction

--v1_b (16 tokens)
target.old_fact_data,
target.faction,
target.owner,
target.col1,
target.col2
=
nil,
unpack(target.old_fact_data)

?""
?target.faction
?target.owner
?target.col1
?target.col2
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
