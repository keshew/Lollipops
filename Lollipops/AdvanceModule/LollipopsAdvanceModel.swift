import SwiftUI

struct LollipopsAdvanceModel {
    var nameOfBoostArray = ["SUGAR CANDY", "CARAMEL ROCKET", "YUMMY BOMB"]
    var desckOfBoostArray = ["BREAKS TWO ROWS, ONE HORIZONTALLY AND ONE VERTICALLY", "BREAKS ONE ROWS, EITHER HORIZONTAL OR VERTICAL", "BREAKS IN A CIRCLE"]
    var blockFrom = ["2", "2", "2"]
    var blockTo = ["3", "3", "4"]
    var imageBoost = [ImageName.sugarCandy.rawValue, ImageName.caramelRocket.rawValue, ImageName.yummyBomb.rawValue]
    var sizeWIBoost: [CGFloat] = [0.12, 0.12, 0.2]
    var additionalImage = [ImageName.settingsImage.rawValue, ImageName.advance1.rawValue, ImageName.advance2.rawValue, ImageName.advance3.rawValue]
}


