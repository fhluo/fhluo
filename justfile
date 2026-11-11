set shell := ["nu", "-c"]
set script-interpreter := ["nu"]
set indentation := "  "
set default-list := true

[script]
[working-directory: 'profile']
commit-cards:
  let changes = (git status --porcelain *.svg)

  if ($changes | is-empty) {
    print "No README card changes."
    exit 0
  }

  git add *.svg
  (
    git
    -c user.name="github-actions[bot]"
    -c user.email="41898282+github-actions[bot]@users.noreply.github.com"
    commit -m "Update README cards"
  )
  git push
