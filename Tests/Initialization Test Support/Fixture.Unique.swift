public import Initiable

extension Fixture {

    public struct Unique: ~Copyable, Initiable {

        public var count: Int

        public init() {
            self.count = 0
        }
    }
}
