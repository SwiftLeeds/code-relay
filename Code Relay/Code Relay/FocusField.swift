//
//  FocusField.swift
//  Code Relay
//
//  Created by Petter vang Brakalsvålet on 09/10/2024.
//

enum FocusField: String, Identifiable {
    case title = "title"
    case details = "details"
    case lat = "lat"
    case long = "long"
    case phoneNumber = "phoneNumber"
    
    var id: String { rawValue }
    
    var next: FocusField? {
        switch self {
        case .title:
                .details
        case .details:
                .lat
        case .lat:
                .long
        case .long:
                .phoneNumber
        case .phoneNumber:
            nil
        }
    }
}
