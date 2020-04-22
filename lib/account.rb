# frozen_string_literal: true

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
      save_transaction(:deposit, amount)
      confirmation(:deposit, amount)
    elsif type == :withdraw
      check_balance(amount)
      save_transaction(:withdraw, amount)
      confirmation(:withdraw, amount)
    else
      raise 'I dont recognise that action'
    end
  end

  def print_statement
    statement = Statement.new(@transactions)
    statement.produce
  end

  private
  def check_balance(amount)
    error_message if insufficient_funds(amount) 
  end

  def save_transaction(type, amount)
    @transactions << Transaction.new(type, amount, balance)
  end

  def balance
    if @transactions.empty?
      0
    else
      @transactions.last.balance_after_transaction
    end
  end
  
  def confirmation(type, amount)
    type == :deposit ? "You have deposited £#{amount}" : "You have withdrawn £#{amount}"
  end

  def error_message
    raise "You don't have enough credit in your account to make this transaction"
  end

  def insufficient_funds(amount)
    @transactions.empty? || @transactions.last.balance_after_transaction.to_i < amount
  end
end
