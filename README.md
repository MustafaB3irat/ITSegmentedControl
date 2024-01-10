# ITSegmentedControl 

![Static Badge](https://img.shields.io/badge/IT_Segmented_Control-blue) ![Static Badge](https://img.shields.io/badge/SPM-Compatable-green) ![Static Badge](https://img.shields.io/badge/Swift-5.x-green)


## A custom scrollable segmented control that supports a combination of titles and images with selected segment bottom indicator or bordered segments

Comes with many customizations up to the segment itself, the ability to change the color of text, and image, and also change selection colors.

ITSegmentedControl comes with autoscrolling when a segment is selected to reveal more segments when possible.

![borderless](https://github.com/MustafaB3irat/ITSegmentedControl/assets/45164085/f74f75ab-f026-4d5f-b80b-59e814cf7972) | ![withBorder](https://github.com/MustafaB3irat/ITSegmentedControl/assets/45164085/86022b5c-00c5-4aa4-9c3d-e7bf826402c2)

#### Selection Styles:
   1. Selection indicator (default)
   2. Selection by border (need to provide border configuration for each section [borderColor, selectedBorderColor, and border width]), see setup below.
      
----

### Installation:

   ```
    * Available on Swift Package Manager with URL: `https://github.com/MustafaB3irat/ITSegmentedControl.git`
   ```

----

### Usage:

`ITSegmentedControl` is a customizable and easy-to-use segmented control for your iOS applications. Below are the essential models and APIs for integrating and customizing the segmented control.

#### ITSegment

`ITSegment` represents the configuration for each segment in the control. It includes the following properties:

- **title**: The title of the segment.
- **image**: An optional image for the segment.
- **selectedImage**: An optional selected image for the segment.
- **selectedIndicatorColor**: The color of the selected indicator, default set to black.
- **titleColor**: The color of the title, default set to label color.
- **selectedTitleColor**: The color of the title when selected, default set to label color.
- **backgroundColor**: The background color of the segment, default set to clear.
- **selectedBackgroundColor**: The background color of the segment when selected, default set to clear.
- **borderConfigurations**: An optional configuration for segment borders (See `ITSegmentBorderConfigurations`).
- **contentType**: The content mode type, either `.titleFirst` or `.imageFirst`.

#### ITSegmentBorderConfigurations

`ITSegmentBorderConfigurations` represents the border configurations for a segment. It includes the following properties:

- **borderColor**: The color of the segment's border.
- **selectedBorderColor**: An optional color for the border when the segment is selected.
- **borderWidth**: The width of the segment's border, when the segment is selected, border width is set to 2 by default to emphasize selection.

#### ITSegmentContentModeType

`ITSegmentContentModeType` is an enumeration representing the content mode type for a segment. It includes:

- **titleFirst**: The title is displayed before the image.
- **imageFirst**: The image is displayed before the title.

#### Example

```swift
import ITSegmentedControl

// Create segments
let firstSegment = ITSegment(title: "First", image: UIImage(named: "first"))
let secondSegment = ITSegment(title: "Second", image: UIImage(named: "second"))
let thirdSegment = ITSegment(title: "Third", image: UIImage(named: "third"))

// Initialize ITSegmentedControl
let segmentedControl = ITSegmentedControl(segments: [firstSegment, secondSegment, thirdSegment])

segmentedControl.selectSegment(at: 0)

// Add to your view
view.addSubview(segmentedControl)
```

#### Receiving Actions

`ITSegmentedControl` is a UIControl component so you can deal with it as normal UISegmentedControl add receive action for value changed.

```swift
segmentedControl.addAction(UIAction { _ in
   print("Segment \(segmentControl.selectedSegment?.title) is selected"
}, for: .valueChanged)

```
----

#### Public Properties

`ITSegmentedControl` provides convenient public properties for accessing information about the current state and configuration of the control. Here are the key public properties:

##### `numberOfSegments`

- **Description**: Use this property to get the current number of segments in the segment controller.
- **Type**: `Int`
- **Usage**:
    ```swift
    let numberOfSegments = segmentedControl.numberOfSegments
    ```

##### `selectedSegmentIndex`

- **Description**: Use this property to get the current selected segment index. Returns `nil` if segments are empty.
- **Type**: `Int?`
- **Usage**:
    ```swift
    if let selectedIndex = segmentedControl.selectedSegmentIndex {
        // Perform actions based on the selected index
    }
    ```

##### `selectedSegment`

- **Description**: Use this property to get the current selected segment. Returns `nil` if segments are empty.
- **Type**: `ITSegment?`
- **Usage**:
    ```swift
    if let selectedSegment = segmentedControl.selectedSegment {
        // Access properties of the selected segment
    }
    ```

##### `segmentsSpacing`

- **Description**: Use this property to get and set the spacing between segments.
- **Type**: `CGFloat`
- **Usage**:
    ```swift
    segmentedControl.segmentsSpacing = 10.0
    ```

##### `segmentsCornerRadius`

- **Description**: Use this property to get and set the corner radius of segments, usually used when you set the background color for each segment.
- **Type**: `CGFloat`
- **Usage**:
    ```swift
    segmentedControl.segmentsCornerRadius = 8.0
    ```

Feel free to leverage these properties to enhance the customization and interaction with `ITSegmentedControl` in your application.

----

#### Public Functions

`ITSegmentedControl` provides a set of public functions to interact with and manipulate segments. Here are the key public functions:

##### `add(segment:)`

- **Description**: Use this method to add a new segment with its configurations. The ID should be unique.
- **Parameters**:
    - `segment`: Configurations of the added segment, including title, title color, selected title color, etc.
- **Usage**:
    ```swift
    let newSegment = ITSegment(title: "New Segment", titleColor: .black, selectedTitleColor: .blue)
    segmentedControl.add(segment: newSegment)
    ```

##### `add(segments:)`

- **Description**: Use this method to append an array of segments to the segmented control.
- **Parameters**:
    - `segments`: Segments to be appended to the current segments.
- **Usage**:
    ```swift
    let additionalSegments = [...] // An array of ITSegment objects
    segmentedControl.add(segments: additionalSegments)
    ```

##### `updateSegment(withTitle:updatedSegment:)`

- **Description**: Use this method to update an existing segment with new configurations.
- **Parameters**:
    - `title`: Title of the existing segment.
    - `updatedSegment`: Updated configuration of the segment.
- **Usage**:
    ```swift
    let updatedSegment = ITSegment(title: "Updated Segment", titleColor: .red, selectedTitleColor: .green)
    segmentedControl.updateSegment(withTitle: "Existing Segment", updatedSegment: updatedSegment)
    ```

##### `removeSegment(withTitle:)`

- **Description**: Use this method to remove a specific segment. If the segment is selected, the selection will revert to the first segment. If segments are empty, the selection will be `nil`.
- **Parameters**:
    - `title`: Title of the segment to be removed.
- **Usage**:
    ```swift
    segmentedControl.removeSegment(withTitle: "Segment to Remove")
    ```

##### `removeAllSegments()`

- **Description**: Use this method to remove all current segments, resulting in an empty segment.
- **Usage**:
    ```swift
    segmentedControl.removeAllSegments()
    ```

##### `selectSegment(at:)`

- **Description**: Use this method to select a segment at a specific index.
- **Parameters**:
    - `index`: Index of the segment.
- **Usage**:
    ```swift
    segmentedControl.selectSegment(at: 2)
    ```

##### `selectSegment(withTitle:)`

- **Description**: Use this method to select a segment with a specific title.
- **Parameters**:
    - `title`: Title of the segment.
- **Usage**:
    ```swift
    segmentedControl.selectSegment(withTitle: "Selected Segment")
    ```

Feel free to utilize these functions to dynamically manage and manipulate segments within `ITSegmentedControl` in your application.

----

## Found a bug?

File an issue and we will get it sorted.

![jU](https://github.com/MustafaB3irat/ITSegmentedControl/assets/45164085/5fffb7df-2fbe-40cb-bf75-7b17ff8050e4)
<a href="https://gifer.com">via GIFER</a>

----

## Want to contribute?

Reach me at Linkedin: <a href = 'https://www.linkedin.com/in/mustafa-birat/'> Mustafa B'irat </a>

----

## MIT License

#### Copyright (c) 2024 Mustafa B'irat

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


