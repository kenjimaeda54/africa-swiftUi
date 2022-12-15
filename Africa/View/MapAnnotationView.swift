//
//  MapAnnotationView.swift
//  Africa
//
//  Created by kenjimaeda on 14/12/22.
//

import SwiftUI

struct MapAnnotationView: View {
	//MARK: - Properties
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
}

struct MapAnnotationView_Previews: PreviewProvider {
	static var previews: some View {
		MapAnnotationView(location: locationMock)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
