import SwiftUI

struct SecondView<VM: SecondViewModelProtocol & SecondFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        SecondFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(viewModel: MockSecondViewModel())
//    }
//}
