import Blocks
import ComposableArchitecture
import Foundation
import MessageUI

@Reducer
public struct MailerFeature {
    public struct State: Equatable {
        var mailtoComponents: MailtoComponents
    }

    public enum Action {
        case interactionCompleted(MFMailComposeResult)
    }

    @Dependency(\.dismiss) var dismiss

    public var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .interactionCompleted:
                return .run { _ in await dismiss() }
            }
        }
    }
}
