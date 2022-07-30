
import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var addTwoNumberLabel: UILabel!
    @IBOutlet weak var guesTheNumberLabel: UILabel!
    @IBOutlet weak var reverseLabel: UILabel!
    
    @IBOutlet weak var addTwoNumberButton: UIButton!
    @IBOutlet weak var guessNumberButton: UIButton!
    @IBOutlet weak var reverseButton: UIButton!
    
    // Model
    let reverse = Reverse()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.isHidden = true
        
        addTwoNumberLabel.textColor = .green
        addTwoNumberLabel.isHidden = true
        addTwoNumberButton.layer.cornerRadius = 10
        
        guesTheNumberLabel.textColor = .green
        guesTheNumberLabel.isHidden = true
        guessNumberButton.layer.cornerRadius = 10
        
        reverseLabel.textColor = .green
        reverseLabel.isHidden = true
        reverseButton.layer.cornerRadius = 10
    }
    
    // MARK: Greeting notification
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        greeting(title: "Hi", message: "What's your name?", style: .actionSheet)
    }
    
    // MARK: IBActions
    @IBAction func addTwoNumberPressed() {
        addTwoNumbers(title: "Game 1", message: "Enter Two Number", style: .alert)
    }
    
    @IBAction func guessTheNumberPressed() {
        guessNumber(title: "Game 2", message: "Guess the number from 1 to 5", style: .alert)
    }
    
    @IBAction func reverseButtonPressed() {
        reverseStr(title: "Game3", message: "Enter Word", style: .alert)
    }
    
    // MARK: Greeting alert func
    
    func greeting(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.greetingLabel.isHidden = false
            let text = alertController.textFields?.first?.text
            self.greetingLabel.text = "Hello \(text ?? "User")"
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
    
    // MARK: Func of adding two numbers
    func addTwoNumbers(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
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
    
    // MARK: Func of guessing numbers
    func guessNumber(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
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
    
    // MARK: Func of line flipping
    func reverseStr(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: "Enter word", preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.reverseLabel.isHidden = false
            let word = alertController.textFields?.first?.text

            self.reverseLabel.text = self.reverse.reverseString(word ?? "")
        }

        alertController.addTextField()
        alertController.addAction(action)

        self.present(alertController, animated: true)
    }
}
