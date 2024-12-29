import SwiftUI

struct LollipopsSweetCastleLevelsView: View {
    @StateObject var sweetCastleLevelsModel =  LollipopsSweetCastleLevelsViewModel()
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
                Image(ImageName.sweetCastleBackground.rawValue)
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
                        
                        Text("SWEET CASTLE")
                            .Rock(size: 38,
                                  color: .yellow,
                                  outlineWidth: 1,
                                  colorOutline: .purple)
                    }
                    Spacer()
                }
            }
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 1),
                        text: "1",
                        offsetX: geometry.size.width / 2.3,
                        offsetY: geometry.size.height / 1.11)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 2),
                        text: "2",
                        offsetX: geometry.size.width / 1.9,
                        offsetY: geometry.size.height / 1.28)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 3),
                        text: "3",
                        offsetX: geometry.size.width / 2.3,
                        offsetY: geometry.size.height / 1.5)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 4),
                        text: "4",
                        offsetX: geometry.size.width / 2.8,
                        offsetY: geometry.size.height / 1.8)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 5),
                        text: "5",
                        offsetX: geometry.size.width / 3.25,
                        offsetY: geometry.size.height / 2.25)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 6),
                        text: "6",
                        offsetX: geometry.size.width / 4.9,
                        offsetY: geometry.size.height / 2.9)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 7),
                        text: "7",
                        offsetX: geometry.size.width / 3.1,
                        offsetY: geometry.size.height / 3.9)
            
            LevelButton(action: goToPlay,
                        imageOfLevel: sweetCastleLevelsModel.setupLevel(index: 8),
                        text: "8",
                        offsetX: geometry.size.width / 2,
                        offsetY: geometry.size.height / 5)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsSweetCastleLevelsView(navigationPath: .constant(navigationPath))
}

