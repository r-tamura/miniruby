require "minruby"
require_relative "./modules/load_program"

$actions = {
  "+" => lambda{|a, b| a + b},
  "-" => lambda{|a, b| a - b},
  "*" => lambda{|a, b| a * b},
  "/" => lambda{|a, b| a / b},
  "%" => lambda{|a, b| a % b},
  "**" => lambda{|a, b| a ** b},
  ">" => lambda{|a, b| a > b},
  "<" => lambda{|a, b| a < b},
  "==" => lambda{|a, b| a == b},
}

def evaluate(tree, env)
  operator = tree[0]
  case operator
  when "lit"
    return tree[1]
  when "func_call"
    return p(evaluate(tree[2], env))
  when "stmts"
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i], env)
      i = i + 1
    end
    return last
  when "var_assign"
    return env[tree[1]] = evaluate(tree[2], env)
  when "var_ref"
    return env[tree[1]]
  else
    return $actions[operator].call(evaluate(tree[1], env), evaluate(tree[2], env))
  end
end



if __FILE__ == $0
  # Read expression string
  program = load_program("miniruby_programs/1.rb")

  # 抽象構文木
  # TODO: minruby_parseの実装
  atree = minruby_parse(program)

  # 評価
  answer = evaluate(atree)
end
