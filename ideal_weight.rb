 puts "Скажи пожалуйста как имя твоё?"
name = gets.chomp

puts "Дабы занать вес свой идеальный  укажи рост свой реальный?"
weight = gets.chomp

sum = (weight.to_i-110) * 1.15

# if weight.to_i < 140
#     puts "бро формула конченая и считает очень условно введи рост от 140"
#     exit
# end

if sum > 20
    puts "#{name}, витаю тебя дуже! Твой идеальный вес #{sum.to_i} килограмчиков."
else

    puts "#{name}, бро шикарный вес у тебя, че пристал?"
end
