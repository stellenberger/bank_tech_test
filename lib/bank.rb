require_relative 'account'

class Bank

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def create_account(name)
    account = Account.new(name)
    @accounts << account
  end

  def deposit(acc, amount)
    acc.transaction(:deposit, amount)
  end
end