//
//  ExternalWebLinkvIEW.swift
//  Africa
//
//  Created by kenjimaeda on 12/12/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
	//MARK: - Properties
	let animal: AnimalsModel
	
	var body: some View {
		GroupBox {
			HStack {
				Image(systemName: "globe")
				Text("Wikipedia")
				
				Spacer()
				
				Image(systemName: "checkmark.square")
					.foregroundColor(.accentColor)
				Link(animal.name, destination: (URL(string: animal.link ) ?? URL(string: "https://wikipedia.com"))!)
			}
			.padding(4)
			
		}//Box
	}
}

struct ExternalWebLinkvIEW_Previews: PreviewProvider {
	static var previews: some View {
		ExternalWebLinkView(animal: animalMock)
			.previewLayout(.sizeThatFits)
	}
}
