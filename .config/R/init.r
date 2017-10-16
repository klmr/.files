options(
    pager = path.expand('~/.config/R/pager'),
    # Imperial College London
    repos = c(CRAN = 'https://cran.ma.imperial.ac.uk/'),
    menu.graphics = FALSE, # Seriously, WHAT THE FUCK, R!?
    import.path = '~/.config/R/modules',
    devtools.name = 'Konrad Rudolph',
    devtools.desc.author = 'Konrad Rudolph <konrad.rudolph@gmail.com> [aut, cre]',
    devtools.desc.license = 'file LICENSE',
    devtools.desc.suggests = c('knitr', 'testthat'),
    warnPartialMatchArgs = TRUE,
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE
)

.libPaths('~/.config/R/packages')

# All the following is executed in its own environment, which will subsequently
# be attached to the object search path.

local({
    # Load individual source files
    profile_env = new.env()
    local_r_path = '~/.config/R'
    config_path = c(local_r_path, if (interactive()) file.path(local_r_path, 'interactive'))
    source_files = list.files(config_path, pattern = '\\.[rR]$', full.names = TRUE)
    source_files = source_files[-grep('init\\.[rR]', source_files)]

    for (source_file in source_files)
        # Ignore errors in individual files.
        try(eval(parse(source_file, encoding = 'UTF-8'), envir = profile_env))

    attach(profile_env, name = 'rprofile', warn.conflicts = FALSE)
})

if (interactive()) {
    local({
        # Load `modules` last to make `modules::?` findable.
        packages = c('colorout', 'modules')
        options(defaultPackages = c(getOption('defaultPackages'), packages))
    })

    message(R.version$version.string)

    .post_package_loading_hook = function () {
        setOutputColors256(verbose = FALSE)
    }

    .Last = function ()
        try(savehistory(Sys.getenv('R_HISTFILE', '~/.Rhistory')))
}
