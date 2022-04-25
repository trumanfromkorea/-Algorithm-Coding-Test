import Foundation

let n: Int = Int(readLine()!)!
let trie = Trie()

for _ in 0 ..< n {
    let line = readLine()!.split(separator: "\\").map { String($0) }

    trie.insert(words: line)
}

trie.traversal(node: trie.root, depth: -1)

// MARK: 선언

class TrieNode {
    var key: String?

    weak var parent: TrieNode?
    var children: [String: TrieNode] = [:]
    var isLeaf: Bool {
        return children.isEmpty
    }

    init(key: String? = nil, parent: TrieNode? = nil) {
        self.key = key
        self.parent = parent
    }
}

class Trie {
    let root: TrieNode

    init() {
        root = TrieNode()
    }

    // 문자열을 통해 노드 삽입
    func insert(words: [String]) {
        var currentNode = root

        for word in words {
            // 현재 노드의 자식 노드에 존재하는 경우 -> 현재 노드 변경
            if let childNode = currentNode.children[word] {
                currentNode = childNode
            }

            // 존재하지 않는경우
            else {
                let newNode = TrieNode(key: word, parent: currentNode)
                currentNode.children[word] = newNode
                currentNode = newNode
            }
        }
    }

    // 탐색
    func traversal(node: TrieNode, depth: Int) {
        // 깊이 나타내기
        if let key = node.key {
            var indent = ""
            for _ in 0 ..< depth {
                indent += " "
            }
            print(indent + key)
        }

        // 리프노드의 경우 재귀 탈출
        guard !node.isLeaf
        else {
            return
        }

        // 자식들 사전순 탐색 위해 딕셔너리 정렬
        let sortedChildren = node.children.sorted(by: { $0.0 < $1.0 })

        // 재귀로 탐색
        for child in sortedChildren {
            traversal(node: child.value, depth: depth + 1)
        }
    }
}
