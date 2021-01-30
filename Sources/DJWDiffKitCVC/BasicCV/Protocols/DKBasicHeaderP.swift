//
//  DKBasicHeaderP.swift
//  
//
//  Created by dejaWorks on 29/01/2021.
//




import UIKit

// MARK: - Diff Section data protocol
public protocol DKBasicHeaderP {
    
    static var reuseID:String {get}
    
    /// Base component which holds section data.
    var headerData: DKBasicHeaderData?{get set}
    
    /// This is for button action or such which is happening in the cell
    var dkBasicHeaderDelegate:DKBasicHeaderDelegate?{get set}
}

// MARK: - Delegate
public protocol DKBasicHeaderDelegate:class {
    func action(header:DKBasicCHeader,
                senderUI:UIView,
                senderType:Any?,
                event:UIControl.Event)
}
