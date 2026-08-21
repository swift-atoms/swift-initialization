import Initialization_Primitives_Test_Support
import Testing

@Suite
struct `Initiable Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `Initiable Tests`.Unit {

    @Test
    func `Copyable conformer constructs its empty value via init`() {
        let value = Fixture.Empty()
        #expect(value.count == 0)
    }

    @Test
    func `generic factory constructs an Initiable from the type alone`() {
        let value: Fixture.Empty = Fixture.make()
        #expect(value == Fixture.Empty())
    }
}

extension `Initiable Tests`.`Edge Case` {

    @Test
    func `move-only conformer constructs its empty value via init`() {
        let value = Fixture.Unique()
        #expect(value.count == 0)
    }

    @Test
    func `the generic factory constructs a move-only Initiable through the suppression`() {
        let value: Fixture.Unique = Fixture.make()
        #expect(value.count == 0)
    }
}

extension `Initiable Tests`.Integration {

    @Test
    func `a growable discipline starts empty then grows via its own mutation`() {
        var bag: Fixture.Bag = Fixture.make()
        #expect(bag.elements.isEmpty)
        bag.append(1)
        bag.append(2)
        #expect(bag.elements == [1, 2])
    }
}

extension `Initiable Tests`.Performance {

    @Test
    func `repeated empty construction stays correct under load`() {
        for _ in 0..<1_000 {
            let value = Fixture.Empty()
            #expect(value.count == 0)
        }
    }
}
