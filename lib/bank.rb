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
    check_account(acc)
    acc.transaction(:deposit, amount)
  end

  def withdraw(acc, amount)
    check_account(acc)
    acc.transaction(:withdraw, amount)
  end

  def request_statement(acc)
    acc.print_statement
  end

  private

  def check_account(acc)
    raise "We do not recognise this account" if !@accounts.include?(acc)
  end
end
