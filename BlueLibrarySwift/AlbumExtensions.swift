//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by YourtionGuo on 10/21/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

extension Album {
    func ae_tableRepresentation() -> (titles:[String], values:[String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}
