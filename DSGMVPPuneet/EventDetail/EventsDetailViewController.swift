//
//  EventsDetailViewController.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import UIKit

class EventsDetailViewController: UIViewController {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    
    var selectedEvent: Event?
    var favouriteEvents = [Int]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        self.title = "Details"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]


        self.eventTitleLabel.text = selectedEvent?.shortName
        self.eventLocationLabel.text = selectedEvent?.venue?.location
        self.eventTimeLabel.text = Helpers.sharedInstance.convertDateFormatter(date: selectedEvent?.datetime ?? "")
        if let performer = selectedEvent?.performer?[0] {
            self.eventImageView.sd_setImage(with: URL(string: performer.image ?? ""), completed: nil)
        }
        
        if let favouriteEventArray = UserDefaults.standard.array(forKey: "favouriteEvent") as? [Int] {
            
            if let id = self.selectedEvent?.id {
            
                if favouriteEventArray.contains(id) {
                    favouriteButton.setImage(UIImage(named: "favourite-icon"), for: .normal)
                    
                } else {
                    favouriteButton.setImage(UIImage(named: "default-icon"), for: .normal)
                }
                
            }
        }
    }
    

    @IBAction func favouriteButtonAction(_ sender: UIButton) {
        if let favouriteEventArray = UserDefaults.standard.array(forKey: "favouriteEvent") as? [Int] {
            favouriteEvents = favouriteEventArray
            if let id = self.selectedEvent?.id {
                if favouriteEvents.contains(id) {
                    let index = favouriteEvents.firstIndex(of: id)
                    favouriteEvents.remove(at: index!)
                    sender.setImage(UIImage(named: "default-icon"), for: .normal)
                    
                } else {
                    favouriteEvents.append(id)
                    sender.setImage(UIImage(named: "favourite-icon"), for: .normal)
                }
                UserDefaults.standard.set(favouriteEvents, forKey: "favouriteEvent")
                UserDefaults.standard.synchronize()
            }
        } else{
            if let id = self.selectedEvent?.id {
                favouriteEvents.append(id)
                UserDefaults.standard.set(favouriteEvents, forKey: "favouriteEvent")
                UserDefaults.standard.synchronize()
                sender.setImage(UIImage(named: "favourite-icon"), for: .normal)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
