//
//  VideoViewModel.swift
//  GoogleBooks
//
//  Created by Admin on 5/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit



class VideoViewModel {
    
    var myVideos = [Video]()
    var myFilteredVideos = [Video]()

    
    func getSearchResults() {
        AlbumService.getMusicVideos() { [unowned self] videos in
            self.myVideos = videos
            NotificationCenter.default.post(name: NSNotification.Name("test"), object: nil)
        }
    }
}


