//
//  DKBaseVC.swift
//  
//
//  Created by dejaWorks on 21/09/2020.
//

import UIKit
import DJWBaseVC
import DifferenceKit

open class DKBaseVC: BaseVC, DKCellOrSectionDelegate{
    public typealias Section = ArraySection<DKContainer, DKContainer>
    
    // MARK: - UI
    public lazy var collectionView:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    

    // MARK: - Data
    private var _data = [Section]()
    public var data: [Section] {
        get { return _data }
        set {
            let changeset = StagedChangeset(source: _data, target: newValue)
            collectionView.reload(using: changeset, interrupt: {$0.changeCount > 100} ) { data in
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
        collectionView.register(cellType, forCellWithReuseIdentifier: reuseID)
    }
    /// Register header
    public func register(_ header: UICollectionReusableView.Type, reuseID:String) {
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseID)
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
    // MARK: - DKCellOrSectionDelegate
    open func action(cellOrSection: DKCellOrSectionP, senderUI: UIView, senderType: Any?, event: UIControl.Event) {
        print("⚠️ Implement \(#function) in \(description)")
    }
}
extension DKBaseVC: UICollectionViewDelegateFlowLayout{
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: 300, height: 50)
    }
}
extension DKBaseVC: UICollectionViewDataSource, UICollectionViewDelegate {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return _data.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _data[section].elements.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let anyItem = _data[indexPath.section].elements[indexPath.item]//.base
    
        //let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: anyItem.reuseID)
        
        if var cell = collectionView.dequeueReusableCell(withReuseIdentifier: anyItem.reuseID, for: indexPath) as? DKCellOrSectionP{
            cell.base = anyItem.base
            cell.dkCellOrSectionDelegate = self
            //(cell as! UITableViewCell).showsReorderControl = false
            
            //(cell as! UITableViewCell).accessoryType = .disclosureIndicator
            
            //(cell as! UITableViewCell).isEditing = false
                //self.tableView(tableView, canMoveRowAtIndexPath: indexPath)
            return cell as! UICollectionViewCell
        }
        
        fatalError("Unknown cell!")
        
    }

    // MARK: - Render
    /// cell render
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        let anyItem = _data[indexPath.section]
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            if var headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: anyItem.model.reuseID, for: indexPath) as? DKCellOrSectionP{
                headerView.base = anyItem.model.base
                headerView.dkCellOrSectionDelegate = self
//                (headerView as? UIView)?.backgroundColor = .blue
                return headerView as! UICollectionReusableView
                
            }else{
                fatalError("Unknown cell!")
            }
            
        case UICollectionView.elementKindSectionFooter:
            if var footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: anyItem.model.reuseID, for: indexPath) as? DKCellOrSectionP{
                footerView.base = anyItem.model.base
                footerView.dkCellOrSectionDelegate = self
//                (footerView as? UIView)?.backgroundColor = .green
                return footerView as! UICollectionReusableView
                
            }else{
                return UICollectionReusableView()
                fatalError("Unknown cell!")
            }
        default:
            return UICollectionReusableView()
            assert(false, "Unexpected element kind")
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("⚠️ didSelectItemAt \(indexPath) \(#function) in \(description)")
    }

}
//public extension DKBaseVC:DKCellOrSectionDelegate{
//
//}
