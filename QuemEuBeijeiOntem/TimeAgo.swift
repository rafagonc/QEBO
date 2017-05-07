
import Foundation



public func timeAgoSince(_ date: Date) -> String {
    
    let calendar = Calendar.current
    let now = Date()
    let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
    let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
    
    if let year = components.year, year >= 2 {
        return "\(year) anos atrás"
    }
    
    if let year = components.year, year >= 1 {
        return "Um ano atrás"
    }
    
    if let month = components.month, month >= 2 {
        return "\(month) meses atrás"
    }
    
    if let month = components.month, month >= 1 {
        return "Um més atrás"
    }
    
    if let week = components.weekOfYear, week >= 2 {
        return "\(week) semanas atrás"
    }
    
    if let week = components.weekOfYear, week >= 1 {
        return "1 semana atrás"
    }
    
    if let day = components.day, day >= 2 {
        return "\(day) dias atrás"
    }
    
    if let day = components.day, day >= 1 {
        return "Ontem"
    }
    
    if let hour = components.hour, hour >= 2 {
        return "\(hour) horas atrás"
    }
    
    if let hour = components.hour, hour >= 1 {
        return "Uma hora atrás"
    }
    
    if let minute = components.minute, minute >= 2 {
        return "\(minute) minutos atrás"
    }
    
    if let minute = components.minute, minute >= 1 {
        return "Um minuto atrás"
    }
    
    if let second = components.second, second >= 3 {
        return "\(second) segundos atrás"
    }
    
    return "Agora"
    
}
