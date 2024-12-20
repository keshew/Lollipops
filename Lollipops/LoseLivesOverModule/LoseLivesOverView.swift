import SwiftUI

struct LoseLivesOverView: View {
    @StateObject var loseLivesOverModel =  LoseLivesOverViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goShop() {
        navigationPath.append(AppScreen.shop)
    }
    
    func goSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goMenu() {
        navigationPath.append(AppScreen.menu)
    }
    
    var body: some View {
        ZStack {
            Image(ImageName.loseBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(ImageName.menuBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack(spacing: 30) {
                    Text("GAME OVER!")
                        .Righteous(size: 52,color: .yellow, colorOutline: .red)
                    
                    StatusLabel(foregroundImage: ImageName.heart.rawValue,
                                text: "0")
                }
                Spacer()
                VStack(spacing: 30) {
                    Text("LIVES IS OVER")
                        .Righteous(size: 42, color: .yellow, colorOutline: .red)
                        .frame(maxWidth: 300, minHeight: 50)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    StatusLabel(foregroundImage: ImageName.heart.rawValue,
                                text: "-1")
                }
                
                VStack(spacing: 30) {
                    DoubleButton(action: goMenu,
                                 text: "MENU",
                                 textSize: 52,
                                 image: ImageName.home.rawValue,
                                 sizeWImage: 64,
                                 sizeHImage: 52)
                    
                    HStack {
                        SimpleButton(action: goShop,
                                     text: "SHOP")
                        
                        SimpleButton(action: goSettings,
                                     text: "SETTINGS",
                                     sizeText: 34)
                    }
                }
                Spacer()
            }
        }
        
        .onAppear {
            UserDefaultsManager().loseLevel()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LoseLivesOverView(navigationPath: .constant(navigationPath))
}

