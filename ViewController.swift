//
//  ViewController.swift
//  Demo
//
//  Created by Радмир Юмагужин on 13.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let headerID = String(describing: CustomHeaderView.self)
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //customTableView.dataSource = self
        //customTableView.delegate = self
        tableViewConfig()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Section: \(indexPath.section), row: \(indexPath.row)"
        return cell
    }
 
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        customTableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
       
        customTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        
        header.titleLabel.text = "Section: \(section)"
        
        return header
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }


}

