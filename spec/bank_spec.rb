require 'bank'
require 'account'

describe Bank do 

  it 'can create an instance of itself' do
    expect(subject).to be_a Bank
  end

  it 'can create a new user account upon instantiation' do
    subject.create_account("Stephan", 0)
    expect(subject.accounts.last).to be_an Account
  end

  it 'can deposit money into an account' do
    account = Account.new("Stephan", 0)
    expect(subject.deposit(account, 200)).to eq "You have deposited £200"
  end
end