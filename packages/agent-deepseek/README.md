# agent-deepseek

Haskell client for DeepSeek's OpenAI-compatible Responses API
(`https://api.deepseek.com/responses`).

The package mirrors the other provider client packages: static API-key
credentials, typed Responses request projection (stateless: `store = false`,
no `previous_response_id`), HTTP SSE streaming, and DeepSeek-specific error
classification. Configuration comes from `DEEPSEEK_BASE_URL`,
`DEEPSEEK_DEFAULT_MODEL`, `DEEPSEEK_TIMEOUT_SECONDS`, and `DEEPSEEK_API_KEY`.
