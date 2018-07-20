require "minruby"

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
  if tree[0] == "lit"
    return tree[1]
  else
    operator = tree[0]
    return $actions[operator].call(evaluate(tree[1]), evaluate(tree[2]))
  end
end

# Read expression string
str = gets

# 抽象構文木
atree = minruby_parse(str)

# 評価
answer = evaluate(atree)

# 出力
p(answer)
