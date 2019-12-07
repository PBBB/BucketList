//
//  MKPointAnnotation-Codable.swift
//  BucketList
//
//  Created by Issac Penn on 2019/12/7.
//  Copyright © 2019 PBB. All rights reserved.
//

import MapKit

class CodableMKPointAnnotation: MKPointAnnotation, Codable {
    
    enum CodingKeys: CodingKey {
        case title, subtitle, latitude, longtitude
    }
    
    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longtitude = try container.decode(CLLocationDegrees.self, forKey: .longtitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longtitude)
    }
}
