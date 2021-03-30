//
//  ValidatorFactory.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - Strings
//
private enum Strings {
    static var required: String { "Required" }
    static var invalidEmail: String { "Invalid e-mail Address" }
    static var invalidPassword: String { "Invalid password. At least 8 characters are required." }

}

// MARK: - ValidationError
//
class ValidationError: LocalizedError {
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    static func required(_ fieldName: String) -> ValidationError {
        let message = "\"\(fieldName)\" \(Strings.required)"
        return ValidationError(message)
    }
    
    var errorDescription: String? {
        return message
    }
}

// MARK: - ValidatorConvertible
protocol ValidatorConvertible {
  func validated(_ value: String?) throws -> String
}

// MARK: - ValidatorType
enum ValidatorType {
    case requiredField(field: String)
    case email
    case password
}

// MARK: - VaildatorFactory
enum ValidatorFactory {
  static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
    switch type {
    case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
    case .email: return EmailValidator()
    case .password: return PasswordValidator()

    }
  }
}

// MARK: - Helpers
//
func firstMatch(_ value: String, in pattern: String) -> NSTextCheckingResult? {
  let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
  let range = NSRange(location: 0, length: value.count)
  return regex?.firstMatch(in: value, options: [], range: range)
}

// MARK: - Validators
//
private struct RequiredFieldValidator: ValidatorConvertible {
  private let fieldName: String
  
  init(_ field: String) {
    fieldName = field
  }
  
  func validated(_ value: String?) throws -> String {
    guard let value = value, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        throw ValidationError(Strings.required + " " + fieldName)
    }
    return value
  }
}

private struct PunctuationFilterValidator: ValidatorConvertible {
  private let fieldName: String
  
  init(_ field: String) {
    fieldName = field
  }
  
  func validated(_ value: String?) throws -> String {
    guard let value = value, firstMatch(value, in: "[[:punct:]]") == nil,
      value.count > .zero,
      value.count < 30 else {
        throw ValidationError.required(fieldName)
    }
    return value
  }
}

private struct EmailValidator: ValidatorConvertible {
  func validated(_ value: String?) throws -> String {
    guard let value = value, firstMatch(value, in: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$") != nil else {
        throw ValidationError(Strings.invalidEmail)
    }
    return value
  }
}

private struct PasswordValidator: ValidatorConvertible {
  func validated(_ value: String?) throws -> String {
        guard let value = value, firstMatch(value, in: "^.{8,25}$") != nil else {
            throw ValidationError(Strings.invalidPassword)
        }
    return value
  }
}
