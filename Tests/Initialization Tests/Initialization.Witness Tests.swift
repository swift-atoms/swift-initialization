import Initialization_Test_Support
import Testing

@Suite
struct `Initializer witnesses preserve produced values and typed failures` {
    @Suite struct `Infallible initializer witnesses produce reusable values and remain copyable` {}
    @Suite struct `Fallible initializer witnesses propagate their declared errors` {}
    @Suite struct `Initializer witnesses and protocol aliases support custom and noncopyable producers` {}
}

extension `Initializer witnesses preserve produced values and typed failures`.`Infallible initializer witnesses produce reusable values and remain copyable` {

    @Test
    func `an infallible witness produces its value with no try`() {
        let witness = Initialization.Witness<Int, Never> { 42 }
        #expect(witness.make() == 42)
    }

    @Test
    func `a stateless witness is reusable across repeated make calls`() {
        let witness = Initialization.Witness<[Int], Never> { [] }
        let first = witness.make()
        let second = witness.make()
        #expect(first == second)
        #expect(first.isEmpty)
    }

    @Test
    func `the witness is Copyable and lives in a collection`() {
        let factories = [
            Initialization.Witness<Int, Never> { 1 },
            Initialization.Witness<Int, Never> { 2 },
        ]
        #expect(factories.map { $0.make() } == [1, 2])
    }
}

extension `Initializer witnesses preserve produced values and typed failures`.`Fallible initializer witnesses propagate their declared errors` {

    @Test
    func `a fallible witness propagates its typed error`() {
        let witness = Initialization.Witness<Int, Fixture.Fallible.Failure> {
            () throws(Fixture.Fallible.Failure) -> Int in
            throw .refused
        }
        #expect(throws: Fixture.Fallible.Failure.refused) {
            try witness.make()
        }
    }
}

extension `Initializer witnesses preserve produced values and typed failures`.`Initializer witnesses and protocol aliases support custom and noncopyable producers` {

    @Test
    func `the witness type-erases a conforming factory`() {
        let erased = Initialization.Witness(Fixture.Zero())
        #expect(erased.make() == 0)
    }

    @Test
    func `a custom Initializing conformer produces through the gerund-aliased protocol`() {
        func run<I: Initializing>(_ factory: borrowing I) throws(I.Failure) -> I.Element {
            try factory.make()
        }
        #expect(run(Fixture.Zero()) == 0)
    }

    @Test
    func `a custom Initializing conformer produces a move-only Element`() {
        let factory = Fixture.Unique.Factory()
        let made = factory.make()
        #expect(made.count == 0)
    }
}
