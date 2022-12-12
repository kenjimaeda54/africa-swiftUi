//
//  AnimalDetails.swift
//  Africa
//
//  Created by kenjimaeda on 10/12/22.
//

import SwiftUI

struct AnimalDetails: View {
	//MARK: - Properties
	let animal: AnimalsModel
	
	var body: some View {
		ScrollView(.vertical,showsIndicators: false) {
			VStack(alignment: .center, spacing: 20) {
				Image(animal.image)
					.resizable()
					.scaledToFit()
					.ignoresSafeArea(.all)
					.clipped()
				
				
				Text(animal.name.uppercased())
					.background(
						Color.accentColor
							.frame(height: 5)
							.offset(y:24)
					)
					.font(.largeTitle)
					.fontWeight(.heavy)
					.padding()
				
				Text(animal.headline)
					.font(.headline)
					.foregroundColor(.accentColor)
					.multilineTextAlignment(.leading)
					.padding()
				
				Group {
					HeadingView(image: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
					GalleryImage(galleryAnimal: animal)
					
				}
				.padding(.vertical,16)
				
				
				Group {
					HeadingView(image: "info.circle", title: "All about \(animal.name)")
					Text(animal.description)
						.multilineTextAlignment(.leading)
					
				}
				
				Group {
					HeadingView(image: "map", title: "National Parks")
					InsetMapView()
				}
				
				Group {
					HeadingView(image: "books.vertical", title: "Learn More")
					ExternalWebLinkView(animal: animal)
					
				}
				
				
			}// Vstack
			
		}
		.navigationBarTitle("Learn about \(animal.name)")
		.navigationBarTitleDisplayMode(.inline)
		.padding(.vertical,20)
		
	}// ScrollView
	
	
}

struct AnimalDetails_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			AnimalDetails(animal: animalMock)
				.previewLayout(.sizeThatFits)
		}
	}
}
