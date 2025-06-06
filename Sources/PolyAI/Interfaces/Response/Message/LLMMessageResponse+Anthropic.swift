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
   public var id: String? {
      nil
   }

   public var model: String? {
      nil
   }

   public var createdAt: Int? {
      nil
   }

   public var contentDescription: String {
      content.map { contentItem in
         switch contentItem {
         case let .text(text, _):
            return text
         case let .toolUse(toolUSe):
            return "Tool: \(toolUSe.name)"
         case .thinking:
            return ""
         }
      }.first ?? ""
   }

   public var usageMetrics: UsageMetrics {
      ChatUsageMetrics(inputTokens: usage.inputTokens ?? 0, outputTokens: usage.outputTokens, totalTokens: nil)
   }

   public var tools: [ToolUsage] {
      []
   }
}
