pbcopy = function (object, transform = NULL) {
    if (! is.null(transform))
        object = capture.output(transform(object))
    on.exit(close(f))
    f = pipe('pbcopy', 'w')
    writeLines(object, f)
}

pbpaste = function () {
    on.exit(close(f))
    f = pipe('pbpaste')
    readLines(f)
}
