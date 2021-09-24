//
//  Constant.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import Foundation
import UIKit


struct ClientKeys {
    static let clientId = "MjM1MDg2Nzd8MTYzMjM4MzQ0NS42Mzc3MjAz"
}

struct Colors {
    static let searchBarBackgroundColor = UIColor(red: 1.0/255.0, green: 8.0/255.0, blue:22.0/255.0, alpha: 1.0)
}

struct APIUrl {
    static let eventList = "https://api.seatgeek.com/2/events"

}

struct APIKeys {
    static let clientIdKey = "client_id"
    static let searchKey = "q"
    static let page = "page"
}

enum StoryboardNames: String {
    case main = "Main"
}

enum StoryboardViewControllerIdentifier: String {
    case eventsDetailViewController = "EventsDetailViewController"
}
