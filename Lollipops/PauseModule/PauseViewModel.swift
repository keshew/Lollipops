import SwiftUI

class PauseViewModel: ObservableObject {
    let contact = PauseModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
