////
////  AppDelegate.swift
////  Myntra_Clone
////
////  Created by apple on 25/07/25.
////
//
//import UIKit
//import FirebaseCore
//import FirebaseFirestore
//import UserNotifications
//
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        FirebaseApp.configure()
//        application.registerForRemoteNotifications()
//            UNUserNotificationCenter.current().delegate = self
//        return true
//    }
//    func application(_ application: UIApplication,
//                       didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        Auth.auth().setAPNSToken(deviceToken, type: .prod)
//        // If you're using Firebase Messaging:
//        // Messaging.messaging().apnsToken = deviceToken
//      }
//    func application(_ application: UIApplication,
//                       didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                       fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        if Auth.auth().canHandleNotification(userInfo) {
//          completionHandler(.noData)
//          return
//        }
//        // Handle other notifications here if needed
//        completionHandler(.newData)
//      }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//
//}
//
import UIKit
import FirebaseCore
import FirebaseAuth        // make sure Auth is imported
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        // Ask permission (optional UI) and register for remote notifications
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        return true
    }

    // APNs token received
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Pass token to Firebase Auth (use .sandbox for Debug, .prod for AppStore builds)
        Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
        // If you also use Firebase Messaging uncomment:
        // Messaging.messaging().apnsToken = deviceToken
    }

    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed:", error)
    }

    // Background / silent notif path — MUST forward to Auth if it's for Firebase phone auth
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if Auth.auth().canHandleNotification(userInfo) {
            // Firebase handled the verification notification
            completionHandler(.noData)
            return
        }

        // Your normal notification handling here
        completionHandler(.newData)
    }

    // Foreground / user tapped notification — also forward
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler()
            return
        }
        // Handle other notification types
        completionHandler()
    }

    // MARK: UISceneSession Lifecycle (keep as-is)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
