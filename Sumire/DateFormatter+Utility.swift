//
//  DateFormatter+Utility.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import Foundation

public protocol DateFormatter {
    var formatter: NSDateFormatter { get }
    
    func date(string: String) -> NSDate?
    func string(date: NSDate) -> String
}

extension DateFormatter {
    public func date(string: String) -> NSDate? {
        return formatter.dateFromString(string)
    }
    
    public func string(date: NSDate) -> String {
        return formatter.stringFromDate(date)
    }
}

public struct StandardDateFormatter: DateFormatter {
    public let formatter: NSDateFormatter
    
    public init(dateFormat: String, locale: Locale, calendar: Calendar) {
        self.formatter = {
            let formatter = NSDateFormatter()
            formatter.dateFormat = dateFormat
            formatter.locale = locale.locale
            formatter.calendar = calendar.calendar
            return formatter
        }()
    }
}

public struct LocalizedTemplateDateFormatter: DateFormatter {
    public let formatter: NSDateFormatter
    
    public init(dateFormat: String, locale: Locale, calendar: Calendar) {
        self.formatter = {
            let formatter = NSDateFormatter()
            formatter.setLocalizedDateFormatFromTemplate(dateFormat)
            formatter.locale = locale.locale
            formatter.calendar = calendar.calendar
            return formatter
        }()
    }
}

public struct LocaleStyleDateFormatter: DateFormatter {
    public let formatter: NSDateFormatter
    
    public init(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle, locale: Locale, calendar: Calendar) {
        self.formatter = {
            let formatter = NSDateFormatter()
            formatter.dateStyle = dateStyle
            formatter.timeStyle = timeStyle
            formatter.locale = locale.locale
            formatter.calendar = calendar.calendar
            return formatter
        }()
    }
}

public enum Locale {
    case current
    case system
    case enUSPOSIX
    case identifier(String)
    
    var locale: NSLocale {
        switch self {
        case .current:
            return NSLocale.currentLocale()
        case .system:
            return NSLocale.systemLocale()
        case .enUSPOSIX:
            return NSLocale(localeIdentifier: "en_US_POSIX")
        case .identifier(let id):
            return NSLocale(localeIdentifier: id)
        }
    }
}

public enum Calendar {
    case current
    case gregorian
    case buddhist
    case chinese
    case coptic
    case ethiopicAmeteMihret
    case ethiopicAmeteAlem
    case hebrew
    case iso8601
    case indian
    case islamic
    case islamicCivil
    case japanese
    case persian
    case republicOfChina
    case islamicTabular
    case islamicUmmAlQura
    
    var calendar: NSCalendar {
        guard let id = identifier, let calendar = NSCalendar(calendarIdentifier: id) else {
            return NSCalendar.currentCalendar()
        }
        return calendar
    }
    
    private var identifier: String? {
        switch self {
        case current:
            return nil
        case gregorian:
            return NSCalendarIdentifierGregorian
        case buddhist:
            return NSCalendarIdentifierBuddhist
        case chinese:
            return NSCalendarIdentifierChinese
        case coptic:
            return NSCalendarIdentifierCoptic
        case ethiopicAmeteMihret:
            return NSCalendarIdentifierEthiopicAmeteMihret
        case ethiopicAmeteAlem:
            return NSCalendarIdentifierEthiopicAmeteAlem
        case hebrew:
            return NSCalendarIdentifierHebrew
        case iso8601:
            return NSCalendarIdentifierISO8601
        case indian:
            return NSCalendarIdentifierIndian
        case islamic:
            return NSCalendarIdentifierIslamic
        case islamicCivil:
            return NSCalendarIdentifierIslamicCivil
        case japanese:
            return NSCalendarIdentifierJapanese
        case persian:
            return NSCalendarIdentifierPersian
        case republicOfChina:
            return NSCalendarIdentifierRepublicOfChina
        case islamicTabular:
            return NSCalendarIdentifierIslamicTabular
        case islamicUmmAlQura:
            return NSCalendarIdentifierIslamicUmmAlQura
        }
    }
}
