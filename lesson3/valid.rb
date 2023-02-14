module Valid
  def valid?
    validate!
    true # возвращаем true, если метод validate! не выбросил исключение
  rescue
    false # возвращаем false, если было исключение
  end
end
