//
//  TabsView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//
//  abstract: navigation of tabs

import SwiftUI

struct TabsView: View {
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            
            HomeView()
                .environmentObject(locationSearchListViewModel)
                .environmentObject(locationCurrent)
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)
                .onAppear {
                    Task {
                        locationCurrent.fetchLocations()
                        await locationCurrent.fetchWeatherData()
                    }
                }
            
            MapView()
                .tabItem {
                    Label(TabItem.maps.title, systemImage: TabItem.maps.icon)
                }
                .tag(TabItem.maps)
            
            LocationSearchListView()
                .tabItem {
                    Label(TabItem.search.title, systemImage: TabItem.search.icon)
                }
                .tag(TabItem.search)
            
        }
        
    }
    
    // MARK: - Variables
    
    @State private var selectedTab: TabItem = .home
    
    @StateObject private var locationCurrent = LocationFeaturesViewModel()
    
    @StateObject var locationSearchListViewModel = LocationSearchListViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
}

#Preview {
    TabsView()
        .environmentObject(LocationSearchListViewModel())
}
