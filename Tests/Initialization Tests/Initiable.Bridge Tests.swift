import Initialization_Test_Support
import Testing

@Suite
struct `Initiable bridges produce initializer witnesses with preserved failure types` {
    @Suite struct `Initializer witness bridges construct fresh empty values` {}
    @Suite struct `Fallible initialization preserves typed errors through factories and witnesses` {}
    @Suite struct `No initializer witness bridge integration cases are defined` {}
}

extension `Initiable bridges produce initializer witnesses with preserved failure types`.`Initializer witness bridges construct fresh empty values` {

    @Test
    func `a Copyable Initiable yields a canonical initializer witness`() {
        let witness = Fixture.Empty.initializer
        #expect(witness.make() == Fixture.Empty())
    }

    @Test
    func `the bridge witness produces a fresh empty value on each call`() {
        let witness = Fixture.Bag.initializer
        var made = witness.make()
        made.append(1)

        #expect(witness.make().elements.isEmpty)
    }
}

extension `Initiable bridges produce initializer witnesses with preserved failure types`.`Fallible initialization preserves typed errors through factories and witnesses` {

    @Test
    func `a fallible conformer requires try and surfaces its typed error`() {
        #expect(throws: Fixture.Fallible.Failure.refused) {
            _ = try Fixture.Fallible()
        }
    }

    @Test
    func `the generic factory threads a fallible conformer's typed error`() {
        #expect(throws: Fixture.Fallible.Failure.refused) {
            let _: Fixture.Fallible = try Fixture.make()
        }
    }

    @Test
    func `a fallible Initiable's initializer witness propagates the typed error`() {
        let witness = Fixture.Fallible.initializer
        #expect(throws: Fixture.Fallible.Failure.refused) {
            try witness.make()
        }
    }
}
