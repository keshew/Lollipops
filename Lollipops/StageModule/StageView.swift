import SwiftUI

struct StageView: View {
    @StateObject var StageModel =  StageViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    StageView()
}

