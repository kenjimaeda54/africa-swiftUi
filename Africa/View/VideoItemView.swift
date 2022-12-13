//
//  VideoItemView.swift
//  Africa
//
//  Created by kenjimaeda on 13/12/22.
//

import SwiftUI

struct VideoItemView: View {
	//MARK: - Properties
	let video: VideoModel
	
	var body: some View {
		HStack(spacing: 16) {
			ZStack {
				Image(video.thumbnail)
					.resizable()
					.scaledToFit()
					.frame(width: 100)
					.cornerRadius(10)
				
				Image(systemName: "play.circle")
					.font(.title2)
				
			} //Zstack
			
			VStack(alignment: .leading, spacing: 10) {
				Text(video.name)
					.foregroundColor(.accentColor)
					.font(.title2)
					.fontWeight(.heavy)
				
				Text(video.headline)
					.font(.footnote)
					.multilineTextAlignment(.leading)
					.lineLimit(2)
				
				
			}// VStack
			
		}// HStack
	}
}

struct VideoItemView_Previews: PreviewProvider {
	static var previews: some View {
		VideoItemView(video: videoMock)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
