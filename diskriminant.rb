puts "сейчас решим эту хрень"
puts "ax^2+bx-c=0"
puts "Теперь поочередно введем данные a, b, c,"
puts "Введите (а)"
a = gets.to_i

puts "Введите (b)"
b = gets.to_i

puts "Введите (c)"
c = gets.to_i

d = b ** 2 - 4 * a * c
puts d

if d < 0
    puts "Корней нет"
elsif d == 0
    puts "Дискриминант #{d}, X₁ и X₂ = #{(-b - Math.sqrt(d)) / (2 * a)}."
else d > 0 
    puts "Дискриминант #{d}, X₁ = #{(-b + Math.sqrt(d)) / (2 * a)} и X₂ = #{(-b - Math.sqrt(d)) / (2 * a)}."
end








# x1 = (-b + Math.sqrt(d)) / (2 * a)
# x2 = (-b - Math.sqrt(d)) / (2 * a)
# x = x1

# if d < 0
#     puts "Корней нет"
# elsif d = 0
#     puts "Дискриминант #{d}, X₁ и X₂ = #{x}."
# else d > 0 
#     puts "Дискриминант #{d}, X₁ = #{x1} и X₂ = #{x2}."
# end

# d.sqrt = dd