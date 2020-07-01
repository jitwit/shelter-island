NB. flip a sign to have y decrease with pixel value?
pixelR3 =: C + (DR,:EH) +/ . *~ SUR*(EC*3 o.-:ANG) * WH%~-&(-:WH)
pixelRay=: unit @ E -~ pixelR3

