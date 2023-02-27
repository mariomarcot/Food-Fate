//
//  Recipe.swift
//  Food Fate
//
//  Created by Mario Tromba on 14/01/23.
//

import UIKit

enum RecipeServiceError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidResponse(statusCode: Int)
    case noData
    case decodingError
    case unknown
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        case .taskError:
            return "A requisição não pode ser executada"
        case .noResponse:
            return "O servidor não respondeu"
        case .invalidResponse(let statusCode):
            return "Resposta inválida. Código do erro: \(statusCode)"
        case .noData:
            return "Sem dados retornados"
        case .decodingError:
            return "Dados inválidos"
        case .unknown:
            return "Erro desconhecido"
        }
    }
}

enum RecipeType: String {
        case mainCourse = "main-course"
        case sideDish = "side-dish"
        case dessert = "dessert"
        case appetizer = "appetizer"
        case salad = "salad"
        case bread = "bread"
        case breakfast = "breakfast"
        case soup = "soup"
        case beverage = "beverage"
        case sauce = "sauce"
        case marinade = "marinade"
        case fingerfood = "fingerfood"
        case snack = "snack"
        case drink = "drink"
}

struct RecipeManager {
    let type = ["main-course", "side-dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
}

final class RecipeService {
    let urlString = "https://api.spoonacular.com/recipes/complexSearch"
    private lazy var session = URLSession(configuration: .default)
    
    func loadRecipe(type: RecipeType, onComplete: @escaping (Result<[Recipe],RecipeServiceError>) -> Void) {
        var url = URLComponents(string: urlString)
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "apiKey", value: "3f9dd299b9f1451a8ca4a2d8d2a4fb40"), URLQueryItem(name: "type", value: type.rawValue)]
        url?.queryItems = queryItems
        guard let url = url?.url else {
            return onComplete(.failure(.badURL))
        }
        session.dataTask(with: url) { data, response, error in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            if !(200 ... 299 ~= response.statusCode) {
                return onComplete(.failure(.invalidResponse(statusCode: response.statusCode)))
            }
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            do {
                let recipes = try JSONDecoder().decode(RecipeData.self, from: data)
                onComplete(.success(recipes.results))
            } catch {
                return onComplete(.failure(.decodingError))
            }
        }.resume()
    }
}
