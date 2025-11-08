import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private var liveActivityManager: LiveActivityManager?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let timerChannel = FlutterMethodChannel(
            name: "com.yourapp.pomodoro/timer",
            binaryMessenger: controller.binaryMessenger
        )
        
        liveActivityManager = LiveActivityManager()
        
        timerChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else { return }
            
            switch call.method {
            case "requestPermissions":
                self.requestNotificationPermissions(result: result)
            case "startTimer":
                if let args = call.arguments as? [String: Any] {
                    let totalSeconds = args["totalSeconds"] as? Int ?? 1500
                    let projectName = args["projectName"] as? String ?? "Focus"
                    let projectColor = args["projectColor"] as? String ?? "FF5252"
                    
                    self.liveActivityManager?.startLiveActivity(
                        totalSeconds: totalSeconds,
                        projectName: projectName,
                        projectColor: projectColor
                    )
                    result(true)
                } else {
                    result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
                }
            case "pauseTimer":
                self.liveActivityManager?.pauseLiveActivity()
                result(true)
            case "stopTimer":
                self.liveActivityManager?.stopLiveActivity()
                result(true)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func requestNotificationPermissions(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                result(granted)
            }
        }
    }
}
