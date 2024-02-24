//
//  MainViewController+TableView.swift
//  BoxOffice
//
//  Created by termblur on 2/24/24.
//

import UIKit


extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id,
                                                       for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        cell.fill(box: self.boxOfficeList[indexPath.row])
        return cell
    }
}
