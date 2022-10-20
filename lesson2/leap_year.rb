puts "Нужно ввести послевовательно и чисслами дату, месяц, год"
puts "Введите дату"
date = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i
years = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
if date > 31 || month > 12
    abort "Не вводите ***ню пожалуйста"
    
end





if year % 4 == 0 && year % 100 != 0 
    shit = 0
    years.each do |mon, day|
        if mon +1 <= month
          shit += day 
        end  
    end
    if month > 2
        shit += 1
    end
    shit += date 
    puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
        elsif year % 100 == 0 && year % 400 == 0
            shit = 0
            years.each do |mon, day|
                if mon +1 <= month
                  shit += day 
                end  
            end
            if month > 2
                shit += 1
            end
            shit += date 
            puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
        else 
            shit = 0
            years.each do |mon, day|
                if mon +1 <= month
                  shit += day 
                end  
            end
            shit += date
            puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
end

# array = []
# while years1 = month do |vol, num| 
#     # Записываем очередное число в массив
#     array << years1
  
#     # Увеличиваем сумму
#     summa += years1
  
#     # Увеличиваем счетчик для следующей итерации
#     years1 += 1
#   end















# if year % 4 == 0 && year % 100 != 0 
#     years2 = { 'Yanuary' => 31, 'February' => 29, 'March' => 31,'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}
#     puts 2
#         elsif year % 100 == 0 && year % 400 == 0
#             years2 = { 'Yanuary' => 31, 'February' => 29, 'March' => 31,'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}
#             puts 22
#         else 
#             years1 = { 'Yanuary' => 31, 'February' => 28, 'March' => 31,'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}
#             puts 111
# end
# puts "Нужно ввести послевовательно и чисслами дату, месяц, год"
# puts "Введите дату"
# date = gets.chomp.to_i
# puts "Введите месяц"
# month = gets.chomp.to_i
# puts "Введите год"
# year = gets.chomp.to_i
# if date > 31 || month > 12
#     abort "Не вводите ***ню пожалуйста"
    
# end
# sumdays = 0
# if year % 4 == 0 && year % 100 != 0 
#     years2 = { 1 => 31, 2 => 29, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
#     shit = 0
#     years2.each do |mon, day|
#         if mon +1 <= month
#           shit += day 
#         end  
#     end
#     shit += date
#     puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
#         elsif year % 100 == 0 && year % 400 == 0
#             years2 = { 1 => 31, 2 => 29, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
#             shit = 0
#             years2.each do |mon, day|
#                 if mon +1 <= month
#                   shit += day 
#                 end  
#             end
#             shit += date
#             puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
#         else 
#             years1 = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
#             shit = 0
#             years1.each do |mon, day|
#                 if mon +1 <= month
#                   shit += day 
#                 end  
#             end
#             shit += date
#             puts "порядковый номер даты, начиная отсчет с начала года: #{shit}" 
# end
