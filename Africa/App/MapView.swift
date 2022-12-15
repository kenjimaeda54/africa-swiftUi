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
		let location = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.43775599)
		//quanto maior zoom,distancia que o mapa
		//vai abriar e maior
		let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
		let region = MKCoordinateRegion(center: location, span: mapZoomLevel)
		return region
	}()
	
	var locations: [LocationsModel] = Bundle.main.decodeJsonFromBundle(forResource: "locations", withExtension: ".json") ?? []
	
	
	var body: some View {
		Map(coordinateRegion: $region,annotationItems: locations) { annotation in
			//Uma maneira de criar anotations
			//			MapMarker(coordinate: annotation.location,tint: .accentColor)
			MapAnnotation(coordinate: annotation.location) {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32,height: 32)
			}
		}
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
	}
}
