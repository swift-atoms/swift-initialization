import Initialization
import Initialization_Test_Support
import Testing

@Suite
struct `Standard collections construct empty values through initialization protocols` {
    @Suite struct `Growable standard collections construct empty values from their types` {}
    @Suite struct `No standard collection initialization boundary cases are defined` {}
    @Suite struct `Standard collection initializer witnesses produce fresh empty values` {}
}

extension `Standard collections construct empty values through initialization protocols`.`Growable standard collections construct empty values from their types` {

    @Test
    func `the growable collections conform and construct empty from the type alone`() {
        let array: [Int] = Fixture.make()
        let contiguous: ContiguousArray<Int> = Fixture.make()
        let slice: ArraySlice<Int> = Fixture.make()
        let set: Set<Int> = Fixture.make()
        let dictionary: [String: Int] = Fixture.make()
        let string: String = Fixture.make()
        let substring: Substring = Fixture.make()

        #expect(array.isEmpty)
        #expect(contiguous.isEmpty)
        #expect(slice.isEmpty)
        #expect(set.isEmpty)
        #expect(dictionary.isEmpty)
        #expect(string.isEmpty)
        #expect(substring.isEmpty)
    }
}

extension `Standard collections construct empty values through initialization protocols`.`Standard collection initializer witnesses produce fresh empty values` {

    @Test
    func `a stdlib conformer's initializer-witness bridge produces a fresh empty value`() {
        let witness = [Int].initializer
        #expect(witness.make().isEmpty)
    }
}
