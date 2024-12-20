import SwiftUI

struct CandyFactoryLevelsView: View {
    @StateObject var CandyFactoryLevelsModel =  CandyFactoryLevelsViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    CandyFactoryLevelsView()
}

