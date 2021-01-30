//
//  DKBasicCellP.swift
//  
//
//  Created by dejaWorks on 29/01/2021.
//

import UIKit

// MARK: - Diff Cell data protocol
public protocol DKBasicCellP {
    
    static var reuseID:String {get}
    
    /// Base component which holds cell data.
    var cellData: DKBasicCellData?{get set}
    
    /// This is for button action or such which is happening in the cell
    var dkBasicCellDelegate:DKBasicCellDelegate?{get set}
}


// MARK: - Protocol
public protocol DKBasicCellDelegate:class {
    func action(cell: DKBasicCCell,
                senderUI:UIView,
                senderType:Any?,
                event:UIControl.Event)
}
