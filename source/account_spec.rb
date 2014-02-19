require "rspec"

require_relative "account"

describe Account do

  describe "#initialize" do
    it "raises an error if account number is invalid" do
      ['123', '123456789a'].each do |num|
        expect { Account.new(num) }.to raise_error
      end
    end

    it "sets default balance to zero" do
      account = Account.new('1234567891')
      expect(account.balance).to eq 0
    end
  end

  describe "#transactions" do
    it "has a length that is incremented by account activity" do
      account = Account.new('1234567891')
      account.deposit!(20)
      account.withdraw!(10)
      expect(account.transactions.length).to eq 3
    end
  end


  describe "#balance" do
    it "responds accordingly to transactions" do
     account = Account.new('1234567891')
     account.deposit!(20)
     account.withdraw!(10)
     expect(account.balance).to eq 10
   end
 end

 describe "#account_number" do

 end

 describe "deposit!" do

 end

 describe "#withdraw!" do

 end
end