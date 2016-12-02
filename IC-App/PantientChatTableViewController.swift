//
//  PantientChatTableViewController.swift
//  IC-App
//
//  Created by Mike Dongen van on 16/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import UIKit

class PantientChatTableViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var messageVIewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageField: UITextField!
    let messageCenter:MessageCenter = MessageCenter()
    var messageArray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let tabGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PantientChatTableViewController.tableviewTapped))
        chatTableView.addGestureRecognizer(tabGesture)
        
        messageArray.append("Hey, hoe is het?")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            updateViewHeight(height: (keyboardHeight + 60))
            print(keyboardHeight)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        updateViewHeight(height: 60.0)
    }

    func tableviewTapped(){
        messageField.endEditing(true)
    }
    
    @IBAction func Send(_ sender: UIButton) {
        messageCenter.rawSenderData(from: "Mike van Dongen",
                                    withMessage: messageField.text!, withSuccess: {
                                        DispatchQueue.main.async {
                                            self.refresh()
                                        }
                                    }, orFailure:  {(message:String) in
                                        print(message)
        })
        messageField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }

//    @IBAction func Send(_ sender: Any) {
//        messageCenter.rawSenderData(from: "Mike van Dongen", withMessage: messageBox.text!)
//        refresh()
//    }
    
    func updateViewHeight(height:CGFloat){
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            self.messageVIewHeightConstraint.constant = height
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) 
        cell.detailTextLabel?.text = messageCenter.listOfMessages[indexPath.row].message
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageCenter.countMessageList()
    }
    
    
    func refresh(){
        chatTableView.reloadData()
    }
}
