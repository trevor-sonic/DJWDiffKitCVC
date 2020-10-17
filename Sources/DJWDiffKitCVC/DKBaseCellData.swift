//
//  DKBaseCellData.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DifferenceKit

public struct DKBaseCellData: Differentiable {
    
    let id: String = UUID().uuidString
    public var title:String = "Cell title"
    
    // MARK: - compare
    public var differenceIdentifier: String {
        return id
    }
    public func isContentEqual(to source: DKBaseCellData) -> Bool {
        return
            title == source.title
    }
    public init(title:String) {
        self.title = title
    }
}
public extension DKBaseCellData{
    func toDK()->DKContainer{
        return DKContainer(self, reuseID: DKBaseCCell.reuseID)
    }
}

