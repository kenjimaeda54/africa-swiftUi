//
//  MotionEffectView.swift
//  Africa
//
//  Created by kenjimaeda on 15/12/22.
//

import SwiftUI

struct MotionEffectView: View {
	//MARK: - Properties
	//vai comecar com 12 e ira aleatorio ate 16
	@State private var randomCircle = Int.random(in: 12...16)
	@State private var isAnimation = false
	
	func randomSize() -> CGFloat {
		return CGFloat.random(in: 3...30)
	}
	
	func randomPosition(max: CGFloat) -> CGFloat {
		return CGFloat.random(in: 0...max)
	}
	
	func randomScaleEffect() -> CGFloat {
		return CGFloat(Double.random(in: 0.1...20))
	}
	
	func randomSped() -> Double  {
		return Double.random(in: 0.025...1.0)
	}
	
	func randomDelay() -> Double {
		return Double.random(in: 0...2)
	}
	
	var body: some View {
		//com geometry consigo pegar o tamanho do dispositivo
		GeometryReader { geometry in
			
			ForEach(0...randomCircle,id: \.self) { item in
				ZStack {
					Circle()
						.foregroundColor(.gray)
						.opacity(0.15)
						.frame(width: randomSize(),height: randomSize(),alignment: .center)
						.scaleEffect(isAnimation ? randomScaleEffect() : 1)
						.position(
							x: randomPosition(max: geometry.size.width),
							y: randomPosition(max: geometry.size.height)
						)
						.animation(
							Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
								.repeatForever()
								.delay(randomSped())
								.speed(randomDelay())
							, value: isAnimation)
				} //ZStack
				.onAppear {
					isAnimation = true
				}
			}// Loop
			
		}//Geometry
		//drawingGroup e ideal para performace
		.drawingGroup()
	}
}

struct MotionEffectView_Previews: PreviewProvider {
	static var previews: some View {
		MotionEffectView()
	}
}
