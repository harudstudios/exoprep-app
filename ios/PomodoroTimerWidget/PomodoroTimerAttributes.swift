import ActivityKit
import SwiftUI

struct PomodoroTimerAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var endTime: Date
        var isPaused: Bool
    }
    
    var projectName: String
    var projectColor: String
    var startTime: Date
}
