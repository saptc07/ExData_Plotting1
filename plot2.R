plot2 <- function(){
         ## read household_power_consumption data
        powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        ## Create column in table with date and time merged together
        FullTimeDate <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        powerdata <- cbind(powerdata, FullTimeDate)
        
        ## change class of required columns to correct class
        powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
        powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
        powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
         
        ## subset data between 2007/02/01 and 2007/02/02
        subsetdata <- subset(powerdata, Date == "2007/02/01" | Date =="2007/02/02")
        
        ## create png file
        png("plot2.png", width=480, height=480)
         
        ## plot line graph of type("1") for globalactivepower vs date&time
        with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
         
        ## close graphic device
        dev.off()
}
