//
//  ContentView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct ContentView: View {
	//MARK: - Properties
	@State private var isGridView = false
	let animals: [AnimalsModel] = Bundle.main.decodeJsonFromBundle(forResource: "animals", withExtension: "json") ?? []
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn = 1
	@State private var iconBar = "square.grid.2x2"
	@State private var collectionIconBar: [Int: String] = [1:"square.grid.2x2",2:"square.grid.3x2",3:"rectangle.grid.1x2"]
	@State private var hiptcs = UIImpactFeedbackGenerator(style: .medium)
	
	//MARK: - Func
	
	func toggleGridLayout()  {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3  + 1)
		gridColumn = gridLayout.count
		iconBar = collectionIconBar[gridColumn] ?? "square.grid.2x2"
		
	}
	
	
	var body: some View {
		
		
		NavigationView {
			Group {
				if !isGridView {
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
						//criei um modifier para centralizar
						//o conteudo
						CreditsView()
							.modifier(CenterModifier())
						
					}
				} else {
					ScrollView(showsIndicators: false){
						LazyVGrid(columns: gridLayout) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetails(animal: animal)) {
									AnimalGridView(animal: animal)
								}
							}
						}
					}
				}// List
			}
			//para imagem ficar no topo
			
			//não passei o animals  no construtor do List, porque não ira ficar topo
			.scrollIndicators(.hidden)
			.listStyle(.plain)
			.foregroundColor(.white)
			.navigationBarTitleDisplayMode(.large)
			.navigationTitle("Africa")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					
					HStack{
						Image(systemName: "square.fill.text.grid.1x2")
							.foregroundColor(!isGridView ? .accentColor :  .primary)
							.onTapGesture {
								hiptcs.impactOccurred()
								isGridView = false
								
							}
						
						Image(systemName: iconBar)
							.foregroundColor(isGridView ? .accentColor :  .primary)
							.onTapGesture {
								hiptcs.impactOccurred()
								isGridView = true
								toggleGridLayout()
							}
						
					}
					
				}
			}
		}// Navigation Stack
		
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
