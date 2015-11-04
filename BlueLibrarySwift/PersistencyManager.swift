//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by YourtionGuo on 10/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {

    private var albums = [Album]()
    
    override init() {
        //Dummy list of albums
        let album1 = Album(title: "Best of Bowie",
            artist: "David Bowie",
            genre: "Pop",
            coverUrl: "http://a4.mzstatic.com/us/r30/Music6/v4/e3/e5/22/e3e522f1-7b50-dc6b-d263-60f35d5e14f7/cover170x170.jpeg",
            year: "1992")
        
        let album2 = Album(title: "It's My Life",
            artist: "No Doubt",
            genre: "Pop",
            coverUrl: "http://a1.mzstatic.com/us/r30/Music/v4/17/dd/6f/17dd6f79-f2f9-74df-162e-efbad589437b/cover170x170.jpeg",
            year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
            artist: "Sting",
            genre: "Pop",
            coverUrl: "http://a2.mzstatic.com/us/r30/Music/v4/30/68/d3/3068d388-ebf3-c996-9e79-518c26f49280/cover170x170.jpeg",
            year: "1999")
        
        let album4 = Album(title: "Pop",
            artist: "U2",
            genre: "Pop",
            coverUrl: "http://a1.mzstatic.com/us/r30/Music/v4/73/4e/d4/734ed41d-baef-3383-e8bd-857f447281da/cover170x170.jpeg",
            year: "2000")
        
        let album5 = Album(title: "Music",
            artist: "Madonna",
            genre: "Pop",
            coverUrl: "http://a2.mzstatic.com/eu/r30/Music4/v4/de/19/09/de1909fc-19de-2d0e-6bb6-671f51ad1988/cover170x170.jpeg",
            year: "2000")
        
        albums = [album1, album2, album3, album4, album5]
    }
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(album: Album, index: Int) {
        if (albums.count >= index) {
            albums.insert(album, atIndex: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbumAtIndex(index: Int) {
        albums.removeAtIndex(index)
    }
    
    func saveImage(image: UIImage, filename: String) {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        let data = UIImagePNGRepresentation(image)
        data!.writeToFile(path, atomically: true)
    }
    
    func getImage(filename: String) -> UIImage? {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        do {
            let data =  try NSData(contentsOfFile: path, options: .UncachedRead)
            return UIImage(data: data)
        } catch _ {
            return nil
        }
    }
}
