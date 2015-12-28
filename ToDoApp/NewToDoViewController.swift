//
//  NewToDoViewController.swift
//  ToDoApp
//
//  Created by Michael Stroh on 27.12.15.
//  Copyright © 2015 Michael Stroh. All rights reserved.
//

import UIKit

// Selbstdefiniertes DelegateProtokoll zur Übertragung der vom  Nutzer eingetragenen Daten an die HauptView
protocol NewToDoViewControllerDelegate {
    func addedItem(controller: NewToDoViewController, toDoTextfield:String)
}

class NewToDoViewController: UIViewController, UITextFieldDelegate {
    
    var toDoViewControllerDelegate:NewToDoViewControllerDelegate?

    @IBOutlet weak var toDoTextfieldOutlet: UITextField!
    @IBOutlet weak var descriptionTextfieldOutlet: UITextField!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    @IBAction func saveButtonTappedAction(sender: AnyObject) {
        if self.toDoViewControllerDelegate != nil {
            print(toDoTextfieldOutlet.text)
            self.toDoViewControllerDelegate?.addedItem(self, toDoTextfield: toDoTextfieldOutlet.text!)
        }
    }
    
    // Implementierte Funktion von UITextFieldDelegate
    // Reagiert auf gedrückten Return-Button innerhalb der beiden Textfelder
    // Wichtig: Outlets müssen vorher beim ViewController als OutletDelegate registriert werden!
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == toDoTextfieldOutlet {
            descriptionTextfieldOutlet.becomeFirstResponder()
        } else {
            descriptionTextfieldOutlet.resignFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ToDo Textfeld wird FirstResponder
        self.toDoTextfieldOutlet.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
