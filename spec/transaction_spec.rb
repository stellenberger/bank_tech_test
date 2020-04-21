# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'can instantiate itself' do
    account_balance = 200
    expect(Transaction.new(:deposit, 200, account_balance)).to be_a Transaction
  end

  it 'will have a timestamp of when the transaction took place' do
    account_balance = 200
    transaction = Transaction.new(:deposit, 200, account_balance)
    expect(transaction.timestamp).to be_a Time
  end

  it 'has an attribute that describes the type of transaction, deposit' do
    account_balance = 200
    transaction = Transaction.new(:deposit, 200, account_balance)
    expect(transaction.type).to eq :deposit
  end

  it 'has an attribute that describes the type of transaction, withdrawal' do
    account_balance = 200
    transaction = Transaction.new(:withdrawal, 200, account_balance)
    expect(transaction.type).to eq :withdrawal
  end

  it 'has an attribute that tells me the amount of money involved in a transaction' do
    transaction = Transaction.new(:withdrawal, 200, 200)
    expect(transaction.amount).to eq '200.00'
  end
end
