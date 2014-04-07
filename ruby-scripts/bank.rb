##objects and classes and object oriented programming
##non object oriented programming you would type your data in a series

class BankAccount

	def initialize(name)
		@transactions = []
		@balance = 50

	end

	def deposit
		print "How much would you like to deposit? "
		amount = gets.chomp
		@balance += .to_f
		@balance + amount
		puts "$ #{amount} deposited"
	end

	def show_balance
		puts "Your Current balance is #{@balance}"
	end
end

	bank_account = BankAccount.new('Blake Jackovitch')
	bank_account.class

	bank_account.deposit
	bank_account.show_balance
