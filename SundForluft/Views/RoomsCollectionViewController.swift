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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print ("indexpath: \(indexPath.row)")
        print ("roomname: \(rooms[indexPath.row].room)")
        let vc = storyboard?.instantiateViewController(identifier: "RoomDetailedViewController") as? RoomDetailedViewController
        
        
        
        vc?.room = rooms[indexPath.row].room
        self.navigationController?.pushViewController(vc! , animated: true)
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


