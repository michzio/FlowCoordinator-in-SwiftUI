import SwiftUI

struct SheetView<VM: SheetViewModelProtocol & SheetFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        SheetFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
