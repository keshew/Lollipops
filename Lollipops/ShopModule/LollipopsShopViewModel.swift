import SwiftUI

class LollipopsShopViewModel: ObservableObject {
    let contact = LollipopsShopModel()
    @Published var currentIndex = 0
    
    func buy() {
        
    }
    func lowerIndex() {
        currentIndex -= 1
    }
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func loadImages() -> (String, String, String) {
        (contact.arrayImageCandy[currentIndex], contact.arrayNameCandy[currentIndex], contact.arrayOfCost[currentIndex])
    }
}
