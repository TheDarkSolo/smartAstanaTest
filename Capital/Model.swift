//
//  File.swift
//  Capital
//
//  Created by Tore Amangeldy on 7/27/23.
//

import Foundation

struct AcademicData: Codable {
    let IUPSid, Title, DocumentURL, AcademicYearId, AcademicYear: String
    let Semesters: [Semester]
}

struct Semester: Codable {
    let Number: String
    let Disciplines: [Discipline]
}

struct Discipline: Codable {
    let DisciplineId: String
    let DisciplineName: DisciplineName
    let Lesson: [Lesson]
}

struct DisciplineName: Codable {
    let nameKk, nameRu, nameEn: String
}

struct Lesson: Codable {
    let LessonTypeId, Hours, RealHours: String
}
