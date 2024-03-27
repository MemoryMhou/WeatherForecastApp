import UIKit

let unixDate: TimeInterval = 1710334070
let usableDate = Date(timeIntervalSince1970: unixDate)
print(usableDate)

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .medium
var dateString = dateFormatter.string(from: usableDate)
print(dateString)

//print (TimeZone.knownTimeZoneIdentifiers )
