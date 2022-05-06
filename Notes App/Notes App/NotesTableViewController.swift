//
//  NotesTableViewController.swift
//  Notes App
//
//  Created by Ferhat Geyik on 4.05.2022.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    
    var notes: [Note] = []
    
    var titleTextFieldDelegate: UITextFieldDelegate?
    var detailTextViewDelegate: UITableViewDelegate?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = Note.loadFromMemory()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as! NoteTableViewCell
        cell.textLabel?.text = note.title
        cell.update(with: note)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "addNewNote", sender: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedNote = notes.remove(at: sourceIndexPath.row)
        notes.insert(movedNote, at: destinationIndexPath.row)
        Note.saveToMemory(notes: notes)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            Note.saveToMemory(notes: notes)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewNote" {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let viewController = segue.destination as! AddNewNoteViewController
                
                viewController.note = notes[selectedIndexPath.row]
            }
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func editButtonTapped(_ buttton: UIBarButtonItem){
        
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
        
    }
    
    @IBAction func unwindFromNewNote(_ segue: UIStoryboardSegue){
        
        guard let sourceViewController = segue.source as? AddNewNoteViewController,
              let newNote = sourceViewController.note,
              newNote.title != "" && newNote.detail != ""
        else { return }
       
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            notes[selectedIndexPath.row] = newNote
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            Note.saveToMemory(notes: notes)
            
        }else {
            
            let newIndexPath = IndexPath(row: notes.count, section: 0)
            notes.append(newNote)
            Note.saveToMemory(notes: notes)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}
