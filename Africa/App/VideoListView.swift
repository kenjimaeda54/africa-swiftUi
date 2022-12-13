//
//  VideoList.swift
//  Africa
//
//  Created by kenjimaeda on 09/12/22.
//

import SwiftUI

struct VideoListView: View {
	//MARK: - Properties
	@State var videos: [VideoModel] = Bundle.main.decodeJsonFromBundle(forResource: "videos", withExtension: "json") ?? []
	
	var haptic = UIImpactFeedbackGenerator(style: .medium)
	
	var body: some View {
		NavigationStack{
			List(videos)  { video in
				NavigationLink(destination: VideoPlayerView(videoTitle: video.id, resource: video.id)) {
					VideoItemView(video: video)
						.padding(.vertical,8)
					
				}
			}//List
			.navigationTitle("Videos")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItem( placement: .navigationBarTrailing,content: {
					Button {
						videos.shuffle()
						haptic.impactOccurred()
					} label: {
						Image(systemName: "arrow.2.squarepath")
							.padding(.horizontal,10)
					}
					
				})
			}
		} //Navigation
		
	}
}

struct VideoList_Previews: PreviewProvider {
	static var previews: some View {
		VideoListView()
			.previewLayout(.sizeThatFits)
	}
}
