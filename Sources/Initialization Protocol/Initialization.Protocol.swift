extension Initialization {

    public protocol `Protocol`<Element, Failure>: ~Copyable {

        associatedtype Element: ~Copyable

        associatedtype Failure: Swift.Error = Never

        borrowing func make() throws(Failure) -> Element
    }
}
