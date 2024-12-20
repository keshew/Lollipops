import SwiftUI

class LoseLivesOverViewModel: ObservableObject {
    let contact = LoseLivesOverModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
