all = ("a".."z")
vow = %w[a e i o u y]
resolt = {}
bb = 0
all.each do |ai| 
  bb += 1
  resolt[ai] = bb
end
vowels = {}
resolt.each do |let, num|
  if vow.include?(let) 
    vowels[let] = num
    # puts "#{let}, #{num}"
  end
end
print vowels

# print resolt[1,]

#  volwels = {a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10, k:11, l:12, m:13, n:14, o:15, p:16, q:17, r:18, s:19, t:20, u:21, v:22, w:23, x:24, y:25, z:26}
# volwels.each do |vol, num| 
    
#   if num % 2 == 0
#     puts "#{vol}" => "#{num}"
#   end
# end
      
# if num % 2 == 0
#      puts volwels
#    end
# puts volwels 

# volwels.each { |v, n| n % 2 == 0 ? redo << n : nil }
# puts volwels

