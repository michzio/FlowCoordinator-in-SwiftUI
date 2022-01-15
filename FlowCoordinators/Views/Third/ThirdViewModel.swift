import Foundation

protocol ThirdViewModelProtocol: ObservableObject {
    var text: String { get }
}

final class ThirdViewModel: ThirdViewModelProtocol, ThridFlowStateProtocol {

    @Published var activeLink: ThirdLink?

    let text = "Default Third View"

    init() { }
}
