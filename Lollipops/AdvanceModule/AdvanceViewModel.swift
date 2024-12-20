import SwiftUI

class AdvanceViewModel: ObservableObject {
    let contact = AdvanceModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
