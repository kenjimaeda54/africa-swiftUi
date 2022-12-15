//
//  LocationsModel.swift
//  Africa
//
//  Created by kenjimaeda on 14/12/22.
//

import Foundation
import MapKit

struct LocationsModel: Identifiable,Codable {
	let id: String
	let name: String
	let image: String
	let latitude: Double
	let longitude: Double
	
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	
}
