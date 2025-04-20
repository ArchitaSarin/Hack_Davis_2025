import SwiftUI
import AVKit

struct DocLoadingPage: View {
    @State private var navigate = false

    private let player: AVPlayer? = {
        if let url = Bundle.main.url(forResource: "loading", withExtension: "mp4") {
            return AVPlayer(url: url)
        } else {
            print("Video file not found.")
            return nil
        }
    }()

    var body: some View {
        let darkBlueCol = Color(red: 0.25, green: 0.4, blue: 0.7)

        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Filling out your document...")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(darkBlueCol)
                        .multilineTextAlignment(.center)

                    if let player {
                        VideoPlayer(player: player)
                            .frame(width: 301, height: 219)
                            .allowsHitTesting(false)
                            .onAppear {
                                player.play()
                                player.isMuted = true
                                player.actionAtItemEnd = .none
                                NotificationCenter.default.addObserver(
                                    forName: .AVPlayerItemDidPlayToEndTime,
                                    object: player.currentItem,
                                    queue: .main
                                ) { _ in
                                    player.seek(to: .zero)
                                    player.play()
                                }
                            }
                    } else {
                        Text("Video not found.")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    navigate = true
                }
            }
            .navigationDestination(isPresented: $navigate) {
                DocFiller()
            }
        }
    }
}
