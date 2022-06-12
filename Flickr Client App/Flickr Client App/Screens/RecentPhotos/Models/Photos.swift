//
//  Photos.swift
//  Flickr Client App
//
//  Created by Ferhat Geyik on 11.06.2022.
//

import Foundation

struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]?
}
