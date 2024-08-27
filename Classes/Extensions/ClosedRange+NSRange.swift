import Foundation

extension ClosedRange where Bound == Int {
    var nsRange: NSRange { 
        let length = upperBound - lowerBound
        if length < 0 {
            return .init(location: lowerBound, length: 0)
        }
        return .init(location: lowerBound, length: length)
    }
}
