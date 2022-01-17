//
//  UITableView+Extensions.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 17/01/22.
//

import Foundation
import UIKit

extension UITableView {

    func dequeCell<T: UITableViewCell>(_ : T.Type, _ indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }

func register<T: UITableViewCell>(_ : T.Type) {
    let identifier = String(describing: T.self)
    print("identifier", identifier)
    register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
}
    
    

}
