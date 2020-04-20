class Account
STARTING_BALANCE = 0
  def initialize(name)
    @name = name
    @balance = STARTING_BALANCE
  end

  def transaction(type, amount)
    @balance += amount
    "You have deposited £#{amount}"
  end
end