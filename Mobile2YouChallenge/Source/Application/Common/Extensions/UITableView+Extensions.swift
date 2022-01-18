//
//  UITableView+Extensions.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 17/01/22.
//

import Foundation
import UIKit


extension NSObject {
  static var uniqueIdentifier: String { String(describing: self) }
}

extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) where T: UITableViewCell {
      register(type, forCellReuseIdentifier: type.uniqueIdentifier)

  }

    func dequeue<T: UITableViewCell>(_ type: T.Type, at indexPath: IndexPath) -> T{
    guard let cell = dequeueReusableCell(withIdentifier: type.uniqueIdentifier, for: indexPath) as? T else {
      fatalError("No cell of type \(type.uniqueIdentifier) registered for this tableView!")
    }
    return cell
  }
}
