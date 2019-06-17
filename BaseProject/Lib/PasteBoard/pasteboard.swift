import Foundation

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

/// Return string value currently on clipboard
func getPasteboardContents() -> String? {
    #if os(iOS)

    let pasteboard = UIPasteboard.general
        return pasteboard.string

    #else

        let pasteboard = NSPasteboard.generalPasteboard()
        return pasteboard.stringForType(NSPasteboardTypeString)

    #endif
}

/// Write a string value to the pasteboard
func copyToPasteboard(text: String) {
    #if os(iOS)

    let pasteboard = UIPasteboard.general
        pasteboard.string = text

    #else

        let pasteboard = NSPasteboard.generalPasteboard()
        pasteboard.clearContents()
        pasteboard.setString(text, forType: NSPasteboardTypeString)

    #endif
}
