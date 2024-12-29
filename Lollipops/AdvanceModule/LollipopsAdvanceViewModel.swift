import SwiftUI

class LollipopsAdvanceViewModel: ObservableObject {
    let contact = LollipopsAdvanceModel()
    @Published var isHidden = false
    @Published var currentIndex = 0
    
    func lowerIndex() {
        currentIndex -= 1
    }
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func tapOnTree() {
        isHidden = true
    }
    
    func loadImages() -> (String, String, String, String, String, CGFloat) {
        (contact.imageBoost[currentIndex],
         contact.nameOfBoostArray[currentIndex],
         contact.blockFrom[currentIndex],
         contact.blockTo[currentIndex],
         contact.desckOfBoostArray[currentIndex],
         contact.sizeWIBoost[currentIndex])
    }
}
