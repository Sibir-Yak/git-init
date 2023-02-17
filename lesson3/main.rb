Dir['exceptions/*.rb'].sort.each { |file| require_relative file }

require_relative './instance_counter.rb'
require_relative './valid.rb'
require_relative './brand_name.rb'
require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './train_cargo.rb'
require_relative './train_pass.rb'
require_relative './wagon.rb'
require_relative './wagon_cargo.rb'
require_relative './wagon_pass.rb'
require_relative './railroad.rb'

puts "Бобро пожаловать на Железную Дорогу"
puts "вас ожитают сокрушительные злоключения"

rr = RailRoad.new
# rr.seed
# rr.menu

# test
# rr.trains[0].


# Запускаем
# irb -r './main.rb'
# или
# ruby main.rb


