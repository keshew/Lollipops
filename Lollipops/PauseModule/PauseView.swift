import SwiftUI

struct PauseView: View {
    @StateObject var PauseModel =  PauseViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    PauseView()
}

