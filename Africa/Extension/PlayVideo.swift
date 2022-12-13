//
//  PlayVideo.swift
//  Africa
//
//  Created by kenjimaeda on 13/12/22.
//

import Foundation
import AVKit

var player: AVPlayer?


func playVideo(forResource: String,extesion: String) -> AVPlayer? {
	guard let url = Bundle.main.url(forResource: forResource, withExtension: extesion) else {return nil}
	let avPlayer = AVPlayer(url: url)
	player = avPlayer
	player?.play()
	return player
}
