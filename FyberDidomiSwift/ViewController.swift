//
//  ViewController.swift
//  FyberDidomiSwift
//
//  Created by Mathieu Bouissiere on 08/07/2019.
//  Copyright © 2019 AKB. All rights reserved.
//

import UIKit
import Didomi

class ViewController: UIViewController {
    
    @IBOutlet weak var consentStringLabel: UITextView?
    
    @IBAction func didomiForceShowNotice(sender: UIButton) {
        Didomi.shared.forceShowNotice()
    }
    
    @IBAction func didomiForceResetConsent(sender: UIButton) {
        Didomi.shared.reset()
        consentStringLabel?.text = "-"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        consentStringLabel?.text = UserDefaults.standard.string(forKey: "IABConsent_ConsentString")
        Didomi.shared.setupUI(containerController: self)
        let didomiEventListener = EventListener()
        
        /*didomiEventListener.onNoticeClickAgree = { event in
            // Hide your consent notice
            self.consentStringLabel?.text = UserDefaults.standard.string(forKey: "IABConsent_ConsentString")
        }*/
        
        didomiEventListener.onConsentChanged = { event in
            // Hide your consent notice
            self.consentStringLabel?.text = UserDefaults.standard.string(forKey: "IABConsent_ConsentString")
            self.adjustUITextViewHeight(arg: self.consentStringLabel!)
        }
        
        adjustUITextViewHeight(arg: self.consentStringLabel!)
        
        //didomiEventListener.onNoticeClickAgree
        Didomi.shared.addEventListener(listener: didomiEventListener)
    }

    func adjustUITextViewHeight(arg : UITextView)
    {
        //arg.translatesAutoresizingMaskIntoConstraints = true
        //arg.sizeToFit()
        //arg.isScrollEnabled = false
    }

}

