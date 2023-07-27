//
//  SwiftUIView.swift
//  Capital
//
//  Created by Tore Amangeldy on 7/27/23.
//

import SwiftUI

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct FirstView: View{
    @State private var data: AcademicData? = nil
    
    // let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 248/255, green: 249/255, blue: 251/255))
            VStack{
                HStack{
                    Spacer()
                        .frame(width: 125)
                    Text("Аудиторные занятия в часах")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .opacity(0.4)
                }
                VStack {
                    LazyVGrid(columns: columns) {
                        // Header row
                        Text("Наименование дисциплины")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .opacity(0.4)
                        Text("Лекция")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        Text("Семинар")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        Text("Лабка")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        
                        // Content
                        ForEach(data?.Semesters[0].Disciplines ?? [], id: \.DisciplineId) { discipline in
                            Text(discipline.DisciplineName.nameRu)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[0].RealHours) /" : "")
                                    .foregroundColor(discipline.Lesson[0].Hours == discipline.Lesson[0].RealHours ? .green : .green)
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[0].Hours)" : "")
                                    .foregroundColor(discipline.Lesson[0].Hours == discipline.Lesson[0].RealHours ? .green : .red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[1].RealHours) /" : "")
                                    .foregroundColor(discipline.Lesson[1].Hours == discipline.Lesson[1].RealHours ? .green : .green)
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[1].Hours)" : "")
                                    .foregroundColor(discipline.Lesson[1].Hours == discipline.Lesson[1].RealHours ? .green : .red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(2) ? "\(discipline.Lesson[2].RealHours) /" : "")
                                    .foregroundColor(.green)
                                Text(discipline.Lesson.indices.contains(2) ? "\(discipline.Lesson[2].Hours)" : "")
                                    .foregroundColor(.red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                        }
                        
                        
                    }
                }
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let dataContent = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(AcademicData.self, from: dataContent)
                self.data = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

struct SecondView: View{
    @State private var data: AcademicData? = nil
    
    // let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 248/255, green: 249/255, blue: 251/255))
            VStack{
                HStack{
                    Spacer()
                        .frame(width: 125)
                    Text("Аудиторные занятия в часах")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .opacity(0.4)
                }
                VStack {
                    LazyVGrid(columns: columns) {
                        // Header row
                        Text("Наименование дисциплины")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .opacity(0.4)
                        Text("Лекция")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        Text("Семинар")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        Text("Лабка")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                        
                        // Content
                        ForEach(data?.Semesters[1].Disciplines ?? [], id: \.DisciplineId) { discipline in
                            Text(discipline.DisciplineName.nameRu)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[0].RealHours) /" : "")
                                    .foregroundColor(discipline.Lesson[0].Hours == discipline.Lesson[0].RealHours ? .green : .green)
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[0].Hours)" : "")
                                    .foregroundColor(discipline.Lesson[0].Hours == discipline.Lesson[0].RealHours ? .green : .red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[1].RealHours) /" : "")
                                    .foregroundColor(discipline.Lesson[1].Hours == discipline.Lesson[1].RealHours ? .green : .green)
                                Text(discipline.Lesson.indices.contains(0) ? "\(discipline.Lesson[1].Hours)" : "")
                                    .foregroundColor(discipline.Lesson[1].Hours == discipline.Lesson[1].RealHours ? .green : .red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                            HStack {
                                Text(discipline.Lesson.indices.contains(2) ? "\(discipline.Lesson[2].RealHours) /" : "")
                                    .foregroundColor(.green)
                                Text(discipline.Lesson.indices.contains(2) ? "\(discipline.Lesson[2].Hours)" : "")
                                    .foregroundColor(.red)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .border(Color.black, width: 0.5)
                        }
                        
                        
                    }
                }
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let dataContent = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(AcademicData.self, from: dataContent)
                self.data = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

struct CustomTopTabBar: View {
    @State private var data: AcademicData? = nil
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(data?.Semesters.indices ?? 0..<2, id: \.self) { index in
                TabBarButton(text: "Семестр \(data?.Semesters[index].Number ?? "")", isSelected: .constant(tabIndex == index))
                    .onTapGesture { onButtonTapped(index: index) }
                    .frame(maxWidth: .infinity)
            }
        }
        .border(width: 1, edges: [.bottom], color: .black)
        .onAppear(perform: loadData)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let dataContent = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(AcademicData.self, from: dataContent)
                self.data = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom,10)
            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: .black)
    }
}

struct EdgeBorder: Shape {
    
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }
            
            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }
            
            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }
            
            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: SwiftUI.Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
