//
//  Song.swift
//  Music App
//
//  Created by Ferhat Geyik on 9.05.2022.
//

import Foundation


struct Song {
    
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
    
    //MARK: - Functions

    static func fetchSongs() -> [Song] {
       
        let songs: [Song] = [
            Song(name: "Country",
                albumName: "Philidelphia Days",
                artistName: "Rnodo",
                imageName: "Track1",
                trackName: "track1"),
            Song(name: "Havana",
                albumName: "Old Letters",
                artistName: "Camilla",
                imageName: "Track2",
                trackName: "track2"),
            Song(name: "Viva la Vida",
                albumName: "Romantism",
                artistName: "Coldplay",
                imageName: "Track3",
                trackName: "track3"),
            Song(name: "Country",
                albumName: "Drama Quenn",
                artistName: "Rnodo",
                imageName: "Track1",
                trackName: "track1"),
           Song(name: "Havana",
                albumName: "The Search",
                artistName: "Camilla",
                imageName: "Track2",
                trackName: "track2"),
           Song(name: "Viva la Vida",
                albumName: "Veni Vidi Vici",
                artistName: "Coldplay",
                imageName: "Track3",
                trackName: "track3"),
           Song(name: "Country",
                albumName: "Other Guys",
                artistName: "Rnodo",
                imageName: "Track1",
                trackName: "track1"),
           Song(name: "Havana",
                albumName: "Random Access Memory",
                artistName: "Camilla",
                imageName: "Track2",
                trackName: "track2"),
           Song(name: "Viva la Vida",
                albumName: "Music Valla",
                artistName: "Coldplay",
                imageName: "Track3",
                trackName: "track3")
        ]
        
        return songs
        
    }
    
}
