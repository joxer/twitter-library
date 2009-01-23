require '../main.rb'

t = Tweet::Status.new("joxer92", "QAZWSXEDC")
da = gets.chop
t.delete(da)
