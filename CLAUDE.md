# Touchline App — Claude Code Guide

## What this repo is

FlutterFlow-generated Flutter source for a **white-label football platform**.
This template is the foundation for multiple club apps.

## Active Migration

We are migrating from FlutterFlow to a clean modular Flutter monorepo.

**Read the full plan before touching any code:**
[docs/migration/MIGRATION_PLAN.md](docs/migration/MIGRATION_PLAN.md)

The plan is sequential and checkboxed. Find the first unchecked item and continue from there.
Update checkboxes as you complete each step.

## Key facts

- State management target: **Riverpod** (replacing Provider/FFAppState)
- Routing: **GoRouter** (already in use — remove FFRoute wrapper only)
- Theming: **ThemeData + ThemeExtension** (replacing FlutterFlowTheme)
- Component variants: **enum-driven single widget** (see plan Section 4.2)
- `flutter_spinkit` is **intentionally kept** (preferred over default spinner)
- No business logic rewrites — preserve behaviour, change framework abstractions only
- UI must look identical after migration

## Project structure post-migration

```
apps/         Club apps (config + composition only)
packages/     All shared code (no duplication between apps)
```

## Rules

- Do NOT modify code without reading the relevant section of MIGRATION_PLAN.md first
- Do NOT pick a canonical widget version — use the variant enum pattern (see plan)
- Do NOT rename FlutterSecureStorage keys
- Do NOT change API endpoint paths or base URLs
- Do NOT introduce new visual design or UX changes
- Always mark plan checkboxes as complete immediately after finishing a step
