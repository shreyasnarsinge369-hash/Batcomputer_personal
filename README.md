# 🦇 BatComputer — Local AI or Cloud AI Stack

> A fully self-hosted, locally or Cloud Based executing AI agent setup running on consumer hardware.

## Hardware for local AI Users

| Component | Spec |
|-----------|------|
| GPU | NVIDIA RTX 3050 (6GB VRAM) |
| CPU | AMD Ryzen 5 7235HS |
| RAM | 24GB System RAM |
| OS | Windows 11 + WSL2 (Ubuntu) |

## Stack

| Layer | Tool |
|-------|------|
| Model Runtime | [Ollama](https://ollama.com) (Windows-native) |
| Primary Model | `qwen2.5-coder:3b` (local, offline, use any model as per suitablilty ) |
| Cloud Fallback | Gemini 2.5 Flash (via API or any AI api if other subscription purchased ) |
| Agent Platform | [Hermes agent] search it up!!!!|

## Architecture

```
Windows Host
├── Ollama (background service) → localhost:11434
│   └── qwen2.5-coder:3b (~2GB VRAM) OR Full Cloud 
└── Hermes Agent (agent platform)
    ├── Provider: Gemini (2.5flash) (use according to your needs any AI or LLM or Cloud based)

WSL2 (Ubuntu)
└── Dev environment, scripts, configs
```

## Setup Phases

| Phase | Description | Status |
|-------|-------------|--------|
| [Phase 1](phases/phase1-local-or-cloud-windows.md) | Ollama Model + Gemini API / Vice versa | ✅ Done  |
| [Phase 2](phases/phase2-hermes.md) | Hermes Agent Installation & Config | ✅ Done |
| [Phase 3](phases/phase3-providers.md) | Provider Setup (Local + Cloud) | ✅ Done 
| [Phase 4](phases/phase4-networking.md) | WSL2 Networking (if needed) | ⏳ Pending |
| [Phase 5](phases/phase5-verification.md) | End-to-End Verification | ⏳ Pending |
| [Phase 6](phases/phase6-troubleshooting.md) | Troubleshooting Reference | ⏳ Pending |

## Quick Status Check

```powershell
# Check Ollama is running (PowerShell)
ollama list
curl http://localhost:11434/api/tags
```

```bash
# Check from WSL2
curl http://$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):11434/api/tags
```

## Principles

- **VRAM is the binding constraint** — always verify model fits within 6GB ceiling
- **Local first** — Ollama handles everything offline; Gemini is fallback only or Cloud is primary and ollama fallback
- **WSL2 networking** — host IP resolution via `/etc/resolv.conf` is the common failure point
- **Verify before trusting** — online guides frequently contain fabricated package names and wrong CLI commands
