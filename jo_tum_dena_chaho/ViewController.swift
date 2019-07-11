//
//  ViewController.swift
//  jo_tum_dena_chaho
//
//  Created by Saurabh Sabharwal on 11/07/19.
//  Copyright © 2019 Saurabh Sabharwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayOfres: [Restaraunt] = []
    let tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        //createviews()
        let restaraunt = Restaraunts()
        
        createList()
        
        restaraunt.getData() {(restaraunts) in
            self.arrayOfres = restaraunts
            print(restaraunts.count)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        print(arrayOfres.count)
        
    }
    
    func numberOfSections (in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfres.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! MyTableViewCell
            
            cell.setData(restaraunt: arrayOfres[indexPath.row])
            return cell
        default:
            return UITableViewCell(style: .default, reuseIdentifier: "empty")
        }
        
//        return UITableViewCell(style: .default, reuseIdentifier: "empty")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayOfres[indexPath.row].name)
    }

    func createviews () {
        
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        redView.set(.top(view, 50),
                     .sameLeadingTrailing(view, 12),
                     .height(200))
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        view.addSubview(yellowView)
        
        yellowView.set(.below(redView, 12),
                       .leading(view, 12),
                       .width(30),
                       .height(100))
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        greenView.set(.after(yellowView, 12),
                      .below(redView, 12),
                      .trailing(view, 12),
                      .height(100))
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        blueView.set(.below(greenView, 12),
                     .trailing(view, 12),
                     .width(30),
                     .height(100))
        
        let orangeView = UIView()
        orangeView.backgroundColor = UIColor.orange
        view.addSubview(orangeView)
        
        orangeView.set(.below(yellowView, 12),
                       .leading(view, 12),
                       .before(blueView, 12),
                       .height(100))
        
    }
    
    func createList() {
    
        view.addSubview(tableView)
        tableView.set(.fillSuperView(view))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "mycell")
    }
}

