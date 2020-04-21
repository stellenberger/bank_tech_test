# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'can create an instance of itself' do
    transactions = []
    statement = Statement.new(transactions)
    expect(statement).to be_a Statement
  end

  it 'can produce an empty statement' do
    transactions = []
    statement = Statement.new(transactions)
    expect(statement.produce).to eq "date || credit || debit || balance\n"
  end
end
