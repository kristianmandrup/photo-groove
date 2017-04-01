# Elm in Action (learning project)

[![Greenkeeper badge](https://badges.greenkeeper.io/kristianmandrup/photo-groove.svg)](https://greenkeeper.io/)

Project for learning Elm with the book [Elm in Action](https://www.manning.com/books/elm-in-action)

Also see [rtfeldman repo](https://github.com/rtfeldman/elm-in-action)

## Branches

- v1: Displays 3 images, before section 2.2

## Run

I created the following helper bash functions in my `~/.bash_profile`

```bash
ei() {
  echo "elm package install $1"
  elm-package install $1
}

em() {
  deftarget="elm.js"
  target=${2:-$deftarget}

  echo "elm make $1 $target"
  elm-make $1 --output $target
}
```

### Install package dependencies

`ei`

**specific package**

`ei [package]` such as `ei elm-lang/html`

### Make

`em PhotoGroove.elm elm.js`

### Open web page

`open index.html`

## Auto build with Gulp

`npm i -D gulp-elm gulp`

See [gulp-elm](https://www.npmjs.com/package/gulp-elm) and [sample elm gulpfile](https://gist.github.com/dennisreimann/cd8d45eefaba43199dcd)

## Live Reload

[livereload with gulp](https://scotch.io/tutorials/a-quick-guide-to-using-livereload-with-gulp)

Install [livereload Chrome extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei/related?hl=en)

## License

ISC Kristian Mandrup