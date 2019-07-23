 
## Help

* Open project dadR in RStudio

## Check installed packages

```
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip
```

## Installing packages

* Can only install from login node (Internet access)
module load r/3.5.0
module load gcc/5.4.0
* Start R
```
install.packages("devtools")
```

* The generated csv file is named dadr.csv
