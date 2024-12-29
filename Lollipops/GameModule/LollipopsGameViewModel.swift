import SwiftUI

class LollipopsGameViewModel: ObservableObject {
    let contact = LollipopsGameModel()
    
    func createGameScene(gameData: LollipopsGameData) -> LollipopsGameSpriteKit {
        let scene = LollipopsGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
