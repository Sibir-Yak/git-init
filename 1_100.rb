num = (2..20).map { |n| n*5 }
puts num.to_a


# ну лучше все-таки тогда уже так:
# result = []
# (10..100).each { |n| n % 5 == 0 ? res << n : nil }
# result                         if         elsif


# (10..100).step(5).to_a    Этот ваще кайф

# (10..100).select { |n| n % 5 == 0 }  без иф и елсе 

#_______________________________________________________________-
# num = 5
# n = []
# while num <= 95
#     num += 5
#     n << num
    
#     puts n.to_a
# end


# num = (10..100)
# num.to_a

# for n in 20
#    num[n] += 5
  
    
    
# end
# puts n
# puts num


# numbers = [10] 
# while numbers[100]
#     puts numbers
#     numbers << 5
# end


# num = [10]
# 19.times do |i| 
#     num << i
# end
# puts num
