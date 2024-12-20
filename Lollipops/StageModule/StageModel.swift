import SwiftUI

struct StageModel {
    var stageImagesArray = [ImageName.stage1.rawValue, ImageName.stage2.rawValue, ImageName.stage3.rawValue]
    var stageNameArray = ["SWEET CASTLE", "CANDY FACTORY", "SECRET LOCATIOIN"]
    var playImageArray = [ImageName.playForegroundButton.rawValue, ImageName.playForegroundButton.rawValue, ImageName.lock.rawValue]
    var progressInProcent = ["0%", "0%", "LOCKED"]
    var sizePlayImages: [CGFloat] = [53, 53, 70]
    var offsetPlayImages: [CGSize] = [CGSize(width: 5, height: 2), CGSize(width: 5, height: 2), CGSize(width: 0, height: 0)]
}


