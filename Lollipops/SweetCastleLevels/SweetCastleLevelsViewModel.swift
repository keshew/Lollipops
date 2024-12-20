import SwiftUI

class SweetCastleLevelsViewModel: ObservableObject {
    let contact = SweetCastleLevelsModel()
    
    func goToPlay() {
        
    }
    
    func setupLevel(index: Int) -> String {
        var сarthageLevel: String
        let currentLevel = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as! Int
        if index == currentLevel {
            сarthageLevel = ImageName.currentLevel.rawValue
        } else if currentLevel > index {
            сarthageLevel = ImageName.doneLevel.rawValue
        } else {
            сarthageLevel = ImageName.lockedLevel.rawValue
        }
        return сarthageLevel
    }
}
