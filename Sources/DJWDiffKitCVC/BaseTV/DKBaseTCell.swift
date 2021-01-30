//
//  DKBaseTCell.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DJWBaseVC
import DJWUIBuilder
import DJWUIExtensions

public class DKBaseTCell: BaseTVCell, DKCellOrSectionP {

    
    //id
    public class var reuseID: String {return "DKBaseTCell"}
    
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
    
    // MARK: - UI
    lazy var label: UILabel = UILabelBuilder(kind: .mBold, text: "Title")
        .textColor(with: .white)
        //.align(.center)
        .numberOf(lines: 3)
//        .bgColor(Styler.dark2.change(.alpha, to: 0.5))
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
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
