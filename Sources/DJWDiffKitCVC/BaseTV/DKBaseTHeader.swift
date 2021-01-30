//
//  DKBaseTHeader.swift
//  
//
//  Created by dejaWorks on 22/09/2020.
//

import UIKit
import DJWBaseVC
import DJWUIBuilder
import DJWUIExtensions

public class DKBaseTHeader: BaseTVHeader, DKCellOrSectionP{
    
    // MARK: - id
    public class var reuseID: String {return "DKBaseTHeader"}
    
    // MARK: - in
    public var base: Any? {
        didSet{
            if let data = (base as? DKBaseHeaderData) {
                label.text = data.title
            }
        }
    }
    
    // MARK: -  out
    public var dkCellOrSectionDelegate: DKCellOrSectionDelegate?
    
    
    
    // MARK: - UI
    lazy var label: UILabel = UILabelBuilder(kind: .mRegular, text: "-").buildAndAdd(on: self)
    
    // MARK: - init
    public override func setupUI(){
        addSubview(label)
        label.text = "Undefined"
        label.textColor = .white
        label.layer.cornerRadius = 2
        
    }
    public override func setConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
}
