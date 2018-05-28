//
//  ViewController.swift
//  GoogleBooks
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let viewModel = VideoViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchBar()
        
        viewModel.getSearchResults()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatecollectionView(notification:)), name: NSNotification.Name(rawValue: "test"), object: nil)
        
    }

    
    @objc func updatecollectionView(notification: NSNotification) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    
    func createSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Artist Videos"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }



    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    
    private func filterContentForSearchText(_ searchText: String) {
        viewModel.myFilteredVideos = viewModel.myVideos.filter({ (video: Video) -> Bool in
            return video.trackName.lowercased().contains(searchText.lowercased())
        })

        collectionView.reloadData()
    }
    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering() {
            return viewModel.myFilteredVideos.count
        }
        return viewModel.myVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let video: Video!
        
        if isFiltering() {
            video = viewModel.myFilteredVideos[indexPath.row]
        } else {
            video = viewModel.myVideos[indexPath.row]
        }
        
        cell.configure(video: video)
        
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}



extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}


