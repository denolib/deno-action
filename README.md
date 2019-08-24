# A action for Github to run Deno command line.

## Usage

create `.github/main.workflow` in you project

```workflow
workflow "Test" {
  on = "push"
  resolves = ["Run test"]
}

action "Run test" {
  uses = "axetroy/deno-action@0.16.0"
  args = "run test.ts"
}
```


## License

The [MIT License](https://github.com/axetroy/deno-action/blob/master/LICENSE)