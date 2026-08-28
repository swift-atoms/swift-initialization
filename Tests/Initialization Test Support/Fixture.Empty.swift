public import Initiable

extension Fixture {

    public struct Empty: Initiable, Equatable {

        public var count: Int

        public init() {
            self.count = 0
        }
    }
}
