import Initialization_Test_Support
import Testing

@Suite
struct `Initiable values construct empty instances through direct and generic initialization` {
    @Suite struct `Copyable Initiable values construct empty instances directly and generically` {}
    @Suite struct `Noncopyable Initiable values construct empty instances directly and generically` {}
    @Suite struct `An initialized growable value starts empty and accepts later elements` {}
    @Suite(.serialized) struct `Repeated initialization preserves the empty value` {}
}

extension `Initiable values construct empty instances through direct and generic initialization`.`Copyable Initiable values construct empty instances directly and generically` {

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

extension `Initiable values construct empty instances through direct and generic initialization`.`Noncopyable Initiable values construct empty instances directly and generically` {

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

extension `Initiable values construct empty instances through direct and generic initialization`.`An initialized growable value starts empty and accepts later elements` {

    @Test
    func `a growable discipline starts empty then grows via its own mutation`() {
        var bag: Fixture.Bag = Fixture.make()
        #expect(bag.elements.isEmpty)
        bag.append(1)
        bag.append(2)
        #expect(bag.elements == [1, 2])
    }
}

extension `Initiable values construct empty instances through direct and generic initialization`.`Repeated initialization preserves the empty value` {

    @Test
    func `repeated empty construction stays correct under load`() {
        for _ in 0..<1_000 {
            let value = Fixture.Empty()
            #expect(value.count == 0)
        }
    }
}
