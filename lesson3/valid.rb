# frozen_string_literal: true

module Valid
  def valid?
    validate!
    true # возвращаем true, если метод validate! не выбросил исключение
  rescue StandardError
    false # возвращаем false, если было исключение
  end
end
