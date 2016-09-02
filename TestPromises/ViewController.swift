//
//  ViewController.swift
//  TestPromises
//
//  Created by Shane Whitehead on 2/9/16.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

	@IBOutlet weak var toggle: UISwitch!
	@IBOutlet weak var activity: UIActivityIndicatorView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func makeItSo(_ sender: AnyObject) {
		activity.startAnimating()
		
		_ = firstly { () -> Promise<Bool> in
				Settings.shared.promoise()
			}.then(execute: { (result: Bool) -> Void in
				print(result)
				self.toggle.isOn = result
			}).always {
				self.activity.stopAnimating()
		}
	}

}

class Settings {
	static var shared = Settings()
	
	func load() -> Bool {
		for index in 0..<10 {
			print(index)
			sleep(1)
		}
		return true
	}
	
	func promoise() -> Promise<Bool> {
		return Promise<Bool> { (fulfill, error) in
			DispatchQueue.global().async {
				let result = self.load()
				fulfill(result)
			}
		}
	}
}
