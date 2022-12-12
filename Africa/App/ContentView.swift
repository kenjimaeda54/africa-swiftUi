//
//  ContentView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct ContentView: View {
	let animals: [AnimalsModel] = Bundle.main.decodeJsonFromBundle(forResource: "animals", withExtension: "json") ?? []
	
	
	var body: some View {

		
		NavigationStack {
			//para imgagem ficar no topo
			
			//não passei o animals  no List, porque vai gerar
			//lop do CoverImageView, por isso tem um forEach dentro do List
			List {
				CoverImageView()
					.frame( height: 300)
					.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
				
				ForEach(animals) { animal in
					NavigationLink(destination: AnimalDetails(animal: animal)) {
						
						ListItemView(animal: animal)
						Divider()
							.background(.gray)
							.opacity(0.0)
							//sumir com linha que aparece ao lado da row
						//para selecionar o elemento
					}
				}
				
			}// List
			.scrollIndicators(.hidden)
			.listStyle(.plain)
			.foregroundColor(.white)
			.navigationBarTitleDisplayMode(.large)
			.navigationTitle("Africa")
		}// Navigation Stack
	
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
