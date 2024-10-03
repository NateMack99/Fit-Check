//
//  AlertItem.swift
//  Appetizers
//
//  Created by Nate Mackintosh on 9/25/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    //MARK: - Network Errors
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data recieved from the server was invalid! Oh well."),
                                       dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid Response from the server."),
                                       dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Invalid URL"),
                                       dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                       dismissButton: .default(Text("OK")))
    
    //MARK: - Account Errors
    
    static let emptyFormField = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please fill out all fields."),
                                       dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Email is not valid."),
                                       dismissButton: .default(Text("OK")))
    static let unableToSave = AlertItem(title: Text("Unable to save"),
                                       message: Text("Unable to save changes at this moment. Please try again later."),
                                       dismissButton: .default(Text("OK")))
    static let saveSuccess = AlertItem(title: Text("Saved"),
                                       message: Text("Your chenges were successfully saved."),
                                       dismissButton: .default(Text("OK")))
    static let unableToRetrieveUser = AlertItem(title: Text("Request Failed"),
                                       message: Text("Unable to retrive User data. Please try again later."),
                                       dismissButton: .default(Text("OK")))

}
