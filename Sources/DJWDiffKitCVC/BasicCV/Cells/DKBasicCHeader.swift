//
//  DKBasicCHeader.swift
//  
//
//  Created by dejaWorks on 22/09/2020.
//

import UIKit
import DJWBaseVC
import DJWUIBuilder
import DJWUIExtensions



public class DKBasicCHeader: BaseCVHeader, DKBasicHeaderP{
    

    // MARK: - id
    public class var reuseID: String {return "DKBasicCHeader"}
    
    // MARK: - in
    public var headerData: DKBasicHeaderData? {
        didSet{
            label.text = headerData?.title
        }
    }
    
    // MARK: - out
    public var dkBasicHeaderDelegate: DKBasicHeaderDelegate?
    
    
    // MARK: - status
    
    // MARK: - UI
    lazy var label: UILabel = UILabelBuilder(kind: .lBold, text: "-").buildAndAdd(on: self)
    
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
