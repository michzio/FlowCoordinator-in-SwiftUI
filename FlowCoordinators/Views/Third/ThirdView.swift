import SwiftUI

struct ThirdView<VM: ThirdViewModelProtocol & ThridFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        ThirdFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}

//struct ThirdView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThirdView(viewModel: MockThirdViewModel())
//    }
//}
