import SwiftUI

protocol ContentFlowStateProtocol: ObservableObject {
    var activeLink: ContentLink? { get set }
}

enum ContentLink: Hashable, Identifiable {
    case firstLink
    case firstLinkParametrized(text: String)
    case secondLink
    case secondLinkParametrized(number: Int)
    case thirdLink

    case sheetLink(item: String)

    var navigationLink: ContentLink {
        switch self {
        case .firstLinkParametrized:
            return .firstLink
        case .secondLinkParametrized:
            return .secondLink
        default:
            return self
        }
    }

    var sheetItem: ContentLink? {
        switch self {
        case .sheetLink:
            return self
        default:
            return nil
        }
    }

    var id: String {
        switch self {
        case .firstLink, .firstLinkParametrized:
            return "first"
        case .secondLink, .secondLinkParametrized:
            return "second"
        case .thirdLink:
            return "third"
        case let .sheetLink(item):
            return item
        }
    }
}

struct ContentFlowCoordinator<State: ContentFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    private var activeLink: Binding<ContentLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    private var sheetItem: Binding<ContentLink?> {
        $state.activeLink.map(get: { $0?.sheetItem }, set: { $0 })
    }

    var body: some View {
        NavigationView {
            ZStack {
                content()
                    .sheet(item: sheetItem, content: sheetContent)

                navigationLinks
            }
        }
        .navigationViewStyle(.stack)
    }

    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .firstLink, selection: activeLink, destination: firstDestination) { EmptyView() }
        NavigationLink(tag: .secondLink, selection: activeLink, destination: secondDestination) { EmptyView() }
        NavigationLink(tag: .thirdLink, selection: activeLink, destination: secondDestination) { EmptyView() }
    }

    private func firstDestination() -> some View {
        var text: String?
        if case let .firstLinkParametrized(param) = state.activeLink {
            text = param
        }

        let viewModel = FirstViewModel(text: text)
        let view = FirstView(viewModel: viewModel)
        return view 
    }

    private func secondDestination() -> some View {
        var number: Int?
        if case let .secondLinkParametrized(param) = state.activeLink {
            number = param
        }

        let viewModel = SecondViewModel(number: number)
        let view = SecondView(viewModel: viewModel)
        return view
    }

    private func thirdDestination() -> some View {
        let viewModel = ThirdViewModel()
        let view = ThirdView(viewModel: viewModel)
        return view
    }

    @ViewBuilder private func sheetContent(sheetItem: ContentLink) -> some View {
        switch sheetItem {
        case let .sheetLink(item):
            SheetView(viewModel: SheetViewModel(text: item))
        default:
            EmptyView()
        }
    }
}

extension Binding {
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(
            get: {
                get(wrappedValue)
            },
            set: {
                wrappedValue = set($0)
            }
        )
    }
}
