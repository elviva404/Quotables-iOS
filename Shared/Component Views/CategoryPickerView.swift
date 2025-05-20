import SwiftUI

struct CategoryPickerView: View {

    var titleLabel: String
    let categories: [String]
    @State var selectedCategories: Set<String> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(titleLabel)
                .font(.headline)
                .padding(.vertical, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) {
                        category in
                        Button(action: {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        }) {
                            let isSelected = selectedCategories.contains(category)
                            HStack(spacing: 4) {
                                Text(category)
                                    .fontWeight(isSelected ? .bold : .regular)
                                    .foregroundColor(.primary)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(isSelected ? Color.purple : Color.gray, lineWidth: 1)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerView(
            titleLabel: "What is it",
            categories: ["Focused", "UX research", "XD", "Leadership", "ReactJS", "Photoshop"],
            selectedCategories: ["Focused", "XD"]
        )
    }
}
