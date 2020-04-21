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
      deposit(amount)
    elsif type == :withdraw
      withdraw(amount)
    else
      raise "I dont recognise that action"
    end
  end

  private

  def deposit(amount)
    @transactions << Transaction.new(:deposit, amount)
    @balance += amount
    "You have deposited £#{amount}"
  end

  def withdraw(amount)
    @transactions << Transaction.new(:withdraw, amount)
    @balance -= amount
    "You have withdrawn £#{amount}"
  end
end