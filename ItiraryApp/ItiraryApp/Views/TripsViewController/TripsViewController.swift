//
//  TripsViewController.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 19/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: FloatingButton!
    @IBOutlet var helpView: UIVisualEffectView!
    
    let seenHelpView = "seenHelpView"
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(complection: {[unowned self] in
            self.tableView.reloadData()
            
            if Data.tripsModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenHelpView) == false {
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.bounds
                }
            }
        })

        view.backgroundColor = Theme.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
    
    @IBAction func closeHelpView(_ sender: AppUIButton) {
        
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.helpView.alpha = 0
        }) { [unowned self] (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
        }
        
    }
    
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier) as! TripsTableViewCell
        
        cell.setup(tripModel: Data.tripsModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let trip = Data.tripsModels[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // perform delete
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true)
        }
        delete.image = UIImage(named: "Delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = UIColor(named: "Edit")
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let trip = Data.tripsModels[indexPath.row]
        
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        navigationController?.pushViewController(vc, animated: true)
    }
}
