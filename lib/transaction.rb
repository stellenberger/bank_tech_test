class Transaction

  attr_reader :timestamp, :type, :amount
   
  def initialize(type, amount, timestamp = Time.now)
    @type = type
    @amount = amount
    @timestamp = timestamp
  end
end