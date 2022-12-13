//
//  VideoModel.swift
//  Africa
//
//  Created by kenjimaeda on 13/12/22.
//

import Foundation

struct VideoModel: Identifiable,Codable {
	let id: String
	let name: String
	let headline: String
	
	//criando uma variavel computada
	//assim quando chamar ja vai exibir o video
	
	//thumbnail sera video-cheaset
	//video-lion
	var thumbnail: String {
		"video-\(id)"
	}
	
	
}
