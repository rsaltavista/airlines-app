//
//  FilterOption.swift
//  Airlines
//
//  Created by Ricardo Altavista on 10/10/24.
//
import Foundation

enum FilterOption: Int, CaseIterable {
    case all
    case concluded
    case cancelled
    case onSchedule
    case onTravel
    
    var title: String {
        switch self {
        case .all: return "Todos"
        case .concluded: return "Concluídos"
        case .cancelled: return "Cancelados"
        case .onSchedule: return "Programados"
        case .onTravel: return "Em Viagem"
        }
    }
}
