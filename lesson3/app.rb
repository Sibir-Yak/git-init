require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'

train1 = Train.new(123, "pas", 10)
train2 = Train.new(124, "pas", 9)
train3 = Train.new(234, "gruz", 99)

station1 = Station.new("Odessa")
station2 = Station.new("Kharkiv")
station3 = Station.new("Yalta")
station4 = Station.new("Dnepr")
station5 = Station.new("Kiyv")

route = Route.new(station1, station2)
route2 = Route.new(station3, station4)
route.add_station(station3)
route.add_station(station5)
station1.add_train(train1)
train1.add_route(route)
train1.go_next_station

train1.go_previous_station


# station1.add_train(train2)
# station1.add_train(train3)
