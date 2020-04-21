class Account

  attr_reader :transactions

  STARTING_BALANCE = 0

  def initialize(name)
    @name = name
    @balance = STARTING_BALANCE
    @transactions = []
  end

  def transaction(type, amount)
    if type == :deposit
      transaction = Transaction.new(type, amount)
      @transactions << transaction
      @balance += amount
      "You have deposited £#{amount}"
    elsif type == :withdraw
      @balance -= amount
      "You have withdrawn £#{amount}"
    else
      "I dont recognise that action"
    end
  end


end