# Phase 1 —Local or Cloud Based (according to needs )

## Goal
Get a local LLM on Windows via Ollama, or  obtain a Gemini API key as cloud fallback.
Or Fully Cloud Based (use AI help if needed )

## Hardware Context for Local 
- RTX 3050 6GB VRAM
- `qwen2.5-coder:3b` uses ~2GB VRAM → fits with room to spare
- `qwen2.5:7b` uses ~4.5GB VRAM → also fits, significantly more capable

## Step 1 — Install Ollama (Windows)
if shifting directly to cloud then go to step 4
1. Go to [ollama.com](https://ollama.com)
2. Download the Windows installer
3. Run it — installs as a background service, starts with Windows automatically
4. Verify: open PowerShell and run `ollama --version`

## Step 2 — Pull the Model

```powershell
# Pull the model (~2GB download, one time only)
ollama pull qwen2.5-coder:3b

# Verify it's there
ollama list

# Test it
ollama run qwen2.5-coder:3b "You are the Batcomputer. Say hello to Shreyas."
```

Expected output from `ollama list`:
```
NAME                    ID              SIZE    MODIFIED
qwen2.5-coder:3b        ...             1.9 GB  ...
```

## Step 3 — Verify Local API


Ollama exposes a REST API at `http://localhost:11434`.

```powershell
# Should return JSON with model list
curl http://localhost:11434/api/tags
```

## Step 4 — Get Gemini API Key 
For Cloud fallback or Can be set it to primary 
(use any AI API as per need also use AI's help )
i choosed gemini

1. Go to [aistudio.google.com](https://aistudio.google.com)
2. Sign in with Google account
3. Click **Get API key** → **Create API key**
4. Copy and store it securely

**Free tier limits:** 1,500 requests/day, 1M tokens/minute on `gemini-2.0-flash`

Store the key in `configs/secrets.env` (gitignored):
```bash
GEMINI_API_KEY=your_key_here
```

## Verification Checklist

- [ ] `ollama --version` returns a version number
- [ ] `ollama list` shows `qwen2.5-coder:3b`
- [ ] `ollama run` produces a BatComputer response
- [ ] `curl http://localhost:11434/api/tags` returns JSON
- [ ] Gemini API key obtained and stored

## Notes

- Ollama runs as a Windows service — no need to start it manually after reboot
- The local API at `localhost:11434` is what Hermes will connect to in Phase 2
- If WSL2 needs to reach Ollama, see Phase 4 (networking) — requires `OLLAMA_HOST=0.0.0.0`
- Use Hermes for best result
- 
