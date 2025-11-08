import Foundation
import ActivityKit

class LiveActivityManager {
    
    private var currentActivity: Activity<PomodoroTimerAttributes>?
    
    @available(iOS 16.1, *)
    func startLiveActivity(totalSeconds: Int, projectName: String, projectColor: String) {
        stopLiveActivity()
        
        let startTime = Date()
        let endTime = startTime.addingTimeInterval(TimeInterval(totalSeconds))
        
        let attributes = PomodoroTimerAttributes(
            projectName: projectName,
            projectColor: projectColor,
            startTime: startTime
        )
        
        let contentState = PomodoroTimerAttributes.ContentState(
            endTime: endTime,
            isPaused: false
        )
        
        do {
            let activity = try Activity<PomodoroTimerAttributes>.request(
                attributes: attributes,
                contentState: contentState,
                pushType: nil
            )
            currentActivity = activity
            print("Live Activity started: \(activity.id)")
        } catch {
            print("Error starting Live Activity: \(error.localizedDescription)")
        }
    }
    
    @available(iOS 16.1, *)
    func pauseLiveActivity() {
        guard let activity = currentActivity else { return }
        
        let currentState = activity.contentState
        let pausedState = PomodoroTimerAttributes.ContentState(
            endTime: currentState.endTime,
            isPaused: true
        )
        
        Task {
            await activity.update(using: pausedState)
        }
    }
    
    @available(iOS 16.1, *)
    func stopLiveActivity() {
        guard let activity = currentActivity else { return }
        
        Task {
            await activity.end(dismissalPolicy: .immediate)
            currentActivity = nil
        }
    }
}
