//
//  File.swift
//  
//
//  Created by Adan on 26/06/21.
//

import Foundation

public protocol CellIdentifiable {
    static var identifier : String {get}
}

public extension CellIdentifiable where Self: UICollectionViewCell{
    static func registerCellOn(collectionView : UICollectionView){
        collectionView.register(Self.self, forCellWithReuseIdentifier: identifier)
    }
}

public extension CellIdentifiable where Self: UITableViewCell{
    static func registerCellOn(tableView : UITableView){
        tableView.register(Self.self, forCellReuseIdentifier: identifier)
    }
}
