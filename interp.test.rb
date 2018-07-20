require_relative "./interp"

program = load_program("./miniruby_programs/1.rb")
atree = minruby_parse(program)
a1 = evaluate(atree)
raise "Single statement error" unless a1 == 42

program = load_program("./miniruby_programs/2.rb")
atree = minruby_parse(program)
a2 = evaluate(atree)
raise "Multiple statement error" unless a2 == 42
