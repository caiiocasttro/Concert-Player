//
//  ViewController.swift
//  Concert-Player
//
//  Created by Caio Chaves on 19.07.23.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    //MARK: Proprieties
    private var videos: [String] = ["Beyonce", "Rihanna", "Billie", "DuaLipa", "Lil-nas-x"]
    
    private var videoLabels: [String] = ["Be Alive (94th Academy Awards Performance)",
                                         "Rihanna Love On the Brain | Live at Global Citizen Festival 2016",
    "Billie Eilish - idontwannabeyouanymore | A COLORS SHOW",
    "Dua Lipa - Levitating ft. DaBaby / Don't Start Now (Live at the GRAMMYs 2021)",
    "Lil Nas X - DEAD RIGHT NOW/MONTERO/INDUSTRY BABY (64th GRAMMY Awards Performance)"]
    
    private var videoTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
        return tableView
    }()

//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        videoTableView.delegate = self
        videoTableView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        videoTableView.frame = view.bounds
    }

    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        self.title = "Favorite Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        videoTableView.separatorStyle = .none
        
        //Adding subview
        view.addSubview(videoTableView)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        cell.videoPicture = videos[indexPath.row]
        cell.videoTitle = videoLabels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = Bundle.main.url(forResource: videos[indexPath.row], withExtension: "mp4")
        
        guard let url = url else { return }
        let avPlayer = AVPlayer(url: url)
        let VideoController = AVPlayerViewController()
        VideoController.player = avPlayer
        present(VideoController, animated: true) {
            avPlayer.play()
        }
    }
    
}

