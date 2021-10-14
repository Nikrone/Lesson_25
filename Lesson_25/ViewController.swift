//
//  ViewController.swift
//  Lesson_25
//
//  Created by Evgeniy Nosko on 13.10.21.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactViewControllerDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    let contactStore = CNContactStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        локализация приложения (с аргументами)(Localizable.strings)
        textLabel.text = String(format:
                                    NSLocalizedString("ViewController.HelloThisIsTestApp%@", comment: ""
                                                     ), locale: Locale.current, arguments: ["Zhenya"])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        let contactsVC = CNContactPickerViewController()
        //        contactsVC.delegate = self
        //        navigationController?.present(contactsVC, animated: true, completion: nil)
        
        let keys: [CNKeyDescriptor] = [CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactGivenNameKey as CNKeyDescriptor, CNContactNameSuffixKey as CNKeyDescriptor]
        let predicate = NSPredicate(format: "phoneNumbers.@count > 0")
        let contacts = try? contactStore.unifiedContacts(matching: predicate, keysToFetch: keys)
        
        
        
//        создание контактов
        let saveRequest = CNSaveRequest()
        let newContact = CNMutableContact()
        newContact.phoneNumbers.append(CNLabeledValue(
            label: CNLabelPhoneNumberMain,
            value: CNPhoneNumber(stringValue: "+37529566454543"
                                )
        )
        )
        newContact.givenName = "Zhenya"
        saveRequest.add(newContact, toContainerWithIdentifier: nil)
        
        try? contactStore.execute(saveRequest)
    }
    
}

//extension ViewController: CNContactPickerDelegate {
//
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//        let contactDetailsVC = CNContactViewController(for: contact)
//        contactDetailsVC.allowsEditing = true
//        contactDetailsVC.allowsActions = true
//        contactDetailsVC.delegate = self
//        navigationController?.pushViewController(contactDetailsVC, animated: true)
//
//    }
//
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
//
//    }
//
//}

