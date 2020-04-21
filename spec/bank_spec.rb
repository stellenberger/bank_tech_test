# frozen_string_literal: true

require 'bank'
require 'account'
require 'statement'

describe Bank do
  before(:each) do
    @bank = Bank.new
    @account = @bank.create_account('Stephan')
  end
  context '#instantiation' do
    it 'can create an instance of itself' do
      expect(subject).to be_a Bank
    end
  end

  context '#user account' do
    it 'can create a new user account upon instantiation' do
      subject.create_account('Stephan')
      expect(subject.accounts.last).to be_an Account
    end
  end

  context '#deposits and withdrawals' do
    it 'can deposit money into an account' do
      account = subject.create_account('Stephan')
      expect(subject.deposit(account, 200)).to eq 'You have deposited £200'
    end

    it 'can withdraw money from my account' do
      account = subject.create_account('Stephan')
      subject.deposit(account, 200)
      expect(subject.withdraw(account, 200)).to eq 'You have withdrawn £200'
    end
  end

  context '#statements' do
    it 'can print out a statement of no transactions' do
      expect(@bank.request_statement(@account)).to eq "date || credit || debit || balance\n"
    end

    it 'can print out a statement of one transaction' do
      @bank.deposit(@account, 1000)
      allow(@bank.accounts.last.transactions.last).to receive(:date).and_return('14/01/2012')
      expect(@bank.accounts.last.transactions.last.date).to eq '14/01/2012'
      expect { @bank.request_statement(@account) }.to output("date || credit || debit || balance\n14/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
