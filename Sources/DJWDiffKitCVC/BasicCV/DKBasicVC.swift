//
//  DKBasicVC.swift
//  
//
//  Created by dejaWorks on 21/09/2020.
//

import UIKit
import DJWBaseVC
import DifferenceKit

/**
 DKBasicVC is general porpuse CollectionVC which works with BasicSection and BasicCell
 */
open class DKBasicVC: BaseVC, DKBasicCellDelegate, DKBasicHeaderDelegate{
    
    
    
    public typealias Section = ArraySection<DKBasicHeaderData, DKBasicCellData>
    
    // MARK: - UI
    public lazy var collectionV:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    

    // MARK: - init
    open override func viewDidLoad() {
        super.viewDidLoad()
        register(DKBasicCCell.self, reuseID: DKBasicCCell.reuseID)
        register(DKBasicCHeader.self, reuseID: DKBasicCHeader.reuseID)
    }
    
    // MARK: - Data
    private var _data = [Section]()
    public var data: [Section] {
        get { return _data }
        set {
            let changeset = StagedChangeset(source: _data, target: newValue)
            collectionV.reload(using: changeset, interrupt: {$0.changeCount > 100} ) { data in
                self._data = data
            }
        }
    }
    public var silentData:[Section]{
        set{ _data = newValue }
        get{ return _data }
    }
    
    /// Register cell
    public func register(_ cellType: UICollectionViewCell.Type, reuseID:String) {
        collectionV.register(cellType, forCellWithReuseIdentifier: reuseID)
    }
    /// Register header
    public func register(_ header: UICollectionReusableView.Type, reuseID:String) {
        collectionV.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseID)
    }
    
    // MARK: - Layout
    open func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellH: CGFloat = 60
        let cellW: CGFloat = UIScreen.main.bounds.width * 0.24
        
        layout.sectionInset = UIEdgeInsets(top: 5,
                                           left: 10,
                                           bottom: 5,
                                           right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: cellW, height: cellH)
        layout.headerReferenceSize = CGSize(width: 40, height: 40)
        return layout
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    // MARK: - DKBasicCellDelegate
    open func action(cell: DKBasicCCell, senderUI: UIView, senderType: Any?, event: UIControl.Event) {
        print("⚠️ Implement \(#function) in \(description)")
    }
    // MARK: - DKBasicHeaderDelegate
    open func action(header: DKBasicCHeader, senderUI: UIView, senderType: Any?, event: UIControl.Event) {
        print("⚠️ Implement \(#function) in \(description)")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DKBasicVC: UICollectionViewDelegateFlowLayout{
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 300, height: 90)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension DKBasicVC: UICollectionViewDataSource, UICollectionViewDelegate {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return _data.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _data[section].elements.count
    }

    // MARK: - Render
    /// cell render
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellData = data[indexPath.section].elements[indexPath.item]
        
        if var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DKBasicCCell.reuseID,
            for: indexPath) as? DKBasicCCell {
            cell.cellData = cellData
            cell.dkBasicCellDelegate = self
            return cell
        }
        
        fatalError("Unknown cell!")
        
    }

    // MARK: - Render
    /// header render
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerData = _data[indexPath.section].model
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DKBasicCHeader.reuseID, for: indexPath) as? DKBasicCHeader{
                headerView.headerData = headerData
                headerView.dkBasicHeaderDelegate = self
                return headerView
                
            }else{
                fatalError("Unknown cell!")
            }
            
        case UICollectionView.elementKindSectionFooter:
            if let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DKBasicCHeader.reuseID, for: indexPath) as? DKBasicCHeader{
                footerView.headerData = headerData
                footerView.dkBasicHeaderDelegate = self
                return footerView
                
            }else{
                fatalError("Unknown Header!")
            }
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("⚠️ didSelectItemAt \(indexPath) \(#function) in \(description)")
    }

}
