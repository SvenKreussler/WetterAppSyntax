//
//  TabsView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import SwiftUI

struct TabsView: View {
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(tab: $selectedTab)
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)
            
            MapsView(tab: $selectedTab)
                .tabitem {
                    Label(TabItem.maps.title, systemImage: TabItem.maps.icon)
                }
                .tag(TabItem.maps)
            
            SearchView()
                .tabItem {
                    Label(TabItem.search.title, systemImage: TabItem.search.icon)
                }
                .tag(TabItem.search)
            
        }
    }
    
    // MARK: - Variables
    
    @State private var selectedTab: TabItem =
}

#Preview {
    TabsView()
}
