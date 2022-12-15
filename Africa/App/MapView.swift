//
//  MapView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
	//MARK: - Properties
	@State var region: MKCoordinateRegion = {
		let center = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
		//quanto maior o zoom maior proximo sera quando o map abrir
		let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
		let region =  MKCoordinateRegion(center: center, span: mapZoomLevel)
		return region
	}()
	
	var locations: [LocationsModel] = Bundle.main.decodeJsonFromBundle(forResource: "locations", withExtension: ".json") ?? []
	
	
	var body: some View {
		Map(coordinateRegion: $region,annotationItems: locations) { annotations in
			//esse cordinate esera um CLLocationCoordinate2D
			//nos criamos como propriedade computada
			//MapMarker(coordinate: annotations.location,tint: .accentColor)
			
			//			MapAnnotation(coordinate: annotations.location) {
			//				Image("logo")
			//					.resizable()
			//					.scaledToFit()
			//					.frame(width: 32,height: 32)
			//			}
			MapAnnotation(coordinate: annotations.location) {
				MapAnnotationView(location: annotations)
			}
			
		}//MAP
		.overlay(alignment: .top) {
			
			HStack(alignment: .center, spacing: 10) {
				Image("compass")
					.resizable()
					.scaledToFit()
					.frame(width: 52,height: 52)
					.padding(.horizontal,10)
					.padding(.vertical,10)
				
				VStack(alignment: .leading) {
					HStack {
						Text("Latitude")
							.font(.footnote)
							.foregroundColor(.accentColor)
						
						Spacer()
						
						Text("\(region.center.latitude)")
							.font(.footnote)
					}
					
					Divider()
					
					HStack {
						Text("Longitude")
							.font(.footnote)
							.foregroundColor(.accentColor)
						
						
						Spacer()
						
						Text("\(region.center.longitude)")
							.font(.footnote)
					}
					
					
				}//VStack
				.padding(.horizontal,10)
				.padding(.vertical,5)
				
				
			} //Hstack
			.background(
				Color.black
					.cornerRadius(6)
					.opacity(0.6)
				
			)
			.padding(.vertical, 55)
			.padding(.horizontal,20)
			
		} //Overlay
		.edgesIgnoringSafeArea(.all)
	
		
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
	}
}
