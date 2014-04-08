
require 'date'

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

	def deposit

		puts "How much would you like to deposit?"

		amount = gets.chomp

		@attr["balance"] += amount.to_f
		
		@attr["transactions"] << track("withdrawl")

	end

	def withdraw
	
		puts "How much would you like to withdraw?"
		
		amount = gets.chomp

		@attr["balance"]-= amount.to_f
		
		@attr["transactions"] << track("withdrawl")

	end

	def track(type)
		
		transaction = {
		
			"type" => type,

			"time" => DateTime.now(),
			
			"result" => balance()
		}

	end	

	def balance

		puts "Your current balance is $#{@attr['balance']}"
		
		return @attr["balance"]

	end

end
