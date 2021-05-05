//
//  ConsoleIO.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

enum OutputType {
    case error
    case standard
}

protocol ConsoleProviderProtocol {
    func printMessage(_ message: String, type: OutputType) -> String
}

final class ConsoleProvider: ConsoleProviderProtocol {
    func printMessage(_ message: String, type: OutputType) -> String {
        switch type {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
        return message
    }
}
