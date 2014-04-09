
require 'date'

class BankAccount

    def initialize(first_name, last_name)

        # make a object of all of the info we need,
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

        @attr["transactions"] << track("deposit")

    end

    def withdraw

        puts "How much would you like to withdraw?"

        amount = gets.chomp

        @attr["balance"]-= amount.to_f

        @attr["transactions"] << track("withdrawl")

    end

    def track(type)

        return  {

            "type" => type,

            "time" => DateTime.now().strftime("%d/%m/%y at %h:%M:%S"),

            "result" => balance()
        }

    end

    def balance

        puts "Your current balance is $#{@attr['balance']}"

        return @attr["balance"]

    end

    def report

        i = 0

        @attr["transactions"].each { |a|

            puts "\n"
            puts "\t\tTransaction #{i}"
            puts "\t\t================="
            a.each { |k,v|
                puts <<-TEMP
                |#{k} : #{v}
                |----------------------
                TEMP
            }

            i += 1

        }

    end

end

puts <<-MESSAGE

Welcome to Choco-Bank
----------------------------------------

    try making a few withdrawls and deposits,

    example = BankAccount.new("First","Last")

example.deposit

example.withdraw

example.report

----------------------------------------
    \n
\n
MESSAGE
