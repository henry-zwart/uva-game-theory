# UvA Game Theory Typst homework template

> [!NOTE]
> This template is not my original work, and is an adaptation of [Ulle Endriss'](https://staff.fnwi.uva.nl/u.endriss/) LaTeX template for the same course.

A Typst template for the University of Amsterdam Game Theory course.

Can be used either [locally](#local-usage) or within the [Typst Webapp](#use-within-typst-webapp).

## Local usage
Using the template requires a local installation of [Typst](https://github.com/typst/typst#installation).

Until the template is listed on the Typst template repository, you'll also need a clone of
this repo in a place Typst can see it. The Typst team recommend:

> `{data-dir}/typst/packages/local/uva-game-theory/{version}`

Where `{version}` is the current version as it appears in [typst.toml](typst.toml), and
`{data-dir}` depends on your operating system:

- `~/.local/share` (Linux)
- `~/Library/Application Support` (MacOS)
- `%APPDATA%` (Windows)

To use the template:

```zsh
# Navigate to where you'd like the report to live, e.g.,
cd $HOME/reports

# Create the report directory
typst init @local/uva-game-theory:{version} {report-directory-name}
```

This will create a new directory at `$HOME/reports/{report-directory-name}`, with
a templated document, `main.typ`, which you can edit.

## Use within Typst webapp
Create a new project within Typst, and upload the following files from this repository:

- `src/resources/*`: UvA logos for page headers
- `src/lib.typ`: Defines the page setup and general style
- `src/games.typ`: Show normal form games as a matrix

For a 'ready-made' example template, also upload the following files which recreate Ulle's homework template:

- `template/main.typ`: Main entrypoint to the Typst document, akin to `main.tex`
- `template/solutions.typ`: Contains all of the content

## Contributing

Pull requests are welcome. For major changes or bugs, please open an issue.

## License

[MIT](https://choosealicense.com/licenses/mit/)
