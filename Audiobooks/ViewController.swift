//
//  ViewController.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookListTableView: UITableView!
    var podcastItems: [Podcast]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookListTableView.reloadData()
    }
    
    func setupData() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Podcasts"
        fetchData()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcastItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "audioBookCell") as! AudioBookCell
        cell.setupCell(podcast: podcastItems?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        detailsVC.currentPodcast = podcastItems?[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension ViewController {
    func fetchData() {
        WebService.shared.callGetResquest(urlString: "https://listen-api-test.listennotes.com/api/v2/best_podcasts?genre_id=93&page=4&region=us&sort=listen_score&safe_mode=0") { isSuccess, podcasts in
            
            if isSuccess {
                DispatchQueue.main.async { [self] in
                    podcastItems = podcasts
                    bookListTableView.reloadData()
                }
            }
            
        }
    }
}


