public import Initiable

extension Fixture {

    public struct Fallible: Initiable, Equatable {

        public init() throws(Failure) {
            throw .refused
        }
    }
}

extension Fixture.Fallible {

    public enum Failure: Swift.Error, Equatable {
        case refused
    }
}
