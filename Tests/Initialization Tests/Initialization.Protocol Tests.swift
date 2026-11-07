import Initialization
import Testing

enum `Initialization.Protocol Tests` {}

extension `Initialization.Protocol Tests` {
    @Suite
    struct `Initialization conformers produce values through the generic protocol` {
        @Test
        func `a conforming producer works through the generic protocol surface`() {
            #expect(produce(Fixture()) == 0)
        }
    }
}

private struct Fixture: Initializing {}

extension Fixture {
    func make() -> Int { 0 }
}

private func produce<Producer: Initializing>(_ producer: Producer) -> Producer.Element
where Producer.Failure == Never {
    producer.make()
}
