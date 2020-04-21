# frozen_string_literal: true

require_relative 'account'

class Bank
  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def create_account(name)
    account = Account.new(name)
    @accounts << account
    account
  end

  def deposit(acc, amount)
    acc.transaction(:deposit, amount)
  end

  def withdraw(acc, amount)
    acc.transaction(:withdraw, amount)
  end

  def request_statement(acc)
    acc.print_statement
  end
end
