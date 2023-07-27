import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State private var data: AcademicData? = nil
    @State private var selectedSemester: String = ""
    @State var tabIndex = 0
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                    .frame(height: 30)
                
                Text("ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН НА \(data?.AcademicYear ?? "")")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                Spacer()
                    .frame(height: 30)
                
                CustomTopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    FirstView()
                }
                else {
                    SecondView()
                }
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width - 24, alignment: .center)
            .padding(.horizontal, 12)
            .navigationBarTitle("ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                // Handle document download
                if let url = URL(string: "https://static.boredpanda.com/blog/wp-content/uploads/2019/06/4-5d122721577cd__700.jpg") {
                        UIApplication.shared.open(url)
                    }
            }) {
                Image(systemName: "square.and.arrow.down")
            })
            .onAppear {
                loadData()
            }
        }
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(AcademicData.self, from: data)
                self.data = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

struct SemesterDetailView: View {
    let semester: Semester
    
    var body: some View {
        VStack {
            List {
                ForEach(semester.Disciplines, id: \.DisciplineId) { discipline in
                    Text(discipline.DisciplineName.nameRu)
                }
            }
            .padding()
        }
    }
}
