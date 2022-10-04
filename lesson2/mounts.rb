months = { 'Yanuary' => 31, 'February' => 28, 'March' => 31,'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}
months.each do |mon, day|
     if day == 30
     puts "#{mon} #{day}"
end
end

# for index in months
#     puts index
# end 


# while months.values == 30 do
#      puts months
# end

# months.each do |months,day| 
    
#     puts day.inspect
# end
# months.each do |mon|
#         puts  mon.inspect
#  end