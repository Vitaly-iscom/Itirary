//
//  ActivitiesViewController.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 25/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: FloatingButton!
    
    var tripId: UUID!
    var tripModel: TripModel?
    var sectionHeaderHight: CGFloat = 0.0
    var tripTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tripTitle
        tableView.dataSource = self
        tableView.delegate = self
        
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return }
            self.tripModel = model
            
            guard let model = model else { return }
            
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
        
        sectionHeaderHight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
    }
    
    @IBAction func addAction(_ sender: FloatingButton) {
        let alert = UIAlertController(title: "Wich would you like to add?", message: nil, preferredStyle: .actionSheet)
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        let activityAction = UIAlertAction(title: "Activity", style: .default) { (action) in
            print("Add new activity")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: 0) // настройка стрелки для iPad
        
        present(alert, animated: true)
    }
    
    func handleAddDay(action: UIAlertAction) {
        print("Add new day")
    }
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        
        cell.setap(model: dayModel!)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        
        cell.setup(model: model!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

