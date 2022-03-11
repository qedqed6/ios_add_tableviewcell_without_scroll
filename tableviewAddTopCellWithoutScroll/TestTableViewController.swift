//
//  TestTableViewController.swift
//  tableviewAddTopCellWithoutScroll
//
//  Created by peter on 2022/3/11.
//

import UIKit

class TestTableViewController: UITableViewController {
    let text = "1\n2\n3\n4\n5"
    var textBackgroundColors: [UIColor] = [.green]
    
    func insertTopCellWithoutScroll() {
        DispatchQueue.main.async {
            
            /* Record current tableview height */
            let oldHeight = self.tableView.contentSize.height

            /* Insert data to data source */
            self.textBackgroundColors.insert(.red, at: 0)
            
            /* Update tableview content */
            self.tableView.reloadData()
            
            /* Force layout done, also means cell size be ensured */
            self.tableView.layoutIfNeeded()
            
            /* Get current tableview height */
            let newHeight = self.tableView.contentSize.height
            
            /* Calculate the added height */
            let addedHeight = newHeight - oldHeight
            
            /* Calculate new vertical position */
            var newoOffset = self.tableView.contentOffset
            newoOffset.y += addedHeight
            
            /* Move to new position */
            self.tableView.setContentOffset(newoOffset, animated: false)
            
            /* Force layout to show result */
            self.tableView.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Add new cell on tableview content's top after 3 second */
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            self.insertTopCellWithoutScroll()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textBackgroundColors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TestTableViewCell.self)", for: indexPath) as? TestTableViewCell else {
            return UITableViewCell()
        }

        cell.contentLabel.text = text
        cell.contentLabel.backgroundColor = textBackgroundColors[indexPath.row]

        return cell
    }
}
