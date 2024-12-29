import SwiftUI

@main
struct LollipopsApp: App {
    var body: some Scene {
        WindowGroup {
            LollipopsLoadingView()
                .onAppear {
                    LollipopsUserDefaultsManager().firstLaunch()
                }
        }
    }
}
