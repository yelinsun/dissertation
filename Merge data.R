# Install and load required packages
install.packages("readxl")
install.packages("writexl")
library(readxl)
library(writexl)

# Read data from Excel files
file1_data <- read_xlsx("~/Desktop/Bibliometrix-Export-File-2023-08-30.xlsx")
file2_data <- read_xlsx("~/Desktop/Bibliometrix-Export-File-2023-08-30 (1).xlsx")

str(file1_data)
str(file2_data)

merged_data <- merge(file1_data, file2_data, by = "TI", all = TRUE)

non_duplicated_data <- merged_data[!duplicated(merged_data$TI), ]

write_xlsx(non_duplicated_data, "~/Desktop/merged_py_data.xlsx")
