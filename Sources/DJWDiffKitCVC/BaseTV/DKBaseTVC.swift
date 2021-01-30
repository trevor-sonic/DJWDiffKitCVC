//
//  DKBaseTVC.swift
//  
//
//  Created by dejaWorks on 21/09/2020.
//

import UIKit
import DJWBaseVC
import DifferenceKit

open class DKBaseTVC: BaseVC {
    public typealias Section = ArraySection<DKContainer, DKContainer>
    
    // MARK: - UI
    open lazy var tableV:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        return tv
    }()
    

    // MARK: - Data
    private var _data = [Section]()
    public var data: [Section] {
        get { return _data }
        set {
            let changeset = StagedChangeset(source: _data, target: newValue)
            
//            tableV.reload(using: changeset, with: .fade, interrupt: { $0.changeCount > 0 })
//            {  data in
//                self._data = data
//            }

            
            tableV.reload(using: changeset, with: .automatic) { data in
                self._data = data
            }
        }
    }
    
    public func register(_ cellType: UITableViewCell.Type, reuseID:String) {
        tableV.register(cellType, forCellReuseIdentifier: reuseID)
    }
    public func register(_ header: UITableViewHeaderFooterView.Type, reuseID:String) {
        tableV.register(header, forHeaderFooterViewReuseIdentifier: reuseID)
    }
}

extension DKBaseTVC: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.indices.contains(section){
            return _data[section].elements.count
        }
        return 0
    }
    //return _data.count
    
    
    // MARK: - Cell Render
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let anyItem = _data[indexPath.section].elements[indexPath.item]//.base
    
        //let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: anyItem.reuseID)
        
        if var cell = tableView.dequeueReusableCell(withIdentifier: anyItem.reuseID, for: indexPath) as? DKCellOrSectionP{
            cell.base = anyItem.base
            cell.dkCellOrSectionDelegate = self
            //(cell as! UITableViewCell).showsReorderControl = false
            
            //(cell as! UITableViewCell).accessoryType = .disclosureIndicator
            
            //(cell as! UITableViewCell).isEditing = false
                //self.tableV(tableView, canMoveRowAtIndexPath: indexPath)
            return cell as! UITableViewCell
        }
        
        fatalError("Unknown cell!")
    }

    // MARK: - Section Render
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard data.indices.contains(section) else {return nil}
        
        let anyItem = _data[section]
        
        if var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: anyItem.model.reuseID) as? DKCellOrSectionP{
            headerView.base = anyItem.model.base
            headerView.dkCellOrSectionDelegate = self
//                (headerView as? UIView)?.backgroundColor = .blue
            return headerView as! UITableViewHeaderFooterView
            
        }else{
            fatalError("Unknown cell!")
        }
    }
    
    // MARK: - Select
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("⚠️ didSelectItemAt \(indexPath) \(#function) in \(description)")
    }
    
}
extension DKBaseTVC:DKCellOrSectionDelegate{
    public func action(cellOrSection: DKCellOrSectionP, senderUI: UIView, senderType: Any?, event: UIControl.Event) {
        print("⚠️ Implement \(#function) in \(description)")
    }
}
