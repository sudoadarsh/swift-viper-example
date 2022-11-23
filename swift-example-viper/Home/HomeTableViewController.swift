//
//  HomeTableViewController.swift
//  swift-example-viper
//
//  Created by Adarsh Sudarsanan on 21/11/22.
//

import UIKit


/// This protocol will be implemented by the [HomeTableViewController] class and will receive inputs from [HomeTableViewPresenter].
protocol HomeTableViewDelegate: AnyObject {
    func displayUsers(users: [UserEntity])
    func displayError(error: Error)
}

class HomeTableViewController: UITableViewController {
    
    // MARK: - Properties.
    
    var users: [UserEntity] = []
    
    // MARK: - View life cycle.

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    // The number of rows in the cell.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    // Building the cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

extension HomeTableViewController: HomeTableViewDelegate {
    
    // MARK: HomeTableViewDelegate.
    
    func displayUsers(users: [UserEntity]) {
        self.users = users
        tableView.reloadData()
    }
    
    func displayError(error: Error) {
        // Creating a cupertion alert.
        let alert: UIAlertController = UIAlertController(title: "Viper-example", message: "Unable to load data due to: \(error)", preferredStyle: .alert)
        // Creating action for the alert.
        let action: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        // Adding the action to the alert.
        alert.addAction(action)
        // Present the alert.
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
