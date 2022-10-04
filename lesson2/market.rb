product = {}
price = {}
product_price = {}
full_price = 0

# commodity = nil
# cost = nil
# amount = nil
# Пока не ввели пустую строчку, крутимся в цикле
loop do
  # Спрашиваем у пользователя имя
  puts "Введите название продукта, или \"стоп\""
  commodity = gets.chomp
  break if commodity == 'стоп'
  puts "Введите цену продукта за штуку или кг"
  cost = gets.chomp.to_f
  puts "Введите количество продуктов или вес"
  amount = gets.chomp.to_f

  # Добавляем имя в массив имен
  product[commodity] = {cost => amount}
end

# [ты кпил, [строка1, строка2]] преобразовалось в с помощью .flatten [ты кпил, строка1, строка2]
# puts "Ты купил:"
# product.each do |name, qty|
#   puts "#{name} по цене #{qty.keys[0]} в количестве #{qty.values.first}\n"
# end

puts "Ты купил:"
product.each do |name, qty|
  qty.each do |cost, amount|
    puts "#{name} по цене #{cost} в количестве #{amount}\n"
  end
end

product.each do |com, cos_amo|  
  cos_amo.each do |cos, amo|
    sum = cos * amo
    puts "Ты купил #{com} по #{sum}"
    full_price += sum
  end
end

puts "Всего ты потратишь #{full_price} Гришек."














# product = []
# price = []
# product_price = {}
# full_price = 0

# # commodity = nil
# # cost = nil
# # amount = nil
# # Пока не ввели пустую строчку, крутимся в цикле
# loop do
#   # Спрашиваем у пользователя имя
#   puts "Введите название продукта, или \"стоп\""
#   commodity = gets.chomp
#   break if commodity == 'стоп'
#   puts "Введите цену продукта за штуку или кг"
#   cost = gets.chomp.to_f
#   puts "Введите количество продуктов или вес"
#   amount = gets.chomp.to_f

#   # Добавляем имя в массив имен
#   price << {commodity  => " #{cost * amount}--грн."}
#   full_price += (amount * cost)
#   product << {commodity => amount} 
#   # product_price = {commodity => cost} 
#   product_price[commodity] = {"Цена: #{cost}" => "Количество: #{amount}"}
# end

# puts "Ты купил #{product_price}"
# puts "Итоговая сумма за каждый товар #{price}" 
# puts "Всего ты потратишь #{full_price} Гришек."
# # puts product_price