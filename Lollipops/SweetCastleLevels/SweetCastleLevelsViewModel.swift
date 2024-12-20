import SwiftUI

class SweetCastleLevelsViewModel: ObservableObject {
    let contact = SweetCastleLevelsModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
