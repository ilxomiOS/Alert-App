
import Foundation

struct Reverse {
    public static let model = Reverse()
    
    func reverseString(_ word: String) -> String {
        return String(word.lowercased().reversed())
    }
}
