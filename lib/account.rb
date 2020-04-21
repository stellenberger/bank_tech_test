require_relative 'statement'
require_relative 'transaction'
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
      save_transaction(:deposit, amount)
      confirmation(:deposit, amount)
    elsif type == :withdraw
      withdraw(amount)
      save_transaction(:withdraw, amount)
      confirmation(:withdraw, amount)
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
  end

  def withdraw(amount)
    check_balance(amount)
    @balance -= amount
  end

  def check_balance(amount)
    raise "You don't have enough credit in your account to make this transaction" if @balance < amount
  end

  def save_transaction(type, amount)
    @transactions << Transaction.new(type, amount, @balance)
  end

  def confirmation(type, amount)
    type == :deposit ? "You have deposited £#{amount}" : "You have withdrawn £#{amount}"
  end
end