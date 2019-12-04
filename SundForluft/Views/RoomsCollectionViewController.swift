//
//  RoomsCollectionViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 10/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RoomsCollectionViewController: UICollectionViewController {
    
    var clasrooms = [AssetDTO]()
    var attDao = ATTDAO()
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attDao.getDeviceAssets(completionHandler: { (assets) in
            DispatchQueue.main.async {
                print("dataPoints: \(assets)")
                self.clasrooms = assets.compactMap{$0}
                self.collectionView.reloadData()
            }
        })
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return clasrooms.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomRoomCollectionViewCell", for: indexPath) as! CustomRoomCollectionViewCell
        cell.roomLabel.text = clasrooms[indexPath.row].name
        return cell
    }
    
    func collectionView(_collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath){
        print("selected \rooms[indexPath.row]")
        let vc = storyboard?.instantiateViewController(identifier: "RoomDetailedViewController") as? RoomDetailedViewController
        
        if let name = clasrooms[indexPath.row].name {
            vc?.room = name
            self.navigationController?.pushViewController(vc! , animated: true)
        }
        
        vc?.room = clasrooms[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(vc! , animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let vc = storyboard?.instantiateViewController(identifier: "RoomDetailedViewController") as? RoomDetailedViewController
        if let name = clasrooms[indexPath.row].name {
            vc?.room = name
        }
        if let id = clasrooms[indexPath.row].id {
            vc?.id = id
        }
      
        self.navigationController?.pushViewController(vc! , animated: true)
        return true
    }
}


