//
//  MainView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct MainView: View {
	
	var body: some View {
		TabView {
			
			
		
			ContentView()
				.tabItem{
					Label("Browse",systemImage: "square.grid.3x3")
				}
			
			VideoListView()
				.tabItem{
					Label("Watch",systemImage: "play.square")
				}
			
			MapView()
				.tabItem{
					Label("Locations",systemImage: "map")
				}
			
			GalleryView()
				.tabItem{
					Label("Gallery",systemImage: "photo")

				}
			
		}// TabView
		.edgesIgnoringSafeArea(.all)
		//on apear para corrigir o bug do tabView
		//mudar a cor de background
		.onAppear() {
			UITabBar.appearance().isTranslucent = true
			UITabBar.appearance().itemPositioning = .centered
			UITabBar.appearance().backgroundColor = UIColor(displayP3Red: 19/255, green: 24/255, blue: 25/255, alpha: 1)
		}
		
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
