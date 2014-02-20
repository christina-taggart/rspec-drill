require "rspec"

require_relative "account"

describe Account do

  describe "#initialize" do
    let(:account) { Account.new '0123456789', 100.25 }
    context "given a valid account number and balance" do
      it "should create an object of type Account" do
        expect(account).to be_an_instance_of(Account)
      end
      it "created account should have one transaction equal to starting balance" do
        expect(account.transactions).to be_an_instance_of(Array)
        expect(account.transactions.length).to eq(1)
      end
    end
    context "given an invalid account number" do
      it "should raise an InvalidAccountNumberError" do
        expect{Account.new '01234', 100.25}.to raise_error(InvalidAccountNumberError)
      end
    end
  end

  describe "#transactions" do
    let(:account) { Account.new '0123456789', 100.25 }
    context "after n transactions have been recorded" do
      it "number of transactions should be equal to n transactions" do
        account.deposit!(74.75)
        account.deposit!(100)
        account.deposit!(25.0)
        expect(account.transactions.length).to eq(4)
      end
    end
  end

  describe "#balance" do
    let!(:account) { Account.new '0123456789', 100.25 }
    context "after a couple deposits" do
      it "balance should be the sum of the transaction sub totals" do
        account.deposit!(74.75)
        account.deposit!(100)
        account.deposit!(25.0)
        expect(account.balance).to eq(300.0)
      end
    end
  end

  describe "#account_number" do
    let!(:account) { Account.new '0123456789', 100.25 }
    it "should return an obfuscated account number" do
      expect(account.acct_number).to eq("******6789")
    end
  end

  describe "deposit!" do
    let!(:account) { Account.new '0123456789', 100.25 }
    it "should increment transactions by one" do
      expect{account.deposit!(74.75)}.to change{account.transactions.length}.by(1)
    end
    it "should increase balance by deposit amount" do
      expect{account.deposit! 100}.to change{account.balance}.from(100.25).to(200.25)
    end
  end

  describe "#withdraw!" do
    let!(:account) { Account.new '0123456789', 100.0 }
    it "should decrease account balance by withdrawal amount" do
      account.withdraw! 9.95
      expect(account.balance).to eq(90.05)
    end
  end

end