class BankAccount
  @@num_accounts = 0
  attr_reader :checking, :savings

  def initialize
    @checking = 0
    @savings = 0
    @total = 0
    @acct_num = acct_num
    @@num_accounts += 1
    @interest = 0.01
  end

  private
  def acct_num
    @acct_num = (0..10).map {rand(0..9)}.join("")
    @acct_num
  end

  public
  def checking
    @checking
  end

  def savings
    @savings
  end

  def total_balance
    @total = @checking + @savings
    @total
  end

  def deposit(account, amount)
    if account.downcase == 'checking'
      @checking += amount
    elsif account.downcase == 'savings'
      @savings += amount
    else
      raise "Invalid account type"
    end
    self
  end

  def withdrawal(account, amount)
    if account.downcase == 'checking'
      if @checking < amount
        raise "Insufficient Funds"
      else
        @checking -= amount
      end
    elsif account.downcase == 'savings'
      if @savings < amount
        raise "Insufficient Funds"
      else
        @savings -= amount
      end
    else
      raise "Invalid account type"
    end
    self
  end

  def self.number_accounts
    @@num_accounts
  end

  def account_info
    puts "Account ##{@acct_num}\n Checking: $#{@checking}\n Savings: $#{@savings}\n Total: $#{total_balance} \n Interest Rate: #{@interest}%"
  end

end

account1 = BankAccount.new
account1.account_info
account1.deposit('checking', 250)
puts account1.checking
account1.account_info
account1.deposit('savings', 375)
puts account1.savings
account1.account_info
account2 = BankAccount.new
account2.deposit('checking', 100)
account2.deposit('savings', 50)
account2.account_info
puts BankAccount.number_accounts
