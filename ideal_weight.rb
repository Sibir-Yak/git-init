 puts "Скажи пожалуйста как имя твоё?"
name = gets.chomp

puts "Дабы занать вес свой идеальный  укажи рост свой реальный?"
weight = gets.chomp

sum = (weight.to_i-110) * 1.15 
if sum > 0
    puts "#{name}, витаю тебя дуже! Твой идеальный вес #{sum.to_i} килограмчиков."
else sum < 0
    puts "#{name}, бро шикарный вес у тебя, че пристал?"
end
