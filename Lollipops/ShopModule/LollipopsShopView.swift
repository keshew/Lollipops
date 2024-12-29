import SwiftUI

struct LollipopsShopView: View {
    @StateObject var shopModel =  LollipopsShopViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
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
            
            Image(ImageName.settingsImage.rawValue)
                .resizable()
                .frame(width: 308, height: 230)
                .offset(y: 300)
            
            VStack(spacing: 40) {
                VStack {
                    VStack(spacing: -5) {
                        HStack(spacing: 0) {
                            SmallButton(action: goBack,
                                        foregroundImage: ImageName.home.rawValue,
                                        sizeWForegroundImage: 42,
                                        sizeHForegroundImage: 32)
                            .padding(.horizontal, 15)
                            
                            Text("SHOP")
                                .Rock(size: 52,
                                      color: .yellow,
                                      outlineWidth: 1,
                                      colorOutline: .purple)
                                .padding(.horizontal, 15)
                            Spacer()
                        }
                        
                        Text("PROPERTIES")
                            .Rock(size: 38,
                                  color: .yellow,
                                  outlineWidth: 1,
                                  colorOutline: .purple)
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
                
                ZStack {
                    Image(ImageName.shopBackForItem.rawValue)
                        .resizable()
                        .frame(width: 344, height: 281)
                    
                    Text(shopModel.loadImages().1)
                        .Rice(size: 44,color: .white, colorOutline: .black)
                        .offset(y: -80)
                    
                    Image(shopModel.loadImages().0)
                        .resizable()
                        .frame(width: 230, height: 69)
                        .offset(y: 15)
                    
                    HStack {
                        SmallButton(action: shopModel.lowerIndex,
                                    foregroundImage: ImageName.backArrow.rawValue,
                                    sizeWForegroundImage: 35,
                                    sizeHForegroundImage: 20,
                                    sizeWBackgroundImage: 64,
                                    sizeHBackgroundImage: 64)
                        .disabled(shopModel.currentIndex == 0 ? true : false)
                        .opacity(shopModel.currentIndex == 0 ? 0.5 : 1)
                        
                        if shopModel.currentIndex == 0 {
                            SelectedButton()
                        } else {
                            BuyButton(action: shopModel.buy, cost: shopModel.loadImages().2)
                        }
                        
                        SmallButton(action: shopModel.increaseIndex,
                                    foregroundImage: ImageName.nextArrow.rawValue,
                                    sizeWForegroundImage: 35,
                                    sizeHForegroundImage: 20,
                                    sizeWBackgroundImage: 64,
                                    sizeHBackgroundImage: 64)
                        .disabled(shopModel.currentIndex == 2 ? true : false)
                        .opacity(shopModel.currentIndex == 2 ? 0.5 : 1)
                    }
                    .offset(y: 140)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsShopView(navigationPath: .constant(navigationPath))
}
