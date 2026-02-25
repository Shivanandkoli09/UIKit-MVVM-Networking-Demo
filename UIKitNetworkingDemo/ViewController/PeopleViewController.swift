//
//  ViewController.swift
//  UIKitNetworkingDemo
//
//  Created by Shivanand Koli on 25/02/26.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = PeopleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star Wars People"
        view.backgroundColor = .systemBackground
        
        setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
    }
    
    private func loadData() {
        Task {
            await viewModel.fetchPeople()
            tableView.reloadData()
        }
    }
}

extension PeopleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.people.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: "cell")
        
        let person = viewModel.people[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = "Height: \(person.height)"
        
        return cell
    }
}
