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

