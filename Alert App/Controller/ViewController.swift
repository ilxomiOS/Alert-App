
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var addTwoNumberLabel: UILabel!
    @IBOutlet weak var guesTheNumberLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var addTwoNumberButton: UIButton!
    @IBOutlet weak var guessNumberButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    let model = Reverse()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.isHidden = true
        
        addTwoNumberLabel.textColor = .green
        addTwoNumberButton.layer.cornerRadius = 10
        addTwoNumberLabel.isHidden = true
        
        guesTheNumberLabel.textColor = .green
        guessNumberButton.layer.cornerRadius = 10
        guesTheNumberLabel.isHidden = true
        
        startLabel.textColor = .green
        startLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alertController = UIAlertController(title: "Hello", message: "Enter Your name", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.greetingLabel.isHidden = false
            let text = alertController.textFields?.first?.text
            self.greetingLabel.text = "Hello \(text ?? "User")"
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
    
    @IBAction func addTwoNumberPressed() {
        let alertController = UIAlertController(title: "Add Two Number", message: "Enter two Number", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.addTwoNumberLabel.isHidden = false
            let firstNumber = Int(alertController.textFields?.first?.text ?? "0")
            let secondNumber = Int(alertController.textFields?.last?.text ?? "0")
            let sum = (firstNumber ?? 0) + (secondNumber ?? 0)
            
            self.addTwoNumberLabel.text = "\(firstNumber ?? 0) + \(secondNumber ?? 0) = \(sum)"
        }
        
        alertController.addTextField()
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    @IBAction func guessTheNumberPressed() {
        let alertController = UIAlertController(title: "Game", message: "Guess the number from 1 to 5", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.guesTheNumberLabel.isHidden = false
            let randomNumber = String(Int.random(in: 1...5))
            let guessedNumber = alertController.textFields?.first?.text
            
            let guess = randomNumber == guessedNumber ? "Congratulations! You guessed right." : "You didn't guess. It was the number \(randomNumber)"
            
            self.guesTheNumberLabel.text = guess
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    @IBAction func startButtonPressed() {
        let alertController = UIAlertController(title: "Game", message: "Enter word", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.startLabel.isHidden = false
            let word = alertController.textFields?.first?.text
            
            self.startLabel.text = self.model.reverseString(word ?? "")
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
    
}

