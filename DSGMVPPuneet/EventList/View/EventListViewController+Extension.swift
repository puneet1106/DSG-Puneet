//
//  EventListViewController+Extension.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import Foundation
import UIKit


extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventListViewModel.eventList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            EventCell.identifier) as? EventCell {
            cell.selectionStyle = .none
            cell.setUpUI(event: self.eventListViewModel.eventList[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushToEventsDetailViewController(event: self.eventListViewModel.eventList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastItem = (self.eventListViewModel.eventList.count) - 1
        if indexPath.row == lastItem {
            self.eventListViewModel.callFuncToGetEmpData(text: self.searchBar.searchTextField.text ?? "")
        }
    }
}
