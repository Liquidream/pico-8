pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--auto tile test v3
--by bigaston

poke(0x5f2d, 1) -- initiate mouse listener

function _init()
	mouse={}
end

function _update()
	mouse.x=stat(32)
	mouse.y=stat(33)
	mouse.press=stat(34)
	
	if btnp(5) then
		cstore(0x2000,0x2000,0xfff)
	elseif btnp(4) then
		for i=0,15 do
			for l=0,15 do
				mset(i,l,0)
			end
		end
	end
end

function _draw()
	cls()
	map(0,0,0,0,16,16)
	
	mouse_act()
	
	spr(63,mouse.x,mouse.y)
	print(stat(1),1,1,7)
	print(stat(2),1,7,7)
end

function auto_tile(x,y)
	test_tile(x,y)
	test_tile(x+1,y)
	test_tile(x-1,y)
	test_tile(x,y+1)
	test_tile(x,y-1)
end

function test_tile(x,y)
	local number=0
	
	if mget(x,y)!=0 then
		if mget(x,y-1)!=0 then
			number+=1
		end
	
		if mget(x-1,y)!=0 then
			number+=2
		end
	
		if mget(x+1,y)!=0 then
			number+=4
		end
	
		if mget(x,y+1)!=0 then
	 	number+=8
		end
		
	mset(x,y,number+1)
	end
end

function mouse_act()
	local mx=flr(mouse.x/8)
	local my=flr(mouse.y/8)
	
	rect(8*mx,8*my,8*mx+7,8*my+7,7)
	
	if mouse.press==1 then
		mset(mx,my,16)
		auto_tile(mx,my)
	elseif mouse.press==2 then
		mset(mx,my,0)
		auto_tile(mx,my)
	end
end
__gfx__
00000000000000000ffffff000000000fffff1f1000000001f1fffff00000000ffffffff0000000001ffff1010000000fffffff0000000010fffffff00000000
00000000001ff1000ffffff0fff1f000fff1ff000000ffff00ff1fff1f1f1f1fffffffff000000000ffffff0f0000000fffff1000000000f00fffffff000000f
0070070001ffff100ffffff0ffff1f00ff1f0000000f1fff0001f1ffffffffffffffffff00f0f00001ffff101f000000ffff1f00000000f1001ffffff1f1f1ff
000770000ffffff00f1f1f10fff1f000f1f0000000f1ffff00000f1fffffffffffffffff0f1f1f000ffffff0ff000000fffff100000001ff00f1ffffff1f1fff
000770000ffffff000f1f1f0ffff1f00ff000000000f1fff000001fffffffffffff1f1ff01f1f1f001ffff10f1f00000ffff1f0000000f1f001fffffffffffff
0070070001ffff10000f0f00fff1f0001f00000000f1ffff000000f1ffffffffff1f1f1f0ffffff00ffffff0ff1f0000fffff1000001f1ff00f1ffffffffffff
00000000001ff10000000000ffff0000f0000000000f1fff0000000f1f1f1f1ff000000f0ffffff001ffff10fff1ff00ffffff0000ff1fff001fffffffffffff
0000000000000000000000000000000010000000000000000000000100000000000000000ffffff00ffffff0fffff1f1fffffff01f1fffff0fffffffffffffff
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111555555111111111555555511111111115555555111111115555555511111111155555511111111155555551111111111555555511111111
00000000155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00700700155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00077000155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00077000155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00700700155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00000000155555511555555155555551555555511555555515555555555555555555555515555551155555515555555155555551155555551555555555555555
00000000111111111111111111111111111111111111111111111111111111111111111115555551155555515555555155555551155555551555555555555555
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770000077707770770077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070700070070070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070707770070077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070707000070000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770070077707770777000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770000077707770777070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070700070007070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070707770777077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070000070707000700000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770070077707770777000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000111111110000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000111111110000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000155555510000000000000000155555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001111111111111111555555510000000011111111555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000015555555555555510000000000000000
00000000000000000000000000000000000000000000000000000000000000001555555555555555555555510000000011111111111111110000000000000000
00000000000000000000000000000000111111111111111111111111111111115555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000155555555555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000111111115555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001555555555555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111155555555555555555555555555555555555555510000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001111111100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000015555555555555555555555555555555555555510000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000011111111111111111111111111111111111111110000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111115555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555100000000
00000000000000000000000000000000000000000000000000000000000f00f00000000000000000000000000000000000000000155555555555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f00000155555555555555100000000
00000000000000000000000000000000000000000000000000000f0f0000000000000000000ff000000000000000000000000000155555555555555100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
