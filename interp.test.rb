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
