import SwiftUI

struct LollipopsLoadingView: View {
    @StateObject var loadingModel =  LollipopsLoadingViewModel()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Image(ImageName.loadingBackgroundImage.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text(loadingModel.currentText)
                        .Righteous(size: 42,
                                   color: .yellow,
                                   colorOutline: .red)
                    
                    ZStack {
                        Image(ImageName.backgroundForLine.rawValue)
                            .resizable()
                            .frame(width: 246, height: 28)
                        
                        Image(loadingModel.loadScreen().0)
                            .resizable()
                            .frame(width: loadingModel.loadScreen().3, height: 28)
                            .offset(x: loadingModel.loadScreen().1)
                    }
                }
                .padding()
            }
            .onAppear {
                loadingModel.startTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    loadingModel.currentIndex = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    loadingModel.currentIndex = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    loadingModel.currentIndex = 2
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    loadingModel.currentIndex = 3
                    
                    navigationPath.append(AppScreen.menu)
                }
            }
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .menu:
                    LollipopsMenuView(navigationPath: $navigationPath)
                case .shop:
                    LollipopsShopView(navigationPath: $navigationPath)
                case .settings:
                    LollipopsSettingsView(navigationPath: $navigationPath)
                case .stage:
                    LollipopsStageView(navigationPath: $navigationPath)
                case .levelCastle:
                    LollipopsSweetCastleLevelsView(navigationPath: $navigationPath)
                case .levelCandy:
                    LollipopsCandyFactoryLevelsView(navigationPath: $navigationPath)
                case .advance:
                    LollipopsAdvanceView(navigationPath: $navigationPath)
                case .win:
                    LollipopsWinView(navigationPath: $navigationPath)
                case .lose:
                    LollipopsLoseView(navigationPath: $navigationPath)
                case .pause:
                    LollipopsPauseView(navigationPath: $navigationPath)
                case .loseLivesOver:
                    LollipopsLoseLivesOverView(navigationPath: $navigationPath)
                case .game:
                    LollipopsGameView(navigationPath: $navigationPath)
                }
            }
        }
    }
}

#Preview {
    LollipopsLoadingView()
}

