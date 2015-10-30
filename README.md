# SwiftColor

Extension for UIColor

# Demo

``` swift
let color1 = UIColor(hexString: "#66ccff")// default alpha = 1
let color2 = UIColor(hexString: "#66ccff", alpha: 0.5)// with alpha param
let color3 = UIColor(hexString: "66ccff", alpha: 0.5)// without #
let color4 = UIColor(hexString: "6cf", alpha: 0.5)// short version
let color5 = UIColor(hexString: "#error", defaultColor: UIColor.redColor())// return default color when error.
```

# install

| No.  | type     | detail                                   |
| ---- | -------- | ---------------------------------------- |
| 1    | carthage | `github "aotian16/SwiftColor"`           |
| 2    | manual   | just copy SwiftColor.swift to your project. |

# requirements

swift2.0, ios8.0

# [](https://github.com/aotian16/SwiftLog#license)license

MIT

