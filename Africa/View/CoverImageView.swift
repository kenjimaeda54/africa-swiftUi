//
//  ConverImageView.swift
//  Africa
//
//  Created by kenjimaeda on 10/12/22.
//

import SwiftUI

struct CoverImageView: View {
	//creiei meu proprio extension para bundle
	let coverImage: [CoverImageModel] = Bundle.main.decodeJsonFromBundle(forResource: "covers", withExtension: "json") ?? []
	
	
	
	var body: some View {
		TabView {
			ForEach(coverImage) {cover  in
				Image(cover.name)
					.resizable()
					.scaledToFit()
			}
			
		}// TabView
		.tabViewStyle(PageTabViewStyle())
		
	}
}

struct ConverImageView_Previews: PreviewProvider {
	static var previews: some View {
		CoverImageView()
			.previewLayout(.fixed(width: 400, height: 300))
	}
}
