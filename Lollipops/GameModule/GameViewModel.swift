import SwiftUI

class GameViewModel: ObservableObject {
    let contact = GameModel()
    
    func createGameScene(gameData: GameData) -> GameSpriteKit {
        let scene = GameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
