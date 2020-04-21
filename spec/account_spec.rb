require 'account'

describe Account do
  context '#instantiation' do
    it 'can create an instance of itself' do
      expect(Account.new("Stephan")).to be_an Account
    end
  end

  context '#transactions' do
    it 'is instantiated with an empty array for transactions' do
      account = Account.new("Stephan")
      expect(account.transactions).to eq []
    end

    it 'can make an instance of transaction every time a transaction is created, and stored somewhere I can access them' do
      account = Account.new("Stephan")
      account.transaction(:deposit, 100)
      expect(account.transactions.length).to eq 1
    end

    it 'can access attributes of each transaction including amount, type and the timestamp. Testing deposit' do
      account = Account.new("Stephan")
      account.transaction(:deposit, 100)
      expect(account.transactions.length).to eq 1
      expect(account.transactions.last.amount).to eq '100.00'
      expect(account.transactions.last.type).to eq :deposit
      expect(account.transactions.last.timestamp).to be_a Time
    end
  
    it 'can access attributes of each transaction including amount, type and the timestamp. Testing withdraw' do
      account = Account.new("Stephan")
      account.transaction(:deposit, 100)
      account.transaction(:withdraw, 100)
      expect(account.transactions.length).to eq 2
      expect(account.transactions.last.amount).to eq '100.00'
      expect(account.transactions.last.type).to eq :withdraw
      expect(account.transactions.last.timestamp).to be_a Time
    end
  end

  context '#overdraft' do
    it 'will not allow you to go into overdraft on your account, or to sub-zero value' do
      account = Account.new("Stephan")
      expect { account.transaction(:withdraw, 100) }.to raise_error "You don't have enough credit in your account to make this transaction"
    end
  end

  
  context '#statement' do
    it 'can print a statement' do
      account = Account.new("Stephan")
      account.transaction(:deposit, 100)
      allow(account.transactions.last).to receive(:date).and_return("14/01/2012") 
      account.transaction(:withdraw, 100)
      allow(account.transactions.last).to receive(:date).and_return("15/01/2012") 
      expect{account.print_statement}.to output("date || credit || debit || balance\n14/01/2012 || 100.00 || || 100.00\n15/01/2012 || || 100.00 || 0.00\n").to_stdout 
    end
  end
end