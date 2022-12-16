# Africa
Aplicativo com os animais nativos da Africa

## Feature
- Aprendi a trabalhar com tab bar view
- Para alterar a cor usei UITabBar.appearance()


``` swift
	TabView {
			
			
		
			ContentView()
				.tabItem{
					Label("Browse",systemImage: "square.grid.3x3")
				}
			
			VideoListView()
				.tabItem{
					Label("Watch",systemImage: "play.square")
				}
			
			MapView()
				.tabItem{
					Label("Locations",systemImage: "map")
				}
			
			GalleryView()
				.tabItem{
					Label("Gallery",systemImage: "photo")

				}
			
		}// TabView
		.edgesIgnoringSafeArea(.all)
		.onAppear() {
			UITabBar.appearance().isTranslucent = true
			UITabBar.appearance().itemPositioning = .centered
			UITabBar.appearance().backgroundColor = UIColor(displayP3Red: 19/255, green: 24/255, blue: 25/255, alpha: 1)
		}



```

##
- Aprendi a trabalhar com grid layout com swiftUi 




```swift
@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
@State private var gridColumn = 1
@State private var iconBar = "square.grid.2x2"
@State private var collectionIconBar: [Int: String] = [1:"square.grid.2x2",2:"square.grid.3x2",3:"rectangle.grid.1x2"]

	func toggleGridLayout()  {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3  + 1)
		gridColumn = gridLayout.count
		iconBar = collectionIconBar[gridColumn] ?? "square.grid.2x2"
		
	}
	
	

ScrollView(showsIndicators: false){
						LazyVGrid(columns: gridLayout) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetails(animal: animal)) {
									AnimalGridView(animal: animal)
								}
							}
						}
					}


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
	
	

```

## 
- Abaixo um exemplo como iniciar videos locais 

```swift
//criei uma extensão 

import Foundation
import AVKit

var player: AVPlayer?

func playVideo(forResource: String, withExtension: String) -> AVPlayer? {
	guard let url = Bundle.main.url(forResource: forResource, withExtension: withExtension) else {return nil}
	
	let avPlayer = AVPlayer(url: url)
	player = avPlayer
	player?.play()
  return player
}

//aplicando ela
VideoPlayer(player: playVideo(forResource: resource, withExtension: ".mp4"))

```

##
- Criei anotações personalizadas no mapa
- Normalmente componentes como Map e Toggle usam a ideia de bind
- Por isso o $ , neste caso o bind esta sendo a propriedade region
- Para bind ocorrer precisa da anotação @
- CoordinateRegion é para representar o país ou continente e em MapAnnotations e especifidade desta região 


```swift
	@State var region: MKCoordinateRegion = {
		let center = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
		let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
		let region =  MKCoordinateRegion(center: center, span: mapZoomLevel)
		return region
	}()
	
	var locations: [LocationsModel] = Bundle.main.decodeJsonFromBundle(forResource: "locations", withExtension: ".json") ?? []


Map(coordinateRegion: $region,annotationItems: locations) { annotations in
			MapAnnotation(coordinate: annotations.location) {
				MapAnnotationView(location: annotations)
			}
			
		}//MAP

//struct MapAnnotationView
	@State private var animation = 0
	let location: LocationsModel
	
	var body: some View {
		ZStack{
			Circle()
				.fill(Color.accentColor)
				.frame(width: 52,height: 52)
			
			Circle()
				.stroke(Color.accentColor ,lineWidth: 2)
				.frame(width: 50,height: 50)
				.scaleEffect(1 + CGFloat(animation))
				.opacity(Double(1 - Int(animation)))
			
			
			Image(location.image)
				.resizable()
				.scaledToFit()
				.frame(width: 48,height: 48,alignment: .center)
				.clipShape(
					Circle()
				)
			
		}// ZStack
		.onAppear {
			withAnimation(.easeIn(duration: 2).repeatForever()) {
				animation = 1
			}
		}
	}

```

##
- Para criar decode de um arquivo json local, podemos usar o método url é depois recuperar  o data ,por fim realizar o decoder
- Eu criei uma extensão para ficar mais conveniente esse procedimento

```swift
extension Bundle {
	
	func decodeJsonFromBundle<T: Codable>(forResource: String,withExtension: String) -> T? {
		
		guard let url = self.url(forResource: forResource, withExtension: withExtension) else {
			print("Failed get forResource")
			return  nil
			
		}
		
		if let data = try? Data(contentsOf: url) {
			
			let json = JSONDecoder()
			
			do {
				let coverImage =	 try json.decode(T.self, from: data)
				return coverImage
			}catch {
				return nil
			}
			
		}
		
		return nil
	}
	
}






```

## 
- Swift permite nos criarmos nossos  modificadores
- Caso precise de uma propriedade específica pode criar a sua. 
- Abaixo um exemplo como criar um modificado





```swift
//criando o modificador
import SwiftUI

//modifier custom ideal quando deseja uma propriedade que não esta disponivel no swifui
struct  CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		//para ficar no centro envolve com hstack e coloca spacin em volta
		HStack {
			Spacer()
			content
			Spacer()
		}
		
	}
	
}

//usando o modificador
CreditsView()
	.modifier(CenterModifier())

```




