import SwiftUI

protocol SecondFlowStateProtocol: ObservableObject {
    var activeLink: SecondLink? { get set }
}

enum SecondLink: Hashable { }

struct SecondFlowCoordinator<State: SecondFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
