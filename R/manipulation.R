summarise_category <- function(data, prefix, has_other = TRUE) {

    summ_data <- data %>%
        select(starts_with(prefix)) %>%
        mutate(TotalCount = n()) %>%
        gather(key = "Key", value = "Has", -TotalCount) %>%
        filter(Has == TRUE) %>%
        mutate(Key = str_remove(Key, prefix)) %>%
        mutate(Key = factor(Key)) %>%
        mutate(Key = fct_infreq(Key)) %>%
        group_by(Key, TotalCount) %>%
        summarise(Count = n()) %>%
        ungroup() %>%
        mutate(Prop = Count / TotalCount)

    if (has_other) {
        summ_data <- summ_data %>%
            mutate(Key = fct_relevel(Key, "HasOther", after = Inf))
    }

    return(summ_data)
}


summarise_category_grouped <- function(data, prefix, group_var,
                                       has_other = TRUE) {

    group_var <- enquo(group_var)

    summ_data <- data %>%
        select(starts_with(prefix), !! group_var) %>%
        group_by(!! group_var) %>%
        mutate(TotalCount = n()) %>%
        ungroup() %>%
        gather(key = "Key", value = "Has", -TotalCount, -!! group_var) %>%
        filter(Has == TRUE) %>%
        mutate(Key = str_remove(Key, prefix)) %>%
        mutate(Key = factor(Key)) %>%
        mutate(Key = fct_infreq(Key)) %>%
        group_by(Key, TotalCount, !! group_var) %>%
        summarise(Count = n()) %>%
        ungroup() %>%
        mutate(Prop = Count / TotalCount)

    if (has_other) {
        summ_data <- summ_data %>%
            mutate(Key = fct_relevel(Key, "HasOther", after = Inf))
    }

    return(summ_data)
}
