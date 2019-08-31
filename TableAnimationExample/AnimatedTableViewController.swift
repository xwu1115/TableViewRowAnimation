//
//  AnimatedTableViewController.swift
//  TableAnimationExample
//
//  Created by Shawn Wu on 8/30/19.
//  Copyright © 2019 Shawn Wu. All rights reserved.
//

import UIKit

class AnimatedTableViewController: UITableViewController {
    private var data: [Int] = [1, 2, 3]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTableView()
        }
    }
    
    private func updateTableView() {
        var new = [Int]()
        let len = arc4random_uniform(10)
        while new.count < len {
            let num = Int(arc4random_uniform(10))
            if !new.contains(num) {
                new.append(num)
            }
        }
        let result = Array.computeDifference(current: data, new: new)
        let insertIndexes = result.0.compactMap { IndexPath(row: $0, section: 0)}
        let deleteIndexes = result.1.compactMap { IndexPath(row: $0, section: 0)}
        data = new
        tableView.beginUpdates()
        tableView.deleteRows(at: deleteIndexes, with: .none)
        tableView.insertRows(at: insertIndexes, with: .none)
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
