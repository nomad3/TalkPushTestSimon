class RequesterMock
  def get
    File.read "./spec/sample.csv"
  end
  
  def push(item)
    true
  end
end

class RedisMock
  def get(key)
    key != "pushtalk:model:jlennon@mail.com"
  end

  def set(key, value)
    true
  end
end

class LoggerMock
  def info(msg)
  end

  def error(msg)
  end
end
