//
//  HomeView.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 4/03/24.
//

import SwiftUI

struct HomeView: View {
    private struct Constants {
        static let iconSize: CGFloat = 30
        static let circleSize: CGFloat = 40
        static let cornerRadius: CGFloat = 25.0
        static let outgoingArrowSize: CGFloat = 25
    }
    
    var body: some View {
        ZStack {
            DesignSystem.AppColor.background.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("Persson name")
                        .fontWeight(.bold)
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    VStack(alignment: .leading, spacing: .zero) {
                        Circle()
                            .fill(DesignSystem.AppColor.Text.accent)
                            .overlay {
                                Image(systemName: "arrow.clockwise")
                                    .font(.system(size: Constants.iconSize))
                            }
                            .frame(width: Constants.circleSize,
                                   height: Constants.circleSize)
                            .padding([.horizontal, .top])
                        Text("Ongoing")
                            .fontWeight(.bold)
                            .padding([.horizontal, .top])
                        HStack {
                            Text("## Tasks")
                            Spacer()
                            Image(systemName: "arrow.up.right.circle")
                                .font(.system(size: Constants.outgoingArrowSize))
                        }
                        .padding([.horizontal, .vertical])
                    }
                    .tint(DesignSystem.AppColor.Text.black)
                }
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(DesignSystem.AppColor.sleekCyan)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonItem()
                }
            })
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Hola,")
        }
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
