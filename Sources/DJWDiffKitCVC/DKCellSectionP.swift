//
//  DKCellSectionP.swift
//  
//
//  Created by dejaWorks on 21/09/2020.
//

import UIKit

// MARK: - Diff Cell + Section common data protocol
public protocol DKCellOrSectionP {
    
    static var reuseID:String {get}
    
    /// Base component which holds cell/section data.
    /// This must be casted to expected data type
    var base:Any?{get set}
    
    /// This is for button action or such which is happening in the cell
    var dkCellOrSectionDelegate:DKCellOrSectionDelegate?{get set}
}


public protocol DKCellOrSectionDelegate:class {
    func action(cellOrSection:DKCellOrSectionP,
                senderUI:UIView,
                senderType:Any?,
                event:UIControl.Event)
}
