// Imports
#import "../robin-cv.typ": cv-publication, cv-section


#cv-section("论文")

#cv-publication(
  bib: bibliography("../assets/publications.bib"),
  key-list: (
    "smith2020",
    "jones2021",
    "wilson2022",
  ),
  ref-style: "ieee",
)
