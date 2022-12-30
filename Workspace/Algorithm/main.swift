import Foundation

protocol AProtocol {
    associatedtype AType
    var model: AType { get set }
}

extension AProtocol where AType: BProtocol {
    // 어떤 구현이나 선언...
}

struct A<T>: AProtocol {
    typealias AType = T
    var model: AType

//    init() {
//        model = C()
//    }
}

extension A where T: BProtocol {
    init() {
        model = C()
    }
}

protocol BProtocol {}
struct B: BProtocol {}

protocol CProtocol: BProtocol {}
struct C: CProtocol {}
