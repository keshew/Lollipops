import SwiftUI

class CandyFactoryLevelsViewModel: ObservableObject {
    let contact = CandyFactoryLevelsModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
