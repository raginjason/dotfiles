## Commit messages

- Each commit covers one logical change; don't bundle unrelated changes, don't split a single change across commits
- If a commit introduces a line that a later commit on the same branch modifies, those commits should be squashed
- Each commit must leave the codebase in a buildable state
- Drive-by commits go at the beginning of the branch
- Subject: imperative present tense, max 50 characters
- Body: optional; if present, concise, what/why not how, lines wrapped at 72 chars
