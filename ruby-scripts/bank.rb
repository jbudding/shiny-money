#!/usr/bin/ruby -w

require 'date'
require 'sqlite3'

class BankAccount

    def initialize(first_name, last_name)

        @first_name, @last_name  = first_name, last_name

        @transactions = []

        @balance = 0

        @db = SQLite3::Database.new("main.db")

    end

    def setup_my_db

        @db.execute <<-SQL

            create table if not exists accounts(
                
                firstname varchar(30) UNIQUE,

                lastname varchar(30),

                balance int

            );
        SQL

    end

    def deposit(amount)

        @transactions << track("deposit", amount)

        return @balance += amount

    end

    def withdraw(amount)

        @transactions << track("withdrawl", amount)

        return @balance -= amount

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

        puts "Your current balance is $#{@balance}"

        return @balance

    end

    def report

        r = @db.execute "select * from accounts"

        r.each do |a|

            puts a.to_s

        end

    end

    def launch

        @db.execute("INSERT INTO accounts VALUES(?, ?, ?)", ["#{@first_name}","#{@last_name}", @balance])

    end

end



