#test commit again
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

        amount = gets.chomp.to_f

        # this is a test push to see if i am 'gitting' this software correctly no changes have been made other then this comment
        @attr["balance"] += amount

        @attr["transactions"] << track("deposit", amount)

    end

    def withdraw

        puts "How much would you like to withdraw?"

        amount = gets.chomp.to_f

        @attr["balance"] -= amount

        @attr["transactions"] << track("withdrawl", amount)

    end

    def track(type, amt)

        return  {

            "type" => type,

            "amount" => amt,

            "time" => DateTime.now().strftime("%d/%m/%y at %H:%M:%S"),

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
            puts "\t\t===================="
            a.each { |k,v|
                puts <<-TEMP
                |#{k} : #{v}
                |--------------------
                TEMP
            }

            i += 1

        }

    end

end

puts <<-MESSAGE

Welcome to Choco-mato Bank v 0.0.0.1
------------------------------------
    \n


MESSAGE
