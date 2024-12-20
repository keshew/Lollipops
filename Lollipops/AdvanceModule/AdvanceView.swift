import SwiftUI

struct AdvanceView: View {
    @StateObject var AdvanceModel =  AdvanceViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    AdvanceView()
}

