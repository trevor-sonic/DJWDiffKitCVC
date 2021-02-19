//
//  DKBaseCellData.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DifferenceKit

public enum VarName {
    case title, title2, title3
    case desc, desc2, desc3
    case icon, icon2, icon3
    case open, close, fold, unfold
    case cancel, ok, confirm
    case arrow, arrowLeft, arrowRight, arrowUp, arrowDown
    case profile, product, picture
    
    
}


public struct DKBasicCellData: Differentiable {
    
    public var id: String = UUID().uuidString
    
    ///static var reuseID:String {get}
    
    
    public var image:UIImage?
    public var title:String?
    public var desc:String?
    public var txt1:String?
    public var button:UIButton?
    
    public var isProgressing:Bool = false
    
    // MARK: - DictVars
    public var ints:[VarName:Int] = [:]
    public var doubles:[VarName:Double] = [:]
    public var strings:[VarName:String] = [:]
    public var images:[VarName:UIImage] = [:]
    public var buttons:[VarName:UIButton] = [:]
    
    
    
    
    // MARK: - compare
    public var differenceIdentifier: String {
        return id
    }
    public func isContentEqual(to source: DKBasicCellData) -> Bool {
        return
            title == source.title &&
            desc ==  source.desc &&
            txt1 == source.txt1 &&
            isProgressing == source.isProgressing &&
            
            // MARK: - DictVars
            ints == source.ints &&
            doubles == source.doubles &&
            strings == source.strings &&
            images == source.images &&
            buttons == source.buttons
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
    
    /// if uuid is not provided initial one will be used.
    public init(uuid: String? = nil) {
        if let uuid = uuid { self.id = uuid }
    }
}
