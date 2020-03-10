import Foundation

extension Array {
    public func grouped<Key: Hashable>(by selectKey: (Element) -> Key) -> [[Element]] {
        var groups = [Key: [Element]]()

        for element in self {
            let key = selectKey(element)

            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
            }
        }

        return groups.map { $0.value }
    }

    public func safeGet(_ index: Int) -> Element? {
        guard index < count else { return nil }
        return self[index]
    }
}
