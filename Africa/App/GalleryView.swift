//
//  GalleryView.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct GalleryView: View {
	var body: some View {
		ScrollView {
			
		}//ScroolView
		//nil vai ser o substituido para .inifity
		.frame(width: nil,height: nil)
		.background(MotionEffectView())
	}
}

struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
