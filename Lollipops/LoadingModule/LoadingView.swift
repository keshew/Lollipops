import SwiftUI

struct LoadingView: View {
    @StateObject var loadingModel =  LoadingViewModel()
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
                    MenuView(navigationPath: $navigationPath)
                case .shop:
                    ShopView(navigationPath: $navigationPath)
                case .settings:
                    SettingsView(navigationPath: $navigationPath)
                case .stage:
                    StageView(navigationPath: $navigationPath)
                case .levelCastle:
                    SweetCastleLevelsView(navigationPath: $navigationPath)
                case .levelCandy:
                    CandyFactoryLevelsView(navigationPath: $navigationPath)
                case .advance:
                    AdvanceView(navigationPath: $navigationPath)
                case .win:
                    WinView(navigationPath: $navigationPath)
                case .lose:
                    LoseView(navigationPath: $navigationPath)
                case .pause:
                    PauseView(navigationPath: $navigationPath)
                case .loseLivesOver:
                    LoseLivesOverView(navigationPath: $navigationPath)
                case .game:
                    GameView(navigationPath: $navigationPath)
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}

