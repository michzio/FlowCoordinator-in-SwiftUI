import Foundation

protocol ContentViewModelProtocol: ObservableObject {
    var text: String { get }

    func firstAction()
    func secondAction()
    func thirdAction()
    func sheetAction()
}

final class ContentViewModel: ContentViewModelProtocol, ContentFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: ContentLink?

    // MARK: - View Model

    let text: String = "Content View"

    init() { }

    func firstAction() {
        activeLink = .firstLinkParametrized(text: "Some param")
    }

    func secondAction() {
        activeLink = .secondLinkParametrized(number: 2)
    }

    func thirdAction() {
        activeLink = .thirdLink
    }

    func sheetAction() {
        activeLink = .sheetLink(item: "Sheet param")
    }
}
