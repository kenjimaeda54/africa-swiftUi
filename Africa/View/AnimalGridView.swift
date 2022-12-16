//
//  AnimalGridView.swift
//  Africa
//
//  Created by kenjimaeda on 16/12/22.
//

import SwiftUI

struct AnimalGridView: View {
	//MARK: - Properties
	let animal: AnimalsModel
	var body: some View {
		Image(animal.image)
			.resizable()
			.scaledToFit()
			.cornerRadius(12)
	}
}

struct AnimalGridView_Previews: PreviewProvider {
	static var previews: some View {
		AnimalGridView(animal: animalMock)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
