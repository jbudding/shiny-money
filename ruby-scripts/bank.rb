class BankAccount
	
	def initialize(name)
		@transactions = []
		@balance = 0
	end 

	def deposit
		puts "How much would you like to deposit?"
		amount = gets.chomp
		@balance += amount.to_f
		puts "$#{amount} has been deposited."
	end
	
	def show_balance
		puts "Your current balance is #{@balance}"
	end
end

bank_account = BankAccount.new("Chocolate Tomato")
bank_account.class

bank_account.deposit
bank_account.show_balance
	
