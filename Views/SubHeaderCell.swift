//
//  SubHeaderCell.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/31/24.
//

import UIKit

class SubHeaderCell: UITableViewCell {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinTextView: UILabel!
    @IBOutlet weak var searchImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    private func setupViews() {
        coinImageView.contentMode = .scaleAspectFit
        coinImageView.tintColor = .white

        coinTextView.font = UIFont.systemFont(ofSize: 16)
        coinTextView.textColor = .white
        coinTextView.textAlignment = .right
        coinTextView.backgroundColor = .clear

        searchImageView.contentMode = .scaleAspectFit
        searchImageView.tintColor = .white
        
        // Ensure no padding by setting constraints to zero
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinTextView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
    }



    func configure() {
        coinImageView.image = UIImage(systemName: "dollarsign.circle.fill")
        coinTextView.text = "10,000"
        searchImageView.image = UIImage(systemName: "magnifyingglass")
    }
}

