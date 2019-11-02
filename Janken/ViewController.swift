//
//  ViewController.swift
//  Janken
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    
    var cpuSign = Sign.rock
    
    @IBOutlet weak var judge: UILabel!
    @IBOutlet weak var cpuSignLabel: UILabel!
    @IBOutlet weak var playerSignLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rockButton(_ sender: Any) {
        cpuSign = randomSign()
        judge.text = gameJudge(player: Sign.rock, cpu: cpuSign).rawValue
        cpuSignLabel.text = cpuSign.rawValue
        playerSignLabel.text = Sign.rock.rawValue
        
    }
    
    @IBAction func ScissorsButton(_ sender: Any) {
    cpuSign = randomSign()
    judge.text = gameJudge(player: Sign.scissors, cpu: cpuSign).rawValue
    cpuSignLabel.text = cpuSign.rawValue
    playerSignLabel.text = Sign.scissors.rawValue
    
    }
 
    @IBAction func PaperButton(_ sender: Any) {
    cpuSign = randomSign()
    judge.text = gameJudge(player: Sign.paper, cpu: cpuSign).rawValue
    cpuSignLabel.text = cpuSign.rawValue
    playerSignLabel.text = Sign.paper.rawValue
    
    }
    
    
    enum GameState: String{
        case start = "START"
        case win = "あなたの勝ち"
        case lose = "あなたの負け"
        case draw = "あいこ"
    }

    enum Sign: String{
        case rock = "✊"
        case scissors = "✌️"
        case paper = "✋"
    }

    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
    func randomSign() -> Sign{
        let sign = randomChoice.nextInt()
        if sign == 0{
            return .rock
            
        }else if sign == 1{
            return .paper
            
        }else{
            return .scissors
            
        }
    }

    //let playerSign = randomSign()
    //let cpuSign = randomSign()

    //print(cpuSign)
    //print(playerSign)

    func gameJudge(player:Sign, cpu:Sign) -> GameState{
        if(player == .rock && cpu == .scissors){
            //print("win")
            return GameState.win
        }
        if(player == .scissors && cpu == .paper){
            //print("win")
            return GameState.win
        }
        if(player == .paper && cpu == .rock){
            //print("win")
            return GameState.win
        }
        
        
        if(player == .rock && cpu == .paper){
            //print("lose")
            return GameState.lose
        }
        if(player == .scissors && cpu == .rock){
            //print("lose")
            return GameState.lose
        }
        if(player == .paper && cpu == .scissors){
            //print("lose")
            return GameState.lose
        }

        if(player == cpu){
            //print("draw")
            return GameState.draw
        }
        
        return GameState.start
        
    }

    //gameJudge(player:playerSign, cpu:cpuSign)





    
}

