import SwiftUI

@main
struct FlowCoordinatorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
