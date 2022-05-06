//
//  NoteTableViewCell.swift
//  Notes App
//
//  Created by Ferhat Geyik on 4.05.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

  // MARK: - UI Elements

    @IBOutlet var titleLabel: UILabel!
    
    func update(with note: Note){
        titleLabel.text = note.title
        
    }

}
