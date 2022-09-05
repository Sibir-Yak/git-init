f1 = 0
f2 = 1
# 12.times do
#     puts f1
#    f1, f2 = f2, f1 + f2
# end
fib = []
while f1 < 100 do
    f1, f2 = f2, f1 + f2
    if f1 <= 100
    fib << f1
    
    end
end
puts fib.to_a



# fibo = (1..100) do 