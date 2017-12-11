require 'thread'  # For Mutex class in Ruby 1.8  

# A BankAccount has a name, a checking amount, and a savings amount  
class BankAccount
  def initialize(name, checking, savings)
    @name,@checking,@savings = name,checking,savings
    @lock = Mutex.new  # For thread safety  
  end

  # Lock account and transfer money from savings to checking  
  def transfer_from_savings(x)
    @lock.synchronize {
      @savings -= x
      @checking += x
    }
  end

  # Lock account and report current balances  
  def to_s
    @lock.synchronize {
      "#{@name}\nChecking: #{@checking}\nSavings: #{@savings}"
    }
  end
end

ccc = BankAccount.new("000001", 1000, 999)
t1 = Thread.new do
  ccc.transfer_from_savings(10)
end
t2 = Thread.new do
  ccc.transfer_from_savings(999)
end
t1.join
t2.join
print ccc

