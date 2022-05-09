//
//  SongTableViewCell.swift
//  Music App
//
//  Created by Ferhat Geyik on 9.05.2022.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    //MARK: - UI Elements
    
    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var songName: UILabel!
    @IBOutlet var albumName: UILabel!
    
    //MARK: - Functions
    
    func update(with song: Song){
        
        albumImage.image = UIImage(named: song.imageName)
        songName.text = song.name
        albumName.text = song.albumName
    }
    
    
    

}
