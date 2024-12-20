import SwiftUI

class CandyFactoryLevelsViewModel: ObservableObject {
    let contact = CandyFactoryLevelsModel()
    
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
