import SwiftUI
import SpriteKit

//struct CBitMask {
//    static let ball: UInt32 = 7
//}

enum Direction {
    case left, right, up, down
}

class Item: SKSpriteNode {
    init(texture: SKTexture,
         position: CGPoint,
         categoryBitMask: UInt32,
         contactTestBitMask: UInt32,
         size: CGFloat) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.size = CGSize(width: size, height: size)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size, height: size))
        self.physicsBody?.categoryBitMask = categoryBitMask
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.contactTestBitMask = contactTestBitMask
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class GameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isPause = false
    @Published var timeLeft = 180
    @Published var moveCount = 10
    @Published var firstItemCount = 3
    @Published var secondItemCount = 3
    @Published var isLoseLivesOver = false
}

class GameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: GameData?
    let rows = 6
    let cols = 6
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 6), count: 6)
    var firstElementOriginalPosition: CGPoint?
    var secondElementOriginalPosition: CGPoint?
    var selectedNode: SKSpriteNode?
    var startTouchPosition: CGPoint?
    var goalFirstItem: SKSpriteNode!
    var goalSecondItem: SKSpriteNode!
    var timer: Timer!
    var time: SKLabelNode!
    var countOfFirstItem: SKLabelNode!
    var countOfSecondItem: SKLabelNode!
    var moveCount: SKLabelNode!
    
    //MARK: - GAME
    func initializeGame() {
        for row in 0..<rows {
            for col in 0..<cols {
                addElement(atRow: row, col: col)
              
            }
        }
    }
    
    func addElement(atRow row: Int, col: Int) {
        let randomItem = getRandomItem().randomElement()
        let element = SKSpriteNode(imageNamed: randomItem!)
        element.size = CGSize(width: size.width / 7.9, height: size.width / 8.1)
        element.position = CGPoint(x: CGFloat(col) * size.width / 6.3 + CGFloat(size.width / 9.5),
                                   y: self.size.height / 1.4 - CGFloat(row) * size.width / 6.23 - size.width / 4.8)
        element.name = randomItem
        self.addChild(element)
        board[row][col] = element
    }
    
    func getRandomItem() -> [String] {
        let allItems: [String] = [ImageName.item1.rawValue,
                                  ImageName.item2.rawValue,
                                  ImageName.item3.rawValue,
                                  ImageName.item4.rawValue,
//                                  ImageName.item5.rawValue,
                                  ImageName.item6.rawValue,
                                  ImageName.item7.rawValue,
                                  ImageName.item8.rawValue]
        return allItems
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
            updateLabels()
            let _ = checkMatches()
        } else {
            if UserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0 > 1 {
                game?.isLose = true
            } else {
                game?.isLoseLivesOver = true
            }
           
            timer?.invalidate()
        }
    }
    
    func updateLabels() {
        time.attributedText = NSAttributedString(string:"\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.strokeColor: UIColor.red,
            NSAttributedString.Key.strokeWidth: -3
        ])
        
        countOfFirstItem.attributedText = NSAttributedString(string: "x\(game?.firstItemCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 28)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -4
        ])
        
        countOfSecondItem.attributedText = NSAttributedString(string: "x\(game?.secondItemCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 28)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -4
        ])
        
        moveCount.attributedText = NSAttributedString(string: "\(game?.moveCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 42)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -3.5
        ])
    }
    
    func removeMoves() {
        if game!.moveCount > 0 {
            game!.moveCount -= 1
        } else {
            if UserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0 > 1 {
                game?.isLose = true
            } else {
                game?.isLoseLivesOver = true
            }
        }
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: ImageName.gameBackground.rawValue)
        background.size = size
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let darkBackground = SKSpriteNode(imageNamed: ImageName.menuBackground.rawValue)
        darkBackground.size = size
        darkBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(darkBackground)
        
        let deskBackground = SKSpriteNode(imageNamed: ImageName.backForDesk.rawValue)
        deskBackground.size = CGSize(width: size.width, height: size.height / 2.15)
        deskBackground.position = CGPoint(x: size.width / 2, y: size.height / 2.3)
        deskBackground.alpha = 0.5
        addChild(deskBackground)
        
        let desk = SKSpriteNode(imageNamed: ImageName.desk.rawValue)
        desk.size = CGSize(width: size.width, height: size.height / 2.05)
        desk.position = CGPoint(x: size.width / 2, y: size.height / 2.3)
        addChild(desk)
        
        let backForPause = SKSpriteNode(imageNamed: ImageName.lightButtonBackground.rawValue)
        backForPause.size = CGSize(width: size.width * 0.17, height: size.height * 0.079)
        backForPause.name = "pauseBack"
        backForPause.position = CGPoint(x: size.width / 3.8, y: size.height / 9)
        addChild(backForPause)
        
        let pause = SKSpriteNode(imageNamed: ImageName.pause.rawValue)
        pause.size = CGSize(width: size.width * 0.07, height: size.height * 0.04)
        pause.name = "pause"
        pause.position = CGPoint(x: size.width / 3.85, y: size.height / 9.1)
        addChild(pause)
        
        let backForTime = SKSpriteNode(imageNamed: ImageName.widthestLightLabelBackground.rawValue)
        backForTime.size = CGSize(width: size.width * 0.3, height: size.height * 0.06)
        backForTime.position = CGPoint(x: size.width / 1.52, y: size.height / 9)
        addChild(backForTime)
        
        let timeImage = SKSpriteNode(imageNamed: ImageName.time.rawValue)
        timeImage.size = CGSize(width: size.width * 0.12, height: size.height * 0.08)
        timeImage.position = CGPoint(x: size.width / 1.9, y: size.height / 9)
        addChild(timeImage)
        
        time = SKLabelNode(fontNamed: "SpicyRice-Regular")
        time.attributedText = NSAttributedString(string:"\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.strokeColor: UIColor.red,
            NSAttributedString.Key.strokeWidth: -3
        ])
        time.position = CGPoint(x: size.width / 1.48, y: size.height / 10.6)
        addChild(time)
        
        let backForLives = SKSpriteNode(imageNamed: ImageName.widthestLightLabelBackground.rawValue)
        backForLives.size = CGSize(width: size.width * 0.3, height: size.height * 0.06)
        backForLives.position = CGPoint(x: size.width / 3.52, y: size.height / 1.35)
        addChild(backForLives)
        
        let heart = SKSpriteNode(imageNamed: ImageName.heart.rawValue)
        heart.size = CGSize(width: size.width * 0.15, height: size.height * 0.075)
        heart.position = CGPoint(x: size.width / 6.5, y: size.height / 1.35)
        addChild(heart)
        
        let lives = SKLabelNode(fontNamed: "SpicyRice-Regular")
        lives.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.strokeColor: UIColor.red,
            NSAttributedString.Key.strokeWidth: -3
        ])
        lives.position = CGPoint(x: size.width / 3.3, y: size.height / 1.383)
        addChild(lives)
        
        let backForCoin = SKSpriteNode(imageNamed: ImageName.widthestLightLabelBackground.rawValue)
        backForCoin.size = CGSize(width: size.width * 0.3, height: size.height * 0.06)
        backForCoin.position = CGPoint(x: size.width / 1.32, y: size.height / 1.35)
        addChild(backForCoin)
        
        let coin = SKSpriteNode(imageNamed: ImageName.coin.rawValue)
        coin.size = CGSize(width: size.width * 0.15, height: size.height * 0.07)
        coin.position = CGPoint(x: size.width / 1.6, y: size.height / 1.35)
        addChild(coin)
        
        let coinCount = SKLabelNode(fontNamed: "SpicyRice-Regular")
        coinCount.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.strokeColor: UIColor.red,
            NSAttributedString.Key.strokeWidth: -3
        ])
        coinCount.position = CGPoint(x: size.width / 1.26, y: size.height / 1.383)
        addChild(coinCount)
        
        let goalAndMoveBack = SKSpriteNode(imageNamed: ImageName.goalAndMoveBack.rawValue)
        goalAndMoveBack.size = CGSize(width: size.width * 0.95, height: size.height * 0.17)
        goalAndMoveBack.position = CGPoint(x: size.width / 2, y: size.height / 1.195)
        addChild(goalAndMoveBack)
        
        moveCount = SKLabelNode(fontNamed: "SpicyRice-Regular")
        moveCount.attributedText = NSAttributedString(string: "\(game?.moveCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 42)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -3.5
        ])
        moveCount.position = CGPoint(x: size.width / 1.32, y: size.height / 1.224)
        addChild(moveCount)
        
        var randomItem = getRandomItem().randomElement()!
        goalFirstItem = SKSpriteNode(imageNamed: randomItem)
        goalFirstItem.name = randomItem
        goalFirstItem.size = CGSize(width: size.width * 0.09, height: size.width * 0.09)
        goalFirstItem.position = CGPoint(x: size.width / 6.5, y: size.height / 1.194)
        addChild(goalFirstItem)
        
        countOfFirstItem = SKLabelNode(fontNamed: "SpicyRice-Regular")
        countOfFirstItem.attributedText = NSAttributedString(string: "x\(game?.firstItemCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 28)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -4
        ])
        countOfFirstItem.position = CGPoint(x: size.width / 5.32, y: size.height / 1.25)
        addChild(countOfFirstItem)
        
        randomItem = getRandomItem().randomElement()!
        goalSecondItem = SKSpriteNode(imageNamed: randomItem)
        goalSecondItem.name = randomItem
        goalSecondItem.size = CGSize(width: size.width * 0.09, height: size.width * 0.09)
        goalSecondItem.position = CGPoint(x: size.width / 3, y: size.height / 1.194)
        addChild(goalSecondItem)
        
        countOfSecondItem = SKLabelNode(fontNamed: "SpicyRice-Regular")
        countOfSecondItem.attributedText = NSAttributedString(string: "x\(game?.secondItemCount ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "SpicyRice-Regular", size: 28)!,
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.strokeWidth: -4
        ])
        countOfSecondItem.position = CGPoint(x: size.width / 2.7, y: size.height / 1.25)
        addChild(countOfSecondItem)
    }
    
    //MARK: - SWAP
    
    func swapElements(first: SKSpriteNode, second: SKSpriteNode) {
        guard let firstIndex = getIndex(for: first), let secondIndex = getIndex(for: second) else { return }
        board[firstIndex.row][firstIndex.col] = second
        board[secondIndex.row][secondIndex.col] = first
        
        let tempPosition = first.position
        first.position = second.position
        second.position = tempPosition
    }
    
    func getAdjacentElement(from node: SKSpriteNode, direction: Direction) -> SKSpriteNode? {
        guard let indexPath = getIndex(for: node) else { return nil }
        switch direction {
        case .left:
            if indexPath.col > 0 {
                return board[indexPath.row][indexPath.col - 1]
            }
        case .right:
            if indexPath.col < cols - 1 {
                return board[indexPath.row][indexPath.col + 1]
            }
        case .up:
            if indexPath.row < cols - 1 {
                return board[indexPath.row + 1][indexPath.col]
            }
        case .down:
            if indexPath.row > 0 {
                return board[indexPath.row - 1][indexPath.col]
            }
        }
        
        return nil
    }
    
    func getIndex(for node: SKSpriteNode) -> (row: Int, col: Int)? {
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == node {
                    return (row, col)
                }
            }
        }
        return nil
    }
    
    func returnElementsToOriginalPositions(first: SKSpriteNode, second: SKSpriteNode) {
        first.position = firstElementOriginalPosition ?? CGPoint.zero
        second.position = secondElementOriginalPosition ?? CGPoint.zero
        
        if let firstIndex = getIndex(for: first), let secondIndex = getIndex(for: second) {
            board[firstIndex.row][firstIndex.col] = first
            board[secondIndex.row][secondIndex.col] = second
        }
    }
    
    func checkMatches() -> Bool {
           var matchesFound = false
           var matchesToRemove: [[SKSpriteNode]] = []

           for row in 0..<board.count {
               for col in 0..<board[row].count - 2 {
                   if let firstNode = board[row][col],
                      let secondNode = board[row][col + 1],
                      let thirdNode = board[row][col + 2],
                      firstNode.name == secondNode.name && firstNode.name == thirdNode.name {
                       matchesFound = true
                       matchesToRemove.append([firstNode, secondNode, thirdNode])
                       isMatchGoalItem(firstItem: firstNode, secondItem: firstNode)
                   }
               }
           }

           for col in 0..<board[0].count {
               for row in 0..<board.count - 2 {
                   if let firstNode = board[row][col],
                      let secondNode = board[row + 1][col],
                      let thirdNode = board[row + 2][col],
                      firstNode.name == secondNode.name && firstNode.name == thirdNode.name {
                       matchesFound = true
                       matchesToRemove.append([firstNode, secondNode, thirdNode])
                       isMatchGoalItem(firstItem: firstNode, secondItem: firstNode)
                   }
               }
           }

           if matchesFound {
               removeMatchedElements(matchesToRemove)
           }

           return matchesFound
       }
    
    func isMatchGoalItem(firstItem: SKSpriteNode, secondItem: SKSpriteNode) {
        if firstItem.name == goalFirstItem.name, game!.firstItemCount > 0 {
            game?.firstItemCount -= 3
        } else if secondItem.name == goalSecondItem.name, game!.secondItemCount > 0 {
            game?.secondItemCount -= 3
        }
        
        if game!.firstItemCount == 0, game!.secondItemCount == 0 {
            game?.isWin = true
        }
    }
    
    func removeMatchedElements(_ matchedNodes: [[SKSpriteNode]]) {
        for match in matchedNodes {
            for node in match {
                node.removeFromParent()
                if let indexPath = getIndex(for: node) {
                    board[indexPath.row][indexPath.col] = nil
                    createNewElement(at: indexPath)
                }
            }
        }
    }
    
    func createNewElement(at indexPath: (row: Int, col: Int)) {
        let randomElement = getRandomItem().randomElement()
        let newSprite = SKSpriteNode(imageNamed: randomElement!)
        newSprite.name = randomElement
        newSprite.size = CGSize(width: size.width / 7.9, height: size.width / 8.1)
        newSprite.position = CGPoint(x: CGFloat(indexPath.col) * size.width / 6.3 + CGFloat(size.width / 9.5),
                                      y: self.size.height / 1.4 - CGFloat(indexPath.row) * size.width / 6.23 - size.width / 4.8)
        addChild(newSprite)
        board[indexPath.row][indexPath.col] = newSprite
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        initializeGame()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if let node = self.atPoint(location) as? SKSpriteNode {
            selectedNode = node
            firstElementOriginalPosition = node.position
        }
        startTouchPosition = location
        
        if let tappedNode = self.atPoint(location) as? SKSpriteNode, tappedNode.name == "pauseBack" || tappedNode.name == "pause" {
            game?.isPause = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let startPosition = startTouchPosition else { return }
        let endPosition = touch.location(in: self)
        
        let dx = endPosition.x - startPosition.x
        let dy = endPosition.y - startPosition.y
        
        if let firstElement = selectedNode {
            var secondElement: SKSpriteNode?
            
            if abs(dx) > abs(dy) {
                if dx > 0 {
                    secondElement = getAdjacentElement(from: firstElement, direction: .right)
                } else {
                    secondElement = getAdjacentElement(from: firstElement, direction: .left)
                }
            } else {
                if dy < 0 {
                    secondElement = getAdjacentElement(from: firstElement, direction: .up)
                } else {
                    secondElement = getAdjacentElement(from: firstElement, direction: .down)
                }
            }
            
            if let secondNode = secondElement {
                secondElementOriginalPosition = secondNode.position
                swapElements(first: firstElement, second: secondNode)
                
                if !checkMatches() {
                    returnElementsToOriginalPositions(first: firstElement, second: secondNode)
                } else {
                    removeMoves()
                }
            }
        }
        selectedNode = nil
        startTouchPosition = nil
    }
}


struct GameView: View {
    @StateObject var gameModel =  GameViewModel()
    @StateObject private var gameData = GameData()
    @Binding var navigationPath: NavigationPath
    var body: some View {
        SpriteView(scene: gameModel.createGameScene(gameData: gameData))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        
            .navigationDestination(isPresented: $gameData.isWin) {
                WinView(navigationPath: $navigationPath)
            }
        
            .navigationDestination(isPresented: $gameData.isLose) {
                LoseView(navigationPath: $navigationPath)
            }
        
            .navigationDestination(isPresented: $gameData.isLoseLivesOver) {
                LoseLivesOverView(navigationPath: $navigationPath)
            }
        
            .navigationDestination(isPresented: $gameData.isPause) {
                PauseView(navigationPath: $navigationPath)
            }
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return GameView(navigationPath: .constant(navigationPath))
}

