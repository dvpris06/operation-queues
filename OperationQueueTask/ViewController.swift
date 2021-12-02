//
//  ViewController.swift
//  OperationQueueTask
//
//  Created by Dmitry Prisyazhnyuk on 02.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myClass = MyClass(fetcher: MyFetcher())
        let myIds = Array(0...100)
        myClass.downloadTitles(with: myIds) { titles in
            print(titles)
        }
    }
}

