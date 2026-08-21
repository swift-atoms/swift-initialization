extension Initialization {

    public struct Witness<Element, Failure: Swift.Error>: Initialization.`Protocol` {
        @usableFromInline
        internal let _make: () throws(Failure) -> Element

        @inlinable
        public init(_ make: @escaping () throws(Failure) -> Element) {
            self._make = make
        }
    }
}

extension Initialization.Witness {

    @inlinable
    public borrowing func make() throws(Failure) -> Element {
        try _make()
    }
}

extension Initialization.Witness {

    @inlinable
    public init<Source: Initialization.`Protocol`>(_ source: Source)
    where Source.Element == Element, Source.Failure == Failure {
        self.init { () throws(Failure) -> Element in
            try source.make()
        }
    }
}
