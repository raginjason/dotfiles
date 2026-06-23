## Git commits
- Each commit should be atomic, leaving the codebase in a buildable state
- Description should use imperative, present tense
- Limit description length to 50 characters
- Body is optional, but if it exists should use concise language about the what and why, not the how
- Do not use any AI slop
- Wrap body text at 72 characters
- If any drive-by commits are made, place them at the begining of the branch

## Pull requests
- Honor any existing PR template when creating the PR body
- Use concise language in the PR body
- Do not use any AI slop
- Summarize the body of work the PR covers, but do not re-state things that the commits in the PR address
- Ensure coherence between the changes made in the branch and the PR body

## Writing Style

When writing any prose such as: comments, docs, commit messages, READMEs, error messages, UI copy, Jira tickets, or Confluence pages, follow these rules:

**Forbidden words and phrases:**
- delve, tapestry, unleash, leverage (as a verb), robust, seamless, streamline
- "it's worth noting", "it's important to note", "notably"
- "in today's world", "in the modern landscape", "ever-evolving"
- "I'd be happy to", "certainly!", "absolutely!", "of course!"
- Any sentence that restates what the next sentence already says

**Style rules:**
- Be terse
- No em-dash padding (— used to add fake drama)
- No bullet points that could just be a sentence
- No "This function does X. It also does Y." — just say what it does once
- Prefer concrete over abstract: say what a thing *does*, not what it *enables*
- No throat-clearing intros ("In this document, we will explore...")
- End when you're done — no summary paragraphs that repeat the intro
