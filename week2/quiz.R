## quiz.R

source("pollutantmean.R")
source("complete.R")
source("corr.R")

# q1
pollutantmean("specdata", "sulfate", 1:10)
# [1] 4.064128

# q2
pollutantmean("specdata", "nitrate", 70:72)
# [1] 1.706047

# q3
pollutantmean("specdata", "sulfate", 34)
# [1] 1.477143

# q4
pollutantmean("specdata", "nitrate")
# [1] 1.702932

# q5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
# [1] 228 148 124 165 104 460 232

# q6
cc <- complete("specdata", 54)
print(cc$nobs)
# [1] 219

# q7
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
# [1] 711 135  74 445 178  73  49   0 687 237

# q8
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
# [1]  0.2688  0.1127 -0.0085  0.4586  0.0447

# q9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
# [1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

# q10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
# [1]  0.0000 -0.0190  0.0419  0.1901
