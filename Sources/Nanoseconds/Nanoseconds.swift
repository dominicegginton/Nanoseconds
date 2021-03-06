import Foundation

public struct Now {
    var rawValue: Double

    public init() {
        self.rawValue = Double(DispatchTime.now().rawValue)
    }
}

extension Now: Comparable {
    public static func < (lhs: Now, rhs: Now) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    public static func - (lhs: Now, rhs: Now) -> TimeInterval {
        TimeInterval(lhs.rawValue - rhs.rawValue)
    }

    public static func + (lhs: Now, rhs: Now) -> TimeInterval {
        TimeInterval(lhs.rawValue + rhs.rawValue)
    }
}

extension TimeInterval {
    public init (nanoseconds: Double) { self = nanoseconds }
    public init (microseconds: Double) { self = microseconds * 1000 }
    public init (milliseconds: Double) { self = milliseconds * 1e+6 }
    public init (seconds: Double) { self = seconds * 1e+9 }
    public init (minutes: Double) { self = minutes * 6e+10 }
    public init (hours: Double) { self = hours * 3.6e+12 }
    public var nanoseconds: Double { return self }
    public var microseconds: Double { return self / 1000 }
    public var milliseconds: Double { return self / 1e+6 }
    public var seconds: Double { return self / 1e+9 }
    public var minutes: Double { return self / 6e+10 }
    public var hours: Double { return self / 3.6e+12 }
}

extension TimeInterval {
    public var timeString: String {
        let date = Date(timeIntervalSince1970: self.seconds)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        if (hours > 0) {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if (minutes > 0) {
            return "\(minutes)m \(seconds)s"
        } else {
            return "\(seconds)s"
        }
    }
}
