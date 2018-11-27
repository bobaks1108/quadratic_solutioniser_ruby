#!/usr/bin/env ruby
#
# import CMath library
#
require 'cmath'

DECIMAL_PLACES = 3

puts "Quadratic equation solution calculator"
puts "   ax^2 + bx + c = 0"

def display_help
  puts <<-EOF
  
Help:

   Usage: ./quadratic_sol.rb [arguments]

   You must supply the arguments as 3 numeric 
   numbers for a, b and c of the quadratic equation, 
   the value of a cannot be 0, but all values can 
   be negative.

  EOF
end

def formula_part1(b)
  b*-1
end

def discriminate(a,b,c)
  (b*b) - (4*a*c)
end

def formula_part2(a,b,c)
  Math.sqrt(discriminate(a,b,c))
end

def formula_part3(a)
  2*a
end

def quad_eq_solution_formula_with_plus(a,b,c)
  (formula_part1(b) + formula_part2(a,b,c)) / formula_part3(a)
end

def quad_eq_solution_formula_with_minus(a,b,c)
  (formula_part1(b) - formula_part2(a,b,c)) / formula_part3(a)
end

def help_requested
   ARGV[0] == "-h" or ARGV[0] == "-help"
end

def all_args_are_valid(a,b,c)
   a != 0 and [a,b,c].all?
end

def check_results_are_valid(a,b,c,resa, resb)

  check_resa = a*(resa*resa) + b*resa + c
  check_resb = a*(resb*resb) + b*resb + c

  check_resa=check_resa.round(DECIMAL_PLACES)
  check_resb=check_resb.round(DECIMAL_PLACES)

  if check_resa == 0 and check_resb == 0
    puts "Result verified."
  else
    puts "   Something went wrong. Verification test failed."
    puts "   Check 1 - Should be 0 but got: #{resa}"
    puts "   Check 2 - Should be 0 but got: #{resb}"
  end
end

if help_requested
  display_help
  exit
end

a = Float(ARGV[0]) rescue false
b = Float(ARGV[1]) rescue false
c = Float(ARGV[2]) rescue false

if all_args_are_valid(a,b,c)

  puts "The values supplied are:"

  puts "   a = #{a}"
  puts "   b = #{b}"
  puts "   c = #{c}"

  if discriminate(a,b,c) < 0
    puts "Sorry, these values do not have a real solution (it has complex roots)"
    exit
  end

  resa=quad_eq_solution_formula_with_minus(a,b,c)
  resb=quad_eq_solution_formula_with_plus(a,b,c)

  puts "Roots:"
  puts "   #{resa.round(DECIMAL_PLACES)}"
  puts "   #{resb.round(DECIMAL_PLACES)}"

  check_results_are_valid(a,b,c,resa,resb)

  puts "Results displayed to #{DECIMAL_PLACES} decimal places."

else
  puts ""
  puts "User error: Incorrect arguments supplied."
  display_help
end





