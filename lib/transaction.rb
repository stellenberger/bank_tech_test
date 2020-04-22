# frozen_string_literal: true

class Transaction
  attr_reader :timestamp, :type, :amount, :date, :balance_after_transaction

  def initialize(type, amount, balance, timestamp = Time.now)
    @type = type
    @amount = '%.2f' % amount
    @balance_after_transaction = calculate_balance(balance, amount, type)
    @timestamp = timestamp
    @date = timestamp.strftime('%d-%m-%y')
  end

  private
  
  def calculate_balance(balance, amount, type)
    if type == :deposit
      '%.2f' % (balance.to_i + amount)
    else
      '%.2f' % (balance.to_i - amount)
    end
  end
end
