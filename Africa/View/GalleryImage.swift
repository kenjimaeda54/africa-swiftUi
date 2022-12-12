//
//  GalleryImage.swift
//  Africa
//
//  Created by kenjimaeda on 12/12/22.
//

import SwiftUI

struct GalleryImage: View {
	//MARK: - Properties
	let galleryAnimal: AnimalsModel
	
	var body: some View {
		ScrollView(.horizontal,showsIndicators: false) {
			HStack(spacing: 16) {
				ForEach(galleryAnimal.gallery.shuffled(),id: \.self) {animal in
					Image(animal)
						.resizable()
						.scaledToFit()
						.frame(height: 200)
						.cornerRadius(12)
				}
				
			}
		}
	}
}

struct GalleryImage_Previews: PreviewProvider {
	static var previews: some View {
		GalleryImage(galleryAnimal: animalMock)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
