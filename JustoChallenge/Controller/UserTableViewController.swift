//
//  ViewController.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 30/07/23.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    // MARK: - Properties
    let reuseIdentifier = "UserCell"
    let cloudService = CloudService()
    
    var users: [Result] = []
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Users"
        registerTableViewCells()
        configureTableView()
        getUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = sender as? Int, let destinationVC = segue.destination as? UserViewController {
            destinationVC.userInfo = users[row]
        }
    }
    
    // MARK: - Helpers
    private func registerTableViewCells() {
        let userTableViewCell = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.tableView.register(userTableViewCell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
    }
    
    func getUsers() {
        for _ in 0...8 {
            cloudService.fetchData { (user) in
                self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate Methods
extension UserTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? UserTableViewCell {
            cell.configureCell(with: users[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "userViewControllerSegue", sender: indexPath.row)
        
    }
}
