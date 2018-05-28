//
//  CollectionViewCell.swift
//  GoogleBooks
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CellIdentifier"
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    
    
    
    func configure(video: Video) {
        artistName.text = video.artistName
        titleName.text = video.trackName
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: video.artworkUrl100)
            guard let data = try? Data(contentsOf: url!) else {
                return
            }
            let imageData = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.videoImage.image = imageData
            }
        }
    }
    
    
}
