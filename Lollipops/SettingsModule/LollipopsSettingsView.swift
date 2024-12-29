import SwiftUI

struct LollipopsSettingsView: View {
    @StateObject var settingsModel =  LollipopsSettingsViewModel()
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
            
            VStack(spacing: 30) {
                HStack(spacing: 0) {
                    SmallButton(action: goBack,
                                foregroundImage: ImageName.home.rawValue,
                                sizeWForegroundImage: 42,
                                sizeHForegroundImage: 32)
                    .padding(.horizontal, 20)
                    
                    Text("SETTINGS")
                        .Rock(size: 34,
                              color: .yellow,
                              outlineWidth: 1,
                              colorOutline: .purple)
                    Spacer()
                }
                Spacer()
                
                SoundButton(soundOnAction: settingsModel.enableSound,
                            soundOffAction: settingsModel.disableSound,
                            imageSoundOn: settingsModel.setImage(),
                            imageSoundOff: settingsModel.setImageSounOff())
                
                MusicButton(lowerMusicAction: settingsModel.lowerIndex,
                            increaseMusicAction: settingsModel.increaseIndex,
                            index: settingsModel.currentIndex)
                
                Image(ImageName.settingsImage.rawValue)
                    .resizable()
                    .frame(maxWidth: 340, minHeight: 279)
                    .padding(-50)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return LollipopsSettingsView(navigationPath: .constant(navigationPath))
}

