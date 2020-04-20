require 'bank'
require 'account'

describe Bank do 

  it 'can create an instance of itself' do
    expect(subject).to be_a Bank
  end

  it 'can create a new user account upon instantiation' do
    expect(subject.account).to be_a Account
  end
end