require "minruby"

def eval(tree)
  if tree[0] == "lit"
    return tree[1]
  else
    if tree[0] == "+"
      return eval(tree[1]) + eval(tree[2])
    elsif tree[0] == "*"
      return eval(tree[1]) * eval(tree[2])
    end
  end
end

# Read expression string
# str = gets

# 抽象構文木
atree = minruby_parse("1 + 2 * 4")
p(atree)

answer = eval(atree)
p(answer)
