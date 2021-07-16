//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class WorldsExpoViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var introductionImageView: UIImageView!
    @IBOutlet weak private var visitorCountLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        queryData()
        navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK:- Bind data with contents
extension WorldsExpoViewController {
    private func queryData() {
        let expoIntroductionFileName = "exposition_universelle_1900"
        let parsedResult = ParsingManager.shared.parse(from: expoIntroductionFileName, to: ExpoIntroduction.self)
        
        switch parsedResult {
        case .success(let introductionContents):
            bind(with: introductionContents)
        case .failure(let parsingError):
            showAlert(error: parsingError)
        }
    }
    
    private func bind(with introductionContents: ExpoIntroduction) {
        titleLabel.text = addNewLine(to: introductionContents.title)
        visitorCountLabel.text = [addCountingUnit, addColonPrefix].reduce(addThousandUnitComma(to: introductionContents.visitors)) {
            $1($0)
        }
        locationLabel.text = addColonPrefix(to: introductionContents.location)
        durationLabel.text = addColonPrefix(to: introductionContents.duration)
        descriptionTextView.text = introductionContents.description
    }
    
    private func addColonPrefix(to sentence: String) -> String {
        let prefix = ": "
        return prefix + sentence
    }
    
    private func addCountingUnit(to sentence: String) -> String {
        let countingUnit = " 명"
        return sentence + countingUnit
    }
    
    private func addNewLine(to sentence: String) -> String {
        let openingParenthesis: Character = "("
        var sentence = sentence
        if let lineBreakingIndex = sentence.firstIndex(of: openingParenthesis) {
            let newline: Character = "\n"
            sentence.insert(newline, at: lineBreakingIndex)
        }
        return sentence
    }
    
    private func addThousandUnitComma(to number: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let formattedNumber = numberFormatter.string(for: number) {
            return formattedNumber
        }
        return number.description
    }
}

//MARK:- Fix Orientation
extension WorldsExpoViewController: UINavigationControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return navigationController.visibleViewController?.supportedInterfaceOrientations ?? .all
    }
}
