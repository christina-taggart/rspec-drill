require "rspec"

require_relative "account"

describe Account do
  describe "#initialize" do
    it "creates a new account" do
      account = Account.new("1234567891")
      expect(account.class).to eq Account
    end
  end

  describe "#transactions" do
    it "should be an array of balances" do
      @transactions = []
      @transactions << 30
      @transactions << 100
      expect(@transactions).to eq [30,100]
    end
  end

  describe "#balance" do
    it "should be the sum of transactions" do
      account = Account.new("1234567891")
      account.transactions = [30,100]
      expect(account.balance).to eq 130
    end
  end

  describe "#account_number" do
    it "should be 10 digits" do
      expect{Account.new("12345")}.to raise_error(InvalidAccountNumberError)
    end
  end

  describe "deposit!" do
    it "should raise an error if the number is negative" do
      account = Account.new("1234567891")
      expect{account.deposit!(-20)}.to raise_error(NegativeDepositError)
    end
  end

  describe "#withdraw!" do
    it "should raise overdraft error if too much money is withdrawn" do
      account = Account.new("1234567891", 10)
      expect{account.withdraw!(-20)}.to raise_error(OverdraftError)
    end
  end
end