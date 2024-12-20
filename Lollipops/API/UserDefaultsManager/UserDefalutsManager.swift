import Foundation

enum Keys: String {
    case numberOfLevel = "numberOfLevel"
    case countOfMoney = "countOfMoney"
    case countOfLifes = "countOfLifes"
    case isOn = "isOn"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.numberOfLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(13, forKey: Keys.numberOfLevel.rawValue)
            UserDefaultsManager.defaults.set(100, forKey: Keys.countOfMoney.rawValue)
            UserDefaultsManager.defaults.set(5, forKey: Keys.countOfLifes.rawValue)
        }
    }
    
    func completeLevel() {
        let level = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as? Int ?? 0
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        if level < 18 {
            UserDefaultsManager.defaults.set(level + 1, forKey: Keys.numberOfLevel.rawValue)
            UserDefaultsManager.defaults.set(money + 50, forKey: Keys.countOfMoney.rawValue)
        }
    }
    
    func loseLevel() {
        let heart = UserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0
        if heart > 0 {
            UserDefaultsManager.defaults.set(heart - 1, forKey: Keys.countOfLifes.rawValue)
        }
    
    }

}
