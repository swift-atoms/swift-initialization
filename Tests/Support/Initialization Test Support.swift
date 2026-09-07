public import Initialization

public enum Fixture {}

extension Fixture {

    public static func make<T: Initiable & ~Copyable>() throws(T.Failure) -> T {
        try T()
    }
}
