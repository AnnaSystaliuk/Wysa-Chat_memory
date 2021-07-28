//
//  WysaTestingUITests.swift
//  WysaTestingUITests
//
//  Created by Anna on 7/17/21.
//

import XCTest

enum AgeGroup {
    case teenage
    case adult
    case elder
}

enum Gender {
    case female
    case male
}

enum Problem: String, CaseIterable{
    case angerManagement
    case anxiety
    case griefAndLoss
    case relationshipProblems
    
    var rawValue: String {
        switch self {
        case .angerManagement:
            return "Anger"
        case .anxiety:
            return "Anxiety"
        case .griefAndLoss:
            return "Grief"
        case .relationshipProblems:
            return "Relationship"
        }
    }
    
}

func problemKeywords(for problem: Problem) -> [String]{
    switch problem {
    case Problem.anxiety:
      return ["distress", "anxious", "anxiety", "overwhelm", "feeling"]
    case Problem.angerManagement:
      return ["angry","distress"]
    case Problem.relationshipProblems:
        return ["relationship", "complicated", "overwhelming"]
    case Problem.griefAndLoss:
        return ["grief", "loss", "sad"]
    }
    
}

struct Conversation: Equatable{
    var queries = [String]()
}

var queries =
    [
        ["I am so angry", "I want to hit the wall", "How can I manage that?"],
        ["I am feeling anxious", "My heart is racing so fast", "I don't know how to deal with this"],
        ["My parents don't understand me", "I'm trying to tell them I'm grown up", "Who are you?", "They keep annoying me"],
        ["I am so nervous about tomorrow", "I'm giving a speech and I'm so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I'm feeling uneasy"],
        ["I had a fight with colleague", "He is so dumb", "I don't know why he said that", "We used to be friends", "Now I don't want to talk to him", "Such a pity", "I guess he was not a good friend"],
        ["I miss my cat", "She was so dear to me", "She passed away a week ago", "I still find her fur", "I can't stop crying"],
        ["If I meet him, I would kill him", "I'm so pissed"],
        ["My head is still boiling with rage"],
        ["My grandkids don't want to visit me", "It makes me sad"],
        ["Same problem as yesterday", "I miss them"],
        ["She is gone", "What should I do without her?"],
        ["I'm so pissed", "I need to calm down", "I am so mad right now", "I'm angry", "I'm furious"],
        ["I am feeling anxious", "I’m having anxiety episode", "What date is today?", "I'm very nervous", "I'm freaking out about this homework", "I’m so nervous, can't focus on doing my schoolwork", "I don't know how to deal with this"],
        ["My parents don't understand me", "I'm trying to tell them to give me space", "They keep annoying me" ],
        ["I’m so annoyed that they treat me like a child", "Should I move out?"],
        ["I am so nervous about tomorrow", "I’m giving a speech and I’m so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I’m feeling uneasy"],
        ["I don't think I can do it"],
        ["I had a fight with colleague", "He is so dumb", "I don't know why he said that" ],
        ["Why is the sky blue?", "I guess he was not a good friend"]
    ]

var finishMemoryRecollectionQueries = ["That's all"]
var answerQuestions = ["Yes", "Alright"]

struct LongTermTestCase {
    var testQueries = [Conversation()]
    var testCaseId : Int?
    var contextId : String?
    var inputId: String?
    var memoryPhrases: [String]?
    var ageGroup: AgeGroup?
    var gender: Gender?
    var problem: Problem?
    var switchTopic = false
    var contextKeywords = [String]()
}
// test case ids: 7, 8, 12, 13, 14


struct ShortTermTestCase {
    var testQueries = Conversation()
    var testCaseId : Int?
    var contextId : String?
    var inputId: String?
    var memoryPhrases: [String]?
    var ageGroup: AgeGroup?
    var gender: Gender?
    var problem: Problem?
    var switchTopic = false
    var contextKeywords = [String]()
}

// test case ids: 1, 2, 3, 4, 5, 6, 9, 10, 11
var shortTermData = [
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I am so angry", "I want to hit the wall", "How can I manage that?"]), testCaseId: 1, memoryPhrases: ["I am so angry", "I want to hit the wall"], ageGroup: AgeGroup.teenage, gender: Gender.male, problem: Problem.angerManagement),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I am feeling anxious", "My heart is racing so fast", "I don't know how to deal with this"]), testCaseId: 2, memoryPhrases: ["I am feeling anxious", "My heart is racing so fast", "I don't know how to deal with this"], ageGroup: AgeGroup.teenage, gender: Gender.female, problem: Problem.anxiety),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["My parents don't understand me", "I'm trying to tell them I'm grown up", "Who are you?", "They keep annoying me"]), testCaseId: 3, memoryPhrases: ["My parents don't understand me", "I'm trying to tell them I'm grown up", "They keep annoying me"], ageGroup: AgeGroup.teenage, gender: Gender.male, problem: Problem.relationshipProblems, switchTopic: true),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I am so nervous about tomorrow", "I'm giving a speech and I'm so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I'm feeling uneasy"]), testCaseId: 4, memoryPhrases: ["I am so nervous about tomorrow", "I'm giving a speech and I'm so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I'm feeling uneasy"], ageGroup: AgeGroup.adult, gender: Gender.female, problem: Problem.anxiety),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I had a fight with colleague", "He is so dumb", "I don't know why he said that", "We used to be friends", "Now I don't want to talk to him", "Such a pity", "I guess he was not a good friend"]),testCaseId: 5, memoryPhrases: ["I had a fight with colleague", "He is so dumb", "I don't know why he said that", "We used to be friends", "Now I don't want to talk to him", "Such a pity", "I guess he was not a good friend"], ageGroup: AgeGroup.adult, gender: Gender.male, problem: Problem.relationshipProblems),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I miss my cat", "She was so dear to me", "She passed away a week ago", "I still find her fur", "I can't stop crying"]),testCaseId: 6, memoryPhrases: ["I miss my cat", "She was so dear to me", "She passed away a week ago", "I still find her fur", "I can't stop crying"], ageGroup: AgeGroup.adult, gender: Gender.female, problem: Problem.griefAndLoss),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["She is gone", "What should I do without her?"]),testCaseId: 9, memoryPhrases: ["She is gone", "What should I do without her?"], ageGroup: AgeGroup.elder, gender: Gender.male, problem: Problem.griefAndLoss),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I'm so pissed", "I need to calm down", "I am so mad right now", "I'm angry", "I'm furious"]),testCaseId: 10, memoryPhrases: ["I'm so pissed", "I need to calm down", "I am so mad right now", "I'm angry", "I'm furious"], ageGroup: AgeGroup.teenage, gender: Gender.male, problem: Problem.angerManagement),
    ShortTermTestCase.init(testQueries: Conversation(queries: ["I am feeling anxious", "I’m having anxiety episode", "What date is today?", "I'm very nervous", "I'm freaking out about this homework", "I’m so nervous, can't focus on doing my schoolwork", "I don't know how to deal with this"]),testCaseId: 11, memoryPhrases: ["I am feeling anxious", "I’m having anxiety episode", "What date is today?", "I'm very nervous", "I'm freaking out about this homework", "I’m so nervous, can't focus on doing my schoolwork", "I don't know how to deal with this"], ageGroup: AgeGroup.adult, gender: Gender.female, problem: Problem.anxiety, switchTopic: true)
]

// test case ids: 7, 8, 12, 13, 14
var longTermData = [
    LongTermTestCase.init(testQueries: [Conversation(queries: ["If I meet him, I would kill him", "I'm so pissed"]),Conversation(queries: ["My head is still boiling with rage"])], testCaseId: 7, memoryPhrases: ["I am so angry", "I want to hit the wall", "My head is still boiling with rage"], ageGroup: AgeGroup.adult, gender: Gender.male, problem: Problem.angerManagement),
    LongTermTestCase.init(testQueries: [Conversation(queries: ["My grandkids don't want to visit me", "It makes me sad"]), Conversation(queries: ["Same problem as yesterday", "I miss them"])], testCaseId: 8, memoryPhrases: ["My grandkids don't want to visit me", "It makes me sad", "I miss them"], ageGroup: AgeGroup.elder, gender: Gender.female, problem: Problem.relationshipProblems),
    LongTermTestCase.init(testQueries: [Conversation(queries: ["My parents don't understand me", "I'm trying to tell them to give me space", "They keep annoying me" ]), Conversation(queries: ["I’m so annoyed that they treat me like a child", "Should I move out?"])], testCaseId: 12, memoryPhrases: ["My parents don't understand me", "I'm trying to tell them to give me space", "They keep annoying me","I’m so annoyed that they treat me like a child"], ageGroup: AgeGroup.teenage, gender: Gender.male, problem: Problem.relationshipProblems),
    LongTermTestCase.init(testQueries: [Conversation(queries: ["I am so nervous about tomorrow", "I’m giving a speech and I’m so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I’m feeling uneasy"]), Conversation(queries: ["I don't think I can do it"])], testCaseId: 13, memoryPhrases: ["I am so nervous about tomorrow", "I’m giving a speech and I’m so anxious", "Everyone will laugh at me", "What if I forget my speech?", "I’m feeling uneasy","I don't think I can do it" ], ageGroup: AgeGroup.adult, gender: Gender.female, problem: Problem.anxiety),
    LongTermTestCase.init(testQueries: [Conversation(queries: ["I had a fight with colleague", "He is so dumb", "I don't know why he said that" ]), Conversation(queries: ["Why is the sky blue?", "I guess he was not a good friend"])], testCaseId: 14, memoryPhrases: ["I had a fight with colleague", "He is so dumb", "I don't know why he said that","I guess he was not a good friend" ], ageGroup: AgeGroup.adult, gender: Gender.male, problem: Problem.relationshipProblems,switchTopic: true)
]


class WysaTestingUITests: XCTestCase {
    let wysaApp = XCUIApplication(bundleIdentifier: "bot.touchkin")
    
    var recognizedTextField: XCUIElement?
    
    var shortTermProblemsPassingStats: [String: (Double, Double)] = [:]
    var shortTermSwitchPassingStats: [Bool: (Double, Double)] = [:]

    var longTermProblemsPassingStats: [String: (Double, Double)] = [:]
    var longTermSwitchPassingStats: [Bool: (Double, Double)] = [:]


    func launchWysaApp() {
            wysaApp.launch()
            wait(for: [], timeout: 1.5)
            wysaApp.activate()
        }
        
    func tapOnSkip() {
        let skipButton = wysaApp.buttons.element
        skipButton.tap()
    }
    
    func tapOnTalkIcon() {
        wait(for: 2.0)
        tapCoordinate(xCoordinate: 40, yCoordinate: 140)
    }
   
    
    func send(text: String) {
       
        if recognizedTextField == nil {
            recognizedTextField = wysaApp.textViews.element(boundBy: 0)
        }
        
        while !recognizedTextField!.isHittable {
            sleep(1)
        }
        
        recognizedTextField!.tap()
        wait(for: 1.0)
        
        UIPasteboard.general.string = text
        tapCoordinate(xCoordinate: 267, yCoordinate: 541)
        wait(for: 1.0)
        tapCoordinate(xCoordinate: 53, yCoordinate: 515)
        wait(for: 1.0)
        tapCoordinate(xCoordinate: 408, yCoordinate: 543)
        wait(for: 1.0)
        while !recognizedTextField!.isHittable {
            sleep(1)
        }
    }
    
    func conversations() -> [String] {
        
        var str: [String] = []

        for i in 0..<wysaApp.staticTexts.count {
            if let text = wysaApp.staticTexts.element(boundBy: i).value as? String {
                if text.count > 0 && !text.starts(with: "You said") {
                    str.append(text)
                }
            }
        }
        
        return str
    }
    
    func thouhgList() -> [String] {
        
        var str: [String] = []

        for i in 0..<wysaApp.textViews.count {
            if let text = wysaApp.textViews.element(boundBy: i).value as? String {
                if text.count > 0 && text != "Your Thought List" && !str.contains(text) {
                    str.append(text)
                }
            }
        }
        
        return str
        
    }
    
    
    func testPerformShortTermMemoryTests() {
        
        shortTermSwitchPassingStats[true] = (0,0)
        shortTermSwitchPassingStats[false] = (0,0)

        for problem in Problem.allCases {
            shortTermProblemsPassingStats[problem.rawValue] = (0, 0)
        }
        
        for test in shortTermData{
            launchWysaApp()
            tapOnSkip()
            tapOnTalkIcon()
            for query in test.testQueries.queries {
                send(text: query)
            }
            
            for query in finishMemoryRecollectionQueries {
                send(text: query)
            }
            
            let passKeywordcheck = passKeywordCheck(conversation: conversations(), test: test)
            let thoughtsList = thouhgList()
            let passthoughtsListcheck = !thoughtsList.isEmpty

            var result: String = ""
            
            if passKeywordcheck {
                shortTermProblemsPassingStats[test.problem!.rawValue]!.0 += 1
                shortTermSwitchPassingStats[test.switchTopic]!.0 += 1
            }
            
            if passthoughtsListcheck {
                shortTermProblemsPassingStats[test.problem!.rawValue]!.1 += 1
                shortTermSwitchPassingStats[test.switchTopic]!.1 += 1
            }
            
            result.append("⠀Test Case [\(test.testCaseId!)]: ")
            result.append((passKeywordcheck ? "✅ Passed keyword check" : "❌ Failed keyword check"))
            result.append("⠀")
            result.append((passthoughtsListcheck ? "✅ Passed thoughts list" : "❌ Failed thoughts list"))
            result.append("⠀")

            print(result)

        }
        
        shortTermProblemsPassingStats.keys.forEach({ key in
            let totalProblems = shortTermData.filter({$0.problem!.rawValue == key}).count
            shortTermProblemsPassingStats[key]!.0 = (shortTermProblemsPassingStats[key]!.0 / Double(totalProblems)) * 100.0
            shortTermProblemsPassingStats[key]!.1 = (shortTermProblemsPassingStats[key]!.1 / Double(totalProblems)) * 100.0
        })
        
        var problemsResult: String = ""
        problemsResult.append("⠀Problems passing percentage: ")
        shortTermProblemsPassingStats.forEach({ key, value in
            let totalProblems = shortTermData.filter({$0.problem!.rawValue == key}).count
            problemsResult.append("\(key)(\(totalProblems)⠀(Keyword: %\(value.0))⠀(Thoughts: %\(value.1)) ")
        })
        problemsResult.append("⠀")
        
        print(problemsResult)
        
        
        shortTermSwitchPassingStats.keys.forEach({ key in
            let totalProblems = shortTermData.filter({$0.switchTopic == key}).count
            shortTermSwitchPassingStats[key]!.0 = (shortTermSwitchPassingStats[key]!.0 / Double(totalProblems)) * 100.0
            shortTermSwitchPassingStats[key]!.1 = (shortTermSwitchPassingStats[key]!.1 / Double(totalProblems)) * 100.0
        })
        
        var switchsResult: String = ""
        switchsResult.append("⠀Switch passing percentage: ")
        shortTermSwitchPassingStats.forEach({ key, value in
            let totalProblems = shortTermData.filter({$0.switchTopic == key}).count
            switchsResult.append("\(key)(\(totalProblems)⠀(Keyword: %\(value.0))⠀(Thoughts: %\(value.1)) ")
        })
                switchsResult.append("⠀")
        
        print(switchsResult)

        
    }
    
    func passKeywordCheck(conversation: [String], test: ShortTermTestCase) -> Bool {
        let keywords = problemKeywords(for: test.problem!)
        for keyword in keywords {
            if conversation.contains(where: {word in word.contains(keyword)}) { return true}
        }
        
        return false
    }
    
    
    func passKeywordCheck(conversation: [String], test: LongTermTestCase) -> Bool {
        let keywords = problemKeywords(for: test.problem!)
        for keyword in keywords {
            if conversation.contains(where: {word in word.contains(keyword)}) { return true }
        }
        
        return false
    }
    
    func testPerformLongTermMemoryTests() {
        
        longTermSwitchPassingStats[true] = (0,0)
        longTermSwitchPassingStats[false] = (0,0)
        
        for problem in Problem.allCases {
            longTermProblemsPassingStats[problem.rawValue] = (0, 0)
        }
        
        for test in longTermData{
            for conversation in test.testQueries {
                launchWysaApp()
                tapOnSkip()
                tapOnTalkIcon()
                for query in conversation.queries{
                    send(text: query)
                }
                
                
                if conversation == test.testQueries.last {
                    for query in finishMemoryRecollectionQueries {
                        send(text: query)
                    }
                    
                    let passKeywordcheck = passKeywordCheck(conversation: conversations(), test: test)
                    let thoughtsList = thouhgList()
                    let passthoughtsListcheck = !thoughtsList.isEmpty

                    var result: String = ""
                    
                    if passKeywordcheck {
                        longTermProblemsPassingStats[test.problem!.rawValue]!.0 += 1
                        longTermSwitchPassingStats[test.switchTopic]!.0 += 1
                    }
                    
                    if passthoughtsListcheck {
                        longTermProblemsPassingStats[test.problem!.rawValue]!.1 += 1
                        longTermSwitchPassingStats[test.switchTopic]!.1 += 1
                    }
                    
                    result.append("⠀Test Case [\(test.testCaseId!)]: ")
                    result.append((passKeywordcheck ? "✅ Passed keyword check" : "❌ Failed keyword check"))
                    result.append("⠀")
                    result.append((passthoughtsListcheck ? "✅ Passed thoughts list" : "❌ Failed thoughts list"))
                    result.append("⠀")

                    print(result)
                }
               
            }
        }
        
        
        longTermProblemsPassingStats.keys.forEach({ key in
            let totalProblems = longTermData.filter({$0.problem!.rawValue == key}).count
            longTermProblemsPassingStats[key]!.0 = (longTermProblemsPassingStats[key]!.0 / Double(totalProblems)) * 100.0
            longTermProblemsPassingStats[key]!.1 = (longTermProblemsPassingStats[key]!.1 / Double(totalProblems)) * 100.0
        })
        
        var problemsResult: String = ""
        problemsResult.append("⠀Problems passing percentage: ")
        longTermProblemsPassingStats.forEach({ key, value in
            let totalProblems = longTermData.filter({$0.problem!.rawValue == key}).count
            problemsResult.append("\(key)(\(totalProblems)⠀(Keyword: %\(value.0))⠀(Thoughts: %\(value.1)) ")
        })
        problemsResult.append("⠀")
        
        print(problemsResult)
        
        
        longTermSwitchPassingStats.keys.forEach({ key in
            let totalProblems = longTermData.filter({$0.switchTopic == key}).count
            longTermSwitchPassingStats[key]!.0 = (longTermSwitchPassingStats[key]!.0 / Double(totalProblems)) * 100.0
            longTermSwitchPassingStats[key]!.1 = (longTermSwitchPassingStats[key]!.1 / Double(totalProblems)) * 100.0
        })
        
        var switchsResult: String = ""
        switchsResult.append("⠀Switch passing percentage: ")
        longTermSwitchPassingStats.forEach({ key, value in
            let totalProblems = longTermData.filter({$0.switchTopic == key}).count
            switchsResult.append("\(key)(\(totalProblems)⠀(Keyword: %\(value.0))⠀(Thoughts: %\(value.1)) ")
        })
                switchsResult.append("⠀")
        
        print(switchsResult)
    }

    func tapCoordinate(xCoordinate: Double, yCoordinate: Double) {
            let normalized = wysaApp.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
            coordinate.tap()
        }
    
    func wait(for time: Double) {
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: time)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    
    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = expectation(for: predicate, evaluatedWith: element,
                                      handler: nil)

        let result = XCTWaiter().wait(for: [expectation], timeout: 50.0)
        return result == .completed
    }
}
