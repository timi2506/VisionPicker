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
    public let value: ValueType
    public let label: () -> LabelView

    public init(value: ValueType, label: @escaping () -> LabelView) {
        self.value = value
        self.label = label
    }
}

// MARK: - Result Builder

@resultBuilder
public struct PickerItemsBuilder {
    public static func buildBlock<Content>(_ components: Content...) -> [Content] {
        components
    }
}

// MARK: - VisionPicker

public struct VisionPicker<ValueType: Hashable, LabelView: View>: View {
    @Binding public var selection: ValueType
    public let items: [PickerItem<ValueType, LabelView>]
    public var backgroundMaterial: Material = .regularMaterial

    @Namespace private var namespace

    public init(
        selection: Binding<ValueType>,
        backgroundMaterial: Material? = nil,
        @PickerItemsBuilder items: () -> [PickerItem<ValueType, LabelView>]
    ) {
        self._selection = selection
        self.items = items()
        self.backgroundMaterial = backgroundMaterial ?? .regularMaterial
    }

    public var body: some View {
        HStack(spacing: 5) {
            ForEach(items) { item in
                item.label()
                    .onTapGesture {
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
