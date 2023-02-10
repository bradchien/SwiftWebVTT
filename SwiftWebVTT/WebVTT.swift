public struct WebVTT {
    public struct Cue: Equatable {
        public let timing: Timing
        public let text: String
        
        public init(timing: WebVTT.Timing, text: String) {
            self.timing = timing
            self.text = text
        }
    }
    
    // Native timing in WebVTT. Measured in milliseconds.
    public struct Timing: Equatable {
        public let start: Int
        public let end: Int
        
        public init(start: Int, end: Int) {
            self.start = start
            self.end = end
        }
    }
    
    public let cues: [Cue]
    
    public init(cues: [Cue]) {
        self.cues = cues
    }
}

public extension WebVTT.Timing {
    var duration: Int { return end - start }
}

// Converted times for convenience
public extension WebVTT.Cue {
    var timeStart: TimeInterval { return TimeInterval(timing.start) / 1000 }
    var timeEnd: TimeInterval { return TimeInterval(timing.end) / 1000 }
    var duration: TimeInterval { return TimeInterval(timing.duration) / 1000 }
    var deviation: TimeInterval { return TimeInterval(timeStart + duration * 0.85) }
}
