require '../main.rb'
puts "username:"
username =  gets.chop

puts "passwd:"
passwd = gets.chop
t = Tweet::Status.new("#{username}", "#{passwd}")
puts "insert data to post"
data = gets
t.status("#{data}")
