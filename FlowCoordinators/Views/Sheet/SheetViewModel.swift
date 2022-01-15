import Foundation

protocol SheetViewModelProtocol: ObservableObject {
    var text: String { get }
}

final class SheetViewModel: SheetViewModelProtocol, SheetFlowStateProtocol {

    @Published var activeLink: ThirdLink?

    @Published var text: String

    init(text: String) {
        self.text = "Sheet view with \(text)"
    }
}
