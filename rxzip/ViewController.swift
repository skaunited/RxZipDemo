//
//  ViewController.swift
//  rxzip
//
//  Created by Skander Bahri on 09/09/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var firstSubject = BehaviorSubject<String>(value: "")
    var secondSubject = BehaviorSubject<String>(value: "")
    var thirdSubject = BehaviorSubject<String>(value: "")
    
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        typealias trippleString = (first: String, second: String, third: String)
        var zipped = Observable<trippleString>.zip(firstSubject, secondSubject, thirdSubject) {
            return ($0, $1, $2)
        }
        
        zipped.skip(1).subscribe(onNext: {[weak self] model in
            self?.result.text = "all buttons are clicked"
        })
    }

    @IBAction func first(_ sender: Any) {
        thirdSubject.onNext("thirdSubject")
    }
    
    @IBAction func second(_ sender: Any) {
        secondSubject.onNext("secondSubject")
    }
    
    @IBAction func third(_ sender: Any) {
        firstSubject.onNext("firstSubject")
    }
}

