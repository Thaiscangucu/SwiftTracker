import Foundation

//Mark: - Format Numbers so dont brake the layout

func doubleMoneyFormatter(number: Double) -> String {
    let absNumber = abs(number) 
    let sign = number < 0 ? "-" : ""

    switch absNumber {
    case 1_000_000_000...:
        return "R$\(sign)\(String(format: "%.1f", absNumber / 1_000_000_000)) bi"
    case 1_000_000...:
        return "R$\(sign)\(String(format: "%.1f", absNumber / 1_000_000)) mi"
    case 1_000...:
        return "R$\(sign)\(String(format: "%.1f", absNumber / 1_000)) mil"
    default:
        return "R$\(sign)\(String(format: "%.0f", absNumber))"
    }
}

func doubleFormatter(number: Double) -> String {
    let absNumber = abs(number) // Garantee negative numbers
    let sign = number < 0 ? "-" : ""

    switch absNumber {
    case 1_000_000_000...:
        return "\(sign)\(String(format: "%.1f", absNumber / 1_000_000_000)) bi"
    case 1_000_000...:
        return "\(sign)\(String(format: "%.1f", absNumber / 1_000_000)) mi"
    case 1_000...:
        return "\(sign)\(String(format: "%.1f", absNumber / 1_000)) mil"
    default:
        return "\(sign)\(String(format: "%.0f", absNumber))"
    }
}
