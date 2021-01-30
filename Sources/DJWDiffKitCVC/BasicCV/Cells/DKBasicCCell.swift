//
//  DKBasicCell.swift
//  
//
//  Created by dejaWorks on 15/10/2020.
//

import UIKit
import DJWBaseVC
import DJWUIBuilder
import DJWUIExtensions



public class DKBasicCCell: BaseCVCell, DKBasicCellP {
    
    
    // MARK: - id
    public class var reuseID: String {return "DKBasicCell"}
    
    // MARK: - in
    public var cellData: DKBasicCellData? {
        didSet{
            
            titleV.text = cellData?.title
            descV.text = cellData?.desc
            txt1V.text = cellData?.txt1
            
            if cellData?.isProgressing ?? false{
                startProgress()
            }else{
                stopProgress()
            }
        }
    }
    
    // MARK: - out
    public var dkBasicCellDelegate: DKBasicCellDelegate?
    
    // MARK: - status
    public override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = UIColor.black.change(.alpha, to: 0.3)
            }else{
                backgroundColor = UIColor.white.change(.alpha, to: 0.1)
            }
        }
    }
    // MARK: - UI
    lazy var titleV: UILabel = UILabelBuilder(kind: .xlBold, text: "Title")
        .textColor(with: .white)
        .numberOf(lines: 3)
        .align(.center)
        //.bgColor(UIColor.FlatColor.Violet.BlueGem)
        .buildAndAdd(on: self)
    
    lazy var descV: UILabel = UILabelBuilder(kind: .xlRegular, text: "Description")
        .textColor(with: .white)
        .align(.center)
        .numberOf(lines: 3)
        //.bgColor(UIColor.FlatColor.Violet.Wisteria)
        .buildAndAdd(on: self)
    
    lazy var txt1V: UILabel = UILabelBuilder(kind: .xxlBold, text: "Extra text 1")
        .textColor(with: .white)
        .align(.center)
        .numberOf(lines: 3)
        //.bgColor(UIColor.FlatColor.Violet.Wisteria)
        .buildAndAdd(on: self)
    
    lazy var imageV: UIImageView = UIImageViewBuilder()
        .bgColor(UIColor.FlatColor.Yellow.Turbo)
        .round(5)
        .buildAndAdd(on: self)
    
    lazy var button: UIButton = UIButtonBuilder(title: "XX")
        .textColor(with: .white)
        .bgColor(UIColor.FlatColor.Green.MountainMeadow)
        .round(5)
        .buildAndAdd(on: self)
    
    
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    
    // MARK: - init
    public override func setupUI(){
        
        backgroundColor = UIColor.white.change(.alpha, to: 0.1)
        layer.cornerRadius = 6
        
    }
    public func startProgress(){
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        contentView.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(60)
        }
    }
    public func stopProgress(){
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
    public override func setConstraints() {
        titleV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.top.trailing.equalToSuperview().inset(16)
        }
        descV.snp.makeConstraints { make in
            make.top.equalTo(titleV.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        txt1V.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
