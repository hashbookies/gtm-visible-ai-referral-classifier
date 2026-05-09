# Visible AI Referral / UTM Classifier

GTM variable template for classifying identifiable AI referral and UTM traffic signals.

## Overview

Visible AI Referral / UTM Classifier is a Google Tag Manager custom variable template that classifies identifiable AI-driven sessions when usable UTM or referrer signals are available.

This template improves attribution for identifiable AI-driven sessions where UTM or referrer signals are available. It does not estimate unidentifiable direct traffic, stripped-referrer visits, native mobile app loss, or manual copy/paste behavior.

## What it does

- Checks `utm_source` for known AI platform signals.
- Checks the referrer host for known AI platform domains.
- Returns a normalized platform label when a match is found.
- Supports custom host-to-label mappings.
- Returns a configurable fallback value when no match is found.

## What it returns

Examples of possible return values include:

- `chatgpt`
- `perplexity`
- `claude`
- `gemini`
- `copilot`
- `deepseek`
- `notebooklm`
- `duckduckgo_ai`
- `qwen`
- `cohere`
- `(none)`

## Detection logic

The template checks signals in this order:

1. `utm_source`
2. referrer host
3. optional custom AI host mappings

If a match is found, the template returns either the normalized platform label or, if configured, the matched host.

## When to use it

- Use it to populate a GA4 custom dimension such as `ai_source`.
- Use it to segment identifiable AI referral traffic in reporting.
- Use it when AI platforms pass usable UTM or referrer signals.

## When not to use it

- Do not use it to claim total AI traffic volume.
- Do not use it to measure every AI-influenced session.
- Do not use it to solve stripped-referrer or native mobile app attribution loss.
- Do not use it as a replacement for broader attribution strategy.

## Setup

1. In Google Tag Manager, go to **Templates**.
2. Under **Variable Templates**, click **New**.
3. Open the three-dot menu and choose **Import**.
4. Import `template.tpl`.
5. Save the template.
6. Create a new variable using **Visible AI Referral / UTM Classifier**.

## Configuration

### Fallback Value

Returned when no AI source is detected.

Default:

```text
(none)
```

### Return matched host instead of normalized platform label

When enabled, returns the matched host such as `chatgpt.com` instead of `chatgpt`.

### Additional AI Host Mappings

Optional table for adding host-to-label mappings.

Example:

| Host | Label |
|---|---|
| `example-ai.com` | `example_ai` |

## Testing examples

URL:

```text
https://example.com/?utm_source=chatgpt.com
```

Expected output:

```text
chatgpt
```

Referrer host:

```text
perplexity.ai
```

Expected output:

```text
perplexity
```

## Limitations

- This template only classifies identifiable UTM or referrer signals.
- It does not estimate unidentifiable direct traffic.
- It does not identify visits where the AI platform strips the referrer.
- It does not identify manual copy/paste visits.
- AI platform referral behavior can change over time.

## Maintainer

Created and maintained by Tayo Kolade.

This template is part of a small collection of independent open-source Google Tag Manager utilities for general measurement and reporting use cases.

## Disclaimer

This is an independent open-source utility created for general Google Tag Manager use cases. It is not affiliated with or endorsed by Google or any third-party platform provider.
