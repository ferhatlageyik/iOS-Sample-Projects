//
//  Photo.swift
//  Flickr Client App
//
//  Created by Ferhat Geyik on 11.06.2022.
//

// MARK: - Welcome


import Foundation

struct Photo: Codable {
       let id, owner, secret, server: String?
       let farm: Int?
       let title: String?
       let ispublic, isfriend, isfamily: Int
       let license: String?
       let description: Description?
       let dateupload, lastupdate, datetaken: String?
       let datetakengranularity: Int?
       let datetakenunknown, ownername, iconserver: String?
       let iconfarm: Int?
       let views, tags, machineTags: String?
       let urlM: URL?
       let heightM, widthM: Int?
       let urlN: URL?
       let heightN, widthN: Int?
       let urlZ: URL?
       let heightZ, widthZ: Int?


       enum CodingKeys: String, CodingKey {
           case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, license
           case description = "description"
           case dateupload, lastupdate, datetaken, datetakengranularity, datetakenunknown, ownername, iconserver, iconfarm, views, tags
           case machineTags = "machine_tags"
           case urlM = "url_m"
           case heightM = "height_m"
           case widthM = "width_m"
           case urlN = "url_n"
           case heightN = "height_n"
           case widthN = "width_n"
           case urlZ = "url_z"
           case heightZ = "height_z"
           case widthZ = "width_z"

    }
}

extension Photo {
    var bodyIconUrl: URL? {
        if let iconServer = iconserver,
           let iconFarm = iconfarm,
           let nsID = owner,
           NSString(string: iconServer).intValue > 0 {
                return URL(string: "https://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsID).jpg")
            } else {
                return URL(string: "https://www.flickr.com/images/buddyicon.gif")
            }
        }
}


 //MARK: - Description
struct Description: Codable {
    let content: String?

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
