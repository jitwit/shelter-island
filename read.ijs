line =: ({. , [: 0&". &.> {:) @ (</.~ +./\ @ (=&' '))
ignore =: -. @: ('# ' e.~ {."1@:(>@({."1)))
tok =: (#~ ignore) @ (line ;. _2)
NB. assume size then camera first specs
scene_cam =: ; @ {: @ |: @ |. @ (2&{.)