# Roadmap

## Milestone 1 — reproducible diagnostic build

- [x] Create repository skeleton and project context.
- [x] Add source-only CI checks.
- [x] Add GitHub Actions workflow for a diagnostic PS5 payload ELF.
- [x] Publish ELF with SHA-256 checksum and build metadata.
- [x] Verify the ELF workflow and CI checks on branch `improve/build-artifacts` (commit `4d0eb390`).

## Milestone 2 — native homebrew app and packaging feasibility

- [ ] Select a public, reproducible native homebrew toolchain; the current payload SDK alone does not produce a complete native app or installable PKG.
- [ ] Create a standalone diagnostic application with its own title identity, icon and metadata.
- [ ] Build and inspect the native app output on CI.
- [ ] Determine whether the selected public toolchain can create a package for the intended test environment.
- [ ] If supported, produce a package artifact and document exact installation requirements.
- [ ] Test on target hardware only after confirming compatibility with the firmware and loader.

## Explicit scope and validation

The current milestone does not mount `.exfat`, register a commercial game, or launch `eboot.bin`. Do not describe an ELF, folder build, ZIP or filesystem image as an installable PKG. Any package claim requires a real output artifact and reproducible validation. Firmware 13.20 and etaHEN compatibility remain unverified.
