import SwiftUI

@main
struct LollipopsApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
