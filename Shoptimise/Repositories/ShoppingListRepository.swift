//
//  ShoppingListRepository.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 22/03/2023.
//

import Foundation
import Combine

protocol ShoppingListRepository
{
    func loadShoppingLists() -> [ShoppingList]
}

struct ShoppingListLocalRepository: ShoppingListRepository
{
    func loadShoppingLists() -> [ShoppingList] {
        let data: Data
        let filename = "shopping_lists.json"

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([ShoppingList].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(ShoppingList.self):\n\(error)")
        }
    }
}
