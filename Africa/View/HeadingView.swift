//
//  HeadingView.swift
//  Africa
//
//  Created by kenjimaeda on 12/12/22.
//

import SwiftUI

struct HeadingView: View {
	//MARK: - Properties
	let image: String
	let title: String
	
	var body: some View {
		HStack(alignment: .center, spacing: 16) {
				Image(systemName: image)
				.foregroundColor(.accentColor)
				.font(.title2)
			
			 Text(title)
				.fontWeight(.bold)
				.font(.title2)
		
		}
	}
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
			HeadingView(image: "photo.on.rectangle.angled", title: "wilderness")
				.previewLayout(.sizeThatFits)
				.padding()
			
		}
}
