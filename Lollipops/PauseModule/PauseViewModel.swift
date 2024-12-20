import SwiftUI

class PauseViewModel: ObservableObject {
    let contact = PauseModel()
    @Published var currentIndex = 4
    @Published var isSoundDisabled = false
    
    func lowerIndex() {
        currentIndex -= 1
    }
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func setImage() -> String {
        var image = ImageName.disabledSound.rawValue
        if isSoundDisabled {
            image = ImageName.disabledSound.rawValue
        } else {
            image = ImageName.soundOn.rawValue
        }
        return image
    }
    
    func setImageSounOff() -> String {
        var image = ImageName.soundOf.rawValue
        if isSoundDisabled {
            image = ImageName.turnedOffSound.rawValue
        } else {
            image = ImageName.soundOf.rawValue
        }
        return image
    }
    
    func disableSound() {
        if !isSoundDisabled {
            isSoundDisabled = true
        }
    }
    
    func enableSound() {
        if isSoundDisabled {
            isSoundDisabled = false
        }
    }
}
