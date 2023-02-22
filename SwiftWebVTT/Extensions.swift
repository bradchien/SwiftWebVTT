import Foundation

public extension Collection {
    func item(at index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}

public extension String {
    func characters() -> [Character] { return Array(self) }
}
