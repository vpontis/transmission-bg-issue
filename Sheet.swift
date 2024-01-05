import SwiftUI
import Transmission

struct LumaSheetModifier<Destination: View>: ViewModifier {
    var detents: [PresentationLinkTransition.SheetTransitionOptions.Detent] = .init([.large])
    var isPresented: Binding<Bool>
    var backgroundColor: UIColor? = nil
    var backgroundMaterial: Material? = nil
    var largestUndimmedDetentIdentifier: PresentationLinkTransition.SheetTransitionOptions.Detent? = nil

    @ViewBuilder var destination: Destination

    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .presentation(
                transition: .sheet(
                    options: .init(
                        detents: detents,
                        largestUndimmedDetentIdentifier: largestUndimmedDetentIdentifier?.identifier,
                        isInteractive: true,
                        preferredCornerRadius: 20,
                        options: .init(
                            shouldAutomaticallyDismissDestination: false,
                            preferredPresentationBackgroundColor: backgroundColor
                        )
                    )
                ),
                isPresented: isPresented
            ) {
                VStack {
                    Text("HI \(colorScheme == .dark ? "dark" : "light")")
                        .foregroundColor(.blue)

                    destination
                }
                .environment(\.colorScheme, .dark)
            }
            .animation(.default, value: isPresented.wrappedValue)
    }
}

extension UIColor {
    convenience init(_ name: String) {
        self.init { traitCollection in
            UIColor(named: name, in: nil, compatibleWith: traitCollection)!
        }
    }
}
