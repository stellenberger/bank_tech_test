class Bank

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def create_account(name, amount)
    @accounts << Account.new(name, amount)
  end

  def deposit(acc, amount)
    acc.transaction(:deposit, amount)
  end
end