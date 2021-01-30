//
//  DKBaseHeaderData.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DifferenceKit

public struct DKBaseHeaderData: Differentiable {
    
    let id: String = UUID().uuidString
    public var title:String = "Header title"
    public var items:[DKBaseCellData] = []
    
    // MARK: - compare
    public var differenceIdentifier: String {
        return id
    }
    public func isContentEqual(to source: DKBaseHeaderData) -> Bool {
        return
            title == source.title
            
    }
    public init(title:String, items:[DKBaseCellData]) {
        self.title = title
        self.items = items
    }
}
public extension DKBaseHeaderData{
    func toDK()->DKContainer{
        return DKContainer(self, reuseID: DKBaseCHeader.reuseID)
    }
}

