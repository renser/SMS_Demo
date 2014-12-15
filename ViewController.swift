//
//  ViewController.swift
//  SMS_Demo
//
//  Created by Alex Zhu on 14/12/14.
//  Copyright (c) 2014年 Alex Zhu. All rights reserved.
//

import UIKit
import MessageUI
//import AddressBookUI
import AddressBook


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if MFMessageComposeViewController.canSendText()
//        {
//        let msg:MFMessageComposeViewController = MFMessageComposeViewController()
//            msg.recipients = ["18210037368","zhuhuan@huanzhu.net"]
//            msg.body = "This is just a test!"
//            self.presentViewController(msg, animated: true, completion: nil)
//            NSLog("Sent SMS succeed!")
//
//        }
//        else
//        {
//            NSLog("Your device don't support SMS...")
//        }
        
        
//        var error:CFErrorRef
//        var addressBook: ABAddressBookRef? = ABAddressBookCreateWithOptions(nil, nil)
//       // var results: CFArrayRef =
//        
//        
//        if (addressBook != nil){
//            println("Succeed!")
//            
//            var allContacts: CFArrayRef = ABAddressBookCopyArrayOfAllPeople(addressBook)
//            
//            var j = CFArrayGetCount(allContacts)
//            
//            println(j)
//            
//          //  for(int i=0; i<CFArrayGetCounts)
//        }
        
        
       // func ABPersonCreate() -> Unmanaged<ABRecord>!
                
        
        
        var errorRef: Unmanaged<CFErrorRef>?
        var dict: CFDictionaryRef?
        var contactData = ContactData()
        
        contactData.addressBook = ABAddressBookCreateWithOptions(nil, &errorRef).takeRetainedValue()
        
        if (ABAddressBookGetAuthorizationStatus() == ABAuthorizationStatus.NotDetermined){
            
            println("trying to access")
            ABAddressBookRequestAccessWithCompletion(contactData.addressBook, {granted, error in
                if granted{
                    println("User Granted")
                    contactData.getContacts()
                }
            })
            
        }
        
        else if (ABAddressBookGetAuthorizationStatus() == ABAuthorizationStatus.Authorized){
            println("granted before!")
            contactData.getContacts()
        }
        
        else if (ABAddressBookGetAuthorizationStatus() == ABAuthorizationStatus.Denied){
            println("access denied or no access to addressbook")
            contactData.getContacts()
        }
        
        
        
        
//        var textField = UITextField()
//        textField.frame = CGRectMake(10, 10, 500, 2000)
//        textField.backgroundColor = UIColor.blueColor()
//        textField.text = contactData.string
//        
//        self.view.addSubview(textField)
        
        
        //getContacts()

        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





























