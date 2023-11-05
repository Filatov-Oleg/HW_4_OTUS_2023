import Foundation

public class NetwotkService {
    public var carEntities = [CarEntity.init(name: "Chevrolet", colorCar: "Red", quantityOfPetrol: 60.0, numberCar: "E143XA77", isRent: false),
                              CarEntity.init(name: "Dodge", colorCar: "Red", quantityOfPetrol: 50.0, numberCar: "A657OK777", isRent: false),
                              CarEntity.init(name: "Ford", colorCar: "Green", quantityOfPetrol: 45.0, numberCar: "C349KE50", isRent: false)]

    public init() {
    }
    
    public func getCars() -> [CarEntity] {
        return self.carEntities
    }
    
    public func rentCar(by id: UUID) {
        for i in 0..<carEntities.count {
            if carEntities[i].id == id {
                carEntities[i].isRent.toggle()
                break
            }
        }
    }
}
