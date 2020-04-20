require 'account'

describe Account do
  it 'can create an instance of itself' do
    expect(Account.new("Stephan", 100)).to be_an Account
  end


end