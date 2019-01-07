# return true if help is requested
def help_requested
   ARGV[0] == "-h" or ARGV[0] == "-help"
end

# printout help to the screen
def display_help
  puts <<-EOF
  
Help:

   Usage: ./quadratic_sol.rb [arguments]

   When calling the script as above, you can supply 3 numeric 
   numbers the arguments for a, b and c of the quadratic equation, 
   the value of a cannot be 0, but all values can be negative. 
   E.g. ./quadratic_sol.rb 5 6 1

   If you do not supply any arguments then the program
   will ask you to enter them.

  EOF
end

# this is the first part of the Quadratic Formula (-b)
def formula_part1(param_b)
  param_b*-1
end

# The discriminant is the bit of the Quadratic Formula 
# within the square root symbol (b²-4ac). 
# If the discriminant is above 0 then there are two solutions,
# if it is zero it means there is one solution, 
# if it is negative it means no solutions.
def discriminate(param_a,param_b,param_c)
  (param_b*param_b) - (4*param_a*param_c)
end

# The second part of the Quadratic formula
# this is the square root of the discriminate (b²-4ac)
def formula_part2(param_a,param_b,param_c)
  Math.sqrt(discriminate(param_a,param_b,param_c))
end

# The third part of the Quadratic Formula (divded by 2a).
def formula_part3(param_a)
  2*param_a
end

# The full Quadratic Formula with plus
def quad_eq_solution_formula_with_plus(param_a,param_b,param_c)
  (formula_part1(param_b) + formula_part2(param_a,param_b,param_c)) / formula_part3(param_a)
end

# The full Quadratic Formula with minus
def quad_eq_solution_formula_with_minus(param_a,param_b,param_c)
  (formula_part1(param_b) - formula_part2(param_a,param_b,param_c)) / formula_part3(param_a)
end

# Check all args are valid ie. a is not 0 that none of the parameters supplied are nil
def all_args_are_valid(param_a,param_b,param_c)
   param_a != 0 and [param_a,param_b,param_c].all?
end

# Check all args are supplied
def no_args(param_a,param_b,param_c)
   (param_a == false and param_b == false and param_c == false) or    
   (param_a == nil and param_b == nil and param_c == nil) 
end

# Check both results for x are correct by checking that ax²+bx+c does equal 0 
# rounded to the number of decimal places set at the start code (default is 3)
def check_results_are_valid(param_a,param_b,param_c,res1, res2)

  check_res1 = param_a*(res1*res1) + param_b*res1 + param_c
  check_res2 = param_a*(res2*res2) + param_b*res2 + param_c

  check_res1=check_res1.round(DECIMAL_PLACES)
  check_res2=check_res2.round(DECIMAL_PLACES)

  if check_res1 == 0 and check_res2 == 0
    puts "Result verified."
  else
    puts "   Something went wrong. Verification test failed."
    puts "   Check 1 - Should be 0 but got: #{res1}"
    puts "   Check 2 - Should be 0 but got: #{res2}"
  end
end

# Convert the parameter supplied to a float (i.e. a number that can have decimal values) 
def convert_var_to_float(param_a)
  param_a = Float(param_a) rescue false
end 
