struct Bicycle {
    let brand: String
    let type: BicycleType?
    let gears: Int?

    
    func describeBicycle() {
        var description = "Brand: \(brand)"
        
        if let type = type {
            description += ", Type: \(type.description)"
        } else {
            description += ", Type: not specified"
        }
        
        if let gears = gears {
            description += ", Gears: \(gears)"
        } else {
            description += ", Gears: not specified"
        }
        
        print(description)
    }
}
func describeBicycle(bicycle: Bicycle) {
    bicycle.describeBicycle()
}
let bicycles: [Bicycle] = [
    Bicycle(brand: "Trek", type: .mountain, gears: 21),
    Bicycle(brand: "Giant", type: .road, gears: nil),
    Bicycle(brand: "Cannondale", type: nil, gears: 18)
]


class Cyclist {
    let name: String
    var bicycle: Bicycle?

    init(name: String, bicycle: Bicycle?) {
        self.name = name
        self.bicycle = bicycle
    }

    func describeBicycle() {
        if let bicycle = bicycle {
            print("\(name) owns the following bicycle:")
            bicycle.describeBicycle()
        } else {
            print("\(name) does not own a bicycle.")
        }
    }
}
enum BicycleType {
    case mountain
    case road
    case hybrid
    
    var description: String {
        switch self {
        case .mountain:
            return "Mountain"
        case .road:
            return "Road"
        case .hybrid:
            return "Hybrid"
        }
    }
}
let Cyclist1 = Cyclist(name: "Andriy1", bicycle: bicycles[0])
let Cyclist2 = Cyclist(name: "Andriy2", bicycle: nil)


struct Bicycle {
    let brand: String
    let type: BicycleType?
    let gears: Int?

    
    func describeBicycle() {
        var description = "Brand: \(brand)"
        
        if let type = type {
            description += ", Type: \(type.description)"
        } else {
            description += ", Type: not specified"
        }
        
        if let gears = gears {
            description += ", Gears: \(gears)"
        } else {
            description += ", Gears: not specified"
        }
        
        print(description)
    }
}
func describeBicycle(bicycle: Bicycle) {
    bicycle.describeBicycle()
}
let bicycles: [Bicycle] = [
    Bicycle(brand: "Trek", type: .mountain, gears: 21),
    Bicycle(brand: "Giant", type: .road, gears: nil),
    Bicycle(brand: "Cannondale", type: nil, gears: 18)
]


class Cyclist {
    let name: String
    var bicycle: Bicycle?

    init(name: String, bicycle: Bicycle?) {
        self.name = name
        self.bicycle = bicycle
    }

    func describeBicycle() {
        if let bicycle = bicycle {
            print("\(name) owns the following bicycle:")
            bicycle.describeBicycle()
        } else {
            print("\(name) does not own a bicycle.")
        }
    }
}
enum BicycleType {
    case mountain
    case road
    case hybrid
    
    var description: String {
        switch self {
        case .mountain:
            return "Mountain"
        case .road:
            return "Road"
        case .hybrid:
            return "Hybrid"
        }
    }
}
let Cyclist1 = Cyclist(name: "Andriy1", bicycle: bicycles[0])
let Cyclist2 = Cyclist(name: "Andriy2", bicycle: nil)


