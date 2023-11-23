//
//  ViewController.swift
//  salidesRGB
//
//  Created by Eric Rojas Pech on 30/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
}
    
    @IBAction func resetPressed(_ sender: UIButton) {
        rSlider.value = 43
        gSlider.value = 127
        bSlider.value = 127
        rLabel.text = "43"
        gLabel.text = "127"
        bLabel.text = "127"
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
    }
    
    @IBAction func rSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        rLabel.text = String(Int(round(rSlider.value)))
        if view.backgroundColor == .black{
            rLabel.textColor = .white
        }
    }
    
    
    @IBAction func gSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        gLabel.text = String(Int(round(gSlider.value)))
        if view.backgroundColor == .black{
            gLabel.textColor = .white
        }
    }
    
    @IBAction func bSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        bLabel.text = String(Int(round(bSlider.value)))
        if view.backgroundColor == .black{
            bLabel.textColor = .white
        }
        
    
    }
    
    
    @IBAction func copyButtonPressed(_ sender: UIButton) {
        copyRGBToClipboard()
        vibrateHaptic(style: .success)

    }
    
    func copyRGBToClipboard() {
            let redValue = Int(round(rSlider.value))
            let greenValue = Int(round(gSlider.value))
            let blueValue = Int(round(bSlider.value))
            
            let rgbCode = String(format: "RGB(%d, %d, %d)", redValue, greenValue, blueValue)
            
            UIPasteboard.general.string = rgbCode
            
            let alert = UIAlertController(title: "Copied to Clipboard!", message: "RGB code has been copied.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    func vibrateHaptic(style: UINotificationFeedbackGenerator.FeedbackType) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(style)
        }


}

