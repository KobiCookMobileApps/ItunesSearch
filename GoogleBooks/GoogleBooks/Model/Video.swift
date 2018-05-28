//
//  Book.swift
//  GoogleBooks
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit


struct VideoResults: Decodable{
    
    let results: [Video]
    
}

struct Video: Decodable {
    let trackName: String
    let artworkUrl100: String
    let artistName: String
    
    
}
