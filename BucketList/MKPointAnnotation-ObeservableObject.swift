//
//  MKPointAnnotation-ObeservableObject.swift
//  BucketList
//
//  Created by Issac Penn on 2019/12/7.
//  Copyright © 2019 PBB. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
}
