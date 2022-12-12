//
//  InsetMapView.swift
//  Africa
//
//  Created by kenjimaeda on 12/12/22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
	//Mark: - Properties
	@State var cordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
	
	var body: some View {
		Map(coordinateRegion: $cordinate)
			.frame(height: 256)
			.cornerRadius(16)
			.overlay(alignment: .topTrailing,content:  {
				NavigationLink(destination: MapView()) {
					HStack {
						Image(systemName: "info.circle")
						
						Text("Locations")
					}// HStack
					.padding(.horizontal,16)
					.padding(.vertical,10)
					.background(
						Color.black
							.opacity(0.4)
							.cornerRadius(8)
					)
					
				}// Navigation
				.padding(.vertical,20)
				.padding(.horizontal,15)
				
			})
	}
}

struct InsetMapView_Previews: PreviewProvider {
	static var previews: some View {
		InsetMapView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
