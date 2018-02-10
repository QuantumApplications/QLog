//
//  AppCodeLogger.swift
//  QLog
//
//  Created by Christian Oberdörfer on 09.02.18.
//  Copyright © 2018 Quantum. All rights reserved.
//

let escape  = "\u{001b}"
let ansiBold  = "1m"
let ansiReset = "0m"
let ansiBoldSequence = "\(escape)[\(ansiBold)"
let ansiResetSequence = "\(escape)[\(ansiReset)"

extension LogLevel {

    var ansiColor: String {
        switch self {
        case .highlight:
            return "35m"
        case .debug:
            return "34m"
        case .info:
            return "32m"
        case .warning:
            return "33m"
        case .error:
            return "31m"
        }
    }

    var ansiColorSequence: String {
        return "\(escape)[\(self.ansiColor)"
    }

}

public class AppCodeLogger: Logger {

    let ansiTextColor = "37m"

    var ansiTextSequence: String {
        return "\(escape)[\(ansiTextColor)"
    }

    public override init(logLevel: LogLevel = .highlight) {
        super.init(logLevel: logLevel)
    }

    override func doLog(_ logEntry: LogEntry) {
        print("\(ansiBoldSequence)\(ansiTextSequence)\(logEntry.metaText)\(ansiBoldSequence)\(logEntry.logLevel.ansiColorSequence)\(logEntry.text)\(ansiResetSequence)")
    }

}