//
//  VideoTableViewCell.swift
//  Concert-Player
//
//  Created by Caio Chaves on 19.07.23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var videoPicture: String? {
        didSet {
            guard let picture = videoPicture else { return }
            
            videoPic.image = UIImage(named: picture)
        }
    }
    
    var videoTitle: String? {
        didSet {
            guard let title = videoTitle else { return }
            
            videoLabel.text = title
        }
    }
    
   public var identifier = "VideoTableViewCell"
    
    private var shadow: UIView = {
        let shadow = UIView()
        shadow.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.5
        shadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        return shadow
    }()
    
    private var videoPic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Beyonce")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private var videoLabel: UILabel = {
        let label = UILabel()
        label.text = "Beyonce"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private var playImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "play.rectangle.fill")
        image.tintColor = UIColor.white
        return image
    }()
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super .init(style: style, reuseIdentifier: reuseIdentifier)
            configureLayout()

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        //Adding subview
        addSubview(shadow)
        shadow.addSubview(videoPic)
        videoPic.addSubview(playImage)
        videoPic.addSubview(videoLabel)
        
        shadow.translatesAutoresizingMaskIntoConstraints = false
        videoPic.translatesAutoresizingMaskIntoConstraints = false
        playImage.translatesAutoresizingMaskIntoConstraints = false
        videoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            //Shadow
            shadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            shadow.heightAnchor.constraint(equalToConstant: 200),
            
            //Video Pic
            videoPic.topAnchor.constraint(equalTo: shadow.topAnchor),
            videoPic.leadingAnchor.constraint(equalTo: shadow.leadingAnchor),
            videoPic.trailingAnchor.constraint(equalTo: shadow.trailingAnchor),
            videoPic.bottomAnchor.constraint(equalTo: shadow.bottomAnchor),
            
            //Play button
            playImage.centerYAnchor.constraint(equalTo: videoPic.centerYAnchor),
            playImage.centerXAnchor.constraint(equalTo: videoPic.centerXAnchor),
            playImage.widthAnchor.constraint(equalToConstant: 80),
            playImage.heightAnchor.constraint(equalToConstant: 50),
            
            //Video label
            videoLabel.leadingAnchor.constraint(equalTo: videoPic.leadingAnchor, constant: 10),
            videoLabel.trailingAnchor.constraint(equalTo: videoPic.trailingAnchor, constant: -30),
            videoLabel.bottomAnchor.constraint(equalTo: videoPic.bottomAnchor, constant: -10)
            
        
        ])
    }
}
