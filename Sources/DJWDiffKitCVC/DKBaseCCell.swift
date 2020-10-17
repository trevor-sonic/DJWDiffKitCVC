//
//  DKBaseCCell.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DJWBaseVC
import DJWUIBuilder
import DJWUIExtensions

public class DKBaseCCell: BaseCVCell, DKCellOrSectionP {

    
    //id
    public class var reuseID: String {return "DKBaseCCell"}
    
    // in
    public var base: Any? {
        didSet{
            if let itemData = (base as? DKBaseCellData) {
                label.text = itemData.title
                
                
            }
        }
    }
    // out
    public var dkCellOrSectionDelegate: DKCellOrSectionDelegate?
    public override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = UIColor.FlatColor.Blue.Denim
            }else{
                backgroundColor = .clear
            }
        }
    }
    // MARK: - UI
    lazy var label: UILabel = UILabelBuilder(kind: .mBold, text: "Title")
        .textColor(with: .white)
        .numberOf(lines: 3)
//        .bgColor(UIColor.FlatColor.Blue.BlueWhale.change(.alpha, to: 0.5))
        .round(5)
        .buildAndAdd(on: self)

    
 
    // MARK: - init
    public override func setupUI(){

        backgroundColor = .clear
        layer.cornerRadius = 6
        
        // shadow
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 0.0
        label.layer.shadowOpacity = 0.8
        label.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.layer.masksToBounds = false
       
    }
    public override func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
    }
}
