# AI Music API

Generate music with prompt- and lyric-driven endpoints. The guide links to Muapi’s music hub for current Suno and MiniMax model coverage, pricing, and supported tasks.

[Muapi AI Music API landing page](https://muapi.ai/ai-music-api) · [API reference](https://muapi.ai/docs/api-reference) · [Playground](https://muapi.ai/playground) · [Create an API key](https://muapi.ai/access-keys)

## Related Projects

- [Video-to-Audio-API](https://github.com/Anil-matcha/Video-to-Audio-API)
- [AI-Avatar-Lipsync-API](https://github.com/Anil-matcha/AI-Avatar-Lipsync-API)

## What this API covers

Use the endpoint that matches the task and input media. The routes below are enabled Muapi model IDs checked against the current model catalog; availability, request fields, and pricing can change, so verify the linked landing page and endpoint schema before production use.

| Endpoint | Purpose | Category |
|---|---|---|


## Quick start

Muapi uses an asynchronous REST contract. Submit a JSON request with your API key, save the returned `request_id`, then poll the result endpoint. Replace sample URLs with files you control and fields with values supported by the selected endpoint.

```bash
curl -X POST https://api.muapi.ai/api/v1/minimax-music-3.0 \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{"prompt": "An upbeat synth-pop anthem with driving drums and a soaring chorus", "lyrics": "[Verse]\\nWalking through the city lights\\n\\n##\\n[Chorus]\\nWe are shining, we are free"}'
```

### Request fields in this example

| Field | Requirement | Notes |
|---|---|---|
| `prompt` | Required | Prompt for musical style, mood, and instrumentation. |
| `lyrics` | Required | 10–3000 characters; newlines separate lyric lines and `##` marks an instrumental break. |

### Poll for the result

```bash
curl "https://api.muapi.ai/api/v1/predictions/$REQUEST_ID/result" \
  -H "x-api-key: $MUAPI_API_KEY"
```

Poll until the task status is `completed` or `failed`. Read the response’s output URLs on completion; download outputs you need to retain, since provider-hosted URLs may expire.

## Choosing an endpoint

Compare supported inputs and output behavior first, then resolution, duration, quality controls, latency, and price for your use case. Similar names do not guarantee interchangeable request schemas. This repository lists representative routes; the canonical landing page contains the current task-specific explanation, examples, and pricing context.

## Errors and production notes

- Keep the API key in an environment variable; do not commit credentials.
- Validate inputs against the selected endpoint’s current schema.
- Handle non-success HTTP responses and failed task states explicitly.
- Retry only when appropriate for the error; avoid submitting duplicate billable jobs after a timeout without checking the original `request_id`.
- Confirm current pricing and availability on the Muapi page before estimating production cost.
