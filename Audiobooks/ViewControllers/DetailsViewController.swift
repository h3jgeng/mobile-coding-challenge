//
//  DetailsViewController.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var descTextView: UITextView!
    
    var currentPodcast: Podcast?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set back btn
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    @IBAction func favouriteBtnPressed(_ sender: Any) {
        // button logic
        if currentPodcast?.isFavourited ?? false {
            favouriteBtn.titleLabel?.text = "Favourite"
            favouriteBtn.setTitle("Favourite", for: .normal)
        }else{
            favouriteBtn.setTitle("Favourited", for: .normal)
        }
        currentPodcast?.isFavourited = !(currentPodcast?.isFavourited ?? false)
    }
}


extension DetailsViewController {
    func setupUI() {
        titleLabel.text = currentPodcast?.title
        authorLabel.text = currentPodcast?.publisher
        authorLabel.font = UIFont.italicSystemFont(ofSize: 13)
        descTextView.text = currentPodcast?.description
        imageView.image = UIImage(data: currentPodcast?.imageData ?? Data())
        favouriteBtn.setTitle(currentPodcast?.isFavourited ?? false ? "Favourited" : "Favourite", for: .normal)
        favouriteBtn.layer.cornerRadius = 8
    }
}
