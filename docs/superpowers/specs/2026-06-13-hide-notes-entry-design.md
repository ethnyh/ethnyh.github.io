## Summary

Hide all site-visible entry points to the Notes page while keeping the page itself reachable at `/mynotes/` when the URL is entered directly.

## Scope

- Remove the `Notes` link from the shared site navigation.
- Remove or avoid any other site-visible links that point users to `/mynotes/`.
- Keep the existing `mynotes.md` page and its `permalink: /mynotes/`.
- Update repository documentation so it does not describe Notes as a normal navigable page.

## Out of Scope

- Adding authentication, password protection, or access control.
- Changing the `/mynotes/` URL.
- Blocking search engine indexing unless requested separately.

## Current Structure

- The primary navigation is defined in `_layouts/default.html`.
- The Notes page is implemented by `mynotes.md` and exposed at `/mynotes/`.
- `index.md` and `404.html` do not currently link to `/mynotes/`.
- `README.md` still describes the site as having a normal notes page.

## Proposed Change

1. Delete the `Notes` navigation item from `_layouts/default.html`.
2. Leave `mynotes.md` unchanged so direct URL access still works.
3. Update `README.md` wording so it no longer presents Notes as part of the public navigation.
4. Verify via repo-wide search that no visible links to `/mynotes/` remain.

## Data Flow / Routing

- Visiting `/` continues to render the About page.
- Visiting `/mynotes/` directly continues to render the Notes page.
- No in-site button or link should route a visitor from the normal site UI to `/mynotes/`.

## Error Handling

- No runtime logic changes are required.
- If future pages add links to `/mynotes/`, the repo-wide search step should catch them.

## Testing

- Search the repository for `mynotes` and `Notes` references after the change.
- Build the site locally if the toolchain is available and confirm:
  - navigation no longer shows `Notes`
  - `/mynotes/` still renders
