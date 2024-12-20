import SwiftUI

struct LoadingView: View {
    @StateObject var LoadingModel =  LoadingViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    LoadingView()
}

