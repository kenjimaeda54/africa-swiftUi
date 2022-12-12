//
//  ListItemView.swift
//  Africa
//
//  Created by kenjimaeda on 10/12/22.
//

import SwiftUI

struct ListItemView: View {
	//MARK: - Property
	var animal: AnimalsModel
	
	var body: some View {
		HStack(alignment: .center, spacing: 16) {
			Image(animal.image)
				.resizable()
				.scaledToFill()
				.frame(width: 90,height: 90)
				.clipShape(
					RoundedRectangle(cornerRadius: 10)
				)
			VStack(alignment: .leading, spacing: 16){
				
				Text(animal.name)
					.fontWeight(.heavy)
					.foregroundColor(.accentColor)
				
				Text(animal.headline)
					.font(.footnote)
				
			}// VSstack
		} // HStack
	}
}

struct ListItemView_Previews: PreviewProvider {
	
	
	static var previews: some View {
	
		ListItemView(animal: animalMock)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
