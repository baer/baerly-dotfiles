# Personal Codex Instructions

## Pull request merge authority — hard stop

- Never merge a pull request, enable auto-merge, invoke a PR merge API,
  or push directly to the default branch unless the user explicitly
  approves merging that specific PR after the PR exists.
- “Complete,” “finish,” “ship,” “close out,” passing checks, issue-closing
  text, and tool/escalation approvals do not grant merge permission.
- After opening or updating a PR, report its URL and check status, then
  stop and ask for merge approval.
- Do not infer merge authorization from the requested outcome.

## Git push authority — hard stop

- Never run `git push`, force-push, publish a branch, or otherwise update
  remote refs unless the user explicitly authorizes that specific push
  after the local commit exists.
- “Complete,” “finish,” “ship,” “address the review,” “update the PR,” and
  similar requests do not grant push permission.
- Finish work locally: verify it, commit it if authorized, report the commit
  hash and destination branch, then stop.
- Ask for permission in this form: “Commit `<sha>` is ready to push to
  `<remote>/<branch>`. May I push it?”
- Tool or escalation approval only permits executing the approved command;
  it does not replace explicit push authorization.

## PR Descriptions, Code Comments, and Planning Docs

- These are references for whoever implements or maintains the work,
  not a record of how you got there. Default to short and lead with the
  conclusion.
- PR descriptions and code comments should state what the code does
  now; don't narrate how you arrived at it.
- Planning docs should state what to build and why. When rebaselining a
  plan, replace outdated sections instead of appending revision history
  or narrating what changed and why.
- Include a tried-and-abandoned approach or deferred work only when it
  would help whoever picks this up next.

## Git Commits

When committing, inspect the actual staged diff first:
`git status --short && git diff --cached --stat && git diff --cached`.
If nothing is staged, inspect the unstaged diff instead.

Write atomic commits when possible. If unrelated changes are mixed, propose a split.

Use Conventional Commits unless you have instructions to use a different style:

`type(scope): imperative summary`

Use a specific subject, not "update/fix changes". For non-trivial changes,
add a wrapped body explaining what changed and why. Mention tests only if
actually run. Never add AI attribution unless requested.
