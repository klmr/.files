options(pager = '/Users/rudolph/.R/pager.sh',
        # Imperial College London
        repos = c(CRAN = 'http://cran.ma.imperial.ac.uk/'),
        menu.graphics = FALSE, # Seriously, WHAT THE FUCK, R!?
        devtools.name = 'Konrad Rudolph',
        devtools.desc.author = 'Konrad Rudolph <konrad.rudolph@gmail.com> [aut, cre]',
        devtools.desc.license = 'file LICENSE',
        xsourcePath = '~/Projects/R')

source('~/Projects/R/rcane/xsource.R')

# Load individual source files {{{
local <- '~/.R'
sourcefiles <- list.files(local, pattern = '\\.[rR]$', full.names = TRUE)

for (sourcefile in sourcefiles)
    source(sourcefile, chdir = TRUE)

rm(local, sourcefiles, sourcefile)
# }}}

if (interactive()) {
    qno <- function () quit('no')

    # Pipe operator modified after Robert Sugar, e.g. at
    # <http://markmail.org/thread/uygwsdulfvxlydlh>
    `%|%` <- function (x, y) {
        thecall <- match.call()
        if (is.name(thecall$y) || is.function(thecall$y))
            y(x)
        else
            eval(thecall$y, list(value = eval(thecall$x)))
    }

    library(colorout)
    setOutputColors256(verbose = FALSE)
    library(setwidth)
    library(vimcom.plus)

    .Last <- function ()
        try(savehistory(Sys.getenv('R_HISTFILE', '~/.Rhistory')))
}

# Purge the global environment

allObjects <- ls()
profileenv <- new.env()
for (obj in allObjects)
    profileenv[[obj]] <- get(obj)

rm(list = allObjects)
attach(profileenv, name = 'module:rprofile')
rm(profileenv, allObjects, obj)
