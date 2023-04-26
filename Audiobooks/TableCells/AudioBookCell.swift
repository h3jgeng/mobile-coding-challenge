//
//  AudioBookCell.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import UIKit

class AudioBookCell: UITableViewCell {
    @IBOutlet weak var podcastImage: UIImageView!
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var podcastAuthor: UILabel!
    @IBOutlet weak var favouriteTag: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(podcast: Podcast?) {
        podcastTitle.text = podcast?.title
        podcastAuthor.text = podcast?.publisher
        podcastAuthor.font = UIFont.italicSystemFont(ofSize: 13)
        favouriteTag.text = podcast?.isFavourited ?? false ? "Favourited" : ""
        // use imageData directly otherwise call helper functions
        if let imageData = podcast?.imageData {
            self.podcastImage.image = UIImage(data: imageData)
        }else{
            convertURLtoImageAndSaveData(urlString: podcast?.thumbnail ?? "", podcast: podcast ?? Podcast()) { image in
                DispatchQueue.main.async {
                    self.podcastImage.image = image
                }
            }
        }
    }

}
