import SwiftUI

struct LoseView: View {
    @StateObject var loseModel =  LoseViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goShop() {
        navigationPath.append(AppScreen.shop)
    }
    
    func goRestart() {
        navigationPath.append(AppScreen.game)
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
                    
                    HStack {
                        StatusLabel(foregroundImage: ImageName.heart.rawValue,
                                    text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0)")
                        .padding(.horizontal, 50)
                        Spacer()
                        StatusLabel(foregroundImage: ImageName.coin.rawValue,
                                    text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)",
                                    sizeText: 30,
                                    sizeWForegroundImage: 60,
                                    sizeHForegroundImage: 60,
                                    offsetText: 16)
                        .padding(.horizontal, 25)
                    }
                }
                Spacer()
                VStack(spacing: 30) {
                    Text("THE CANDY'S GONE\n TRY AGAIN!")
                        .Righteous(size: 32, color: .yellow, colorOutline: .red)
                        .frame(maxWidth: 300, minHeight: 50)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    StatusLabel(foregroundImage: ImageName.heart.rawValue,
                                text: "-1")
                }
                
                VStack(spacing: 30) {
                    DoubleButton(action: goRestart,
                                 text: "RESTART",
                                 textSize: 34,
                                 image: ImageName.restart.rawValue,
                                 sizeWImage: 58,
                                 sizeHImage: 58)
                    
                    HStack {
                        SimpleButton(action: goShop,
                                     text: "SHOP")
                        
                        SimpleButton(action: goMenu,
                                     text: "MENU")
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
    return LoseView(navigationPath: .constant(navigationPath))
}

