//
//  DKBasicHeaderData.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DifferenceKit

public struct DKBasicHeaderData: Differentiable {
    
    let id: String = UUID().uuidString
    
    ///static var reuseID:String {get}
    
    
    public var image:UIImage?
    public var title:String = "Cell title"
    //public var desc:String = "Cell description"
    public var button:UIButton?
    
    // MARK: - compare
    public var differenceIdentifier: String {
        return id
    }
    public func isContentEqual(to source: DKBasicHeaderData) -> Bool {
        return
            title == source.title
    }
    public init(title:String, image:UIImage? = nil) {
        self.title = title
        self.image = image
    }
}
