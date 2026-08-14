# Personal Claude Code Instructions

## Git Commits

When committing, inspect the actual staged diff first:
`git status --short && git diff --cached --stat && git diff --cached`.
If nothing is staged, inspect the unstaged diff instead.

Write atomic commits when possible. If unrelated changes are mixed, propose a split.

Use Conventional Commits unless you have instructions to use a different style:

`type(scope): imperative summary`

Use a specific subject, not "update/fix changes". For non-trivial changes,
add a body explaining what changed and why, hard-wrapped at ~72 columns
(`git log` does not reflow). Mention tests only if actually run.

## Markdown Written for GitHub

Never hard-wrap prose in anything destined for a GitHub text field — PR
and MR descriptions, issue bodies, review and PR comments, release notes.
Write each paragraph as a single unbroken line and separate paragraphs
with a blank line. Let GitHub's textarea and renderer do the wrapping.

This is not a soft preference and it is not conditional on paragraph
length: no line-length target, no filling to 72 or 80 columns, no
inserting a newline because a sentence "got long". A hard-wrapped PR
body is wrong even though it renders identically, because the next
person to edit it in the GitHub textarea inherits ragged lines.

The same rule holds when the body is passed through a flag or a file
(`gh pr create --body`, `--body-file`, `gh issue create`,
`gh pr comment`) — the destination is what decides, not the transport.

Two things are exempt, because they are line-oriented rather than prose:

- Fenced code blocks, and long unbreakable tokens (URLs, table rows).
- Commit messages, per Git Commits above — those really do want ~72.

Repo-level instructions win. If a project's `CLAUDE.md` or PR template
sets its own wrapping convention, follow that instead.

## PR Descriptions, Code Comments, and Planning Docs

These are references for whoever implements or maintains the work, not
a record of how you got there. Default to short and lead with the
conclusion. PR descriptions and code comments should state what the
code does now; don't narrate how you arrived at it. Planning docs
should state what to build and why; when rebaselining a plan, replace
outdated sections instead of appending revision history or narrating
what changed and why you changed your mind. Include a
tried-and-abandoned approach or deferred work only when it would help
whoever picks this up next.

## AI Attribution

Never add AI attribution unless explicitly requested. This applies
everywhere: commit messages, PR/MR titles and descriptions, issue text,
code comments, and any other content you author. No "Generated with
Claude Code", "Co-Authored-By: Claude", "🤖 ..." trailers, or similar.
