options(max.print = 1000L)

print.data.frame = function (x, ..., digits = NULL, quote = FALSE, right = TRUE,
                             row.names = TRUE) {
    if (! isTRUE(all.equal(rownames(x), as.character(seq_len(nrow(x))))))
        x = tibble::rownames_to_column(x)
    print(dplyr::tbl_df(x))
}
