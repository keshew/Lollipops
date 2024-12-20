import SwiftUI

struct LoseLivesOverView: View {
    @StateObject var LoseLivesOverModel =  LoseLivesOverViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    LoseLivesOverView()
}

