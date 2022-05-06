//
//  Note.swift
//  Notes App
//
//  Created by Ferhat Geyik on 4.05.2022.
//

import Foundation

struct Note: Codable {
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archieveUrl = documentsDirectory.appendingPathComponent("notes").appendingPathExtension("plist")
    
    
    var title: String
    var detail: String
    
    init(title: String, detail: String){
        self.title = title
        self.detail = detail
    }
    
    //MARK: - Functions
    
   static func saveToMemory(notes: [Note]){
        let propertyListEncoder = PropertyListEncoder()
        if let encodedNotes = try? propertyListEncoder.encode(notes){
          try? encodedNotes.write(to: archieveUrl, options: .noFileProtection)
        }
    }
    
    
   static func loadFromMemory() ->[Note]{
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archieveUrl), let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesData){
           return decodedNotes
       }else {
           return []
       }
    }
}

