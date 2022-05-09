//
//  ViewController.swift
//  Music App
//
//  Created by Ferhat Geyik on 8.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    //MARK: - UI Elements
    
    @IBOutlet var table: UITableView!
    
    
    //MARK: - Properties
    
    var songs: [Song] = [Song]()
    
    //MARK: - Life Cycle


    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        songs = Song.fetchSongs()
    }
    
    //MARK: - TableView Delegate and Datasource
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        cell.update(with: song)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else { return }
        
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    
    }
    
}


