import Initialization
import Testing

@Suite
struct `Initialization conformers produce values through the generic protocol` {
    @Test
    func `a conforming producer works through the generic protocol surface`() {
        #expect(produce(Fixture()) == 0)
    }
}

private struct Fixture: Initializing {
    func make() -> Int { 0 }
}

private func produce<Producer: Initializing>(_ producer: Producer) -> Producer.Element
where Producer.Failure == Never {
    producer.make()
}
