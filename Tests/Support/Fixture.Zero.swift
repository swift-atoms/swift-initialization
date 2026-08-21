public import Initialization_Primitives

extension Fixture {

    public struct Zero: Initializing {
        public init() {}
    }
}

extension Fixture.Zero {
    public func make() -> Int { 0 }
}
