//
//  ItunesAPI.swift
//  GoogleBooks
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation


struct ItunesAPI {
    
    static let base = "https://itunes.apple.com/search?term="
    static let musicVideo = "&entity=musicVideo"
    static let search = "kanye+west"
    
    
    static let authURL = base + search + musicVideo
    
}
