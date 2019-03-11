//
//  TableViewController.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 01/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var quiz = Quiz.questions
    var index : Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let buttonAdd = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.addItem))
        self.index = nil
        self.navigationItem.rightBarButtonItems = [buttonAdd]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.quiz = Quiz.questions
        self.tableView.reloadData()
        self.index = nil
        
    }
    
    @objc func addItem(){
        performSegue(withIdentifier: "editView", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.quiz.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)

        cell.textLabel?.text = self.quiz[indexPath.row].question

        return cell
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           let removeQuiz = Quiz()
           removeQuiz.removeQuiz(index: indexPath.row)
            //self.quiz.remove(at: indexPath.row)
            self.quiz = Quiz.questions
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        
        performSegue(withIdentifier: "editView", sender: self)
    }
  
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "editView" {
            let vc : EditViewController = segue.destination as! EditViewController
            vc.index = self.index
            
        }
        
    }
 
 

}
