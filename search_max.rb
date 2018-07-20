=begin
  木の葉の最大値を出力するプログラム
=end
require "minruby"

def max(tree)
  if tree[0] == "lit"
    return tree[1]
  else
    return [max(tree[1]), max(tree[2])].max
  end
end

tree = minruby_parse("2 + 3*4 / 10 + 20 + 9")

answer = max(tree)

p answer
# -> 20