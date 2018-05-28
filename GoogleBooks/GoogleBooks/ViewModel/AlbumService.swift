//
//  AlbumService.swift
//  GoogleBooks
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire

typealias VideoHandler = ([Video]) -> Void


class AlbumService {
    
    
    
    
    class func getMusicVideos(completion: @escaping VideoHandler) {
        
        Alamofire.request(ItunesAPI.authURL).responseJSON { response in
            do {
                let videoObject = try JSONDecoder().decode(VideoResults.self, from: response.data!)
                let videos = videoObject.results
                completion(videos)
            }catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
}
