#!/usr/bin/env ruby

require 'cmath'
require_relative 'helpers'

DECIMAL_PLACES = 3
a=nil
b=nil
c=nil

puts "Quadratic equation solution calculator"
puts "   ax^2 + bx + c = 0"
puts ""
puts "Calculate the value(s) of x (aka the roots)."
puts ""

if help_requested
  display_help
  exit
end

a = ARGV[0]
b = ARGV[1]
c = ARGV[2]

if no_args(a,b,c)
  puts "Enter a numeric value for a (cannot be 0):"
  a = gets.chomp
  puts "Enter a numeric value for b:"
  b = gets.chomp
  puts "Enter a numeric value for c:"
  c = gets.chomp
end

a = convert_var_to_float(a)
b = convert_var_to_float(b)
c = convert_var_to_float(c)

if all_args_are_valid(a,b,c)

  puts "The values supplied are:"

  puts "   a = #{a}"
  puts "   b = #{b}"
  puts "   c = #{c}"

  if discriminate(a,b,c) < 0

    puts "Sorry, these values do not have a real solution (it has complex roots)."

  else 

    res1=quad_eq_solution_formula_with_minus(a,b,c)
    res2=quad_eq_solution_formula_with_plus(a,b,c)

    puts "Roots:"
    puts "   #{res1.round(DECIMAL_PLACES)}"
    puts "   #{res2.round(DECIMAL_PLACES)}"

    check_results_are_valid(a,b,c,res1,res2)

    puts "Results displayed to a maximum of #{DECIMAL_PLACES} decimal places."

  end

else
  puts ""
  puts "User error: Arguments supplied are in an incorrect format."
  display_help
end
