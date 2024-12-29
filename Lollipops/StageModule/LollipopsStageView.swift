import SwiftUI

struct LollipopsStageView: View {
    @StateObject var stageModel =  LollipopsStageViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func goToLevel() {
        if stageModel.currentIndex == 0 {
            navigationPath.append(AppScreen.levelCastle)
        } else {
            navigationPath.append(AppScreen.levelCandy)
        }
    }
    
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundmage.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(ImageName.menuBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack(spacing: 15) {
                    SmallButton(action: goBack,
                                foregroundImage: ImageName.home.rawValue,
                                sizeWForegroundImage: 42,
                                sizeHForegroundImage: 32)
                    .padding(.horizontal, 20)
                    
                    Text("PLAY")
                        .Rock(size: 52,
                              color: .yellow,
                              outlineWidth: 1.5,
                              colorOutline: .purple)
                    Spacer()
                }
                
                Text(stageModel.loadImages().2)
                    .Rock(size: 34,
                          color: .yellow,
                          outlineWidth: 1.2,
                          colorOutline: .purple)
                
                Spacer()
                
                ZStack {
                    Image(stageModel.loadImages().1)
                        .resizable()
                        .frame(maxWidth: 337, maxHeight: 337)
                    
                    Button(action: {
                        goToLevel()
                    }) {
                        ZStack {
                            Image(ImageName.lightButtonBackground.rawValue)
                                .resizable()
                                .frame(maxWidth: 119, maxHeight: 119)
                            
                            Image(stageModel.loadImages().0)
                                .resizable()
                                .frame(maxWidth: stageModel.loadImages().4, maxHeight: stageModel.loadImages().4)
                                .offset(stageModel.loadImages().5)
                        }
                    }
                    .disabled(stageModel.currentIndex == 2 ? true : false)
                    .offset(y: 105)
                }
                
                Spacer()
                
                Text(stageModel.loadImages().3)
                    .Rice(size: 38,
                          color: .red,
                          outlineWidth: 1.2,
                          colorOutline: .yellow)
                    .offset(y: -20)
                
                Spacer()
                HStack(spacing: 60) {
                    SmallButton(action: stageModel.lowerIndex,
                                foregroundImage: ImageName.backArrow.rawValue,
                                sizeWForegroundImage: 50,
                                sizeHForegroundImage: 30,
                                sizeWBackgroundImage: 90,
                                sizeHBackgroundImage: 90)
                    .disabled(stageModel.currentIndex == 0 ? true : false)
                    .opacity(stageModel.currentIndex == 0 ? 0.5 : 1)
                    
                    SmallButton(action: stageModel.increaseIndex,
                                foregroundImage: ImageName.nextArrow.rawValue,
                                sizeWForegroundImage: 50,
                                sizeHForegroundImage: 30,
                                sizeWBackgroundImage: 90,
                                sizeHBackgroundImage: 90)
                    .disabled(stageModel.currentIndex == 2 ? true : false)
                    .opacity(stageModel.currentIndex == 2 ? 0.5 : 1)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsStageView(navigationPath: .constant(navigationPath))
}

