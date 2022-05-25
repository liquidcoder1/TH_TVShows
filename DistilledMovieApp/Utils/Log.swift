// File: Log.swift
// Project: DistilledMovieApp

import SwiftUI

enum LogEvent: String {
    case error = "💥💥💥"
    case info = "ℹ️ℹ️ℹ️"
    case debug = "🛠🛠🛠"
    case verbose = "📣📣📣"
    case warning = "⚠️⚠️⚠️"
    case severe = "🔥🔥🔥"
}

extension Date {
    
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
    
    func format(_ format: String = "d MM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  format
        formatter.locale = .autoupdatingCurrent
        let component = formatter.string(from: self)
        return component
    }
}


struct Log {
    
    static private var dateFormat = "yyyy-MM-dd hh:mm"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private init() {}
    
    static func message(forEvent event: LogEvent, _ object: Any...,
                        filename: String = #file,
                        line: Int = #line,
                        funcName: String = #function) {
#if DEBUG
        var objects = ""
        object.forEach({objects += "\($0) "})
        
        print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]: \(line) \(funcName) -> \(objects)")
#endif
    }
    
    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    
    static func error(_ object: Any..., filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        message(forEvent: .error, object,filename: filename,line: line,funcName: funcName)
    }
    
    static func info(_ object: Any..., filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        
        message(forEvent: .info, object,filename: filename,line: line,funcName: funcName)
        
    }
    
    
    static func warning(_ object: Any..., filename: String = #file,line: Int = #line, column: Int = #column, funcName: String = #function) {
        
        message(forEvent: .warning, object,filename: filename,line: line,funcName: funcName)
        
    }
    
    static func debug(_ object: Any..., filename: String = #file, line: Int = #line,column: Int = #column, funcName: String = #function) {
        
        message(forEvent: .debug, object,filename: filename,line: line,funcName: funcName)
    }
    
    
    static func verbose(_ object: Any..., filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        
        message(forEvent: .verbose, object,filename: filename,line: line,funcName: funcName)
        
    }
    
    static func severe(_ object: Any..., filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        
        message(forEvent: .severe, object, filename: filename,line: line,funcName: funcName)
    }
}

