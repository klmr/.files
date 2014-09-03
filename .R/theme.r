# Set ggplot2 theme

setHook(packageEvent('ggplot2', 'attach'),
    function (...) {
        library(ggthemr)
        ggthemr('solarized dark', type = 'outer')
    })
