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
            
            
            HomeView()
                .environmentObject(locationCurrent)
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)
                
                
            
            MapView()
                .tabItem {
                    Label(TabItem.maps.title, systemImage: TabItem.maps.icon)
                }
                .tag(TabItem.maps)
            
            LocationSearchView()
                .tabItem {
                    Label(TabItem.search.title, systemImage: TabItem.search.icon)
                }
                .tag(TabItem.search)
            
        }
    }
    
    // MARK: - Variables
    
    @State private var selectedTab: TabItem = .home
    @StateObject private var locationCurrent = LocationFeaturesViewModel()
}

#Preview {
    TabsView()
}
