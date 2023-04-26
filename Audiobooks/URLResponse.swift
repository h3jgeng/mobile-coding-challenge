//
//  URLResponse.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import Foundation

struct URLResponse: Decodable {
    var podcastList: [Podcast]?
    
    enum CodingKeys: CodingKey {
        case podcasts
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.podcasts) {
            podcastList = try container.decode([Podcast].self, forKey: .podcasts)
        }
    }
}
