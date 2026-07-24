# Hide Notes Entry Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove all site-visible entry points to the Notes page while keeping `/mynotes/` directly accessible.

**Architecture:** Make a minimal shared-layout change to remove the navigation link, keep the dedicated notes page untouched, and update repository documentation so it no longer describes Notes as a standard navigation destination. Verify by searching references and building the Jekyll site.

**Tech Stack:** Jekyll, Liquid templates, Markdown

---

### Task 1: Remove the shared navigation entry

**Files:**
- Modify: `_layouts/default.html`

- [ ] **Step 1: Write the failing test**

Search for the current navigation entry to prove it exists before removal.

Run: `rg -n "<a href=\"\\{\\{ '/mynotes/' \\| relative_url \\}\\}\"|>Notes<" _layouts/default.html`
Expected: a match showing the `Notes` anchor in the shared navigation.

- [ ] **Step 2: Run test to verify it fails**

Run: `rg -n "<a href=\"\\{\\{ '/mynotes/' \\| relative_url \\}\\}\"|>Notes<" _layouts/default.html`
Expected: exit code `0` with a line containing the `Notes` link, proving the undesired behavior exists.

- [ ] **Step 3: Write minimal implementation**

Remove the `Notes` anchor from the `.nav-links` block and leave the `About` link intact.

- [ ] **Step 4: Run test to verify it passes**

Run: `rg -n "<a href=\"\\{\\{ '/mynotes/' \\| relative_url \\}\\}\"|>Notes<" _layouts/default.html`
Expected: no match for the removed navigation entry.

- [ ] **Step 5: Commit**

```bash
git add _layouts/default.html
git commit -m "Remove Notes navigation entry"
```

### Task 2: Remove repository-level public navigation wording

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Write the failing test**

Search for the README wording that still presents Notes as a normal site page.

Run: `rg -n "notes page|about page" README.md`
Expected: a match describing the site as having a notes page.

- [ ] **Step 2: Run test to verify it fails**

Run: `rg -n "notes page|about page" README.md`
Expected: exit code `0` with the current wording present.

- [ ] **Step 3: Write minimal implementation**

Change the README description so it describes course-note assets without advertising a public Notes navigation page.

- [ ] **Step 4: Run test to verify it passes**

Run: `rg -n "notes page" README.md`
Expected: no match.

- [ ] **Step 5: Commit**

```bash
git add README.md
git commit -m "Update README notes wording"
```

### Task 3: Verify direct access remains while site-visible entries are removed

**Files:**
- Verify: `_layouts/default.html`
- Verify: `mynotes.md`
- Verify: `README.md`

- [ ] **Step 1: Write the failing test**

Define the final checks:
- shared navigation should not contain a `Notes` link
- `mynotes.md` should still declare `permalink: /mynotes/`
- repo-wide search should show no remaining site-visible `/mynotes/` links outside the page definition/spec docs

- [ ] **Step 2: Run test to verify it fails**

Run: `rg -n "mynotes|Notes" _layouts/default.html mynotes.md README.md`
Expected before implementation: `_layouts/default.html` still contains `Notes`.

- [ ] **Step 3: Write minimal implementation**

No additional code if prior tasks are complete.

- [ ] **Step 4: Run test to verify it passes**

Run: `rg -n "mynotes|Notes" _layouts/default.html mynotes.md README.md`
Expected: `_layouts/default.html` no longer shows the nav entry, `mynotes.md` still contains `permalink: /mynotes/`, and README no longer describes a notes page.

Run: `bundle exec jekyll build`
Expected: successful build with exit code `0`.

- [ ] **Step 5: Commit**

```bash
git add _layouts/default.html README.md
git commit -m "Hide public Notes entry"
```
