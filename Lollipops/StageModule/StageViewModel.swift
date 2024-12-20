import SwiftUI

class StageViewModel: ObservableObject {
    let contact = StageModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
