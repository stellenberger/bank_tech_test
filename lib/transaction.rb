class Transaction

  attr_reader :timestamp, :type, :amount
   
  def initialize(type, amount)
    @type = type
    @amount = amount
    @timestamp = Time.now
  end


end