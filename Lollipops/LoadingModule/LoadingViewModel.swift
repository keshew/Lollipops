import SwiftUI

public enum AppScreen {
    case menu
    case settings
    case shop
    case stage
    case levelCastle
    case levelCandy
    case advance
    case win
    case lose
    case pause
    case loseLivesOver
    case game
}

class LoadingViewModel: ObservableObject {
    let contact = LoadingModel()
    @Published var currentIndex = 0
    @Published var timer: Timer?
    @Published var currentText = ""
    @Published var index = 2
    
    func loadScreen() -> (String, CGFloat, String, CGFloat) {
        return (contact.arrayOfImages[currentIndex], contact.arrayXOffset[currentIndex], contact.arrayOfText[currentIndex], contact.arraySize[currentIndex])
    }
    
    func startTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
             self.changeText()
         }
     }
    
    func changeText() {
        index -= 1
        if index == -1 {
            index = 2
        }
        currentText = contact.arrayOfText[index]
     }
}
