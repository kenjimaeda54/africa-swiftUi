//
//  CreditsView.swift
//  Africa
//
//  Created by kenjimaeda on 16/12/22.
//

import SwiftUI

struct CreditsView: View {
	var body: some View {
		VStack {
			Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 128,height: 128)
			
			Text("""
	Copyright @ Ricardo Maeda
	All right reserved
Better Apps ♡ Less Code
""")
			.multilineTextAlignment(.center)
			.font(.footnote)
			
		}//Vstack
		.padding(.vertical,8)
	}
}

struct CreditsView_Previews: PreviewProvider {
	static var previews: some View {
		CreditsView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
