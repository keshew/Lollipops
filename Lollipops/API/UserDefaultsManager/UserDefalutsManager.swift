import Foundation

enum Keys: String {
    case numberOfLevel = "numberOfLevel"
    case countOfMoney = "countOfMoney"
    case countOfLifes = "countOfLifes"
    case isOn = "isOn"
}

class LollipopsUserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func firstLaunch() {
        if LollipopsUserDefaultsManager.defaults.string(forKey: Keys.numberOfLevel.rawValue) == nil {
            LollipopsUserDefaultsManager.defaults.set(13, forKey: Keys.numberOfLevel.rawValue)
            LollipopsUserDefaultsManager.defaults.set(100, forKey: Keys.countOfMoney.rawValue)
            LollipopsUserDefaultsManager.defaults.set(5, forKey: Keys.countOfLifes.rawValue)
        }
    }
    
    func completeLevel() {
        let level = LollipopsUserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as? Int ?? 0
        let money = LollipopsUserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        if level < 18 {
            LollipopsUserDefaultsManager.defaults.set(level + 1, forKey: Keys.numberOfLevel.rawValue)
            LollipopsUserDefaultsManager.defaults.set(money + 50, forKey: Keys.countOfMoney.rawValue)
        }
    }
    
    func loseLevel() {
        let heart = LollipopsUserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0
        if heart > 0 {
            LollipopsUserDefaultsManager.defaults.set(heart - 1, forKey: Keys.countOfLifes.rawValue)
        }
    
    }

}
