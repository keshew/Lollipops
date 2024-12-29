import SwiftUI

struct LollipopsWinView: View {
    @StateObject var winModel =  LollipopsWinViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goNext() {
        navigationPath.append(AppScreen.stage)
    }
    
    func goRestart() {
        navigationPath.append(AppScreen.game)
    }
    
    func goMenu() {
        navigationPath.append(AppScreen.menu)
    }
    
    var body: some View {
        ZStack {
            Image(ImageName.winBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(ImageName.menuBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Text("YOU WIN!")
                    .Righteous(size: 52,color: .yellow, colorOutline: .red)
                
                Spacer()
                VStack(spacing: 30) {
                    StatusLabel(foregroundImage: ImageName.coin.rawValue,
                                text: "+50",
                                sizeText: 30,
                                sizeWForegroundImage: 60,
                                sizeHForegroundImage: 60,
                                offsetText: 13)
                    
                    
                    Text("YOU COLLECTED ALL THE CANDY!")
                        .Righteous(size: 36,color: .yellow, colorOutline: .red)
                        .frame(width: 300)
                        .minimumScaleFactor(0.5)
                }
                
                
                VStack(spacing: 30) {
                    DoubleButton(action: goNext,
                                 text: "NEXT", image: ImageName.nextArrow.rawValue,
                                 sizeWImage: 64,
                                 sizeHImage: 38)
                    
                    HStack {
                        SimpleButton(action: goRestart,
                                     text: "RESTART",
                                     sizeText: 34)
                        
                        SimpleButton(action: goMenu,
                                     text: "MENU")
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            LollipopsUserDefaultsManager().completeLevel()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsWinView(navigationPath: .constant(navigationPath))
}

