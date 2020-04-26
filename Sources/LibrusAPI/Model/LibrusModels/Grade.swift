//
//  Grade.swift
//  LibrusAPI
//
//  Created by Oskar on 26/04/2020.
//

import Foundation

struct Grade: Codable {
  let id: Int
  
  let lesson: Lesson
  
  let subject: Subject
  
  let student: Student
  
  let category: Category
  
  let teacher: Teacher
  
  let grade: String
  
  let date: Date
  
  let addDate: Date
  
  let semester: Semester
  
  let type: GradeType
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case lesson = "Lesson"
    case subject = "Subject"
    case student = "Student"
    case category = "Category"
    case teacher = "AddedBy"
    case grade = "Grade"
    case date = "Date"
    case addDate = "AddDate"
    case semester = "Semester"
  }
  
  init(from decoder: Decoder) throws {
    guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { preconditionFailure() }
    do {
    let dateFormatter = DateFormatter()
    self.id = try container.decode(Int.self, forKey: .id)
    self.lesson = try container.decode(Lesson.self, forKey: .lesson)
    self.subject = try container.decode(Subject.self, forKey: .subject)
    self.student = try container.decode(Student.self, forKey: .student)
    self.category = try container.decode(Category.self, forKey: .category)
    self.teacher = try container.decode(Teacher.self, forKey: .teacher)
    self.grade = try container.decode(String.self, forKey: .grade)
    self.semester = try container.decode(Semester.self, forKey: .semester)
    self.type = try GradeType(from: decoder)

    dateFormatter.dateFormat = "yyyy-MM-dd"
    var dateString = try! container.decode(String.self, forKey: .date)
    self.date = dateFormatter.date(from: dateString)!
    
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateString = try! container.decode(String.self, forKey: .addDate)
    self.addDate = dateFormatter.date(from: dateString)!
    } catch {
      // TODO: To be handled
      print(error)
    }
    
    preconditionFailure()
  }
}