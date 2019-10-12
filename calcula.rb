# ask the user for two numbers
# ask the user for an opration to perform
# perform the operation on the two numbers
# output the result

#We define this method so that message gets a "=>"

def prompt(message)
  Kernel.puts("=> #{message}")
end
#defines valid number, not equivalent to 0, so when user types a wrong number/integer he gets a message from the promt

def valid_number?(num)
  num.to_i() != 0
end
#in order to add the proper word to our case statement we define operation_to_message

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt ("Greetings, stranger, what's your name?")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt ("Hi #{name}!")
#main loop
loop do
number1 = ''
  loop do
    prompt("Please enter the first numbo")
    number1 = Kernel.gets().chomp()

  if valid_number?(number1)
    break
  else
    prompt("Hmm... that doesn't look like a number we can work with")
  end
end

number2 = ''
loop do
  prompt("Please enter second numbo")
  number2 = Kernel.gets().chomp()

  if valid_number?(number2)
    break
  else
    prompt("Hmm... that doesn't look like a number we can work with")
  end
end

operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subbtract
  3) divide
  4) multiply
MSG

prompt(operator_prompt)

operator = ''
loop do
  operator = Kernel.gets().chomp()
  #%w used to write an array of strings separated by spaces instead of commas and without quotes around em.

  if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

prompt("#{operation_to_message(operator)} the two numbers...")

result = case operator
when '1'
  number1.to_i + number2.to_i
when '2'
  number1.to_i - number2.to_i
when '3'
  number1.to_f / number2.to_f
when '4'
  number1.to_i * number2.to_i
end


puts "The result is #{result}!"

prompt("Do you want to perform another calculation? (Y to calculate again)")
answer = Kernel.gets().chomp()
break unless answer.downcase().start_with?('y')
end

#Most Rubyists don't invoke methods with parentheses, unless they're passing in an argument.
#For example, we use name.empty(), but most Rubyists would write
#name.empty?. Some Rubyists even go as far as not putting parentheses around method
#calls even when passing in arguments. For example, they would write
#prompt "Hi there" as opposed to prompt("hi there")

#We're using Kernel.puts() and Kernel.gets(). But the Kernel is extraneous
#as well as the parentheses. Therefore, we can just call those methods by
#gets and puts. We already know that in Ruby we can omit the parentheses
#but how come we can also omit the Kernel.?
# When we write Ruy code that's not a class we are working within an object called
# main, which is an instance of object. The kernel module is automatically loaded by object,
# giving us access to all of it methods
