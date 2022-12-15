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
	
	func randomPosition(max: CGFloat) -> CGFloat {
		return CGFloat.random(in: 0...max)
	}
	
	func randomSize() ->  CGFloat  {
		return CGFloat.random(in: 10...300)
	}
	
	func randomScale() -> CGFloat {
		return CGFloat(Double.random(in: 0.1...2.0))
	}
	
	func randomSpeed()  -> Double {
		return Double.random(in: 0.025...1.0)
	}
	
	func randomDealay() -> Double {
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
						.frame(width: randomSize(),height: randomSize())
						.scaleEffect( isAnimation ? randomScale() : 1)
						.position(
							//vai ocupar maximo do tamanho da tela
							x: randomPosition(max: geometry.size.width),
							y: randomPosition(max: geometry.size.height)
						)
						.animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
							.speed(randomSpeed())
							.delay(randomDealay())
											 , value: isAnimation)
					
						.onAppear {
							isAnimation = true
						}
					
				} // Zstack
			} // Loop
		} //Geometry
		//drawingGroup e ideal para performace
		.drawingGroup()
	}
}

struct MotionEffectView_Previews: PreviewProvider {
	static var previews: some View {
		MotionEffectView()
	}
}
