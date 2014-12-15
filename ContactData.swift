//
//  ContactData.swift
//  SMS_Demo
//
//  Created by Alex Zhu on 14/12/14.
//  Copyright (c) 2014年 Alex Zhu. All rights reserved.
//

import UIKit
import AddressBook

class ContactData: NSObject {
    
    var firstName = NSString()
    var lastName = NSString()
        var phoneNumber = NSString()
    var phoneNumbers = NSMutableArray()
    var emailAddress = NSMutableArray()
    var contactImage = UIImage()
    var emptyDictionary: CFDictionaryRef?
    var addressBook: ABAddressBookRef?
    var errorRef: Unmanaged<CFErrorRef>?
    var string = NSString()

    
    
    func getContacts(){
        
        addressBook = ABAddressBookCreateWithOptions(emptyDictionary, &errorRef).takeRetainedValue()
        
        if addressBook == nil{
            println(errorRef)
        }
        
        var source: ABRecordRef = (ABAddressBookCopyArrayOfAllPeople(addressBook) != nil)
        
        var allPeople: CFArrayRef = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray
        var nPersons: CFIndex = ABAddressBookGetPersonCount(addressBook)
        
        if(nPersons == 0){
            println("No Contacts!")
        }
        
        println("records in the array \(nPersons)")
        
        
        for var i:Int = 0; i < nPersons; i++ {
        //var i:Int = 4
            var contact = CFArrayGetValueAtIndex(allPeople, i)
            var opaquePtr = COpaquePointer(UnsafeMutablePointer<Void>(contact))
            var person:ABRecordRef = Unmanaged.fromOpaque(opaquePtr).takeRetainedValue()
            
            firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as NSString
            lastName = ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue() as NSString
            phoneNumber = ABRecordCopyValue(person, kABPersonPhoneProperty).takeRetainedValue() as NSString
            //println(phoneNumber)
            //string =
           //println("Index: \(i)     \(lastName):  \(phoneNumber)")
        println(lastName)
            

            

            
            
        }
        
    }

   
}
