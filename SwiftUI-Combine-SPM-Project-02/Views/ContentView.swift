//
//  ContentView.swift
//  SwiftUI-Combine-SPM-Project-02
//
//  Created by Eduardo Mausa on 18/10/23.
//

import SwiftUI

struct ContentView: View {

    @State private var username: String = ""
    @State private var isActive: Bool = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter username", text: $username)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .onChange(of: username) { newValue in
                        username = newValue.lowercased()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Get User Info") {
                    Task {
                        do {
                            let user = try await viewModel.getUser(username: username)
                            viewModel.user = user
                            isActive = true
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                .padding()
                
                NavigationLink(destination: UserInfoView(user: viewModel.user), isActive: $isActive) {
                    EmptyView()
                }
                .id(isActive)
                .padding()
                .disabled(viewModel.user.login.isEmpty)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
