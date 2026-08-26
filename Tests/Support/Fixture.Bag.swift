public import Initialization

extension Fixture {

    public struct Bag: Initiable, Equatable {

        public var elements: [Int]

        public init() {
            self.elements = []
        }
    }
}

extension Fixture.Bag {

    public mutating func append(_ element: Int) {
        elements.append(element)
    }
}
