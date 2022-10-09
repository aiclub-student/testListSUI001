//
//  MultiTabView.swift
//  testListSUI001
//
//  Created by Amit Gupta on 10/9/22.
//

import SwiftUI

struct MultiTabView: View {
    var body: some View {
        TabView{
            WebView(url:URL(string:"https://aiclub.world/privacy")!)
                .tabItem{
                    Label("Web page",systemImage: "eyes.inverse")
                }
            GoodDeedView()
                .tabItem{
                    Label("Do Good",systemImage: "list.number")
                }
            RedeemPointsView()
                .tabItem{
                    Label("Redeem",systemImage: "keyboard")
                }
        }
    }
}

struct Tab1View: View {
    var body: some View {
        Text("Page 1")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Tab2View: View {
    var body: some View {
        Text("Page 2")
    }
}

struct Tab3View: View {
    var body: some View {
        Text("Page 3")
    }
}

struct MultiTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MultiTabView()
        }
    }
}
