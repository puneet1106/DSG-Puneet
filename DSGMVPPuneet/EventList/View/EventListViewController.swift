//
//  EventListViewController.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 23/09/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    
    @IBOutlet weak var eventListTableView: UITableView!
    
    var eventListViewModel : EventListViewModel!
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.fetchEventList()
    }
    
    
    func setUpUI(){
        
        searchBar.searchTextField.backgroundColor = Colors.searchBarBackgroundColor
        self.navigationItem.titleView = searchBar
        searchBar.tintColor = .white
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.searchTextField.addTarget(self, action: #selector(searchingEvent), for: UIControl.Event.editingChanged)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelButtonClicked(_ :)))
        
        cancelButton.tintColor = .white
        searchBar.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = cancelButton
        
        eventListTableView.register(EventCell.nib, forCellReuseIdentifier: EventCell.identifier)
        
    }
    
    func setUpViewModel(){
        
        self.eventListViewModel =  EventListViewModel()
        self.eventListViewModel.didGetData = {
            DispatchQueue.main.async {
                self.eventListTableView.reloadData()
                self.eventListTableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
                
            }
        }
    }
    
    func fetchEventList(){
        self.eventListViewModel.callFuncToGetEmpData(text: "")
    }
    
    
    @objc func cancelButtonClicked(_ sender: UIBarButtonItem){
        searchBar.searchTextField.text = ""
        searchBar.searchTextField.resignFirstResponder()
        resetData()
        self.fetchEventList()
    }
    
    @objc func searchingEvent(_ textField:UITextField) {
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reloadingRequest), object: nil)
        self.perform(#selector(self.reloadingRequest), with: nil, afterDelay: 0.5)
    }
    
    @objc func reloadingRequest() {
        self.resetData()
        if searchBar.searchTextField.text?.count == 0 {
            self.eventListViewModel.callFuncToGetEmpData(text: "")
            return
        }
        let searchText =  searchBar.searchTextField.text
        self.eventListViewModel.callFuncToGetEmpData(text: searchText ?? "")
    }
    
    func resetData(){
        self.eventListViewModel.eventList.removeAll()
        self.eventListViewModel.loadMoreData = true
        self.eventListViewModel.currentPage = 1
    }
    
    func pushToEventsDetailViewController(event: Event?){
        
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.main.rawValue, bundle: nil)
        if let eventsDetailViewController = storyboard.instantiateViewController(withIdentifier: StoryboardViewControllerIdentifier.eventsDetailViewController.rawValue) as? EventsDetailViewController {
            eventsDetailViewController.selectedEvent = event
            navigationController?.pushViewController(eventsDetailViewController, animated: false)
        }
        
    }
    
}


