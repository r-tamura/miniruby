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

def evaluate(tree)
  operator = tree[0]
  case operator
  when "lit"
    return tree[1]
  when "func_call"
    return p(evaluate(tree[2]))
  else
    return $actions[operator].call(evaluate(tree[1]), evaluate(tree[2]))
  end
end

# Read expression string
program = load_program("./minruby_source.rb")

# 抽象構文木
# TODO: minruby_parseの実装
atree = minruby_parse(program)

# 評価
answer = evaluate(atree)
