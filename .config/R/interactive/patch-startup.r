# Patch `base::.First.sys` to allow hooking a function into the loading process
# *after* user packages were loaded.

call_hook = function (hook_name) {
    stopifnot(is.character(hook_name) && length(hook_name) == 1)

    hook_name = paste0('.', hook_name)
    hook = try(get(hook_name, envir = parent.frame(), mode = 'function'),
               silent = TRUE)
    if (! inherits(hook, 'try-error'))
        hook()
}

.First.sys = function () {
    base::.First.sys()
    call_hook('post_package_loading_hook')
}
