public import Initialization_Primitives

extension Fixture {

    public struct Unique: ~Copyable, Initiable {

        public var count: Int

        public init() {
            self.count = 0
        }
    }
}
