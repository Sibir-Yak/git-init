# Cчетчик
module InstanceCounter
  def self.included(base)
    base.extend Instance
    base.include RegisterInstance
  end
  module Instance
    def loading(log, gol)
      p "loading: #{log} !!!#{gol}" 
      # @instance = log
    end

    def instances_view
      puts "Классом #{self} cоздано  #{@instance} экземпляров"
    end

    protected

    def instance_plus
      if @instance == nil
      @instance = 1
      else
        @instance += 1
      end
    end
  end

  module RegisterInstance
    attr_accessor :instance
    
    protected
    def add_instance
      self.class.send :instance_plus
    end

  end
end
# module RegisterInstance
#   attr_reader :instance
#   @instance = 0
#   protected
#   def add_instance
#     @instance += 1
#     puts "В семье классов пополнение"
#   end
#   attr_writer :instance
# end


# Тебе нужно создать инстанс переменную класса в том модуле, что ты экстендишь

# Дмитрий Ангеловский, [21.12.2022 15:00]
# Это переменная с одной @, но на уровне класса, а не инстанса

# Дмитрий Ангеловский, [21.12.2022 15:01]
# И создавать ее надо прямо в методе. А не снаружи