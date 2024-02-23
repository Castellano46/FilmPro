//
//  ViewModel.swift
//  FilmApp
//
//  Created by Pedro on 20/2/24.
//

import Foundation
import Observation

@Observable
class ViewModel {
    var videos: [Video] = []
    var videosIds: Set<Video.ID> = []
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        Task {
            do {
                guard let url = URL(string: "pon aqui tu JSON")
                else {
                    return
                }
                
                let (jsonData, _) = try await URLSession.shared.data(from: url)
                videos = try JSONDecoder().decode([Video].self, from: jsonData)
                
            } catch {
                videos = []
            }
        }
    }
    
    func isVideoIdsEmpty() -> Bool {
        videosIds.isEmpty
    }
    
    func getSelectedVideoId() -> String {
        videos.first(where: { $0.id == videosIds.first })?.url ?? ""
    }
    
    func getSelectedVideoTitle() -> String {
        videos.first(where: { $0.id == videosIds.first })?.title ?? ""
    }
}
