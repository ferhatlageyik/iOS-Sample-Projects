//
//  RecentPhotosViewController.swift
//  Flickr Client App
//
//  Created by Ferhat Geyik on 11.06.2022.
//

import UIKit

class RecentPhotosViewController: UITableViewController, UISearchResultsUpdating {
  

    //MARK: - Properties
    
    private var response: PhotoResponse?{
        didSet {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    private var selectedPhoto: Photo?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupSearchController()
        fetchRecentPhotos()
        
    }
    
    
    //MARK: - UITableView DataSource & Delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        response?.photos?.photo?.count ?? .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let photo = response?.photos?.photo?[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "recentPhotoCell", for: indexPath) as! RecentPhotoTableViewCell
        cell.ownerImageView.backgroundColor = .darkGray
        cell.ownerNameLabel.text = photo?.ownername
        
        
        NetworkManager.shared.fetchImage(with: photo?.bodyIconUrl) { data in
        cell.ownerImageView.image = UIImage(data: data)
        }
        
        NetworkManager.shared.fetchImage(with: photo?.urlN) { data in
        cell.photoImageView.image = UIImage(data: data)
        }
        
        cell.titleLabel.text = photo?.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPhoto = response?.photos?.photo?[indexPath.row]
        performSegue(withIdentifier: "goToPhotoDetail", sender: nil)
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PhotoDetailViewController {
            viewController.photo = selectedPhoto
        }


    }
    
    //MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
            
            guard let text = searchController.searchBar.text else { return }
            
        if text.count > 2 {
            searchPhotos(text: text)
        }
          
        
    }
    
    //MARK: - Functions
    
    private func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }
    
    private func fetchRecentPhotos() {
        print("step 1")
        guard let url = URL(string:"https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=b1cce0c9fa70c7a8c4be829cb6214da1&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_c,url_l,url_o") else { return }
        print("step 2")
        let request = URLRequest(url: url)
        print("step 3")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                print("step 4")
                return
            }
            print("step 5")
            
            if let data = data, let response = try? JSONDecoder().decode(PhotoResponse.self, from: data) {
                self.response = response
                print("düştü")
            }
            print("step 7")
 
        }.resume()
    }
    
    private func searchPhotos(text: String) {
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=b1cce0c9fa70c7a8c4be829cb6214da1&text=\(text)&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else { return }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            
            if let data = data, let response = try? JSONDecoder().decode(PhotoResponse.self, from: data) {
                self.response = response
            }
 
        }.resume()
    }
}
