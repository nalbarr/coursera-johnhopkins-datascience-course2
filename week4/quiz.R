source("best.R")
source("rankhospital.R")
source("rankall.R")

# q1
best("SC", "heart attack")
# [1] "MUSC MEDICAL CENTER"
# Warning message:
#   In best("SC", "heart attack") : NAs introduced by coercion

# q2
best("NY", "pneumonia")
# [1] "MAIMONIDES MEDICAL CENTER"
# Warning message:
#   In best("NY", "pneumonia") : NAs introduced by coercion

#q3
best("AK", "pneumonia")
# [1] "YUKON KUSKOKWIM DELTA REG HOSPITAL"
# Warning message:
#   In best("AK", "pneumonia") : NAs introduced by coercion

#q4
rankhospital("NC", "heart attack", "worst")
# [1] "WAYNE MEMORIAL HOSPITAL"
# Warning message:
#   In rankhospital("NC", "heart attack", "worst") : NAs introduced by coercion

#q5
rankhospital("WA", "heart attack", 7)
# [1] "YAKIMA VALLEY MEMORIAL HOSPITAL"
# Warning message:
#   In rankhospital("WA", "heart attack", 7) : NAs introduced by coercion

#q6
rankhospital("TX", "pneumonia", 10)
# [1] "SETON SMITHVILLE REGIONAL HOSPITAL"
# Warning message:
#   In rankhospital("TX", "pneumonia", 10) : NAs introduced by coercion

#q7
rankhospital("NY", "heart attack", 7)
# [1] "BELLEVUE HOSPITAL CENTER"
# Warning message:
#   In rankhospital("NY", "heart attack", 7) : NAs introduced by coercion

#q8
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
# There were 50 or more warnings (use warnings() to see the first 50)
# > as.character(subset(r, state == "HI")$hospital)
# [1] "CASTLE MEDICAL CENTER"

#q9
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
# There were 46 warnings (use warnings() to see them)
# > as.character(subset(r, state == "NJ")$hospital)
# [1] "BERGEN REGIONAL MEDICAL CENTER"

#q10
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
# There were 50 or more warnings (use warnings() to see the first 50)
# > as.character(subset(r, state == "NV")$hospital)
# [1] "RENOWN SOUTH MEADOWS MEDICAL CENTER"
