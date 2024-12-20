import SwiftUI

class LoadingViewModel: ObservableObject {
    let contact = LoadingModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
