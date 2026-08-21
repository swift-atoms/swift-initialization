public import Initialization_Primitives

extension Fixture {

    public struct Empty: Initiable, Equatable {

        public var count: Int

        public init() {
            self.count = 0
        }
    }
}
