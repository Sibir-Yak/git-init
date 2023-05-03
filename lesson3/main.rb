# frozen_string_literal: true

Dir['exceptions/*.rb'].sort.each { |file| require_relative file }

require_relative './instance_counter'
require_relative './valid'
require_relative './brand_name'
require_relative './train'
require_relative './station'
require_relative './route'
require_relative './train_cargo'
require_relative './train_pass'
require_relative './wagon'
require_relative './wagon_cargo'
require_relative './wagon_pass'
require_relative './railroad'

puts 'Бобро пожаловать на Железную Дорогу'
puts 'вас ожитают сокрушительные злоключения'

rr = RailRoad.new
rr.seed
rr.menu

# test
# rr.trains[0].

# Запускаем
# irb -r './main.rb'
# или
# ruby main.rb
