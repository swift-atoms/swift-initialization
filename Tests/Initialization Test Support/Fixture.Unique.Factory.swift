public import Initiable

extension Fixture.Unique {

    public struct Factory: Initializing {
        public init() {}
    }
}

extension Fixture.Unique.Factory {
    public func make() -> Fixture.Unique { Fixture.Unique() }
}
