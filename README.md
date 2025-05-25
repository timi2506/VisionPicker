# VisionPicker


## Installation
### Using Xcode's built-in Package Manager 
Go to File > Add Package Dependencies...

then, in the Search-Bar enter: 

```https://github.com/timi2506/VisionPicker.git``` 

and press "Add Package" and make sure to link it to your target.
<img width="362" alt="Screenshot 2025-03-04 at 11 16 34" src="https://github.com/user-attachments/assets/8b3672b9-9345-4d6b-9b0d-26d03bd189c7" />

## Usage
### Examples

**VisionPicker { ... }** *View*

```swift
VisionPicker(selection: Binding<Hashable>, backgroundMaterial: Material?, items: () -> [PickerItem<Hashable, LabelView>])
```

* **selection** *Required*

  * A `Binding` to the currently selected value. Updates whenever a picker item is tapped.
* **backgroundMaterial** *Optional*

  * The background material of the picker. Defaults to `.regularMaterial` if not provided.
* **items** *Required*

  * A result builder closure that provides an array of `PickerItem`s, which define the options displayed in the picker.

***Optional*** means this value can be safely omitted.

***Required*** means you NEED to define this value and it can't be nil.

**PickerItem**

* Defines an item in the picker.
* **value**: The value associated with this item.
* **label**: A closure returning the view to display as the item.

### Recommended Usecases:

* ✅ On top of a view as a lightweight picker
* ✅ As a selection control in a custom component
* ❌ For use with dynamic, very large data sets (use `List` or other `Picker` variants instead)

### Example

```swift
VisionPicker(selection: $selectedOption) {
    PickerItem(value: "Option 1") {
        Text("Option 1")
    }
    PickerItem(value: "Option 2") {
        Text("Option 2")
    }
}
```

## Issues or Questions

If you have any issues or questions feel free to open an [issue](https://github.com/timi2506/VisionPicker/issues/new/choose) or contact me on [Twitter](https://x.com/timi2506)

## Requirements
- iOS 15+
- macOS 12+
- visionOS 1+
