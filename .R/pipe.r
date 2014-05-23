# Pipe operator modified after Robert Sugar, e.g. at
# <http://markmail.org/thread/uygwsdulfvxlydlh>
`%|%` <- function (x, y) {
    thecall <- match.call()
    if (is.name(thecall$y) || is.function(thecall$y))
        y(x)
    else
        eval(thecall$y, list(value = eval(thecall$x)))
}
