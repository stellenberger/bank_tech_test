# frozen_string_literal: true

require 'bank'
require 'account'
require 'transaction'

describe 'User Stories,' do
  before(:each) do
    @bank = Bank.new
    @account = @bank.create_account('Stephan')
  end

  # As a hard working citizen
  # So I can store my money somewhere
  # I would like to make an account at the bank
  it 'can make a bank account at the bank.' do
    expect(@bank.accounts.last).to be_an Account
  end

  # As a hard working citizen
  # So I can keep my hard earned cash safe
  # I would like to make deposits at the bank
  it 'can make deposits at the bank' do
    expect(@bank.deposit(@account, 100)).to eq 'You have deposited £100'
  end

  # As a hard working citizen
  # So I can spend my hard earned cash as a consumer
  # I would like to make withdrawals at the bank
  it 'can make withdrawals at the bank' do
    @bank.deposit(@account, 100)
    expect(@bank.withdraw(@account, 100)).to eq 'You have withdrawn £100'
  end

  # As a hard working citizen
  # So I can check how much money I have
  # I would like to request my current bank statement
  it 'can request a bank statement' do
    @bank.deposit(@account, 1000)
    allow(@bank.accounts.last.transactions.last).to receive(:date).and_return('14/01/2012')
    expect { @bank.request_statement(@account) }.to output("date || credit || debit || balance\n14/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end
  # As a hard working citizen
  # So I can work out my monthly spendings
  # I would like my bank statement to include the date of each transaction
  it 'can request a bank statement and see the date of each transaction' do
    @bank.deposit(@account, 100)
    allow(@bank.accounts.last.transactions.last).to receive(:date).and_return('14/01/2012')
    @bank.deposit(@account, 2000)
    allow(@bank.accounts.last.transactions.last).to receive(:date).and_return('15/01/2012')
    @bank.withdraw(@account, 1000)
    allow(@bank.accounts.last.transactions.last).to receive(:date).and_return('17/01/2012')
    expect { @bank.request_statement(@account) }.to output("date || credit || debit || balance\n17/01/2012 || || 1000.00 || 1100.00\n15/01/2012 || 2000.00 || || 2100.00\n14/01/2012 || 100.00 || || 100.00\n").to_stdout
  end
end
