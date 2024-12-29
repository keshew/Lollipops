import SwiftUI

struct LollipopsCandyFactoryLevelsView: View {
    @StateObject var candyFactoryLevelsModel =  LollipopsCandyFactoryLevelsViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func goToPlay() {
        navigationPath.append(AppScreen.game)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(ImageName.candyFactoryBackground.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        HStack(spacing: 0) {
                            SmallButton(action: goBack,
                                        foregroundImage: ImageName.backArrow.rawValue,
                                        sizeWForegroundImage: 42,
                                        sizeHForegroundImage: 24)
                            .padding(.horizontal, 15)
                            
                            Text("PLAY")
                                .Rock(size: 52,
                                      color: .yellow,
                                      outlineWidth: 1,
                                      colorOutline: .purple)
                                .padding(.horizontal, 15)
                            Spacer()
                        }
                        
                        Text("CANDY FACTORY")
                            .Rock(size: 38,
                                  color: .yellow,
                                  outlineWidth: 1,
                                  colorOutline: .purple)
                    }
                    Spacer()
                }
            }
            
            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 9),
                        text: "9",
                        offsetX: geometry.size.width / 4.3,
                        offsetY: geometry.size.height / 1.08)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 10),
                        text: "10",
                        offsetX: geometry.size.width / 2.3,
                        offsetY: geometry.size.height / 1.15)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 11),
                        text: "11",
                        offsetX: geometry.size.width / 1.8,
                        offsetY: geometry.size.height / 1.3)

            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 12),
                        text: "12",
                        offsetX: geometry.size.width / 2.6,
                        offsetY: geometry.size.height / 1.45)

            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 13),
                        text: "13",
                        offsetX: geometry.size.width / 3.25,
                        offsetY: geometry.size.height / 1.7)

            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 14),
                        text: "14",
                        offsetX: geometry.size.width / 2.05,
                        offsetY: geometry.size.height / 1.9)

            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 15),
                        text: "15",
                        offsetX: geometry.size.width / 1.65,
                        offsetY: geometry.size.height / 2.3)

            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 16),
                        text: "16",
                        offsetX: geometry.size.width / 2.6,
                        offsetY: geometry.size.height / 2.6)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: candyFactoryLevelsModel.setupLevel(index: 17),
                        text: "17",
                        offsetX: geometry.size.width / 2.2,
                        offsetY: geometry.size.height / 3.5)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsCandyFactoryLevelsView(navigationPath: .constant(navigationPath))
}

