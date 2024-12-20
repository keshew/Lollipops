import SwiftUI

struct SmallButton: View {
    var action: () -> Void
    var foregroundImage: String
    var sizeWForegroundImage: CGFloat = 44
    var sizeHForegroundImage: CGFloat = 44
    var sizeWBackgroundImage: CGFloat = 74
    var sizeHBackgroundImage: CGFloat = 74
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.darkButtonBackground.rawValue)
                    .resizable()
                    .frame(width: sizeWBackgroundImage, height: sizeHBackgroundImage)
                
                Image(foregroundImage)
                    .resizable()
                    .frame(width: sizeWForegroundImage, height: sizeHForegroundImage)
            }
        }
    }
}

struct StatusLabel: View {
    var foregroundImage: String
    var text: String
    var sizeText: CGFloat = 34
    var sizeWForegroundImage: CGFloat = 66
    var sizeHForegroundImage: CGFloat = 65
    var sizeWBackgroundImage: CGFloat = 118
    var sizeHBackgroundImage: CGFloat = 53
    var offsetImage: CGFloat = -50
    var offsetText: CGFloat = 8
    
    var body: some View {
        ZStack {
            Image(ImageName.widthestLightLabelBackground.rawValue)
                .resizable()
                .frame(width: sizeWBackgroundImage, height: sizeHBackgroundImage)
            
            Image(foregroundImage)
                .resizable()
                .frame(width: sizeWForegroundImage, height: sizeHForegroundImage)
                .offset(x: offsetImage)
            
            Text(text)
                .Rice(size: sizeText,color: .yellow, colorOutline: .red)
                .offset(x: offsetText)
        }
    }
}

struct PlayButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.widthestLightButtonBackground.rawValue)
                    .resizable()
                    .frame(width: 246, height: 110)
                
                Text("PLAY")
                    .Rock(size: 52,
                          color: .yellow,
                          outlineWidth: 1.4,
                          colorOutline: .purple)
                    .offset(x: 20)
                
                ZStack {
                    Image(ImageName.lightButtonBackground.rawValue)
                        .resizable()
                        .frame(width: 109, height: 109)
                    
                    Image(ImageName.playForegroundButton.rawValue)
                        .resizable()
                        .frame(width: 44, height: 49)
                        .offset(x: 4, y: 2)
                }
                .offset(x: -110)
                
            }
        }
        .offset(x: 20)
    }
}

struct SoundButton: View {
    var soundOnAction: () -> Void
    var soundOffAction: () -> Void
    var imageSoundOn: String
    var imageSoundOff: String
    var backSizeW: CGFloat = 352
    var backSizeH: CGFloat = 189
    var body: some View {
        ZStack {
            Image(ImageName.backgroundSoundMusicLabel.rawValue)
                .resizable()
                .frame(maxWidth: backSizeW, maxHeight: backSizeH)
            
            VStack(spacing: 10) {
                Text("SOUND")
                    .Rice(size: 32,color: .white, colorOutline: .black)
                    .offset(y: -5)
                
                HStack(spacing: 40) {
                    Button(action: {
                       soundOnAction()
                    }) {
                        Image(imageSoundOn)
                            .resizable()
                            .frame(width: 68, height: 68)
                    }
                    
                    Button(action: {
                        soundOffAction()
                    }) {
                        Image(imageSoundOff)
                            .resizable()
                            .frame(width: 68, height: 68)
                    }
                }
            }
        }
    }
}

struct MusicButton: View {
    var lowerMusicAction: () -> Void
    var increaseMusicAction: () -> Void
    var index: Int
    var backSizeW: CGFloat = 352
    var backSizeH: CGFloat = 189
    var body: some View {
        ZStack {
            Image(ImageName.backgroundSoundMusicLabel.rawValue)
                .resizable()
                .frame(maxWidth: backSizeW, maxHeight: backSizeH)
            
            VStack(spacing: 10) {
                Text("MUSIC")
                    .Rice(size: 32,color: .white, colorOutline: .black)
                    .offset(y: -5)
                
                HStack(spacing: 10) {
                    Button(action: {
                        lowerMusicAction()
                    }) {
                        ZStack {
                            Image(ImageName.backgroundForAddPin.rawValue)
                                .resizable()
                                .frame(width: 34, height: 34)
                            
                            Text("-")
                                .Rice(size: 32, color: .white, colorOutline: .black)
                        }
                    }
                    .disabled(index == 1 ? true : false)
                    
                    ZStack {
                        Image(ImageName.backgroundForMusicPin.rawValue)
                            .resizable()
                            .frame(width: 178, height: 56)
                        
                        ForEach(0..<index, id: \.self) { index in
                            Image(ImageName.musicPin.rawValue)
                                .resizable()
                                .frame(width: 15, height: 38)
                                .offset(x: CGFloat((index * 20) + (-72)))
                        }
                    }
                    
                    Button(action: {
                        increaseMusicAction()
                    }) {
                        ZStack {
                            Image(ImageName.backgroundForAddPin.rawValue)
                                .resizable()
                                .frame(width: 34, height: 34)
                            
                            Text("+")
                                .Rice(size: 32, color: .white, colorOutline: .black)
                        }
                    }
                    .disabled(index == 8 ? true : false)
                }
            }
            .offset(y: -10)
        }
    }
}

struct BuyButton: View {
    var action: () -> Void
    var cost: String
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.buyButtonBack.rawValue)
                    .resizable()
                    .frame(width: 197, height: 88)
                
                ZStack {
                    StatusLabel(foregroundImage: ImageName.coin.rawValue,
                                text: cost,
                                sizeText: 20,
                                sizeWForegroundImage: 46,
                                sizeHForegroundImage: 46,
                                sizeWBackgroundImage: 83,
                                sizeHBackgroundImage: 38,
                                offsetImage: -35,
                                offsetText: 11)
                    .offset(x: -40)
                    
                    Text("BUY")
                        .Righteous(size: 34, color: .yellow, colorOutline: .black)
                        .offset(x: 45)
                }
            }
        }
    }
}

struct SelectedButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            ZStack {
                Image(ImageName.backForLabel.rawValue)
                    .resizable()
                    .frame(width: 197, height: 88)
                
                Text("SELECTED")
                    .Righteous(size: 34, color: .yellow, colorOutline: .black)
            }
        }
    }
}

struct LevelButton: View {
    var action: () -> Void
    var imageOfLevel: String
    var text: String = ""
    var offsetX: CGFloat
    var offsetY: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(imageOfLevel)
                    .resizable()
                    .frame(width: 70, height: 70)
                
                if imageOfLevel != ImageName.lockedLevel.rawValue {
                    Text(text)
                        .Rice(size: 38, color: .white, colorOutline: .black)
                        .offset(x: -1, y: -3)
                }
            }
        }
        .disabled(imageOfLevel != ImageName.currentLevel.rawValue ? true : false)
        .offset(x: offsetX, y: offsetY)
    }
}

struct SimpleButton: View {
    var action: () -> Void
    var text: String
    var sizeText: CGFloat = 42
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.backLabels.rawValue)
                    .resizable()
                    .frame(width: 184, height: 82)
                
                Text(text)
                    .Righteous(size: sizeText, color: .yellow, colorOutline: .red)
            }
        }
    }
}

struct DoubleButton: View {
    var action: () -> Void
    var text: String
    var textSize: CGFloat = 52
    var image: String
    var sizeWImage: CGFloat
    var sizeHImage: CGFloat
    var offsetXImage: CGFloat = 0
    var offsetYImage: CGFloat = 0
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.widthestLightButtonBackground.rawValue)
                    .resizable()
                    .frame(width: 246, height: 110)
                
                Text(text)
                    .Righteous(size: textSize,
                          color: .yellow,
                          outlineWidth: 1.4,
                          colorOutline: .red)
                    .offset(x: 20)
                
                ZStack {
                    Image(ImageName.lightButtonBackground.rawValue)
                        .resizable()
                        .frame(width: 109, height: 109)
                    
                    Image(image)
                        .resizable()
                        .frame(width: sizeWImage, height: sizeHImage)
                        .offset(x: offsetXImage, y: offsetYImage)
                }
                .offset(x: -110)
                
            }
        }
        .offset(x: 20)
    }
}
