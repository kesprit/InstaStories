import SwiftUI

struct StoryView: View {
    @State private var viewModel: ViewModel
    
    init(
        userStories: UserStories,
        dismiss: @escaping () -> Void
    ) {
        self._viewModel = .init(
            wrappedValue: .init(
                initialUserStories: userStories,
                userStoriesUseCase: DIContainer.shared.resolve(type: UserStoriesUseCase.self),
                dismiss: dismiss
            )
        )
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GeometryReader { proxy in
                AsyncImage(url: URL(string: viewModel.storyImageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(width: proxy.size.width)
                .ignoresSafeArea()
            }
            HStack {
                Button(action: {}) {
                    Color.clear
                }
                Button(action: viewModel.nextButtonTapped) {
                    Color.clear
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    ProgressView(value: viewModel.currentTime, total: 10)
                        .progressViewStyle(.linear)
                        .tint(.white)
                    Spacer()
                    Button(
                        "Close",
                        systemImage: "xmark.circle",
                        action:
                            viewModel.closeButtonTapped
                    )
                    .tint(.white)
                    .labelStyle(.iconOnly)
                }
                .padding(.horizontal)
                StoryAvatarView(
                    profileImageURL: viewModel.userImageUrl,
                    username: viewModel.username
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background {
                LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(edges: .top)
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    StoryView(userStories: UserStories.makeMocks(count: 1).first!, dismiss: {})
}
