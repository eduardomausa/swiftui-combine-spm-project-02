//
//  UserInfoView.swift
//  SwiftUI-Combine-SPM-Project-02
//
//  Created by Eduardo Mausa on 19/10/23.
//

import SwiftUI

struct UserInfoView: View {
    
    let user: GitHubUser
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(user.login)
                .bold()
                .font(.title3)
            
            Text(user.bio)
                .padding()
            
        }
        .padding()
    }
}

#Preview {
    UserInfoView(user: GitHubUser(login: "example_login", avatarUrl: "example_avatar_url", bio: "example_bio"))
}

