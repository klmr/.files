options(pager = file.path(Sys.getenv('HOME'), '.R/pager.sh'),
        # Imperial College London
        repos = c(CRAN = 'http://cran.ma.imperial.ac.uk/'),
        menu.graphics = FALSE, # Seriously, WHAT THE FUCK, R!?
        import.path = '~/Projects/R',
        devtools.name = 'Konrad Rudolph',
        devtools.desc.author = 'Konrad Rudolph <konrad.rudolph@gmail.com> [aut, cre]',
        devtools.desc.license = 'file LICENSE',
        devtools.desc.suggests = c('knitr', 'testthat'))

.libPaths('~/R-dev')

# All the following is executed in its own environment, which will subsequently
# be attached to the object search path.

if (interactive()) {
    local({
        profile_env = new.env()
        evalq({
            # Load individual source files {{{
            local_r_path <- file.path(Sys.getenv('HOME'), '.R')
            sourcefiles <- list.files(local_r_path, pattern = '\\.[rR]$', full.names = TRUE)

            for (sourcefile in sourcefiles)
                source(sourcefile, chdir = TRUE, local = TRUE)
            # }}}
        }, envir = profile_env)

        attach(profile_env, name = 'rprofile')
    })

    library(colorout)
    setOutputColors256(verbose = FALSE)
    library(setwidth)
    library(vimcom)

    # Load `modules` last to make `modules::?` findable.
    options(defaultPackages = c(getOption('defaultPackages'), 'modules'))

    .Last <- function ()
        try(savehistory(Sys.getenv('R_HISTFILE', '~/.Rhistory')))

    message(R.version$version.string)
}
