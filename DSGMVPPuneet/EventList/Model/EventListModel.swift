//
//  EventListModel.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//


import Foundation

struct EventListModel: Codable {
    let events : [Event]?
    let meta : Meta?
    
    enum CodingKeys: String, CodingKey {
        
        case events = "events"
        case meta = "meta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decodeIfPresent([Event].self, forKey: .events)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }

}


struct Event: Codable {
    let id : Int?
    let shortName : String?
    let datetime : String?
    let venue : Venue?
    let performer : [Performer]?
    let isFavourite : Bool = false

    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case shortName = "short_title"
        case datetime = "datetime_utc"
        case venue = "venue"
        case performer = "performers"

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
        venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
        performer = try values.decodeIfPresent([Performer].self, forKey: .performer)

    }

}

struct Venue: Codable {
    
    let location : String?
    
    enum CodingKeys: String, CodingKey {
        case location = "display_location"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(String.self, forKey: .location)
    }
}

struct Performer: Codable {
    
    let image : String?
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
}

struct Meta: Codable {
    let total : Int?
    let page : Int?
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case page = "page"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
    }

}
