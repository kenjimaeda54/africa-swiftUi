//
//  ContentModifiers.swift
//  Africa
//
//  Created by kenjimaeda on 16/12/22.
//

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
