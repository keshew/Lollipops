import SwiftUI

class StageViewModel: ObservableObject {
    let contact = StageModel()
    @Published var currentIndex = 0
    
    func loadImages() -> (String, String, String, String, CGFloat, CGSize) {
        return (contact.playImageArray[currentIndex],
                contact.stageImagesArray[currentIndex],
                contact.stageNameArray[currentIndex],
                contact.progressInProcent[currentIndex],
                contact.sizePlayImages[currentIndex],
                contact.offsetPlayImages[currentIndex])
    }
    
    func lowerIndex() {
        currentIndex -= 1
    }
    
    func increaseIndex() {
        currentIndex += 1
    }
}
