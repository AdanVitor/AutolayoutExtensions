//
//  File.swift
//  
//
//  Created by Adan on 26/06/21.
//

import Foundation
import UIKit

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
//https://stackoverflow.com/questions/33705371/how-to-scroll-to-the-exact-end-of-the-uitableview
public extension UITableView {

    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath) {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
        
    }

    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: false)
           }
        }
        
    }

    func hasRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}
