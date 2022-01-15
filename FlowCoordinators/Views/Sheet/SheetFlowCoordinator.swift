import SwiftUI

protocol SheetFlowStateProtocol: ObservableObject {
    var activeLink: ThirdLink? { get set }
}

enum SheetLink: Hashable { }

struct SheetFlowCoordinator<State: SheetFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
