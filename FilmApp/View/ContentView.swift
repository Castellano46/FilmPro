//
//  ContentView.swift
//  FilmApp
//
//  Created by Pedro on 20/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var viewModel = ViewModel()
    @State var selectedFavorite: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.videos, selection: $viewModel.videosIds) { video in
                VStack {
                    AsyncImage(url: .init(string: video.image), scale: 1.0)
                    { image in
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(video.title)
                        .font(.title)
                        .padding(.top,2)
                }
                .padding()
            }
            .navigationTitle("Películas")
        } detail: {
            VStack {
                if !viewModel.isVideoIdsEmpty() {
                    VStack {
                        Text(viewModel.getSelectedVideoTitle())
                            .font(.largeTitle)
                        FilmView(videoId: viewModel.getSelectedVideoId())
                            .padding()
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        selectedFavorite.toggle()
                    } label: {
                        Label("Favorite", systemImage: "heart")
                            .symbolVariant(selectedFavorite ? .fill : .none)
                    }
                }
            })
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
