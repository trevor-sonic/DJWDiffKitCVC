//
//  DKBaseCellData.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DifferenceKit

public struct DKBasicCellData: Differentiable {
    
    public var id: String = UUID().uuidString
    
    ///static var reuseID:String {get}
    
    
    public var image:UIImage?
    public var title:String?
    public var desc:String?
    public var txt1:String?
    public var button:UIButton?
    
    public var isProgressing:Bool = false
    
    // MARK: - compare
    public var differenceIdentifier: String {
        return id
    }
    public func isContentEqual(to source: DKBasicCellData) -> Bool {
        return
            title == source.title &&
            desc ==  source.desc &&
            txt1 == source.txt1 &&
            isProgressing == source.isProgressing
    }
    public init(title:String? = nil,
                desc:String? = nil,
                txt1:String? = nil,
                image:UIImage? = nil,
                id: String? = nil) {
        
        self.title = title
        self.desc = desc
        self.txt1 = txt1
        self.image = image
        if let id = id { self.id = id }
    }
}
