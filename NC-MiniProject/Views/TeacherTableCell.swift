//
//  TeacherTableCell.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import UIKit

class TeacherTableCell: UITableViewCell {
    
    // MARK: outlets
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var teacherAge: UILabel!
    @IBOutlet weak var teacherCountry: UILabel!
    @IBOutlet weak var teacherRating: UILabel!
    @IBOutlet weak var teacherNumberLesson: UILabel!
    @IBOutlet weak var teacherAmount: UILabel!
    @IBOutlet weak var teacherTags: UILabel!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var heartIcon: UIImageView!
    @IBOutlet weak var ratingIcon: UIImageView!
    @IBOutlet weak var lessonIcon: UIImageView!
    @IBOutlet weak var coinIcon: UIImageView!
    
    
    func configure(with teacher: Teacher) {
        teacherImageView.image = teacher.teacherProfile
        teacherName.text = teacher.teacherName
        teacherAge.text = "\(teacher.teacherAge)"
        teacherCountry.text = teacher.teacherCountry
        teacherRating.text = teacher.teacherRating
        teacherNumberLesson.text = "\(teacher.numberLessons)"
        teacherAmount.text = "\(teacher.coinAmount)"
        heartCount.text = "\(teacher.heartCount)"
        
        let heartIconImage = UIImage(systemName: "heart")
        heartIcon.image = heartIconImage?.withRenderingMode(.alwaysTemplate)
        heartIcon.tintColor = .white
        
        let ratingIconImage = UIImage(systemName: "star.fill")
        ratingIcon.image = ratingIconImage
        ratingIcon.tintColor = .white
        
        let lessonIconImage = UIImage(systemName: "chart.line.uptrend.xyaxis.circle.fill")
        lessonIcon.image = lessonIconImage
        lessonIcon.tintColor = .white
        
        let coinIconImage = UIImage(systemName: "dollarsign.circle.fill")
        coinIcon.image = coinIconImage
        coinIcon.tintColor = .white
        
        teacherTags.subviews.forEach { $0.removeFromSuperview() }

        let tags = teacher.teacherTags ?? []
        var xOffset: CGFloat = 0
        let labelHeight: CGFloat = 20
        let labelWidth: CGFloat = 80
        let spacing: CGFloat = 5 // - adjust spacing between labels

        for tag in tags {
            let label = UILabel()
            label.text = tag
            label.textColor = .black
            label.backgroundColor = .lightGray
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            teacherTags.addSubview(label)
            
            // - set constraints for the label
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: teacherTags.topAnchor),
                label.leftAnchor.constraint(equalTo: teacherTags.leftAnchor, constant: xOffset),
                label.heightAnchor.constraint(equalToConstant: labelHeight),
                label.widthAnchor.constraint(equalToConstant: labelWidth)
            ])
            
            xOffset += labelWidth + spacing // - move to the right for the next label
        }

        teacherTags.frame.size.height = labelHeight
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
