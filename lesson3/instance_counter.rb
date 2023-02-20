# Cчетчик
module InstanceCounter

  def self.included(base)
    base.extend Instance
    base.include RegisterInstance
  end

  module Instance
    attr_reader :instances

    def instance_plus
      @instances ||= 0        # ( ||= ) Если 0 то без изменений, а если nil || folse то ставит 0
      @instances += 1
    end
  end

  module RegisterInstance

    # def valid?
    #   validate!
    #   true # возвращаем true, если метод validate! не выбросил исключение
    # rescue
    #   false # возвращаем false, если было исключение
    # end

    private

    def register_instance
      self.class.instance_plus
    end
  end
end
