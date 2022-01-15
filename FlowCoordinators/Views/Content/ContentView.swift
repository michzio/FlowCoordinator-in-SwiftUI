import SwiftUI

struct ContentView<VM: ContentViewModelProtocol & ContentFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        ContentFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Text(viewModel.text)

                Button("First view >", action: viewModel.firstAction)
                Button("Second view >", action: viewModel.secondAction)
                Button("Third view >", action: viewModel.thirdAction)
                Button("Sheet view", action: viewModel.sheetAction)
            }
        }
        .navigationBarTitle("Title", displayMode: .inline)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: MockContentViewModel())
//    }
//}
