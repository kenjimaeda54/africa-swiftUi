//
//  VideoPlayerView.swift
//  Africa
//
//  Created by kenjimaeda on 13/12/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	//MARK: - Properties
	let videoTitle: String
	let resource:String
	
	var body: some View {
		VideoPlayer(player: playVideo(forResource:  resource, extesion: ".mp4"))
			.overlay(alignment: .topLeading ,content: {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32,height: 32)
				
				
			})
			.padding(.vertical,6)
			.padding(.horizontal,10)
			.navigationTitle(videoTitle.uppercased())
			.navigationBarTitleDisplayMode(.inline)
	}
	
}

struct VideoPlayerView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			VideoPlayerView(videoTitle: "Cheetash", resource: "cheetah")
		}
	}
}
