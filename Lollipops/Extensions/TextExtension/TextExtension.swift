import SwiftUI

extension Text {
    func Rice(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.8, colorOutline: Color) -> some View {
        self.font(.custom("SpicyRice-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
    func Righteous(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.8, colorOutline: Color) -> some View {
        self.font(.custom("Righteous-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
    func Rock(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.8, colorOutline: Color) -> some View {
        self.font(.custom("RocknRollOne-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

