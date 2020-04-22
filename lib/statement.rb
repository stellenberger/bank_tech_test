# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def produce
    statement = "date || credit || debit || balance\n"
    if @transactions.empty?
      statement
    else
      @transactions.reverse.each do |transaction|
        if transaction.type == :deposit
          statement += transaction.date + ' || ' + transaction.amount + ' || || ' + transaction.balance_after_transaction + "\n"
        elsif transaction.type == :withdraw
          statement += transaction.date + ' || || ' + transaction.amount + ' || ' + transaction.balance_after_transaction + "\n"
        end
      end
      puts statement
    end
  end
end
