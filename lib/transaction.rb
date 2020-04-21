# frozen_string_literal: true

class Transaction
  attr_reader :timestamp, :type, :amount, :date, :balance_after_transaction

  def initialize(type, amount, balance, timestamp = Time.now)
    @type = type
    @amount = '%.2f' % amount
    @balance_after_transaction = '%.2f' % balance
    @timestamp = timestamp
    @date = timestamp.strftime('%d-%m-%y')
  end
end
