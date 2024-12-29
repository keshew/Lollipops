import SwiftUI

struct LollipopsPauseView: View {
    @StateObject var pauseModel =  LollipopsPauseViewModel()
    @Binding var navigationPath: NavigationPath
    
    func resume() {
        navigationPath.removeLast()
    }
    
    func restart() {
        navigationPath.append(AppScreen.game)
    }
    
    func goMenu() {
        navigationPath.append(AppScreen.menu)
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
                    Text("GAME PAUSED!")
                        .Righteous(size: 46, color: .yellow, colorOutline: .red)
                    
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
                
                Spacer()
                
                VStack(spacing: 20) {
                    SoundButton(soundOnAction: pauseModel.enableSound,
                                soundOffAction: pauseModel.disableSound,
                                imageSoundOn: pauseModel.setImage(),
                                imageSoundOff: pauseModel.setImageSounOff(),
                                backSizeW: 310,
                                backSizeH: 155)
                    
                    MusicButton(lowerMusicAction: pauseModel.lowerIndex,
                                increaseMusicAction: pauseModel.increaseIndex,
                                index: pauseModel.currentIndex,
                                backSizeW: 310,
                                backSizeH: 155)
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    DoubleButton(action: resume,
                                 text: "RESUME",
                                 textSize: 36,
                                 image: ImageName.playForegroundButton.rawValue,
                                 sizeWImage: 49,
                                 sizeHImage: 44,
                                 offsetXImage: 4,
                                 offsetYImage: 2)
                    
                    HStack {
                        SimpleButton(action: restart,
                                     text: "RESTART",
                                     sizeText: 34)
                        
                        SimpleButton(action: goMenu,
                                     text: "MENU")
                    }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsPauseView(navigationPath: .constant(navigationPath))
}

