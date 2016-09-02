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

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

class Settings {
	static var shared = Settings()
	
	func load() -> Bool {
		sleep(10)
		return true
	}
}
