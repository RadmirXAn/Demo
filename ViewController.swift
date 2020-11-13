//
//  ViewController.swift
//  Demo
//
//  Created by Радмир Юмагужин on 13.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {
    
    let headerID = String(describing: CustomHeaderView.self)
    var arrayOfData = [ExpandedModel]()
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //customTableView.dataSource = self
        //customTableView.delegate = self
        
        arrayOfData = [
            ExpandedModel(isExpanded: true, title: "Words", array: ["One", "Two", "Three", "Four", "Five"]),
            ExpandedModel(isExpanded: true, title: "Numbers", array: ["6", "7", "8", "9", "10"]),
            ExpandedModel(isExpanded: true, title: "Сharacters", array: ["Q", "W", "E", "R", "T", "Y"]),
            ExpandedModel(isExpanded: true, title: "Emojis", array: ["😀", "😡", "🥶", "😱", "😈"])
        ]
        
        tableViewConfig()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !arrayOfData[section].isExpanded {
            return 0
        }
        
        return arrayOfData[section].array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfData[indexPath.section].array[indexPath.row]
        return cell
    }
 
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        customTableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
       
        customTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        
        header.configure(title: arrayOfData[section].title, section: section)
        header.rotateImage(arrayOfData[section].isExpanded)
        header.delegate = self
        
        return header
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func expandedSection(button: UIButton) {
        let section = button.tag

        let isExpanded = arrayOfData[section].isExpanded
        arrayOfData[section].isExpanded = !isExpanded

        customTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
    
}

