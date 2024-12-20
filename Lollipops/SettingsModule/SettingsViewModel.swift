import SwiftUI

class SettingsViewModel: ObservableObject {
    let contact = SettingsModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
