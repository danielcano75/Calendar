//
//  HomeView.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 4/03/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
           VStack {
               
           }
           .toolbar(content: {
               ToolbarItem(placement: .topBarLeading) {
                   // Imagen de perfil
                   Text("Hola")
               }
               ToolbarItem(placement: .topBarTrailing) {
                   ButtonItem()
               }
           })
           .navigationBarTitleDisplayMode(.automatic)
           .navigationTitle("Hola")
       }
}

struct ButtonItem: View {
    var body: some View {
        Button(action: {}, label: {
            Circle()
                .tint(DesignSystem.AppColor.Icon.background)
                .overlay {
                    Image(systemName: "gearshape")
                        .resizable()
                        .tint(DesignSystem.AppColor.Icon.tint)
                        .padding(DesignSystem.DefaultDimension.Icon.padding)
                }
        })
        .frame(width: DesignSystem.DefaultDimension.Icon.size, height: DesignSystem.DefaultDimension.Icon.size)
    }
}

#Preview {
    @State var navigationPath = NavigationPath()
    return NavigationStack(path: $navigationPath) {
        HomeView()
    }
}
