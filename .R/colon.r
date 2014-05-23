`:` = function (a, b) {
    if (inherits(a, 'xrange'))
        do.call(seq, as.list(c(range(a), by = b)))
    else if (inherits(a, 'factor'))
        interaction(a, b, sep = ':')
    else
        structure(seq(a, b), class = 'xrange')
}

print.xrange = function (x)
    print(as.numeric(x))
