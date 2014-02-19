require "rspec"

require_relative "account"

describe Account do
  describe "#initialize" do
    it "creates a new account" do
      Account.any_instance.stub( :validate_account_number ){ true }
      @account = Account.new( 123, 5.0 )
      expect(@account.class).to eq Account
    end

    it "raises exception given invalid input" do
      expect {
        Account.new('hi', 'you')
      }.to raise_error
    end
  end

  describe "transactions" do
    it "should be an array" do
      @account = Account.new( '1234567890', 0.0 )
      expect(@account.transactions.class).to eq Array
    end
  end

  describe "#balance" do
    it "calculates the balance of an account" do
      @account = Account.new('1234567890', 0.0)
      @account.transactions = [150, 50, 100]
      expect(@account.balance).to eq(300)
    end
  end

  describe "#hide_acct_number" do
    it "should obfuscate all but the last four digits of the account number" do
      @account = Account.new( '1234567890', 0.0 )
      expect(@account.hide_acct_number).to eq('******7890')
    end
  end

  describe "#deposit!" do
    it "raises an exception if the deposit is negative" do
      @account = Account.new( '1234567890', 0.0 )
      expect{
        @account.deposit!(-1000)
      }.to raise_error
    end

    it "can make a deposit" do
      @account = Account.new('1234567890', 0.0)
      @account.deposit!(5000)
      expect(@account.balance).to eq(5000)
    end
  end

  describe "#withdraw!" do
    it "can withdraw a positive amount from an account" do
      @account = Account.new('1234567890', 5000.0)
      @account.withdraw!(5000)
      expect(@account.balance).to eq(0.0)
    end

    it "can withdraw a negative amount from an account" do
      @account = Account.new('1234567890', 500.0)
      @account.withdraw!(-500)
      expect(@account.balance).to eq(0.0)
    end

  end
end