import SwiftUI

struct SettingsView: View {
    @StateObject var SettingsModel =  SettingsViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    SettingsView()
}

