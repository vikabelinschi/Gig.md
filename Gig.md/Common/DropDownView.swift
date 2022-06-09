//
//  DropDownView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 08.06.2022.
//

import SwiftUI

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownSelector: View {
    @State var dropdownPressed = false
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            withAnimation {
                
                self.shouldShowDropdown.toggle()
                self.dropdownPressed.toggle()
            }
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.white)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.white)
                
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.purple, lineWidth: 1)
        )
        .background(Color("darkPink").opacity(0.4))
            VStack {
                if self.shouldShowDropdown {
                    Dropdown(options: self.options, onOptionSelected: { option in
                        withAnimation {
                            dropdownPressed = false
                            shouldShowDropdown = false
                        }
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
                
        )
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.options, id: \.self) { option in
                        DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                    }
                }
        }
        .frame(minHeight: CGFloat(options.count) * 20, maxHeight: 200)
        .padding(.vertical, 5)
        .background(Color("darkPink").opacity(0.4))
        .cornerRadius(5)
        .zIndex(4)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.purple, lineWidth: 1)
        )
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Ladder"),
        DropdownOption(key: uniqueKey, value: "Driver"),
        DropdownOption(key: uniqueKey, value: "Cook"),
        DropdownOption(key: uniqueKey, value: "Cleaning"),
        DropdownOption(key: uniqueKey, value: "Languages"),
        DropdownOption(key: uniqueKey, value: "Finance"),
        DropdownOption(key: uniqueKey, value: "Entertainment")
    ]


    static var previews: some View {
        Group {
            DropdownSelector(
                placeholder: "Category",
                options: options,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
        }
    }
}
