//
//  CustomPicker.swift
//  CustomPicker
//
//  Created by @timi2506 on 25.05.25.
//

import SwiftUI

// MARK: - PickerItem

public struct PickerItem<ValueType: Hashable, LabelView: View>: Identifiable {
    public let id: UUID = UUID()
    let value: ValueType
    let label: () -> LabelView
}

// MARK: - Result Builder

@resultBuilder
public struct PickerItemsBuilder {
    public static func buildBlock<Content>(_ components: Content...) -> [Content] {
        components
    }
}

public struct VisionPicker<ValueType: Hashable, LabelView: View>: View {
    @Binding var selection: ValueType
    let items: [PickerItem<ValueType, LabelView>]
    var backgroundMaterial: Material = .regularMaterial

    init(
        selection: Binding<ValueType>,
        backgroundMaterial: Material? = nil,
        @PickerItemsBuilder items: () -> [PickerItem<ValueType, LabelView>]
    ) {
        self._selection = selection
        self.items = items()
        self.backgroundMaterial = backgroundMaterial ?? .regularMaterial
    }
    @Namespace private var namespace
    public var body: some View {
        HStack(spacing: 5) {
            ForEach(items) { item in
                item.label()
                    .onTapGesture{
                        withAnimation() {
                            selection = item.value
                        }
                    }
                .padding(5)
                .background {
                    if selection == item.value {
                        Capsule()
                            .foregroundStyle(.gray.opacity(0.25))
                            .matchedGeometryEffect(id: "PickerShape", in: namespace)
                    }
                }
            }
        }
        .padding(5)
        .background(backgroundMaterial, ignoresSafeAreaEdges: .all)
        .clipShape(.capsule)
    }
}
