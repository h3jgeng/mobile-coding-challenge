//
//  Podcast.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import Foundation

class Podcast: Codable {
    var thumbnail: String?
    var title: String?
    var publisher: String?
    var description: String?
    var isFavourited: Bool?
    var imageData: Data?
}
