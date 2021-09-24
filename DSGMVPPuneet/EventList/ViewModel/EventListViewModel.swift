//
//  EventListViewModel.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import Foundation

class EventListViewModel : NSObject {
    
    private var service : NetworkService!
    
    var model: EventListModel?
    var currentPage = 1
    var eventList = [Event]()
    var didGetData: (() -> ())?
    var loadMoreData: Bool = true
    
    override init() {
        super.init()
        self.service =  NetworkService()
        //callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData(text: String) {
        if self.loadMoreData {
            self.service.fetchEventList(searchText: text, pageNumber: String(currentPage)) { (eventList) in
                if eventList.events?.count ?? 0 > 0 {
                    self.model = eventList
                    self.eventList.append(contentsOf: eventList.events ?? [])
                    self.didGetData?()
                    self.currentPage = (eventList.meta?.page ?? 0) + 1
                } else {
                    self.loadMoreData = false
                }
            }
        }
       
    }
}
