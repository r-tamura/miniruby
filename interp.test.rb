require_relative "./interp"

env = {}

program = load_program("./miniruby_programs/1.rb")
atree = minruby_parse(program)
a1 = evaluate(atree, env)
raise "Single statement error" unless a1 == 42

program = load_program("./miniruby_programs/2.rb")
atree = minruby_parse(program)
a2 = evaluate(atree, env)
raise "Multiple statement error" unless a2 == 42

program = load_program("./miniruby_programs/3.rb")
atree = minruby_parse(program)
a3 = evaluate(atree, env)
raise "Variable assignment" unless a3 == 42

program = load_program("./miniruby_programs/4.rb")
atree = minruby_parse(program)
a4 = evaluate(atree, env)
raise "Variable reference" unless a4 == 42

program = load_program("./miniruby_programs/4_1.rb")
atree = minruby_parse(program)
evaluate(atree, env)

program = load_program("./miniruby_programs/5.rb")
atree = minruby_parse(program)
a5 = evaluate(atree, env)
raise "Branch" unless a5 == 42

a6 = evaluate(minruby_parse(load_program("./miniruby_programs/6.rb")), env)
raise "While loop" unless a6 == 42

a7 = evaluate(minruby_parse(load_program("./miniruby_programs/7.rb")), env)
raise "Case" unless a7 == 42

a8 = evaluate(minruby_parse(load_program("./miniruby_programs/8.rb")), env)
raise "FizzBuzz" unless a8 == "FizzBuzz"