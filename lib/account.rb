require_relative 'statement'
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

  def print_statement 
    statement = Statement.new(@transactions)
    statement.produce
  end

  private

  def deposit(amount)
    @balance += amount
    @transactions << Transaction.new(:deposit, amount, @balance)
    "You have deposited £#{amount}"
  end

  def withdraw(amount)
    if @balance < amount
      raise "You don't have enough credit in your account to make this transaction"
    end
    @balance -= amount
    @transactions << Transaction.new(:withdraw, amount, @balance)
    "You have withdrawn £#{amount}"
  end
end