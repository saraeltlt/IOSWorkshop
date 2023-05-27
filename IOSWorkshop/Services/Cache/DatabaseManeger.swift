//
//  DatabaseManeger.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
import CoreData
import UIKit
class DatabaseManager : DatabaseManegerProtocol{
    let context: NSManagedObjectContext
    static let getInstance=DatabaseManager()
    let credits = credit()
    let tags = ingredient()
    let instructions = instruction()
     private init() {
         
         if let myAppDelegate = UIApplication.shared.delegate as? AppDelegate{
             context = myAppDelegate.persistentContainer.viewContext
         }else{
             context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
         }
         print("single object created")
      }
      func saveMeals(data:Meal,completion : @escaping (Bool)-> Void){
          let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Meals")
          let predicate = NSPredicate(format: "show_id == %d", data.id ?? 0)
          fetchRequest.predicate=predicate
          do{
              let existingMeal = try context.fetch(fetchRequest)
              if existingMeal.isEmpty  {
                  guard let entity=NSEntityDescription.entity(forEntityName: "Meals", in: context) else{return}
                  let meals=NSManagedObject(entity: entity, insertInto: context)
                 // print(data.credits![0].name)
                  meals.setValue(data.credits?[0].name, forKey: "chef_name")
                  meals.setValue(data.tags?[0].display_name, forKey: "display_name")
                  meals.setValue(data.instructions?[0].display_text, forKey: "display_text")
                  meals.setValue(data.credits?[0].type, forKey: "mealType")
                  meals.setValue(data.name, forKey: "name")
                  meals.setValue(data.num_servings, forKey: "num_servings")
                  meals.setValue(data.id, forKey: "show_id")
                  meals.setValue(data.thumbnail_url, forKey: "thumbnail_url")
                  meals.setValue(data.tags?[0].type, forKey: "type")
                  meals.setValue(data.video_url, forKey: "video_url")
                  try  context.save()
                  print("added successfully")
                  completion(true)
              }else{
                  print("The item already exists")
                  completion(false)
              }
              
              }catch{
                  print("an error occured in add")
                  completion(false)
              }
      }
      func deleteMeals(id:Int , completion : @escaping (Bool)-> Void){
          let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Meals")
          let predicate=NSPredicate(format: "show_id == %d",id)
          fetchRequest.predicate=predicate
          do {
              let meals=try context.fetch(fetchRequest)
               context.delete(meals[0])
               try context.save()
              completion(true)
               print("deleted Successfully")
          } catch {
              completion(false)
              print("eroor in delete")
          }
     
      }
   
      func fetchMeals(completion : @escaping ([Meal]?)-> Void){
          var retrievedArray=[Meal]()
          let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Meals")
          do{
              let meals=try context.fetch(fetchRequest)
              for meal in meals {
                  let mealSaved=Meal()
                  mealSaved.id=meal.value(forKey: "show_id") as? Int
                  mealSaved.credits?[0].name=meal.value(forKey: "chef_name") as? String
                  mealSaved.tags?[0].display_name = meal.value(forKey: "display_name") as? String
                  mealSaved.instructions?[0].display_text = meal.value(forKey: "display_text")as? String
                  mealSaved.credits?[0].type = meal.value(forKey: "mealType")as? String
                  mealSaved.name = meal.value(forKey: "name")as? String
                  mealSaved.num_servings = meal.value(forKey: "num_servings") as? Int
                  mealSaved.id = meal.value(forKey: "show_id") as? Int
                  mealSaved.thumbnail_url = meal.value(forKey: "thumbnail_url") as? String
                  mealSaved.tags?[0].type = meal.value(forKey: "type") as? String
                  mealSaved.video_url = meal.value(forKey: "video_url") as? String
                  retrievedArray.append(mealSaved)
                  print(retrievedArray[0].name)
              }
              print(retrievedArray.count)
              // if empty will return []
              print("data retrived succsessfully")
            //  print(retrievedArray)
              completion(retrievedArray)
          }catch{
              print("error")
              completion(nil)
              
          }
      }
    func isFavorite(id: Int) -> Bool {
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Meals")
        let predicate=NSPredicate(format: "show_id == %d",id)
        fetchRequest.predicate = predicate
        do{
             let result = try context.fetch(fetchRequest)
            return !result.isEmpty
        }catch{
            return false
        }
        
    }
    
  }

