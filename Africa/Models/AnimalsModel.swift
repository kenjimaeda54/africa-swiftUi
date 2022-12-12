//
//  AnimalsModel.swift
//  Africa
//
//  Created by kenjimaeda on 10/12/22.
//

import Foundation


struct AnimalsModel: Identifiable,Codable {
	
	let id: String
	let name: String
	let headline: String
	let description: String
	let link: String
	let image : String
	let gallery: [String]
	let fact: [String]
	
	
}
