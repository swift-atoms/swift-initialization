public protocol Initiable: ~Copyable {

    associatedtype Failure: Swift.Error = Never

    init() throws(Failure)
}
