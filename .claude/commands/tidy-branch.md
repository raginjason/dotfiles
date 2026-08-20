Clean up the current branch's commits before opening a PR.

## Step 1 — Find the base

Try the reflog first:

```
git reflog show $(git branch --show-current) | tail -1
```

This usually contains "branch: Created from <source>". Parse the source branch name from that line.

If the reflog entry is absent or ambiguous, fall back to:

```
git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||'
```

If still ambiguous, ask the user which branch this was cut from.

## Step 2 — Audit

List commits:

```
git log --oneline <base-branch>..HEAD
```

Then check for each of the following. Run `git show <sha>` as needed to inspect diffs.

- **Message violations** — subject not imperative/present tense, over 50 chars, or AI slop
- **Drive-by commits** — unrelated to the branch's main purpose; should move to the front. Use conversation context to judge whether each commit belongs. If genuinely uncertain about a specific commit, ask the user: "Does this commit belong to the main purpose of this branch or is it a drive-by commit?"
- **Bundled commits** — multiple unrelated changes in one commit; should be split
- **Split commits** — one logical change spread across multiple commits; should be squashed
- **Line churn** — a line introduced in one commit is modified or removed in a later commit on the same branch; those commits should be squashed

To detect line churn, scan `git log -p <base-branch>..HEAD` and look for lines that appear as an addition (`+`) in one commit's diff and then as a removal (`-`) in a subsequent commit's diff.

Summarize all findings, grouped by issue type, with specific commit SHAs. Make recommendations where the answer is clear; ask the user where it isn't.

## Step 3 — Get confirmation

Present the full proposed changeset and get explicit approval before touching anything.

## Step 4 — Execute

Record the current HEAD:

```
ORIG_SHA=$(git rev-parse HEAD)
```

Plan the full rebase todo sequence from the audit — reordering, squashes, fixups, rewords, and splits all at once. Execute it as a single rebase using `GIT_SEQUENCE_EDITOR` to write the todo list non-interactively:

```
GIT_SEQUENCE_EDITOR="<script that writes the planned todo>" git rebase -i <base-branch>
```

For splits, use `exec` rather than `edit`. After the `pick` line for the commit to split, insert an `exec` line that runs a generated script:

```
pick <sha> commit to split
exec /tmp/split-<sha>.sh
```

Generate the split script before the rebase runs. It should:
- `git reset HEAD~1` to unstage the commit (mixed reset — changes remain in the working tree)
- Stage the first logical chunk and commit with the appropriate message
- Stage the remaining chunk(s) and commit

If the split is at the file level, use `git add <file>`. If the split requires separating hunks within the same file, generate a patch file for each chunk and apply with `git apply` rather than using interactive `git add -p`.

The rebase continues from the new HEAD automatically — no pausing required.

## Notes

- Stop and report on any conflict — which commit, which files.
- Do not push. Leave that to the user.
- Show the final `git log --oneline <base-branch>..HEAD` for confirmation.

## Verify

Confirm the rebase produced no content changes:

```
git diff $ORIG_SHA HEAD
```

If there is any output, stop and report it before doing anything else.
