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

    var rooms = [Room]()
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = self.collectionView.frame.height / 8
        let width = self.collectionView.frame.width / 5
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
        
        
        fillRooms()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func fillRooms(){
        
        
        let sampleRooms = [
            Room(cloudImage: UIImage(named: "Blue")!, room:"Lok 14a"),
            Room(cloudImage: UIImage(named: "Blue")!, room: "Lok 14b"),
            Room(cloudImage: UIImage(named: "Blue")!, room:"Lok 15a"),
            Room(cloudImage: UIImage(named: "Blue")!, room: "Lok 15b"),
            Room(cloudImage: UIImage(named: "Blue")!, room:"Lærerværelse"),
            Room(cloudImage: UIImage(named: "Blue")!, room: "Sløjd"),
            Room(cloudImage: UIImage(named: "Blue")!, room:"Lok 20"),
            Room(cloudImage: UIImage(named: "Blue")!, room: "Musik 1"),
        ]
        rooms = sampleRooms.compactMap{$0}
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return rooms.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomRoomCollectionViewCell", for: indexPath) as! CustomRoomCollectionViewCell
        cell.imageView.image = rooms[indexPath.row].cloudImage
        cell.roomLabel.text = rooms[indexPath.row].room
        return cell
    }
    
    func collectionView(_collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath){
        print("selected \rooms[indexPath.row]")
        let vc = storyboard?.instantiateViewController(identifier: "RoomDetailedViewController") as? RoomDetailedViewController
        
        vc?.room = rooms[indexPath.row].room
        self.navigationController?.pushViewController(vc! , animated: true)
    }
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print ("indexpath: \(indexPath.row)")
        print ("roomname: \(rooms[indexPath.row].room)")
        let vc = storyboard?.instantiateViewController(identifier: "RoomDetailedViewController") as? RoomDetailedViewController
        
        vc?.room = rooms[indexPath.row].room
        self.navigationController?.pushViewController(vc! , animated: true)
        return true
    }
}


