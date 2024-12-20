import SwiftUI

struct SweetCastleLevelsView: View {
    @StateObject var SweetCastleLevelsModel =  SweetCastleLevelsViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    SweetCastleLevelsView()
}

