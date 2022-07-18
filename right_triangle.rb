puts "Привет человек сейчас я спрошу у тебя три стороны треугольника"
name = gets.chomp

puts "Какая первая сторона?"
a = gets.chomp

puts "Какая вторая сторона?"
b = gets.chomp

puts "Какая третья сторона?"
c = gets.chomp

if a.to_i = b.to_i = c.to_i
	puts "Треугольник равносторонний"
elsif (a.to_i**) + (b.to_i**) = c.to_i**
	puts "Треугольник прямоугольный"
elsif (b.to_i**) + (c.to_i**) = a.to_i**
	puts "Треугольник прямоуголный"
elsif (a.to_i**) + (c.to_i**) = b.to_i**
	puts "Треугольник прямоугольный"
	else
		puts "Треугольник равнобедренный"
	end
	
