//
//  LoadingPage.swift
//  HackDavis25
//
//  Created by Manushri Rane on 4/20/25.
//

import SwiftUI
import AVKit

struct LoadingPage: View {
    
    private let player: AVPlayer? = {
        if let url = Bundle.main.url(forResource: "loading", withExtension: "mp4") {
            return AVPlayer(url: url)
        } else {
            print(" Video file not found.")
            return nil
        }
    }()

    var body: some View {
        let blueCol = Color(red: 0.53, green: 0.70, blue: 0.93)
        let greenCol = Color(red: 0.729, green: 0.875, blue: 0.741)
        let darkBlueCol = Color(red: 0.25, green: 0.4, blue: 0.7)
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("One moment please...")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(darkBlueCol)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)

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
    }
}

#Preview {
    LoadingPage()
}

