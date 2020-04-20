require 'transaction'

describe Transaction do
  it 'can instantiate itself' do
    expect(Transaction.new(:deposit, 200)).to be_a Transaction
  end

  it 'will have a timestamp of when the transaction took place' do
    transaction = Transaction.new(:deposit, 200)
    expect(transaction.timestamp).to be_a Time
  end

  it 'has an attribute that describes the type of transaction, deposit' do
    transaction = Transaction.new(:deposit, 200)
    expect(transaction.type).to eq :deposit
  end

  it 'has an attribute that describes the type of transaction, withdrawal' do
    transaction = Transaction.new(:withdrawal, 200)
    expect(transaction.type).to eq :withdrawal
  end

  it 'has an attribute that tells me the amount of money involved in a transaction' do
    transaction = Transaction.new(:withdrawal, 200)
    expect(transaction.amount).to eq 200
  end
end