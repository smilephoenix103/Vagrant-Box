require_relative 'BankAccount'

RSpec.describe BankAccount do
    before(:each) do
        @bank_account1 = BankAccount.new().deposit('checking', 125)
        @bank_account2 = BankAccount.new().deposit('savings', 2000)
    end

    it 'Has a getter method for retrieving the checking account balance' do
        expect(@bank_account1.checking).to eq(125)
        expect(@bank_account2.checking).to eq(0)
    end

    it 'Has a getter method that retrieves the total account balance' do
        expect(@bank_account1.savings).to eq(0)
        expect(@bank_account2.savings).to eq(2000)
    end

    context 'Withdrawals' do
        it 'Has a function that allows the user to withdraw cash' do
            expect(@bank_account1.withdrawal('checking', 20).checking).to eq(105)
        end

        it 'Raises an error if a user tries to withdraw more money than they have in the account' do
            expect{@bank_account1.withdrawal('savings', 100)}.to raise_error("Insufficient Funds")
        end
    end

    it 'Raises an error when the user attempts to retrieve the total number of bank accounts' do
        expect{@bank_account1.number_accounts}.to raise_error(NoMethodError)
    end

    it 'Raises an error when the user attempts to set the interest rate' do
        expect{@bank_account1.interesest = 0.99}.to raise_error(NoMethodError)
    end
 
end