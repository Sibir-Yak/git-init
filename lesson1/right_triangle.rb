puts "Привет человек сейчас я спрошу у тебя три стороны треугольника"
puts "Какая первая сторона?"
a = gets.to_f

puts "Какая вторая сторона?"
b = gets.to_f

puts "Какая третья сторона?"
c = gets.to_f

if a > b && a > c 
	max_side = a
	catet1 = b
	catet2 = c
elsif b > a && b > c
	max_side = b
	catet1 = a
	catet2 = c
else 
	max_side = c
	catet1 = b
	catet2 = a
end

if (catet1 + catet2) <= max_side
	puts "Это не треугольник"
	exit
end 
if a == b && b == c && c == a
	puts "Равносторонний треугольник"
elsif catet1 == catet2 || catet1 == max_side || catet2 == max_side && max_side ** 2 == catet1 ** 2 + catet2 ** 2
	puts "Прямоугольный треугольник, катеты которого равны"
elsif catet1 == catet2 || catet1 == max_side || catet2 == max_side
	puts "Равнобедренный треугольник"
elsif max_side ** 2 == catet1 ** 2 + catet2 ** 2
	puts "Прямоугольный треугольник"
else 
	puts "Просто треугольник"
end






















# if a && b = c
# 	puts "Треугольник равносторонний"
# elsif (a ** 2) + (b ** 2) == c ** 2
# 	puts "Треугольник прямоугольный"
# elsif (b ** 2) + (c ** 2) == a ** 2
# 	puts "Треугольник прямоуголный"
# elsif (a ** 2) + (c ** 2) == b ** 2
# 	puts "Треугольник прямоугольный"
# else
# 	puts "Треугольник равнобедренный"
# end
