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
            coverUrl: "http://img3.douban.com/mpic/s1497881.jpg",
            year: "1992")
        
        let album2 = Album(title: "It's My Life",
            artist: "No Doubt",
            genre: "Pop",
            coverUrl: "http://img3.doubanio.com/mpic/s3880529.jpg",
            year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
            artist: "Sting",
            genre: "Pop",
            coverUrl: "http://img3.doubanio.com/mpic/s3708339.jpg",
            year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
            artist: "U2",
            genre: "Pop",
            coverUrl: "http://img3.douban.com/mpic/s1882422.jpg",
            year: "2000")
        
        let album5 = Album(title: "American Pie",
            artist: "Madonna",
            genre: "Pop",
            coverUrl: "http://img3.douban.com/mpic/s3105351.jpg",
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
