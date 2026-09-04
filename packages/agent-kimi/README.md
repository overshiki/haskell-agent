# agent-kimi

Haskell client for Kimi's (Moonshot AI) OpenAI-compatible Responses API
(`https://api.moonshot.ai/v1/responses`).

The package mirrors the other provider client packages: static API-key
credentials, typed Responses request projection (stateless: `store = false`,
no `previous_response_id`), HTTP SSE streaming, and Kimi-specific error
classification. Configuration comes from `KIMI_BASE_URL`,
`KIMI_DEFAULT_MODEL`, `KIMI_TIMEOUT_SECONDS`, and `MOONSHOT_API_KEY`
(with `KIMI_API_KEY` as a fallback).
