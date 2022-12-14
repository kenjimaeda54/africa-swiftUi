//
//  UrlBundle.swift
//  Africa
//
//  Created by kenjimaeda on 10/12/22.
//

import Foundation

extension Bundle {
	
	func decodeJsonFromBundle<T: Codable>(forResource: String,withExtension: String) -> T? {
		
		guard let url = self.url(forResource: forResource, withExtension: withExtension) else {
			print("Failed get forResource")
			return  nil
			
		}
		
		if let data = try? Data(contentsOf: url) {
			
			let json = JSONDecoder()
			
			do {
				let coverImage =	 try json.decode(T.self, from: data)
				return coverImage
			}catch {
				return nil
			}
			
		}
		
		return nil
	}
	
}
