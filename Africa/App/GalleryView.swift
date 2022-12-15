//
//  GalleryView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct GalleryView: View {
	//MARK: - Properties
	@State private var imageSelected = "lion"
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	//slider espera um dobule por isso iniciamos as column com double
	@State private var column: Double = 3.0
	
	let animals: [AnimalsModel] = Bundle.main.decodeJsonFromBundle(forResource: "animals", withExtension: ".json") ??  []
	
	//maneira um de criar grid item
	// let gridItem: [GridItem] = [
	//GridItem(.flexible()),
	//GridItem(.flexible()),
	//GridItem(.flexible())
	//]
	
	//maneira dois de criar grit item
	//	let gridItem: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
	//
	
	func prepareGridItem() {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(column))
		
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .center, spacing: 35) {
				
				Image(imageSelected)
					.resizable()
					.scaledToFit()
					.clipShape(Circle())
					.overlay(content: {
						Circle()
							.stroke(Color.white,lineWidth: 1)
					})
				
				//assim que o value mudar ja reflete no column
				//para acontecer esse bind precisa do $ e a prorpiedade ser State
				Slider(value: $column,in: 2...4,step: 1) {_ in
					withAnimation(.easeInOut(duration: 0.1)) {
						prepareGridItem()
					}
				}
				
				LazyVGrid(columns: gridLayout) {
					ForEach(animals)  { animal in
						Image(animal.image)
							.resizable()
							.scaledToFit()
							.clipShape(Circle())
							.overlay(content: {
								Circle().stroke(Color.white,lineWidth: 1)
							})
							.onTapGesture {
								imageSelected = animal.image
							}
					}
				}// Grid
				
			}//Vstack
			.padding(.vertical,35)
			
			
		}//ScroolView
		//nil vai ser o substituido para .inifity
		.frame(width: nil,height: nil)
		.background(MotionEffectView())
		//preciso sempre iniciar o prepareGridItem()
		.onAppear {
			prepareGridItem()
		}
	}
}

struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
