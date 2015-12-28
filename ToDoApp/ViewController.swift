//
//  ViewController.swift
//  ToDoApp
//
//  Created by Michael Stroh on 27.12.15.
//  Copyright © 2015 Michael Stroh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, NewToDoViewControllerDelegate {
    
    @IBOutlet weak var tableViewToDoOutlet: UITableView!
    
    var todos: [String] = ["Italienisch lernen", "WebProgrammierung lernen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Meine Ergänzung
        // ReuseIdentifier für Wiederverwendung einer Cell, z.B. bei Scrolling
        self.tableViewToDoOutlet.registerClass(UITableViewCell.self, forCellReuseIdentifier: "toDoCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Funktionen des Protokolls UITableViewDataSource
    /////////////////////////////
    // Anzahl Zeilen in TableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    // Verschiedene Sections - hier nur eine Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Inhalt der jeweiligen Zeile / Zelle wird übergeben
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Wiederverwertbare Cell
        let cell = tableViewToDoOutlet.dequeueReusableCellWithIdentifier("toDoCell", forIndexPath: indexPath) as UITableViewCell
        
        // Cell mit Inhalt des Arrays befüllen
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addToDo" {
            let vc = segue.destinationViewController as! NewToDoViewController
            vc.toDoViewControllerDelegate = self
        }
    }
    
    //
    func addedItem(controller: NewToDoViewController, toDoTextfield: String) {
        self.todos += [toDoTextfield]
        // Zurückspringen zur HauptView
        controller.navigationController?.popViewControllerAnimated(true)
    }


}

