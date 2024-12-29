import SwiftUI

struct LollipopsMenuView: View {
    @StateObject var menuModel =  LollipopsMenuViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToAdvance() {
        navigationPath.append(AppScreen.advance)
    }
    
    func goToShop() {
        navigationPath.append(AppScreen.shop)
    }
    
    func goToStage() {
        navigationPath.append(AppScreen.stage)
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
                VStack(spacing: 20) {
                    VStack(spacing: 0) {
                        HStack(spacing: 40) {
                            SmallButton(action: goToSettings,
                                        foregroundImage: ImageName.settingsForegroundButton.rawValue)
                            
                            SmallButton(action: goToShop,
                                        foregroundImage: ImageName.shopForegroundButton.rawValue)
                            
                            SmallButton(action:goToAdvance,
                                        foregroundImage: ImageName.advanceButtonForeground.rawValue)
                        }
                        
                        HStack(spacing: 40) {
                            Text("settings")
                                .Rice(size: 27,color: .purple, colorOutline: .yellow)
                            
                            Text("shop")
                                .Rice(size: 27,color: .purple, colorOutline: .yellow)
                            
                            Text("advance")
                                .Rice(size: 27,color: .purple, colorOutline: .yellow)
                        }
                    }
                    HStack {
                       StatusLabel(foregroundImage: ImageName.heart.rawValue,
                                   text: "\(LollipopsUserDefaultsManager.defaults.object(forKey: Keys.countOfLifes.rawValue) as? Int ?? 0)")
                       .padding(.horizontal, 50)
                        Spacer()
                        StatusLabel(foregroundImage: ImageName.coin.rawValue,
                                    text: "\(LollipopsUserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)",
                                    sizeText: 30,
                                    sizeWForegroundImage: 60,
                                    sizeHForegroundImage: 60,
                                    offsetText: 16)
                        .padding(.horizontal, 25)
                    }
                }
                
                Image(ImageName.alexImage.rawValue)
                    .resizable()
                    .frame(maxWidth: 338, maxHeight: 398)
                
                PlayButton(action: goToStage)
                    .offset(y: -30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsMenuView(navigationPath: .constant(navigationPath))
}
