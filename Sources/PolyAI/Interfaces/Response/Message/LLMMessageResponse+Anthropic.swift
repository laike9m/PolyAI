//
//  LLMMessageResponse+Anthropic.swift
//
//
//  Created by James Rochabrun on 4/15/24.
//

import Foundation
import SwiftAnthropic

// MARK: Anthropic

extension MessageResponse: LLMMessageResponse {
   
   public var createdAt: Int? {
      nil
   }
   
   public var contentDescription: String {
      content.map { contentItem in
         switch contentItem {
         case .text(let text):
            return text
         case .toolUse(_, let name, _):
            return "Tool: \(name)"
         }
      }.first ?? ""
   }
   
   public var usageMetrics: UsageMetrics {
      ChatUsageMetrics(inputTokens: usage.inputTokens, outputTokens: usage.outputTokens, totalTokens: nil)
   }
   
   public var tools: [ToolUsage] {
      []
   }
}
