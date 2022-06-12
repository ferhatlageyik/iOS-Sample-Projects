//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by Ferhat Geyik on 11.06.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var photo: Photo?
    
    //MARK: - UI ELements
    
    @IBOutlet weak var imageViev: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Detail"
        imageViev.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = photo?.description?.content
        ownerNameLabel.text = photo?.ownername
        
       
        NetworkManager.shared.fetchImage(with: photo?.bodyIconUrl) { data in
            self.ownerImageView.image = UIImage(data: data)
            self.ownerImageView.layer.cornerRadius = 24.0
        }

        
        NetworkManager.shared.fetchImage(with: photo?.urlM) { data in
            self.imageViev.image = UIImage(data: data)
        }
        title = photo?.title
    }
    
    
}
