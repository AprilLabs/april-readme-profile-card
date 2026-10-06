# April README Profile Card

Generate light and dark GitHub stats cards and JSON statistics for [AprilNEA](https://github.com/AprilNEA), based on [Sukka's profile card project](https://github.com/SukkaLab/sukka-readme-profile-card).

## Deployment

Set **Settings → Pages → Build and deployment → Source** to **GitHub Actions**. Push changes to `master`, or run the **Update** workflow manually. The workflow also runs at minutes 13 and 42 of each hour.

The workflow uses the built-in `GITHUB_TOKEN` for public statistics. To include private statistics, add a repository Actions secret named `PAT_1` with a personal access token that has `repo` and `read:user` scopes. When `PAT_1` exists, the workflow uses that token instead.

After a successful deployment, the files are available at:

- [Light card](https://aprillabs.github.io/april-readme-profile-card/light.svg)
- [Dark card](https://aprillabs.github.io/april-readme-profile-card/dark.svg)
- [JSON statistics](https://aprillabs.github.io/april-readme-profile-card/github-stats.json)

## Embed

```html
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://aprillabs.github.io/april-readme-profile-card/dark.svg">
  <img src="https://aprillabs.github.io/april-readme-profile-card/light.svg" alt="AprilNEA's GitHub statistics">
</picture>
```

## Local use

Use Node.js 26 and pnpm 11.17.0. After authenticating GitHub CLI, run:

```sh
pnpm install --frozen-lockfile
pnpm run lint
pnpm run typecheck
PAT_1="$(gh auth token)" pnpm run download
```

The download command writes `public/github-stats.json`. GitHub Actions generates the SVG cards.
