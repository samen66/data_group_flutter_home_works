# Release Bugs/Risks and Rollback Plan (1 page)

## Scope
Android internal release for testers with authentication flow, list screen, add item flow, and logout flow.

## Top release risks
1. **Signing misconfiguration**
   - Symptom: release build fails or Play Console rejects the artifact.
   - Impact: release blocked.
   - Mitigation: keep validated `android/key.properties` locally and run `flutter build appbundle --release` before upload.

2. **Versioning mismatch**
   - Symptom: Play Console rejects upload because `versionCode` is not incremented.
   - Impact: cannot publish new internal build.
   - Mitigation: enforce version bump in `pubspec.yaml` per release checklist.

3. **UI regressions on real devices**
   - Symptom: splash/icon layout issues or broken navigation on specific screen sizes.
   - Impact: poor testability and user trust issues.
   - Mitigation: validate on at least one physical Android device and one emulator before rollout.

4. **Unexpected permission prompts**
   - Symptom: system permission dialog appears without clear context.
   - Impact: testers may deny permissions and block critical flow.
   - Mitigation: only declare permissions when feature is implemented; add in-app pre-permission text and policy update.

5. **Backend/environment instability**
   - Symptom: login/list/add failures due to unstable API endpoint.
   - Impact: critical flow broken for testers.
   - Mitigation: smoke-test against target environment before publishing; keep fallback test build with fake backend.

## Minimum release bug list to track
- R1: App does not start after install/update.
- R2: Login fails for valid tester credentials.
- R3: List screen does not load or remains empty unexpectedly.
- R4: Add action appears successful but item is not persisted.
- R5: Logout does not clear session.
- R6: Crash/ANR during first minute of usage.

## Go/No-Go criteria
- All automated tests are green in CI.
- Release `AAB` built and verified locally.
- Internal testing rollout created with notes and tester list.
- No unresolved critical bugs (R1-R3).

## Rollback plan
1. **Immediate containment**
   - Halt staged increase or unpublish active internal release if needed.
2. **Fallback version**
   - Promote last known stable internal build in Play Console, or upload a hotfix with incremented `versionCode`.
3. **Communication**
   - Notify tester group with issue summary and expected fix ETA.
4. **Root cause and fix**
   - Reproduce in debug/release mode, patch, rerun CI and targeted smoke tests.
5. **Re-release**
   - Publish hotfix to internal track first, validate with a subset of testers, then roll out to full internal group.
