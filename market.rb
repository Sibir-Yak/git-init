product = []
price = []
product_price = {}
full_price = 0

user_input = nil
user_input2 = nil
user_input3 = nil
# Пока не ввели пустую строчку, крутимся в цикле
loop do
  # Спрашиваем у пользователя имя
  puts "Введите название продукта, или \"стоп\""
  user_input = gets.chomp
  break if user_input == 'стоп'
  puts "Введите цену продукта за штуку или кг"
  user_input2 = gets.chomp.to_f
  puts "Введите количество продуктов или вес"
  user_input3 = gets.chomp.to_f

  # Добавляем имя в массив имен
  price << {user_input  => " #{user_input2 * user_input3}--грн."}
  full_price += (user_input3 * user_input2)
  product << {user_input => user_input3} 
  # product_price = {user_input => user_input2} 
  product_price[user_input] = {"Цена: #{user_input2}" => "Количество: #{user_input3}"}
end

puts "Ты купил #{product_price}"
puts "Итоговая сумма за каждый товар #{price}" 
puts "Всего ты потратишь #{full_price} Гришек."
# puts product_price














# user_input = nil
# user_input2 = nil
# user_input3 = nil
# # Пока не ввели пустую строчку, крутимся в цикле
# while user_input != 'стоп' do
#   # Спрашиваем у пользователя имя
#   puts "Введите название продукта"
#   user_input = gets.chomp
#   if user_input == "стоп"
#     abort "считаем"
#   end
#   puts "Введите цену продукта за штуку или кг"
#   user_input2 = gets.chomp.to_f
#   puts "Введите количество продуктов или вес"
#   user_input3 = gets.chomp.to_f

#   # Добавляем имя в массив имен
#   product << {user_input => user_input2}
# end
# puts product