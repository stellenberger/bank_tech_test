class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def produce
    if @transactions.empty?
      "date || credit || debit || balance\n"
    else
      statement = "date || credit || debit || balance\n"
      @transactions.each do |transaction|
        if transaction.type == :deposit
          statement += transaction.date + " || " + transaction.amount + " || || " + transaction.balance_after_transaction + "\n"
        elsif transaction.type == :withdraw
          statement += transaction.date + " || || " + transaction.amount + " || " + transaction.balance_after_transaction + "\n"
        end
      end
    statement
    end
  end
end