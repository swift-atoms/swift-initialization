import Initialization
import Testing

@Suite
struct `Initialization Tests` {
    @Test
    func `the namespace supports operation-specific extensions`() {
        #expect(MemoryLayout<Initialization.Fixture>.size == 0)
    }
}

extension Initialization {
    fileprivate enum Fixture {}
}
