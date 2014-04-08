class BankAccount

	def initialize(first_name, last_name)

		# make a object (in ruby it's called a Hash) of all of the info we need,
		# this way it's all in a nice group instead of tons of individual variables
		@attr = Hash.new()

		@attr["first_name"] = first_name

		@attr["last_name"] = last_name

		@attr["transactions"] = []

		@attr["balance"] = 0

	end

	def deposit(amount)

		puts "How much would you like to deposit?"

		amount = gets.chomp
		# this is a test push to see if i am 'gitting' this software correctly no changes have been made other then this comment
		# access attribures as an object
		# i think you can also do @attr.balance
		@attr["balance"] += amount.to_f

		message = "$#{amount} has been deposited."

		# push this transaction to the end of the transactions array
		@attr["transactions"] << message

		puts message

	end

	def show_balance

		puts "Your current balance is $#{@attr["balance"]}"

	end

end

bank_account = BankAccount.new("Chocolate", "Tomato")

bank_account.deposit(200)
bank_account.show_balance
