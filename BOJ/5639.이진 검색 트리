
import Foundation

public class TreeNode<T: Comparable> {
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(_ value: T){
        self.value = value
    }
    
    func insert(_ value: T){
        if value < self.value {
            if self.leftChild == nil {
                self.leftChild = TreeNode(value)
            } else {
                self.leftChild?.insert(value)
            }
        } else {
            if self.rightChild == nil{
                self.rightChild = TreeNode(value)
            } else {
                self.rightChild?.insert(value)
            }
        }
    }
}

func postOrder(_ node: TreeNode<Int>){
    if node.leftChild != nil {
        postOrder(node.leftChild!)
    }
    if node.rightChild != nil {
        postOrder(node.rightChild!)
    }
    print(node.value)
    
}

var tree: TreeNode<Int> = TreeNode<Int>(Int(readLine()!)!)

while true {
    let input: String? = readLine()
    
    if input == nil || input == "" {
        break
    }
    
    tree.insert(Int(input!)!)
}

postOrder(tree)
