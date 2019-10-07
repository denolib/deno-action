# An action for Github to run Deno command line.

## Usage

create `.github/main.workflow` in your project

```workflow
workflow "Test" {
  on = "push"
  resolves = ["Run test"]
}

action "Run test" {
  uses = "denolib/deno-action@0.20.0"
  args = "run test.ts"
}
```

Here is an [example for using](https://github.com/axetroy/deno_math/blob/master/.github/main.workflow)


## License

[MIT](LICENSE) © 2019 DenoLib Contributors.
