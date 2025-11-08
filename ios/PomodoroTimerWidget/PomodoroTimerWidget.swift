import ActivityKit
import WidgetKit
import SwiftUI

@main
struct PomodoroTimerWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PomodoroTimerAttributes.self) { context in
            PomodoroTimerLockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.attributes.projectName)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    Text(timerInterval: context.state.endTime, countsDown: true)
                        .font(.title2)
                        .fontWeight(.bold)
                        .monospacedDigit()
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    ProgressView(
                        timerInterval: context.attributes.startTime...context.state.endTime,
                        countsDown: false
                    )
                    .tint(colorFromHex(context.attributes.projectColor))
                    .padding(.horizontal)
                }
            } compactLeading: {
                Image(systemName: context.state.isPaused ? "pause.circle.fill" : "timer")
                    .foregroundColor(colorFromHex(context.attributes.projectColor))
            } compactTrailing: {
                Text(timerInterval: context.state.endTime, countsDown: true)
                    .font(.caption)
                    .monospacedDigit()
            } minimal: {
                Image(systemName: "timer")
                    .foregroundColor(colorFromHex(context.attributes.projectColor))
            }
        }
    }
    
    private func colorFromHex(_ hex: String) -> Color {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.hasPrefix("#") ? hex.index(after: hex.startIndex) : hex.startIndex
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: r, green: g, blue: b)
    }
}

struct PomodoroTimerLockScreenView: View {
    let context: ActivityViewContext<PomodoroTimerAttributes>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(colorFromHex(context.attributes.projectColor))
                    .frame(width: 4, height: 20)
                
                Text(context.attributes.projectName)
                    .font(.headline)
                
                Spacer()
                
                Text(timerInterval: context.state.endTime, countsDown: true)
                    .font(.title2)
                    .fontWeight(.bold)
                    .monospacedDigit()
            }
            
            ProgressView(
                timerInterval: context.attributes.startTime...context.state.endTime,
                countsDown: false
            )
            .tint(colorFromHex(context.attributes.projectColor))
            
            if context.state.isPaused {
                Text("Paused")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
    
    private func colorFromHex(_ hex: String) -> Color {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.hasPrefix("#") ? hex.index(after: hex.startIndex) : hex.startIndex
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: r, green: g, blue: b)
    }
}
