//
//  main.swift
//  Delegate and protocol
//
//  Created by Yiheng Quan on 10/7/20.
//  Copyright © 2020 Yiheng Quan. All rights reserved.
//


protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSitutation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        // This connects everything
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic did CPR")
    }
}

class Doctor : AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        // This connects everything
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor did CPR")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon : Doctor {
    
}

let henry = EmergencyCallHandler()
let mario = Paramedic(handler: henry)

henry.assessSitutation()
henry.medicalEmergency()
