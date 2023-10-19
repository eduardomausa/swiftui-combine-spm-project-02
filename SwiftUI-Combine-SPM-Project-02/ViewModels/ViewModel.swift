//
//  ViewModel.swift
//  SwiftUI-Combine-SPM-Project-02
//
//  Created by Eduardo Mausa on 18/10/23.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var user = GitHubUser(login: "", avatarUrl: "", bio: "")
        
        func getUser(username: String) async throws -> GitHubUser {
            let endpoint = "https://api.github.com/users/\(username)"
            guard let url = URL(string: endpoint) else {
                throw GHError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw GHError.invalidResponse
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(GitHubUser.self, from: data)
            } catch {
                throw GHError.invalidData
            }
        }
    }
}



