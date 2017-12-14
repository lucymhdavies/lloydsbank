# encoding: utf-8
# Include the library files from the Gem
require_relative 'lib/lloydstsb'

# Bring in the settings file - it should contain a hash of @settings with the
# symbol keys :username, :password and :memorable_word
# TODO: this should be dotENV really
require_relative 'settings'

# Create an instance of a Lloyds TSB customer - this is where we login.
customer = LloydsTSB::Customer.new(@settings)
customer.messages.each do |messages|
  puts "Message from your bank: #{message}"
end
puts "These accounts belong to #{customer.name}."

customer.accounts.each do |account|
  puts
  puts "===================="
  puts "Name: #{account.name}"
  puts "Details: #{account.details.inspect}"
  puts "Type: #{account.type.to_s}"
  puts "Balance: #{currencify(account.balance)}"
  puts "Limit: #{currencify(account.limit)}"
  puts "===================="
  puts
end
# customer.accounts[0].get_transactions_from(Date.today - 100)
# puts "Transactions from 100 days ago:"
# customer.accounts[0].transactions.each do |tx|
#     puts "Date: #{tx.date}, Description: #{tx.narrative}, Amount: #{currencify(tx.amount)}"
# end
customer.logoff

