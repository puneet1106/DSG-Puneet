//
//  EventCell.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import UIKit
import SDWebImage

class EventCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var favouriteImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.setShadowView()
        self.eventImageView.layer.cornerRadius = 8.0
        self.eventImageView.layer.masksToBounds = true
        self.layoutIfNeeded()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI(event: Event){
        self.eventTitleLabel.text = event.shortName
        self.eventLocationLabel.text = event.venue?.location
        self.eventTimeLabel.text = Helpers.sharedInstance.convertDateFormatter(date: event.datetime ?? "")
        if let performer = event.performer?[0] {
            self.eventImageView.sd_setImage(with: URL(string: performer.image ?? ""), completed: nil)
        }
        
        if let favouriteEventArray = UserDefaults.standard.array(forKey: "favouriteEvent") as? [Int] {
            
            if let id = event.id {
            
                if favouriteEventArray.contains(id) {
                    self.favouriteImageView.isHidden = false
                    self.favouriteImageView.image = UIImage(named: "favourite-icon")
                } else {
                    self.favouriteImageView.isHidden = true
                }
            }
        }
    }
    
}
