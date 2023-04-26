//
//  Extensions.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import UIKit
    
func convertURLtoImageAndSaveData(urlString: String, podcast: Podcast, completionHandler: @escaping (UIImage) -> ()) {
    guard let url = URL(string: urlString) else { return }
    DispatchQueue.global().async {
        let data = try? Data(contentsOf: url)
        podcast.imageData = data
        completionHandler(UIImage(data: data!) ?? UIImage())
    }
}
