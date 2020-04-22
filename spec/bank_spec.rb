# frozen_string_literal: true

require 'bank'
require 'account'
require 'statement'

describe Bank do
  before(:each) do
    @account_double = double :account, transaction: "You have made a transaction", print_statement: 'Statement'
    @account_class_double = double :account_class, new: @account_double
    @bank = Bank.new(@account_class_double)
    @account = @bank.create_account('Stephan')
  end
  
  context '#instantiation' do
    it 'can create an instance of itself' do
      expect(subject).to be_a Bank
    end
  end

  context '#user account' do
    it "makes an account" do
      expect(@bank.create_account("Stephan")).to eq @account_double
    end
  end

  context '#deposits and withdrawals' do
    it 'can deposit money into an account' do
      expect(@bank.deposit(@account, 200)).to eq 'You have made a transaction'
    end

    it 'can withdraw money from my account' do
      expect(@bank.withdraw(@account, 200)).to eq 'You have made a transaction'
    end

    it 'will throw an error if the User Account does not exist on the banks system' do
      account = Account.new("Stephan")
      expect{ subject.deposit(account, 200) }.to raise_error "We do not recognise this account"
    end
  end

  context '#statements' do
    it 'can print out a statement' do
      expect(@bank.request_statement(@account)).to eq "Statement"
    end
  end
end
