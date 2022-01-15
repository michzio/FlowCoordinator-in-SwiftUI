import SwiftUI

protocol ThridFlowStateProtocol: ObservableObject {
    var activeLink: ThirdLink? { get set }
}

enum ThirdLink: Hashable { }

struct ThirdFlowCoordinator<State: ThridFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
