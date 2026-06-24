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
# → gemini-2.5-flash responding 0r 3.5 (any model)
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
 Telegram gateway setup
### Step 1 — Base Installation of Hermes Agent
Executed the automated shell installer script to compile files, configure path variables, and initialize the localized virtual environment:

Bash
curl -fsSL [https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh](https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh) | bash
source ~/.bashrc
### Step 2 — Core Model & Provider Allocation
Configured the primary reasoning engine, pointing directly to Google AI Studio with production-tier credentials:

Bash
hermes model
# Provider selected: Google AI Studio
# API tier check verified: Paid Status Enabled (bypasses standard free-tier rate limits)
# Target Model Selected: gemini-3.5-flash (Optimized for speed, low-latency, and complex logic)
# Global Environment State updated inside ~/.hermes/.env
### Step 3 — Telegram Gateway Initialization & Custom Integration
Created a dedicated Telegram Bot via @BotFather named BatComputer_Wayne_bot and hooked it natively into the messaging engine.

Gateway Interface Provisioning:

Bash
hermes setup gateway
Choice: [2] Manual (Leveraging custom bot instance).

Token Saved: *********************************************

Security & Identity Restriction:

Isolated bot interaction to prevent arbitrary user execution. Captured local client user ID using @userinfobot.

Allowed User ID Constraint: ********************(id provided by @userinfobot)

Telegram Home Channel Mapping: Bound to User ID ************* to establish an automated pipeline for system task execution summaries, cron job delivery, and alerts.

Technical Troubleshooting Log & Resolving ISP Blocks
During deployment, the gateway initially encountered an silent failure loop (no response on Telegram). Running hermes logs surfaced two core network and authentication blockages:

Block 1: ISP Restrictions on the Telegram API
The terminal executed an infinite hang when communicating directly with api.telegram.org due to Indian ISP level filtering on direct WSL virtual bridges.

The Resolution: 1. Deployed Cloudflare One Client (WARP) on the Windows host machine via the Private Browsing network stack.
2. Forced WSL2 to mirror the host's VPN/network routing table by injecting Mirrored Networking Mode into the system architecture configuration layer (C:\Users\shrey\.wslconfig):

Ini, TOML
[wsl2]
networkingMode=mirrored
Cycled the environment engine using wsl --shutdown and verified network compliance. The check successfully cleared standard restrictions:

Bash
curl -I [https://api.telegram.org](https://api.telegram.org)
# Result: HTTP/2 302 (Connection Handshake Successful)
Block 2: 503 Provider Congestion and Discord Privileged Intent Errors
Gemini Free-Tier Exhaustion: The API initially surfaced Gemini HTTP 503 (UNAVAILABLE) due to high concurrent traffic on the unauthenticated model instances. This was permanently fixed by verifying and re-linking the paid production token key layer inside hermes model and moving up to gemini-3.5-flash.

Discord Privilege Constraints: Identified a mismatch where the plugin framework requested structural context without explicit Discord dashboard authorization. This was resolved inside the Discord Developer Portal under the specific application settings by toggling the Presence, Server Members, and Message Content switches to ON.

Verified Operating State
┌─────────────────────────────────────────────────────────┐
│              ⚕ Hermes Agent Status Summary             │
└─────────────────────────────────────────────────────────┘
◆ Environment
  Project Path:    /home/shreyas/.hermes/hermes-agent
  Python Context:  3.11.15
  Active Engine:   gemini-3.5-flash (Paid Production Tier)

◆ Messaging Platforms Configuration
  Telegram:        ✓ Operational (Home & Lockout ID: 2100964948)
  Bot Username:    @botusername(end it with 'bot')
  Discord:         ✓ Enabled (Intents Granted)

◆ Gateway Service
  Process Status:  ✓ Running (Active under systemd user scope)

Key Files & Paths
Config Manifest: ~/.hermes/config.yaml

Environment Secrets Cache: ~/.hermes/.env

Dynamic Skill Modules: ~/.hermes/skills/

Runtime Error Logging Output: ~/.hermes/logs/agent.log


### Next Steps — Phase 3
[ ] Configure specialized calisthenics, fitness tracker, and daily study macro workflows inside local markdown repositories.(or whatever you have to configure)

[ ] Implement custom Python/Node scripts within ~/.hermes/skills/ for usage