plot1<- function(){
        ## read household_power_consumption data
        powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        ## change class of column Global_active_power
         
        powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
        
        ## subset data from 2007/02/01 and 2007/02/02
        subsetdata <- subset(powerdata, Date == "2007/02-/01" | Date =="2007-/02-/02")
        
        ## plot histogram of global active power for those 2 days
        png("plot1.png", width=480, height=480)
        hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
        dev.off()
}
