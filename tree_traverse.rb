=begin
  木をトラバースする関数
=end
def preorder(tree)
  p(tree[0])
  if (tree[0].start_with?("節"))
    preorder(tree[1])
    preorder(tree[2])
  end
end

def postorder(tree)
  if (tree[0].start_with?("節"))
    postorder(tree[1])
    postorder(tree[2])
  end
  p(tree[0])
end

node = ["節1", ["節2", ["葉A"], ["葉B"]], ["節3", ["葉C"], ["葉D"]]]

p(" - preorder")
preorder(node)

p(" - postorder")
postorder(node)