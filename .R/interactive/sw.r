local({
    setwidth = function () options(width = as.integer(Sys.getenv('COLUMNS')))
    makeActiveBinding('sw', setwidth, baseenv())
})
