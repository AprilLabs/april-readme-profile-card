# April README Profile Card

Generate light and dark GitHub stats cards and JSON statistics for [AprilNEA](https://github.com/AprilNEA), based on [Sukka's profile card project](https://github.com/SukkaLab/sukka-readme-profile-card).

## Deployment

Set **Settings → Pages → Build and deployment → Source** to **GitHub Actions**. Push changes to `master`, or run the **Update** workflow manually. The workflow also runs at minutes 13 and 42 of each hour.

Before running the workflow, add a repository Actions secret named `PAT_1` with a personal access token for the statistics account. Use a token with access to public data for public statistics. To include private statistics, use a classic token with `repo` and `read:user` scopes. The built-in `GITHUB_TOKEN` cannot read the account-wide repository statistics used by this workflow.

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

Use `devenv shell` to enter the Node.js 26 environment. pnpm uses the version specified in `package.json` (11.17.0). To activate the environment when entering the directory, run `direnv allow`.

CI uses Node.js and pnpm directly. After authenticating GitHub CLI, run these commands inside the development environment:

```sh
pnpm install --frozen-lockfile
pnpm run lint
pnpm run typecheck
PAT_1="$(gh auth token)" pnpm run download
```

The download command writes `public/github-stats.json`. GitHub Actions generates the SVG cards.
