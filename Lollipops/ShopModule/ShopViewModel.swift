import SwiftUI

class ShopViewModel: ObservableObject {
    let contact = ShopModel()
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
