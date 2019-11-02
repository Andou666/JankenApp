//
//  Sign.swift
//  Janken
//
//  Created by Donkey on 2019/11/02.
//  Copyright © 2019 Donkey. All rights reserved.
//

import GameplayKit

enum GameState: Int{
    case start = 0
    case win = 1
    case lose = 2
    case draw = 3
}

enum Sign: Int{
    case rock = 0
    case scissors = 1
    case paper = 2
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

let playerSign = randomSign()
let cpuSign = randomSign()

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




