class Account
STARTING_BALANCE = 0
  def initialize(name, amount = STARTING_BALANCE)
    @name = name
    @balance = amount
  end

  def transaction(type, amount)
    @balance += amount
    "You have deposited £#{amount}"
  end
end