import SwiftUI

struct CategoryPickerView: View {
    let categories: [String]
    @Binding var selectedCategories: Set<String>
    
    var body: some View {
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
                        .padding(.horizontal, 15)
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
            .padding(.horizontal)
        }
    }
}

struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerView(
            categories: ["Focused", "UX research", "XD", "Leadership", "ReactJS", "Photoshop"],
            selectedCategories: .constant(["Focused", "XD"])
        )
    }
} 