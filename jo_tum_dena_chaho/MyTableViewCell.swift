//
//  MyTableViewCell.swift
//  jo_tum_dena_chaho
//
//  Created by Saurabh Sabharwal on 11/07/19.
//  Copyright © 2019 Saurabh Sabharwal. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class MyTableViewCell: UITableViewCell {
    let titlelabel = UILabel()
    let subtitlelabel = UILabel()
    let mainImageView = UIImageView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func createViews() {
        contentView.addSubview(mainImageView)

        mainImageView.layer.cornerRadius = 20
        mainImageView.clipsToBounds = true
        
        
        mainImageView.set(.top(contentView, 12),
                          .leading(contentView, 12),
                          .width(40),
                          .height(40),
                          .bottom(contentView, 12))
        
        titlelabel.text = "Restaraunt Name"
        contentView.addSubview(titlelabel)
        
        titlelabel.set(.top(contentView, 12),
                       .after(mainImageView, 12),
                       .trailing(contentView, 12))
        
        subtitlelabel.text = "Cafe, Fast food..."
        contentView.addSubview(subtitlelabel)
        
        subtitlelabel.set(.below(titlelabel, 5),
                          .after(mainImageView, 12),
                          .trailing(contentView, 12))
    }
    
    public func setData(restaraunt: Restaraunt) {
        var url: URL!
        var str: String!
        str = restaraunt.image
        url = URL(string: str)
        mainImageView.load(url: url)
        titlelabel.text = restaraunt.name
        subtitlelabel.text = restaraunt.email
    }
}
