# Create Phase 2 Hermes doc
# Phase 2 — Hermes Agent Installation & Configuration

**Status: ✅ COMPLETE** — June 17, 2026

## Goal
Install Hermes Agent on WSL2 Ubuntu and connect it to Gemini 2.5 Flash as primary model.

## Why Hermes over OpenClaw
- Persistent memory across sessions (SOUL.md)
- Self-improving skills
- WSL/Linux native
- Telegram gateway (official, no ban risk)
- 28 tools + 68 skills out of the box
- Built by Nous Research

## Steps Completed

### Pre-step — Remove OpenClaw
```bash
systemctl --user stop openclaw-gateway.service
systemctl --user disable openclaw-gateway.service
rm -f ~/.config/systemd/user/openclaw-gateway.service
systemctl --user daemon-reload
npm uninstall -g openclaw
rm -rf ~/.openclaw ~/.clawdbot ~/.moltbot ~/.molthub
sudo rm /usr/bin/openclaw
```

### Step 1 — Install Hermes Agent
```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc
```

### Step 2 — Configure Model
```bash
hermes setup model
# Provider: Google Gemini → Google AI Studio
# Model: gemini-2.5-flash
# API key stored in ~/.hermes/.env
```

### Step 3 — Verify
```bash
hermes
# → "Hello! I am online and ready to assist you."
# → gemini-2.5-flash responding
# → 28 tools, 68 skills loaded
# → TTS working (Edge TTS)
```

## Verified State
- Hermes Agent v0.16.0 (2026.6.5)
- Model: gemini-2.5-flash via Google AI Studio
- Tools: 28 active toolsets
- Skills: 68 loaded
- TTS: Edge TTS working
- Location: ~/.hermes/

## Key Files
- Config: ~/.hermes/config.yaml
- API Keys: ~/.hermes/.env
- Skills: ~/.hermes/skills/

## Next Step
Phase 3 — Telegram gateway setup
