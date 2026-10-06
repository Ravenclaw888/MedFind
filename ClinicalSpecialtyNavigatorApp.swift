import SwiftUI

@main
struct ClinicalSpecialtyNavigatorApp: App {
    var body: some Scene {
        WindowGroup {
            NavigatorView()
                .frame(minWidth: 1120, minHeight: 760)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
