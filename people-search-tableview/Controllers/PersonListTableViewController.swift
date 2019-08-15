//
//  PersonListTableViewController.swift
//  people-search-tableview
//
//  Created by David Rifkin on 8/15/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    let people = Person.allPeople

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var personSearchResults:[Person] {
        get {
            
        //when we have no search term, return the value of the initial set of people
            guard let searchString = searchString else {
                return people
            }
            guard searchString != ""  else {
                return people
            }
            if let scopeTitles = searchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Name":
                    return people.filter{$0.name.contains(searchString.lowercased())}
                case "Phone":
                    return people.filter{$0.phone.contains(searchString.lowercased())}
                default:
                    return people
                }
            }
            return people
        }
    }
    
    var searchString: String? = nil {
        didSet {
            print(searchString)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personSearchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as? PersonalInfoTableViewCell{
            cell.name?.text = personSearchResults[indexPath.row].name
            // in the particular row that we're looking at look for, look in our model for  the object that is in that location and use that info
            cell.phoneNumber?.text = personSearchResults[indexPath.row].phone
            return cell
        }
        
        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PersonListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchString = searchBar.text
//    }
}
