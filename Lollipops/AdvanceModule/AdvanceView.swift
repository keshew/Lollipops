import SwiftUI

struct AdvanceView: View {
    @StateObject var advanceModel =  AdvanceViewModel()
    @State private var opacity: Double = 1.0
    @State var opacityBoost = 0.0
    @Binding var navigationPath: NavigationPath
    
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            Image(ImageName.menuBackgroundmage.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(ImageName.menuBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            SmallButton(action: goBack,
                        foregroundImage: ImageName.home.rawValue,
                        sizeWForegroundImage: 42,
                        sizeHForegroundImage: 32)
            .position(x: geometry.size.width / 7.5, y:  geometry.size.height / 16)
            
            
            Text("ADVANCE")
                .Rock(size: 34,
                      color: .yellow,
                      outlineWidth: 1,
                      colorOutline: .purple)
                .position(x: geometry.size.width / 2, y:  geometry.size.height / 16)
            
            ZStack {
                Image(ImageName.shopBackForItem.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.4)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2.1)
                
                Text(advanceModel.loadImages().1)
                    .Rice(size: 28,color: .white,  colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 3.5, y: geometry.size.height / 2.65)
                
                Image(advanceModel.loadImages().0)
                    .resizable()
                    .frame(width: geometry.size.width * advanceModel.loadImages().5, height: geometry.size.height * 0.1)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2.75)
                
                Text("LVL 1")
                    .Rice(size: 32,color: .white,  colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 1.35, y: geometry.size.height / 2.95)
                
                Image(ImageName.spreadLineShop.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.13)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2.6)
                
                Text("LVL 2")
                    .Rice(size: 32,color: .green,  colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 1.35, y: geometry.size.height / 2.4)
                
                Text(advanceModel.loadImages().4)
                    .Rice(size: 18, color: .white, outlineWidth: 0.5, colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                Text("\(advanceModel.loadImages().2) BLOCKS")
                    .Rice(size: 26, color: .white, outlineWidth: 0.5, colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 3.3, y: geometry.size.height / 1.75)
                
                Image(ImageName.greenArrow.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.07, height: geometry.size.height * 0.025)
                    .position(x: geometry.size.width / 2.03, y: geometry.size.height / 1.75)
                
                Text("\(advanceModel.loadImages().3) BLOCKS")
                    .Rice(size: 26, color: .green, outlineWidth: 0.5, colorOutline: .black)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 1)
                    .position(x: geometry.size.width / 1.45, y: geometry.size.height / 1.75)
                
                HStack(spacing: 20) {
                    SmallButton(action: advanceModel.lowerIndex,
                                foregroundImage: ImageName.backArrow.rawValue,
                                sizeWForegroundImage: 35,
                                sizeHForegroundImage: 20,
                                sizeWBackgroundImage: 64,
                                sizeHBackgroundImage: 64)
                    .disabled(advanceModel.currentIndex == 0 ? true : false)
                    .opacity(advanceModel.currentIndex == 0 ? 0.5 : 1)
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Image(ImageName.buyButtonBack.rawValue)
                                .resizable()
                                .frame(width: 197, height: 88)
                            
                            ZStack {
                                StatusLabel(foregroundImage: ImageName.coin.rawValue,
                                            text: "150",
                                            sizeText: 20,
                                            sizeWForegroundImage: 46,
                                            sizeHForegroundImage: 46,
                                            sizeWBackgroundImage: 83,
                                            sizeHBackgroundImage: 38,
                                            offsetImage: -35,
                                            offsetText: 11)
                                .offset(x: -55)
                                
                                Text("BOOST")
                                    .Righteous(size: 28, color: .yellow, colorOutline: .black)
                                    .offset(x: 39)
                            }
                        }
                    }
                    
                    
                    SmallButton(action: advanceModel.increaseIndex,
                                foregroundImage: ImageName.nextArrow.rawValue,
                                sizeWForegroundImage: 35,
                                sizeHForegroundImage: 20,
                                sizeWBackgroundImage: 64,
                                sizeHBackgroundImage: 64)
                    .disabled(advanceModel.currentIndex == 2 ? true : false)
                    .opacity(advanceModel.currentIndex == 2 ? 0.5 : 1)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.5)
            }
            .opacity(opacityBoost)
            .animation(.easeInOut(duration: 2.0), value: opacityBoost)
            
            
            Text("CLICK ON THE TREE")
                .Rice(size: 32,color: .white,  colorOutline: .black)
                .position(x: geometry.size.width / 2, y:  geometry.size.height / 1.35)
                .opacity(opacity)
                .animation(.easeInOut(duration: 2.0), value: opacity)
            
            Button(action: {
                opacity = 0.0
                opacityBoost = 1.0
            }) {
                Image(ImageName.tree.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.45)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2.1)
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0), value: opacity)
            
            
            Image(ImageName.settingsImage.rawValue)
                .resizable()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.32)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.13)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return AdvanceView(navigationPath: .constant(navigationPath))
}

