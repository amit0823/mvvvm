//
//  ViewController.swift
//  MVVM_Example
//
//  Created by Alok Deepti on 21/07/19.
//  Copyright © 2019 Alok. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tblView: UITableView!
    var viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewModel.getDataFromAPIHandlerClass(url: EndPoint.strUrl) { (_) in
            
            DispatchQueue.main.async { [weak self] in
                self?.tblView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = viewModel.getCellData(index: indexPath.row)
        return cell!
    }
}

