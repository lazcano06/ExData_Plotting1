file <- "household_power_consumption.txt"
AllHousePC <- read.csv2(file, header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
HousePC <-  AllHousePC[AllHousePC$Date %in% c("1/2/2007","2/2/2007") ,]

DT <- paste(HousePC$Date,HousePC$Time)
HousePC$Date = strptime(DT, "%d/%m/%Y %H:%M:%S")
HousePC <- subset(HousePC, select = -Time)

HousePC$Global_active_power = as.numeric(as.character(HousePC$Global_active_powe))
HousePC$Voltage = as.numeric(as.character(HousePC$Voltage))
HousePC$Global_reactive_power = as.numeric(as.character(HousePC$Global_reactive_power))
HousePC$Global_intensity = as.numeric(as.character(HousePC$Global_intensity))
HousePC$Sub_metering_1 = as.numeric(as.character(HousePC$Sub_metering_1))
HousePC$Sub_metering_2 = as.numeric(as.character(HousePC$Sub_metering_2))
HousePC$Sub_metering_3 = as.numeric(as.character(HousePC$Sub_metering_3))


hist(HousePC$Global_active_power, col = "red", xlab = "Global Active Power (killowats)", 
     main = "Global Active Power")

dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
