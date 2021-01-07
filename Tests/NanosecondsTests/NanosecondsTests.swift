import XCTest
@testable import Nanoseconds

final class NanosecondsTests: XCTestCase {
    func testNowResolution () {
        let start = Now()
        let end = Now()
        XCTAssertGreaterThan(end, start)
    }

    func testNowComparable () {
        let start = Now()
        let end = Now()
        XCTAssertTrue((end - start) as Any is TimeInterval)
        XCTAssertGreaterThan(end - start, 0)
        XCTAssertTrue((start + end) as Any is TimeInterval)
        XCTAssertTrue((start < end) as Any is Bool)
        XCTAssertEqual(start < end, true)
        XCTAssertTrue((start > end) as Any is Bool)
        XCTAssertEqual(start > end, false)
    }

    func testTimeIntervalInitMethods () {
        let nanosecond: TimeInterval = TimeInterval(nanoseconds: 1)
        XCTAssertEqual(nanosecond, 1)
        let microsecond: TimeInterval = TimeInterval(microseconds: 1)
        XCTAssertEqual(microsecond, 1000)
        let milliseconds: TimeInterval = TimeInterval(milliseconds: 1)
        XCTAssertEqual(milliseconds, 1e+6)
        let seconds: TimeInterval = TimeInterval(seconds: 1)
        XCTAssertEqual(seconds, 1e+9)
        let minutes: TimeInterval = TimeInterval(minutes: 1)
        XCTAssertEqual(minutes, 6e+10)
        let hours: TimeInterval = TimeInterval(hours: 1)
        XCTAssertEqual(hours, 3.6e+12)
    }

    func testTimeIntervalUnitConversion () {
        let minute: TimeInterval = TimeInterval(minutes: 1)
        XCTAssertEqual(minute, 6e+10)
        XCTAssertEqual(minute.nanoseconds, 6e+10)
        XCTAssertEqual(minute.microseconds, 6e+7)
        XCTAssertEqual(minute.milliseconds, 60000)
        XCTAssertEqual(minute.seconds, 60)
        XCTAssertEqual(minute.minutes, 1)
        XCTAssertEqual(minute.hours, 0.016666666666666666)
    }
}
