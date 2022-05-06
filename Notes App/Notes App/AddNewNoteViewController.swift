//
//  AddNewNoteViewController.swift
//  Notes App
//
//  Created by Ferhat Geyik on 5.05.2022.
//

import UIKit

class AddNewNoteViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    // MARK: - UI Elements
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailTextView: UITextView!
    
    
    // MARK: - Properties
    var note: Note?
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        detailTextView.delegate = self

        if let note = note {
            titleTextField.text = note.title
            detailTextView.text = note.detail
        }
    }
    
  
    
    

    
    // MARK: - Functions

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let title = titleTextField.text {
            if let detail = detailTextView.text{
                note = Note(title: title, detail: detail)
            }
        }
    }
    

}
